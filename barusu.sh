#!/bin/sh

#
# OS 
#
echo 'Delete mail log'
rm -f ~/Library/Containers/com.apple.mail/Data/Library/Logs/Mail/*.txt
echo 'done'
echo '--------------------------------------------------------------------------------'

# 
# other commands
#
if type brew > /dev/null 2>&1; then
    echo 'Found: homebrew'
    # brew cleanup -s
    rm -rf $(brew --cache) 
    echo 'homebrew cache is cleaned'
    echo '--------------------------------------------------------------------------------'
fi

if type docker > /dev/null 2>&1; then
    echo 'Found: docker'
    if docker ps -a > /dev/null 2>&1; then
        # rm -rf  ~/Library/Containers/com.docker.docker/Data/*
        docker ps -aq | xargs docker rm
        docker images -aq | xargs docker rmi
        echo 'docker image and container are deleted'
    else
        echo 'Please run docker and then run it.'
    fi
    echo '--------------------------------------------------------------------------------'
fi

if type yarn > /dev/null 2>&1; then
    echo 'Found: yarn'
    yarn cache clean
    echo 'yarn cache is cleaned'
    echo '--------------------------------------------------------------------------------'
fi


if type gem > /dev/null 2>&1; then
    echo 'Found: gem'
    gem clean
    echo 'gem is cleaned'
    echo '--------------------------------------------------------------------------------'
fi

if type pip > /dev/null 2>&1; then
    echo 'Found: pip'
    rm -rf ~/Library/Caches/pip/*
    echo 'pip cache is cleaned'
    echo '--------------------------------------------------------------------------------'
fi

