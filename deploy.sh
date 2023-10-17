
#!/usr/bin/env sh
#确保脚本抛出遇到的错误
set -e

push_addr=`git remote get-url --push origin`
commit_info=`git describe --all --always --long`
dist_path=docs/.vuepress/dist
push_banch=gh-pages

npm run doc:build

cd $dist_path

git init
git add -A
git commit -m "deploy,$commit_info"

cd -
rm -rf $dist_path