Return-Path: <prvs=184014d2e=alistair.francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id CEEA97F46F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2019 22:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1571180345; x=1602716345;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=MaEoBIZD+KsPq6u+5PofK2WE+u987rnFweM/9P3Qyhg=;
	b=j1Wf4TPykqbA4FTw8EK3rJLdZJ3I99ztptB4/inYB/ETMUQ6uY/FjsLX
	CrgOmpDIuoD52Q7PEcuZXlBv/zU6ZhCpZMcndb620JViORwPq50jS4aY8
	I1L+cEPMku28Ccy4qDl0vNoCHeGXyIQuc5qykNDEhNyGD2zUzxIGug9Qk
	JxT3r0tF0Erjy7VohHlP0jNOBhxJGffx0+3qBS0esSpjr8ACizOq80VHr
	H3U3/vX2kNs2unFnji1F/gaZgCP333nyeikCZ7bOV8ybnydmociQrXMh7
	z82XT7ArvsTgJY5BuyFk9xKTyKXNVB7r2xzPUHh2VCINW8o4mj+H3D7Sp w==;
IronPort-SDR: t00Z67joKYBl77lYcG2BJh6HjCiP7zWkZDCAv0hGO6A76vMCrdWHPtF+whx7qXjmnYw6fqBssr
	F9igzLPHSHNLHXE+917akgr5AJQeWdlImBxgtt6iRr9ANvHPyLZhWKnZlDNyZrysmqtsp8x488
	FvAi3ijK6ZK1502P2Suf/IAWXBXSxNsoAGIWYmKjcA4z9idwbCzFVhUTVfsWOPtwSxGO0YtrGg
	fwfFoU//PGM4v6HEhpaPhooLG9NmmFECFpJQ+qn/wKSAHm4/G/yKIqVBax4Q9QB8f+Z+lYUL8i
	fcc=
X-IronPort-AV: E=Sophos;i="5.67,301,1566835200"; d="scan'208";a="122194675"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 16 Oct 2019 06:59:04 +0800
IronPort-SDR: iU1YHgQZ7HPbiIGWd6BiNVyZHDL0mqB32OcsPolp1MYuoS680YrhC+z0GMg2dFvj0aCHqiRS0C
	cVNXoyeBB2nnsB2ouNyjqCDE2KA6fe+wzwEgdkivxDCAZWt4S2Ajp1hOFf+C0K8tERziTmjQ55
	vvhXZ31vmjYmGBM98Qq82ERF9jCiZdZ9drQig26eVp8RvDA+NxYbXwHuxqcsNcJUskQjjcSN8n
	RkPCBNGTi5zZ/gh1QmqTtgd4U2XD5Uc01RecXHSZqurrBGG3C2DUitAiuxAVHJAzTGFV8XKDlZ
	MvUDGbavTonbcqXuAIAwZNqX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Oct 2019 15:54:52 -0700
IronPort-SDR: Gr7ShW8OjqMuNzWZdFTbntSkMQiGc+NVYfqEc1TU4U/wNWkCHdeixURTI7NP7AsHEC0W5C2cmI
	v71nH8/E/6nrEqwjATtKqedfwus/WgvLVmlPQNMGKNJ1m+YozPxBaliWxCO+XxsDxAfI1mHE7w
	AW+LG35w3r5iYTJV2cHAcp9Ag413QzVMZvVaRU8ZJd7fSBG/8C+7lCgUDzYvMmsQ3GnY/U6og8
	m1RDvFlX88WmV9bRzFLD5V7No8jwziZLd6CyHTRR4z1lYlRnBDBHuCJ/8i/KYJ6L0l7mDsVHoh
	7/M=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Oct 2019 15:59:04 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 15 Oct 2019 15:54:21 -0700
Message-Id: <20191015225422.18179-6-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015225422.18179-1-alistair.francis@wdc.com>
References: <20191015225422.18179-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 6/7] mycroft: Bump to 19.8.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Oct 2019 22:59:03 -0000
Content-Transfer-Encoding: 8bit

Bump the Mycroft version and at the same time remove the requirement to
install Python packages using pip on the target. Installing packages on
the target doesn't always work depending on the features of the
rootfs. We now install a lot more of the Python pip packages in OE as
well.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../files/0001-Remove-python-venv.patch       |  48 ++++----
 ...v_setup.sh-Remove-the-git-dependency.patch |  48 ++++++++
 ...irements-Remove-ones-installed-by-OE.patch |  62 -----------
 ..._setup.sh-Remove-the-TERM-dependency.patch |  36 ++++++
 ...v_setup.sh-Remove-the-git-dependency.patch |  48 --------
 ...-Don-t-install-requirements-with-pip.patch | 103 ++++++++++++++++++
 ...-and-pip3-instead-of-python-and-pip.patch} |  90 +++++++--------
 ....sh-Remove-the-test-setup-dependency.patch |  31 ------
 .../{mycroft_19.2.3.bb => mycroft_19.8.1.bb}  |  34 ++++--
 9 files changed, 272 insertions(+), 228 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0002-pip-requirements-Remove-ones-installed-by-OE.patch
 create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-Remove-the-git-dependency.patch
 create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0004-pip-requirements-Don-t-install-requirements-with-pip.patch
 rename meta-multimedia/recipes-multimedia/mycroft/files/{0003-Use-python3-and-pip3-instead-of-python-and-pip.patch => 0005-Use-python3-and-pip3-instead-of-python-and-pip.patch} (53%)
 delete mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0005-dev_setup.sh-Remove-the-test-setup-dependency.patch
 rename meta-multimedia/recipes-multimedia/mycroft/{mycroft_19.2.3.bb => mycroft_19.8.1.bb} (65%)

diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python-venv.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python-venv.patch
index c03bccd3d..43994e0ca 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python-venv.patch
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python-venv.patch
@@ -1,4 +1,4 @@
-From 6272f36080bd440a5825b526f4c06223c5bb9fbb Mon Sep 17 00:00:00 2001
+From 07fce2101d83b5334de78e661ba0361c2874ebdf Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Mon, 18 Mar 2019 16:30:45 -0700
 Subject: [PATCH 1/5] Remove python venv
@@ -9,75 +9,77 @@ python and pip pacakges.
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 Upstream-Status: Inappropriate [embedded specific]
 ---
- dev_setup.sh     | 36 ------------------------------------
+ dev_setup.sh     | 39 ---------------------------------------
  start-mycroft.sh | 13 -------------
  venv-activate.sh | 44 +-------------------------------------------
- 3 files changed, 1 insertion(+), 92 deletions(-)
+ 3 files changed, 1 insertion(+), 95 deletions(-)
 
 diff --git a/dev_setup.sh b/dev_setup.sh
-index e0b07bf25cf..aed54b2167a 100755
+index cf81ed25f0f..99a44bfd8a7 100755
 --- a/dev_setup.sh
 +++ b/dev_setup.sh
-@@ -310,18 +310,6 @@ function install_deps() {
+@@ -338,18 +338,6 @@ ${YELLOW}Make sure to manually install:$BLUE git python3 python-setuptools pytho
      fi
  }
  
 -VIRTUALENV_ROOT=${VIRTUALENV_ROOT:-"${TOP}/.venv"}
 -
 -function install_venv() {
--    ${opt_python} -m venv "${VIRTUALENV_ROOT}/" --without-pip
+-    $opt_python -m venv "${VIRTUALENV_ROOT}/" --without-pip
 -    # Force version of pip for reproducability, but there is nothing special
 -    # about this version.  Update whenever a new version is released and
 -    # verified functional.
 -    curl https://bootstrap.pypa.io/3.3/get-pip.py | "${VIRTUALENV_ROOT}/bin/python" - 'pip==18.0.0'
 -    # Function status depending on if pip exists
--    [ -x "${VIRTUALENV_ROOT}/bin/pip" ]
+-    [[ -x ${VIRTUALENV_ROOT}/bin/pip ]]
 -}
 -
  install_deps
  
  # Configure to use the standard commit template for
-@@ -355,15 +343,7 @@ else
+@@ -383,17 +371,6 @@ else
      fi
  fi
  
--if [ ! -x "${VIRTUALENV_ROOT}/bin/activate" ] ; then
+-if [[ ! -x ${VIRTUALENV_ROOT}/bin/activate ]] ; then
 -    if ! install_venv ; then
--        echo "Failed to set up virtualenv for mycroft, exiting setup."
+-        echo 'Failed to set up virtualenv for mycroft, exiting setup.'
 -        exit 1
 -    fi
 -fi
 -
- # Start the virtual environment
+-# Start the virtual environment
 -source "${VIRTUALENV_ROOT}/bin/activate"
- cd "${TOP}"
- 
+-cd "$TOP"
+-
  # Install pep8 pre-commit hook
-@@ -380,22 +360,6 @@ fi
+ HOOK_FILE='./.git/hooks/pre-commit'
+ if [[ -n $INSTALL_PRECOMMIT_HOOK ]] || grep -q 'MYCROFT DEV SETUP' $HOOK_FILE; then
+@@ -408,22 +385,6 @@ fi
  
- PYTHON=$( python -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))" )
+ PYTHON=$(python -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))")
  
 -# Add mycroft-core to the virtualenv path
 -# (This is equivalent to typing 'add2virtualenv $TOP', except
 -# you can't invoke that shell function from inside a script)
 -VENV_PATH_FILE="${VIRTUALENV_ROOT}/lib/$PYTHON/site-packages/_virtualenv_path_extensions.pth"
--if [ ! -f "$VENV_PATH_FILE" ] ; then
--    echo "import sys; sys.__plen = len(sys.path)" > "$VENV_PATH_FILE" || return 1
+-if [[ ! -f $VENV_PATH_FILE ]] ; then
+-    echo 'import sys; sys.__plen = len(sys.path)' > "$VENV_PATH_FILE" || return 1
 -    echo "import sys; new=sys.path[sys.__plen:]; del sys.path[sys.__plen:]; p=getattr(sys,'__egginsert',0); sys.path[p:p]=new; sys.__egginsert = p+len(new)" >> "$VENV_PATH_FILE" || return 1
 -fi
 -
 -if ! grep -q "$TOP" $VENV_PATH_FILE ; then
--    echo "Adding mycroft-core to virtualenv path"
+-    echo 'Adding mycroft-core to virtualenv path'
 -    sed -i.tmp '1 a\
 -'"$TOP"'
--' "${VENV_PATH_FILE}"
+-' "$VENV_PATH_FILE"
 -fi
 -
  # install required python modules
  if ! pip install -r requirements.txt ; then
-     echo "Warning: Failed to install all requirements. Continue? y/N"
+     echo 'Warning: Failed to install all requirements. Continue? y/N'
 diff --git a/start-mycroft.sh b/start-mycroft.sh
-index b9514a61ba5..64e0216a62f 100755
+index 0f88430982e..3aed2f189d4 100755
 --- a/start-mycroft.sh
 +++ b/start-mycroft.sh
 @@ -20,7 +20,6 @@ script=${0}
@@ -130,7 +132,7 @@ index b9514a61ba5..64e0216a62f 100755
      "sdkdoc")
 -        source-venv
          cd doc
-         make ${opt}
+         make ${_params}
          cd ..
 diff --git a/venv-activate.sh b/venv-activate.sh
 index d1e7bcb44e7..10b46d4de3b 100644
@@ -188,5 +190,5 @@ index d1e7bcb44e7..10b46d4de3b 100644
  
  main $@
 -- 
-2.21.0
+2.23.0
 
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch
new file mode 100644
index 000000000..dd2431fdf
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch
@@ -0,0 +1,48 @@
+From 88696037af52d6a7f57bc0fb82598de1a25365cc Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Fri, 29 Mar 2019 16:09:57 -0700
+Subject: [PATCH 2/5] dev_setup.sh: Remove the git dependency
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [embedded specific]
+---
+ dev_setup.sh | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/dev_setup.sh b/dev_setup.sh
+index 99a44bfd8a7..672b27080c2 100755
+--- a/dev_setup.sh
++++ b/dev_setup.sh
+@@ -340,10 +340,6 @@ ${YELLOW}Make sure to manually install:$BLUE git python3 python-setuptools pytho
+ 
+ install_deps
+ 
+-# Configure to use the standard commit template for
+-# this repo only.
+-git config commit.template .gitmessage
+-
+ # Check whether to build mimic (it takes a really long time!)
+ build_mimic='n'
+ if [[ $opt_forcemimicbuild == true ]] ; then
+@@ -371,18 +367,6 @@ else
+     fi
+ fi
+ 
+-# Install pep8 pre-commit hook
+-HOOK_FILE='./.git/hooks/pre-commit'
+-if [[ -n $INSTALL_PRECOMMIT_HOOK ]] || grep -q 'MYCROFT DEV SETUP' $HOOK_FILE; then
+-    if [[ ! -f $HOOK_FILE ]] || grep -q 'MYCROFT DEV SETUP' $HOOK_FILE; then
+-        echo 'Installing PEP8 check as precommit-hook'
+-        echo "#! $(which python)" > $HOOK_FILE
+-        echo '# MYCROFT DEV SETUP' >> $HOOK_FILE
+-        cat ./scripts/pre-commit >> $HOOK_FILE
+-        chmod +x $HOOK_FILE
+-    fi
+-fi
+-
+ PYTHON=$(python -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))")
+ 
+ # install required python modules
+-- 
+2.23.0
+
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0002-pip-requirements-Remove-ones-installed-by-OE.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0002-pip-requirements-Remove-ones-installed-by-OE.patch
deleted file mode 100644
index ca79d00b4..000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0002-pip-requirements-Remove-ones-installed-by-OE.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 142bc3912ea9e1a4ecf4db0e2bec3049aa416464 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 19 Mar 2019 13:32:54 -0700
-Subject: [PATCH 2/5] pip requirements: Remove ones installed by OE
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- requirements.txt      | 14 --------------
- test-requirements.txt |  1 -
- 2 files changed, 15 deletions(-)
-
-diff --git a/requirements.txt b/requirements.txt
-index 7e4faf48182..29536e990ac 100644
---- a/requirements.txt
-+++ b/requirements.txt
-@@ -1,20 +1,10 @@
--six==1.10.0
--requests==2.20.0
- gTTS==2.0.3
- gTTS-token==1.1.3
--PyAudio==0.2.11
- pyee==5.0.0
- SpeechRecognition==3.8.1
--tornado==4.5.3
- websocket-client==0.54.0
- requests-futures==0.9.5
--pyalsaaudio==0.8.2
- xmlrunner==1.7.7
--pyserial==3.0
--psutil==5.2.1
--pocketsphinx==0.1.0
--inflection==0.3.1
--pillow==4.1.1
- python-dateutil==2.6.0
- pychromecast==0.7.7
- python-vlc==1.1.2
-@@ -26,10 +16,6 @@ msm==0.7.3
- msk==0.3.12
- adapt-parser==0.3.2
- padatious==0.4.6
--fann2==1.0.7
- padaos==0.1.9
- precise-runner==0.2.1
- petact==0.1.2
--
--# dev setup tools
--pep8==1.7.0
-diff --git a/test-requirements.txt b/test-requirements.txt
-index 8ada8157c95..eb4e364a9b4 100644
---- a/test-requirements.txt
-+++ b/test-requirements.txt
-@@ -1,6 +1,5 @@
- pep8==1.7.0
- coveralls==1.5.0
--pytest==3.5.0
- pytest-cov==2.5.1
- cov-core==1.15.0
- mock==2.0.0
--- 
-2.21.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch
new file mode 100644
index 000000000..a4290d1cd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch
@@ -0,0 +1,36 @@
+From 5ef52cdea278a1dff966a912549cb6708f2cb699 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Tue, 17 Sep 2019 11:31:47 -0700
+Subject: [PATCH 3/5] dev_setup.sh: Remove the TERM dependency
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+---
+ dev_setup.sh | 12 ------------
+ 1 file changed, 12 deletions(-)
+
+diff --git a/dev_setup.sh b/dev_setup.sh
+index 672b27080c2..72f734f36bf 100755
+--- a/dev_setup.sh
++++ b/dev_setup.sh
+@@ -115,18 +115,6 @@ function get_YN() {
+     done
+ }
+ 
+-# If tput is available and can handle multiple colors
+-if found_exe tput ; then
+-    if [[ $(tput colors) != "-1" ]]; then
+-        GREEN=$(tput setaf 2)
+-        BLUE=$(tput setaf 4)
+-        CYAN=$(tput setaf 6)
+-        YELLOW=$(tput setaf 3)
+-        RESET=$(tput sgr0)
+-        HIGHLIGHT=$YELLOW
+-    fi
+-fi
+-
+ # Run a setup wizard the very first time that guides the user through some decisions
+ if [[ ! -f .dev_opts.json && -z $CI ]] ; then
+     echo "
+-- 
+2.23.0
+
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-Remove-the-git-dependency.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-Remove-the-git-dependency.patch
deleted file mode 100644
index b7ca16013..000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-Remove-the-git-dependency.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From a480dde949f820fda6e46c13261883e851f5a430 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Fri, 29 Mar 2019 16:09:57 -0700
-Subject: [PATCH 4/5] dev_setup.sh: Remove the git dependency
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
----
- dev_setup.sh | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/dev_setup.sh b/dev_setup.sh
-index dd391181f19..c6aa783e1ef 100755
---- a/dev_setup.sh
-+++ b/dev_setup.sh
-@@ -312,10 +312,6 @@ function install_deps() {
- 
- install_deps
- 
--# Configure to use the standard commit template for
--# this repo only.
--git config commit.template .gitmessage
--
- # Check whether to build mimic (it takes a really long time!)
- build_mimic="n"
- if [[ ${opt_forcemimicbuild} == true ]] ; then
-@@ -346,18 +342,6 @@ fi
- # Start the virtual environment
- cd "${TOP}"
- 
--# Install pep8 pre-commit hook
--if [ -z ${INSTALL_PRECOMMIT_HOOK} ] ; then
--    HOOK_FILE="./.git/hooks/pre-commit"
--    if [ ! -f ${HOOK_FILE} ] || grep -q "MYCROFT DEV SETUP" ${HOOK_FILE} ; then
--        echo "Installing PEP8 check as precommit-hook"
--        echo "#! $( which python3 )" > ${HOOK_FILE}
--        echo "# MYCROFT DEV SETUP" >> ${HOOK_FILE}
--        cat ./scripts/pre-commit >> ${HOOK_FILE}
--        chmod +x ${HOOK_FILE}
--    fi
--fi
--
- PYTHON=$( python3 -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))" )
- 
- # install required python modules
--- 
-2.21.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0004-pip-requirements-Don-t-install-requirements-with-pip.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0004-pip-requirements-Don-t-install-requirements-with-pip.patch
new file mode 100644
index 000000000..3063e7f8d
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0004-pip-requirements-Don-t-install-requirements-with-pip.patch
@@ -0,0 +1,103 @@
+From ac749f2512e8d121e8a64a8d5e6f226f16735dda Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Tue, 19 Mar 2019 13:32:54 -0700
+Subject: [PATCH 4/5] pip requirements: Don't install requirements with pip
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [embedded specific]
+---
+ dev_setup.sh          | 15 +--------------
+ requirements.txt      | 36 ------------------------------------
+ test-requirements.txt |  7 -------
+ 3 files changed, 1 insertion(+), 57 deletions(-)
+ delete mode 100644 requirements.txt
+ delete mode 100644 test-requirements.txt
+
+diff --git a/dev_setup.sh b/dev_setup.sh
+index 72f734f36bf..b5ca6851631 100755
+--- a/dev_setup.sh
++++ b/dev_setup.sh
+@@ -357,19 +357,6 @@ fi
+ 
+ PYTHON=$(python -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))")
+ 
+-# install required python modules
+-if ! pip install -r requirements.txt ; then
+-    echo 'Warning: Failed to install all requirements. Continue? y/N'
+-    read -n1 continue
+-    if [[ $continue != 'y' ]] ; then
+-        exit 1
+-    fi
+-fi
+-
+-if ! pip install -r test-requirements.txt ; then
+-    echo "Warning test requirements wasn't installed, Note: normal operation should still work fine..."
+-fi
+-
+ SYSMEM=$(free | awk '/^Mem:/ { print $2 }')
+ MAXCORES=$(($SYSMEM / 512000))
+ MINCORES=1
+@@ -426,4 +413,4 @@ if [[ ! -w /var/log/mycroft/ ]] ; then
+ fi
+ 
+ #Store a fingerprint of setup
+-md5sum requirements.txt test-requirements.txt dev_setup.sh > .installed
++md5sum dev_setup.sh > .installed
+diff --git a/requirements.txt b/requirements.txt
+deleted file mode 100644
+index 0140d5465dc..00000000000
+--- a/requirements.txt
++++ /dev/null
+@@ -1,36 +0,0 @@
+-six==1.10.0
+-cryptography==2.6.1
+-requests==2.20.0
+-gTTS==2.0.3
+-gTTS-token==1.1.3
+-PyAudio==0.2.11
+-pyee==5.0.0
+-SpeechRecognition==3.8.1
+-tornado==4.5.3
+-websocket-client==0.54.0
+-requests-futures==0.9.5
+-pyalsaaudio==0.8.2
+-xmlrunner==1.7.7
+-pyserial==3.0
+-psutil==5.2.1
+-pocketsphinx==0.1.0
+-inflection==0.3.1
+-pillow==4.1.1
+-python-dateutil==2.6.0
+-pychromecast==3.2.2
+-python-vlc==1.1.2
+-google-api-python-client==1.6.4
+-fasteners==0.14.1
+-PyYAML==3.13
+-
+-msm==0.8.3
+-msk==0.3.13
+-adapt-parser==0.3.3
+-padatious==0.4.6
+-fann2==1.0.7
+-padaos==0.1.9
+-precise-runner==0.2.1
+-petact==0.1.2
+-
+-# dev setup tools
+-pep8==1.7.0
+diff --git a/test-requirements.txt b/test-requirements.txt
+deleted file mode 100644
+index fd129e3f66d..00000000000
+--- a/test-requirements.txt
++++ /dev/null
+@@ -1,7 +0,0 @@
+-pycodestyle===2.5.0
+-coveralls==1.5.0
+-pytest==3.5.0
+-pytest-cov==2.5.1
+-cov-core==1.15.0
+-sphinx==1.8.2
+-sphinx-rtd-theme==0.4.2
+-- 
+2.23.0
+
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0003-Use-python3-and-pip3-instead-of-python-and-pip.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0005-Use-python3-and-pip3-instead-of-python-and-pip.patch
similarity index 53%
rename from meta-multimedia/recipes-multimedia/mycroft/files/0003-Use-python3-and-pip3-instead-of-python-and-pip.patch
rename to meta-multimedia/recipes-multimedia/mycroft/files/0005-Use-python3-and-pip3-instead-of-python-and-pip.patch
index a1f04b4b4..189b686c9 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0003-Use-python3-and-pip3-instead-of-python-and-pip.patch
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0005-Use-python3-and-pip3-instead-of-python-and-pip.patch
@@ -1,19 +1,19 @@
-From 87b94e54fefa1f83b41030444fc87b421c97b2c5 Mon Sep 17 00:00:00 2001
+From 9a0bd09706da3949db17ea7272d6647a487bb6ad Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Tue, 19 Mar 2019 13:38:44 -0700
-Subject: [PATCH 3/5] Use python3 and pip3 instead of python and pip
+Subject: [PATCH 5/5] Use python3 and pip3 instead of python and pip
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 Upstream-Status: Inappropriate [embedded specific]
 ---
- bin/mycroft-cli-client          |  2 +-
- bin/mycroft-pip                 |  2 +-
- bin/mycroft-say-to              |  2 +-
- bin/mycroft-skill-testrunner    |  4 ++--
- bin/mycroft-speak               |  2 +-
- dev_setup.sh                    | 10 +++++-----
- scripts/install-pocketsphinx.sh |  2 +-
- 7 files changed, 12 insertions(+), 12 deletions(-)
+ bin/mycroft-cli-client          | 2 +-
+ bin/mycroft-pip                 | 2 +-
+ bin/mycroft-say-to              | 2 +-
+ bin/mycroft-skill-testrunner    | 4 ++--
+ bin/mycroft-speak               | 2 +-
+ dev_setup.sh                    | 6 +++---
+ scripts/install-pocketsphinx.sh | 2 +-
+ 7 files changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/bin/mycroft-cli-client b/bin/mycroft-cli-client
 index f40a316e3f6..de2040d9e67 100755
@@ -38,15 +38,15 @@ index a42b16b847a..81bd5bfb3cf 100755
 +pip3 $@
 \ No newline at end of file
 diff --git a/bin/mycroft-say-to b/bin/mycroft-say-to
-index 964e16eb0c5..5575969715c 100755
+index 4ae597f3062..8bb4039996d 100755
 --- a/bin/mycroft-say-to
 +++ b/bin/mycroft-say-to
-@@ -22,4 +22,4 @@ DIR="$( pwd )"
- source "$DIR/../venv-activate.sh" -q
+@@ -26,4 +26,4 @@ set -- "${1:-$(</dev/stdin)}" "${@:2}"
  
  # Send a message to be spoken
--output=$(python -m mycroft.messagebus.send "recognizer_loop:utterance"  "{\"utterances\": [\"$@\"], \"lang\": \"en-us\"}")
-+output=$(python3 -m mycroft.messagebus.send "recognizer_loop:utterance"  "{\"utterances\": [\"$@\"], \"lang\": \"en-us\"}")
+ data="$@"
+-output=$(python -m mycroft.messagebus.send "recognizer_loop:utterance"  "{\"utterances\": [\"$data\"], \"lang\": \"en-us\"}")
++output=$(python3 -m mycroft.messagebus.send "recognizer_loop:utterance"  "{\"utterances\": [\"$data\"], \"lang\": \"en-us\"}")
 diff --git a/bin/mycroft-skill-testrunner b/bin/mycroft-skill-testrunner
 index 9699a4d138f..282f5ca65b0 100755
 --- a/bin/mycroft-skill-testrunner
@@ -63,60 +63,46 @@ index 9699a4d138f..282f5ca65b0 100755
  fi
 \ No newline at end of file
 diff --git a/bin/mycroft-speak b/bin/mycroft-speak
-index 51facf29189..c65556f1173 100755
+index d80f0e75b13..9448ea3400f 100755
 --- a/bin/mycroft-speak
 +++ b/bin/mycroft-speak
-@@ -22,4 +22,4 @@ DIR="$( pwd )"
- source "$DIR/../venv-activate.sh" -q
+@@ -24,4 +24,4 @@ source "$DIR/../venv-activate.sh" -q
  
  # Send a message to be spoken
--output=$(python -m mycroft.messagebus.send "speak"  "{\"utterance\": \"$@\"}")
-\ No newline at end of file
-+output=$(python3 -m mycroft.messagebus.send "speak"  "{\"utterance\": \"$@\"}")
-\ No newline at end of file
+ data="$@"
+-output=$(python -m mycroft.messagebus.send "speak"  "{\"utterance\": \"$data\"}")
++output=$(python3 -m mycroft.messagebus.send "speak"  "{\"utterance\": \"$data\"}")
 diff --git a/dev_setup.sh b/dev_setup.sh
-index aed54b2167a..dd391181f19 100755
+index b5ca6851631..fcd0834669f 100755
 --- a/dev_setup.sh
 +++ b/dev_setup.sh
-@@ -48,7 +48,7 @@ param=""
+@@ -48,7 +48,7 @@ param=''
  
  for var in "$@" ; do
      # Check if parameter should be read
--    if [[ ${param} == "python" ]] ; then
-+    if [[ ${param} == "python3" ]] ; then
-         opt_python=${var}
+-    if [[ $param == 'python' ]] ; then
++    if [[ $param == 'python3' ]] ; then
+         opt_python=$var
          param=""
          continue
-@@ -351,17 +351,17 @@ if [ -z ${INSTALL_PRECOMMIT_HOOK} ] ; then
-     HOOK_FILE="./.git/hooks/pre-commit"
-     if [ ! -f ${HOOK_FILE} ] || grep -q "MYCROFT DEV SETUP" ${HOOK_FILE} ; then
-         echo "Installing PEP8 check as precommit-hook"
--        echo "#! $( which python )" > ${HOOK_FILE}
-+        echo "#! $( which python3 )" > ${HOOK_FILE}
-         echo "# MYCROFT DEV SETUP" >> ${HOOK_FILE}
-         cat ./scripts/pre-commit >> ${HOOK_FILE}
-         chmod +x ${HOOK_FILE}
+@@ -75,7 +75,7 @@ for var in "$@" ; do
+         opt_skipmimicbuild=true
      fi
- fi
- 
--PYTHON=$( python -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))" )
-+PYTHON=$( python3 -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))" )
+     if [[ $var == '-p' || $var == '--python' ]] ; then
+-        param='python'
++        param='python3'
+     fi
+ done
  
- # install required python modules
--if ! pip install -r requirements.txt ; then
-+if ! pip3 install -r requirements.txt ; then
-     echo "Warning: Failed to install all requirements. Continue? y/N"
-     read -n1 continue
-     if [[ "$continue" != "y" ]] ; then
-@@ -369,7 +369,7 @@ if ! pip install -r requirements.txt ; then
+@@ -355,7 +355,7 @@ else
      fi
  fi
  
--if ! pip install -r test-requirements.txt ; then
-+if ! pip3 install -r test-requirements.txt ; then
-     echo "Warning test requirements wasn't installed, Note: normal operation should still work fine..."
- fi
+-PYTHON=$(python -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))")
++PYTHON=$(python3 -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))")
  
+ SYSMEM=$(free | awk '/^Mem:/ { print $2 }')
+ MAXCORES=$(($SYSMEM / 512000))
 diff --git a/scripts/install-pocketsphinx.sh b/scripts/install-pocketsphinx.sh
 index 44d329b7985..d45f5c22747 100755
 --- a/scripts/install-pocketsphinx.sh
@@ -131,5 +117,5 @@ index 44d329b7985..d45f5c22747 100755
  
  if [ "$1" = "-q" ] ; then
 -- 
-2.21.0
+2.23.0
 
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0005-dev_setup.sh-Remove-the-test-setup-dependency.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0005-dev_setup.sh-Remove-the-test-setup-dependency.patch
deleted file mode 100644
index 5ae868376..000000000
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0005-dev_setup.sh-Remove-the-test-setup-dependency.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 7fc38ae0dec30789fa0d365f1764f4950b700a98 Mon Sep 17 00:00:00 2001
-From: Alistair Francis <alistair.francis@wdc.com>
-Date: Tue, 2 Apr 2019 16:52:44 -0700
-Subject: [PATCH 5/5] dev_setup.sh: Remove the test setup dependency
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
----
- dev_setup.sh | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/dev_setup.sh b/dev_setup.sh
-index c6aa783e1ef..bcfaa0c16c2 100755
---- a/dev_setup.sh
-+++ b/dev_setup.sh
-@@ -353,10 +353,6 @@ if ! pip3 install -r requirements.txt ; then
-     fi
- fi
- 
--if ! pip3 install -r test-requirements.txt ; then
--    echo "Warning test requirements wasn't installed, Note: normal operation should still work fine..."
--fi
--
- SYSMEM=$( free | awk '/^Mem:/ { print $2 }' )
- MAXCORES=$(($SYSMEM / 512000))
- MINCORES=1
--- 
-2.21.0
-
diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
similarity index 65%
rename from meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb
rename to meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index b03a90083..54c06f5b6 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.2.3.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -6,13 +6,13 @@ SECTION = "multimedia"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=79aa497b11564d1d419ee889e7b498f6"
 
-SRCREV = "4b45db34ecd95b62ef2b66a8e5180c66ca791a21"
+SRCREV = "913f29d3d550637934f9abf43a097eb2c30d76fc"
 SRC_URI = "git://github.com/MycroftAI/mycroft-core.git;branch=master \
            file://0001-Remove-python-venv.patch \
-           file://0002-pip-requirements-Remove-ones-installed-by-OE.patch \
-           file://0003-Use-python3-and-pip3-instead-of-python-and-pip.patch \
-           file://0004-dev_setup.sh-Remove-the-git-dependency.patch \
-           file://0005-dev_setup.sh-Remove-the-test-setup-dependency.patch \
+           file://0002-dev_setup.sh-Remove-the-git-dependency.patch \
+           file://0003-dev_setup.sh-Remove-the-TERM-dependency.patch \
+           file://0004-pip-requirements-Don-t-install-requirements-with-pip.patch \
+           file://0005-Use-python3-and-pip3-instead-of-python-and-pip.patch \
            file://dev_opts.json \
            file://mycroft-setup.service \
            file://mycroft.service \
@@ -49,20 +49,30 @@ FILES_${PN} += "${libdir}/mycroft"
 
 RDEPENDS_${PN} = "python3"
 
-# Install as many Python packages as we can.
-# We don't yet have all the packages in meta-python.
-# Install as many as we can and we will install the rest on the target with pip.
-# TODO: Add all the remaining packages and remove pip
-RDEPENDS_${PN} += "python3-pip \
-                   python3-requests python3-pillow \
+RDEPENDS_${PN} += "python3-requests python3-pillow \
                    python3-tornado python3-pyyaml \
                    python3-pyalsaaudio python3-inflection \
                    python3-pyserial python3-psutil \
                    python3-pyaudio python3-fann2 \
                    python3-pocketsphinx \
-                   python3-xxhash \
+                   python3-xxhash python3-pako \
+                   python3-six python3-cryptography \
+                   python3-requests-futures \
+                   python3-xmlrunner python3-fasteners \
+                   python3-python-vlc \
+                   python3-padatious python3-padaos \
+                   python3-petact python3-precise-runner \
+                   python3-pulsectl python3-pychromecast \
+                   python3-msm python3-msk \
+                   python3-websocket-client \
+                   python3-google-api-python-client \
                  "
 
+# These packages need to be installed on the target
+# python3-speechrecognition python3-pyee==5.0.0 python3-six==1.10.0
+# python3-websocket-client==0.54.0 python3-gtts python3-gtts-token
+# python3-python-dateutil python3-adapt-parser python3-lazy
+
 # Mycroft uses Alsa, PulseAudio and Flac
 RDEPENDS_${PN} += "alsa-utils alsa-plugins alsa-tools"
 RDEPENDS_${PN} += "pulseaudio pulseaudio-misc pulseaudio-server"
-- 
2.23.0


