Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F258FC982D7
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:37:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42956.1789659453605741440
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:37:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=TZg1h2QB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EE991476
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:29 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 935073F7B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789659453; bh=br0L1pvJJN+cEL8aG5hNe3uIIiBAt1/TAaJrNePHXD0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TZg1h2QBY0sVaWPxYEQWI4HieswztDOZDkebZxpRLsxQPFHaAEXjhEGdRZgKCp/7a
	 cbs6wikAPYHzf2jP+RDqPY0PV47wiERmG6SLya6O7anAdu7WBDQ5LhsJZ+hfep50uU
	 C+1GUDZ6aY+UOlyk8N6qLrzcOTY8RefRog/vaLm8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 3/8] mycroft: remove obsolete recipe
Date: Thu, 17 Sep 2026 16:37:20 +0100
Message-ID: <20260917153727.3057505-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260917153727.3057505-1-ross.burton@arm.com>
References: <20260917153727.3057505-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Sep 2026 15:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130100

Mycroft made its last release in 2021 and was formally abandoned in 2024:

  Mycroft core is no longer maintaiend and probably likely not work on
  your computer anymore. Open Voice OS and Neon-core are both spiritual
  successors to Mycroft. (And some of the old code may live on there.)

The version we packaged was from 2019 and nobody cared enought to upgrade
it to any of the sixteen later releases, so I don't believe anyone is
using it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../files/0001-Remove-python-venv.patch       | 194 ------------------
 ...v_setup.sh-Remove-the-git-dependency.patch |  48 -----
 ..._setup.sh-Remove-the-TERM-dependency.patch |  37 ----
 ...up.sh-Ignore-missing-package-manager.patch |  31 ---
 ...-Don-t-install-requirements-with-pip.patch | 103 ----------
 ...3-and-pip3-instead-of-python-and-pip.patch | 121 -----------
 ...oft.conf-Use-pocketsphinx-by-default.patch |  30 ---
 .../mycroft/files/dev_opts.json               |   1 -
 .../mycroft/files/mycroft-setup.service       |  12 --
 .../mycroft/files/mycroft.service             |  14 --
 .../mycroft/mycroft_19.8.1.bb                 |  94 ---------
 .../packagegroup-meta-multimedia.bb           |   1 -
 12 files changed, 686 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0001=
-Remove-python-venv.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0002=
-dev_setup.sh-Remove-the-git-dependency.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0003=
-dev_setup.sh-Remove-the-TERM-dependency.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0004=
-dev_setup.sh-Ignore-missing-package-manager.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0005=
-pip-requirements-Don-t-install-requirements-with-pip.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0006=
-Use-python3-and-pip3-instead-of-python-and-pip.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0007=
-mycroft.conf-Use-pocketsphinx-by-default.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/dev_=
opts.json
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/mycr=
oft-setup.service
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/mycr=
oft.service
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/mycroft_19=
.8.1.bb

diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove=
-python-venv.patch b/meta-multimedia/recipes-multimedia/mycroft/files/000=
1-Remove-python-venv.patch
deleted file mode 100644
index 245785c8269..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python=
-venv.patch
+++ /dev/null
@@ -1,194 +0,0 @@
-From 07fce2101d83b5334de78e661ba0361c2874ebdf Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Mon, 18 Mar 2019 16:30:45 -0700
-Subject: [PATCH 1/7] Remove python venv
-
-Remove the python venv requirements and instead just use the native
-python and pip pacakges.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- dev_setup.sh     | 39 ---------------------------------------
- start-mycroft.sh | 13 -------------
- venv-activate.sh | 44 +-------------------------------------------
- 3 files changed, 1 insertion(+), 95 deletions(-)
-
-diff --git a/dev_setup.sh b/dev_setup.sh
-index cf81ed25f0f..99a44bfd8a7 100755
---- a/dev_setup.sh
-+++ b/dev_setup.sh
-@@ -338,18 +338,6 @@ ${YELLOW}Make sure to manually install:$BLUE git py=
thon3 python-setuptools pytho
-     fi
- }
-=20
--VIRTUALENV_ROOT=3D${VIRTUALENV_ROOT:-"${TOP}/.venv"}
--
--function install_venv() {
--    $opt_python -m venv "${VIRTUALENV_ROOT}/" --without-pip
--    # Force version of pip for reproducability, but there is nothing sp=
ecial
--    # about this version.  Update whenever a new version is released an=
d
--    # verified functional.
--    curl https://bootstrap.pypa.io/3.3/get-pip.py | "${VIRTUALENV_ROOT}=
/bin/python" - 'pip=3D=3D18.0.0'
--    # Function status depending on if pip exists
--    [[ -x ${VIRTUALENV_ROOT}/bin/pip ]]
--}
--
- install_deps
-=20
- # Configure to use the standard commit template for
-@@ -383,17 +371,6 @@ else
-     fi
- fi
-=20
--if [[ ! -x ${VIRTUALENV_ROOT}/bin/activate ]] ; then
--    if ! install_venv ; then
--        echo 'Failed to set up virtualenv for mycroft, exiting setup.'
--        exit 1
--    fi
--fi
--
--# Start the virtual environment
--source "${VIRTUALENV_ROOT}/bin/activate"
--cd "$TOP"
--
- # Install pep8 pre-commit hook
- HOOK_FILE=3D'./.git/hooks/pre-commit'
- if [[ -n $INSTALL_PRECOMMIT_HOOK ]] || grep -q 'MYCROFT DEV SETUP' $HOO=
K_FILE; then
-@@ -408,22 +385,6 @@ fi
-=20
- PYTHON=3D$(python -c "import sys;print('python{}.{}'.format(sys.version=
_info[0], sys.version_info[1]))")
-=20
--# Add mycroft-core to the virtualenv path
--# (This is equivalent to typing 'add2virtualenv $TOP', except
--# you can't invoke that shell function from inside a script)
--VENV_PATH_FILE=3D"${VIRTUALENV_ROOT}/lib/$PYTHON/site-packages/_virtual=
env_path_extensions.pth"
--if [[ ! -f $VENV_PATH_FILE ]] ; then
--    echo 'import sys; sys.__plen =3D len(sys.path)' > "$VENV_PATH_FILE"=
 || return 1
--    echo "import sys; new=3Dsys.path[sys.__plen:]; del sys.path[sys.__p=
len:]; p=3Dgetattr(sys,'__egginsert',0); sys.path[p:p]=3Dnew; sys.__eggin=
sert =3D p+len(new)" >> "$VENV_PATH_FILE" || return 1
--fi
--
--if ! grep -q "$TOP" $VENV_PATH_FILE ; then
--    echo 'Adding mycroft-core to virtualenv path'
--    sed -i.tmp '1 a\
--'"$TOP"'
--' "$VENV_PATH_FILE"
--fi
--
- # install required python modules
- if ! pip install -r requirements.txt ; then
-     echo 'Warning: Failed to install all requirements. Continue? y/N'
-diff --git a/start-mycroft.sh b/start-mycroft.sh
-index 0f88430982e..3aed2f189d4 100755
---- a/start-mycroft.sh
-+++ b/start-mycroft.sh
-@@ -20,7 +20,6 @@ script=3D${0}
- script=3D${script##*/}
- cd -P "$( dirname "$SOURCE" )"
- DIR=3D"$( pwd )"
--VIRTUALENV_ROOT=3D${VIRTUALENV_ROOT:-"${DIR}/.venv"}
-=20
- function help() {
-     echo "${script}:  Mycroft command/service launcher"
-@@ -76,19 +75,11 @@ function name-to-script-path() {
-     esac
- }
-=20
--function source-venv() {
--    # Enter Python virtual environment, unless under Docker
--    if [ ! -f "/.dockerenv" ] ; then
--        source ${VIRTUALENV_ROOT}/bin/activate
--    fi
--}
--
- first_time=3Dtrue
- function init-once() {
-     if ($first_time) ; then
-         echo "Initializing..."
-         "${DIR}/scripts/prepare-msm.sh"
--        source-venv
-         first_time=3Dfalse
-     fi
- }
-@@ -225,15 +216,12 @@ case ${_opt} in
-     #    launch-background ${_opt}
-     #    ;;
-     "unittest")
--        source-venv
-         pytest test/unittests/ --cov=3Dmycroft "$@"
-         ;;
-     "singleunittest")
--        source-venv
-         pytest "$@"
-         ;;
-     "skillstest")
--        source-venv
-         pytest test/integrationtests/skills/discover_tests.py "$@"
-         ;;
-     "audiotest")
-@@ -243,7 +231,6 @@ case ${_opt} in
-         launch-process ${_opt}
-         ;;
-     "sdkdoc")
--        source-venv
-         cd doc
-         make ${_params}
-         cd ..
-diff --git a/venv-activate.sh b/venv-activate.sh
-index d1e7bcb44e7..10b46d4de3b 100644
---- a/venv-activate.sh
-+++ b/venv-activate.sh
-@@ -22,49 +22,7 @@
-=20
- # wrap in function to allow local variables, since this file will be so=
urce'd
- function main() {=20
--    local quiet=3D0
--
--    for arg in "$@"
--    do
--        case $arg in
--            "-q"|"--quiet" )
--               quiet=3D1
--               ;;
--
--            "-h"|"--help" )
--               echo "venv-activate.sh:  Enter the Mycroft virtual envir=
onment"
--               echo "Usage:"
--               echo "   source venv-activate.sh"
--               echo "or"
--               echo "   . venv-activate.sh"
--               echo ""
--               echo "Options:"
--               echo "   -q | --quiet    Don't show instructions."
--               echo "   -h | --help    Show help."
--               return 0
--               ;;
--
--            *)
--               echo "ERROR:  Unrecognized option: $@"
--               return 1
--               ;;
--       esac
--    done
--
--    if [ "$0" =3D=3D "$BASH_SOURCE" ] ; then
--        # Prevent running in script then exiting immediately
--        echo "ERROR: Invoke with 'source venv-activate.sh' or '. venv-a=
ctivate.sh'"
--    else
--        local SRC_DIR=3D"$( builtin cd "$( dirname "${BASH_SOURCE}" )" =
; pwd -P )"
--        source ${SRC_DIR}/.venv/bin/activate
--       =20
--        # Provide an easier to find "mycroft-" prefixed command.
--        unalias mycroft-venv-activate 2>/dev/null
--        alias mycroft-venv-deactivate=3D"deactivate && unalias mycroft-=
venv-deactivate 2>/dev/null && alias mycroft-venv-activate=3D\"source '${=
SRC_DIR}/venv-activate.sh'\""
--        if [ $quiet -eq 0 ] ; then
--            echo "Entering Mycroft virtual environment.  Run 'mycroft-v=
env-deactivate' to exit"
--        fi
--    fi
-+   echo "Not entering Python VENV"
- }
-=20
- main $@
---=20
-2.23.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_se=
tup.sh-Remove-the-git-dependency.patch b/meta-multimedia/recipes-multimed=
ia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch
deleted file mode 100644
index 637854fdfcb..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-=
Remove-the-git-dependency.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 88696037af52d6a7f57bc0fb82598de1a25365cc Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 29 Mar 2019 16:09:57 -0700
-Subject: [PATCH 2/7] dev_setup.sh: Remove the git dependency
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- dev_setup.sh | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/dev_setup.sh b/dev_setup.sh
-index 99a44bfd8a7..672b27080c2 100755
---- a/dev_setup.sh
-+++ b/dev_setup.sh
-@@ -340,10 +340,6 @@ ${YELLOW}Make sure to manually install:$BLUE git py=
thon3 python-setuptools pytho
-=20
- install_deps
-=20
--# Configure to use the standard commit template for
--# this repo only.
--git config commit.template .gitmessage
--
- # Check whether to build mimic (it takes a really long time!)
- build_mimic=3D'n'
- if [[ $opt_forcemimicbuild =3D=3D true ]] ; then
-@@ -371,18 +367,6 @@ else
-     fi
- fi
-=20
--# Install pep8 pre-commit hook
--HOOK_FILE=3D'./.git/hooks/pre-commit'
--if [[ -n $INSTALL_PRECOMMIT_HOOK ]] || grep -q 'MYCROFT DEV SETUP' $HOO=
K_FILE; then
--    if [[ ! -f $HOOK_FILE ]] || grep -q 'MYCROFT DEV SETUP' $HOOK_FILE;=
 then
--        echo 'Installing PEP8 check as precommit-hook'
--        echo "#! $(which python)" > $HOOK_FILE
--        echo '# MYCROFT DEV SETUP' >> $HOOK_FILE
--        cat ./scripts/pre-commit >> $HOOK_FILE
--        chmod +x $HOOK_FILE
--    fi
--fi
--
- PYTHON=3D$(python -c "import sys;print('python{}.{}'.format(sys.version=
_info[0], sys.version_info[1]))")
-=20
- # install required python modules
---=20
-2.23.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_se=
tup.sh-Remove-the-TERM-dependency.patch b/meta-multimedia/recipes-multime=
dia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch
deleted file mode 100644
index d803f526def..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-=
Remove-the-TERM-dependency.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5ef52cdea278a1dff966a912549cb6708f2cb699 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 17 Sep 2019 11:31:47 -0700
-Subject: [PATCH 3/7] dev_setup.sh: Remove the TERM dependency
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- dev_setup.sh | 12 ------------
- 1 file changed, 12 deletions(-)
-
-diff --git a/dev_setup.sh b/dev_setup.sh
-index 672b27080c2..72f734f36bf 100755
---- a/dev_setup.sh
-+++ b/dev_setup.sh
-@@ -115,18 +115,6 @@ function get_YN() {
-     done
- }
-=20
--# If tput is available and can handle multiple colors
--if found_exe tput ; then
--    if [[ $(tput colors) !=3D "-1" ]]; then
--        GREEN=3D$(tput setaf 2)
--        BLUE=3D$(tput setaf 4)
--        CYAN=3D$(tput setaf 6)
--        YELLOW=3D$(tput setaf 3)
--        RESET=3D$(tput sgr0)
--        HIGHLIGHT=3D$YELLOW
--    fi
--fi
--
- # Run a setup wizard the very first time that guides the user through s=
ome decisions
- if [[ ! -f .dev_opts.json && -z $CI ]] ; then
-     echo "
---=20
-2.23.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_se=
tup.sh-Ignore-missing-package-manager.patch b/meta-multimedia/recipes-mul=
timedia/mycroft/files/0004-dev_setup.sh-Ignore-missing-package-manager.pa=
tch
deleted file mode 100644
index d2dc179ca60..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-=
Ignore-missing-package-manager.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e3b6ca995caca22e65d012a54bc2aeb08eb7e9d4 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 15 Oct 2019 17:09:06 -0700
-Subject: [PATCH 4/7] dev_setup.sh: Ignore missing package manager
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- dev_setup.sh | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/dev_setup.sh b/dev_setup.sh
-index 72f734f36bf..0c8e11b8170 100755
---- a/dev_setup.sh
-+++ b/dev_setup.sh
-@@ -317,12 +317,6 @@ Please review the following package changes careful=
ly."
-         echo -e "${YELLOW}Could not find package manager
- ${YELLOW}Make sure to manually install:$BLUE git python3 python-setupto=
ols python-venv pygobject libtool libffi libjpg openssl autoconf bison sw=
ig glib2.0 portaudio19 mpg123 flac curl fann g++ jq\n$RESET"
-=20
--        echo 'Warning: Failed to install all dependencies. Continue? y/=
N'
--        read -n1 continue
--        if [[ $continue !=3D 'y' ]] ; then
--            exit 1
--        fi
--
-     fi
- }
-=20
---=20
-2.23.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0005-pip-re=
quirements-Don-t-install-requirements-with-pip.patch b/meta-multimedia/re=
cipes-multimedia/mycroft/files/0005-pip-requirements-Don-t-install-requir=
ements-with-pip.patch
deleted file mode 100644
index 7f63ea13de4..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0005-pip-requireme=
nts-Don-t-install-requirements-with-pip.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 04b14c4569309f1a433d955773aeb8a3607a1360 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 19 Mar 2019 13:32:54 -0700
-Subject: [PATCH 5/7] pip requirements: Don't install requirements with p=
ip
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- dev_setup.sh          | 15 +--------------
- requirements.txt      | 36 ------------------------------------
- test-requirements.txt |  7 -------
- 3 files changed, 1 insertion(+), 57 deletions(-)
- delete mode 100644 requirements.txt
- delete mode 100644 test-requirements.txt
-
-diff --git a/dev_setup.sh b/dev_setup.sh
-index 0c8e11b8170..be4a19de0c3 100755
---- a/dev_setup.sh
-+++ b/dev_setup.sh
-@@ -351,19 +351,6 @@ fi
-=20
- PYTHON=3D$(python -c "import sys;print('python{}.{}'.format(sys.version=
_info[0], sys.version_info[1]))")
-=20
--# install required python modules
--if ! pip install -r requirements.txt ; then
--    echo 'Warning: Failed to install all requirements. Continue? y/N'
--    read -n1 continue
--    if [[ $continue !=3D 'y' ]] ; then
--        exit 1
--    fi
--fi
--
--if ! pip install -r test-requirements.txt ; then
--    echo "Warning test requirements wasn't installed, Note: normal oper=
ation should still work fine..."
--fi
--
- SYSMEM=3D$(free | awk '/^Mem:/ { print $2 }')
- MAXCORES=3D$(($SYSMEM / 512000))
- MINCORES=3D1
-@@ -420,4 +407,4 @@ if [[ ! -w /var/log/mycroft/ ]] ; then
- fi
-=20
- #Store a fingerprint of setup
--md5sum requirements.txt test-requirements.txt dev_setup.sh > .installed
-+md5sum dev_setup.sh > .installed
-diff --git a/requirements.txt b/requirements.txt
-deleted file mode 100644
-index 0140d5465dc..00000000000
---- a/requirements.txt
-+++ /dev/null
-@@ -1,36 +0,0 @@
--six=3D=3D1.10.0
--cryptography=3D=3D2.6.1
--requests=3D=3D2.20.0
--gTTS=3D=3D2.0.3
--gTTS-token=3D=3D1.1.3
--PyAudio=3D=3D0.2.11
--pyee=3D=3D5.0.0
--SpeechRecognition=3D=3D3.8.1
--tornado=3D=3D4.5.3
--websocket-client=3D=3D0.54.0
--requests-futures=3D=3D0.9.5
--pyalsaaudio=3D=3D0.8.2
--xmlrunner=3D=3D1.7.7
--pyserial=3D=3D3.0
--psutil=3D=3D5.2.1
--pocketsphinx=3D=3D0.1.0
--inflection=3D=3D0.3.1
--pillow=3D=3D4.1.1
--python-dateutil=3D=3D2.6.0
--pychromecast=3D=3D3.2.2
--python-vlc=3D=3D1.1.2
--google-api-python-client=3D=3D1.6.4
--fasteners=3D=3D0.14.1
--PyYAML=3D=3D3.13
--
--msm=3D=3D0.8.3
--msk=3D=3D0.3.13
--adapt-parser=3D=3D0.3.3
--padatious=3D=3D0.4.6
--fann2=3D=3D1.0.7
--padaos=3D=3D0.1.9
--precise-runner=3D=3D0.2.1
--petact=3D=3D0.1.2
--
--# dev setup tools
--pep8=3D=3D1.7.0
-diff --git a/test-requirements.txt b/test-requirements.txt
-deleted file mode 100644
-index fd129e3f66d..00000000000
---- a/test-requirements.txt
-+++ /dev/null
-@@ -1,7 +0,0 @@
--pycodestyle=3D=3D=3D2.5.0
--coveralls=3D=3D1.5.0
--pytest=3D=3D3.5.0
--pytest-cov=3D=3D2.5.1
--cov-core=3D=3D1.15.0
--sphinx=3D=3D1.8.2
--sphinx-rtd-theme=3D=3D0.4.2
---=20
-2.23.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0006-Use-py=
thon3-and-pip3-instead-of-python-and-pip.patch b/meta-multimedia/recipes-=
multimedia/mycroft/files/0006-Use-python3-and-pip3-instead-of-python-and-=
pip.patch
deleted file mode 100644
index 6f1f6f78d14..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0006-Use-python3-a=
nd-pip3-instead-of-python-and-pip.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 86a1d18d96f827baa0c1029c85a53fc89d436e17 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 19 Mar 2019 13:38:44 -0700
-Subject: [PATCH 6/7] Use python3 and pip3 instead of python and pip
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- bin/mycroft-cli-client          | 2 +-
- bin/mycroft-pip                 | 2 +-
- bin/mycroft-say-to              | 2 +-
- bin/mycroft-skill-testrunner    | 4 ++--
- bin/mycroft-speak               | 2 +-
- dev_setup.sh                    | 6 +++---
- scripts/install-pocketsphinx.sh | 2 +-
- 7 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/bin/mycroft-cli-client b/bin/mycroft-cli-client
-index f40a316e3f6..de2040d9e67 100755
---- a/bin/mycroft-cli-client
-+++ b/bin/mycroft-cli-client
-@@ -21,4 +21,4 @@ DIR=3D"$( dirname "$SOURCE" )"
- source "$DIR/../venv-activate.sh" -q
-=20
- # Invoke the Command Line Interface
--python -m mycroft.client.text $@
-+python3 -m mycroft.client.text $@
-diff --git a/bin/mycroft-pip b/bin/mycroft-pip
-index a42b16b847a..81bd5bfb3cf 100755
---- a/bin/mycroft-pip
-+++ b/bin/mycroft-pip
-@@ -21,4 +21,4 @@ DIR=3D"$( dirname "$SOURCE" )"
- source "$DIR/../venv-activate.sh" -q
-=20
- # Install pip packages within the Mycroft venv
--pip $@
-\ No newline at end of file
-+pip3 $@
-\ No newline at end of file
-diff --git a/bin/mycroft-say-to b/bin/mycroft-say-to
-index 4ae597f3062..8bb4039996d 100755
---- a/bin/mycroft-say-to
-+++ b/bin/mycroft-say-to
-@@ -26,4 +26,4 @@ set -- "${1:-$(</dev/stdin)}" "${@:2}"
-=20
- # Send a message to be spoken
- data=3D"$@"
--output=3D$(python -m mycroft.messagebus.send "recognizer_loop:utterance=
"  "{\"utterances\": [\"$data\"], \"lang\": \"en-us\"}")
-+output=3D$(python3 -m mycroft.messagebus.send "recognizer_loop:utteranc=
e"  "{\"utterances\": [\"$data\"], \"lang\": \"en-us\"}")
-diff --git a/bin/mycroft-skill-testrunner b/bin/mycroft-skill-testrunner
-index 9699a4d138f..282f5ca65b0 100755
---- a/bin/mycroft-skill-testrunner
-+++ b/bin/mycroft-skill-testrunner
-@@ -22,7 +22,7 @@ source "$DIR/../venv-activate.sh" -q
-=20
- # Invoke the individual skill tester
- if [ "$#" -eq 0 ] ; then
--    python -m test.integrationtests.skills.runner .
-+    python3 -m test.integrationtests.skills.runner .
- else
--    python -m test.integrationtests.skills.runner $@
-+    python3 -m test.integrationtests.skills.runner $@
- fi
-\ No newline at end of file
-diff --git a/bin/mycroft-speak b/bin/mycroft-speak
-index d80f0e75b13..9448ea3400f 100755
---- a/bin/mycroft-speak
-+++ b/bin/mycroft-speak
-@@ -24,4 +24,4 @@ source "$DIR/../venv-activate.sh" -q
-=20
- # Send a message to be spoken
- data=3D"$@"
--output=3D$(python -m mycroft.messagebus.send "speak"  "{\"utterance\": =
\"$data\"}")
-+output=3D$(python3 -m mycroft.messagebus.send "speak"  "{\"utterance\":=
 \"$data\"}")
-diff --git a/dev_setup.sh b/dev_setup.sh
-index be4a19de0c3..2d9e17ddfd6 100755
---- a/dev_setup.sh
-+++ b/dev_setup.sh
-@@ -48,7 +48,7 @@ param=3D''
-=20
- for var in "$@" ; do
-     # Check if parameter should be read
--    if [[ $param =3D=3D 'python' ]] ; then
-+    if [[ $param =3D=3D 'python3' ]] ; then
-         opt_python=3D$var
-         param=3D""
-         continue
-@@ -75,7 +75,7 @@ for var in "$@" ; do
-         opt_skipmimicbuild=3Dtrue
-     fi
-     if [[ $var =3D=3D '-p' || $var =3D=3D '--python' ]] ; then
--        param=3D'python'
-+        param=3D'python3'
-     fi
- done
-=20
-@@ -349,7 +349,7 @@ else
-     fi
- fi
-=20
--PYTHON=3D$(python -c "import sys;print('python{}.{}'.format(sys.version=
_info[0], sys.version_info[1]))")
-+PYTHON=3D$(python3 -c "import sys;print('python{}.{}'.format(sys.versio=
n_info[0], sys.version_info[1]))")
-=20
- SYSMEM=3D$(free | awk '/^Mem:/ { print $2 }')
- MAXCORES=3D$(($SYSMEM / 512000))
-diff --git a/scripts/install-pocketsphinx.sh b/scripts/install-pocketsph=
inx.sh
-index 44d329b7985..d45f5c22747 100755
---- a/scripts/install-pocketsphinx.sh
-+++ b/scripts/install-pocketsphinx.sh
-@@ -47,7 +47,7 @@ function install_pocketsphinx() {
-=20
-     # build and install pocketsphinx python bindings
-     cd ${TOP}/pocketsphinx-python
--    python setup.py install
-+    python3 setup.py install
- }
-=20
- if [ "$1" =3D "-q" ] ; then
---=20
-2.23.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0007-mycrof=
t.conf-Use-pocketsphinx-by-default.patch b/meta-multimedia/recipes-multim=
edia/mycroft/files/0007-mycroft.conf-Use-pocketsphinx-by-default.patch
deleted file mode 100644
index 574bda144e2..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0007-mycroft.conf-=
Use-pocketsphinx-by-default.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b48b3d240cb0fa5e76aa5daf578e51bb8126431d Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Wed, 16 Oct 2019 09:18:39 -0700
-Subject: [PATCH 7/7] mycroft.conf: Use pocketsphinx by default
-
-precise only works on certain architectures, to make Mycroft more
-versitle use pocketsphinx as it is architecture independent.
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- mycroft/configuration/mycroft.conf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mycroft/configuration/mycroft.conf b/mycroft/configuration/=
mycroft.conf
-index 1d0be0dcd2b..d2dc75dac44 100644
---- a/mycroft/configuration/mycroft.conf
-+++ b/mycroft/configuration/mycroft.conf
-@@ -196,7 +196,7 @@
-   // Hotword configurations
-   "hotwords": {
-     "hey mycroft": {
--        "module": "precise",
-+        "module": "pocketsphinx",
-         "phonemes": "HH EY . M AY K R AO F T",
-         "threshold": 1e-90,
-         "lang": "en-us"
---=20
-2.23.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/dev_opts.js=
on b/meta-multimedia/recipes-multimedia/mycroft/files/dev_opts.json
deleted file mode 100644
index 5ed85faf41a..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/dev_opts.json
+++ /dev/null
@@ -1 +0,0 @@
-{"use_branch": "dev", "auto_update": false}
\ No newline at end of file
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft-set=
up.service b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft-set=
up.service
deleted file mode 100644
index 4b4bcdd774c..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft-setup.serv=
ice
+++ /dev/null
@@ -1,12 +0,0 @@
-[Unit]
-Description=3DMycroft Setup
-DefaultDependencies=3Dno
-After=3Dsystemd-user-sessions.service
-
-[Service]
-Type=3Doneshot
-ExecStart=3Dcp -rf @LIBDIR@/mycroft /var/
-ExecStart=3D/var/mycroft/dev_setup.sh --allow-root
-
-[Install]
-WantedBy=3Dmulti-user.target
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.ser=
vice b/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
deleted file mode 100644
index c7f477f1362..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/mycroft.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=3DMycroft
-RequiresMountsFor=3D/var
-After=3Dmycroft-setup.service
-
-[Service]
-Type=3Dforking
-WorkingDirectory=3D/var/mycroft
-ExecStartPre=3Dmkdir -p /var/log/mycroft
-ExecStart=3D/var/mycroft/start-mycroft.sh all
-ExecStop=3D/var/mycroft/stop-mycroft.sh all
-
-[Install]
-WantedBy=3Dmulti-user.target
diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb=
 b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
deleted file mode 100644
index bdc4d7280c9..00000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ /dev/null
@@ -1,94 +0,0 @@
-SUMMARY =3D "Mycroft is a hackable open source voice assistant."
-DESCRIPTION =3D "Mycroft is the world=E2=80=99s first open source assist=
ant. "
-HOMEPAGE =3D "https://mycroft.ai/"
-SECTION =3D "multimedia"
-
-LICENSE =3D "Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D79aa497b11564d1d419ee889e7=
b498f6"
-
-SRCREV =3D "913f29d3d550637934f9abf43a097eb2c30d76fc"
-SRC_URI =3D "git://github.com/MycroftAI/mycroft-core.git;branch=3Dmaster=
;protocol=3Dhttps \
-           file://0001-Remove-python-venv.patch \
-           file://0002-dev_setup.sh-Remove-the-git-dependency.patch \
-           file://0003-dev_setup.sh-Remove-the-TERM-dependency.patch \
-           file://0004-dev_setup.sh-Ignore-missing-package-manager.patch=
 \
-           file://0005-pip-requirements-Don-t-install-requirements-with-=
pip.patch \
-           file://0006-Use-python3-and-pip3-instead-of-python-and-pip.pa=
tch \
-           file://0007-mycroft.conf-Use-pocketsphinx-by-default.patch \
-           file://dev_opts.json \
-           file://mycroft-setup.service \
-           file://mycroft.service \
-          "
-
-
-inherit systemd features_check
-
-# Mycroft installs itself on the host
-# Just copy the setup files to the rootfs
-# The mycroft-setup service will copy the files to /var/ where we run th=
em from
-do_install() {
-    install -d ${D}${libdir}/
-    cp -r ${B} ${D}${libdir}/mycroft
-    rm -r ${D}${libdir}/mycroft/.git
-
-    # Install the dev opts so it doesn't ask us on initial setup.
-    install -m 644 ${UNPACKDIR}/dev_opts.json ${D}${libdir}/mycroft/.dev=
_opts.json
-
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${UNPACKDIR}/mycroft-setup.service ${D}${systemd_=
unitdir}/system
-        sed -i -e 's,@LIBDIR@,${libdir},g' ${D}${systemd_unitdir}/system=
/mycroft-setup.service
-    fi
-
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false=
', d)}; then
-        install -d ${D}${systemd_unitdir}/system
-        install -m 644 ${UNPACKDIR}/mycroft.service ${D}${systemd_unitdi=
r}/system
-        sed -i -e 's,@LIBDIR@,${libdir},g' ${D}${systemd_unitdir}/system=
/mycroft.service
-    fi
-}
-
-FILES:${PN} +=3D "${libdir}/mycroft"
-
-RDEPENDS:${PN} =3D "python3"
-
-RDEPENDS:${PN} +=3D "python3-requests python3-pillow \
-                   python3-tornado python3-pyyaml \
-                   python3-pyalsaaudio python3-inflection \
-                   python3-pyserial python3-psutil \
-                   python3-pyaudio python3-fann2 \
-                   python3-pocketsphinx \
-                   python3-xxhash python3-pako \
-                   python3-six python3-cryptography \
-                   python3-requests-futures \
-                   python3-fasteners \
-                   python3-python-vlc \
-                   python3-padatious python3-padaos \
-                   python3-petact python3-precise-runner \
-                   python3-pulsectl python3-pychromecast \
-                   python3-msm python3-msk \
-                   python3-websocket-client \
-                   python3-google-api-python-client \
-                 "
-
-# These packages need to be installed on the target
-# python3-speechrecognition python3-pyee=3D=3D5.0.0 python3-six=3D=3D1.1=
0.0
-# python3-websocket-client=3D=3D0.54.0 python3-gtts python3-gtts-token
-# python3-python-dateutil python3-adapt-parser python3-lazy
-
-# Mycroft uses Alsa, PulseAudio and Flac
-RDEPENDS:${PN} +=3D "alsa-utils alsa-plugins alsa-tools"
-RDEPENDS:${PN} +=3D "pulseaudio pulseaudio-misc pulseaudio-server"
-RDEPENDS:${PN} +=3D "flac mpg123"
-
-# Mycroft can do this itself on the target, but it's quicker to do it he=
re
-RDEPENDS:${PN} +=3D "mimic"
-
-# pgrep is used by stop-mycroft.sh
-RDEPENDS:${PN} +=3D "procps"
-
-# More tools needed by scripts
-RDEPENDS:${PN} +=3D "bash jq libnotify"
-
-SYSTEMD_SERVICE:${PN} =3D "mycroft-setup.service mycroft.service"
-
-REQUIRED_DISTRO_FEATURES +=3D "pulseaudio"
diff --git a/meta-multimedia/recipes-multimedia/packagegroups/packagegrou=
p-meta-multimedia.bb b/meta-multimedia/recipes-multimedia/packagegroups/p=
ackagegroup-meta-multimedia.bb
index 4da9de3ff94..692c45e1eaa 100644
--- a/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
+++ b/meta-multimedia/recipes-multimedia/packagegroups/packagegroup-meta-=
multimedia.bb
@@ -47,7 +47,6 @@ RDEPENDS:packagegroup-meta-multimedia =3D "\
     libopenmpt \
     mimic \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "minidl=
na", "", d)} \
-    ${@bb.utils.contains("DISTRO_FEATURES", "pulseaudio", "mycroft", "",=
 d)} \
     openal-soft \
     opusfile \
     opus-tools \
--=20
2.43.0


