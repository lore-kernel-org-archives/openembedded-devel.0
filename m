Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id CE0FD6FC30
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jun 2014 09:56:48 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id fp1so5881661pdb.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jun 2014 02:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=fDvFR2q2xoyrVyF60hN19BPtRmKjl/R7J0dVw1UgBeM=;
	b=SBKtqT5pYSCNJxMSdWSRx+G/8B2YB2qKwks4fRN8oxwhd/NedqRnIb395aYoNqUDxN
	48oPW0E5+9z37/pKL7TG2Jn61PnQwbt6otrEjEye0gaxXgmRhUW2sQMHJ7NDHziazjO1
	/T8Iv2cuubids53MOPE/U56WbXX78uOuIUhx4u1Owfkwd8jlSrmT2mglaJbY97Evgkyg
	jWU7R8dtjyUY87lpY4CbO4t+7ZEOKXPgeL7YX0fKrn0UzWmrvq2WPEYaEmwz1UkzKJZB
	jjeBm/Mnj68vyZy0i+8cXsQ6XLJKnFR2OIK/L3HYF2h7FI52cQEpI91yfsB/WtSThF74
	eq6Q==
X-Received: by 10.68.136.226 with SMTP id qd2mr61616155pbb.72.1401875809226;
	Wed, 04 Jun 2014 02:56:49 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	qv3sm7889559pbb.87.2014.06.04.02.56.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Jun 2014 02:56:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Jun 2014 11:56:53 +0200
Message-Id: <1401875817-30867-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 1/5] recipes-git: Upgrade from latest origin/release to latest origin/stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Jun 2014 09:56:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* there wont be 5.2.2 release, so start preparation for 5.3.0
* probably latest 5.3.0-beta1 snapshot was released yesterday, so this
  should be reasonably close
* probably wont be merged before creating new release branch for Yocto 1.6
* qtbase: Fix build with X.h included from egl.h
* nativesdk-qt*: Add git recipes
  5.2.1 isn't compatible with qtbase-native from git
* qtbase: upgrade to latest stable revision
  * 0006-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
    was upstreamed in:
    0c3301f configure: make pulseaudio and alsa configurable options
  * 0005-qt_module-Fix-pkgconfig-replacement.patch
    is hopefully resolved in:
    eaefbe3 snuff -L/-I with system paths when installing meta files
    a33afed de-duplicate setup of libdir replacement in prl files
    aa20e7f reshuffle code for clarity
    ee86ce8 don't attempt to replace include paths in meta files
    but this needs to be double checked
* recipes-git: Upgrade to latest origin/stable
* qt5-git.inc: update LICENSE.LGPL checksum
  * only year was updated:
    - The Qt Toolkit is Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
    + The Qt Toolkit is Copyright (C) 2014 Digia Plc and/or its subsidiary(-ies).
* qtbase: add 2 patches to fix build issues
* LIC_FILES_CHKSUM: update other git recipes
* qtlocation: bump SRCREV and add to qt5-versions
* qt5-versions.inc: Add line for qttools and fix it for nativesdk-qttools
* qtquick1: fix LIC_FILES_CHKSUM
* qttools: update LIC_FILES_CHKSUM and patches
  * new qtdiag needs to be disabled as well because it depends on gui which isn't enabled
    in qtbase-native, disable qtpaths as well

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/qt5-versions.inc               |   4 +
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  32 ++
 recipes-qt/qt5/nativesdk-qttools_git.bb            |  13 +
 recipes-qt/qt5/qt3d_git.bb                         |   9 +-
 recipes-qt/qt5/qt5-git.inc                         |   4 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  | 344 +++++++++++++++++++++
 .../qtbase-git/0001-Fix-missing-plugin_types.patch |  30 ++
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |  56 ++++
 .../0002-Add-external-hostbindir-option.patch      | 303 ++++++++++++++++++
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  39 +++
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  30 ++
 ...-build-it-in-configure-but-allow-to-build.patch |  50 +++
 ...gl-error-for-platforms-only-supporting-on.patch |  72 +++++
 ...mintegration-Undefine-CursorShape-from-X..patch |  30 ++
 .../qt5/qtbase-git/0008-Always-build-uic.patch     |  31 ++
 ...reserve-built-qmake-and-swap-with-native-.patch |  30 ++
 ...ump-path-length-from-256-to-512-character.patch |  29 ++
 recipes-qt/qt5/qtbase-native_git.bb                |  23 +-
 recipes-qt/qt5/qtbase_git.bb                       |  25 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   4 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  10 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  10 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  10 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  10 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  10 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  10 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  10 +-
 recipes-qt/qt5/qtscript_git.bb                     |  10 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  10 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   4 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  10 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch | 155 ++++++++++
 ...t-help-fix-linking-of-dependent-libraries.patch |  32 ++
 recipes-qt/qt5/qttools-native_git.bb               |  10 +-
 recipes-qt/qt5/qttools_git.bb                      |  10 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |   6 +
 recipes-qt/qt5/qtwayland_git.bb                    |   6 +
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   4 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |   4 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |   4 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  10 +-
 41 files changed, 1433 insertions(+), 70 deletions(-)
 create mode 100644 recipes-qt/qt5/nativesdk-qtbase_git.bb
 create mode 100644 recipes-qt/qt5/nativesdk-qttools_git.bb
 create mode 100644 recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0001-Fix-missing-plugin_types.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0008-Always-build-uic.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0009-configure-preserve-built-qmake-and-swap-with-native-.patch
 create mode 100644 recipes-qt/qt5/qtbase-git/0010-configure-bump-path-length-from-256-to-512-character.patch
 create mode 100644 recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
 create mode 100644 recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index b684a6b..a2cc1fc 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -5,11 +5,13 @@ QT5_VERSION ?= "5.2.1"
 
 PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
+PREFERRED_VERSION_nativesdk-qtbase = "${QT5_VERSION}"
 PREFERRED_VERSION_qtdeclarative = "${QT5_VERSION}"
 PREFERRED_VERSION_qtjsbackend = "${QT5_VERSION}"
 PREFERRED_VERSION_qtjsbackend-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtgraphicaleffects = "${QT5_VERSION}"
 PREFERRED_VERSION_qtimageformats = "${QT5_VERSION}"
+PREFERRED_VERSION_qtlocation = "${QT5_VERSION}"
 PREFERRED_VERSION_qtmultimedia = "${QT5_VERSION}"
 PREFERRED_VERSION_qtquick1 = "${QT5_VERSION}"
 PREFERRED_VERSION_qtquickcontrols = "${QT5_VERSION}"
@@ -17,7 +19,9 @@ PREFERRED_VERSION_qtsensors = "${QT5_VERSION}"
 PREFERRED_VERSION_qtserialport = "${QT5_VERSION}"
 PREFERRED_VERSION_qtscript = "${QT5_VERSION}"
 PREFERRED_VERSION_qtsvg = "${QT5_VERSION}"
+PREFERRED_VERSION_qttools = "${QT5_VERSION}"
 PREFERRED_VERSION_qttools-native = "${QT5_VERSION}"
+PREFERRED_VERSION_nativesdk-qttools = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebkit = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebkit-examples = "${QT5_VERSION}"
 PREFERRED_VERSION_qtxmlpatterns = "${QT5_VERSION}"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
new file mode 100644
index 0000000..cac16a0
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -0,0 +1,32 @@
+require qt5-git.inc
+require ${PN}.inc
+
+# prepend this again, because ${PN}.inc prepneds ${PN}
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
+
+SRC_URI = "\
+    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+"
+
+# common with -native
+SRC_URI += "\
+    file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-Add-external-hostbindir-option.patch \
+    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
+    file://0001-Fix-missing-plugin_types.patch \
+    file://0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+"
+
+# common with native version
+SRC_URI += " \
+    file://0008-Always-build-uic.patch \
+"    
+
+# specific for nativesdk version
+SRC_URI += " \
+    file://0009-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0010-configure-bump-path-length-from-256-to-512-character.patch \
+"
+
+SRCREV = "207598fd8e69be34e8ba2c9db7720cb6003ea114"
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
new file mode 100644
index 0000000..cbf1672
--- /dev/null
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -0,0 +1,13 @@
+require qt5-git.inc
+require ${PN}.inc
+
+# prepend this again, because ${PN}.inc prepneds ${PN}
+FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
+
+SRCREV = "e7b791c8bb5e64a4c786bf370b10366815af704f"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index aaa9c04..0438dd9 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -4,11 +4,4 @@ require ${PN}.inc
 QT_MODULE_BRANCH = "master"
 
 # last tag before this SRCREV is 5.0.0-beta1, but version says 5.3.0 already
-SRCREV = "d3338a9f7fcac109d7bc7f600d5974ff333782ad"
-
-do_configure_prepend() {
-    # Temporary hack to get qt3d build for Qt 5.1.0
-    if ! grep -q MODULE_VERSION ${S}/.qmake.conf; then
-        echo "MODULE_VERSION = 5.3.0" >> ${S}/.qmake.conf
-    fi
-}
+SRCREV = "36a829ad6fb44fd01f490c35e011f6fd2470ffdd"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index fa0c06e..25b7a62 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -10,14 +10,14 @@ SRC_URI += " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.2.1+git${SRCPV}"
+PV = "5.2.1+5.3.0-beta1+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
 DEFAULT_PREFERENCE = "-1"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | GPL-3.0"
-LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=2abca611d56c23eb99943bde21c80a0d \
                     file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
                     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
new file mode 100644
index 0000000..828f5ea
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -0,0 +1,344 @@
+From 237a4b0143d91c0573ecf6f9ff5e37827a14a75d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 15 Apr 2013 04:29:32 +0200
+Subject: [PATCH 01/10] Add linux-oe-g++ platform
+
+* This qmake.conf unlike other platforms reads most variables from
+  shell environment, because it's easier for qt recipes to export
+  *FLAGS or CC specific for given recipe
+
+* configure: add getQEvalMakeConf and getXQEvalMakeConf
+  Allow expansion of $(...) references from qmake.conf to generate
+  qmake environment from shell environment as exported by qmake5_base
+
+* configure: don't export SYSTEM_VARIABLES to .qmake.vars
+  linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
+  causing issues as we need g++ to be used as linker
+
+* configure.prf: Allow to add extra arguments to make
+  sometimes we would like to add -e or define some variable and respect it from both
+  Makefiles used in configure tests and also Makefiles to build the application
+
+* OE_QMAKE_CXX in order to allow compiler version check to succeed
+  which allows WebKit to be enabled.
+
+* Other variables in order to let config.tests to use our -platform
+  settings
+
+* Add setBootstrapEvalVariable to bootstrap qmake with our environment
+  too, this allows us to use -platform linux-oe-g++ also for native
+  recipe
+
+* disable gdb_dwarf_index
+  * qmake is trying to call native gdb and we don't depend on gdb-native
+    (or even provide gdb-native)
+  * fixes errors like this:
+    /bin/sh: gdb: command not found
+    /bin/sh: line 0: test: -gt: unary operator expected
+    which are not fatal, but still misleading in do_configure output
+
+Upstream-Status: Inappropriate [embedded specific]
+                 too OE specific, probably cannot be upstreamed
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure                            |  60 +++++++++++++++------
+ mkspecs/features/configure.prf       |   4 +-
+ mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
+ mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
+ 4 files changed, 185 insertions(+), 19 deletions(-)
+ create mode 100644 mkspecs/linux-oe-g++/qmake.conf
+ create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
+
+diff --git a/configure b/configure
+index 55d68ef..bb24a9c 100755
+--- a/configure
++++ b/configure
+@@ -324,6 +324,16 @@ getQMakeConf()
+     getSingleQMakeVariable "$1" "$specvals"
+ }
+ 
++# OE qmake.conf is reading some variables from shell env
++# read them from qmake.conf, replace qmake () syntax with shell and eval
++getQEvalMakeConf()
++{
++    VAL=`getQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
++    EVAL=`eval "echo ${VAL}"`
++#    echo "Running getQEvalMakeConf: var='$1', val='`getQMakeConf \"$1\"`, val-sed='$VAL', eval='$EVAL'" >&2
++    eval "echo ${VAL}"
++}
++
+ getXQMakeConf()
+ {
+     if [ -z "$xspecvals" ]; then
+@@ -333,6 +343,16 @@ getXQMakeConf()
+     getSingleQMakeVariable "$1" "$xspecvals"
+ }
+ 
++# OE qmake.conf is reading some variables from shell env
++# read them from qmake.conf, replace qmake () syntax with shell and eval
++getXQEvalMakeConf()
++{
++    VAL=`getXQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
++    EVAL=`eval "echo ${VAL}"`
++#    echo "Running getXQEvalMakeConf: var='$1', val='`getXQMakeConf \"$1\"`, val-sed='$VAL', eval='$EVAL'" >&2
++    eval "echo ${VAL}"
++}
++
+ compilerSupportsFlag()
+ {
+     cat >conftest.cpp <<EOF
+@@ -548,21 +568,19 @@ fi
+ # initalize variables
+ #-------------------------------------------------------------------------------
+ 
+-SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
+-for varname in $SYSTEM_VARIABLES; do
++# Export all OE variables for qmake.conf from shell env to QMakeVars
++OE_VARIABLES="AR CC CFLAGS COMPILER CXX CXXFLAGS LDFLAGS LINK QT_CONFIG STRIP"
++for varname in $OE_VARIABLES; do
+     qmakevarname="${varname}"
+-    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
+-    if [ "${varname}" = "LDFLAGS" ]; then
+-        qmakevarname="LFLAGS"
+-    elif [ "${varname}" = "LD" ]; then
+-        qmakevarname="LINK"
+-    fi
+     cmd=`echo \
+-'if [ -n "\$'${varname}'" ]; then
+-    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}'"
++'if [ -n "\$OE_QMAKE_'${varname}'" ]; then
++    QMakeVar set OE_QMAKE_'${qmakevarname}' "\$OE_QMAKE_'${varname}'"
++#    echo "Exporting OE_QMAKE_'${qmakevarname}' value=\"\$OE_QMAKE_'${varname}'\"" >&2
+ fi'`
+     eval "$cmd"
+ done
++
++SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
+ # Use CC/CXX to run config.tests
+ mkdir -p "$outpath/config.tests"
+ rm -f "$outpath/config.tests/.qmake.cache"
+@@ -3139,7 +3157,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+     [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
+ fi
+ 
+-QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
++QMAKE_CONF_COMPILER=`getXQEvalMakeConf QMAKE_CXX`
+ 
+ TEST_COMPILER=$QMAKE_CONF_COMPILER
+ 
+@@ -3174,7 +3192,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+         exit 1
+     fi
+ fi
+-TEST_COMPILER_CXXFLAGS=`getXQMakeConf QMAKE_CXXFLAGS`
++TEST_COMPILER_CXXFLAGS=`getXQEvalMakeConf QMAKE_CXXFLAGS`
+ 
+ GCC_MACHINE_DUMP=
+ case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
+@@ -3632,6 +3650,14 @@ setBootstrapVariable()
+     getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
+ }
+ 
++# OE qmake.conf is reading some variables from shell env
++# read them from qmake.conf, replace qmake () syntax with shell and eval
++setBootstrapEvalVariable()
++{
++    getQEvalMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
++}
++
++
+ # build qmake
+ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+     echo "Creating qmake..."
+@@ -3670,11 +3696,11 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+         fi
+ 
+         [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
+-        setBootstrapVariable QMAKE_CC CC "$CC_TRANSFORM"
+-        setBootstrapVariable QMAKE_CXX CXX "$CC_TRANSFORM"
+-        setBootstrapVariable QMAKE_CFLAGS
+-        setBootstrapVariable QMAKE_CXXFLAGS
+-        setBootstrapVariable QMAKE_LFLAGS
++        setBootstrapEvalVariable QMAKE_CC CC "$CC_TRANSFORM"
++        setBootstrapEvalVariable QMAKE_CXX CXX "$CC_TRANSFORM"
++        setBootstrapEvalVariable QMAKE_CFLAGS
++        setBootstrapEvalVariable QMAKE_CXXFLAGS
++        setBootstrapEvalVariable QMAKE_LFLAGS
+ 
+         if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
+             setBootstrapVariable QMAKE_CFLAGS_RELEASE
+diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
+index fe41c54..e2db923 100644
+--- a/mkspecs/features/configure.prf
++++ b/mkspecs/features/configure.prf
+@@ -60,12 +60,12 @@ defineTest(qtCompileTest) {
+     }
+ 
+     # Clean up after previous run
+-    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE distclean")
++    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS) distclean")
+ 
+     mkpath($$test_out_dir)|error("Aborting.")
+ 
+     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qmake_configs $$shell_quote($$test_dir)") {
+-        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
++        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
+             log("yes$$escape_expand(\\n)")
+             msg = "test $$1 succeeded"
+             write_file($$QMAKE_CONFIG_LOG, msg, append)
+diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
+new file mode 100644
+index 0000000..ca26b10
+--- /dev/null
++++ b/mkspecs/linux-oe-g++/qmake.conf
+@@ -0,0 +1,40 @@
++#
++# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
++#
++
++MAKEFILE_GENERATOR	= UNIX
++CONFIG += incremental
++QMAKE_INCREMENTAL_STYLE = sublib
++
++include(../common/linux.conf)
++
++# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
++QMAKE_AR              = $(OE_QMAKE_AR) cqs
++QMAKE_STRIP           = $(OE_QMAKE_STRIP)
++QMAKE_WAYLAND_SCANNER = $(OE_QMAKE_WAYLAND_SCANNER)
++
++include(../common/gcc-base-unix.conf)
++
++# *FLAGS from gcc-base.conf
++QMAKE_CFLAGS                += $(OE_QMAKE_CFLAGS)
++QMAKE_CXXFLAGS              += $(OE_QMAKE_CXXFLAGS)
++QMAKE_LFLAGS                += $(OE_QMAKE_LDFLAGS)
++
++include(../common/g++-unix.conf)
++
++# tc settings from g++-base.conf
++QMAKE_COMPILER = $(OE_QMAKE_COMPILER)
++QMAKE_CC       = $(OE_QMAKE_CC)
++QMAKE_CXX      = $(OE_QMAKE_CXX)
++
++QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
++
++QMAKE_LINK         = $(OE_QMAKE_LINK)
++QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
++QMAKE_LINK_C       = $(OE_QMAKE_LINK)
++QMAKE_LINK_C_SHLIB = $(OE_QMAKE_LINK)
++
++# for the SDK
++isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
++
++load(qt_config)
+diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
+new file mode 100644
+index 0000000..dd12003
+--- /dev/null
++++ b/mkspecs/linux-oe-g++/qplatformdefs.h
+@@ -0,0 +1,100 @@
++/****************************************************************************
++**
++** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
++** Contact: http://www.qt-project.org/legal
++**
++** This file is part of the qmake spec of the Qt Toolkit.
++**
++** $QT_BEGIN_LICENSE:LGPL$
++** Commercial License Usage
++** Licensees holding valid commercial Qt licenses may use this file in
++** accordance with the commercial license agreement provided with the
++** Software or, alternatively, in accordance with the terms contained in
++** a written agreement between you and Digia.  For licensing terms and
++** conditions see http://qt.digia.com/licensing.  For further information
++** use the contact form at http://qt.digia.com/contact-us.
++**
++** GNU Lesser General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU Lesser
++** General Public License version 2.1 as published by the Free Software
++** Foundation and appearing in the file LICENSE.LGPL included in the
++** packaging of this file.  Please review the following information to
++** ensure the GNU Lesser General Public License version 2.1 requirements
++** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
++**
++** In addition, as a special exception, Digia gives you certain additional
++** rights.  These rights are described in the Digia Qt LGPL Exception
++** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
++**
++** GNU General Public License Usage
++** Alternatively, this file may be used under the terms of the GNU
++** General Public License version 3.0 as published by the Free Software
++** Foundation and appearing in the file LICENSE.GPL included in the
++** packaging of this file.  Please review the following information to
++** ensure the GNU General Public License version 3.0 requirements will be
++** met: http://www.gnu.org/copyleft/gpl.html.
++**
++**
++** $QT_END_LICENSE$
++**
++****************************************************************************/
++
++#ifndef QPLATFORMDEFS_H
++#define QPLATFORMDEFS_H
++
++// Get Qt defines/settings
++
++#include "qglobal.h"
++
++// Set any POSIX/XOPEN defines at the top of this file to turn on specific APIs
++
++// 1) need to reset default environment if _BSD_SOURCE is defined
++// 2) need to specify POSIX thread interfaces explicitly in glibc 2.0
++// 3) it seems older glibc need this to include the X/Open stuff
++#ifndef _GNU_SOURCE
++#  define _GNU_SOURCE
++#endif
++
++#include <unistd.h>
++
++
++// We are hot - unistd.h should have turned on the specific APIs we requested
++
++#include <features.h>
++#include <pthread.h>
++#include <dirent.h>
++#include <fcntl.h>
++#include <grp.h>
++#include <pwd.h>
++#include <signal.h>
++
++#include <sys/types.h>
++#include <sys/ioctl.h>
++#include <sys/ipc.h>
++#include <sys/time.h>
++#include <sys/shm.h>
++#include <sys/socket.h>
++#include <sys/stat.h>
++#include <sys/wait.h>
++#include <netinet/in.h>
++#ifndef QT_NO_IPV6IFNAME
++#include <net/if.h>
++#endif
++
++#define QT_USE_XOPEN_LFS_EXTENSIONS
++#include "../common/posix/qplatformdefs.h"
++
++#undef QT_SOCKLEN_T
++
++#if defined(__GLIBC__) && (__GLIBC__ >= 2)
++#define QT_SOCKLEN_T            socklen_t
++#else
++#define QT_SOCKLEN_T            int
++#endif
++
++#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
++#define QT_SNPRINTF		::snprintf
++#define QT_VSNPRINTF		::vsnprintf
++#endif
++
++#endif // QPLATFORMDEFS_H
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0001-Fix-missing-plugin_types.patch b/recipes-qt/qt5/qtbase-git/0001-Fix-missing-plugin_types.patch
new file mode 100644
index 0000000..612cbdd
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0001-Fix-missing-plugin_types.patch
@@ -0,0 +1,30 @@
+From f0e01b788e86f24352ba14ad17c3f337f934467d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 21 Apr 2014 15:09:23 +0200
+Subject: [PATCH] Fix missing plugin_types
+
+* bearer/generic was failing with:
+  Project ERROR: No module claims plugin type 'bearer'
+
+Change-Id: I90848856a8b0a4df52e599983cf7dde0bc0e6623
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ mkspecs/features/qt_module_pris.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/qt_module_pris.prf b/mkspecs/features/qt_module_pris.prf
+index f31bc38..415e780 100644
+--- a/mkspecs/features/qt_module_pris.prf
++++ b/mkspecs/features/qt_module_pris.prf
+@@ -177,7 +177,7 @@ MODULE_FWD_PRI = $$mod_work_pfx/qt_lib_$${MODULE_ID}.pri
+         include($$mod_work_pfx/qt_lib_$${pri}.pri)
+     for(mod, mods_to_load) {
+         for(var, $$list(VERSION MAJOR_VERSION MINOR_VERSION PATCH_VERSION \
+-                        name depends module_config CONFIG DEFINES sources \
++                        name depends module_config plugin_types CONFIG DEFINES sources \
+                         includes bins libs libexecs plugins imports qml \
+                         rpath_link \
+                 )):defined(QT.$${mod}.$$var, var):cache(QT.$${mod}.$$var, transient)
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
new file mode 100644
index 0000000..65ebbd1
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -0,0 +1,56 @@
+From 91b185d1f4843d22d42461c0aee4cd0f5393bbc8 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 21 Apr 2014 19:22:04 +0200
+Subject: [PATCH] Revert "eglfs: Print the chosen config in debug mode"
+
+This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
+---
+ src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
+ src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
+ 2 files changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
+index e6624fb..3870f6c 100644
+--- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
++++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
+@@ -437,9 +437,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
+     for (index = 0; attrs[index].attr != -1; ++index) {
+         EGLint value;
+         if (eglGetConfigAttrib(display, config, attrs[index].attr, &value)) {
+-            qDebug("\t%s: %d", attrs[index].name, (int)value);
++            qWarning("\t%s: %d\n", attrs[index].name, (int)value);
+         }
+     }
++
++    qWarning("\n");
+ }
+ 
+ #ifdef Q_OS_LINUX
+diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
+index eec6463..4a7c69b 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
++++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
+@@ -44,7 +44,6 @@
+ #include "qeglpbuffer_p.h"
+ #include <qpa/qplatformwindow.h>
+ #include <QOpenGLContext>
+-#include <QDebug>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+@@ -192,12 +191,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
+         return;
+     }
+ 
+-    static const bool printConfig = qgetenv("QT_QPA_EGLFS_DEBUG").toInt();
+-    if (printConfig) {
+-        qDebug() << "Created context for format" << format << "with config:";
+-        q_printEglConfig(m_eglDisplay, m_eglConfig);
+-    }
+-
+ #ifndef QT_NO_OPENGL
+     // Make the context current to ensure the GL version query works. This needs a surface too.
+     const EGLint pbufferAttributes[] = {
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch
new file mode 100644
index 0000000..5f9fd90
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0002-Add-external-hostbindir-option.patch
@@ -0,0 +1,303 @@
+From 00ad866f82f89ce938e9eaabfc50af3cde72ccfe Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 6 Apr 2013 13:15:07 +0200
+Subject: [PATCH 02/10] Add -external-hostbindir option
+
+* when cross-compiling it's sometimes useful to use existing tools from machine
+  (or in OpenEmbedded built with separate native recipe) when building for target
+
+* this way we can skip bootstraping tools we already have
+
+* qt_functions: temporary remove isEmpty check
+* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
+* isEmpty works correctly only with qmake variables (e.g. $$FOO -
+  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
+
+* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
+
+Upstream-Status: Pending
+  is a lot better for upstreaming (and it was already sort of approved by
+  Oswald) but in 5.2.0 I've noticed that he added something similar for
+  android builds
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+---
+ configure                                   | 15 +++++++++++++++
+ mkspecs/features/qt_functions.prf           |  9 ++++++++-
+ mkspecs/features/qt_tool.prf                |  3 +--
+ qmake/property.cpp                          |  1 +
+ qtbase.pro                                  | 12 +++++++++---
+ src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
+ src/corelib/global/qlibraryinfo.cpp         |  3 ++-
+ src/corelib/global/qlibraryinfo.h           |  1 +
+ src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
+ src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
+ tools/configure/configureapp.cpp            |  8 ++++++++
+ 11 files changed, 51 insertions(+), 13 deletions(-)
+
+diff --git a/configure b/configure
+index bb24a9c..bf7c11e 100755
+--- a/configure
++++ b/configure
+@@ -777,6 +777,7 @@ QT_HOST_BINS=
+ QT_HOST_LIBS=
+ QT_HOST_DATA=
+ QT_EXT_PREFIX=
++QT_EXTERNAL_HOST_BINS=
+ 
+ #flags for SQL drivers
+ QT_CFLAGS_PSQL=
+@@ -898,6 +899,7 @@ while [ "$#" -gt 0 ]; do
+     -testsdir| \
+     -hostdatadir| \
+     -hostbindir| \
++    -external-hostbindir| \
+     -hostlibdir| \
+     -extprefix| \
+     -sysroot| \
+@@ -1112,6 +1114,9 @@ while [ "$#" -gt 0 ]; do
+     extprefix)
+         QT_EXT_PREFIX="$VAL"
+         ;;
++    external-hostbindir)
++        QT_EXTERNAL_HOST_BINS="$VAL"
++        ;;
+     pkg-config)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_PKGCONFIG="$VAL"
+@@ -2250,6 +2255,10 @@ Installation options:
+     -hostdatadir <dir> . Data used by qmake will be installed to <dir>
+                          (default HOSTPREFIX)
+ 
++    -external-hostbindir <dir> Use external host executables instead of building them
++                         (not used by defaut)
++
++
+ Configure options:
+ 
+  The defaults (*) are usually acceptable. A plus (+) denotes a default value
+@@ -2914,6 +2923,11 @@ fi
+ # command line and environment validation
+ #-------------------------------------------------------------------------------
+ 
++# default is empty, don't call makeabs if it is empty
++if [ ! -z "$QT_EXTERNAL_HOST_BINS" ]; then
++    QT_EXTERNAL_HOST_BINS=`"$relpath/config.tests/unix/makeabs" "$QT_EXTERNAL_HOST_BINS"`
++fi
++
+ # update QT_CONFIG to show our current predefined configuration
+ CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
+ case "$CFG_QCONFIG" in
+@@ -3594,6 +3608,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+     "qt_hbinpath=$QT_HOST_BINS",
+     "qt_hlibpath=$QT_HOST_LIBS",
+     "qt_hdatpath=$QT_HOST_DATA",
++    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
+     "qt_targspec=$shortxspec",
+     "qt_hostspec=$shortspec",
+ #endif
+diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
+index 1dacfed..7229845 100644
+--- a/mkspecs/features/qt_functions.prf
++++ b/mkspecs/features/qt_functions.prf
+@@ -193,7 +193,14 @@ defineTest(qtAddRpathLink) {
+ defineTest(qtPrepareTool) {
+     $$1 = $$eval(QT_TOOL.$${2}.binary)
+     isEmpty($$1) {
+-        $$1 = $$[QT_HOST_BINS]/$$2
++        $$1 = $$[QT_EXTERNAL_HOST_BINS]/$$2
++        # for some reason isEmpty does not work here, FIXME before submitting upstream
++        # DEBUG 1: mkspecs/features/qt_functions.prf:198: calling built-in isEmpty(/OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/usr/bin/qt5)
++        # DEBUG 1: mkspecs/features/qt_functions.prf:198: test function returned true
++        # DEBUG 1: mkspecs/features/qt_functions.prf:198: taking 'then' branch
++        !exists($$[QT_EXTERNAL_HOST_BINS]/$$2) {
++            $$1 = $$[QT_HOST_BINS]/$$2
++        }
+         exists($$eval($$1).pl) {
+             $$1 = perl -w $$eval($$1).pl
+         } else: contains(QMAKE_HOST.os, Windows) {
+diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
+index f0864f9..50bfac8 100644
+--- a/mkspecs/features/qt_tool.prf
++++ b/mkspecs/features/qt_tool.prf
+@@ -15,8 +15,7 @@ CONFIG += console
+ 
+ # If we are doing a prefix build, create a "module" pri which enables
+ # qtPrepareTool() to work with the non-installed build.
+-# Non-bootstrapped tools always need this because of the environment setup.
+-!build_pass:if(!host_build|!force_bootstrap|force_independent) {
++!build_pass:if(!host_build|!force_bootstrap|force_independent):!exists($$[QT_EXTERNAL_HOST_BINS]) {
+     isEmpty(MODULE):MODULE = $$TARGET
+ 
+     !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
+diff --git a/qmake/property.cpp b/qmake/property.cpp
+index e50485c..71291ad 100644
+--- a/qmake/property.cpp
++++ b/qmake/property.cpp
+@@ -75,6 +75,7 @@ static const struct {
+     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
+     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
+     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
++    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
+     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
+     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
+ };
+diff --git a/qtbase.pro b/qtbase.pro
+index ed6fc39..2421f41 100644
+--- a/qtbase.pro
++++ b/qtbase.pro
+@@ -71,16 +71,22 @@ CONFIG -= qt
+ 
+ #qmake
+ qmake.path = $$[QT_HOST_BINS]
++qmake.files = $$OUT_PWD/bin/qmake
++!isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
++   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/bin/qmake
++}
+ equals(QMAKE_HOST.os, Windows) {
+-   qmake.files = $$OUT_PWD/bin/qmake.exe
+-} else {
+-   qmake.files = $$OUT_PWD/bin/qmake
++   qmake.files = $${qmake.files}.exe
+ }
+ INSTALLS += qmake
+ 
+ #syncqt
+ syncqt.path = $$[QT_HOST_BINS]
+ syncqt.files = $$PWD/bin/syncqt.pl
++syncqt.files = $$PWD/bin/syncqt.pl
++!isEmpty($$[QT_EXTERNAL_HOST_BINS]) {
++   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/bin/syncqt.pl
++}
+ INSTALLS += syncqt
+ 
+ # If we are doing a prefix build, create a "module" pri which enables
+diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
+index 9bda70e..6e3605a 100644
+--- a/src/corelib/Qt5CoreConfigExtras.cmake.in
++++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
+@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qmake$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_Core_check_file_exists(${imported_location})
+ 
+@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::moc)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/moc$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_Core_check_file_exists(${imported_location})
+ 
+@@ -37,7 +37,7 @@ if (NOT TARGET Qt5::rcc)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/rcc$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_Core_check_file_exists(${imported_location})
+ 
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index 6d25325..3686b17 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -333,7 +333,7 @@ QLibraryInfo::isDebugBuild()
+  */
+ 
+ static const struct {
+-    char key[19], value[13];
++    char key[21], value[13];
+ } qtConfEntries[] = {
+     { "Prefix", "." },
+     { "Documentation", "doc" }, // should be ${Data}/doc
+@@ -359,6 +359,7 @@ static const struct {
+     { "HostBinaries", "bin" },
+     { "HostLibraries", "lib" },
+     { "HostData", "." },
++    { "ExternalHostBinaries", "" },
+     { "TargetSpec", "" },
+     { "HostSpec", "" },
+ #endif
+diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
+index 0b573c2..b5535ee 100644
+--- a/src/corelib/global/qlibraryinfo.h
++++ b/src/corelib/global/qlibraryinfo.h
+@@ -88,6 +88,7 @@ public:
+         HostBinariesPath,
+         HostLibrariesPath,
+         HostDataPath,
++        ExternalHostBinariesPath,
+         TargetSpecPath,
+         HostSpecPath,
+         LastHostPath = HostSpecPath,
+diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
+index 1d94715..301af8f 100644
+--- a/src/dbus/Qt5DBusConfigExtras.cmake.in
++++ b/src/dbus/Qt5DBusConfigExtras.cmake.in
+@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qdbuscpp2xml)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_DBus_check_file_exists(${imported_location})
+ 
+@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::qdbusxml2cpp)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_DBus_check_file_exists(${imported_location})
+ 
+diff --git a/src/widgets/Qt5WidgetsConfigExtras.cmake.in b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
+index 99d87e2..5621dc0 100644
+--- a/src/widgets/Qt5WidgetsConfigExtras.cmake.in
++++ b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
+@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::uic)
+ !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
+     set(imported_location \"${_qt5Widgets_install_prefix}/$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
+ !!ELSE
+-    set(imported_location \"$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
++    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/uic$$CMAKE_BIN_SUFFIX\")
+ !!ENDIF
+     _qt5_Widgets_check_file_exists(${imported_location})
+ 
+diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
+index cff3f1b..540708b 100644
+--- a/tools/configure/configureapp.cpp
++++ b/tools/configure/configureapp.cpp
+@@ -1213,6 +1213,13 @@ void Configure::parseCmdLine()
+             dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
+         }
+ 
++        else if (configCmdLine.at(i) == "-external-hostbindir") {
++            ++i;
++            if (i == argCount)
++                break;
++            dictionary[ "QT_EXTERNAL_HOST_BINS" ] = configCmdLine.at(i);
++        }
++
+         else if (configCmdLine.at(i) == "-make-tool") {
+             ++i;
+             if (i == argCount)
+@@ -3986,6 +3993,7 @@ void Configure::generateQConfigCpp()
+                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
+                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
+                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
++                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
+                   << "    \"qt_targspec=" << targSpec << "\"," << endl
+                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
+                   << "#endif" << endl
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
new file mode 100644
index 0000000..95c67a8
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -0,0 +1,39 @@
+From 53b152be24082a2cf2497d2e687f9ee73a39d6f4 Mon Sep 17 00:00:00 2001
+From: Holger Freyther <zecke@selfish.org>
+Date: Wed, 26 Sep 2012 17:22:30 +0200
+Subject: [PATCH 03/10] qlibraryinfo: allow to set qt.conf from the outside
+ using the environment
+
+Allow to set a qt.conf from the outside using the environment. This allows
+to inject new prefixes and other paths into qmake. This is needed when using
+the same qmake binary to build qt/x11 and qt/embedded
+
+Upstream-Status: Inappropriate [embedded specific]
+  again very OE specific to read everything from environment (reusing the same
+  qmake from sstate and replacing all configured paths in it with qt.conf from
+  environment).
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/corelib/global/qlibraryinfo.cpp | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index 3686b17..89e13cf 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -153,7 +153,10 @@ QLibrarySettings::QLibrarySettings()
+ 
+ QSettings *QLibraryInfoPrivate::findConfiguration()
+ {
+-    QString qtconfig = QStringLiteral(":/qt/etc/qt.conf");
++    QByteArray config = getenv("QT_CONF_PATH");
++    QString qtconfig = QFile::decodeName(config);
++    if(!QFile::exists(qtconfig))
++        qtconfig = QStringLiteral(":/qt/etc/qt.conf");
+ #ifdef QT_BOOTSTRAPPED
+     if(!QFile::exists(qtconfig))
+         qtconfig = qt_libraryInfoFile();
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
new file mode 100644
index 0000000..c263d09
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -0,0 +1,30 @@
+From a39f5e64b7b5a31e7e5cd988b5f967ce6cf02990 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 27 Apr 2013 22:33:33 +0200
+Subject: [PATCH 04/10] configureapp: Prefix default LIBDIRS and INCDIRS with
+ SYSROOT
+
+Upstream-Status: Pending
+  again a bit OE specific
+---
+ tools/configure/configureapp.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
+index 540708b..45f4a1e 100644
+--- a/tools/configure/configureapp.cpp
++++ b/tools/configure/configureapp.cpp
+@@ -3370,8 +3370,8 @@ void Configure::generateQConfigPri()
+         configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
+         if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
+             // FIXME: add detection
+-            configStream << "    QMAKE_DEFAULT_LIBDIRS = /lib /usr/lib" << endl;
+-            configStream << "    QMAKE_DEFAULT_INCDIRS = /usr/include /usr/local/include" << endl;
++            configStream << "    QMAKE_DEFAULT_LIBDIRS = $$[QT_SYSROOT]/lib $$[QT_SYSROOT]/usr/lib" << endl;
++            configStream << "    QMAKE_DEFAULT_INCDIRS = $$[QT_SYSROOT]/usr/include $$[QT_SYSROOT]/usr/local/include" << endl;
+         }
+         configStream << "}" << endl;
+         configStream << "QT_CONFIG += " << qtConfig.join(' ') << endl;
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
new file mode 100644
index 0000000..395e84c
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -0,0 +1,50 @@
+From c0c4c468cc70a367e3bb2dd4a48c31e62b3b0fa4 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 29 Oct 2012 20:07:49 -0700
+Subject: [PATCH 05/10] qmake: don't build it in configure, but allow to build
+ it separately
+
+* it is already built in qtbase-native, so we don't need it in configure
+* allow building a separate qmake for the target
+
+Upstream-Status: Inappropriate [configuration]
+  OE specific for native/target builds
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
+Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure       | 2 +-
+ qmake/qmake.pro | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index bf7c11e..5e93ce4 100755
+--- a/configure
++++ b/configure
+@@ -3674,7 +3674,7 @@ setBootstrapEvalVariable()
+ 
+ 
+ # build qmake
+-if true; then ###[ '!' -f "$outpath/bin/qmake" ];
++if false; then ###[ '!' -f "$outpath/bin/qmake" ];
+     echo "Creating qmake..."
+ 
+     mkdir -p "$outpath/qmake" || exit
+diff --git a/qmake/qmake.pro b/qmake/qmake.pro
+index 89d6ea5..7c605b9 100644
+--- a/qmake/qmake.pro
++++ b/qmake/qmake.pro
+@@ -8,6 +8,8 @@ CONFIG -= qt
+ DEFINES += \
+     QT_BUILD_QMAKE \
+     PROEVALUATOR_FULL
++DESTDIR = ../bin/
++TARGET = qmake
+ 
+ VPATH += \
+     ../src/corelib/global \
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
new file mode 100644
index 0000000..21821c3
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -0,0 +1,72 @@
+From 2cb0f75bb9ab1e6709fe867887f9e6014a140356 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 5 Feb 2014 18:35:08 +0100
+Subject: [PATCH 06/10] eglfs: fix egl error for platforms only supporting one
+ window/surface
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+running qmlscene -platform eglfs <filename>.qml
+
+caused
+
+EGL Error : Could not create the egl surface: error = 0x3003
+
+Rebased version of [1-2]
+
+Upstream-Status: unknown
+
+[1] http://repository.timesys.com/buildsources/q/qt-everywhere-opensource/qt-everywhere-opensource-5.1.1/qt-everywhere-opensource-5.1.1-qeglfswindow.cpp.patch
+[2] https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/qeglfswindow.cpp.patch
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/plugins/platforms/eglfs/qeglfswindow.cpp | 16 +++++++++++++++-
+ 1 file changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+index 2d36c0b..854531e 100644
+--- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
++++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+@@ -74,6 +74,15 @@ void QEglFSWindow::create()
+ 
+     m_flags = Created;
+ 
++    static EGLSurface __singleWindowSurface;
++    if(QEglFSHooks::hooks() && ! QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows) && (__singleWindowSurface)) {
++        m_surface = __singleWindowSurface;
++#ifdef QEGL_EXTRA_DEBUG
++        qWarning("Surface recreate request, re-using %x\n", m_surface);
++#endif
++        return;
++    }
++
+     if (window()->type() == Qt::Desktop)
+         return;
+ 
+@@ -85,7 +94,7 @@ void QEglFSWindow::create()
+         if (isRaster() && screen->compositingWindow())
+             return;
+ 
+-#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK)
++#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK) || defined(EGL_API_FB)
+         // We can have either a single OpenGL window or multiple raster windows.
+         // Other combinations cannot work.
+         qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
+@@ -105,6 +114,11 @@ void QEglFSWindow::create()
+ 
+     resetSurface();
+ 
++    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows))
++    {
++        __singleWindowSurface = m_surface;
++    }
++
+     screen->setPrimarySurface(m_surface);
+ 
+     if (isRaster()) {
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
new file mode 100644
index 0000000..24ae7ea
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -0,0 +1,30 @@
+From 0923f72a444bcdc0675a24aec9782692b41d301c Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 19 Mar 2014 18:32:28 +0100
+Subject: [PATCH 07/10] qeglplatformintegration: Undefine CursorShape from X.h
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/platformsupport/eglconvenience/qeglplatformintegration_p.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
+index f665455..9eb783c 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
++++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
+@@ -46,6 +46,12 @@
+ #include <qpa/qplatformnativeinterface.h>
+ #include <EGL/egl.h>
+ 
++// Undefine CursorShape from X.h, which is causing breakage in Qt::CursorShape in platformsupport/eglconvenience/
++// /usr/include/X11/X.h:#define CursorShape           0       /* largest size that can be displayed */
++#ifdef CursorShape
++#undef CursorShape
++#endif
++
+ QT_BEGIN_NAMESPACE
+ 
+ class QEGLPlatformScreen;
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0008-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0008-Always-build-uic.patch
new file mode 100644
index 0000000..fd45516
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0008-Always-build-uic.patch
@@ -0,0 +1,31 @@
+From 4d5502114a3135f2c78eb9e63476918cbee00040 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 16 Nov 2013 00:32:30 +0100
+Subject: [PATCH 08/10] Always build uic
+
+Even if we are not building gui or widgets. This tool is needed later
+as a native tool when compiling the target.
+
+Change-Id: I257668ac28c22b192e7ec7736e6c23fa3be6bab6
+Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/src.pro | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/src.pro b/src/src.pro
+index 6a805a6..90623a6 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -158,7 +158,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+         }
+     }
+ }
+-SUBDIRS += src_plugins src_tools_qdoc
++SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
+ 
+ nacl: SUBDIRS -= src_network src_testlib
+ 
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0009-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0009-configure-preserve-built-qmake-and-swap-with-native-.patch
new file mode 100644
index 0000000..ddd7116
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0009-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -0,0 +1,30 @@
+From 7117e71f5e1aac3ac6e5e87852c108bbc13dc364 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 11 Nov 2013 20:22:34 -0500
+Subject: [PATCH 09/10] configure: preserve built qmake and swap with native
+ one
+
+Let configure script build the real qmake, but right after it's built, swap
+it with a native qmake for further internal use, preserving the real one.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/configure b/configure
+index 5e93ce4..01fca8f 100755
+--- a/configure
++++ b/configure
+@@ -3821,6 +3821,8 @@ if false; then ###[ '!' -f "$outpath/bin/qmake" ];
+ 
+     (cd "$outpath/qmake"; "$MAKE") || exit 2
+ fi # Build qmake
++mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
++mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
+ 
+ echo "Running configuration tests..."
+ 
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-git/0010-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0010-configure-bump-path-length-from-256-to-512-character.patch
new file mode 100644
index 0000000..02eef9b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-git/0010-configure-bump-path-length-from-256-to-512-character.patch
@@ -0,0 +1,29 @@
+From 6afe8d5d1daf94ac64478406b5b84b6879981446 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 11 Nov 2013 20:27:30 -0500
+Subject: [PATCH 10/10] configure: bump path length from 256 to 512 characters
+
+Increase the path length that gets hardcoded into generated config.cpp file
+from 256 to 512 characters, as nativesdk path can be quite long.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 01fca8f..801c7c1 100755
+--- a/configure
++++ b/configure
+@@ -3572,7 +3572,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+ static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
+ 
+ /* Installation Info */
+-static const char qt_configure_prefix_path_strs[][256 + 12] = {
++static const char qt_configure_prefix_path_strs[][512 + 12] = {
+ #ifndef QT_BUILD_QMAKE
+     "qt_prfxpath=$QT_SYSROOT_PREFIX",
+     "qt_docspath=$QT_SYSROOT_DOCS",
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 6f11bf3..bafe37b 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -1,12 +1,29 @@
 require qt5-git.inc
 require ${PN}.inc
 
+SRC_URI = "\    
+    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+"
+
+# common with -native
+SRC_URI += "\
+    file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-Add-external-hostbindir-option.patch \
+    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
+    file://0001-Fix-missing-plugin_types.patch \
+    file://0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+"
+
+# specific for native version
+SRC_URI += " \
+    file://0008-Always-build-uic.patch \
+"
+
 do_install_append() {
     # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
     # e.g. qt3d, qtwayland
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 168 commits
-SRCREV = "08cbbde61778276ccdda73d89fd64d02c623779f"
+SRCREV = "207598fd8e69be34e8ba2c9db7720cb6003ea114"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 07dd936..9bcfa79 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -1,6 +1,25 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 172 commits
-SRCREV = "bf0336a02502b3ed4d399c1cf5b4a56b1e858d42"
+SRC_URI = "\
+    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
+"
+
+# common with -native
+SRC_URI += "\
+    file://0001-Add-linux-oe-g-platform.patch \
+    file://0002-Add-external-hostbindir-option.patch \
+    file://0003-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
+    file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
+    file://0001-Fix-missing-plugin_types.patch \
+    file://0001-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
+"
+
+# target specific
+SRC_URI += "\
+    file://0005-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0006-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+"
+
+SRCREV = "207598fd8e69be34e8ba2c9db7720cb6003ea114"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 35e54d3..c0fd15d 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,6 +1,4 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 25 commits
-SRCREV = "9902dfdbc44934ce2e8072bc237ca8cdbfb3402b"
+SRCREV = "6d9ab3981a1ae9e224b3c6a8cf107049a0ee5095"
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index e2d6ae5..2d733a3 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 81 commits
-SRCREV = "7ceefa60ab4f79d5f40e7051edf80c1a77ae7734"
+SRCREV = "aedcd57c84ac9d6b74816c13bdf3fde31e1132b5"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index b442069..9347e7b 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 3 commits
-SRCREV = "1fbbe87e6d5dc84bff70bd90b71d07f9982a8bc3"
+SRCREV = "9b1883d2e90dd6ef92374d21e490a3de1c8330ba"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index e40bd3f..b413a5f 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 1 commits
-SRCREV = "dde6daeccdf0a3f8d49fe1777b49046576b12218"
+SRCREV = "554d617762c86964dfa074074304993ccdfbe2c9"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index e498515..bab8275 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 13 commits
-SRCREV = "2ba9fd5550eb7766c20b3a61679e88ec4a6c8a54"
+SRCREV = "27c9ffe1d2eb2103e9b420c86c6fc3d10cb1ff76"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index e9fed1a..88ca59e 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 17 commits
-SRCREV = "db7f7cc5654ddec60297259bc9f86f5f777749cd"
+SRCREV = "b088962950dbc4c6f0219de30b0d9a8cf47a3376"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index d744aa8..7c64460 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 2 commits
-SRCREV = "07d8ce32b1112dcb590c793ee51cb713e514011b"
+SRCREV = "c56f5d8848ce03cc6667804f815de47d2d8221fb"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 69c3353..fd525f1 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 15 commits
-SRCREV = "1c54d411ad6e98c3779a412750aec8b93d587872"
+SRCREV = "ea9add905768a26ce86ab542615a193296642732"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 2b86650..2deaaff 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 1 commits
-SRCREV = "f89d64ca722acf4a1a38c5e136bb01eff2525978"
+SRCREV = "e4453c92ee41943a3a1d67a725804a44e747f64e"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index aedcc40..6e3bda6 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 2 commits
-SRCREV = "9a8319a39a06d6cf3163978301d650b8f3558c62"
+SRCREV = "eee2eee734b4aa735d35f6c53d79c06c1c76425a"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 3418259..4619227 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,6 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 28 commits
-SRCREV = "03546732fa696467d23b24224fad2822bc6a9043"
+SRCREV = "6e75610dff5fb96ebd72cfb40ba7cbfea4bd21b7"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index b6032b7..0aa79e1 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 1 commits
-SRCREV = "ae68091e0d6023410bc657cf54e7fa9b6c8bbcc2"
+SRCREV = "ad81f5720c4f4a1dac099cbe2f9d47ed3a9025b0"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
new file mode 100644
index 0000000..575616b
--- /dev/null
+++ b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -0,0 +1,155 @@
+From 90a2e92062fc67fa54be0f5596606ce2bc21f772 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.jansa@gmail.com>
+Date: Wed, 11 Sep 2013 18:30:08 +0200
+Subject: [PATCH 1/2] Allow to build only lrelease + lupdate + lconvert
+
+This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
+is built without GUI support (no-png is set) and we still want to build
+native lrelease + lupdate + lconvert tools.
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.jansa@gmail.com>
+---
+ examples/examples.pro     |  4 ++--
+ src/designer/src/src.pro  | 16 +++++++++-------
+ src/linguist/linguist.pro |  2 +-
+ src/src.pro               | 14 ++++++++------
+ tests/auto/auto.pro       | 24 +++++++++++++-----------
+ 5 files changed, 33 insertions(+), 27 deletions(-)
+
+diff --git a/examples/examples.pro b/examples/examples.pro
+index 4955969..8e86419 100644
+--- a/examples/examples.pro
++++ b/examples/examples.pro
+@@ -1,3 +1,3 @@
+ TEMPLATE = subdirs
+-qtHaveModule(widgets): SUBDIRS += help designer linguist uitools assistant
+-
++!linguistonly:qtHaveModule(widgets): SUBDIRS += help designer assistant
++qtHaveModule(widgets): SUBDIRS += linguist uitools
+diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
+index e02ca8e..49527c5 100644
+--- a/src/designer/src/src.pro
++++ b/src/designer/src/src.pro
+@@ -1,18 +1,20 @@
+ TEMPLATE = subdirs
+ 
+-SUBDIRS = \
+-    uitools \
+-    lib \
+-    components \
+-    designer
++!linguistonly {
++    SUBDIRS = \
++        lib \
++        components \
++        designer
++}
++SUBDIRS += uitools
+ 
+-contains(QT_CONFIG, shared): SUBDIRS += plugins
++!linguistonly:contains(QT_CONFIG, shared): SUBDIRS += plugins
+ 
+ components.depends = lib
+ designer.depends = components
+ plugins.depends = lib
+ 
+-qtNomakeTools( \
++!linguistonly:qtNomakeTools( \
+     lib \
+     components \
+     designer \
+diff --git a/src/linguist/linguist.pro b/src/linguist/linguist.pro
+index 3a70580..a977878 100644
+--- a/src/linguist/linguist.pro
++++ b/src/linguist/linguist.pro
+@@ -3,7 +3,7 @@ SUBDIRS  = \
+     lrelease \
+     lupdate \
+     lconvert
+-!no-png:qtHaveModule(widgets): SUBDIRS += linguist
++!linguistonly:!no-png:qtHaveModule(widgets): SUBDIRS += linguist
+ 
+ qtNomakeTools( \
+     linguist \
+diff --git a/src/src.pro b/src/src.pro
+index 861d06d..3438f9a 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -4,10 +4,12 @@ qtHaveModule(widgets) {
+     no-png {
+         message("Some graphics-related tools are unavailable without PNG support")
+     } else {
+-        SUBDIRS = assistant \
++        !linguistonly { 
++            SUBDIRS = assistant \
+                   pixeltool \
+-                  qtestlib \
+-                  designer
++                  qtestlib
++        }
++        SUBDIRS += designer
+ #    unix:!mac:!embedded:!qpa:SUBDIRS += qtconfig
+ 
+         linguist.depends = designer
+@@ -15,7 +17,7 @@ qtHaveModule(widgets) {
+ }
+ 
+ SUBDIRS += linguist
+-!android|android_app: SUBDIRS += qtpaths
++!linguistonly:!android|android_app: SUBDIRS += qtpaths
+ 
+ mac {
+     SUBDIRS += macdeployqt
+@@ -25,7 +27,7 @@ android {
+     SUBDIRS += androiddeployqt
+ }
+ 
+-qtHaveModule(dbus): SUBDIRS += qdbus
++!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
+ 
+ win32|winrt:SUBDIRS += windeployqt
+ winrt:SUBDIRS += winrtrunner qtd3dservice
+@@ -36,4 +38,4 @@ qtNomakeTools( \
+     macdeployqt \
+ )
+ 
+-!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
++!linguistonly:!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
+diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
+index c3acfe3..b48e711 100644
+--- a/tests/auto/auto.pro
++++ b/tests/auto/auto.pro
+@@ -1,15 +1,17 @@
+ TEMPLATE=subdirs
+-SUBDIRS=\
+-    linguist \
+-    host.pro \
+-    qhelpcontentmodel \
+-    qhelpenginecore \
+-    qhelpgenerator \
+-    qhelpindexmodel \
+-    qhelpprojectdata \
+-    cmake \
+-    installed_cmake \
+-    qtdiag
++!linguistonly {
++    SUBDIRS=\
++        linguist \
++        host.pro \
++        qhelpcontentmodel \
++        qhelpenginecore \
++        qhelpgenerator \
++        qhelpindexmodel \
++        qhelpprojectdata \
++        cmake \
++        installed_cmake \
++        qtdiag
++}
+ 
+ installed_cmake.depends = cmake
+ 
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
new file mode 100644
index 0000000..1c40471
--- /dev/null
+++ b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -0,0 +1,32 @@
+From 509541ebd648414ee33f3aea3035d1e6382bfa3c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 17 Jan 2014 14:33:19 +0100
+Subject: [PATCH 2/2] assistant/help: fix linking of dependent libraries
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+else we get:
+| ...ld: warning: libQt5CLucene.so.5, needed by ...libQt5Help.so, not found (try using -rpath or -rpath-link)
+| ...undefined reference to `QCLucenePhraseQuery::getTerms() const'
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/assistant/help/help.pro | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
+index 168d23d..a9c3b59 100644
+--- a/src/assistant/help/help.pro
++++ b/src/assistant/help/help.pro
+@@ -59,3 +59,5 @@ HEADERS += qhelpenginecore.h \
+ # access to clucene
+ HEADERS += qhelpsearchindexwriter_clucene_p.h \
+     qhelpsearchindexreader_clucene_p.h
++
++LIBS += -lQt5CLucene
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index 200f427..49a1907 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 13 commits
-SRCREV = "80c6a5ea7f827647cc58037e1d1cf4bbf30e1fb6"
+SRCREV = "e7b791c8bb5e64a4c786bf370b10366815af704f"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index 200f427..49a1907 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 13 commits
-SRCREV = "80c6a5ea7f827647cc58037e1d1cf4bbf30e1fb6"
+SRCREV = "e7b791c8bb5e64a4c786bf370b10366815af704f"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index b820665..9fac8b2 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -10,3 +10,9 @@ SRCREV = "a237778666666ab77c4e8e6b501cf0fbe7c9223e"
 do_install_append() {
     ln -sf ${D}${OE_QMAKE_PATH_QT_BINS}/qtwaylandscanner ${D}${bindir}/qtwaylandscanner
 }
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index df7a562..3f18272 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -14,3 +14,9 @@ do_install_append() {
     # do install files created by qtwaylandscanner
     install ${B}/include/QtCompositor/5.3.0/QtCompositor/private/{qwayland-server-*,*protocol*}.h ${D}${includedir}/${QT_DIR_NAME}/QtCompositor/5.3.0/QtCompositor/private
 }
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 1f5df71..98fdc2f 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,6 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 1 commits
-SRCREV = "cb8ed9694b850a429a93490beaa6462d9f3b8ea6"
+SRCREV = "c9d13139b65818785f218cc96d136d33591ca2f5"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 047b37f..ec8b4f3 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,6 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 18 commits
-SRCREV = "a1b801fc98ccda988df41e08dc70fdbd50ecb513"
+SRCREV = "0546c8656a3728bf4375da39027e096beba4f111"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index d0a2a8c..954545f 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,6 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 1 commits
-SRCREV = "dd7eec92e7a5f4383783cc161f638867572dc208"
+SRCREV = "947361a7dc8db093d0b8e1ec5ac953470a180259"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 28e45a4..b86a749 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,6 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-QT_MODULE_BRANCH = "release"
-# v5.2.1 + 4 commits
-SRCREV = "eaf0a92dcb6fb12f3d65aa4fc806ccbfaa7f7db0"
+SRCREV = "d25091bb8b52455e415f8147a9100094c489a041"
+
+# older copyright year than what e.g. qtbase is using now
+LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=4193e7f1d47a858f6b7c0f1ee66161de \
+                    file://LICENSE.GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-- 
2.0.0


