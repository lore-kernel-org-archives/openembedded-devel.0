Return-Path: <prvs=194c68654=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 164B37E265
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 21:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1572040340; x=1603576340;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=PjGQhHBuucgIZ+Q5k+swNzaR28HWz4HzEvQ5s0OAtLs=;
	b=IeDXD1u7YceMSwpCjYOuwooRFqUKG3JpkQRs812TNPvetTAkL1mEDXIa
	Eq++KSJc25mOU1FU9pPEHythn8l8OyzkXCgrnajrFk2nD5qnHPJOpdrJ2
	o+bdR5iwsdyeHCQU4Lp5uJWRZ0YUQvpz9tlZ+6BJ5vk1THEn/i2CRgxaQ
	us8N2qeXTWLZpl0UUZVNYDKxDlaRmR+MjvVQBSGn7baikjnvzm+viy1U7
	lDbLBekPKLx4nLKeAEv6n/Z4jnZFYTGKwsyre7Y5LsqiCCAHsGZ7VdQpf
	yeM3eI2rVUCOUVUqIHx0Fl/kOj6ygZen8/inTmQo2Da1N35xOYcRZednb Q==;
IronPort-SDR: X16WL9iRY8Gie+bdk3SPX06wAyZ/Jaq99vtzkGA5KFvoKL+XgoZa5nAPCZUl/Z1LbW29Pl3jJb
	0N0/wm7eRUnfnc18YfZ2iM8tisgxlqoH7ZyghbNHGUY+a9TOfv84Td3FgU6n/Nbir2YzhbDTwG
	BJ/keV6gFCEB2jq3g+jeD/rwUcMBHiMZn5zCBFbrJUXBnwqkDMyLlbGs27sMYfJRgH34l5Pruy
	u0xGczCA5nkVW0/FZpon6c78hCtBTzPcWmtP1eROP4Twsbu0RYOWIq9sJ+veq3oIer+q544c1N
	P8E=
X-IronPort-AV: E=Sophos;i="5.68,230,1569254400"; d="scan'208";a="228516383"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2019 05:52:20 +0800
IronPort-SDR: mUvAMZtRbaXKVq60NOlLt94w6yOuG/5EDb0O0BkEqPYd6zGrQQnlWcCdP30zk07epCh+m46CPc
	q4jfK4aQSRnIAYP55TB6bp0uUO8OkenEze6TbPbvix6piST6SBoXYN6aYdeCenouc7UdyUNxUg
	Zo1LyEB6aIrWvXbTlS1GWAwhMHN9JSnaubaJ8vj1F9iQE3iN5GHE/iShoZcaQAT8Rm+q8DcvJY
	SrxfkImlg3EApjCvG5wnriFKBxUF8zWno5SZn4pToT52iOhT1GAOPhG3RksmCj43YGpCMg6QzV
	c+Sw/6qk4wjA7oquJKBdN5AQ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	25 Oct 2019 14:47:46 -0700
IronPort-SDR: G3adRF06kWEa0gBVfVm3hHzWxV5tK/CMMgFlKeLIyDaHCRkruTZTKoK+4jfRHsdBxXzqkGuuTN
	FRYKil9qwhGzKY1N8lPg8PPM2zoVwnvMP+sieN1IW/B/1gnFXAPHxjdHKTNKaSZhnsujqrQNcL
	x3lTMy+sXfMeKXjhpFl5fC7tiyPpZFo37izSX0VuW3eEr1k2LQ0J1ad2RN8CikqXDaia3JpOsr
	2sohOW3/Lwz8dVZpxS9+F5dew/XZyn4mdKQ3pAaGB7+lGgymgA4NvplYp4ex8Z49Y55rc2fC3x
	XGE=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.58])
	by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2019 14:52:20 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Oct 2019 14:47:21 -0700
Message-Id: <20191025214721.4681-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] mycroft: Fixup remaining issues
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
X-List-Received-Date: Fri, 25 Oct 2019 21:52:19 -0000
Content-Transfer-Encoding: 8bit

This patch combines a few fixups:
 - Don't bother users about missing package manager
 - Use pocketsphinx by default (as it works on RISC-V)
 - Add Upstream-Status to all patches

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 .../files/0001-Remove-python-venv.patch       |  2 +-
 ...v_setup.sh-Remove-the-git-dependency.patch |  2 +-
 ..._setup.sh-Remove-the-TERM-dependency.patch |  3 +-
 ...up.sh-Ignore-missing-package-manager.patch | 31 +++++++++++++++++++
 ...Don-t-install-requirements-with-pip.patch} | 10 +++---
 ...-and-pip3-instead-of-python-and-pip.patch} |  8 ++---
 ...oft.conf-Use-pocketsphinx-by-default.patch | 30 ++++++++++++++++++
 .../mycroft/mycroft_19.8.1.bb                 |  6 ++--
 8 files changed, 78 insertions(+), 14 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-Ignore-missing-package-manager.patch
 rename meta-multimedia/recipes-multimedia/mycroft/files/{0004-pip-requirements-Don-t-install-requirements-with-pip.patch => 0005-pip-requirements-Don-t-install-requirements-with-pip.patch} (90%)
 rename meta-multimedia/recipes-multimedia/mycroft/files/{0005-Use-python3-and-pip3-instead-of-python-and-pip.patch => 0006-Use-python3-and-pip3-instead-of-python-and-pip.patch} (95%)
 create mode 100644 meta-multimedia/recipes-multimedia/mycroft/files/0007-mycroft.conf-Use-pocketsphinx-by-default.patch

diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python-venv.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python-venv.patch
index 43994e0ca..245785c82 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python-venv.patch
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0001-Remove-python-venv.patch
@@ -1,7 +1,7 @@
 From 07fce2101d83b5334de78e661ba0361c2874ebdf Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Mon, 18 Mar 2019 16:30:45 -0700
-Subject: [PATCH 1/5] Remove python venv
+Subject: [PATCH 1/7] Remove python venv
 
 Remove the python venv requirements and instead just use the native
 python and pip pacakges.
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch
index dd2431fdf..637854fdf 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0002-dev_setup.sh-Remove-the-git-dependency.patch
@@ -1,7 +1,7 @@
 From 88696037af52d6a7f57bc0fb82598de1a25365cc Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Fri, 29 Mar 2019 16:09:57 -0700
-Subject: [PATCH 2/5] dev_setup.sh: Remove the git dependency
+Subject: [PATCH 2/7] dev_setup.sh: Remove the git dependency
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 Upstream-Status: Inappropriate [embedded specific]
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch
index a4290d1cd..d803f526d 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0003-dev_setup.sh-Remove-the-TERM-dependency.patch
@@ -1,9 +1,10 @@
 From 5ef52cdea278a1dff966a912549cb6708f2cb699 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Tue, 17 Sep 2019 11:31:47 -0700
-Subject: [PATCH 3/5] dev_setup.sh: Remove the TERM dependency
+Subject: [PATCH 3/7] dev_setup.sh: Remove the TERM dependency
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [embedded specific]
 ---
  dev_setup.sh | 12 ------------
  1 file changed, 12 deletions(-)
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-Ignore-missing-package-manager.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-Ignore-missing-package-manager.patch
new file mode 100644
index 000000000..d2dc179ca
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0004-dev_setup.sh-Ignore-missing-package-manager.patch
@@ -0,0 +1,31 @@
+From e3b6ca995caca22e65d012a54bc2aeb08eb7e9d4 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Tue, 15 Oct 2019 17:09:06 -0700
+Subject: [PATCH 4/7] dev_setup.sh: Ignore missing package manager
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [embedded specific]
+---
+ dev_setup.sh | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/dev_setup.sh b/dev_setup.sh
+index 72f734f36bf..0c8e11b8170 100755
+--- a/dev_setup.sh
++++ b/dev_setup.sh
+@@ -317,12 +317,6 @@ Please review the following package changes carefully."
+         echo -e "${YELLOW}Could not find package manager
+ ${YELLOW}Make sure to manually install:$BLUE git python3 python-setuptools python-venv pygobject libtool libffi libjpg openssl autoconf bison swig glib2.0 portaudio19 mpg123 flac curl fann g++ jq\n$RESET"
+ 
+-        echo 'Warning: Failed to install all dependencies. Continue? y/N'
+-        read -n1 continue
+-        if [[ $continue != 'y' ]] ; then
+-            exit 1
+-        fi
+-
+     fi
+ }
+ 
+-- 
+2.23.0
+
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0004-pip-requirements-Don-t-install-requirements-with-pip.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0005-pip-requirements-Don-t-install-requirements-with-pip.patch
similarity index 90%
rename from meta-multimedia/recipes-multimedia/mycroft/files/0004-pip-requirements-Don-t-install-requirements-with-pip.patch
rename to meta-multimedia/recipes-multimedia/mycroft/files/0005-pip-requirements-Don-t-install-requirements-with-pip.patch
index 3063e7f8d..7f63ea13d 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0004-pip-requirements-Don-t-install-requirements-with-pip.patch
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0005-pip-requirements-Don-t-install-requirements-with-pip.patch
@@ -1,7 +1,7 @@
-From ac749f2512e8d121e8a64a8d5e6f226f16735dda Mon Sep 17 00:00:00 2001
+From 04b14c4569309f1a433d955773aeb8a3607a1360 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Tue, 19 Mar 2019 13:32:54 -0700
-Subject: [PATCH 4/5] pip requirements: Don't install requirements with pip
+Subject: [PATCH 5/7] pip requirements: Don't install requirements with pip
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 Upstream-Status: Inappropriate [embedded specific]
@@ -14,10 +14,10 @@ Upstream-Status: Inappropriate [embedded specific]
  delete mode 100644 test-requirements.txt
 
 diff --git a/dev_setup.sh b/dev_setup.sh
-index 72f734f36bf..b5ca6851631 100755
+index 0c8e11b8170..be4a19de0c3 100755
 --- a/dev_setup.sh
 +++ b/dev_setup.sh
-@@ -357,19 +357,6 @@ fi
+@@ -351,19 +351,6 @@ fi
  
  PYTHON=$(python -c "import sys;print('python{}.{}'.format(sys.version_info[0], sys.version_info[1]))")
  
@@ -37,7 +37,7 @@ index 72f734f36bf..b5ca6851631 100755
  SYSMEM=$(free | awk '/^Mem:/ { print $2 }')
  MAXCORES=$(($SYSMEM / 512000))
  MINCORES=1
-@@ -426,4 +413,4 @@ if [[ ! -w /var/log/mycroft/ ]] ; then
+@@ -420,4 +407,4 @@ if [[ ! -w /var/log/mycroft/ ]] ; then
  fi
  
  #Store a fingerprint of setup
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0005-Use-python3-and-pip3-instead-of-python-and-pip.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0006-Use-python3-and-pip3-instead-of-python-and-pip.patch
similarity index 95%
rename from meta-multimedia/recipes-multimedia/mycroft/files/0005-Use-python3-and-pip3-instead-of-python-and-pip.patch
rename to meta-multimedia/recipes-multimedia/mycroft/files/0006-Use-python3-and-pip3-instead-of-python-and-pip.patch
index 189b686c9..6f1f6f78d 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/files/0005-Use-python3-and-pip3-instead-of-python-and-pip.patch
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0006-Use-python3-and-pip3-instead-of-python-and-pip.patch
@@ -1,7 +1,7 @@
-From 9a0bd09706da3949db17ea7272d6647a487bb6ad Mon Sep 17 00:00:00 2001
+From 86a1d18d96f827baa0c1029c85a53fc89d436e17 Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@wdc.com>
 Date: Tue, 19 Mar 2019 13:38:44 -0700
-Subject: [PATCH 5/5] Use python3 and pip3 instead of python and pip
+Subject: [PATCH 6/7] Use python3 and pip3 instead of python and pip
 
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 Upstream-Status: Inappropriate [embedded specific]
@@ -73,7 +73,7 @@ index d80f0e75b13..9448ea3400f 100755
 -output=$(python -m mycroft.messagebus.send "speak"  "{\"utterance\": \"$data\"}")
 +output=$(python3 -m mycroft.messagebus.send "speak"  "{\"utterance\": \"$data\"}")
 diff --git a/dev_setup.sh b/dev_setup.sh
-index b5ca6851631..fcd0834669f 100755
+index be4a19de0c3..2d9e17ddfd6 100755
 --- a/dev_setup.sh
 +++ b/dev_setup.sh
 @@ -48,7 +48,7 @@ param=''
@@ -94,7 +94,7 @@ index b5ca6851631..fcd0834669f 100755
      fi
  done
  
-@@ -355,7 +355,7 @@ else
+@@ -349,7 +349,7 @@ else
      fi
  fi
  
diff --git a/meta-multimedia/recipes-multimedia/mycroft/files/0007-mycroft.conf-Use-pocketsphinx-by-default.patch b/meta-multimedia/recipes-multimedia/mycroft/files/0007-mycroft.conf-Use-pocketsphinx-by-default.patch
new file mode 100644
index 000000000..574bda144
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/mycroft/files/0007-mycroft.conf-Use-pocketsphinx-by-default.patch
@@ -0,0 +1,30 @@
+From b48b3d240cb0fa5e76aa5daf578e51bb8126431d Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@wdc.com>
+Date: Wed, 16 Oct 2019 09:18:39 -0700
+Subject: [PATCH 7/7] mycroft.conf: Use pocketsphinx by default
+
+precise only works on certain architectures, to make Mycroft more
+versitle use pocketsphinx as it is architecture independent.
+
+Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
+Upstream-Status: Inappropriate [embedded specific]
+---
+ mycroft/configuration/mycroft.conf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mycroft/configuration/mycroft.conf b/mycroft/configuration/mycroft.conf
+index 1d0be0dcd2b..d2dc75dac44 100644
+--- a/mycroft/configuration/mycroft.conf
++++ b/mycroft/configuration/mycroft.conf
+@@ -196,7 +196,7 @@
+   // Hotword configurations
+   "hotwords": {
+     "hey mycroft": {
+-        "module": "precise",
++        "module": "pocketsphinx",
+         "phonemes": "HH EY . M AY K R AO F T",
+         "threshold": 1e-90,
+         "lang": "en-us"
+-- 
+2.23.0
+
diff --git a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
index d4ac4096b..3c7bd8963 100644
--- a/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
+++ b/meta-multimedia/recipes-multimedia/mycroft/mycroft_19.8.1.bb
@@ -11,8 +11,10 @@ SRC_URI = "git://github.com/MycroftAI/mycroft-core.git;branch=master \
            file://0001-Remove-python-venv.patch \
            file://0002-dev_setup.sh-Remove-the-git-dependency.patch \
            file://0003-dev_setup.sh-Remove-the-TERM-dependency.patch \
-           file://0004-pip-requirements-Don-t-install-requirements-with-pip.patch \
-           file://0005-Use-python3-and-pip3-instead-of-python-and-pip.patch \
+           file://0004-dev_setup.sh-Ignore-missing-package-manager.patch \
+           file://0005-pip-requirements-Don-t-install-requirements-with-pip.patch \
+           file://0006-Use-python3-and-pip3-instead-of-python-and-pip.patch \
+           file://0007-mycroft.conf-Use-pocketsphinx-by-default.patch \
            file://dev_opts.json \
            file://mycroft-setup.service \
            file://mycroft.service \
-- 
2.23.0


