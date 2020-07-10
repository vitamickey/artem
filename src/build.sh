# appending lecture files to main.tex
dir="../lectures"
rm main.tex
echo '\\documentclass[12pt]{report}\n\\input{preamble.tex}\n\\begin{document}' >> main.tex
echo '\\maketitle\n\\tableofcontents\n\\newpage' >> main.tex

rm sorted_lecs
ls $dir | grep '[0-9]' | sort -n >> sorted_lecs
while read l; do
  echo "\\input{$dir/$l}" >> main.tex
done<sorted_lecs
rm sorted_lecs
echo '\\end{document}' >> main.tex
pdflatex -halt-on-error -shell-escape main.tex

mv main.pdf ../1071.pdf


