Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id AC59875745
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jun 2015 10:08:55 +0000 (UTC)
Received: by wiga1 with SMTP id a1so42331021wig.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jun 2015 03:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=nXCFdqHC0CKXjbQcsNk0U4rFXuS1HczPTUsCS/6UobA=;
	b=GREKu6grCPekeNKs/ck1SWP3+ikxEFiJZ9cuwXCi6WEmgBNP+MVjtn3LG/ekIB96Pg
	5aBzUdm12/6DiLBruFtLW/HgC0oWsn9DeXEjhzyEVEqXNKrkvLtFuR3FhYE+PPP0zVmy
	Fqj5QcmP+hckY0ch2BcuHb1iwn/0nQZgUsWGzNn/EGdssrtYTsc30qjRKc23eCfVDSPZ
	X7qMhk64MAEeLHcHf/6D1mgy7S/x/TJCLR7AbJ/2ac7FuylmRwp/zkli0blWJFAiFYYH
	Kv7eA0GsG1J+vtmYO4CZZtOT+uYkNy16uMyZ01c9JHuCsj/9+wERv9nC8x1nWtypVQTn
	5S8w==
X-Received: by 10.180.105.74 with SMTP id gk10mr50599577wib.29.1433412536177; 
	Thu, 04 Jun 2015 03:08:56 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id gz3sm2475414wib.0.2015.06.04.03.08.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 03:08:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:09:07 +0200
Message-Id: <1433412551-20986-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.2
In-Reply-To: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
References: <1433412551-20986-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][fido][PATCH 3/7] qt5: rename <module>-git directories with patches to just <module>
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
X-List-Received-Date: Thu, 04 Jun 2015 10:08:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |    3 -
 recipes-qt/qt5/nativesdk-qttools_git.bb            |    3 -
 recipes-qt/qt5/qt5-git.inc                         |    2 -
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  |  351 ---
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   39 -
 .../0003-Add-external-hostbindir-option.patch      |  233 --
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  114 -
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |   97 -
 ...mintegration-Undefine-CursorShape-from-X..patch |   30 -
 ...ump-path-length-from-256-to-512-character.patch |   29 -
 ...gl-error-for-platforms-only-supporting-on.patch |   72 -
 .../0009-QOpenGLPaintDevice-sub-area-support.patch |  157 --
 ...ConfigExtras.cmake-find-gl-es-include-dir.patch |   42 -
 .../qt5/qtbase-git/0011-Always-build-uic.patch     |   31 -
 ...-build-it-in-configure-but-allow-to-build.patch |   68 -
 ...external-hostbindir-option-for-native-sdk.patch |  108 -
 .../0012-Set-paths-for-target-properly.patch       |   72 -
 ...reserve-built-qmake-and-swap-with-native-.patch |   30 -
 recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake     |    1 -
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  351 +++
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   39 +
 .../0003-Add-external-hostbindir-option.patch      |  233 ++
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  114 +
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |   97 +
 ...mintegration-Undefine-CursorShape-from-X..patch |   30 +
 ...ump-path-length-from-256-to-512-character.patch |   29 +
 ...gl-error-for-platforms-only-supporting-on.patch |   72 +
 .../0009-QOpenGLPaintDevice-sub-area-support.patch |  157 ++
 ...ConfigExtras.cmake-find-gl-es-include-dir.patch |   42 +
 recipes-qt/qt5/qtbase/0011-Always-build-uic.patch  |   31 +
 ...-build-it-in-configure-but-allow-to-build.patch |   68 +
 ...external-hostbindir-option-for-native-sdk.patch |  108 +
 .../0012-Set-paths-for-target-properly.patch       |   72 +
 ...reserve-built-qmake-and-swap-with-native-.patch |   30 +
 recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake         |    1 +
 .../0001-qmltestexample-fix-link.patch             |   88 -
 .../0001-qmltestexample-fix-link.patch             |   88 +
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 2369 --------------------
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 2369 ++++++++++++++++++++
 .../0001-Unix-Clear-serial_struct-instances.patch  |   42 -
 .../0001-Unix-Clear-serial_struct-instances.patch  |   42 +
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  155 --
 ...t-help-fix-linking-of-dependent-libraries.patch |   32 -
 .../0003-add-noqtwebkit-configuration.patch        |   51 -
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  155 ++
 ...t-help-fix-linking-of-dependent-libraries.patch |   32 +
 .../0003-add-noqtwebkit-configuration.patch        |   51 +
 ...-qtwaylandscanner-tool-to-the-native-side.patch |   32 -
 ...yland-include-server-buffer-only-when-bui.patch |   31 -
 ...-qtwaylandscanner-tool-to-the-native-side.patch |   32 +
 ...yland-include-server-buffer-only-when-bui.patch |   31 +
 ...se.gypi-include-atomicops_internals_x86_g.patch |   27 -
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |   29 -
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |   29 -
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |   29 -
 ...se.gypi-include-atomicops_internals_x86_g.patch |   27 +
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |   29 +
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |   29 +
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |   29 +
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |   30 -
 .../0002-Remove-TEXTREL-tag-in-x86.patch           |   79 -
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |   30 +
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |   79 +
 63 files changed, 4497 insertions(+), 4505 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
 delete mode 100644 recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake
 create mode 100644 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
 create mode 100644 recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
 create mode 100644 recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
 create mode 100644 recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
 create mode 100644 recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
 create mode 100644 recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
 create mode 100644 recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
 create mode 100644 recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
 create mode 100644 recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
 create mode 100644 recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
 create mode 100644 recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
 create mode 100644 recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 create mode 100644 recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
 create mode 100644 recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
 create mode 100644 recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
 create mode 100644 recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake
 delete mode 100644 recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
 create mode 100644 recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
 delete mode 100644 recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
 create mode 100644 recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
 delete mode 100644 recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
 create mode 100644 recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch
 delete mode 100644 recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
 delete mode 100644 recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
 delete mode 100644 recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
 create mode 100644 recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
 create mode 100644 recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
 create mode 100644 recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
 delete mode 100644 recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
 delete mode 100644 recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
 create mode 100644 recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
 create mode 100644 recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
 create mode 100644 recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
 delete mode 100644 recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
 delete mode 100644 recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch
 create mode 100644 recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
 create mode 100644 recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index b120733..1b566c2 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -1,9 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-# prepend this again, because ${PN}.inc prepneds ${PN}
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
-
 SRC_URI = "\
     ${QT_GIT}/qt/${QT_MODULE}.git;branch=${QT_MODULE_BRANCH} \
 "
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index 7ce1747..bbaafc5 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -1,9 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-# prepend this again, because ${PN}.inc prepends ${PN}
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
-
 SRCREV = "7f5b11a4a6357d2969e5b24bfb25c47aeb3d99f5"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=d87ae0d200af76dca730d911474cbe5b \
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index e90256e..f25de9b 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -12,8 +12,6 @@ S = "${WORKDIR}/git"
 
 PV = "5.4.1+git${SRCPV}"
 
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
-
 DEFAULT_PREFERENCE = "-1"
 
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & Digia-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
deleted file mode 100644
index f34aed4..0000000
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ /dev/null
@@ -1,351 +0,0 @@
-From 08f6be97c3f088fd8a2d752441c638093eedd990 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/12] Add linux-oe-g++ platform
-
-* This qmake.conf unlike other platforms reads most variables from
-  shell environment, because it's easier for qt recipes to export
-  *FLAGS or CC specific for given recipe
-
-* configure: add getQEvalMakeConf and getXQEvalMakeConf
-  Allow expansion of $(...) references from qmake.conf to generate
-  qmake environment from shell environment as exported by qmake5_base
-
-* configure: don't export SYSTEM_VARIABLES to .qmake.vars
-  linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
-  causing issues as we need g++ to be used as linker
-
-* configure.prf: Allow to add extra arguments to make
-  sometimes we would like to add -e or define some variable and respect it from both
-  Makefiles used in configure tests and also Makefiles to build the application
-
-* OE_QMAKE_CXX in order to allow compiler version check to succeed
-  which allows WebKit to be enabled.
-
-* Other variables in order to let config.tests to use our -platform
-  settings
-
-* Add setBootstrapEvalVariable to bootstrap qmake with our environment
-  too, this allows us to use -platform linux-oe-g++ also for native
-  recipe
-
-* disable gdb_dwarf_index
-  * qmake is trying to call native gdb and we don't depend on gdb-native
-    (or even provide gdb-native)
-  * fixes errors like this:
-    /bin/sh: gdb: command not found
-    /bin/sh: line 0: test: -gt: unary operator expected
-    which are not fatal, but still misleading in do_configure output
-
-Upstream-Status: Inappropriate [embedded specific]
-                 too OE specific, probably cannot be upstreamed
-
-Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure                            |  66 ++++++++++++++++-------
- mkspecs/features/configure.prf       |   4 +-
- mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
- mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 188 insertions(+), 22 deletions(-)
- create mode 100644 mkspecs/linux-oe-g++/qmake.conf
- create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
-
-diff --git a/configure b/configure
-index 6ce6753..0a00d6d 100755
---- a/configure
-+++ b/configure
-@@ -316,6 +316,16 @@ getQMakeConf()
-     getSingleQMakeVariable "$1" "$specvals"
- }
- 
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+getQEvalMakeConf()
-+{
-+    VAL=`getQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
-+    EVAL=`eval "echo ${VAL}"`
-+#    echo "Running getQEvalMakeConf: var='$1', val='`getQMakeConf \"$1\"`, val-sed='$VAL', eval='$EVAL'" >&2
-+    eval "echo ${VAL}"
-+}
-+
- getXQMakeConf()
- {
-     if [ -z "$xspecvals" ]; then
-@@ -325,6 +335,16 @@ getXQMakeConf()
-     getSingleQMakeVariable "$1" "$xspecvals"
- }
- 
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+getXQEvalMakeConf()
-+{
-+    VAL=`getXQMakeConf "$1" | sed -n 's/$[(]\([0-9a-zA-Z_]*\)[)]/$\1/pg'`
-+    EVAL=`eval "echo ${VAL}"`
-+#    echo "Running getXQEvalMakeConf: var='$1', val='`getXQMakeConf \"$1\"`, val-sed='$VAL', eval='$EVAL'" >&2
-+    eval "echo ${VAL}"
-+}
-+
- compilerSupportsFlag()
- {
-     cat >conftest.cpp <<EOF
-@@ -541,21 +561,19 @@ fi
- # initalize variables
- #-------------------------------------------------------------------------------
- 
--SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
--for varname in $SYSTEM_VARIABLES; do
-+# Export all OE variables for qmake.conf from shell env to QMakeVars
-+OE_VARIABLES="AR CC CFLAGS COMPILER CXX CXXFLAGS LDFLAGS LINK QT_CONFIG STRIP"
-+for varname in $OE_VARIABLES; do
-     qmakevarname="${varname}"
--    # use LDFLAGS for autoconf compat, but qmake uses QMAKE_LFLAGS
--    if [ "${varname}" = "LDFLAGS" ]; then
--        qmakevarname="LFLAGS"
--    elif [ "${varname}" = "LD" ]; then
--        qmakevarname="LINK"
--    fi
-     cmd=`echo \
--'if [ -n "\$'${varname}'" ]; then
--    QMakeVar set QMAKE_'${qmakevarname}' "\$'${varname}'"
-+'if [ -n "\$OE_QMAKE_'${varname}'" ]; then
-+    QMakeVar set OE_QMAKE_'${qmakevarname}' "\$OE_QMAKE_'${varname}'"
-+#    echo "Exporting OE_QMAKE_'${qmakevarname}' value=\"\$OE_QMAKE_'${varname}'\"" >&2
- fi'`
-     eval "$cmd"
- done
-+
-+SYSTEM_VARIABLES="RANLIB STRIP OBJDUMP LD CC CXX CFLAGS CXXFLAGS LDFLAGS"
- # Use CC/CXX to run config.tests
- mkdir -p "$outpath/config.tests"
- rm -f "$outpath/config.tests/.qmake.cache"
-@@ -3178,7 +3196,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
-     [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
- fi
- 
--QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
-+QMAKE_CONF_COMPILER=`getXQEvalMakeConf QMAKE_CXX`
- 
- TEST_COMPILER=$QMAKE_CONF_COMPILER
- 
-@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
-         exit 1
-     fi
- fi
--TEST_COMPILER_CXXFLAGS=`getXQMakeConf QMAKE_CXXFLAGS`
-+TEST_COMPILER_CXXFLAGS=`getXQEvalMakeConf QMAKE_CXXFLAGS`
- 
- GCC_MACHINE_DUMP=
- case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3687,6 +3705,14 @@ setBootstrapVariable()
-     getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
- }
- 
-+# OE qmake.conf is reading some variables from shell env
-+# read them from qmake.conf, replace qmake () syntax with shell and eval
-+setBootstrapEvalVariable()
-+{
-+    getQEvalMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
-+}
-+
-+
- # build qmake
- if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake..."
-@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-         fi
- 
-         [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
--        setBootstrapVariable QMAKE_CC CC "$CC_TRANSFORM"
--        setBootstrapVariable QMAKE_CXX CXX "$CC_TRANSFORM"
--        setBootstrapVariable QMAKE_CFLAGS
--        setBootstrapVariable QMAKE_CFLAGS_SPLIT_SECTIONS
--        setBootstrapVariable QMAKE_CXXFLAGS
--        setBootstrapVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
--        setBootstrapVariable QMAKE_LFLAGS
--        setBootstrapVariable QMAKE_LFLAGS_GCSECTIONS
-+        setBootstrapEvalVariable QMAKE_CC CC "$CC_TRANSFORM"
-+        setBootstrapEvalVariable QMAKE_CXX CXX "$CC_TRANSFORM"
-+        setBootstrapEvalVariable QMAKE_CFLAGS
-+        setBootstrapEvalVariable QMAKE_CFLAGS_SPLIT_SECTIONS
-+        setBootstrapEvalVariable QMAKE_CXXFLAGS
-+        setBootstrapEvalVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
-+        setBootstrapEvalVariable QMAKE_LFLAGS
-+        setBootstrapEvalVariable QMAKE_LFLAGS_GCSECTIONS
- 
-         if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
-             setBootstrapVariable QMAKE_CFLAGS_RELEASE
-diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 6b37a04..dcf6025 100644
---- a/mkspecs/features/configure.prf
-+++ b/mkspecs/features/configure.prf
-@@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
-     }
- 
-     # Clean up after previous run
--    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE distclean")
-+    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS) distclean")
- 
-     mkpath($$test_out_dir)|error("Aborting.")
- 
-     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) -spec $$QMAKESPEC $$qmake_configs $$shell_quote($$test_dir)") {
--        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
-+        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
-             log("yes$$escape_expand(\\n)")
-             msg = "test $$1 succeeded"
-             write_file($$QMAKE_CONFIG_LOG, msg, append)
-diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
-new file mode 100644
-index 0000000..2ad2810
---- /dev/null
-+++ b/mkspecs/linux-oe-g++/qmake.conf
-@@ -0,0 +1,40 @@
-+#
-+# qmake configuration for linux-g++ with modifications for building with OpenEmbedded
-+#
-+
-+MAKEFILE_GENERATOR	= UNIX
-+CONFIG += incremental
-+QMAKE_INCREMENTAL_STYLE = sublib
-+
-+include(../common/linux.conf)
-+
-+# QMAKE_<TOOL> (moc, uic, rcc) are gone, overwrite only ar and strip
-+QMAKE_AR              = $(OE_QMAKE_AR) cqs
-+QMAKE_STRIP           = $(OE_QMAKE_STRIP)
-+QMAKE_WAYLAND_SCANNER = $(OE_QMAKE_WAYLAND_SCANNER)
-+
-+include(../common/gcc-base-unix.conf)
-+
-+# *FLAGS from gcc-base.conf
-+QMAKE_CFLAGS                += $(OE_QMAKE_CFLAGS)
-+QMAKE_CXXFLAGS              += $(OE_QMAKE_CXXFLAGS)
-+QMAKE_LFLAGS                += $(OE_QMAKE_LDFLAGS)
-+
-+include(../common/g++-unix.conf)
-+
-+# tc settings from g++-base.conf
-+QMAKE_COMPILER = $(OE_QMAKE_COMPILER) gcc
-+QMAKE_CC       = $(OE_QMAKE_CC)
-+QMAKE_CXX      = $(OE_QMAKE_CXX)
-+
-+QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO += $(OE_QMAKE_CFLAGS)
-+
-+QMAKE_LINK         = $(OE_QMAKE_LINK)
-+QMAKE_LINK_SHLIB   = $(OE_QMAKE_LINK)
-+QMAKE_LINK_C       = $(OE_QMAKE_LINK)
-+QMAKE_LINK_C_SHLIB = $(OE_QMAKE_LINK)
-+
-+# for the SDK
-+isEmpty(QMAKE_QT_CONFIG):QMAKE_QT_CONFIG = $(OE_QMAKE_QT_CONFIG)
-+
-+load(qt_config)
-diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-new file mode 100644
-index 0000000..dd12003
---- /dev/null
-+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
-@@ -0,0 +1,100 @@
-+/****************************************************************************
-+**
-+** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
-+** Contact: http://www.qt-project.org/legal
-+**
-+** This file is part of the qmake spec of the Qt Toolkit.
-+**
-+** $QT_BEGIN_LICENSE:LGPL$
-+** Commercial License Usage
-+** Licensees holding valid commercial Qt licenses may use this file in
-+** accordance with the commercial license agreement provided with the
-+** Software or, alternatively, in accordance with the terms contained in
-+** a written agreement between you and Digia.  For licensing terms and
-+** conditions see http://qt.digia.com/licensing.  For further information
-+** use the contact form at http://qt.digia.com/contact-us.
-+**
-+** GNU Lesser General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU Lesser
-+** General Public License version 2.1 as published by the Free Software
-+** Foundation and appearing in the file LICENSE.LGPL included in the
-+** packaging of this file.  Please review the following information to
-+** ensure the GNU Lesser General Public License version 2.1 requirements
-+** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
-+**
-+** In addition, as a special exception, Digia gives you certain additional
-+** rights.  These rights are described in the Digia Qt LGPL Exception
-+** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
-+**
-+** GNU General Public License Usage
-+** Alternatively, this file may be used under the terms of the GNU
-+** General Public License version 3.0 as published by the Free Software
-+** Foundation and appearing in the file LICENSE.GPL included in the
-+** packaging of this file.  Please review the following information to
-+** ensure the GNU General Public License version 3.0 requirements will be
-+** met: http://www.gnu.org/copyleft/gpl.html.
-+**
-+**
-+** $QT_END_LICENSE$
-+**
-+****************************************************************************/
-+
-+#ifndef QPLATFORMDEFS_H
-+#define QPLATFORMDEFS_H
-+
-+// Get Qt defines/settings
-+
-+#include "qglobal.h"
-+
-+// Set any POSIX/XOPEN defines at the top of this file to turn on specific APIs
-+
-+// 1) need to reset default environment if _BSD_SOURCE is defined
-+// 2) need to specify POSIX thread interfaces explicitly in glibc 2.0
-+// 3) it seems older glibc need this to include the X/Open stuff
-+#ifndef _GNU_SOURCE
-+#  define _GNU_SOURCE
-+#endif
-+
-+#include <unistd.h>
-+
-+
-+// We are hot - unistd.h should have turned on the specific APIs we requested
-+
-+#include <features.h>
-+#include <pthread.h>
-+#include <dirent.h>
-+#include <fcntl.h>
-+#include <grp.h>
-+#include <pwd.h>
-+#include <signal.h>
-+
-+#include <sys/types.h>
-+#include <sys/ioctl.h>
-+#include <sys/ipc.h>
-+#include <sys/time.h>
-+#include <sys/shm.h>
-+#include <sys/socket.h>
-+#include <sys/stat.h>
-+#include <sys/wait.h>
-+#include <netinet/in.h>
-+#ifndef QT_NO_IPV6IFNAME
-+#include <net/if.h>
-+#endif
-+
-+#define QT_USE_XOPEN_LFS_EXTENSIONS
-+#include "../common/posix/qplatformdefs.h"
-+
-+#undef QT_SOCKLEN_T
-+
-+#if defined(__GLIBC__) && (__GLIBC__ >= 2)
-+#define QT_SOCKLEN_T            socklen_t
-+#else
-+#define QT_SOCKLEN_T            int
-+#endif
-+
-+#if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
-+#define QT_SNPRINTF		::snprintf
-+#define QT_VSNPRINTF		::vsnprintf
-+#endif
-+
-+#endif // QPLATFORMDEFS_H
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
deleted file mode 100644
index ec2bcb4..0000000
--- a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 31fa051d53e26301ef6abf72bd3f992d7c16cad2 Mon Sep 17 00:00:00 2001
-From: Holger Freyther <zecke@selfish.org>
-Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
- using the environment
-
-Allow to set a qt.conf from the outside using the environment. This allows
-to inject new prefixes and other paths into qmake. This is needed when using
-the same qmake binary to build qt/x11 and qt/embedded
-
-Upstream-Status: Inappropriate [embedded specific]
-  again very OE specific to read everything from environment (reusing the same
-  qmake from sstate and replacing all configured paths in it with qt.conf from
-  environment).
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/corelib/global/qlibraryinfo.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index d66007b..91ca643 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -138,7 +138,10 @@ QLibrarySettings::QLibrarySettings()
- 
- QSettings *QLibraryInfoPrivate::findConfiguration()
- {
--    QString qtconfig = QStringLiteral(":/qt/etc/qt.conf");
-+    QByteArray config = getenv("QT_CONF_PATH");
-+    QString qtconfig = QFile::decodeName(config);
-+    if(!QFile::exists(qtconfig))
-+        qtconfig = QStringLiteral(":/qt/etc/qt.conf");
- #ifdef QT_BOOTSTRAPPED
-     if(!QFile::exists(qtconfig))
-         qtconfig = qt_libraryInfoFile();
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
deleted file mode 100644
index 779ea91..0000000
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ /dev/null
@@ -1,233 +0,0 @@
-From cf4e996876e0b467b7aae124c7cb285f677bf6b0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/12] Add -external-hostbindir option
-
-* when cross-compiling it's sometimes useful to use existing tools from machine
-  (or in OpenEmbedded built with separate native recipe) when building for target
-
-* this way we can skip bootstraping tools we already have
-
-* qt_functions: temporary remove isEmpty check
-* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
-* isEmpty works correctly only with qmake variables (e.g. $$FOO -
-  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
-
-* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
-
-Upstream-Status: Pending
-  is a lot better for upstreaming (and it was already sort of approved by
-  Oswald) but in 5.2.0 I've noticed that he added something similar for
-  android builds
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- configure                                   | 15 +++++++++++++++
- mkspecs/features/qt_functions.prf           |  6 +++++-
- mkspecs/features/qt_tool.prf                |  4 ++--
- qtbase.pro                                  | 13 ++++++++++---
- src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
- src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
- src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
- 7 files changed, 38 insertions(+), 12 deletions(-)
-
-diff --git a/configure b/configure
-index 0a00d6d..ad5f4cd 100755
---- a/configure
-+++ b/configure
-@@ -770,6 +770,7 @@ QT_HOST_BINS=
- QT_HOST_LIBS=
- QT_HOST_DATA=
- QT_EXT_PREFIX=
-+QT_EXTERNAL_HOST_BINS=
- 
- #flags for SQL drivers
- QT_CFLAGS_PSQL=
-@@ -889,6 +890,7 @@ while [ "$#" -gt 0 ]; do
-     -testsdir| \
-     -hostdatadir| \
-     -hostbindir| \
-+    -external-hostbindir| \
-     -hostlibdir| \
-     -extprefix| \
-     -sysroot| \
-@@ -1107,6 +1109,9 @@ while [ "$#" -gt 0 ]; do
-     extprefix)
-         QT_EXT_PREFIX="$VAL"
-         ;;
-+    external-hostbindir)
-+        QT_EXTERNAL_HOST_BINS="$VAL"
-+        ;;
-     pkg-config)
-         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
-             CFG_PKGCONFIG="$VAL"
-@@ -2270,6 +2275,10 @@ Installation options:
-     -hostdatadir <dir> . Data used by qmake will be installed to <dir>
-                          (default HOSTPREFIX)
- 
-+    -external-hostbindir <dir> Use external host executables instead of building them
-+                         (not used by defaut)
-+
-+
- Configure options:
- 
-  The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2949,6 +2958,11 @@ fi
- # command line and environment validation
- #-------------------------------------------------------------------------------
- 
-+# default is empty, don't call makeabs if it is empty
-+if [ ! -z "$QT_EXTERNAL_HOST_BINS" ]; then
-+    QT_EXTERNAL_HOST_BINS=`"$relpath/config.tests/unix/makeabs" "$QT_EXTERNAL_HOST_BINS"`
-+fi
-+
- # update QT_CONFIG to show our current predefined configuration
- CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
- case "$CFG_QCONFIG" in
-@@ -3649,6 +3663,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
-     "qt_hbinpath=$QT_HOST_BINS",
-     "qt_hlibpath=$QT_HOST_LIBS",
-     "qt_hdatpath=$QT_HOST_DATA",
-+    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
-     "qt_targspec=$shortxspec",
-     "qt_hostspec=$shortspec",
- #endif
-diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 79b4eab..8c6913e 100644
---- a/mkspecs/features/qt_functions.prf
-+++ b/mkspecs/features/qt_functions.prf
-@@ -198,7 +198,11 @@ defineTest(qtAddRpathLink) {
- defineTest(qtPrepareTool) {
-     cmd = $$eval(QT_TOOL.$${2}.binary)
-     isEmpty(cmd) {
--        cmd = $$[QT_HOST_BINS]/$$2
-+        QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
-+        isEmpty(QT_EXTERNAL_HOST_BINS): \
-+            cmd = $$[QT_HOST_BINS]/$$2
-+        else: \
-+            cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
-         exists($${cmd}.pl) {
-             cmd = perl -w $$system_path($${cmd}.pl)
-         } else: contains(QMAKE_HOST.os, Windows) {
-diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 1d3e88c..9b26adf 100644
---- a/mkspecs/features/qt_tool.prf
-+++ b/mkspecs/features/qt_tool.prf
-@@ -12,11 +12,11 @@
- load(qt_app)
- 
- CONFIG += console
-+QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
- 
- # If we are doing a prefix build, create a "module" pri which enables
- # qtPrepareTool() to work with the non-installed build.
--# Non-bootstrapped tools always need this because of the environment setup.
--!build_pass:if(!host_build|!force_bootstrap|force_independent) {
-+!build_pass:if(!host_build|!force_bootstrap|force_independent):isEmpty(QT_EXTERNAL_HOST_BINS) {
-     isEmpty(MODULE):MODULE = $$TARGET
- 
-     !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
-diff --git a/qtbase.pro b/qtbase.pro
-index 6d0de44..ddf7478 100644
---- a/qtbase.pro
-+++ b/qtbase.pro
-@@ -69,18 +69,25 @@ CONFIG -= qt
- 
- ### installations ####
- 
-+QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
-+
- #qmake
- qmake.path = $$[QT_HOST_BINS]
-+qmake.files = $$OUT_PWD/bin/qmake
-+!isEmpty(QT_EXTERNAL_HOST_BINS) {
-+   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/qmake
-+}
- equals(QMAKE_HOST.os, Windows) {
--   qmake.files = $$OUT_PWD/bin/qmake.exe
--} else {
--   qmake.files = $$OUT_PWD/bin/qmake
-+   qmake.files = $${qmake.files}.exe
- }
- INSTALLS += qmake
- 
- #syncqt
- syncqt.path = $$[QT_HOST_BINS]
- syncqt.files = $$PWD/bin/syncqt.pl
-+!isEmpty(QT_EXTERNAL_HOST_BINS) {
-+   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/syncqt.pl
-+}
- INSTALLS += syncqt
- 
- # If we are doing a prefix build, create a "module" pri which enables
-diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
-index 7213a84..a977417 100644
---- a/src/corelib/Qt5CoreConfigExtras.cmake.in
-+++ b/src/corelib/Qt5CoreConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qmake)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qmake$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qmake$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::moc)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}moc$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/moc$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-@@ -37,7 +37,7 @@ if (NOT TARGET Qt5::rcc)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Core_install_prefix}/$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}rcc$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/rcc$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Core_check_file_exists(${imported_location})
- 
-diff --git a/src/dbus/Qt5DBusConfigExtras.cmake.in b/src/dbus/Qt5DBusConfigExtras.cmake.in
-index 1d94715..301af8f 100644
---- a/src/dbus/Qt5DBusConfigExtras.cmake.in
-+++ b/src/dbus/Qt5DBusConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::qdbuscpp2xml)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbuscpp2xml$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_DBus_check_file_exists(${imported_location})
- 
-@@ -20,7 +20,7 @@ if (NOT TARGET Qt5::qdbusxml2cpp)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5DBus_install_prefix}/$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/qdbusxml2cpp$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_DBus_check_file_exists(${imported_location})
- 
-diff --git a/src/widgets/Qt5WidgetsConfigExtras.cmake.in b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-index 99d87e2..5621dc0 100644
---- a/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-+++ b/src/widgets/Qt5WidgetsConfigExtras.cmake.in
-@@ -5,7 +5,7 @@ if (NOT TARGET Qt5::uic)
- !!IF isEmpty(CMAKE_BIN_DIR_IS_ABSOLUTE)
-     set(imported_location \"${_qt5Widgets_install_prefix}/$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
- !!ELSE
--    set(imported_location \"$${CMAKE_BIN_DIR}uic$$CMAKE_BIN_SUFFIX\")
-+    set(imported_location \"${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}/uic$$CMAKE_BIN_SUFFIX\")
- !!ENDIF
-     _qt5_Widgets_check_file_exists(${imported_location})
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
deleted file mode 100644
index c586775..0000000
--- a/recipes-qt/qt5/qtbase-git/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From bf9f8df42f5a7ac4a0cb4bdad8c849228aa79b35 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 04/12] qt_module: Fix pkgconfig and libtool replacements
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-* in situation like this:
-  QT_SYSROOT:/OE/oe-core/tmp-eglibc/sysroots/qemuarm
-  QT_INSTALL_LIBS:/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib
-  QT_INSTALL_LIBS/raw:/usr/lib
-  QT_INSTALL_LIBS/get:/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib
-
-  I don't want the replacement like this:
-  sed
-    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/include,/usr/include/qt5,g"
-    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib,/usr/lib,g"
-    "../../lib/pkgconfig/Qt5Core.pc"
-    >"/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/image/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib/pkgconfig/Qt5Core.pc"
-  because that way I'll end with -L/usr/lib in .pc file which is
-  cross-compile unfriendly, keeping ${libdir}/${includedir} works better
-  in my case
-
-* qt_module: Fix paths in .prl files
-* qmake does not prefix them with QT_SYSROOT when using them
-  so e.g. when building qtdeclarative we get -L/usr/lib to LINKAGE
-  variable, which is unsafe for cross-compilation
-* writting QT_SYSROOT in .prl files is dangerous for sstate when
-  builds are in different directories, so we need
-  SSTATE_SCAN_FILES += "*.pri *.prl"
-  to make them relocateble
-
-* fix paths in packageconfig files
-  This reverts parts of:
-
-  enable path replacement in installed prl files on all platforms
-
-  Task-number: QTBUG-33794
-  Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
-  Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
-
-* to debug this, rebuild qtbase and read build/src/corelib/Makefile
-* this is example of broken install_target rule (added line feeds):
-  -$(SED) -e s,/OE/5.3.1-r0/build/lib,/usr/lib,g
-          -e 's,/OE/5.3.1-r0/build/include,$$\{includedir},g'
-          -e 's,/OE/5.3.1-r0/build/lib,$$\{libdir},g'
-     "../../lib/pkgconfig/Qt5Core.pc"
-     >"$(INSTALL_ROOT)/usr/lib/pkgconfig/Qt5Core.pc"
-  change .prf files, create copy of WORKDIR, re-excecute only
-  do_configure task and compare generated Makefile, repeat until
-  replace in generated Makefile works ok, then refresh patch and
-  try complete rebuild for qtbase
-* if everything is ok, then try:
-  image $ grep -R "\-L/usr" .
-  image $ grep -R "\-I/usr" .
-  and it should return only few cases of
-  qmake.conf:QMAKE_LFLAGS_THREAD     = -L/usr/lib/threads
-  for aix* platformas
-
-Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- mkspecs/features/qt_common.prf |  2 +-
- mkspecs/features/qt_module.prf | 15 +++++++++++++++
- 2 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index eb65e73..4db40d0 100644
---- a/mkspecs/features/qt_common.prf
-+++ b/mkspecs/features/qt_common.prf
-@@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
-         lib_replace.replace =
-     } else {
-         lib_replace.match = $$rplbase/lib
--        lib_replace.replace = $$qt_libdir
-+        lib_replace.replace = "\$$\\{libdir}"
-     }
-     lib_replace.CONFIG = path
-     QMAKE_PRL_INSTALL_REPLACE += lib_replace
-diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 2437efe..2e1f014 100644
---- a/mkspecs/features/qt_module.prf
-+++ b/mkspecs/features/qt_module.prf
-@@ -192,10 +192,25 @@ unix|mingw {
-         QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
-     QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
- 
-+    pkgconfig_include_replace.match = $$rplbase/include
-+    pkgconfig_include_replace.replace = "\$$\\{includedir}"
-+    pkgconfig_include_replace.CONFIG = path
-+    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
-+
-     unix {
-         CONFIG += create_libtool explicitlib
-         QMAKE_LIBTOOL_LIBDIR = $$qt_libdir
-         QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace
-+        # add '=' as sysroot in .la files
-+        lafile_replace.match = "-L\$${libdir}"
-+        lafile_replace.replace = "-L=\$$\\{libdir}"
-+        lafile_replace.CONFIG = path
-+        QMAKE_LIBTOOL_INSTALL_REPLACE += lafile_replace
-+        # drop -L/usr/lib in .prl files
-+        prl_replace.match = "-L\$${libdir}"
-+        prl_replace.replace = ""
-+        prl_replace.CONFIG = path
-+        QMAKE_PRL_INSTALL_REPLACE += prl_replace
-     }
- }
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
deleted file mode 100644
index 9723bea..0000000
--- a/recipes-qt/qt5/qtbase-git/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From f8a4e063b45b5b941738dd90ea7c74063bc1e49f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 05/12] Revert "eglfs: Print the chosen config in debug mode"
-
-With this change the build is failing with:
-| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
-|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/egl.h:36,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext_p.h:51,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext.cpp:34:
-| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:10: error: expected identifier before 'int'
-|      enum Status {
-|           ^
-| In file included from ../../include/QtCore/qtextstream.h:1:0,
-|                  from ../../include/QtCore/../../../git/src/corelib/io/qdebug.h:42,
-|                  from ../../include/QtCore/qdebug.h:1,
-|                  from ../../include/QtCore/QDebug:1,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext.cpp:40:
-| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:17: error: expected unqualified-id before '{' token
-|      enum Status {
-|                  ^
-| Makefile:3896: recipe for target '.obj/qeglplatformcontext.o' failed
-| make[2]: *** [.obj/qeglplatformcontext.o] Error 1
-| make[2]: *** Waiting for unfinished jobs....
-| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:196:5: error: 'Display' redeclared as different kind of symbol
-|      Display
-|      ^
-| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
-|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/egl.h:36,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration_p.h:51,
-|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:55:
-| /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/X11/Xlib.h:499:26: note: previous declaration 'typedef struct _XDisplay Display'
-|  typedef struct _XDisplay Display;
-|                           ^
-| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp: In member function 'virtual void* QEGLPlatformIntegration::nativeResourceForScreen(const QByteArray&, QScreen*)':
-| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:239:17: error: expected primary-expression before ':' token
-|      case Display:
-|                  ^
-| Makefile:5486: recipe for target '.obj/qeglplatformintegration.o' failed
-
-This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
-
-Will be partially resolved in newer revision with:
-https://codereview.qt-project.org/96220
-
-Change-Id: I7a6a926b7525d4f137824c71f2ec8cd089c21f13
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
- src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
- 2 files changed, 3 insertions(+), 8 deletions(-)
-
-diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index c1a491c..7a0fc87 100644
---- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
-+++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-@@ -443,9 +443,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
-     for (index = 0; attrs[index].attr != -1; ++index) {
-         EGLint value;
-         if (eglGetConfigAttrib(display, config, attrs[index].attr, &value)) {
--            qDebug("\t%s: %d", attrs[index].name, (int)value);
-+            qWarning("\t%s: %d\n", attrs[index].name, (int)value);
-         }
-     }
-+
-+    qWarning("\n");
- }
- 
- #ifdef Q_OS_UNIX
-diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-index 7cc3300..ccbd974a 100644
---- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-+++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-@@ -37,7 +37,6 @@
- #include <qpa/qplatformwindow.h>
- #include <QOpenGLContext>
- #include <QtPlatformHeaders/QEGLNativeContext>
--#include <QDebug>
- 
- QT_BEGIN_NAMESPACE
- 
-@@ -181,12 +180,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
-         return;
-     }
- 
--    static const bool printConfig = qgetenv("QT_QPA_EGLFS_DEBUG").toInt();
--    if (printConfig) {
--        qDebug() << "Created context for format" << format << "with config:";
--        q_printEglConfig(m_eglDisplay, m_eglConfig);
--    }
--
-     updateFormatFromGL();
- }
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
deleted file mode 100644
index 04fb370..0000000
--- a/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6061c8457ea1f76745bd9918e61bda01ef96ce56 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 06/12] qeglplatformintegration: Undefine CursorShape from X.h
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/platformsupport/eglconvenience/qeglplatformintegration_p.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-index 2b5d5f5..a0aab03 100644
---- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-+++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-@@ -50,6 +50,12 @@
- #include <qpa/qplatformnativeinterface.h>
- #include <EGL/egl.h>
- 
-+// Undefine CursorShape from X.h, which is causing breakage in Qt::CursorShape in platformsupport/eglconvenience/
-+// /usr/include/X11/X.h:#define CursorShape           0       /* largest size that can be displayed */
-+#ifdef CursorShape
-+#undef CursorShape
-+#endif
-+
- QT_BEGIN_NAMESPACE
- 
- class QEGLPlatformScreen;
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
deleted file mode 100644
index be75d72..0000000
--- a/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a6b01490248be28c1db3abd5f710c5d7d9afee55 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 07/12] configure: bump path length from 256 to 512 characters
-
-Increase the path length that gets hardcoded into generated config.cpp file
-from 256 to 512 characters, as nativesdk path can be quite long.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index ad5f4cd..c19ff6a 100755
---- a/configure
-+++ b/configure
-@@ -3627,7 +3627,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
- static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
- 
- /* Installation Info */
--static const char qt_configure_prefix_path_strs[][256 + 12] = {
-+static const char qt_configure_prefix_path_strs[][512 + 12] = {
- #ifndef QT_BUILD_QMAKE
-     "qt_prfxpath=$QT_SYSROOT_PREFIX",
-     "qt_docspath=$QT_SYSROOT_DOCS",
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
deleted file mode 100644
index e4d4327..0000000
--- a/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From d1712999887b9809cce57b1e6c008c454330cd2e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 08/12] eglfs: fix egl error for platforms only supporting one
- window/surface
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-running qmlscene -platform eglfs <filename>.qml
-
-caused
-
-EGL Error : Could not create the egl surface: error = 0x3003
-
-Rebased version of [1-2]
-
-Upstream-Status: unknown
-
-[1] http://repository.timesys.com/buildsources/q/qt-everywhere-opensource/qt-everywhere-opensource-5.1.1/qt-everywhere-opensource-5.1.1-qeglfswindow.cpp.patch
-[2] https://github.com/prabindh/qt-configs/blob/master/qt5_1.0_Feb13/qeglfswindow.cpp.patch
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/plugins/platforms/eglfs/qeglfswindow.cpp | 16 +++++++++++++++-
- 1 file changed, 15 insertions(+), 1 deletion(-)
-
-diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-index 39a3ef9..2c05979 100644
---- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
-+++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-@@ -68,6 +68,15 @@ void QEglFSWindow::create()
- 
-     m_flags = Created;
- 
-+    static EGLSurface __singleWindowSurface;
-+    if(QEglFSHooks::hooks() && ! QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows) && (__singleWindowSurface)) {
-+        m_surface = __singleWindowSurface;
-+#ifdef QEGL_EXTRA_DEBUG
-+        qWarning("Surface recreate request, re-using %x\n", m_surface);
-+#endif
-+        return;
-+    }
-+
-     if (window()->type() == Qt::Desktop)
-         return;
- 
-@@ -81,7 +90,7 @@ void QEglFSWindow::create()
-             return;
-         }
- 
--#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK)
-+#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK) || defined(EGL_API_FB)
-         // We can have either a single OpenGL window or multiple raster windows.
-         // Other combinations cannot work.
-         qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
-@@ -101,6 +110,11 @@ void QEglFSWindow::create()
- 
-     resetSurface();
- 
-+    if(QEglFSHooks::hooks() && !QEglFSHooks::hooks()->hasCapability(QPlatformIntegration::MultipleWindows))
-+    {
-+        __singleWindowSurface = m_surface;
-+    }
-+
-     screen->setPrimarySurface(m_surface);
- 
-     if (isRaster()) {
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
deleted file mode 100644
index bebb3d9..0000000
--- a/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From a34538ff13c520fa85df689255469a316f037d0d Mon Sep 17 00:00:00 2001
-From: Jani Hautakangas <jani.hautakangas@ixonos.com>
-Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 09/12] QOpenGLPaintDevice sub-area support
-
-Allows creating QOpenGLPaintDevice targetting sub-area
-of binded framebuffer.
-
-Upstream-Status: Pending
-
-Change-Id: Ida2f079aa1ac0b87d36b54129e226399dbcdda80
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/gui/opengl/qopenglpaintdevice.cpp       | 11 +++++++++++
- src/gui/opengl/qopenglpaintdevice.h         |  2 ++
- src/gui/opengl/qopenglpaintdevice_p.h       |  1 +
- src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
- src/gui/opengl/qopenglpaintengine_p.h       |  1 +
- src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
- 6 files changed, 23 insertions(+), 3 deletions(-)
-
-diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index a08d26f..cff3155 100644
---- a/src/gui/opengl/qopenglpaintdevice.cpp
-+++ b/src/gui/opengl/qopenglpaintdevice.cpp
-@@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
- {
- }
- 
-+QOpenGLPaintDevice::QOpenGLPaintDevice(int x, int y, int width, int height)
-+    : d_ptr(new QOpenGLPaintDevicePrivate(QSize(width, height)))
-+{
-+    d_ptr->offset = QPoint(x,y);
-+}
-+
- /*!
-     \internal
-  */
-@@ -212,6 +218,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
-     return d_ptr->ctx;
- }
- 
-+QPoint QOpenGLPaintDevice::offset() const
-+{
-+    return d_ptr->offset;
-+}
-+
- /*!
-     Returns the pixel size of the paint device.
- 
-diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index 10cee84..a6683c5 100644
---- a/src/gui/opengl/qopenglpaintdevice.h
-+++ b/src/gui/opengl/qopenglpaintdevice.h
-@@ -53,12 +53,14 @@ public:
-     QOpenGLPaintDevice();
-     explicit QOpenGLPaintDevice(const QSize &size);
-     QOpenGLPaintDevice(int width, int height);
-+    QOpenGLPaintDevice(int x, int y, int width, int height);
-     virtual ~QOpenGLPaintDevice();
- 
-     int devType() const { return QInternal::OpenGL; }
-     QPaintEngine *paintEngine() const;
- 
-     QOpenGLContext *context() const;
-+    QPoint offset() const;
-     QSize size() const;
-     void setSize(const QSize &size);
-     void setDevicePixelRatio(qreal devicePixelRatio);
-diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qopenglpaintdevice_p.h
-index 0b01129..211f2f3 100644
---- a/src/gui/opengl/qopenglpaintdevice_p.h
-+++ b/src/gui/opengl/qopenglpaintdevice_p.h
-@@ -65,6 +65,7 @@ public:
- 
- public:
-     QSize size;
-+    QPoint offset;
-     QOpenGLContext *ctx;
- 
-     qreal dpmx;
-diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 8eeaa31..e17520e 100644
---- a/src/gui/opengl/qopenglpaintengine.cpp
-+++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -2080,7 +2080,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
-     for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
-         d->vertexAttributeArraysEnabledState[i] = false;
- 
-+    const QPoint offset = d->device->offset();
-     const QSize sz = d->device->size();
-+    d->x = offset.x();
-+    d->y = offset.y();
-     d->width = sz.width();
-     d->height = sz.height();
-     d->mode = BrushDrawingMode;
-@@ -2167,7 +2170,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
-         d->device->ensureActiveTarget();
- 
-         d->transferMode(BrushDrawingMode);
--        d->funcs.glViewport(0, 0, d->width, d->height);
-+        d->funcs.glViewport(d->x, d->y, d->width, d->height);
-         d->needsSync = false;
-         d->shaderManager->setDirty();
-         d->syncGlState();
-@@ -2209,6 +2212,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
-     if (bounds == QRect(0, 0, width, height)) {
-         funcs.glDisable(GL_SCISSOR_TEST);
-     } else {
-+        bounds = QRect(bounds.x(), bounds.y(), bounds.width(), bounds.height());
-         funcs.glEnable(GL_SCISSOR_TEST);
-         setScissor(bounds);
-     }
-@@ -2217,12 +2221,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
- 
- void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
- {
--    const int left = rect.left();
-+    const int left = rect.left() + x;
-     const int width = rect.width();
-     int bottom = height - (rect.top() + rect.height());
-     if (device->paintFlipped()) {
-         bottom = rect.top();
-     }
-+    bottom += y;
-     const int height = rect.height();
- 
-     funcs.glScissor(left, bottom, width, height);
-diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index 9722ea3..07e3163 100644
---- a/src/gui/opengl/qopenglpaintengine_p.h
-+++ b/src/gui/opengl/qopenglpaintengine_p.h
-@@ -264,6 +264,7 @@ public:
-     QOpenGL2PaintEngineEx* q;
-     QOpenGLEngineShaderManager* shaderManager;
-     QOpenGLPaintDevice* device;
-+    int x, y;
-     int width, height;
-     QOpenGLContext *ctx;
-     EngineMode mode;
-diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index cd268cd..997bc35 100644
---- a/src/gui/opengl/qopengltextureglyphcache.cpp
-+++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
-     funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
- 
-     if (pex != 0) {
--        funcs->glViewport(0, 0, pex->width, pex->height);
-+        funcs->glViewport(pex->x, pex->y, pex->width, pex->height);
-         pex->updateClipScissorTest();
-     } else {
-         if (m_vao.isCreated()) {
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
deleted file mode 100644
index f2eed11..0000000
--- a/recipes-qt/qt5/qtbase-git/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 16a55457ce31d467cb331ab8e94b672757ef42b9 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 18 Dec 2014 13:41:09 +0100
-Subject: [PATCH 10/12] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In configure QMAKE_INCDIR_OPENGL is set with pkg-config. Without
-PKG_CONFIG_ALLOW_SYSTEM_CFLAGS set, pkg-config returns paths outside
-/usr/include only (in my case /usr/include/libdrm). With NO_DEFAULT_PATH set
-gl(es) include directories cannot be found. Cmake builds depending on
-Qt5Gui error out with
-
-| Failed to find "GLES2/gl2.h" in "/usr/include/libdrm"
-
-Upstream-Status: submitted [1]
-
-[1] https://bugreports.qt-project.org/browse/QTBUG-43445
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/gui/Qt5GuiConfigExtras.cmake.in | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/gui/Qt5GuiConfigExtras.cmake.in b/src/gui/Qt5GuiConfigExtras.cmake.in
-index 9a846d4..07869ef 100644
---- a/src/gui/Qt5GuiConfigExtras.cmake.in
-+++ b/src/gui/Qt5GuiConfigExtras.cmake.in
-@@ -57,9 +57,6 @@ set(Qt5Gui_OPENGL_LIBRARIES Qt5::Gui_GLESv2)
- set(_GL_INCDIRS $$CMAKE_GL_INCDIRS)
- find_path(_qt5gui_OPENGL_INCLUDE_DIR $$CMAKE_GL_HEADER_NAME
-     PATHS ${_GL_INCDIRS}
--!!IF !mac
--    NO_DEFAULT_PATH
--!!ENDIF
- )
- if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
-     message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
deleted file mode 100644
index da17878..0000000
--- a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 5a6ad20dd4fde6a0581be895d763aae43f1fc2b6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 11/13] Always build uic
-
-Even if we are not building gui or widgets. This tool is needed later
-as a native tool when compiling the target.
-
-Change-Id: I257668ac28c22b192e7ec7736e6c23fa3be6bab6
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@palm.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/src.pro | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/src.pro b/src/src.pro
-index 83f7587..9dbcf70 100644
---- a/src/src.pro
-+++ b/src/src.pro
-@@ -163,7 +163,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
-         }
-     }
- }
--SUBDIRS += src_plugins src_tools_qdoc
-+SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
- 
- nacl: SUBDIRS -= src_network src_testlib
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
deleted file mode 100644
index 96198b1..0000000
--- a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 6c0cc990522454e0c9e52ba969c3a8c5937157b8 Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 11/12] qmake: don't build it in configure, but allow to build
- it separately
-
-* it is already built in qtbase-native, so we don't need it in configure
-* allow building a separate qmake for the target
-
-Upstream-Status: Inappropriate [configuration]
-  OE specific for native/target builds
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
-Signed-off-by: Mikko Levonmaa <mikko.levonmaa@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
- configure       | 2 +-
- qmake/qmake.pri | 3 ++-
- qmake/qmake.pro | 2 ++
- 3 files changed, 5 insertions(+), 2 deletions(-)
----
- configure       | 2 +-
- qmake/qmake.pri | 3 ++-
- qmake/qmake.pro | 1 +
- 3 files changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure b/configure
-index c19ff6a..7a34b11 100755
---- a/configure
-+++ b/configure
-@@ -3729,7 +3729,7 @@ setBootstrapEvalVariable()
- 
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake..."
- 
-     mkdir -p "$outpath/qmake" || exit
-diff --git a/qmake/qmake.pri b/qmake/qmake.pri
-index 4de41d6..69982b7 100644
---- a/qmake/qmake.pri
-+++ b/qmake/qmake.pri
-@@ -82,7 +82,8 @@ bootstrap { #Qt code
-         qjsonparser.cpp \
-         qjsonarray.cpp \
-         qjsonobject.cpp \
--        qjsonvalue.cpp
-+        qjsonvalue.cpp \
-+        qdebug.cpp
- 
-    HEADERS+= \
-         qbitarray.h \
-diff --git a/qmake/qmake.pro b/qmake/qmake.pro
-index 89d6ea5..0ff4a96 100644
---- a/qmake/qmake.pro
-+++ b/qmake/qmake.pro
-@@ -8,6 +8,7 @@ CONFIG -= qt
- DEFINES += \
-     QT_BUILD_QMAKE \
-     PROEVALUATOR_FULL
-+TARGET = qmake
- 
- VPATH += \
-     ../src/corelib/global \
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
deleted file mode 100644
index 4c044c0..0000000
--- a/recipes-qt/qt5/qtbase-git/0012-Add-external-hostbindir-option-for-native-sdk.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 6425d71d52c5587f323fe28af62530d5c82b02fd Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 12/13] Add -external-hostbindir option for native(sdk)
-
-* when cross-compiling it's sometimes useful to use existing tools from machine
-  (or in OpenEmbedded built with separate native recipe) when building for target
-
-* this way we can skip bootstraping tools we already have
-
-* qt_functions: temporary remove isEmpty check
-* now we assume that every build will provide QT_EXTERNAL_HOST_BINS value
-* isEmpty works correctly only with qmake variables (e.g. $$FOO -
-  isEmpty(FOO)), but doesn't work with system properties like $$[FOO].
-
-* cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to determine path to host binaries
-
-Upstream-Status: Pending
-  is a lot better for upstreaming (and it was already sort of approved by
-  Oswald) but in 5.2.0 I've noticed that he added something similar for
-  android builds
-
-Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- qmake/property.cpp                  | 1 +
- src/corelib/global/qlibraryinfo.cpp | 3 ++-
- src/corelib/global/qlibraryinfo.h   | 1 +
- tools/configure/configureapp.cpp    | 8 ++++++++
- 4 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 051e056..50da6ed 100644
---- a/qmake/property.cpp
-+++ b/qmake/property.cpp
-@@ -67,6 +67,7 @@ static const struct {
-     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
-     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
-     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
-+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
-     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
-     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
- };
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 91ca643..7a567fa 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -348,7 +348,7 @@ QLibraryInfo::isDebugBuild()
-  */
- 
- static const struct {
--    char key[19], value[13];
-+    char key[21], value[13];
- } qtConfEntries[] = {
-     { "Prefix", "." },
-     { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -374,6 +374,7 @@ static const struct {
-     { "HostBinaries", "bin" },
-     { "HostLibraries", "lib" },
-     { "HostData", "." },
-+    { "ExternalHostBinaries", "" },
-     { "TargetSpec", "" },
-     { "HostSpec", "" },
- #endif
-diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 543c4b3..a02e03a 100644
---- a/src/corelib/global/qlibraryinfo.h
-+++ b/src/corelib/global/qlibraryinfo.h
-@@ -80,6 +80,7 @@ public:
-         HostBinariesPath,
-         HostLibrariesPath,
-         HostDataPath,
-+        ExternalHostBinariesPath,
-         TargetSpecPath,
-         HostSpecPath,
-         LastHostPath = HostSpecPath,
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 6e9d4aa..0ca4daf 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
-             dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
-         }
- 
-+        else if (configCmdLine.at(i) == "-external-hostbindir") {
-+            ++i;
-+            if (i == argCount)
-+                break;
-+            dictionary[ "QT_EXTERNAL_HOST_BINS" ] = configCmdLine.at(i);
-+        }
-+
-         else if (configCmdLine.at(i) == "-make-tool") {
-             ++i;
-             if (i == argCount)
-@@ -4004,6 +4011,7 @@ void Configure::generateQConfigCpp()
-                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
-                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
-+                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
-                   << "    \"qt_targspec=" << targSpec << "\"," << endl
-                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
-                   << "#endif" << endl
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch b/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
deleted file mode 100644
index 0a7eb15..0000000
--- a/recipes-qt/qt5/qtbase-git/0012-Set-paths-for-target-properly.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From 84c23fc01b28087de35604ef971227b57fb77876 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Thu, 22 Jan 2015 16:09:35 +0100
-Subject: [PATCH 12/12] Set paths for target properly
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure | 43 +++++++++++++++++++++----------------------
- 1 file changed, 21 insertions(+), 22 deletions(-)
-
-diff --git a/configure b/configure
-index 7a34b11..7bb4476 100755
---- a/configure
-+++ b/configure
-@@ -3644,28 +3644,27 @@ static const char qt_configure_prefix_path_strs[][512 + 12] = {
-     "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
-     "qt_tstspath=$QT_SYSROOT_TESTS",
- #else
--    "qt_prfxpath=$QT_INSTALL_PREFIX",
--    "qt_docspath=$QT_INSTALL_DOCS",
--    "qt_hdrspath=$QT_INSTALL_HEADERS",
--    "qt_libspath=$QT_INSTALL_LIBS",
--    "qt_lbexpath=$QT_INSTALL_LIBEXECS",
--    "qt_binspath=$QT_INSTALL_BINS",
--    "qt_plugpath=$QT_INSTALL_PLUGINS",
--    "qt_impspath=$QT_INSTALL_IMPORTS",
--    "qt_qml2path=$QT_INSTALL_QML",
--    "qt_adatpath=$QT_INSTALL_ARCHDATA",
--    "qt_datapath=$QT_INSTALL_DATA",
--    "qt_trnspath=$QT_INSTALL_TRANSLATIONS",
--    "qt_xmplpath=$QT_INSTALL_EXAMPLES",
--    "qt_tstspath=$QT_INSTALL_TESTS",
--    "qt_ssrtpath=$CFG_SYSROOT",
--    "qt_hpfxpath=$QT_HOST_PREFIX",
--    "qt_hbinpath=$QT_HOST_BINS",
--    "qt_hlibpath=$QT_HOST_LIBS",
--    "qt_hdatpath=$QT_HOST_DATA",
--    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
--    "qt_targspec=$shortxspec",
--    "qt_hostspec=$shortspec",
-+    "qt_prfxpath=$QT_SYSROOT_PREFIX",
-+    "qt_docspath=$QT_SYSROOT_DOCS",
-+    "qt_hdrspath=$QT_SYSROOT_HEADERS",
-+    "qt_libspath=$QT_SYSROOT_LIBS",
-+    "qt_lbexpath=$QT_SYSROOT_LIBEXECS",
-+    "qt_binspath=$QT_SYSROOT_BINS",
-+    "qt_plugpath=$QT_SYSROOT_PLUGINS",
-+    "qt_impspath=$QT_SYSROOT_IMPORTS",
-+    "qt_qml2path=$QT_SYSROOT_QML",
-+    "qt_adatpath=$QT_SYSROOT_ARCHDATA",
-+    "qt_datapath=$QT_SYSROOT_DATA",
-+    "qt_trnspath=$QT_SYSROOT_TRANSLATIONS",
-+    "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
-+    "qt_tstspath=$QT_SYSROOT_TESTS",
-+    "qt_ssrtpath=",
-+    "qt_hpfxpath=$QT_SYSROOT_PREFIX",
-+    "qt_hbinpath=$QT_SYSROOT_BINS",
-+    "qt_hlibpath=$QT_SYSROOT_LIBS",
-+    "qt_hdatpath=$QT_SYSROOT_LIBS/qt5",
-+    "qt_targspec=linux-g++",
-+    "qt_hostspec=linux-g++",
- #endif
- };
- static const char qt_configure_settings_path_str[256 + 12] = "qt_stngpath=$QT_INSTALL_SETTINGS";
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
deleted file mode 100644
index 0b271a3..0000000
--- a/recipes-qt/qt5/qtbase-git/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6b980c8132800001b2f0c5c0e76f7cc7c60d14ee Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
- one
-
-Let configure script build the real qmake, but right after it's built, swap
-it with a native qmake for further internal use, preserving the real one.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/configure b/configure
-index c19ff6a..2d920e3 100755
---- a/configure
-+++ b/configure
-@@ -3879,6 +3879,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
- 
-     (cd "$outpath/qmake"; "$MAKE") || exit 2
- fi # Build qmake
-+mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
-+mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
- 
- echo "Running configuration tests..."
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake b/recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake
deleted file mode 100644
index 6f0042b..0000000
--- a/recipes-qt/qt5/qtbase-git/OEQt5Toolchain.cmake
+++ /dev/null
@@ -1 +0,0 @@
-set( OE_QMAKE_PATH_EXTERNAL_HOST_BINS $ENV{OE_QMAKE_PATH_HOST_BINS} )
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
new file mode 100644
index 0000000..f34aed4
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -0,0 +1,351 @@
+From 08f6be97c3f088fd8a2d752441c638093eedd990 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 15 Apr 2013 04:29:32 +0200
+Subject: [PATCH 01/12] Add linux-oe-g++ platform
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
+Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure                            |  66 ++++++++++++++++-------
+ mkspecs/features/configure.prf       |   4 +-
+ mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
+ mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
+ 4 files changed, 188 insertions(+), 22 deletions(-)
+ create mode 100644 mkspecs/linux-oe-g++/qmake.conf
+ create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
+
+diff --git a/configure b/configure
+index 6ce6753..0a00d6d 100755
+--- a/configure
++++ b/configure
+@@ -316,6 +316,16 @@ getQMakeConf()
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
+@@ -325,6 +335,16 @@ getXQMakeConf()
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
+@@ -541,21 +561,19 @@ fi
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
+@@ -3178,7 +3196,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+     [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
+ fi
+ 
+-QMAKE_CONF_COMPILER=`getXQMakeConf QMAKE_CXX`
++QMAKE_CONF_COMPILER=`getXQEvalMakeConf QMAKE_CXX`
+ 
+ TEST_COMPILER=$QMAKE_CONF_COMPILER
+ 
+@@ -3216,7 +3234,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+         exit 1
+     fi
+ fi
+-TEST_COMPILER_CXXFLAGS=`getXQMakeConf QMAKE_CXXFLAGS`
++TEST_COMPILER_CXXFLAGS=`getXQEvalMakeConf QMAKE_CXXFLAGS`
+ 
+ GCC_MACHINE_DUMP=
+ case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
+@@ -3687,6 +3705,14 @@ setBootstrapVariable()
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
+@@ -3725,14 +3751,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+         fi
+ 
+         [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
+-        setBootstrapVariable QMAKE_CC CC "$CC_TRANSFORM"
+-        setBootstrapVariable QMAKE_CXX CXX "$CC_TRANSFORM"
+-        setBootstrapVariable QMAKE_CFLAGS
+-        setBootstrapVariable QMAKE_CFLAGS_SPLIT_SECTIONS
+-        setBootstrapVariable QMAKE_CXXFLAGS
+-        setBootstrapVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
+-        setBootstrapVariable QMAKE_LFLAGS
+-        setBootstrapVariable QMAKE_LFLAGS_GCSECTIONS
++        setBootstrapEvalVariable QMAKE_CC CC "$CC_TRANSFORM"
++        setBootstrapEvalVariable QMAKE_CXX CXX "$CC_TRANSFORM"
++        setBootstrapEvalVariable QMAKE_CFLAGS
++        setBootstrapEvalVariable QMAKE_CFLAGS_SPLIT_SECTIONS
++        setBootstrapEvalVariable QMAKE_CXXFLAGS
++        setBootstrapEvalVariable QMAKE_CXXFLAGS_SPLIT_SECTIONS
++        setBootstrapEvalVariable QMAKE_LFLAGS
++        setBootstrapEvalVariable QMAKE_LFLAGS_GCSECTIONS
+ 
+         if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
+             setBootstrapVariable QMAKE_CFLAGS_RELEASE
+diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
+index 6b37a04..dcf6025 100644
+--- a/mkspecs/features/configure.prf
++++ b/mkspecs/features/configure.prf
+@@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
+     }
+ 
+     # Clean up after previous run
+-    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE distclean")
++    exists($$test_out_dir/Makefile):qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS) distclean")
+ 
+     mkpath($$test_out_dir)|error("Aborting.")
+ 
+     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) -spec $$QMAKESPEC $$qmake_configs $$shell_quote($$test_dir)") {
+-        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
++        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
+             log("yes$$escape_expand(\\n)")
+             msg = "test $$1 succeeded"
+             write_file($$QMAKE_CONFIG_LOG, msg, append)
+diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
+new file mode 100644
+index 0000000..2ad2810
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
++QMAKE_COMPILER = $(OE_QMAKE_COMPILER) gcc
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
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
new file mode 100644
index 0000000..ec2bcb4
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -0,0 +1,39 @@
+From 31fa051d53e26301ef6abf72bd3f992d7c16cad2 Mon Sep 17 00:00:00 2001
+From: Holger Freyther <zecke@selfish.org>
+Date: Wed, 26 Sep 2012 17:22:30 +0200
+Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
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
+index d66007b..91ca643 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -138,7 +138,10 @@ QLibrarySettings::QLibrarySettings()
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
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
new file mode 100644
index 0000000..779ea91
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -0,0 +1,233 @@
+From cf4e996876e0b467b7aae124c7cb285f677bf6b0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 6 Apr 2013 13:15:07 +0200
+Subject: [PATCH 03/12] Add -external-hostbindir option
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
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ configure                                   | 15 +++++++++++++++
+ mkspecs/features/qt_functions.prf           |  6 +++++-
+ mkspecs/features/qt_tool.prf                |  4 ++--
+ qtbase.pro                                  | 13 ++++++++++---
+ src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
+ src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
+ src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
+ 7 files changed, 38 insertions(+), 12 deletions(-)
+
+diff --git a/configure b/configure
+index 0a00d6d..ad5f4cd 100755
+--- a/configure
++++ b/configure
+@@ -770,6 +770,7 @@ QT_HOST_BINS=
+ QT_HOST_LIBS=
+ QT_HOST_DATA=
+ QT_EXT_PREFIX=
++QT_EXTERNAL_HOST_BINS=
+ 
+ #flags for SQL drivers
+ QT_CFLAGS_PSQL=
+@@ -889,6 +890,7 @@ while [ "$#" -gt 0 ]; do
+     -testsdir| \
+     -hostdatadir| \
+     -hostbindir| \
++    -external-hostbindir| \
+     -hostlibdir| \
+     -extprefix| \
+     -sysroot| \
+@@ -1107,6 +1109,9 @@ while [ "$#" -gt 0 ]; do
+     extprefix)
+         QT_EXT_PREFIX="$VAL"
+         ;;
++    external-hostbindir)
++        QT_EXTERNAL_HOST_BINS="$VAL"
++        ;;
+     pkg-config)
+         if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
+             CFG_PKGCONFIG="$VAL"
+@@ -2270,6 +2275,10 @@ Installation options:
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
+@@ -2949,6 +2958,11 @@ fi
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
+@@ -3649,6 +3663,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+     "qt_hbinpath=$QT_HOST_BINS",
+     "qt_hlibpath=$QT_HOST_LIBS",
+     "qt_hdatpath=$QT_HOST_DATA",
++    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
+     "qt_targspec=$shortxspec",
+     "qt_hostspec=$shortspec",
+ #endif
+diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
+index 79b4eab..8c6913e 100644
+--- a/mkspecs/features/qt_functions.prf
++++ b/mkspecs/features/qt_functions.prf
+@@ -198,7 +198,11 @@ defineTest(qtAddRpathLink) {
+ defineTest(qtPrepareTool) {
+     cmd = $$eval(QT_TOOL.$${2}.binary)
+     isEmpty(cmd) {
+-        cmd = $$[QT_HOST_BINS]/$$2
++        QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
++        isEmpty(QT_EXTERNAL_HOST_BINS): \
++            cmd = $$[QT_HOST_BINS]/$$2
++        else: \
++            cmd = $$[QT_EXTERNAL_HOST_BINS]/$$2
+         exists($${cmd}.pl) {
+             cmd = perl -w $$system_path($${cmd}.pl)
+         } else: contains(QMAKE_HOST.os, Windows) {
+diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
+index 1d3e88c..9b26adf 100644
+--- a/mkspecs/features/qt_tool.prf
++++ b/mkspecs/features/qt_tool.prf
+@@ -12,11 +12,11 @@
+ load(qt_app)
+ 
+ CONFIG += console
++QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
+ 
+ # If we are doing a prefix build, create a "module" pri which enables
+ # qtPrepareTool() to work with the non-installed build.
+-# Non-bootstrapped tools always need this because of the environment setup.
+-!build_pass:if(!host_build|!force_bootstrap|force_independent) {
++!build_pass:if(!host_build|!force_bootstrap|force_independent):isEmpty(QT_EXTERNAL_HOST_BINS) {
+     isEmpty(MODULE):MODULE = $$TARGET
+ 
+     !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
+diff --git a/qtbase.pro b/qtbase.pro
+index 6d0de44..ddf7478 100644
+--- a/qtbase.pro
++++ b/qtbase.pro
+@@ -69,18 +69,25 @@ CONFIG -= qt
+ 
+ ### installations ####
+ 
++QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
++
+ #qmake
+ qmake.path = $$[QT_HOST_BINS]
++qmake.files = $$OUT_PWD/bin/qmake
++!isEmpty(QT_EXTERNAL_HOST_BINS) {
++   qmake.files = $$[QT_EXTERNAL_HOST_BINS]/qmake
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
++!isEmpty(QT_EXTERNAL_HOST_BINS) {
++   syncqt.files = $$[QT_EXTERNAL_HOST_BINS]/syncqt.pl
++}
+ INSTALLS += syncqt
+ 
+ # If we are doing a prefix build, create a "module" pri which enables
+diff --git a/src/corelib/Qt5CoreConfigExtras.cmake.in b/src/corelib/Qt5CoreConfigExtras.cmake.in
+index 7213a84..a977417 100644
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
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
new file mode 100644
index 0000000..c586775
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -0,0 +1,114 @@
+From bf9f8df42f5a7ac4a0cb4bdad8c849228aa79b35 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 27 Apr 2013 23:15:37 +0200
+Subject: [PATCH 04/12] qt_module: Fix pkgconfig and libtool replacements
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* in situation like this:
+  QT_SYSROOT:/OE/oe-core/tmp-eglibc/sysroots/qemuarm
+  QT_INSTALL_LIBS:/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib
+  QT_INSTALL_LIBS/raw:/usr/lib
+  QT_INSTALL_LIBS/get:/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib
+
+  I don't want the replacement like this:
+  sed
+    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/include,/usr/include/qt5,g"
+    -e "s,/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/build/lib,/usr/lib,g"
+    "../../lib/pkgconfig/Qt5Core.pc"
+    >"/OE/oe-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/qtbase/5.0.0-r0.0/image/OE/oe-core/tmp-eglibc/sysroots/qemuarm/usr/lib/pkgconfig/Qt5Core.pc"
+  because that way I'll end with -L/usr/lib in .pc file which is
+  cross-compile unfriendly, keeping ${libdir}/${includedir} works better
+  in my case
+
+* qt_module: Fix paths in .prl files
+* qmake does not prefix them with QT_SYSROOT when using them
+  so e.g. when building qtdeclarative we get -L/usr/lib to LINKAGE
+  variable, which is unsafe for cross-compilation
+* writting QT_SYSROOT in .prl files is dangerous for sstate when
+  builds are in different directories, so we need
+  SSTATE_SCAN_FILES += "*.pri *.prl"
+  to make them relocateble
+
+* fix paths in packageconfig files
+  This reverts parts of:
+
+  enable path replacement in installed prl files on all platforms
+
+  Task-number: QTBUG-33794
+  Change-Id: Id0d38715673b8a1c0c034e9c15783eb255c4315b
+  Reviewed-by: Joerg Bornemann <joerg.bornemann@digia.com>
+
+* to debug this, rebuild qtbase and read build/src/corelib/Makefile
+* this is example of broken install_target rule (added line feeds):
+  -$(SED) -e s,/OE/5.3.1-r0/build/lib,/usr/lib,g
+          -e 's,/OE/5.3.1-r0/build/include,$$\{includedir},g'
+          -e 's,/OE/5.3.1-r0/build/lib,$$\{libdir},g'
+     "../../lib/pkgconfig/Qt5Core.pc"
+     >"$(INSTALL_ROOT)/usr/lib/pkgconfig/Qt5Core.pc"
+  change .prf files, create copy of WORKDIR, re-excecute only
+  do_configure task and compare generated Makefile, repeat until
+  replace in generated Makefile works ok, then refresh patch and
+  try complete rebuild for qtbase
+* if everything is ok, then try:
+  image $ grep -R "\-L/usr" .
+  image $ grep -R "\-I/usr" .
+  and it should return only few cases of
+  qmake.conf:QMAKE_LFLAGS_THREAD     = -L/usr/lib/threads
+  for aix* platformas
+
+Change-Id: Ie1c94b15f2a4e736b65b4d0924d99eb2a7d92a6c
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ mkspecs/features/qt_common.prf |  2 +-
+ mkspecs/features/qt_module.prf | 15 +++++++++++++++
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
+index eb65e73..4db40d0 100644
+--- a/mkspecs/features/qt_common.prf
++++ b/mkspecs/features/qt_common.prf
+@@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
+         lib_replace.replace =
+     } else {
+         lib_replace.match = $$rplbase/lib
+-        lib_replace.replace = $$qt_libdir
++        lib_replace.replace = "\$$\\{libdir}"
+     }
+     lib_replace.CONFIG = path
+     QMAKE_PRL_INSTALL_REPLACE += lib_replace
+diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
+index 2437efe..2e1f014 100644
+--- a/mkspecs/features/qt_module.prf
++++ b/mkspecs/features/qt_module.prf
+@@ -192,10 +192,25 @@ unix|mingw {
+         QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
+     QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
+ 
++    pkgconfig_include_replace.match = $$rplbase/include
++    pkgconfig_include_replace.replace = "\$$\\{includedir}"
++    pkgconfig_include_replace.CONFIG = path
++    QMAKE_PKGCONFIG_INSTALL_REPLACE += pkgconfig_include_replace
++
+     unix {
+         CONFIG += create_libtool explicitlib
+         QMAKE_LIBTOOL_LIBDIR = $$qt_libdir
+         QMAKE_LIBTOOL_INSTALL_REPLACE += lib_replace
++        # add '=' as sysroot in .la files
++        lafile_replace.match = "-L\$${libdir}"
++        lafile_replace.replace = "-L=\$$\\{libdir}"
++        lafile_replace.CONFIG = path
++        QMAKE_LIBTOOL_INSTALL_REPLACE += lafile_replace
++        # drop -L/usr/lib in .prl files
++        prl_replace.match = "-L\$${libdir}"
++        prl_replace.replace = ""
++        prl_replace.CONFIG = path
++        QMAKE_PRL_INSTALL_REPLACE += prl_replace
+     }
+ }
+ 
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
new file mode 100644
index 0000000..9723bea
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0005-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -0,0 +1,97 @@
+From f8a4e063b45b5b941738dd90ea7c74063bc1e49f Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 21 Apr 2014 19:22:04 +0200
+Subject: [PATCH 05/12] Revert "eglfs: Print the chosen config in debug mode"
+
+With this change the build is failing with:
+| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
+|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/egl.h:36,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext_p.h:51,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext.cpp:34:
+| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:10: error: expected identifier before 'int'
+|      enum Status {
+|           ^
+| In file included from ../../include/QtCore/qtextstream.h:1:0,
+|                  from ../../include/QtCore/../../../git/src/corelib/io/qdebug.h:42,
+|                  from ../../include/QtCore/qdebug.h:1,
+|                  from ../../include/QtCore/QDebug:1,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformcontext.cpp:40:
+| ../../include/QtCore/../../../git/src/corelib/io/qtextstream.h:72:17: error: expected unqualified-id before '{' token
+|      enum Status {
+|                  ^
+| Makefile:3896: recipe for target '.obj/qeglplatformcontext.o' failed
+| make[2]: *** [.obj/qeglplatformcontext.o] Error 1
+| make[2]: *** Waiting for unfinished jobs....
+| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:196:5: error: 'Display' redeclared as different kind of symbol
+|      Display
+|      ^
+| In file included from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/eglplatform.h:118:0,
+|                  from /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/EGL/egl.h:36,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration_p.h:51,
+|                  from /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:55:
+| /OE/build/oe-core/tmp-glibc/sysroots/qemux86-64/usr/include/X11/Xlib.h:499:26: note: previous declaration 'typedef struct _XDisplay Display'
+|  typedef struct _XDisplay Display;
+|                           ^
+| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp: In member function 'virtual void* QEGLPlatformIntegration::nativeResourceForScreen(const QByteArray&, QScreen*)':
+| /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/qtbase/5.3.0+5.4.0-alpha1+gitAUTOINC+8456adf0ee-r0/git/src/platformsupport/eglconvenience/qeglplatformintegration.cpp:239:17: error: expected primary-expression before ':' token
+|      case Display:
+|                  ^
+| Makefile:5486: recipe for target '.obj/qeglplatformintegration.o' failed
+
+This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
+
+Will be partially resolved in newer revision with:
+https://codereview.qt-project.org/96220
+
+Change-Id: I7a6a926b7525d4f137824c71f2ec8cd089c21f13
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
+ src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
+ 2 files changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
+index c1a491c..7a0fc87 100644
+--- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
++++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
+@@ -443,9 +443,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
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
+ #ifdef Q_OS_UNIX
+diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
+index 7cc3300..ccbd974a 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
++++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
+@@ -37,7 +37,6 @@
+ #include <qpa/qplatformwindow.h>
+ #include <QOpenGLContext>
+ #include <QtPlatformHeaders/QEGLNativeContext>
+-#include <QDebug>
+ 
+ QT_BEGIN_NAMESPACE
+ 
+@@ -181,12 +180,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
+         return;
+     }
+ 
+-    static const bool printConfig = qgetenv("QT_QPA_EGLFS_DEBUG").toInt();
+-    if (printConfig) {
+-        qDebug() << "Created context for format" << format << "with config:";
+-        q_printEglConfig(m_eglDisplay, m_eglConfig);
+-    }
+-
+     updateFormatFromGL();
+ }
+ 
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
new file mode 100644
index 0000000..04fb370
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -0,0 +1,30 @@
+From 6061c8457ea1f76745bd9918e61bda01ef96ce56 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Wed, 19 Mar 2014 18:32:28 +0100
+Subject: [PATCH 06/12] qeglplatformintegration: Undefine CursorShape from X.h
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/platformsupport/eglconvenience/qeglplatformintegration_p.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
+index 2b5d5f5..a0aab03 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
++++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
+@@ -50,6 +50,12 @@
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
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
new file mode 100644
index 0000000..be75d72
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0007-configure-bump-path-length-from-256-to-512-character.patch
@@ -0,0 +1,29 @@
+From a6b01490248be28c1db3abd5f710c5d7d9afee55 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 11 Nov 2013 20:27:30 -0500
+Subject: [PATCH 07/12] configure: bump path length from 256 to 512 characters
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
+index ad5f4cd..c19ff6a 100755
+--- a/configure
++++ b/configure
+@@ -3627,7 +3627,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+ static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
+ 
+ /* Installation Info */
+-static const char qt_configure_prefix_path_strs[][256 + 12] = {
++static const char qt_configure_prefix_path_strs[][512 + 12] = {
+ #ifndef QT_BUILD_QMAKE
+     "qt_prfxpath=$QT_SYSROOT_PREFIX",
+     "qt_docspath=$QT_SYSROOT_DOCS",
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
new file mode 100644
index 0000000..e4d4327
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -0,0 +1,72 @@
+From d1712999887b9809cce57b1e6c008c454330cd2e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 5 Feb 2014 18:35:08 +0100
+Subject: [PATCH 08/12] eglfs: fix egl error for platforms only supporting one
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
+index 39a3ef9..2c05979 100644
+--- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
++++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
+@@ -68,6 +68,15 @@ void QEglFSWindow::create()
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
+@@ -81,7 +90,7 @@ void QEglFSWindow::create()
+             return;
+         }
+ 
+-#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK)
++#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK) || defined(EGL_API_FB)
+         // We can have either a single OpenGL window or multiple raster windows.
+         // Other combinations cannot work.
+         qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
+@@ -101,6 +110,11 @@ void QEglFSWindow::create()
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
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
new file mode 100644
index 0000000..bebb3d9
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0009-QOpenGLPaintDevice-sub-area-support.patch
@@ -0,0 +1,157 @@
+From a34538ff13c520fa85df689255469a316f037d0d Mon Sep 17 00:00:00 2001
+From: Jani Hautakangas <jani.hautakangas@ixonos.com>
+Date: Thu, 16 May 2013 09:52:07 +0300
+Subject: [PATCH 09/12] QOpenGLPaintDevice sub-area support
+
+Allows creating QOpenGLPaintDevice targetting sub-area
+of binded framebuffer.
+
+Upstream-Status: Pending
+
+Change-Id: Ida2f079aa1ac0b87d36b54129e226399dbcdda80
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/gui/opengl/qopenglpaintdevice.cpp       | 11 +++++++++++
+ src/gui/opengl/qopenglpaintdevice.h         |  2 ++
+ src/gui/opengl/qopenglpaintdevice_p.h       |  1 +
+ src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
+ src/gui/opengl/qopenglpaintengine_p.h       |  1 +
+ src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
+ 6 files changed, 23 insertions(+), 3 deletions(-)
+
+diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
+index a08d26f..cff3155 100644
+--- a/src/gui/opengl/qopenglpaintdevice.cpp
++++ b/src/gui/opengl/qopenglpaintdevice.cpp
+@@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
+ {
+ }
+ 
++QOpenGLPaintDevice::QOpenGLPaintDevice(int x, int y, int width, int height)
++    : d_ptr(new QOpenGLPaintDevicePrivate(QSize(width, height)))
++{
++    d_ptr->offset = QPoint(x,y);
++}
++
+ /*!
+     \internal
+  */
+@@ -212,6 +218,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
+     return d_ptr->ctx;
+ }
+ 
++QPoint QOpenGLPaintDevice::offset() const
++{
++    return d_ptr->offset;
++}
++
+ /*!
+     Returns the pixel size of the paint device.
+ 
+diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
+index 10cee84..a6683c5 100644
+--- a/src/gui/opengl/qopenglpaintdevice.h
++++ b/src/gui/opengl/qopenglpaintdevice.h
+@@ -53,12 +53,14 @@ public:
+     QOpenGLPaintDevice();
+     explicit QOpenGLPaintDevice(const QSize &size);
+     QOpenGLPaintDevice(int width, int height);
++    QOpenGLPaintDevice(int x, int y, int width, int height);
+     virtual ~QOpenGLPaintDevice();
+ 
+     int devType() const { return QInternal::OpenGL; }
+     QPaintEngine *paintEngine() const;
+ 
+     QOpenGLContext *context() const;
++    QPoint offset() const;
+     QSize size() const;
+     void setSize(const QSize &size);
+     void setDevicePixelRatio(qreal devicePixelRatio);
+diff --git a/src/gui/opengl/qopenglpaintdevice_p.h b/src/gui/opengl/qopenglpaintdevice_p.h
+index 0b01129..211f2f3 100644
+--- a/src/gui/opengl/qopenglpaintdevice_p.h
++++ b/src/gui/opengl/qopenglpaintdevice_p.h
+@@ -65,6 +65,7 @@ public:
+ 
+ public:
+     QSize size;
++    QPoint offset;
+     QOpenGLContext *ctx;
+ 
+     qreal dpmx;
+diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
+index 8eeaa31..e17520e 100644
+--- a/src/gui/opengl/qopenglpaintengine.cpp
++++ b/src/gui/opengl/qopenglpaintengine.cpp
+@@ -2080,7 +2080,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+     for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
+         d->vertexAttributeArraysEnabledState[i] = false;
+ 
++    const QPoint offset = d->device->offset();
+     const QSize sz = d->device->size();
++    d->x = offset.x();
++    d->y = offset.y();
+     d->width = sz.width();
+     d->height = sz.height();
+     d->mode = BrushDrawingMode;
+@@ -2167,7 +2170,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+         d->device->ensureActiveTarget();
+ 
+         d->transferMode(BrushDrawingMode);
+-        d->funcs.glViewport(0, 0, d->width, d->height);
++        d->funcs.glViewport(d->x, d->y, d->width, d->height);
+         d->needsSync = false;
+         d->shaderManager->setDirty();
+         d->syncGlState();
+@@ -2209,6 +2212,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+     if (bounds == QRect(0, 0, width, height)) {
+         funcs.glDisable(GL_SCISSOR_TEST);
+     } else {
++        bounds = QRect(bounds.x(), bounds.y(), bounds.width(), bounds.height());
+         funcs.glEnable(GL_SCISSOR_TEST);
+         setScissor(bounds);
+     }
+@@ -2217,12 +2221,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+ 
+ void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
+ {
+-    const int left = rect.left();
++    const int left = rect.left() + x;
+     const int width = rect.width();
+     int bottom = height - (rect.top() + rect.height());
+     if (device->paintFlipped()) {
+         bottom = rect.top();
+     }
++    bottom += y;
+     const int height = rect.height();
+ 
+     funcs.glScissor(left, bottom, width, height);
+diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
+index 9722ea3..07e3163 100644
+--- a/src/gui/opengl/qopenglpaintengine_p.h
++++ b/src/gui/opengl/qopenglpaintengine_p.h
+@@ -264,6 +264,7 @@ public:
+     QOpenGL2PaintEngineEx* q;
+     QOpenGLEngineShaderManager* shaderManager;
+     QOpenGLPaintDevice* device;
++    int x, y;
+     int width, height;
+     QOpenGLContext *ctx;
+     EngineMode mode;
+diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
+index cd268cd..997bc35 100644
+--- a/src/gui/opengl/qopengltextureglyphcache.cpp
++++ b/src/gui/opengl/qopengltextureglyphcache.cpp
+@@ -310,7 +310,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+     funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
+ 
+     if (pex != 0) {
+-        funcs->glViewport(0, 0, pex->width, pex->height);
++        funcs->glViewport(pex->x, pex->y, pex->width, pex->height);
+         pex->updateClipScissorTest();
+     } else {
+         if (m_vao.isCreated()) {
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch b/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
new file mode 100644
index 0000000..f2eed11
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0010-Make-Qt5GuiConfigExtras.cmake-find-gl-es-include-dir.patch
@@ -0,0 +1,42 @@
+From 16a55457ce31d467cb331ab8e94b672757ef42b9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 18 Dec 2014 13:41:09 +0100
+Subject: [PATCH 10/12] Make Qt5GuiConfigExtras.cmake find gl(es) include dir
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+In configure QMAKE_INCDIR_OPENGL is set with pkg-config. Without
+PKG_CONFIG_ALLOW_SYSTEM_CFLAGS set, pkg-config returns paths outside
+/usr/include only (in my case /usr/include/libdrm). With NO_DEFAULT_PATH set
+gl(es) include directories cannot be found. Cmake builds depending on
+Qt5Gui error out with
+
+| Failed to find "GLES2/gl2.h" in "/usr/include/libdrm"
+
+Upstream-Status: submitted [1]
+
+[1] https://bugreports.qt-project.org/browse/QTBUG-43445
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/gui/Qt5GuiConfigExtras.cmake.in | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/gui/Qt5GuiConfigExtras.cmake.in b/src/gui/Qt5GuiConfigExtras.cmake.in
+index 9a846d4..07869ef 100644
+--- a/src/gui/Qt5GuiConfigExtras.cmake.in
++++ b/src/gui/Qt5GuiConfigExtras.cmake.in
+@@ -57,9 +57,6 @@ set(Qt5Gui_OPENGL_LIBRARIES Qt5::Gui_GLESv2)
+ set(_GL_INCDIRS $$CMAKE_GL_INCDIRS)
+ find_path(_qt5gui_OPENGL_INCLUDE_DIR $$CMAKE_GL_HEADER_NAME
+     PATHS ${_GL_INCDIRS}
+-!!IF !mac
+-    NO_DEFAULT_PATH
+-!!ENDIF
+ )
+ if (NOT _qt5gui_OPENGL_INCLUDE_DIR)
+     message(FATAL_ERROR \"Failed to find \\\"$$CMAKE_GL_HEADER_NAME\\\" in \\\"${_GL_INCDIRS}\\\".\")
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
new file mode 100644
index 0000000..da17878
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
@@ -0,0 +1,31 @@
+From 5a6ad20dd4fde6a0581be895d763aae43f1fc2b6 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 16 Nov 2013 00:32:30 +0100
+Subject: [PATCH 11/13] Always build uic
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
+index 83f7587..9dbcf70 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -163,7 +163,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+         }
+     }
+ }
+-SUBDIRS += src_plugins src_tools_qdoc
++SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
+ 
+ nacl: SUBDIRS -= src_network src_testlib
+ 
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
new file mode 100644
index 0000000..96198b1
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -0,0 +1,68 @@
+From 6c0cc990522454e0c9e52ba969c3a8c5937157b8 Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 29 Oct 2012 20:07:49 -0700
+Subject: [PATCH 11/12] qmake: don't build it in configure, but allow to build
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
+ configure       | 2 +-
+ qmake/qmake.pri | 3 ++-
+ qmake/qmake.pro | 2 ++
+ 3 files changed, 5 insertions(+), 2 deletions(-)
+---
+ configure       | 2 +-
+ qmake/qmake.pri | 3 ++-
+ qmake/qmake.pro | 1 +
+ 3 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/configure b/configure
+index c19ff6a..7a34b11 100755
+--- a/configure
++++ b/configure
+@@ -3729,7 +3729,7 @@ setBootstrapEvalVariable()
+ 
+ 
+ # build qmake
+-if true; then ###[ '!' -f "$outpath/bin/qmake" ];
++if false; then ###[ '!' -f "$outpath/bin/qmake" ];
+     echo "Creating qmake..."
+ 
+     mkdir -p "$outpath/qmake" || exit
+diff --git a/qmake/qmake.pri b/qmake/qmake.pri
+index 4de41d6..69982b7 100644
+--- a/qmake/qmake.pri
++++ b/qmake/qmake.pri
+@@ -82,7 +82,8 @@ bootstrap { #Qt code
+         qjsonparser.cpp \
+         qjsonarray.cpp \
+         qjsonobject.cpp \
+-        qjsonvalue.cpp
++        qjsonvalue.cpp \
++        qdebug.cpp
+ 
+    HEADERS+= \
+         qbitarray.h \
+diff --git a/qmake/qmake.pro b/qmake/qmake.pro
+index 89d6ea5..0ff4a96 100644
+--- a/qmake/qmake.pro
++++ b/qmake/qmake.pro
+@@ -8,6 +8,7 @@ CONFIG -= qt
+ DEFINES += \
+     QT_BUILD_QMAKE \
+     PROEVALUATOR_FULL
++TARGET = qmake
+ 
+ VPATH += \
+     ../src/corelib/global \
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
new file mode 100644
index 0000000..4c044c0
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
@@ -0,0 +1,108 @@
+From 6425d71d52c5587f323fe28af62530d5c82b02fd Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 6 Apr 2013 13:15:07 +0200
+Subject: [PATCH 12/13] Add -external-hostbindir option for native(sdk)
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
+Change-Id: I4f6e634bf0b2cb96065ee5c38b9cd8a224c3bd37
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ qmake/property.cpp                  | 1 +
+ src/corelib/global/qlibraryinfo.cpp | 3 ++-
+ src/corelib/global/qlibraryinfo.h   | 1 +
+ tools/configure/configureapp.cpp    | 8 ++++++++
+ 4 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/qmake/property.cpp b/qmake/property.cpp
+index 051e056..50da6ed 100644
+--- a/qmake/property.cpp
++++ b/qmake/property.cpp
+@@ -67,6 +67,7 @@ static const struct {
+     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
+     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
+     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
++    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
+     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
+     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
+ };
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index 91ca643..7a567fa 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -348,7 +348,7 @@ QLibraryInfo::isDebugBuild()
+  */
+ 
+ static const struct {
+-    char key[19], value[13];
++    char key[21], value[13];
+ } qtConfEntries[] = {
+     { "Prefix", "." },
+     { "Documentation", "doc" }, // should be ${Data}/doc
+@@ -374,6 +374,7 @@ static const struct {
+     { "HostBinaries", "bin" },
+     { "HostLibraries", "lib" },
+     { "HostData", "." },
++    { "ExternalHostBinaries", "" },
+     { "TargetSpec", "" },
+     { "HostSpec", "" },
+ #endif
+diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
+index 543c4b3..a02e03a 100644
+--- a/src/corelib/global/qlibraryinfo.h
++++ b/src/corelib/global/qlibraryinfo.h
+@@ -80,6 +80,7 @@ public:
+         HostBinariesPath,
+         HostLibrariesPath,
+         HostDataPath,
++        ExternalHostBinariesPath,
+         TargetSpecPath,
+         HostSpecPath,
+         LastHostPath = HostSpecPath,
+diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
+index 6e9d4aa..0ca4daf 100644
+--- a/tools/configure/configureapp.cpp
++++ b/tools/configure/configureapp.cpp
+@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
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
+@@ -4004,6 +4011,7 @@ void Configure::generateQConfigCpp()
+                   << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
+                   << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
+                   << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
++                  << "    \"qt_ebinpath=" << formatPath(dictionary["QT_EXTERNAL_HOST_BINS"]) << "\"," << endl
+                   << "    \"qt_targspec=" << targSpec << "\"," << endl
+                   << "    \"qt_hostspec=" << hostSpec << "\"," << endl
+                   << "#endif" << endl
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch b/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
new file mode 100644
index 0000000..0a7eb15
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0012-Set-paths-for-target-properly.patch
@@ -0,0 +1,72 @@
+From 84c23fc01b28087de35604ef971227b57fb77876 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Thu, 22 Jan 2015 16:09:35 +0100
+Subject: [PATCH 12/12] Set paths for target properly
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure | 43 +++++++++++++++++++++----------------------
+ 1 file changed, 21 insertions(+), 22 deletions(-)
+
+diff --git a/configure b/configure
+index 7a34b11..7bb4476 100755
+--- a/configure
++++ b/configure
+@@ -3644,28 +3644,27 @@ static const char qt_configure_prefix_path_strs[][512 + 12] = {
+     "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
+     "qt_tstspath=$QT_SYSROOT_TESTS",
+ #else
+-    "qt_prfxpath=$QT_INSTALL_PREFIX",
+-    "qt_docspath=$QT_INSTALL_DOCS",
+-    "qt_hdrspath=$QT_INSTALL_HEADERS",
+-    "qt_libspath=$QT_INSTALL_LIBS",
+-    "qt_lbexpath=$QT_INSTALL_LIBEXECS",
+-    "qt_binspath=$QT_INSTALL_BINS",
+-    "qt_plugpath=$QT_INSTALL_PLUGINS",
+-    "qt_impspath=$QT_INSTALL_IMPORTS",
+-    "qt_qml2path=$QT_INSTALL_QML",
+-    "qt_adatpath=$QT_INSTALL_ARCHDATA",
+-    "qt_datapath=$QT_INSTALL_DATA",
+-    "qt_trnspath=$QT_INSTALL_TRANSLATIONS",
+-    "qt_xmplpath=$QT_INSTALL_EXAMPLES",
+-    "qt_tstspath=$QT_INSTALL_TESTS",
+-    "qt_ssrtpath=$CFG_SYSROOT",
+-    "qt_hpfxpath=$QT_HOST_PREFIX",
+-    "qt_hbinpath=$QT_HOST_BINS",
+-    "qt_hlibpath=$QT_HOST_LIBS",
+-    "qt_hdatpath=$QT_HOST_DATA",
+-    "qt_ebinpath=$QT_EXTERNAL_HOST_BINS",
+-    "qt_targspec=$shortxspec",
+-    "qt_hostspec=$shortspec",
++    "qt_prfxpath=$QT_SYSROOT_PREFIX",
++    "qt_docspath=$QT_SYSROOT_DOCS",
++    "qt_hdrspath=$QT_SYSROOT_HEADERS",
++    "qt_libspath=$QT_SYSROOT_LIBS",
++    "qt_lbexpath=$QT_SYSROOT_LIBEXECS",
++    "qt_binspath=$QT_SYSROOT_BINS",
++    "qt_plugpath=$QT_SYSROOT_PLUGINS",
++    "qt_impspath=$QT_SYSROOT_IMPORTS",
++    "qt_qml2path=$QT_SYSROOT_QML",
++    "qt_adatpath=$QT_SYSROOT_ARCHDATA",
++    "qt_datapath=$QT_SYSROOT_DATA",
++    "qt_trnspath=$QT_SYSROOT_TRANSLATIONS",
++    "qt_xmplpath=$QT_SYSROOT_EXAMPLES",
++    "qt_tstspath=$QT_SYSROOT_TESTS",
++    "qt_ssrtpath=",
++    "qt_hpfxpath=$QT_SYSROOT_PREFIX",
++    "qt_hbinpath=$QT_SYSROOT_BINS",
++    "qt_hlibpath=$QT_SYSROOT_LIBS",
++    "qt_hdatpath=$QT_SYSROOT_LIBS/qt5",
++    "qt_targspec=linux-g++",
++    "qt_hostspec=linux-g++",
+ #endif
+ };
+ static const char qt_configure_settings_path_str[256 + 12] = "qt_stngpath=$QT_INSTALL_SETTINGS";
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
new file mode 100644
index 0000000..0b271a3
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0013-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -0,0 +1,30 @@
+From 6b980c8132800001b2f0c5c0e76f7cc7c60d14ee Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 11 Nov 2013 20:22:34 -0500
+Subject: [PATCH 13/13] configure: preserve built qmake and swap with native
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
+index c19ff6a..2d920e3 100755
+--- a/configure
++++ b/configure
+@@ -3879,6 +3879,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+ 
+     (cd "$outpath/qmake"; "$MAKE") || exit 2
+ fi # Build qmake
++mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
++mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
+ 
+ echo "Running configuration tests..."
+ 
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake b/recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake
new file mode 100644
index 0000000..6f0042b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/OEQt5Toolchain.cmake
@@ -0,0 +1 @@
+set( OE_QMAKE_PATH_EXTERNAL_HOST_BINS $ENV{OE_QMAKE_PATH_HOST_BINS} )
diff --git a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
deleted file mode 100644
index 1603100..0000000
--- a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 1abe7b1d4de10ba3739db8a685661e99fb274a00 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
-Date: Sun, 26 May 2013 14:26:19 +0200
-Subject: [PATCH] qmltestexample: fix link
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-else we get :
-ld: warning: libQt5Quick.so.5, needed by libQt5QuickTest.so, not found
-
-Upstream-Status: Inappropriate
-
-Change-Id: I63088ff73bec6a8559dfae132f8bd40b62487450
-Signed-off-by: Eric Bénard <eric@eukrea.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- examples/qmltest/qmltest/qmltest.pro         | 2 +-
- tests/auto/qml/qjsengine/qjsengine.pro       | 2 +-
- tests/auto/qml/qtqmlmodules/qtqmlmodules.pro | 2 +-
- tests/auto/qmltest/qmltest.pro               | 1 +
- tools/qmltestrunner/qmltestrunner.pro        | 2 +-
- 5 files changed, 5 insertions(+), 4 deletions(-)
-
-diff --git a/examples/qmltest/qmltest/qmltest.pro b/examples/qmltest/qmltest/qmltest.pro
-index b5893c5..1b00e6c 100644
---- a/examples/qmltest/qmltest/qmltest.pro
-+++ b/examples/qmltest/qmltest/qmltest.pro
-@@ -14,7 +14,7 @@ TESTDATA += tst_basic.qml tst_item.qml
- # This code exists solely for the purpose of building this example
- # inside the examples/ hierarchy.
- 
--QT += qml qmltest
-+QT += qml qmltest quick
- 
- macx: CONFIG -= app_bundle
- 
-diff --git a/tests/auto/qml/qjsengine/qjsengine.pro b/tests/auto/qml/qjsengine/qjsengine.pro
-index fc2452c..919710f 100644
---- a/tests/auto/qml/qjsengine/qjsengine.pro
-+++ b/tests/auto/qml/qjsengine/qjsengine.pro
-@@ -1,7 +1,7 @@
- CONFIG += testcase
- CONFIG += parallel_test
- TARGET = tst_qjsengine
--QT +=  qml qml-private widgets testlib gui-private
-+QT +=  qml qml-private widgets testlib gui-private quick
- macx:CONFIG -= app_bundle
- SOURCES += tst_qjsengine.cpp
- RESOURCES += qjsengine.qrc
-diff --git a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-index c6d442e..3181dcd 100644
---- a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-+++ b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
-@@ -8,5 +8,5 @@ macx:CONFIG -= app_bundle
- 
- TESTDATA = data/*
- 
--QT += core-private  qml-private testlib gui gui-private
-+QT += core-private  qml-private testlib gui gui-private quick
- DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
-diff --git a/tests/auto/qmltest/qmltest.pro b/tests/auto/qmltest/qmltest.pro
-index 7662cb1..a8f8ae2 100644
---- a/tests/auto/qmltest/qmltest.pro
-+++ b/tests/auto/qmltest/qmltest.pro
-@@ -4,6 +4,7 @@ CONFIG += qmltestcase
- CONFIG += console
- SOURCES += tst_qmltest.cpp
- 
-+QT += quick
- 
- importFiles.files = borderimage  buttonclick  createbenchmark  events  qqmlbinding selftests
- 
-diff --git a/tools/qmltestrunner/qmltestrunner.pro b/tools/qmltestrunner/qmltestrunner.pro
-index 1bb913e..56f2dd5 100644
---- a/tools/qmltestrunner/qmltestrunner.pro
-+++ b/tools/qmltestrunner/qmltestrunner.pro
-@@ -1,6 +1,6 @@
- SOURCES += main.cpp
- 
--QT += qml qmltest
-+QT += qml qmltest quick
- CONFIG += no_import_scan
- 
- load(qt_tool)
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
new file mode 100644
index 0000000..1603100
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -0,0 +1,88 @@
+From 1abe7b1d4de10ba3739db8a685661e99fb274a00 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
+Date: Sun, 26 May 2013 14:26:19 +0200
+Subject: [PATCH] qmltestexample: fix link
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+else we get :
+ld: warning: libQt5Quick.so.5, needed by libQt5QuickTest.so, not found
+
+Upstream-Status: Inappropriate
+
+Change-Id: I63088ff73bec6a8559dfae132f8bd40b62487450
+Signed-off-by: Eric Bénard <eric@eukrea.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ examples/qmltest/qmltest/qmltest.pro         | 2 +-
+ tests/auto/qml/qjsengine/qjsengine.pro       | 2 +-
+ tests/auto/qml/qtqmlmodules/qtqmlmodules.pro | 2 +-
+ tests/auto/qmltest/qmltest.pro               | 1 +
+ tools/qmltestrunner/qmltestrunner.pro        | 2 +-
+ 5 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/examples/qmltest/qmltest/qmltest.pro b/examples/qmltest/qmltest/qmltest.pro
+index b5893c5..1b00e6c 100644
+--- a/examples/qmltest/qmltest/qmltest.pro
++++ b/examples/qmltest/qmltest/qmltest.pro
+@@ -14,7 +14,7 @@ TESTDATA += tst_basic.qml tst_item.qml
+ # This code exists solely for the purpose of building this example
+ # inside the examples/ hierarchy.
+ 
+-QT += qml qmltest
++QT += qml qmltest quick
+ 
+ macx: CONFIG -= app_bundle
+ 
+diff --git a/tests/auto/qml/qjsengine/qjsengine.pro b/tests/auto/qml/qjsengine/qjsengine.pro
+index fc2452c..919710f 100644
+--- a/tests/auto/qml/qjsengine/qjsengine.pro
++++ b/tests/auto/qml/qjsengine/qjsengine.pro
+@@ -1,7 +1,7 @@
+ CONFIG += testcase
+ CONFIG += parallel_test
+ TARGET = tst_qjsengine
+-QT +=  qml qml-private widgets testlib gui-private
++QT +=  qml qml-private widgets testlib gui-private quick
+ macx:CONFIG -= app_bundle
+ SOURCES += tst_qjsengine.cpp
+ RESOURCES += qjsengine.qrc
+diff --git a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
+index c6d442e..3181dcd 100644
+--- a/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
++++ b/tests/auto/qml/qtqmlmodules/qtqmlmodules.pro
+@@ -8,5 +8,5 @@ macx:CONFIG -= app_bundle
+ 
+ TESTDATA = data/*
+ 
+-QT += core-private  qml-private testlib gui gui-private
++QT += core-private  qml-private testlib gui gui-private quick
+ DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
+diff --git a/tests/auto/qmltest/qmltest.pro b/tests/auto/qmltest/qmltest.pro
+index 7662cb1..a8f8ae2 100644
+--- a/tests/auto/qmltest/qmltest.pro
++++ b/tests/auto/qmltest/qmltest.pro
+@@ -4,6 +4,7 @@ CONFIG += qmltestcase
+ CONFIG += console
+ SOURCES += tst_qmltest.cpp
+ 
++QT += quick
+ 
+ importFiles.files = borderimage  buttonclick  createbenchmark  events  qqmlbinding selftests
+ 
+diff --git a/tools/qmltestrunner/qmltestrunner.pro b/tools/qmltestrunner/qmltestrunner.pro
+index 1bb913e..56f2dd5 100644
+--- a/tools/qmltestrunner/qmltestrunner.pro
++++ b/tools/qmltestrunner/qmltestrunner.pro
+@@ -1,6 +1,6 @@
+ SOURCES += main.cpp
+ 
+-QT += qml qmltest
++QT += qml qmltest quick
+ CONFIG += no_import_scan
+ 
+ load(qt_tool)
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
deleted file mode 100644
index e2a46df..0000000
--- a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ /dev/null
@@ -1,2369 +0,0 @@
-From 8b306a5a70d431b8e142b3a7efb32d897cb79ab5 Mon Sep 17 00:00:00 2001
-From: Yoann Lopes <yoann.lopes@digia.com>
-Date: Thu, 31 Oct 2013 15:06:30 +0100
-Subject: [PATCH] Initial porting effort to GStreamer 1.0.
-
-Imported from git@github.com:jhodapp/qtmultimedia.git
-
-Contributions from:
-Ilya Smelykh <ilya@videoexpertsgroup.com>
-Jim Hodapp <jim.hodapp@canonical.com>
-Sergio Schvezov <sergio.schvezov@canonical.com>
-
-Change-Id: I10fa5e5078efa4564ce833befd417008e26a90a9
-Reviewed-by: Yoann Lopes <yoann.lopes@digia.com>
-(cherry picked from commit d91dac090d92fdbc3a3425e8d969c62e5c79eff9)
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-Conflicts:
-	src/gsttools/qgstreamervideorenderer.cpp
-	src/gsttools/qgstreamervideowidget.cpp
-	src/gsttools/qgstreamervideowindow.cpp
-	src/plugins/gstreamer/camerabin/camerabinsession.cpp
-	src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-	src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
----
- config.tests/gstreamer/gstreamer.pro               |  11 +-
- config.tests/gstreamer_appsrc/gstreamer_appsrc.pro |  13 +-
- .../gstreamer_encodingprofiles.pro                 |  13 +-
- .../gstreamer_photography.pro                      |  15 +-
- qtmultimedia.pro                                   |  25 ++-
- src/gsttools/gsttools.pro                          |  22 +--
- src/gsttools/gstvideoconnector.c                   | 199 +++++++++++++++++++--
- src/gsttools/qgstappsrc.cpp                        |  29 ++-
- src/gsttools/qgstreameraudioprobecontrol.cpp       |  19 +-
- src/gsttools/qgstreamerbushelper.cpp               |   8 +
- src/gsttools/qgstreamervideoprobecontrol.cpp       |   9 +
- src/gsttools/qgstreamervideorenderer.cpp           |   3 +-
- src/gsttools/qgstreamervideowidget.cpp             |  29 ++-
- src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
- src/gsttools/qgstutils.cpp                         |  27 ++-
- src/gsttools/qgstvideobuffer.cpp                   |  18 +-
- src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
- src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
- .../qgstreameraudioprobecontrol_p.h                |   5 +-
- .../qgstreamervideoprobecontrol_p.h                |   4 +
- .../gsttools_headers/qgstreamervideowindow_p.h     |   4 +
- src/multimedia/gsttools_headers/qgstutils_p.h      |   4 +
- .../gsttools_headers/qgstvideobuffer_p.h           |   3 +
- .../gsttools_headers/qvideosurfacegstsink_p.h      |   6 +-
- .../qgstreameraudiodecoderserviceplugin.cpp        |  27 ++-
- .../audiodecoder/qgstreameraudiodecodersession.cpp |  33 +++-
- .../gstreamer/camerabin/camerabinsession.cpp       |  25 +++
- src/plugins/gstreamer/common.pri                   |  21 ++-
- src/plugins/gstreamer/gstreamer.pro                |   3 +-
- .../mediacapture/qgstreamercapturesession.cpp      |   5 +
- src/plugins/gstreamer/mediaplayer/mediaplayer.pro  |   1 -
- .../mediaplayer/qgstreamerplayercontrol.cpp        |   2 +
- .../mediaplayer/qgstreamerplayerservice.cpp        |   9 +-
- .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
- .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++--
- .../mediaplayer/qgstreamerplayersession.h          |   9 +
- 36 files changed, 871 insertions(+), 129 deletions(-)
-
-diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstreamer/gstreamer.pro
-index 02a7e34..6b9843a 100644
---- a/config.tests/gstreamer/gstreamer.pro
-+++ b/config.tests/gstreamer/gstreamer.pro
-@@ -3,11 +3,10 @@ SOURCES += main.cpp
- CONFIG += link_pkgconfig
- 
- PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
- 
- 
-diff --git a/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro b/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
-index 9f61703..0f3ca2b 100644
---- a/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
-+++ b/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
-@@ -3,11 +3,8 @@ SOURCES += main.cpp
- CONFIG += link_pkgconfig
- 
- PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-app-0.10
--
--
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
-diff --git a/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro b/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
-index 7e8a9e7..fad40b0 100644
---- a/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
-+++ b/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
-@@ -2,11 +2,10 @@ SOURCES += main.cpp
- 
- CONFIG += link_pkgconfig
- 
--PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
- 
-+PKGCONFIG += \
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
-diff --git a/config.tests/gstreamer_photography/gstreamer_photography.pro b/config.tests/gstreamer_photography/gstreamer_photography.pro
-index 6b530cb..975991f 100644
---- a/config.tests/gstreamer_photography/gstreamer_photography.pro
-+++ b/config.tests/gstreamer_photography/gstreamer_photography.pro
-@@ -3,12 +3,11 @@ SOURCES += main.cpp
- CONFIG += link_pkgconfig
- 
- PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
--
--LIBS += -lgstphotography-0.10
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
-+
-+LIBS += -lgstphotography-$$GST_VERSION
- 
-diff --git a/qtmultimedia.pro b/qtmultimedia.pro
-index cf97e64..d94d6a2 100644
---- a/qtmultimedia.pro
-+++ b/qtmultimedia.pro
-@@ -17,11 +17,26 @@ win32 {
- } else {
-     contains(QT_CONFIG, alsa):qtCompileTest(alsa)
-     contains(QT_CONFIG, pulseaudio):qtCompileTest(pulseaudio)
--    qtCompileTest(gstreamer) {
--        qtCompileTest(gstreamer_photography)
--        qtCompileTest(gstreamer_encodingprofiles)
--        qtCompileTest(gstreamer_appsrc)
--        qtCompileTest(linux_v4l)
-+    !done_config_gstreamer {
-+        gstver=1.0
-+        cache(GST_VERSION, set, gstver);
-+        qtCompileTest(gstreamer) {
-+            qtCompileTest(gstreamer_photography)
-+            qtCompileTest(gstreamer_encodingprofiles)
-+            qtCompileTest(gstreamer_appsrc)
-+            qtCompileTest(linux_v4l)
-+        } else {
-+            gstver=0.10
-+            cache(GST_VERSION, set, gstver);
-+            # Force a re-run of the test
-+            CONFIG -= done_config_gstreamer
-+            qtCompileTest(gstreamer) {
-+                qtCompileTest(gstreamer_photography)
-+                qtCompileTest(gstreamer_encodingprofiles)
-+                qtCompileTest(gstreamer_appsrc)
-+                qtCompileTest(linux_v4l)
-+            }
-+        }
-     }
-     qtCompileTest(resourcepolicy)
-     qtCompileTest(gpu_vivante)
-diff --git a/src/gsttools/gsttools.pro b/src/gsttools/gsttools.pro
-index 7c809a7..6b9bf5d 100644
---- a/src/gsttools/gsttools.pro
-+++ b/src/gsttools/gsttools.pro
-@@ -2,7 +2,7 @@ TEMPLATE = lib
- 
- TARGET = qgsttools_p
- QPRO_PWD = $$PWD
--QT = core-private multimedia-private gui-private
-+QT = core-private multimedia-private gui-private opengl
- 
- !static:DEFINES += QT_MAKEDLL
- DEFINES += GLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_26
-@@ -15,13 +15,14 @@ LIBS_PRIVATE += \
- 
- CONFIG += link_pkgconfig
- 
--PKGCONFIG_PRIVATE += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
-+PKGCONFIG += \
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
-+
-+equals(GST_VERSION,"0.10"): PKGCONFIG_PRIVATE += gstreamer-interfaces-$$GST_VERSION
- 
- maemo*: PKGCONFIG_PRIVATE +=gstreamer-plugins-bad-0.10
- 
-@@ -33,6 +34,7 @@ config_resourcepolicy {
- # Header files must go inside source directory of a module
- # to be installed by syncqt.
- INCLUDEPATH += ../multimedia/gsttools_headers/
-+INCLUDEPATH += ../plugins/gstreamer/mediaplayer/
- VPATH += ../multimedia/gsttools_headers/
- 
- PRIVATE_HEADERS += \
-@@ -91,13 +93,13 @@ maemo6 {
- }
- 
- config_gstreamer_appsrc {
--    PKGCONFIG_PRIVATE += gstreamer-app-0.10
-+    PKGCONFIG_PRIVATE += gstreamer-app-$$GST_VERSION
-     PRIVATE_HEADERS += qgstappsrc_p.h
-     SOURCES += qgstappsrc.cpp
- 
-     DEFINES += HAVE_GST_APPSRC
- 
--    LIBS_PRIVATE += -lgstapp-0.10
-+    LIBS_PRIVATE += -lgstapp-$$GST_VERSION
- }
- 
- config_linux_v4l: DEFINES += USE_V4L
-diff --git a/src/gsttools/gstvideoconnector.c b/src/gsttools/gstvideoconnector.c
-index 3ed539e..ed0ed3c 100644
---- a/src/gsttools/gstvideoconnector.c
-+++ b/src/gsttools/gstvideoconnector.c
-@@ -59,26 +59,93 @@ GST_STATIC_PAD_TEMPLATE ("src",
-                          GST_PAD_ALWAYS,
-                          GST_STATIC_CAPS_ANY);
- 
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+
-+G_DEFINE_TYPE(GstVideoConnector, gst_video_connector, GST_TYPE_ELEMENT);
-+#else
- #define _do_init(bla) \
-     GST_DEBUG_CATEGORY_INIT (video_connector_debug, \
-     "video-connector", 0, "An identity like element for reconnecting video stream");
- 
- GST_BOILERPLATE_FULL (GstVideoConnector, gst_video_connector, GstElement,
-                       GST_TYPE_ELEMENT, _do_init);
-+#endif
- 
- static void gst_video_connector_dispose (GObject * object);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstFlowReturn gst_video_connector_chain (GstPad * pad, GstObject* parent, GstBuffer * buf);
-+#else
- static GstFlowReturn gst_video_connector_chain (GstPad * pad, GstBuffer * buf);
- static GstFlowReturn gst_video_connector_buffer_alloc (GstPad * pad,
-                                                        guint64 offset, guint size, GstCaps * caps, GstBuffer ** buf);
-+#endif
-+
- static GstStateChangeReturn gst_video_connector_change_state (GstElement *
-                                                               element, GstStateChange transition);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+static gboolean gst_video_connector_handle_sink_event (GstPad * pad, GstObject* parent,
-+                                                       GstEvent * event);
-+#else
- static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
-                                                        GstEvent * event);
-+#endif
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstPadProbeReturn gst_video_connector_new_buffer_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
-+static GstPadProbeReturn gst_video_connector_new_event_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
-+static GstPadProbeReturn gst_video_connector_new_query_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
-+#else
- static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *buffer, guint * object);
--static void gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal);
- static gboolean gst_video_connector_setcaps (GstPad  *pad, GstCaps *caps);
- static GstCaps *gst_video_connector_getcaps (GstPad * pad);
- static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps);
-+#endif
-+
-+static void gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+static void
-+gst_video_connector_class_init (GstVideoConnectorClass * klass)
-+{
-+    GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
-+    GstElementClass *gstelement_class = GST_ELEMENT_CLASS (klass);
-+
-+    gst_element_class_set_details_simple (gstelement_class, "Video Connector",
-+                                          "Generic",
-+                                          "An identity like element used for reconnecting video stream",
-+                                          "Dmytro Poplavskiy <dmytro.poplavskiy@nokia.com>");
-+    gst_element_class_add_pad_template (gstelement_class,
-+                                        gst_static_pad_template_get (&gst_video_connector_sink_factory));
-+    gst_element_class_add_pad_template (gstelement_class,
-+                                        gst_static_pad_template_get (&gst_video_connector_src_factory));
-+
-+    gst_video_connector_parent_class = g_type_class_peek_parent (klass);
-+
-+    gobject_class->dispose = gst_video_connector_dispose;
-+    gstelement_class->change_state = gst_video_connector_change_state;
-+    klass->resend_new_segment = gst_video_connector_resend_new_segment;
-+
-+    gst_video_connector_signals[SIGNAL_RESEND_NEW_SEGMENT] =
-+            g_signal_new ("resend-new-segment", G_TYPE_FROM_CLASS (klass),
-+                          G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
-+                          G_STRUCT_OFFSET (GstVideoConnectorClass, resend_new_segment), NULL, NULL,
-+                          g_cclosure_marshal_VOID__BOOLEAN, G_TYPE_NONE, 1, G_TYPE_BOOLEAN);
-+
-+    gst_video_connector_signals[SIGNAL_CONNECTION_FAILED] =
-+            g_signal_new ("connection-failed", G_TYPE_FROM_CLASS (klass),
-+                          G_SIGNAL_RUN_LAST,
-+                          0, NULL, NULL,
-+                          g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0);
-+
-+    GST_DEBUG_CATEGORY_INIT(video_connector_debug, "video-connector", 0,
-+                            "An identity like element for reconnecting video stream");
-+
-+}
-+
-+#else
- 
- static void
- gst_video_connector_base_init (gpointer g_class)
-@@ -120,18 +187,33 @@ gst_video_connector_class_init (GstVideoConnectorClass * klass)
-                           g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0);
- }
- 
-+#endif
-+
- static void
--gst_video_connector_init (GstVideoConnector *element,
--                          GstVideoConnectorClass *g_class)
-+gst_video_connector_init (GstVideoConnector *element
-+#if GST_CHECK_VERSION(1,0,0)
-+#else
-+                          ,GstVideoConnectorClass *g_class
-+#endif
-+                          )
- {
-+#if GST_CHECK_VERSION(1,0,0)
-+#else
-     (void) g_class;
-+#endif
-     element->sinkpad =
-             gst_pad_new_from_static_template (&gst_video_connector_sink_factory,
-                                               "sink");
-     gst_pad_set_chain_function(element->sinkpad,
-                                GST_DEBUG_FUNCPTR (gst_video_connector_chain));
-+#if GST_CHECK_VERSION(1,0,0)
-+    /* gstreamer 1.x uses QUERIES and EVENTS for allocation and caps handiling purposes */
-+    GST_OBJECT_FLAG_SET (element->sinkpad, GST_PAD_FLAG_PROXY_CAPS);
-+    GST_OBJECT_FLAG_SET (element->sinkpad, GST_PAD_FLAG_PROXY_ALLOCATION);
-+#else
-     gst_pad_set_event_function(element->sinkpad,
-                                GST_DEBUG_FUNCPTR (gst_video_connector_handle_sink_event));
-+
-     gst_pad_set_bufferalloc_function(element->sinkpad,
-                                      GST_DEBUG_FUNCPTR (gst_video_connector_buffer_alloc));
-     gst_pad_set_setcaps_function(element->sinkpad,
-@@ -140,14 +222,23 @@ gst_video_connector_init (GstVideoConnector *element,
-                                GST_DEBUG_FUNCPTR(gst_video_connector_getcaps));
-     gst_pad_set_acceptcaps_function(element->sinkpad,
-                                GST_DEBUG_FUNCPTR(gst_video_connector_acceptcaps));
--
-+#endif
-     gst_element_add_pad (GST_ELEMENT (element), element->sinkpad);
- 
-     element->srcpad =
-             gst_pad_new_from_static_template (&gst_video_connector_src_factory,
-                                               "src");
-+#if GST_CHECK_VERSION(1,0,0)
-+    gst_pad_add_probe(element->srcpad, GST_PAD_PROBE_TYPE_BUFFER,
-+                             gst_video_connector_new_buffer_probe, element, NULL);
-+    gst_pad_add_probe(element->srcpad, GST_PAD_PROBE_TYPE_QUERY_DOWNSTREAM,
-+                             gst_video_connector_new_query_probe, element, NULL);
-+    gst_pad_add_probe(element->sinkpad, GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM,
-+                             gst_video_connector_new_event_probe, element, NULL);
-+#else
-     gst_pad_add_buffer_probe(element->srcpad,
-                              G_CALLBACK(gst_video_connector_new_buffer_probe), element);
-+#endif
-     gst_element_add_pad (GST_ELEMENT (element), element->srcpad);
- 
-     element->relinked = FALSE;
-@@ -175,9 +266,16 @@ gst_video_connector_dispose (GObject * object)
- 
-     gst_video_connector_reset (element);
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    G_OBJECT_CLASS (gst_video_connector_parent_class)->dispose (object);
-+#else
-     G_OBJECT_CLASS (parent_class)->dispose (object);
-+#endif
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+/* For gstreamer 1.x we handle it in ALLOCATION Query */
-+#else
- // "When this function returns anything else than GST_FLOW_OK,
- // the buffer allocation failed and buf does not contain valid data."
- static GstFlowReturn
-@@ -221,6 +319,7 @@ gst_video_connector_buffer_alloc (GstPad * pad, guint64 offset, guint size,
-                 if (state == GST_STATE_NULL) {
-                     GST_DEBUG_OBJECT (element, "Downstream element is in NULL state");
-                     // Downstream filter seems to be in the wrong state
-+
-                     return GST_FLOW_UNEXPECTED;
-                 }
-             }
-@@ -293,6 +392,7 @@ static GstCaps *gst_video_connector_getcaps (GstPad * pad)
-     return caps;
- }
- 
-+
- static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
- {
-     GstVideoConnector *element;
-@@ -300,6 +400,7 @@ static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
- 
-     return gst_pad_peer_accept_caps(element->srcpad, caps);
- }
-+#endif
- 
- static void
- gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal)
-@@ -311,11 +412,39 @@ gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailed
-         connector->failedSignalEmited = FALSE;
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstPadProbeReturn gst_video_connector_new_event_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
-+{
-+    GstVideoConnector *connector = GST_VIDEO_CONNECTOR (object);
-+    GstEvent *event = gst_pad_probe_info_get_event(info);
-+
-+    GST_DEBUG_OBJECT(connector, "Event %"GST_PTR_FORMAT" received\n", event);
-+
-+    return GST_PAD_PROBE_OK;
-+}
-+
-+static GstPadProbeReturn gst_video_connector_new_query_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
-+{
-+    GstVideoConnector *connector = GST_VIDEO_CONNECTOR (object);
-+    GstQuery *query = gst_pad_probe_info_get_query(info);
-+
-+    GST_DEBUG_OBJECT(connector, "Query %"GST_PTR_FORMAT" received\n", query);
-+
-+    return GST_PAD_PROBE_OK;
-+}
-+#endif
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstPadProbeReturn gst_video_connector_new_buffer_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
-+{
-+    (void) info;
-+#else
- static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *buffer, guint * object)
- {
--    (void) pad;
-     (void) buffer;
-+#endif
-+    (void) pad;
-+
- 
-     GstVideoConnector *element = GST_VIDEO_CONNECTOR (object);
- 
-@@ -327,16 +456,23 @@ static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *
-     if (element->relinked)
-         GST_LOG_OBJECT(element, "rejected buffer because of new segment request");
- 
--    return !element->relinked;
-+    return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK;
- }
- 
--
- static GstFlowReturn
-+#if GST_CHECK_VERSION(1,0,0)
-+gst_video_connector_chain (GstPad * pad, GstObject* parent, GstBuffer * buf)
-+#else
- gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
-+#endif
- {
-     GstFlowReturn res;
-     GstVideoConnector *element;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    (void)parent;
-+#endif
-+
-     element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
- 
-     do {
-@@ -348,20 +484,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
-         */
-         while (element->relinked) {
-             element->relinked = FALSE;
--
-+#if GST_CHECK_VERSION(1,0,0)
-+            if (element->latest_buffer && GST_BUFFER_TIMESTAMP_IS_VALID(element->latest_buffer)) {
-+                element->segment.position = GST_BUFFER_TIMESTAMP (element->latest_buffer);
-+            }
-+#else
-             gint64 pos = element->segment.last_stop;
--
-             if (element->latest_buffer && GST_BUFFER_TIMESTAMP_IS_VALID(element->latest_buffer)) {
-                 pos = GST_BUFFER_TIMESTAMP (element->latest_buffer);
-             }
-+#endif
- 
-             //push a new segment and last buffer
-+#if GST_CHECK_VERSION(1,0,0)
-+            GstEvent *ev = gst_event_new_segment (&element->segment);
-+
-+#else
-             GstEvent *ev = gst_event_new_new_segment (TRUE,
-                                                       element->segment.rate,
-                                                       element->segment.format,
-                                                       pos, //start
-                                                       element->segment.stop,
-                                                       pos);
-+#endif
- 
-             GST_DEBUG_OBJECT (element, "Pushing new segment event");
-             if (!gst_pad_push_event (element->srcpad, ev)) {
-@@ -424,8 +569,11 @@ gst_video_connector_change_state (GstElement * element,
-     GstStateChangeReturn result;
- 
-     connector = GST_VIDEO_CONNECTOR(element);
-+#if GST_CHECK_VERSION(1,0,0)
-+    result = GST_ELEMENT_CLASS (gst_video_connector_parent_class)->change_state(element, transition);
-+#else
-     result = GST_ELEMENT_CLASS (parent_class)->change_state(element, transition);
--
-+#endif
-     switch (transition) {
-     case GST_STATE_CHANGE_PAUSED_TO_READY:
-         gst_video_connector_reset (connector);
-@@ -440,9 +588,32 @@ gst_video_connector_change_state (GstElement * element,
-     return result;
- }
- 
--static gboolean
--gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
-+#if GST_CHECK_VERSION(1,0,0)
-+static gboolean gst_video_connector_handle_sink_event (GstPad * pad, GstObject* parent,
-+                                                       GstEvent * event)
-+{
-+    GstVideoConnector *element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
-+
-+    switch (GST_EVENT_TYPE (event)) {
-+      case GST_EVENT_SEGMENT:
-+      break;
-+      case GST_EVENT_CAPS:
-+      break;
-+    default:
-+      break;
-+    }
-+
-+    gst_object_unref (element);
-+    return gst_pad_event_default (pad, parent, event);
-+}
-+
-+#else
-+
-+static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
-+                                                       GstEvent * event)
- {
-+    (void)parent;
-+
-     if (GST_EVENT_TYPE (event) == GST_EVENT_NEWSEGMENT) {
-         GstVideoConnector *element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
- 
-@@ -453,7 +624,6 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
- 
-         gst_event_parse_new_segment_full (event, &update, &rate, &arate, &format,
-                                           &start, &stop, &time);
--
-         GST_LOG_OBJECT (element,
-                           "NEWSEGMENT update %d, rate %lf, applied rate %lf, "
-                           "format %d, " "%" G_GINT64_FORMAT " -- %" G_GINT64_FORMAT ", time %"
-@@ -461,9 +631,10 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
- 
-         gst_segment_set_newsegment_full (&element->segment, update,
-                                          rate, arate, format, start, stop, time);
--
-         gst_object_unref (element);
-     }
- 
-     return gst_pad_event_default (pad, event);
- }
-+
-+#endif
-diff --git a/src/gsttools/qgstappsrc.cpp b/src/gsttools/qgstappsrc.cpp
-index 561a96f..d5e106f 100644
---- a/src/gsttools/qgstappsrc.cpp
-+++ b/src/gsttools/qgstappsrc.cpp
-@@ -147,23 +147,44 @@ void QGstAppSrc::pushDataToAppSrc()
-             size = qMin(m_stream->bytesAvailable(), (qint64)m_dataRequestSize);
- 
-         if (size) {
--            void *data = g_malloc(size);
--            GstBuffer* buffer = gst_app_buffer_new(data, size, g_free, data);
-+            GstBuffer* buffer = gst_buffer_new_and_alloc(size);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+            GstMapInfo mapInfo;
-+            gst_buffer_map(buffer, &mapInfo, GST_MAP_WRITE);
-+            void* bufferData = mapInfo.data;
-+#else
-+            void* bufferData = GST_BUFFER_DATA(buffer);
-+#endif
-+            
-             buffer->offset = m_stream->pos();
--            qint64 bytesRead = m_stream->read((char*)GST_BUFFER_DATA(buffer), size);
-+            qint64 bytesRead = m_stream->read((char*)bufferData, size);
-             buffer->offset_end =  buffer->offset + bytesRead - 1;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+            gst_buffer_unmap(buffer, &mapInfo);
-+#endif
-+            
-             if (bytesRead > 0) {
-                 m_dataRequested = false;
-                 m_enoughData = false;
-                 GstFlowReturn ret = gst_app_src_push_buffer (GST_APP_SRC (element()), buffer);
-                 if (ret == GST_FLOW_ERROR) {
-                     qWarning()<<"appsrc: push buffer error";
-+#if GST_CHECK_VERSION(1,0,0)
-+                } else if (ret == GST_FLOW_FLUSHING) {
-+                    qWarning()<<"appsrc: push buffer wrong state";
-+                }
-+#else
-                 } else if (ret == GST_FLOW_WRONG_STATE) {
-                     qWarning()<<"appsrc: push buffer wrong state";
--                } else if (ret == GST_FLOW_RESEND) {
-+                }
-+#endif
-+#if GST_VERSION_MAJOR < 1
-+                else if (ret == GST_FLOW_RESEND) {
-                     qWarning()<<"appsrc: push buffer resend";
-                 }
-+#endif
-             }
-         } else {
-             sendEOS();
-diff --git a/src/gsttools/qgstreameraudioprobecontrol.cpp b/src/gsttools/qgstreameraudioprobecontrol.cpp
-index 3baca53..be3de3f 100644
---- a/src/gsttools/qgstreameraudioprobecontrol.cpp
-+++ b/src/gsttools/qgstreameraudioprobecontrol.cpp
-@@ -45,9 +45,14 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeControl()
- 
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer, GstCaps* caps)
-+{
-+#else
- void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
- {
--    GstCaps* caps = gst_buffer_get_caps(buffer);
-+    gst_buffer_get_caps(buffer);
-+#endif
-     if (!caps)
-         return;
- 
-@@ -56,8 +61,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
-     if (!format.isValid())
-         return;
- 
-+    #if GST_CHECK_VERSION(1,0,0)
-+
-+    GstMapInfo info;
-+
-+    gst_buffer_map (buffer, &info, GST_MAP_READ);
-+    QAudioBuffer audioBuffer = QAudioBuffer(QByteArray((const char*)info.data, info.size), format);
-+    gst_buffer_unmap(buffer, &info);
-+
-+    #else
-+
-     QAudioBuffer audioBuffer = QAudioBuffer(QByteArray((const char*)buffer->data, buffer->size), format);
- 
-+    #endif
-+
-     {
-         QMutexLocker locker(&m_bufferMutex);
-         m_pendingBuffer = audioBuffer;
-diff --git a/src/gsttools/qgstreamerbushelper.cpp b/src/gsttools/qgstreamerbushelper.cpp
-index 84eda46..eb1fc36 100644
---- a/src/gsttools/qgstreamerbushelper.cpp
-+++ b/src/gsttools/qgstreamerbushelper.cpp
-@@ -154,13 +154,21 @@ QGstreamerBusHelper::QGstreamerBusHelper(GstBus* bus, QObject* parent):
-     QObject(parent)
- {
-     d = new QGstreamerBusHelperPrivate(this, bus);
-+#if GST_CHECK_VERSION(1,0,0)
-+    gst_bus_set_sync_handler(bus, (GstBusSyncHandler)syncGstBusFilter, d, 0);
-+#else
-     gst_bus_set_sync_handler(bus, (GstBusSyncHandler)syncGstBusFilter, d);
-+#endif
-     gst_object_ref(GST_OBJECT(bus));
- }
- 
- QGstreamerBusHelper::~QGstreamerBusHelper()
- {
-+#if GST_CHECK_VERSION(1,0,0)
-+    gst_bus_set_sync_handler(d->bus(), 0, 0, 0);
-+#else
-     gst_bus_set_sync_handler(d->bus(),0,0);
-+#endif
-     gst_object_unref(GST_OBJECT(d->bus()));
- }
- 
-diff --git a/src/gsttools/qgstreamervideoprobecontrol.cpp b/src/gsttools/qgstreamervideoprobecontrol.cpp
-index a78a9da..9c31140 100644
---- a/src/gsttools/qgstreamervideoprobecontrol.cpp
-+++ b/src/gsttools/qgstreamervideoprobecontrol.cpp
-@@ -67,12 +67,21 @@ void QGstreamerVideoProbeControl::stopFlushing()
-     m_flushing = false;
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+void QGstreamerVideoProbeControl::bufferProbed(GstBuffer* buffer, GstCaps* caps)
-+#else
- void QGstreamerVideoProbeControl::bufferProbed(GstBuffer* buffer)
-+#endif
- {
-     if (m_flushing)
-         return;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    // FIXME:
-+   // GstCaps* caps = NULL;//gst_buffer_get_caps(buffer);
-+#else
-     GstCaps* caps = gst_buffer_get_caps(buffer);
-+#endif
-     if (!caps)
-         return;
- 
-diff --git a/src/gsttools/qgstreamervideorenderer.cpp b/src/gsttools/qgstreamervideorenderer.cpp
-index 2b66f76..804dce9 100644
---- a/src/gsttools/qgstreamervideorenderer.cpp
-+++ b/src/gsttools/qgstreamervideorenderer.cpp
-@@ -35,8 +35,7 @@
- #include <private/qvideosurfacegstsink_p.h>
- #include <private/qgstutils_p.h>
- #include <qabstractvideosurface.h>
--
--#include <QDebug>
-+#include <QtCore/qdebug.h>
- 
- #include <gst/gst.h>
- 
-diff --git a/src/gsttools/qgstreamervideowidget.cpp b/src/gsttools/qgstreamervideowidget.cpp
-index b26369a..23674bb 100644
---- a/src/gsttools/qgstreamervideowidget.cpp
-+++ b/src/gsttools/qgstreamervideowidget.cpp
-@@ -40,8 +40,13 @@
- #include <QtGui/qpainter.h>
- 
- #include <gst/gst.h>
-+
-+#if !GST_CHECK_VERSION(1,0,0)
- #include <gst/interfaces/xoverlay.h>
- #include <gst/interfaces/propertyprobe.h>
-+#else
-+#include <gst/video/videooverlay.h>
-+#endif
- 
- QT_BEGIN_NAMESPACE
- 
-@@ -161,9 +166,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
- {
-     GstMessage* gm = message.rawMessage();
- 
-+#if !GST_CHECK_VERSION(1,0,0)
-     if (gm && (GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
-             gst_structure_has_name(gm->structure, "prepare-xwindow-id")) {
--
-+#else
-+      if (gm && (GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
-+              gst_structure_has_name(gst_message_get_structure(gm), "prepare-window-handle")) {
-+#endif
-         setOverlay();
-         QMetaObject::invokeMethod(this, "updateNativeVideoSize", Qt::QueuedConnection);
-         return true;
-@@ -191,18 +200,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
- 
- void QGstreamerVideoWidgetControl::setOverlay()
- {
-+#if !GST_CHECK_VERSION(1,0,0)
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-         gst_x_overlay_set_xwindow_id(GST_X_OVERLAY(m_videoSink), m_windowId);
-     }
-+#else
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
-+    }
-+#endif
- }
- 
- void QGstreamerVideoWidgetControl::updateNativeVideoSize()
- {
-     if (m_videoSink) {
-         //find video native size to update video widget size hint
--        GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
-+        GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
-+#if !GST_CHECK_VERSION(1,0,0)
-         GstCaps *caps = gst_pad_get_negotiated_caps(pad);
-         gst_object_unref(GST_OBJECT(pad));
-+#else
-+        GstCaps *caps = gst_pad_get_current_caps(pad);
-+        gst_object_unref(GST_OBJECT(pad));
-+#endif
- 
-         if (caps) {
-             m_widget->setNativeSize(QGstUtils::capsCorrectedResolution(caps));
-@@ -217,8 +237,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
- 
- void QGstreamerVideoWidgetControl::windowExposed()
- {
-+#if !GST_CHECK_VERSION(1,0,0)
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink))
-         gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
-+#else
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink))
-+        gst_video_overlay_expose(GST_VIDEO_OVERLAY(m_videoSink));
-+#endif
- }
- 
- QWidget *QGstreamerVideoWidgetControl::videoWidget()
-diff --git a/src/gsttools/qgstreamervideowindow.cpp b/src/gsttools/qgstreamervideowindow.cpp
-index a373dcc..587b010 100644
---- a/src/gsttools/qgstreamervideowindow.cpp
-+++ b/src/gsttools/qgstreamervideowindow.cpp
-@@ -37,8 +37,12 @@
- #include <QtCore/qdebug.h>
- 
- #include <gst/gst.h>
-+#include <gst/video/videooverlay.h>
-+
-+#if !GST_CHECK_VERSION(1,0,0)
- #include <gst/interfaces/xoverlay.h>
- #include <gst/interfaces/propertyprobe.h>
-+#endif
- 
- 
- QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elementName)
-@@ -49,18 +53,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elemen
-     , m_fullScreen(false)
-     , m_colorKey(QColor::Invalid)
- {
--    if (elementName)
-+    if (elementName) {
-         m_videoSink = gst_element_factory_make(elementName, NULL);
--    else
-+    } else {
-         m_videoSink = gst_element_factory_make("xvimagesink", NULL);
-+    }
- 
-     if (m_videoSink) {
-         qt_gst_object_ref_sink(GST_OBJECT(m_videoSink)); //Take ownership
- 
-         GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
-+#if GST_CHECK_VERSION(1,0,0)
-+        m_bufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padBufferProbe, this, NULL);
-+#else
-         m_bufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padBufferProbe), this);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
-+    else
-+        qDebug() << "No m_videoSink available!";
- }
- 
- QGstreamerVideoWindow::~QGstreamerVideoWindow()
-@@ -82,11 +93,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
-     WId oldId = m_windowId;
- 
-     m_windowId = id;
--
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
-+    }
-+#else
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-         gst_x_overlay_set_xwindow_id(GST_X_OVERLAY(m_videoSink), m_windowId);
-     }
--
-+#endif
-     if (!oldId)
-         emit readyChanged(true);
- 
-@@ -97,7 +112,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
- bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
- {
-     GstMessage* gm = message.rawMessage();
-+#if GST_CHECK_VERSION(1,0,0)
-+    const GstStructure *s = gst_message_get_structure(gm);
-+    if ((GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
-+            gst_structure_has_name(s, "prepare-window-handle") &&
-+            m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+
-+        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
- 
-+        GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
-+        m_bufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padBufferProbe, this, NULL);
-+
-+        return true;
-+    }
-+#else
-     if ((GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
-             gst_structure_has_name(gm->structure, "prepare-xwindow-id") &&
-             m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-@@ -110,7 +138,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
- 
-         return true;
-     }
--
-+#endif
-     return false;
- }
- 
-@@ -122,7 +150,19 @@ QRect QGstreamerVideoWindow::displayRect() const
- void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
- {
-     m_displayRect = rect;
--
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+        if (m_displayRect.isEmpty())
-+            gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY(m_videoSink), -1, -1, -1, -1);
-+        else
-+            gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY(m_videoSink),
-+                                               m_displayRect.x(),
-+                                               m_displayRect.y(),
-+                                               m_displayRect.width(),
-+                                               m_displayRect.height());
-+        repaint();
-+    }
-+#else
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
- #if GST_VERSION_MICRO >= 29
-         if (m_displayRect.isEmpty())
-@@ -136,6 +176,7 @@ void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
-         repaint();
- #endif
-     }
-+#endif
- }
- 
- Qt::AspectRatioMode QGstreamerVideoWindow::aspectRatioMode() const
-@@ -157,6 +198,16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt::AspectRatioMode mode)
- 
- void QGstreamerVideoWindow::repaint()
- {
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
-+        //don't call gst_x_overlay_expose if the sink is in null state
-+        GstState state = GST_STATE_NULL;
-+        GstStateChangeReturn res = gst_element_get_state(m_videoSink, &state, NULL, 1000000);
-+        if (res != GST_STATE_CHANGE_FAILURE && state != GST_STATE_NULL) {
-+            gst_video_overlay_expose(GST_VIDEO_OVERLAY(m_videoSink));
-+        }
-+    }
-+#else
-     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
-         //don't call gst_x_overlay_expose if the sink is in null state
-         GstState state = GST_STATE_NULL;
-@@ -165,6 +216,7 @@ void QGstreamerVideoWindow::repaint()
-             gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
-         }
-     }
-+#endif
- }
- 
- QColor QGstreamerVideoWindow::colorKey() const
-@@ -296,11 +348,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
-     return m_nativeSize;
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+GstPadProbeReturn QGstreamerVideoWindow::padBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
-+#else
- void QGstreamerVideoWindow::padBufferProbe(GstPad *pad, GstBuffer * /* buffer */, gpointer user_data)
-+#endif
- {
-     QGstreamerVideoWindow *control = reinterpret_cast<QGstreamerVideoWindow*>(user_data);
-     QMetaObject::invokeMethod(control, "updateNativeVideoSize", Qt::QueuedConnection);
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+    Q_UNUSED(pad);
-+    Q_UNUSED(info);
-+    return GST_PAD_PROBE_REMOVE;
-+#else
-     gst_pad_remove_buffer_probe(pad, control->m_bufferProbeId);
-+#endif
- }
- 
- void QGstreamerVideoWindow::updateNativeVideoSize()
-@@ -311,7 +374,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
-     if (m_videoSink) {
-         //find video native size to update video widget size hint
-         GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
-+#if GST_CHECK_VERSION(1,0,0)
-+        GstCaps *caps = gst_pad_get_current_caps(pad);
-+#else
-         GstCaps *caps = gst_pad_get_negotiated_caps(pad);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
- 
-         if (caps) {
-diff --git a/src/gsttools/qgstutils.cpp b/src/gsttools/qgstutils.cpp
-index 465f439..cb26137 100644
---- a/src/gsttools/qgstutils.cpp
-+++ b/src/gsttools/qgstutils.cpp
-@@ -90,8 +90,13 @@ static void addTagToMap(const GstTagList *list,
-             break;
-         default:
-             // GST_TYPE_DATE is a function, not a constant, so pull it out of the switch
-+#if GST_CHECK_VERSION(1,0,0)
-+            if (G_VALUE_TYPE(&val) == G_TYPE_DATE) {
-+                const GDate *date = (const GDate *)g_value_get_boxed(&val);
-+#else
-             if (G_VALUE_TYPE(&val) == GST_TYPE_DATE) {
-                 const GDate *date = gst_value_get_date(&val);
-+#endif
-                 if (g_date_valid(date)) {
-                     int year = g_date_get_year(date);
-                     int month = g_date_get_month(date);
-@@ -255,6 +260,24 @@ QAudioFormat QGstUtils::audioFormatForCaps(const GstCaps *caps)
- }
- 
- 
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+/*!
-+  Returns audio format for a buffer.
-+  If the buffer doesn't have a valid audio format, an empty QAudioFormat is returned.
-+*/
-+
-+QAudioFormat QGstUtils::audioFormatForSample(GstSample *sample)
-+{
-+    GstCaps* caps = gst_sample_get_caps(sample);
-+    if (!caps)
-+        return QAudioFormat();
-+
-+    QAudioFormat format = QGstUtils::audioFormatForCaps(caps);
-+    gst_caps_unref(caps);
-+    return format;
-+}
-+#else
- /*!
-   Returns audio format for a buffer.
-   If the buffer doesn't have a valid audio format, an empty QAudioFormat is returned.
-@@ -270,7 +293,7 @@ QAudioFormat QGstUtils::audioFormatForBuffer(GstBuffer *buffer)
-     gst_caps_unref(caps);
-     return format;
- }
--
-+#endif
- 
- /*!
-   Builds GstCaps for an audio format.
-@@ -588,7 +611,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
- 
- void qt_gst_object_ref_sink(gpointer object)
- {
--#if (GST_VERSION_MAJOR >= 0) && (GST_VERSION_MINOR >= 10) && (GST_VERSION_MICRO >= 24)
-+#if (GST_VERSION_MAJOR >= 0) && (GST_VERSION_MINOR >= 10) && (GST_VERSION_MICRO >= 24) || GST_CHECK_VERSION(1,0,0)
-     gst_object_ref_sink(object);
- #else
-     g_return_if_fail (GST_IS_OBJECT(object));
-diff --git a/src/gsttools/qgstvideobuffer.cpp b/src/gsttools/qgstvideobuffer.cpp
-index 18702ec..93f22f5 100644
---- a/src/gsttools/qgstvideobuffer.cpp
-+++ b/src/gsttools/qgstvideobuffer.cpp
-@@ -70,21 +70,33 @@ QAbstractVideoBuffer::MapMode QGstVideoBuffer::mapMode() const
- uchar *QGstVideoBuffer::map(MapMode mode, int *numBytes, int *bytesPerLine)
- {
-     if (mode != NotMapped && m_mode == NotMapped) {
--        if (numBytes)
--            *numBytes = m_buffer->size;
-+        m_mode = mode;
- 
-         if (bytesPerLine)
-             *bytesPerLine = m_bytesPerLine;
- 
--        m_mode = mode;
-+#if GST_CHECK_VERSION(1,0,0)
-+        gst_buffer_map(m_buffer, &m_mapInfo, GST_MAP_READ);
-+        if (numBytes)
-+            *numBytes = m_mapInfo.size;
-+
-+        return m_mapInfo.data;
-+#else
-+        if (numBytes)
-+            *numBytes = m_buffer->size;
- 
-         return m_buffer->data;
-+#endif
-     } else {
-         return 0;
-     }
- }
- void QGstVideoBuffer::unmap()
- {
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_mode != NotMapped)
-+        gst_buffer_unmap(m_buffer, &m_mapInfo);
-+#endif
-     m_mode = NotMapped;
- }
- 
-diff --git a/src/gsttools/qvideosurfacegstsink.cpp b/src/gsttools/qvideosurfacegstsink.cpp
-index f3e2d88..94aaee7 100644
---- a/src/gsttools/qvideosurfacegstsink.cpp
-+++ b/src/gsttools/qvideosurfacegstsink.cpp
-@@ -43,7 +43,11 @@
- 
- #include "qvideosurfacegstsink_p.h"
- 
--//#define DEBUG_VIDEO_SURFACE_SINK
-+#if GST_VERSION_MAJOR >=1
-+#include <gst/video/video.h>
-+#endif
-+
-+#define DEBUG_VIDEO_SURFACE_SINK
- 
- QT_BEGIN_NAMESPACE
- 
-@@ -62,10 +66,12 @@ QVideoSurfaceGstDelegate::QVideoSurfaceGstDelegate(
-     if (m_surface) {
-         foreach (QObject *instance, bufferPoolLoader()->instances(QGstBufferPoolPluginKey)) {
-             QGstBufferPoolInterface* plugin = qobject_cast<QGstBufferPoolInterface*>(instance);
-+
-             if (plugin) {
-                 m_pools.append(plugin);
-             }
-         }
-+
-         updateSupportedFormats();
-         connect(m_surface, SIGNAL(supportedFormatsChanged()), this, SLOT(updateSupportedFormats()));
-     }
-@@ -198,6 +204,8 @@ GstFlowReturn QVideoSurfaceGstDelegate::render(GstBuffer *buffer)
-     if (QThread::currentThread() == thread()) {
-         if (!m_surface.isNull())
-             m_surface->present(m_frame);
-+        else
-+            qWarning() << "m_surface.isNull().";
-     } else {
-         QMetaObject::invokeMethod(this, "queuedRender", Qt::QueuedConnection);
-         m_renderCondition.wait(&m_mutex, 300);
-@@ -283,6 +291,27 @@ void QVideoSurfaceGstDelegate::updateSupportedFormats()
-     }
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+struct YuvFormat
-+{
-+    QVideoFrame::PixelFormat pixelFormat;
-+    GstVideoFormat vfmt;
-+    guint32 fourcc;
-+    int bitsPerPixel;
-+};
-+
-+static const YuvFormat qt_yuvColorLookup[] =
-+{
-+    { QVideoFrame::Format_YUV420P, GST_VIDEO_FORMAT_I420, GST_MAKE_FOURCC('I','4','2','0'), 8  },
-+    { QVideoFrame::Format_YV12,    GST_VIDEO_FORMAT_YV12, GST_MAKE_FOURCC('Y','V','1','2'), 8  },
-+    { QVideoFrame::Format_UYVY,    GST_VIDEO_FORMAT_UYVY, GST_MAKE_FOURCC('U','Y','V','Y'), 16 },
-+    { QVideoFrame::Format_YUYV,    GST_VIDEO_FORMAT_YUY2, GST_MAKE_FOURCC('Y','U','Y','2'), 16 },
-+    { QVideoFrame::Format_NV12,    GST_VIDEO_FORMAT_NV12, GST_MAKE_FOURCC('N','V','1','2'), 8 },
-+    { QVideoFrame::Format_NV21,    GST_VIDEO_FORMAT_NV21, GST_MAKE_FOURCC('N','V','2','1'), 8 },
-+    { QVideoFrame::Format_AYUV444, GST_VIDEO_FORMAT_AYUV, GST_MAKE_FOURCC('A','Y','U','V'), 32 },
-+};
-+
-+#else
- struct YuvFormat
- {
-     QVideoFrame::PixelFormat pixelFormat;
-@@ -300,6 +329,7 @@ static const YuvFormat qt_yuvColorLookup[] =
-     { QVideoFrame::Format_NV21,    GST_MAKE_FOURCC('N','V','2','1'), 8 },
-     { QVideoFrame::Format_AYUV444, GST_MAKE_FOURCC('A','Y','U','V'), 32 }
- };
-+#endif
- 
- static int indexOfYuvColor(QVideoFrame::PixelFormat format)
- {
-@@ -312,12 +342,20 @@ static int indexOfYuvColor(QVideoFrame::PixelFormat format)
-     return -1;
- }
- 
-+#if GST_VERSION_MAJOR >=1
-+static int indexOfYuvColor(GstVideoFormat vfmt)
-+#else
- static int indexOfYuvColor(guint32 fourcc)
-+#endif
- {
-     const int count = sizeof(qt_yuvColorLookup) / sizeof(YuvFormat);
- 
-     for (int i = 0; i < count; ++i)
-+#if GST_VERSION_MAJOR >=1
-+        if (qt_yuvColorLookup[i].vfmt == vfmt)
-+#else
-         if (qt_yuvColorLookup[i].fourcc == fourcc)
-+#endif
-             return i;
- 
-     return -1;
-@@ -388,13 +426,13 @@ GType QVideoSurfaceGstSink::get_type()
-     if (type == 0) {
-         static const GTypeInfo info =
-         {
--            sizeof(QVideoSurfaceGstSinkClass),                    // class_size
-+            sizeof(QVideoSurfaceGstSinkClass),                 // class_size
-             base_init,                                         // base_init
-             NULL,                                              // base_finalize
-             class_init,                                        // class_init
-             NULL,                                              // class_finalize
-             NULL,                                              // class_data
--            sizeof(QVideoSurfaceGstSink),                         // instance_size
-+            sizeof(QVideoSurfaceGstSink),                      // instance_size
-             0,                                                 // n_preallocs
-             instance_init,                                     // instance_init
-             0                                                  // value_table
-@@ -419,7 +457,11 @@ void QVideoSurfaceGstSink::class_init(gpointer g_class, gpointer class_data)
-     GstBaseSinkClass *base_sink_class = reinterpret_cast<GstBaseSinkClass *>(g_class);
-     base_sink_class->get_caps = QVideoSurfaceGstSink::get_caps;
-     base_sink_class->set_caps = QVideoSurfaceGstSink::set_caps;
-+// FIXME:
-+#if GST_CHECK_VERSION(1,0,0)
-+#else
-     base_sink_class->buffer_alloc = QVideoSurfaceGstSink::buffer_alloc;
-+#endif
-     base_sink_class->start = QVideoSurfaceGstSink::start;
-     base_sink_class->stop = QVideoSurfaceGstSink::stop;
- 
-@@ -434,6 +476,18 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
- {
-     static GstStaticPadTemplate sink_pad_template = GST_STATIC_PAD_TEMPLATE(
-             "sink", GST_PAD_SINK, GST_PAD_ALWAYS, GST_STATIC_CAPS(
-+#if GST_CHECK_VERSION(1,0,0)
-+                    "video/x-raw, "
-+                    "format = (string) RGBA,"
-+                    "framerate = (fraction) [ 0, MAX ], "
-+                    "width = (int) [ 1, MAX ], "
-+                    "height = (int) [ 1, MAX ]; "
-+                    "video/x-raw, "
-+                    "format = (string) I420,"
-+                    "framerate = (fraction) [ 0, MAX ], "
-+                    "width = (int) [ 1, MAX ], "
-+                    "height = (int) [ 1, MAX ]"));
-+#else
-                     "video/x-raw-rgb, "
-                     "framerate = (fraction) [ 0, MAX ], "
-                     "width = (int) [ 1, MAX ], "
-@@ -442,6 +496,7 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
-                     "framerate = (fraction) [ 0, MAX ], "
-                     "width = (int) [ 1, MAX ], "
-                     "height = (int) [ 1, MAX ]"));
-+#endif
- 
-     gst_element_class_add_pad_template(
-             GST_ELEMENT_CLASS(g_class), gst_static_pad_template_get(&sink_pad_template));
-@@ -490,7 +545,11 @@ GstStateChangeReturn QVideoSurfaceGstSink::change_state(
-             element, transition);
- }
- 
--GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
-+GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base
-+#if GST_CHECK_VERSION(1,0,0)
-+                                        , GstCaps* /*filterCaps*/
-+#endif
-+)
- {
-     VO_SINK(base);
- 
-@@ -503,6 +562,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
-     QList<QVideoFrame::PixelFormat> poolHandleFormats;
-     sink->delegate->poolMutex()->lock();
-     QGstBufferPoolInterface *pool = sink->delegate->pool();
-+
-     if (pool)
-         poolHandleFormats = sink->delegate->supportedPixelFormats(pool->handleType());
-     sink->delegate->poolMutex()->unlock();
-@@ -518,11 +578,19 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
- 
-         if (index != -1) {
-             gst_caps_append_structure(caps, gst_structure_new(
-+#if GST_CHECK_VERSION(1,0,0)
-+                    "video/x-raw",
-+#else
-                     "video/x-raw-yuv",
-+#endif
-                     "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
-                     "width"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
-                     "height"   , GST_TYPE_INT_RANGE, 1, INT_MAX,
-+#if GST_CHECK_VERSION(1,0,0)
-+                    "format"   , G_TYPE_STRING, gst_video_format_to_string(qt_yuvColorLookup[index].vfmt),
-+#else
-                     "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
-+#endif
-                     NULL));
-             continue;
-         }
-@@ -532,7 +600,18 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
-         for (int i = 0; i < count; ++i) {
-             if (qt_rgbColorLookup[i].pixelFormat == format) {
-                 GstStructure *structure = gst_structure_new(
-+#if GST_CHECK_VERSION(1,0,0)
-+                        "video/x-raw",
-+                        "format"    , G_TYPE_STRING, gst_video_format_to_string(gst_video_format_from_masks(qt_rgbColorLookup[i].depth,
-+                                                                                 qt_rgbColorLookup[i].bitsPerPixel,
-+                                                                                 qt_rgbColorLookup[i].endianness,
-+                                                                                 qt_rgbColorLookup[i].red,
-+                                                                                 qt_rgbColorLookup[i].green,
-+                                                                                 qt_rgbColorLookup[i].blue,
-+                                                                                 qt_rgbColorLookup[i].alpha)),
-+#else
-                         "video/x-raw-rgb",
-+#endif
-                         "framerate" , GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
-                         "width"     , GST_TYPE_INT_RANGE, 1, INT_MAX,
-                         "height"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
-@@ -553,6 +632,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
-         }
-     }
- 
-+//    printf("get Caps %"GST_PTR_FORMAT"\n", caps);
-     return caps;
- }
- 
-@@ -592,7 +672,7 @@ gboolean QVideoSurfaceGstSink::set_caps(GstBaseSink *base, GstCaps *caps)
-         sink->lastRequestedCaps = 0;
- 
- #ifdef DEBUG_VIDEO_SURFACE_SINK
--        qDebug() << "Staring video surface, format:";
-+        qDebug() << "Starting video surface, format:";
-         qDebug() << format;
-         qDebug() << "bytesPerLine:" << bytesPerLine;
- #endif
-@@ -617,11 +697,49 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
-     gst_structure_get_int(structure, "width", &size.rwidth());
-     gst_structure_get_int(structure, "height", &size.rheight());
- 
-+#if GST_CHECK_VERSION(1, 0, 0)
-+    GstVideoInfo info;
-+    gst_video_info_from_caps(&info, caps);
-+
-+    if (info.finfo->format == GST_VIDEO_FORMAT_I420) {
-+        int index = indexOfYuvColor(GST_VIDEO_FORMAT_I420);
-+
-+        if (index != -1) {
-+            pixelFormat = qt_yuvColorLookup[index].pixelFormat;
-+            bitsPerPixel = qt_yuvColorLookup[index].bitsPerPixel;
-+        }
-+    } else if (info.finfo->format == GST_VIDEO_FORMAT_RGBx) {
-+        int depth = 0;
-+        int endianness = 0;
-+        int red = 0;
-+        int green = 0;
-+        int blue = 0;
-+        int alpha = 0;
-+
-+        gst_structure_get_int(structure, "bpp", &bitsPerPixel);
-+        gst_structure_get_int(structure, "depth", &depth);
-+        gst_structure_get_int(structure, "endianness", &endianness);
-+        gst_structure_get_int(structure, "red_mask", &red);
-+        gst_structure_get_int(structure, "green_mask", &green);
-+        gst_structure_get_int(structure, "blue_mask", &blue);
-+        gst_structure_get_int(structure, "alpha_mask", &alpha);
-+
-+        int index = indexOfRgbColor(bitsPerPixel, depth, endianness, red, green, blue, alpha);
-+        printf("INDEX %x\n", index);
-+        if (index != -1)
-+            pixelFormat = qt_rgbColorLookup[index].pixelFormat;
-+    }
-+#else
-+
-     if (qstrcmp(gst_structure_get_name(structure), "video/x-raw-yuv") == 0) {
-         guint32 fourcc = 0;
-+#if GST_CHECK_VERSION(1, 0, 0)
-+        int index = indexOfYuvColor(gst_video_format_from_string(gst_structure_get_string(structure, "format")));
-+#else
-         gst_structure_get_fourcc(structure, "format", &fourcc);
- 
-         int index = indexOfYuvColor(fourcc);
-+#endif
-         if (index != -1) {
-             pixelFormat = qt_yuvColorLookup[index].pixelFormat;
-             bitsPerPixel = qt_yuvColorLookup[index].bitsPerPixel;
-@@ -647,6 +765,7 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
-         if (index != -1)
-             pixelFormat = qt_rgbColorLookup[index].pixelFormat;
-     }
-+#endif
- 
-     if (pixelFormat != QVideoFrame::Format_Invalid) {
-         QVideoSurfaceFormat format(size, pixelFormat, handleType);
-@@ -722,7 +841,11 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
- 
-     poolLock.unlock();
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    GstCaps *intersection = gst_caps_intersect(get_caps(GST_BASE_SINK(sink), NULL), caps);
-+#else
-     GstCaps *intersection = gst_caps_intersect(get_caps(GST_BASE_SINK(sink)), caps);
-+#endif
- 
-     if (gst_caps_is_empty (intersection)) {
-         gst_caps_unref(intersection);
-@@ -763,7 +886,7 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
-     QVideoSurfaceFormat surfaceFormat = sink->delegate->surfaceFormat();
- 
-     if (!pool->isFormatSupported(surfaceFormat)) {
--        //qDebug() << "sink doesn't support native pool format, skip custom buffers allocation";
-+        qDebug() << "sink doesn't support native pool format, skip custom buffers allocation";
-         return GST_FLOW_OK;
-     }
- 
-@@ -787,7 +910,6 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
- gboolean QVideoSurfaceGstSink::start(GstBaseSink *base)
- {
-     Q_UNUSED(base);
--
-     return TRUE;
- }
- 
-diff --git a/src/multimedia/gsttools_headers/qgstappsrc_p.h b/src/multimedia/gsttools_headers/qgstappsrc_p.h
-index 4af9252..0e0fc0a 100644
---- a/src/multimedia/gsttools_headers/qgstappsrc_p.h
-+++ b/src/multimedia/gsttools_headers/qgstappsrc_p.h
-@@ -39,7 +39,10 @@
- 
- #include <gst/gst.h>
- #include <gst/app/gstappsrc.h>
-+
-+#if GST_VERSION_MAJOR < 1
- #include <gst/app/gstappbuffer.h>
-+#endif
- 
- QT_BEGIN_NAMESPACE
- 
-diff --git a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
-index 34669b8..0f3b165 100644
---- a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
-+++ b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
-@@ -47,8 +47,11 @@ class QGstreamerAudioProbeControl : public QMediaAudioProbeControl
- public:
-     explicit QGstreamerAudioProbeControl(QObject *parent);
-     virtual ~QGstreamerAudioProbeControl();
--
-+#if GST_CHECK_VERSION(1,0,0)
-+    void bufferProbed(GstBuffer* buffer, GstCaps* caps);
-+#else
-     void bufferProbed(GstBuffer* buffer);
-+#endif
- 
- private slots:
-     void bufferProbed();
-diff --git a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
-index 49064f9..fce6309 100644
---- a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
-+++ b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
-@@ -48,7 +48,11 @@ public:
-     explicit QGstreamerVideoProbeControl(QObject *parent);
-     virtual ~QGstreamerVideoProbeControl();
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    void bufferProbed(GstBuffer* buffer, GstCaps*);
-+#else
-     void bufferProbed(GstBuffer* buffer);
-+#endif
-     void startFlushing();
-     void stopFlushing();
- 
-diff --git a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
-index 81e5764..c9fdb5c 100644
---- a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
-+++ b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
-@@ -104,7 +104,11 @@ private slots:
-     void updateNativeVideoSize();
- 
- private:
-+#if GST_CHECK_VERSION(1,0,0)
-+    static GstPadProbeReturn padBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data);
-+#else
-     static void padBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
-+#endif
- 
-     GstElement *m_videoSink;
-     WId m_windowId;
-diff --git a/src/multimedia/gsttools_headers/qgstutils_p.h b/src/multimedia/gsttools_headers/qgstutils_p.h
-index 65ff759..6015980 100644
---- a/src/multimedia/gsttools_headers/qgstutils_p.h
-+++ b/src/multimedia/gsttools_headers/qgstutils_p.h
-@@ -73,7 +73,11 @@ namespace QGstUtils {
-     QSize capsResolution(const GstCaps *caps);
-     QSize capsCorrectedResolution(const GstCaps *caps);
-     QAudioFormat audioFormatForCaps(const GstCaps *caps);
-+#if GST_CHECK_VERSION(1,0,0)
-+    QAudioFormat audioFormatForSample(GstSample *sample);
-+#else
-     QAudioFormat audioFormatForBuffer(GstBuffer *buffer);
-+#endif
-     GstCaps *capsForAudioFormat(QAudioFormat format);
-     void initializeGst();
-     QMultimedia::SupportEstimate hasSupport(const QString &mimeType,
-diff --git a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
-index 1e0fda8..be48820 100644
---- a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
-+++ b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
-@@ -71,6 +71,9 @@ private:
-     int m_bytesPerLine;
-     MapMode m_mode;
-     QVariant m_handle;
-+#if GST_CHECK_VERSION(1,0,0)
-+    GstMapInfo m_mapInfo;
-+#endif
- };
- 
- QT_END_NAMESPACE
-diff --git a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
-index 11b305d..01935f7 100644
---- a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
-+++ b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
-@@ -131,7 +131,11 @@ private:
- 
-     static GstStateChangeReturn change_state(GstElement *element, GstStateChange transition);
- 
--    static GstCaps *get_caps(GstBaseSink *sink);
-+    static GstCaps *get_caps(GstBaseSink *sink
-+#if GST_CHECK_VERSION(1,0,0)
-+                             , GstCaps* /*filterCaps*/
-+#endif
-+                            );
-     static gboolean set_caps(GstBaseSink *sink, GstCaps *caps);
- 
-     static GstFlowReturn buffer_alloc(
-diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
-index 3098aab..9c54663 100644
---- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
-+++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
-@@ -74,29 +74,42 @@ void QGstreamerAudioDecoderServicePlugin::updateSupportedMimeTypes() const
-     gst_init(NULL, NULL);
- 
-     GList *plugins, *orig_plugins;
-+#if GST_CHECK_VERSION(1,0,0)
-+    orig_plugins = plugins = gst_registry_get_plugin_list (gst_registry_get());
-+#else
-     orig_plugins = plugins = gst_default_registry_get_plugin_list ();
--
-+#endif
-     while (plugins) {
-         GList *features, *orig_features;
- 
-         GstPlugin *plugin = (GstPlugin *) (plugins->data);
-         plugins = g_list_next (plugins);
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
-+            continue;
-+#else
-         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
-             continue;
--
--        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get_default (),
--                                                                        plugin->desc.name);
-+#endif
-+        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get (),
-+                                                                         gst_plugin_get_name(plugin));
-         while (features) {
-             if (!G_UNLIKELY(features->data == NULL)) {
-                 GstPluginFeature *feature = GST_PLUGIN_FEATURE(features->data);
-                 if (GST_IS_ELEMENT_FACTORY (feature)) {
-                     GstElementFactory *factory = GST_ELEMENT_FACTORY(gst_plugin_feature_load(feature));
-                     if (factory
--                       && factory->numpadtemplates > 0
-+                       && gst_element_factory_get_num_pad_templates(factory) > 0
-+#if GST_CHECK_VERSION(1,0,0)
-+                       && (qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Decoder/Audio") == 0
-+                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Demux") == 0 )
-+#else
-                        && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
--                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )) {
--                        const GList *pads = factory->staticpadtemplates;
-+                           || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )
-+#endif
-+                        ) {
-+                        const GList *pads = gst_element_factory_get_static_pad_templates(factory);
-                         while (pads) {
-                             GstStaticPadTemplate *padtemplate = (GstStaticPadTemplate*)(pads->data);
-                             pads = g_list_next (pads);
-diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
-index f944a60..72d1cf1 100644
---- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
-+++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
-@@ -446,21 +446,40 @@ QAudioBuffer QGstreamerAudioDecoderSession::read()
-         if (buffersAvailable == 1)
-             emit bufferAvailableChanged(false);
- 
-+        const char* bufferData = 0;
-+        int bufferSize = 0;
-+
-+#if GST_CHECK_VERSION(1,0,0)
-+        GstSample *sample = gst_app_sink_pull_sample(m_appSink);
-+        GstBuffer *buffer = gst_sample_get_buffer(sample);
-+        GstMapInfo mapInfo;
-+        gst_buffer_map(buffer, &mapInfo, GST_MAP_READ);
-+        bufferData = (const char*)mapInfo.data;
-+        bufferSize = mapInfo.size;
-+        QAudioFormat format = QGstUtils::audioFormatForSample(sample);
-+#else
-         GstBuffer *buffer = gst_app_sink_pull_buffer(m_appSink);
--
-+        bufferData = (const char*)buffer->data;
-+        bufferSize = buffer->size;
-         QAudioFormat format = QGstUtils::audioFormatForBuffer(buffer);
-+#endif
-+
-         if (format.isValid()) {
-             // XXX At the moment we have to copy data from GstBuffer into QAudioBuffer.
-             // We could improve performance by implementing QAbstractAudioBuffer for GstBuffer.
-             qint64 position = getPositionFromBuffer(buffer);
--            audioBuffer = QAudioBuffer(QByteArray((const char*)buffer->data, buffer->size), format, position);
-+            audioBuffer = QAudioBuffer(QByteArray((const char*)bufferData, bufferSize), format, position);
-             position /= 1000; // convert to milliseconds
-             if (position != m_position) {
-                 m_position = position;
-                 emit positionChanged(m_position);
-             }
-         }
-+#if GST_CHECK_VERSION(1,0,0)
-+        gst_sample_unref(sample);
-+#else
-         gst_buffer_unref(buffer);
-+#endif
-     }
- 
-     return audioBuffer;
-@@ -531,7 +550,12 @@ void QGstreamerAudioDecoderSession::addAppSink()
- 
-     GstAppSinkCallbacks callbacks;
-     memset(&callbacks, 0, sizeof(callbacks));
-+#if GST_CHECK_VERSION(1,0,0)
-+    // ### Should perhaps also rename new_buffer to new_sample.
-+    callbacks.new_sample = &new_buffer;
-+#else
-     callbacks.new_buffer = &new_buffer;
-+#endif
-     gst_app_sink_set_callbacks(m_appSink, &callbacks, this, NULL);
-     gst_app_sink_set_max_buffers(m_appSink, MAX_BUFFERS_IN_QUEUE);
-     gst_base_sink_set_sync(GST_BASE_SINK(m_appSink), FALSE);
-@@ -557,8 +581,13 @@ void QGstreamerAudioDecoderSession::updateDuration()
-     gint64 gstDuration = 0;
-     int duration = -1;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_playbin && gst_element_query_duration(m_playbin, format, &gstDuration))
-+        duration = gstDuration / 1000000;
-+#else
-     if (m_playbin && gst_element_query_duration(m_playbin, &format, &gstDuration))
-         duration = gstDuration / 1000000;
-+#endif
- 
-     if (m_duration != duration) {
-         m_duration = duration;
-diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-index 1ed663b..e0c6b50 100644
---- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-+++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-@@ -796,7 +796,11 @@ qint64 CameraBinSession::duration() const
-         if (fileSink) {
-             GstFormat format = GST_FORMAT_TIME;
-             gint64 duration = 0;
-+#if GST_CHECK_VERSION(1,0,0)
-+            bool ret = gst_element_query_duration(fileSink, format, &duration);
-+#else
-             bool ret = gst_element_query_position(fileSink, &format, &duration);
-+#endif
-             gst_object_unref(GST_OBJECT(fileSink));
-             if (ret)
-                 return duration / 1000000;
-@@ -833,8 +837,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
- 
-     if (m_camerabin) {
-         GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
-+#if GST_CHECK_VERSION(1,0,0)
-+        GValue *element = 0;
-+        while (gst_iterator_next(elements, element) == GST_ITERATOR_OK) {
-+#else
-         GstElement *element = 0;
-         while (gst_iterator_next(elements, (void**)&element) == GST_ITERATOR_OK) {
-+#endif
-             gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
- 
-             QMapIterator<QByteArray, QVariant> it(data);
-@@ -895,7 +904,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
- 
-     if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
-         if (m_captureMode == QCamera::CaptureStillImage &&
-+#if GST_CHECK_VERSION(1,0,0)
-+            gst_message_has_name (gm, "preview-image")) {
-+#else
-             gst_structure_has_name(gm->structure, "preview-image")) {
-+#endif
-             st = gst_message_get_structure(gm);
- 
-             if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
-@@ -905,7 +918,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
- 
-                     QImage img;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-                     GstCaps *caps = gst_buffer_get_caps(buffer);
-+#else
-+                    GstCaps *caps = gst_buffer_get_caps(buffer);
-+#endif
-                     if (caps) {
-                         GstStructure *structure = gst_caps_get_structure(caps, 0);
-                         gint width = 0;
-@@ -1178,7 +1195,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
-         gst_structure_remove_all_fields(structure);
-         gst_structure_set_value(structure, "framerate", &rate);
-     }
-+#if GST_CHECK_VERSION(1,0,0)
-+    caps = gst_caps_simplify(caps);
-+#else
-     gst_caps_do_simplify(caps);
-+#endif
- 
- 
-     for (uint i=0; i<gst_caps_get_size(caps); i++) {
-@@ -1298,7 +1319,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
-         gst_structure_set_value(structure, "width", &w);
-         gst_structure_set_value(structure, "height", &h);
-     }
-+#if GST_CHECK_VERSION(1,0,0)
-+    caps = gst_caps_simplify(caps);
-+#else
-     gst_caps_do_simplify(caps);
-+#endif
- 
-     for (uint i=0; i<gst_caps_get_size(caps); i++) {
-         GstStructure *structure = gst_caps_get_structure(caps, i);
-diff --git a/src/plugins/gstreamer/common.pri b/src/plugins/gstreamer/common.pri
-index 8b421b8..2e7f746 100644
---- a/src/plugins/gstreamer/common.pri
-+++ b/src/plugins/gstreamer/common.pri
-@@ -12,14 +12,17 @@ LIBS += -lqgsttools_p
- CONFIG += link_pkgconfig
- 
- PKGCONFIG += \
--    gstreamer-0.10 \
--    gstreamer-base-0.10 \
--    gstreamer-interfaces-0.10 \
--    gstreamer-audio-0.10 \
--    gstreamer-video-0.10 \
--    gstreamer-pbutils-0.10
-+    gstreamer-$$GST_VERSION \
-+    gstreamer-base-$$GST_VERSION \
-+    gstreamer-audio-$$GST_VERSION \
-+    gstreamer-video-$$GST_VERSION \
-+    gstreamer-pbutils-$$GST_VERSION
- 
--maemo*:PKGCONFIG +=gstreamer-plugins-bad-0.10
-+maemo*:PKGCONFIG +=gstreamer-plugins-bad-$$GST_VERSION
-+
-+mir: {
-+    DEFINES += HAVE_MIR
-+}
- 
- config_resourcepolicy {
-     DEFINES += HAVE_RESOURCE_POLICY
-@@ -27,8 +30,8 @@ config_resourcepolicy {
- }
- 
- config_gstreamer_appsrc {
--    PKGCONFIG += gstreamer-app-0.10
-+    PKGCONFIG += gstreamer-app-$$GST_VERSION
-     DEFINES += HAVE_GST_APPSRC
--    LIBS += -lgstapp-0.10
-+    LIBS += -lgstapp-$$GST_VERSION
- }
- 
-diff --git a/src/plugins/gstreamer/gstreamer.pro b/src/plugins/gstreamer/gstreamer.pro
-index 7649010..fce55ac 100644
---- a/src/plugins/gstreamer/gstreamer.pro
-+++ b/src/plugins/gstreamer/gstreamer.pro
-@@ -2,11 +2,10 @@ TEMPLATE = subdirs
- 
- SUBDIRS += \
-     audiodecoder \
--    mediacapture \
-     mediaplayer
- 
- config_gstreamer_encodingprofiles {
--    SUBDIRS += camerabin
-+#    SUBDIRS += camerabin
- }
- 
- OTHER_FILES += \
-diff --git a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-index a2bd80d..d12e9a5 100644
---- a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-+++ b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
-@@ -498,6 +498,11 @@ GstElement *QGstreamerCaptureSession::buildImageCapture()
-     gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
-     gst_object_unref(GST_OBJECT(pad));
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, passImageFilter, this);
-+#else
-+    gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
-+#endif
-     g_object_set(G_OBJECT(sink), "signal-handoffs", TRUE, NULL);
-     g_signal_connect(G_OBJECT(sink), "handoff",
-                      G_CALLBACK(saveImageFilter), this);
-diff --git a/src/plugins/gstreamer/mediaplayer/mediaplayer.pro b/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
-index 2ca9377..b986fc7 100644
---- a/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
-+++ b/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
-@@ -28,4 +28,3 @@ SOURCES += \
- 
- OTHER_FILES += \
-     mediaplayer.json
--
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-index fed756a..8239710 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
-@@ -537,6 +537,8 @@ void QGstreamerPlayerControl::processEOS()
-         m_session->showPrerollFrames(false); // stop showing prerolled frames in stop state
-     }
- 
-+    qWarning() << "Processing EOS!";
-+
-     popAndNotifyState();
- }
- 
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-index ddc828e..00bee36 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
-@@ -51,7 +51,11 @@
- #include <private/qgstreamervideorenderer_p.h>
- 
- #if defined(Q_WS_MAEMO_6) && defined(__arm__)
--#include "qgstreamergltexturerenderer.h"
-+#include "private/qgstreamergltexturerenderer.h"
-+#endif
-+
-+#if defined(HAVE_MIR) && defined (__arm__)
-+#include "private/qgstreamermirtexturerenderer_p.h"
- #endif
- 
- #include "qgstreamerstreamscontrol.h"
-@@ -82,6 +86,9 @@ QGstreamerPlayerService::QGstreamerPlayerService(QObject *parent):
- 
- #if defined(Q_WS_MAEMO_6) && defined(__arm__)
-     m_videoRenderer = new QGstreamerGLTextureRenderer(this);
-+#elif defined(HAVE_MIR) && defined (__arm__)
-+    //m_videoRenderer = new QGstreamerVideoRenderer(this);
-+    m_videoRenderer = new QGstreamerMirTextureRenderer(this, m_session);
- #else
-     m_videoRenderer = new QGstreamerVideoRenderer(this);
- #endif
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
-index 7d20b6d..bf2f9f8 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
-@@ -87,7 +87,11 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
-     gst_init(NULL, NULL);
- 
-     GList *plugins, *orig_plugins;
-+#if GST_CHECK_VERSION(1,0,0)
-+    orig_plugins = plugins = gst_registry_get_plugin_list (gst_registry_get());
-+#else
-     orig_plugins = plugins = gst_default_registry_get_plugin_list ();
-+#endif
- 
-     while (plugins) {
-         GList *features, *orig_features;
-@@ -95,22 +99,33 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
-         GstPlugin *plugin = (GstPlugin *) (plugins->data);
-         plugins = g_list_next (plugins);
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
-+            continue;
-+#else
-         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
-             continue;
-+#endif
- 
--        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get_default (),
--                                                                        plugin->desc.name);
-+        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get(),
-+                                                                           gst_plugin_get_name(plugin));
-         while (features) {
-             if (!G_UNLIKELY(features->data == NULL)) {
-                 GstPluginFeature *feature = GST_PLUGIN_FEATURE(features->data);
-                 if (GST_IS_ELEMENT_FACTORY (feature)) {
-                     GstElementFactory *factory = GST_ELEMENT_FACTORY(gst_plugin_feature_load(feature));
-                     if (factory
--                       && factory->numpadtemplates > 0
--                       && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
-+#if GST_CHECK_VERSION(1,0,0)
-+                        && (qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Decoder/Audio") == 0
-+                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS),"Codec/Decoder/Video") == 0
-+                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Demux") == 0 )
-+#else
-+                        && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
-                           || qstrcmp(factory->details.klass, "Codec/Decoder/Video") == 0
--                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )) {
--                        const GList *pads = factory->staticpadtemplates;
-+                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )
-+#endif
-+                        ) {
-+                        const GList *pads = gst_element_factory_get_static_pad_templates(factory);
-                         while (pads) {
-                             GstStaticPadTemplate *padtemplate = (GstStaticPadTemplate*)(pads->data);
-                             pads = g_list_next (pads);
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-index 15924a6..8013d0d 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
-@@ -85,6 +85,16 @@ typedef enum {
-     GST_PLAY_FLAG_BUFFERING     = 0x000000100
- } GstPlayFlags;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+#define DEFAULT_RAW_CAPS \
-+    "video/x-surface; " \
-+    "text/plain; " \
-+    "text/x-pango-markup; " \
-+    "video/x-dvd-subpicture; " \
-+    "subpicture/x-pgs" \
-+    "video/x-raw" \
-+    "audio/x-raw"
-+#else
- #define DEFAULT_RAW_CAPS \
-     "video/x-raw-yuv; " \
-     "video/x-raw-rgb; " \
-@@ -97,6 +107,8 @@ typedef enum {
-     "text/x-pango-markup; " \
-     "video/x-dvd-subpicture; " \
-     "subpicture/x-pgs"
-+#endif
-+
- static GstStaticCaps static_RawCaps = GST_STATIC_CAPS(DEFAULT_RAW_CAPS);
- 
- QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-@@ -137,8 +149,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-     gboolean result = gst_type_find_register(0, "playlist", GST_RANK_MARGINAL, playlistTypeFindFunction, 0, 0, this, 0);
-     Q_ASSERT(result == TRUE);
-     Q_UNUSED(result);
--
-+#if GST_CHECK_VERSION(1,0,0)
-+    m_playbin = gst_element_factory_make("playbin", NULL);
-+#else
-     m_playbin = gst_element_factory_make("playbin2", NULL);
-+#endif
- 
-     if (m_playbin) {
-         //GST_PLAY_FLAG_NATIVE_VIDEO omits configuration of ffmpegcolorspace and videoscale,
-@@ -188,7 +203,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-     m_videoIdentity = GST_ELEMENT(g_object_new(gst_video_connector_get_type(), 0)); // floating ref
-     g_signal_connect(G_OBJECT(m_videoIdentity), "connection-failed", G_CALLBACK(insertColorSpaceElement), (gpointer)this);
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    m_colorSpace = gst_element_factory_make("videoconvert", "ffmpegcolorspace-vo");
-+#else
-     m_colorSpace = gst_element_factory_make("ffmpegcolorspace", "ffmpegcolorspace-vo");
-+#endif
-     // might not get a parent, take ownership to avoid leak
-     qt_gst_object_ref_sink(GST_OBJECT(m_colorSpace));
- 
-@@ -206,7 +225,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
- 
-     // add ghostpads
-     GstPad *pad = gst_element_get_static_pad(m_videoIdentity,"sink");
--    gst_element_add_pad(GST_ELEMENT(m_videoOutputBin), gst_ghost_pad_new("videosink", pad));
-+    gst_element_add_pad(GST_ELEMENT(m_videoOutputBin), gst_ghost_pad_new("sink", pad));
-     gst_object_unref(GST_OBJECT(pad));
- 
-     if (m_playbin != 0) {
-@@ -218,7 +237,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
-         g_object_set(G_OBJECT(m_playbin), "video-sink", m_videoOutputBin, NULL);
- 
-         g_signal_connect(G_OBJECT(m_playbin), "notify::source", G_CALLBACK(playbinNotifySource), this);
--        g_signal_connect(G_OBJECT(m_playbin), "element-added",  G_CALLBACK(handleElementAdded), this);
-+        //g_signal_connect(G_OBJECT(m_playbin), "element-added",  G_CALLBACK(handleElementAdded), this);
- 
-         if (usePlaybinVolume()) {
-             updateVolume();
-@@ -342,9 +361,13 @@ qint64 QGstreamerPlayerSession::position() const
-     GstFormat   format = GST_FORMAT_TIME;
-     gint64      position = 0;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    if ( m_playbin && gst_element_query_position(m_playbin, format, &position))
-+        m_lastPosition = position / 1000000;
-+#else
-     if ( m_playbin && gst_element_query_position(m_playbin, &format, &position))
-         m_lastPosition = position / 1000000;
--
-+#endif
-     return m_lastPosition;
- }
- 
-@@ -474,9 +497,18 @@ bool QGstreamerPlayerSession::isAudioAvailable() const
-     return m_audioAvailable;
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+static GstPadProbeReturn block_pad_cb(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
-+#else
- static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_data)
-+#endif
- {
-     Q_UNUSED(pad);
-+#if GST_CHECK_VERSION(1,0,0)
-+    Q_UNUSED(info);
-+    Q_UNUSED(user_data);
-+    return GST_PAD_PROBE_OK;
-+#else
- #ifdef DEBUG_PLAYBIN
-     qDebug() << "block_pad_cb, blocked:" << blocked;
- #endif
-@@ -485,6 +517,7 @@ static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_data)
-         QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
-         QMetaObject::invokeMethod(session, "finishVideoOutputChange", Qt::QueuedConnection);
-     }
-+#endif
- }
- 
- void QGstreamerPlayerSession::updateVideoRenderer()
-@@ -529,7 +562,7 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
-     m_renderer = renderer;
- 
- #ifdef DEBUG_VO_BIN_DUMP
--    _gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
-+    gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
-                                   GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
-                                   "playbin_set");
- #endif
-@@ -633,7 +666,11 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
- 
-         //block pads, async to avoid locking in paused state
-         GstPad *srcPad = gst_element_get_static_pad(m_videoIdentity, "src");
-+#if GST_CHECK_VERSION(1,0,0)
-+        this->pad_probe_id = gst_pad_add_probe(srcPad, (GstPadProbeType)(GST_PAD_PROBE_TYPE_BUFFER | GST_PAD_PROBE_TYPE_BLOCK), block_pad_cb, this, NULL);
-+#else
-         gst_pad_set_blocked_async(srcPad, true, &block_pad_cb, this);
-+#endif
-         gst_object_unref(GST_OBJECT(srcPad));
- 
-         //Unpause the sink to avoid waiting until the buffer is processed
-@@ -674,7 +711,11 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
-         //video output was change back to the current one,
-         //no need to torment the pipeline, just unblock the pad
-         if (gst_pad_is_blocked(srcPad))
-+#if GST_CHECK_VERSION(1,0,0)
-+            gst_pad_remove_probe(srcPad, this->pad_probe_id);
-+#else
-             gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
-+#endif
- 
-         m_pendingVideoSink = 0;
-         gst_object_unref(GST_OBJECT(srcPad));
-@@ -760,12 +801,17 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
- 
-     //don't have to wait here, it will unblock eventually
-     if (gst_pad_is_blocked(srcPad))
--        gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
-+#if GST_CHECK_VERSION(1,0,0)
-+            gst_pad_remove_probe(srcPad, this->pad_probe_id);
-+#else
-+            gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
-+#endif
-+
-     gst_object_unref(GST_OBJECT(srcPad));
- 
- #ifdef DEBUG_VO_BIN_DUMP
--    _gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
--                                  GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
-+    gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
-+                                  GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* | GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES */),
-                                   "playbin_finish");
- #endif
- }
-@@ -830,6 +876,7 @@ bool QGstreamerPlayerSession::play()
- #ifdef DEBUG_PLAYBIN
-     qDebug() << Q_FUNC_INFO;
- #endif
-+
-     m_everPlayed = false;
-     if (m_playbin) {
-         m_pendingState = QMediaPlayer::PlayingState;
-@@ -1327,8 +1374,11 @@ void QGstreamerPlayerSession::getStreamsInfo()
-         default:
-             break;
-         }
--
-+#if GST_CHECK_VERSION(1,0,0)
-+        if (tags && GST_IS_TAG_LIST(tags)) {
-+#else
-         if (tags && gst_is_tag_list(tags)) {
-+#endif
-             gchar *languageCode = 0;
-             if (gst_tag_list_get_string(tags, GST_TAG_LANGUAGE_CODE, &languageCode))
-                 streamProperties[QMediaMetaData::Language] = QString::fromUtf8(languageCode);
-@@ -1367,7 +1417,11 @@ void QGstreamerPlayerSession::updateVideoResolutionTag()
-     QSize aspectRatio;
- 
-     GstPad *pad = gst_element_get_static_pad(m_videoIdentity, "src");
-+#if GST_CHECK_VERSION(1,0,0)
-+    GstCaps *caps = gst_pad_get_current_caps(pad);
-+#else
-     GstCaps *caps = gst_pad_get_negotiated_caps(pad);
-+#endif
- 
-     if (caps) {
-         const GstStructure *structure = gst_caps_get_structure(caps, 0);
-@@ -1411,7 +1465,11 @@ void QGstreamerPlayerSession::updateDuration()
-     gint64 gstDuration = 0;
-     int duration = -1;
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+    if (m_playbin && gst_element_query_duration(m_playbin, format, &gstDuration))
-+#else
-     if (m_playbin && gst_element_query_duration(m_playbin, &format, &gstDuration))
-+#endif
-         duration = gstDuration / 1000000;
- 
-     if (m_duration != duration) {
-@@ -1467,7 +1525,11 @@ void QGstreamerPlayerSession::playbinNotifySource(GObject *o, GParamSpec *p, gpo
- 
-     // The rest
-     if (g_object_class_find_property(G_OBJECT_GET_CLASS(source), "extra-headers") != 0) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        GstStructure *extras = gst_structure_new_empty("extras");
-+#else
-         GstStructure *extras = gst_structure_empty_new("extras");
-+#endif
- 
-         foreach (const QByteArray &rawHeader, self->m_request.rawHeaderList()) {
-             if (rawHeader == userAgentString) // Filter User-Agent
-@@ -1623,7 +1685,11 @@ GstAutoplugSelectResult QGstreamerPlayerSession::handleAutoplugSelect(GstBin *bi
-     const gchar *factoryName = gst_plugin_feature_get_name(GST_PLUGIN_FEATURE(factory));
-     if (g_str_has_prefix(factoryName, "vaapi")) {
-         GstPad *sinkPad = gst_element_get_static_pad(session->m_videoSink, "sink");
-+#if GST_CHECK_VERSION(1,0,0)
-+        GstCaps *sinkCaps = gst_pad_query_caps(sinkPad, NULL);
-+#else
-         GstCaps *sinkCaps = gst_pad_get_caps(sinkPad);
-+#endif
- 
- #if (GST_VERSION_MAJOR == 0) && ((GST_VERSION_MINOR < 10) || (GST_VERSION_MICRO < 33))
-         if (!factory_can_src_any_caps(factory, sinkCaps))
-@@ -1652,14 +1718,19 @@ void QGstreamerPlayerSession::handleElementAdded(GstBin *bin, GstElement *elemen
-         // Disable on-disk buffering.
-         g_object_set(G_OBJECT(element), "temp-template", NULL, NULL);
-     } else if (g_str_has_prefix(elementName, "uridecodebin") ||
--               g_str_has_prefix(elementName, "decodebin2")) {
--
-+#if GST_CHECK_VERSION(1,0,0)
-+        g_str_has_prefix(elementName, "decodebin")) {
-+#else
-+        g_str_has_prefix(elementName, "decodebin2")) {
-+#endif
-         if (g_str_has_prefix(elementName, "uridecodebin")) {
-             // Add video/x-surface (VAAPI) to default raw formats
-             g_object_set(G_OBJECT(element), "caps", gst_static_caps_get(&static_RawCaps), NULL);
-             // listen for uridecodebin autoplug-select to skip VAAPI usage when the current
-             // video sink doesn't support it
-+#if !(GST_CHECK_VERSION(1,0,0))
-             g_signal_connect(element, "autoplug-select", G_CALLBACK(handleAutoplugSelect), session);
-+#endif
-         }
- 
-         //listen for queue2 element added to uridecodebin/decodebin2 as well.
-@@ -1727,7 +1798,27 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerVideoProbeControl* probe)
-     // Assume user releases any outstanding references to video frames.
- }
- 
--gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
-+#if GST_CHECK_VERSION(1,0,0)
-+GstPadProbeReturn QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
-+{
-+    Q_UNUSED(pad);
-+    GstBuffer* buffer = GST_PAD_PROBE_INFO_BUFFER(info);
-+
-+    QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
-+    QMutexLocker locker(&session->m_videoProbeMutex);
-+
-+    if (session->m_videoProbes.isEmpty())
-+        return GST_PAD_PROBE_OK;
-+
-+    foreach (QGstreamerVideoProbeControl* probe, session->m_videoProbes)
-+        probe->bufferProbed(buffer, gst_pad_get_current_caps(pad));
-+
-+    return GST_PAD_PROBE_OK;
-+}
-+
-+#else
-+
-+static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
- {
-     Q_UNUSED(pad);
- 
-@@ -1742,6 +1833,7 @@ gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *bu
- 
-     return TRUE;
- }
-+#endif
- 
- void QGstreamerPlayerSession::addProbe(QGstreamerAudioProbeControl* probe)
- {
-@@ -1759,6 +1851,24 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerAudioProbeControl* probe)
-     m_audioProbes.removeOne(probe);
- }
- 
-+#if GST_CHECK_VERSION(1,0,0)
-+GstPadProbeReturn  QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstPadProbeInfo* info, gpointer user_data)
-+{
-+    Q_UNUSED(pad);
-+    GstBuffer* buffer = GST_PAD_PROBE_INFO_BUFFER(info);
-+
-+    QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
-+    QMutexLocker locker(&session->m_audioProbeMutex);
-+
-+    if (session->m_audioProbes.isEmpty())
-+        return GST_PAD_PROBE_OK;
-+
-+    foreach (QGstreamerAudioProbeControl* probe, session->m_audioProbes)
-+        probe->bufferProbed(buffer, gst_pad_get_current_caps(pad));
-+
-+    return GST_PAD_PROBE_OK;
-+}
-+#else
- gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
- {
-     Q_UNUSED(pad);
-@@ -1774,7 +1884,7 @@ gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *bu
- 
-     return TRUE;
- }
--
-+#endif
- // This function is similar to stop(),
- // but does not set m_everPlayed, m_lastPosition,
- // and setSeekable() values.
-@@ -1807,7 +1917,11 @@ void QGstreamerPlayerSession::removeVideoBufferProbe()
- 
-     GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
-     if (pad) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        gst_pad_remove_probe(pad, m_videoBufferProbeId);
-+#else
-         gst_pad_remove_buffer_probe(pad, m_videoBufferProbeId);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
- 
-@@ -1822,7 +1936,11 @@ void QGstreamerPlayerSession::addVideoBufferProbe()
- 
-     GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
-     if (pad) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        m_videoBufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padVideoBufferProbe, this, NULL);
-+#else
-         m_videoBufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padVideoBufferProbe), this);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
- }
-@@ -1839,7 +1957,11 @@ void QGstreamerPlayerSession::removeAudioBufferProbe()
- 
-     GstPad *pad = gst_element_get_static_pad(m_audioSink, "sink");
-     if (pad) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        gst_pad_remove_probe(pad, m_audioBufferProbeId);
-+#else
-         gst_pad_remove_buffer_probe(pad, m_audioBufferProbeId);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
- 
-@@ -1854,7 +1976,11 @@ void QGstreamerPlayerSession::addAudioBufferProbe()
- 
-     GstPad *pad = gst_element_get_static_pad(m_audioSink, "sink");
-     if (pad) {
-+#if GST_CHECK_VERSION(1,0,0)
-+        m_audioBufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padAudioBufferProbe, this, NULL);
-+#else
-         m_audioBufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padAudioBufferProbe), this);
-+#endif
-         gst_object_unref(GST_OBJECT(pad));
-     }
- }
-@@ -1887,7 +2013,7 @@ void QGstreamerPlayerSession::playlistTypeFindFunction(GstTypeFind *find, gpoint
-         length = qMin(length, guint64(1024));
- 
-     while (length > 0) {
--        guint8 *data = gst_type_find_peek(find, 0, length);
-+        const guint8 *data = gst_type_find_peek(find, 0, length);
-         if (data) {
-             session->m_isPlaylist = (QPlaylistFileParser::findPlaylistType(QString::fromUtf8(uri), 0, data, length) != QPlaylistFileParser::UNKNOWN);
-             return;
-diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
-index f2e760a..50bda3d 100644
---- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
-+++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
-@@ -119,11 +119,19 @@ public:
- 
-     void addProbe(QGstreamerVideoProbeControl* probe);
-     void removeProbe(QGstreamerVideoProbeControl* probe);
-+#if GST_CHECK_VERSION(1,0,0)
-+    static GstPadProbeReturn padVideoBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data);
-+#else
-     static gboolean padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
-+#endif
- 
-     void addProbe(QGstreamerAudioProbeControl* probe);
-     void removeProbe(QGstreamerAudioProbeControl* probe);
-+#if GST_CHECK_VERSION(1,0,0)
-+    static GstPadProbeReturn padAudioBufferProbe(GstPad *pad, GstPadProbeInfo* info, gpointer user_data);
-+#else
-     static gboolean padAudioBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
-+#endif
- 
-     void endOfMediaReset();
- 
-@@ -252,6 +260,7 @@ private:
-     bool m_isLiveSource;
- 
-     bool m_isPlaylist;
-+    gulong pad_probe_id;
- };
- 
- QT_END_NAMESPACE
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
new file mode 100644
index 0000000..e2a46df
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -0,0 +1,2369 @@
+From 8b306a5a70d431b8e142b3a7efb32d897cb79ab5 Mon Sep 17 00:00:00 2001
+From: Yoann Lopes <yoann.lopes@digia.com>
+Date: Thu, 31 Oct 2013 15:06:30 +0100
+Subject: [PATCH] Initial porting effort to GStreamer 1.0.
+
+Imported from git@github.com:jhodapp/qtmultimedia.git
+
+Contributions from:
+Ilya Smelykh <ilya@videoexpertsgroup.com>
+Jim Hodapp <jim.hodapp@canonical.com>
+Sergio Schvezov <sergio.schvezov@canonical.com>
+
+Change-Id: I10fa5e5078efa4564ce833befd417008e26a90a9
+Reviewed-by: Yoann Lopes <yoann.lopes@digia.com>
+(cherry picked from commit d91dac090d92fdbc3a3425e8d969c62e5c79eff9)
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+
+Conflicts:
+	src/gsttools/qgstreamervideorenderer.cpp
+	src/gsttools/qgstreamervideowidget.cpp
+	src/gsttools/qgstreamervideowindow.cpp
+	src/plugins/gstreamer/camerabin/camerabinsession.cpp
+	src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
+	src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
+---
+ config.tests/gstreamer/gstreamer.pro               |  11 +-
+ config.tests/gstreamer_appsrc/gstreamer_appsrc.pro |  13 +-
+ .../gstreamer_encodingprofiles.pro                 |  13 +-
+ .../gstreamer_photography.pro                      |  15 +-
+ qtmultimedia.pro                                   |  25 ++-
+ src/gsttools/gsttools.pro                          |  22 +--
+ src/gsttools/gstvideoconnector.c                   | 199 +++++++++++++++++++--
+ src/gsttools/qgstappsrc.cpp                        |  29 ++-
+ src/gsttools/qgstreameraudioprobecontrol.cpp       |  19 +-
+ src/gsttools/qgstreamerbushelper.cpp               |   8 +
+ src/gsttools/qgstreamervideoprobecontrol.cpp       |   9 +
+ src/gsttools/qgstreamervideorenderer.cpp           |   3 +-
+ src/gsttools/qgstreamervideowidget.cpp             |  29 ++-
+ src/gsttools/qgstreamervideowindow.cpp             |  79 +++++++-
+ src/gsttools/qgstutils.cpp                         |  27 ++-
+ src/gsttools/qgstvideobuffer.cpp                   |  18 +-
+ src/gsttools/qvideosurfacegstsink.cpp              | 136 +++++++++++++-
+ src/multimedia/gsttools_headers/qgstappsrc_p.h     |   3 +
+ .../qgstreameraudioprobecontrol_p.h                |   5 +-
+ .../qgstreamervideoprobecontrol_p.h                |   4 +
+ .../gsttools_headers/qgstreamervideowindow_p.h     |   4 +
+ src/multimedia/gsttools_headers/qgstutils_p.h      |   4 +
+ .../gsttools_headers/qgstvideobuffer_p.h           |   3 +
+ .../gsttools_headers/qvideosurfacegstsink_p.h      |   6 +-
+ .../qgstreameraudiodecoderserviceplugin.cpp        |  27 ++-
+ .../audiodecoder/qgstreameraudiodecodersession.cpp |  33 +++-
+ .../gstreamer/camerabin/camerabinsession.cpp       |  25 +++
+ src/plugins/gstreamer/common.pri                   |  21 ++-
+ src/plugins/gstreamer/gstreamer.pro                |   3 +-
+ .../mediacapture/qgstreamercapturesession.cpp      |   5 +
+ src/plugins/gstreamer/mediaplayer/mediaplayer.pro  |   1 -
+ .../mediaplayer/qgstreamerplayercontrol.cpp        |   2 +
+ .../mediaplayer/qgstreamerplayerservice.cpp        |   9 +-
+ .../mediaplayer/qgstreamerplayerserviceplugin.cpp  |  27 ++-
+ .../mediaplayer/qgstreamerplayersession.cpp        | 154 ++++++++++++++--
+ .../mediaplayer/qgstreamerplayersession.h          |   9 +
+ 36 files changed, 871 insertions(+), 129 deletions(-)
+
+diff --git a/config.tests/gstreamer/gstreamer.pro b/config.tests/gstreamer/gstreamer.pro
+index 02a7e34..6b9843a 100644
+--- a/config.tests/gstreamer/gstreamer.pro
++++ b/config.tests/gstreamer/gstreamer.pro
+@@ -3,11 +3,10 @@ SOURCES += main.cpp
+ CONFIG += link_pkgconfig
+ 
+ PKGCONFIG += \
+-    gstreamer-0.10 \
+-    gstreamer-base-0.10 \
+-    gstreamer-interfaces-0.10 \
+-    gstreamer-audio-0.10 \
+-    gstreamer-video-0.10 \
+-    gstreamer-pbutils-0.10
++    gstreamer-$$GST_VERSION \
++    gstreamer-base-$$GST_VERSION \
++    gstreamer-audio-$$GST_VERSION \
++    gstreamer-video-$$GST_VERSION \
++    gstreamer-pbutils-$$GST_VERSION
+ 
+ 
+diff --git a/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro b/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
+index 9f61703..0f3ca2b 100644
+--- a/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
++++ b/config.tests/gstreamer_appsrc/gstreamer_appsrc.pro
+@@ -3,11 +3,8 @@ SOURCES += main.cpp
+ CONFIG += link_pkgconfig
+ 
+ PKGCONFIG += \
+-    gstreamer-0.10 \
+-    gstreamer-base-0.10 \
+-    gstreamer-interfaces-0.10 \
+-    gstreamer-audio-0.10 \
+-    gstreamer-video-0.10 \
+-    gstreamer-app-0.10
+-
+-
++    gstreamer-$$GST_VERSION \
++    gstreamer-base-$$GST_VERSION \
++    gstreamer-audio-$$GST_VERSION \
++    gstreamer-video-$$GST_VERSION \
++    gstreamer-pbutils-$$GST_VERSION
+diff --git a/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro b/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
+index 7e8a9e7..fad40b0 100644
+--- a/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
++++ b/config.tests/gstreamer_encodingprofiles/gstreamer_encodingprofiles.pro
+@@ -2,11 +2,10 @@ SOURCES += main.cpp
+ 
+ CONFIG += link_pkgconfig
+ 
+-PKGCONFIG += \
+-    gstreamer-0.10 \
+-    gstreamer-base-0.10 \
+-    gstreamer-interfaces-0.10 \
+-    gstreamer-audio-0.10 \
+-    gstreamer-video-0.10 \
+-    gstreamer-pbutils-0.10
+ 
++PKGCONFIG += \
++    gstreamer-$$GST_VERSION \
++    gstreamer-base-$$GST_VERSION \
++    gstreamer-audio-$$GST_VERSION \
++    gstreamer-video-$$GST_VERSION \
++    gstreamer-pbutils-$$GST_VERSION
+diff --git a/config.tests/gstreamer_photography/gstreamer_photography.pro b/config.tests/gstreamer_photography/gstreamer_photography.pro
+index 6b530cb..975991f 100644
+--- a/config.tests/gstreamer_photography/gstreamer_photography.pro
++++ b/config.tests/gstreamer_photography/gstreamer_photography.pro
+@@ -3,12 +3,11 @@ SOURCES += main.cpp
+ CONFIG += link_pkgconfig
+ 
+ PKGCONFIG += \
+-    gstreamer-0.10 \
+-    gstreamer-base-0.10 \
+-    gstreamer-interfaces-0.10 \
+-    gstreamer-audio-0.10 \
+-    gstreamer-video-0.10 \
+-    gstreamer-pbutils-0.10
+-
+-LIBS += -lgstphotography-0.10
++    gstreamer-$$GST_VERSION \
++    gstreamer-base-$$GST_VERSION \
++    gstreamer-audio-$$GST_VERSION \
++    gstreamer-video-$$GST_VERSION \
++    gstreamer-pbutils-$$GST_VERSION
++
++LIBS += -lgstphotography-$$GST_VERSION
+ 
+diff --git a/qtmultimedia.pro b/qtmultimedia.pro
+index cf97e64..d94d6a2 100644
+--- a/qtmultimedia.pro
++++ b/qtmultimedia.pro
+@@ -17,11 +17,26 @@ win32 {
+ } else {
+     contains(QT_CONFIG, alsa):qtCompileTest(alsa)
+     contains(QT_CONFIG, pulseaudio):qtCompileTest(pulseaudio)
+-    qtCompileTest(gstreamer) {
+-        qtCompileTest(gstreamer_photography)
+-        qtCompileTest(gstreamer_encodingprofiles)
+-        qtCompileTest(gstreamer_appsrc)
+-        qtCompileTest(linux_v4l)
++    !done_config_gstreamer {
++        gstver=1.0
++        cache(GST_VERSION, set, gstver);
++        qtCompileTest(gstreamer) {
++            qtCompileTest(gstreamer_photography)
++            qtCompileTest(gstreamer_encodingprofiles)
++            qtCompileTest(gstreamer_appsrc)
++            qtCompileTest(linux_v4l)
++        } else {
++            gstver=0.10
++            cache(GST_VERSION, set, gstver);
++            # Force a re-run of the test
++            CONFIG -= done_config_gstreamer
++            qtCompileTest(gstreamer) {
++                qtCompileTest(gstreamer_photography)
++                qtCompileTest(gstreamer_encodingprofiles)
++                qtCompileTest(gstreamer_appsrc)
++                qtCompileTest(linux_v4l)
++            }
++        }
+     }
+     qtCompileTest(resourcepolicy)
+     qtCompileTest(gpu_vivante)
+diff --git a/src/gsttools/gsttools.pro b/src/gsttools/gsttools.pro
+index 7c809a7..6b9bf5d 100644
+--- a/src/gsttools/gsttools.pro
++++ b/src/gsttools/gsttools.pro
+@@ -2,7 +2,7 @@ TEMPLATE = lib
+ 
+ TARGET = qgsttools_p
+ QPRO_PWD = $$PWD
+-QT = core-private multimedia-private gui-private
++QT = core-private multimedia-private gui-private opengl
+ 
+ !static:DEFINES += QT_MAKEDLL
+ DEFINES += GLIB_VERSION_MIN_REQUIRED=GLIB_VERSION_2_26
+@@ -15,13 +15,14 @@ LIBS_PRIVATE += \
+ 
+ CONFIG += link_pkgconfig
+ 
+-PKGCONFIG_PRIVATE += \
+-    gstreamer-0.10 \
+-    gstreamer-base-0.10 \
+-    gstreamer-interfaces-0.10 \
+-    gstreamer-audio-0.10 \
+-    gstreamer-video-0.10 \
+-    gstreamer-pbutils-0.10
++PKGCONFIG += \
++    gstreamer-$$GST_VERSION \
++    gstreamer-base-$$GST_VERSION \
++    gstreamer-audio-$$GST_VERSION \
++    gstreamer-video-$$GST_VERSION \
++    gstreamer-pbutils-$$GST_VERSION
++
++equals(GST_VERSION,"0.10"): PKGCONFIG_PRIVATE += gstreamer-interfaces-$$GST_VERSION
+ 
+ maemo*: PKGCONFIG_PRIVATE +=gstreamer-plugins-bad-0.10
+ 
+@@ -33,6 +34,7 @@ config_resourcepolicy {
+ # Header files must go inside source directory of a module
+ # to be installed by syncqt.
+ INCLUDEPATH += ../multimedia/gsttools_headers/
++INCLUDEPATH += ../plugins/gstreamer/mediaplayer/
+ VPATH += ../multimedia/gsttools_headers/
+ 
+ PRIVATE_HEADERS += \
+@@ -91,13 +93,13 @@ maemo6 {
+ }
+ 
+ config_gstreamer_appsrc {
+-    PKGCONFIG_PRIVATE += gstreamer-app-0.10
++    PKGCONFIG_PRIVATE += gstreamer-app-$$GST_VERSION
+     PRIVATE_HEADERS += qgstappsrc_p.h
+     SOURCES += qgstappsrc.cpp
+ 
+     DEFINES += HAVE_GST_APPSRC
+ 
+-    LIBS_PRIVATE += -lgstapp-0.10
++    LIBS_PRIVATE += -lgstapp-$$GST_VERSION
+ }
+ 
+ config_linux_v4l: DEFINES += USE_V4L
+diff --git a/src/gsttools/gstvideoconnector.c b/src/gsttools/gstvideoconnector.c
+index 3ed539e..ed0ed3c 100644
+--- a/src/gsttools/gstvideoconnector.c
++++ b/src/gsttools/gstvideoconnector.c
+@@ -59,26 +59,93 @@ GST_STATIC_PAD_TEMPLATE ("src",
+                          GST_PAD_ALWAYS,
+                          GST_STATIC_CAPS_ANY);
+ 
++
++#if GST_CHECK_VERSION(1,0,0)
++
++G_DEFINE_TYPE(GstVideoConnector, gst_video_connector, GST_TYPE_ELEMENT);
++#else
+ #define _do_init(bla) \
+     GST_DEBUG_CATEGORY_INIT (video_connector_debug, \
+     "video-connector", 0, "An identity like element for reconnecting video stream");
+ 
+ GST_BOILERPLATE_FULL (GstVideoConnector, gst_video_connector, GstElement,
+                       GST_TYPE_ELEMENT, _do_init);
++#endif
+ 
+ static void gst_video_connector_dispose (GObject * object);
++
++#if GST_CHECK_VERSION(1,0,0)
++static GstFlowReturn gst_video_connector_chain (GstPad * pad, GstObject* parent, GstBuffer * buf);
++#else
+ static GstFlowReturn gst_video_connector_chain (GstPad * pad, GstBuffer * buf);
+ static GstFlowReturn gst_video_connector_buffer_alloc (GstPad * pad,
+                                                        guint64 offset, guint size, GstCaps * caps, GstBuffer ** buf);
++#endif
++
+ static GstStateChangeReturn gst_video_connector_change_state (GstElement *
+                                                               element, GstStateChange transition);
++
++#if GST_CHECK_VERSION(1,0,0)
++static gboolean gst_video_connector_handle_sink_event (GstPad * pad, GstObject* parent,
++                                                       GstEvent * event);
++#else
+ static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
+                                                        GstEvent * event);
++#endif
++
++#if GST_CHECK_VERSION(1,0,0)
++static GstPadProbeReturn gst_video_connector_new_buffer_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
++static GstPadProbeReturn gst_video_connector_new_event_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
++static GstPadProbeReturn gst_video_connector_new_query_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object);
++#else
+ static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *buffer, guint * object);
+-static void gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal);
+ static gboolean gst_video_connector_setcaps (GstPad  *pad, GstCaps *caps);
+ static GstCaps *gst_video_connector_getcaps (GstPad * pad);
+ static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps);
++#endif
++
++static void gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal);
++
++#if GST_CHECK_VERSION(1,0,0)
++static void
++gst_video_connector_class_init (GstVideoConnectorClass * klass)
++{
++    GObjectClass *gobject_class = G_OBJECT_CLASS (klass);
++    GstElementClass *gstelement_class = GST_ELEMENT_CLASS (klass);
++
++    gst_element_class_set_details_simple (gstelement_class, "Video Connector",
++                                          "Generic",
++                                          "An identity like element used for reconnecting video stream",
++                                          "Dmytro Poplavskiy <dmytro.poplavskiy@nokia.com>");
++    gst_element_class_add_pad_template (gstelement_class,
++                                        gst_static_pad_template_get (&gst_video_connector_sink_factory));
++    gst_element_class_add_pad_template (gstelement_class,
++                                        gst_static_pad_template_get (&gst_video_connector_src_factory));
++
++    gst_video_connector_parent_class = g_type_class_peek_parent (klass);
++
++    gobject_class->dispose = gst_video_connector_dispose;
++    gstelement_class->change_state = gst_video_connector_change_state;
++    klass->resend_new_segment = gst_video_connector_resend_new_segment;
++
++    gst_video_connector_signals[SIGNAL_RESEND_NEW_SEGMENT] =
++            g_signal_new ("resend-new-segment", G_TYPE_FROM_CLASS (klass),
++                          G_SIGNAL_RUN_LAST | G_SIGNAL_ACTION,
++                          G_STRUCT_OFFSET (GstVideoConnectorClass, resend_new_segment), NULL, NULL,
++                          g_cclosure_marshal_VOID__BOOLEAN, G_TYPE_NONE, 1, G_TYPE_BOOLEAN);
++
++    gst_video_connector_signals[SIGNAL_CONNECTION_FAILED] =
++            g_signal_new ("connection-failed", G_TYPE_FROM_CLASS (klass),
++                          G_SIGNAL_RUN_LAST,
++                          0, NULL, NULL,
++                          g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0);
++
++    GST_DEBUG_CATEGORY_INIT(video_connector_debug, "video-connector", 0,
++                            "An identity like element for reconnecting video stream");
++
++}
++
++#else
+ 
+ static void
+ gst_video_connector_base_init (gpointer g_class)
+@@ -120,18 +187,33 @@ gst_video_connector_class_init (GstVideoConnectorClass * klass)
+                           g_cclosure_marshal_VOID__VOID, G_TYPE_NONE, 0);
+ }
+ 
++#endif
++
+ static void
+-gst_video_connector_init (GstVideoConnector *element,
+-                          GstVideoConnectorClass *g_class)
++gst_video_connector_init (GstVideoConnector *element
++#if GST_CHECK_VERSION(1,0,0)
++#else
++                          ,GstVideoConnectorClass *g_class
++#endif
++                          )
+ {
++#if GST_CHECK_VERSION(1,0,0)
++#else
+     (void) g_class;
++#endif
+     element->sinkpad =
+             gst_pad_new_from_static_template (&gst_video_connector_sink_factory,
+                                               "sink");
+     gst_pad_set_chain_function(element->sinkpad,
+                                GST_DEBUG_FUNCPTR (gst_video_connector_chain));
++#if GST_CHECK_VERSION(1,0,0)
++    /* gstreamer 1.x uses QUERIES and EVENTS for allocation and caps handiling purposes */
++    GST_OBJECT_FLAG_SET (element->sinkpad, GST_PAD_FLAG_PROXY_CAPS);
++    GST_OBJECT_FLAG_SET (element->sinkpad, GST_PAD_FLAG_PROXY_ALLOCATION);
++#else
+     gst_pad_set_event_function(element->sinkpad,
+                                GST_DEBUG_FUNCPTR (gst_video_connector_handle_sink_event));
++
+     gst_pad_set_bufferalloc_function(element->sinkpad,
+                                      GST_DEBUG_FUNCPTR (gst_video_connector_buffer_alloc));
+     gst_pad_set_setcaps_function(element->sinkpad,
+@@ -140,14 +222,23 @@ gst_video_connector_init (GstVideoConnector *element,
+                                GST_DEBUG_FUNCPTR(gst_video_connector_getcaps));
+     gst_pad_set_acceptcaps_function(element->sinkpad,
+                                GST_DEBUG_FUNCPTR(gst_video_connector_acceptcaps));
+-
++#endif
+     gst_element_add_pad (GST_ELEMENT (element), element->sinkpad);
+ 
+     element->srcpad =
+             gst_pad_new_from_static_template (&gst_video_connector_src_factory,
+                                               "src");
++#if GST_CHECK_VERSION(1,0,0)
++    gst_pad_add_probe(element->srcpad, GST_PAD_PROBE_TYPE_BUFFER,
++                             gst_video_connector_new_buffer_probe, element, NULL);
++    gst_pad_add_probe(element->srcpad, GST_PAD_PROBE_TYPE_QUERY_DOWNSTREAM,
++                             gst_video_connector_new_query_probe, element, NULL);
++    gst_pad_add_probe(element->sinkpad, GST_PAD_PROBE_TYPE_EVENT_DOWNSTREAM,
++                             gst_video_connector_new_event_probe, element, NULL);
++#else
+     gst_pad_add_buffer_probe(element->srcpad,
+                              G_CALLBACK(gst_video_connector_new_buffer_probe), element);
++#endif
+     gst_element_add_pad (GST_ELEMENT (element), element->srcpad);
+ 
+     element->relinked = FALSE;
+@@ -175,9 +266,16 @@ gst_video_connector_dispose (GObject * object)
+ 
+     gst_video_connector_reset (element);
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    G_OBJECT_CLASS (gst_video_connector_parent_class)->dispose (object);
++#else
+     G_OBJECT_CLASS (parent_class)->dispose (object);
++#endif
+ }
+ 
++#if GST_CHECK_VERSION(1,0,0)
++/* For gstreamer 1.x we handle it in ALLOCATION Query */
++#else
+ // "When this function returns anything else than GST_FLOW_OK,
+ // the buffer allocation failed and buf does not contain valid data."
+ static GstFlowReturn
+@@ -221,6 +319,7 @@ gst_video_connector_buffer_alloc (GstPad * pad, guint64 offset, guint size,
+                 if (state == GST_STATE_NULL) {
+                     GST_DEBUG_OBJECT (element, "Downstream element is in NULL state");
+                     // Downstream filter seems to be in the wrong state
++
+                     return GST_FLOW_UNEXPECTED;
+                 }
+             }
+@@ -293,6 +392,7 @@ static GstCaps *gst_video_connector_getcaps (GstPad * pad)
+     return caps;
+ }
+ 
++
+ static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
+ {
+     GstVideoConnector *element;
+@@ -300,6 +400,7 @@ static gboolean gst_video_connector_acceptcaps (GstPad * pad, GstCaps * caps)
+ 
+     return gst_pad_peer_accept_caps(element->srcpad, caps);
+ }
++#endif
+ 
+ static void
+ gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailedSignal)
+@@ -311,11 +412,39 @@ gst_video_connector_resend_new_segment(GstElement * element, gboolean emitFailed
+         connector->failedSignalEmited = FALSE;
+ }
+ 
++#if GST_CHECK_VERSION(1,0,0)
++static GstPadProbeReturn gst_video_connector_new_event_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
++{
++    GstVideoConnector *connector = GST_VIDEO_CONNECTOR (object);
++    GstEvent *event = gst_pad_probe_info_get_event(info);
++
++    GST_DEBUG_OBJECT(connector, "Event %"GST_PTR_FORMAT" received\n", event);
++
++    return GST_PAD_PROBE_OK;
++}
++
++static GstPadProbeReturn gst_video_connector_new_query_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
++{
++    GstVideoConnector *connector = GST_VIDEO_CONNECTOR (object);
++    GstQuery *query = gst_pad_probe_info_get_query(info);
++
++    GST_DEBUG_OBJECT(connector, "Query %"GST_PTR_FORMAT" received\n", query);
++
++    return GST_PAD_PROBE_OK;
++}
++#endif
+ 
++#if GST_CHECK_VERSION(1,0,0)
++static GstPadProbeReturn gst_video_connector_new_buffer_probe(GstPad *pad, GstPadProbeInfo *info, gpointer object)
++{
++    (void) info;
++#else
+ static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *buffer, guint * object)
+ {
+-    (void) pad;
+     (void) buffer;
++#endif
++    (void) pad;
++
+ 
+     GstVideoConnector *element = GST_VIDEO_CONNECTOR (object);
+ 
+@@ -327,16 +456,23 @@ static gboolean gst_video_connector_new_buffer_probe(GstObject *pad, GstBuffer *
+     if (element->relinked)
+         GST_LOG_OBJECT(element, "rejected buffer because of new segment request");
+ 
+-    return !element->relinked;
++    return element->relinked ? GST_PAD_PROBE_DROP : GST_PAD_PROBE_OK;
+ }
+ 
+-
+ static GstFlowReturn
++#if GST_CHECK_VERSION(1,0,0)
++gst_video_connector_chain (GstPad * pad, GstObject* parent, GstBuffer * buf)
++#else
+ gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
++#endif
+ {
+     GstFlowReturn res;
+     GstVideoConnector *element;
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    (void)parent;
++#endif
++
+     element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
+ 
+     do {
+@@ -348,20 +484,29 @@ gst_video_connector_chain (GstPad * pad, GstBuffer * buf)
+         */
+         while (element->relinked) {
+             element->relinked = FALSE;
+-
++#if GST_CHECK_VERSION(1,0,0)
++            if (element->latest_buffer && GST_BUFFER_TIMESTAMP_IS_VALID(element->latest_buffer)) {
++                element->segment.position = GST_BUFFER_TIMESTAMP (element->latest_buffer);
++            }
++#else
+             gint64 pos = element->segment.last_stop;
+-
+             if (element->latest_buffer && GST_BUFFER_TIMESTAMP_IS_VALID(element->latest_buffer)) {
+                 pos = GST_BUFFER_TIMESTAMP (element->latest_buffer);
+             }
++#endif
+ 
+             //push a new segment and last buffer
++#if GST_CHECK_VERSION(1,0,0)
++            GstEvent *ev = gst_event_new_segment (&element->segment);
++
++#else
+             GstEvent *ev = gst_event_new_new_segment (TRUE,
+                                                       element->segment.rate,
+                                                       element->segment.format,
+                                                       pos, //start
+                                                       element->segment.stop,
+                                                       pos);
++#endif
+ 
+             GST_DEBUG_OBJECT (element, "Pushing new segment event");
+             if (!gst_pad_push_event (element->srcpad, ev)) {
+@@ -424,8 +569,11 @@ gst_video_connector_change_state (GstElement * element,
+     GstStateChangeReturn result;
+ 
+     connector = GST_VIDEO_CONNECTOR(element);
++#if GST_CHECK_VERSION(1,0,0)
++    result = GST_ELEMENT_CLASS (gst_video_connector_parent_class)->change_state(element, transition);
++#else
+     result = GST_ELEMENT_CLASS (parent_class)->change_state(element, transition);
+-
++#endif
+     switch (transition) {
+     case GST_STATE_CHANGE_PAUSED_TO_READY:
+         gst_video_connector_reset (connector);
+@@ -440,9 +588,32 @@ gst_video_connector_change_state (GstElement * element,
+     return result;
+ }
+ 
+-static gboolean
+-gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
++#if GST_CHECK_VERSION(1,0,0)
++static gboolean gst_video_connector_handle_sink_event (GstPad * pad, GstObject* parent,
++                                                       GstEvent * event)
++{
++    GstVideoConnector *element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
++
++    switch (GST_EVENT_TYPE (event)) {
++      case GST_EVENT_SEGMENT:
++      break;
++      case GST_EVENT_CAPS:
++      break;
++    default:
++      break;
++    }
++
++    gst_object_unref (element);
++    return gst_pad_event_default (pad, parent, event);
++}
++
++#else
++
++static gboolean gst_video_connector_handle_sink_event (GstPad * pad,
++                                                       GstEvent * event)
+ {
++    (void)parent;
++
+     if (GST_EVENT_TYPE (event) == GST_EVENT_NEWSEGMENT) {
+         GstVideoConnector *element = GST_VIDEO_CONNECTOR (gst_pad_get_parent (pad));
+ 
+@@ -453,7 +624,6 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
+ 
+         gst_event_parse_new_segment_full (event, &update, &rate, &arate, &format,
+                                           &start, &stop, &time);
+-
+         GST_LOG_OBJECT (element,
+                           "NEWSEGMENT update %d, rate %lf, applied rate %lf, "
+                           "format %d, " "%" G_GINT64_FORMAT " -- %" G_GINT64_FORMAT ", time %"
+@@ -461,9 +631,10 @@ gst_video_connector_handle_sink_event (GstPad * pad, GstEvent * event)
+ 
+         gst_segment_set_newsegment_full (&element->segment, update,
+                                          rate, arate, format, start, stop, time);
+-
+         gst_object_unref (element);
+     }
+ 
+     return gst_pad_event_default (pad, event);
+ }
++
++#endif
+diff --git a/src/gsttools/qgstappsrc.cpp b/src/gsttools/qgstappsrc.cpp
+index 561a96f..d5e106f 100644
+--- a/src/gsttools/qgstappsrc.cpp
++++ b/src/gsttools/qgstappsrc.cpp
+@@ -147,23 +147,44 @@ void QGstAppSrc::pushDataToAppSrc()
+             size = qMin(m_stream->bytesAvailable(), (qint64)m_dataRequestSize);
+ 
+         if (size) {
+-            void *data = g_malloc(size);
+-            GstBuffer* buffer = gst_app_buffer_new(data, size, g_free, data);
++            GstBuffer* buffer = gst_buffer_new_and_alloc(size);
++
++#if GST_CHECK_VERSION(1,0,0)
++            GstMapInfo mapInfo;
++            gst_buffer_map(buffer, &mapInfo, GST_MAP_WRITE);
++            void* bufferData = mapInfo.data;
++#else
++            void* bufferData = GST_BUFFER_DATA(buffer);
++#endif
++            
+             buffer->offset = m_stream->pos();
+-            qint64 bytesRead = m_stream->read((char*)GST_BUFFER_DATA(buffer), size);
++            qint64 bytesRead = m_stream->read((char*)bufferData, size);
+             buffer->offset_end =  buffer->offset + bytesRead - 1;
+ 
++#if GST_CHECK_VERSION(1,0,0)
++            gst_buffer_unmap(buffer, &mapInfo);
++#endif
++            
+             if (bytesRead > 0) {
+                 m_dataRequested = false;
+                 m_enoughData = false;
+                 GstFlowReturn ret = gst_app_src_push_buffer (GST_APP_SRC (element()), buffer);
+                 if (ret == GST_FLOW_ERROR) {
+                     qWarning()<<"appsrc: push buffer error";
++#if GST_CHECK_VERSION(1,0,0)
++                } else if (ret == GST_FLOW_FLUSHING) {
++                    qWarning()<<"appsrc: push buffer wrong state";
++                }
++#else
+                 } else if (ret == GST_FLOW_WRONG_STATE) {
+                     qWarning()<<"appsrc: push buffer wrong state";
+-                } else if (ret == GST_FLOW_RESEND) {
++                }
++#endif
++#if GST_VERSION_MAJOR < 1
++                else if (ret == GST_FLOW_RESEND) {
+                     qWarning()<<"appsrc: push buffer resend";
+                 }
++#endif
+             }
+         } else {
+             sendEOS();
+diff --git a/src/gsttools/qgstreameraudioprobecontrol.cpp b/src/gsttools/qgstreameraudioprobecontrol.cpp
+index 3baca53..be3de3f 100644
+--- a/src/gsttools/qgstreameraudioprobecontrol.cpp
++++ b/src/gsttools/qgstreameraudioprobecontrol.cpp
+@@ -45,9 +45,14 @@ QGstreamerAudioProbeControl::~QGstreamerAudioProbeControl()
+ 
+ }
+ 
++#if GST_CHECK_VERSION(1,0,0)
++void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer, GstCaps* caps)
++{
++#else
+ void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
+ {
+-    GstCaps* caps = gst_buffer_get_caps(buffer);
++    gst_buffer_get_caps(buffer);
++#endif
+     if (!caps)
+         return;
+ 
+@@ -56,8 +61,20 @@ void QGstreamerAudioProbeControl::bufferProbed(GstBuffer* buffer)
+     if (!format.isValid())
+         return;
+ 
++    #if GST_CHECK_VERSION(1,0,0)
++
++    GstMapInfo info;
++
++    gst_buffer_map (buffer, &info, GST_MAP_READ);
++    QAudioBuffer audioBuffer = QAudioBuffer(QByteArray((const char*)info.data, info.size), format);
++    gst_buffer_unmap(buffer, &info);
++
++    #else
++
+     QAudioBuffer audioBuffer = QAudioBuffer(QByteArray((const char*)buffer->data, buffer->size), format);
+ 
++    #endif
++
+     {
+         QMutexLocker locker(&m_bufferMutex);
+         m_pendingBuffer = audioBuffer;
+diff --git a/src/gsttools/qgstreamerbushelper.cpp b/src/gsttools/qgstreamerbushelper.cpp
+index 84eda46..eb1fc36 100644
+--- a/src/gsttools/qgstreamerbushelper.cpp
++++ b/src/gsttools/qgstreamerbushelper.cpp
+@@ -154,13 +154,21 @@ QGstreamerBusHelper::QGstreamerBusHelper(GstBus* bus, QObject* parent):
+     QObject(parent)
+ {
+     d = new QGstreamerBusHelperPrivate(this, bus);
++#if GST_CHECK_VERSION(1,0,0)
++    gst_bus_set_sync_handler(bus, (GstBusSyncHandler)syncGstBusFilter, d, 0);
++#else
+     gst_bus_set_sync_handler(bus, (GstBusSyncHandler)syncGstBusFilter, d);
++#endif
+     gst_object_ref(GST_OBJECT(bus));
+ }
+ 
+ QGstreamerBusHelper::~QGstreamerBusHelper()
+ {
++#if GST_CHECK_VERSION(1,0,0)
++    gst_bus_set_sync_handler(d->bus(), 0, 0, 0);
++#else
+     gst_bus_set_sync_handler(d->bus(),0,0);
++#endif
+     gst_object_unref(GST_OBJECT(d->bus()));
+ }
+ 
+diff --git a/src/gsttools/qgstreamervideoprobecontrol.cpp b/src/gsttools/qgstreamervideoprobecontrol.cpp
+index a78a9da..9c31140 100644
+--- a/src/gsttools/qgstreamervideoprobecontrol.cpp
++++ b/src/gsttools/qgstreamervideoprobecontrol.cpp
+@@ -67,12 +67,21 @@ void QGstreamerVideoProbeControl::stopFlushing()
+     m_flushing = false;
+ }
+ 
++#if GST_CHECK_VERSION(1,0,0)
++void QGstreamerVideoProbeControl::bufferProbed(GstBuffer* buffer, GstCaps* caps)
++#else
+ void QGstreamerVideoProbeControl::bufferProbed(GstBuffer* buffer)
++#endif
+ {
+     if (m_flushing)
+         return;
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    // FIXME:
++   // GstCaps* caps = NULL;//gst_buffer_get_caps(buffer);
++#else
+     GstCaps* caps = gst_buffer_get_caps(buffer);
++#endif
+     if (!caps)
+         return;
+ 
+diff --git a/src/gsttools/qgstreamervideorenderer.cpp b/src/gsttools/qgstreamervideorenderer.cpp
+index 2b66f76..804dce9 100644
+--- a/src/gsttools/qgstreamervideorenderer.cpp
++++ b/src/gsttools/qgstreamervideorenderer.cpp
+@@ -35,8 +35,7 @@
+ #include <private/qvideosurfacegstsink_p.h>
+ #include <private/qgstutils_p.h>
+ #include <qabstractvideosurface.h>
+-
+-#include <QDebug>
++#include <QtCore/qdebug.h>
+ 
+ #include <gst/gst.h>
+ 
+diff --git a/src/gsttools/qgstreamervideowidget.cpp b/src/gsttools/qgstreamervideowidget.cpp
+index b26369a..23674bb 100644
+--- a/src/gsttools/qgstreamervideowidget.cpp
++++ b/src/gsttools/qgstreamervideowidget.cpp
+@@ -40,8 +40,13 @@
+ #include <QtGui/qpainter.h>
+ 
+ #include <gst/gst.h>
++
++#if !GST_CHECK_VERSION(1,0,0)
+ #include <gst/interfaces/xoverlay.h>
+ #include <gst/interfaces/propertyprobe.h>
++#else
++#include <gst/video/videooverlay.h>
++#endif
+ 
+ QT_BEGIN_NAMESPACE
+ 
+@@ -161,9 +166,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
+ {
+     GstMessage* gm = message.rawMessage();
+ 
++#if !GST_CHECK_VERSION(1,0,0)
+     if (gm && (GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
+             gst_structure_has_name(gm->structure, "prepare-xwindow-id")) {
+-
++#else
++      if (gm && (GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
++              gst_structure_has_name(gst_message_get_structure(gm), "prepare-window-handle")) {
++#endif
+         setOverlay();
+         QMetaObject::invokeMethod(this, "updateNativeVideoSize", Qt::QueuedConnection);
+         return true;
+@@ -191,18 +200,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
+ 
+ void QGstreamerVideoWidgetControl::setOverlay()
+ {
++#if !GST_CHECK_VERSION(1,0,0)
+     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
+         gst_x_overlay_set_xwindow_id(GST_X_OVERLAY(m_videoSink), m_windowId);
+     }
++#else
++    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
++        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
++    }
++#endif
+ }
+ 
+ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
+ {
+     if (m_videoSink) {
+         //find video native size to update video widget size hint
+-        GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
++        GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
++#if !GST_CHECK_VERSION(1,0,0)
+         GstCaps *caps = gst_pad_get_negotiated_caps(pad);
+         gst_object_unref(GST_OBJECT(pad));
++#else
++        GstCaps *caps = gst_pad_get_current_caps(pad);
++        gst_object_unref(GST_OBJECT(pad));
++#endif
+ 
+         if (caps) {
+             m_widget->setNativeSize(QGstUtils::capsCorrectedResolution(caps));
+@@ -217,8 +237,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
+ 
+ void QGstreamerVideoWidgetControl::windowExposed()
+ {
++#if !GST_CHECK_VERSION(1,0,0)
+     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink))
+         gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
++#else
++    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink))
++        gst_video_overlay_expose(GST_VIDEO_OVERLAY(m_videoSink));
++#endif
+ }
+ 
+ QWidget *QGstreamerVideoWidgetControl::videoWidget()
+diff --git a/src/gsttools/qgstreamervideowindow.cpp b/src/gsttools/qgstreamervideowindow.cpp
+index a373dcc..587b010 100644
+--- a/src/gsttools/qgstreamervideowindow.cpp
++++ b/src/gsttools/qgstreamervideowindow.cpp
+@@ -37,8 +37,12 @@
+ #include <QtCore/qdebug.h>
+ 
+ #include <gst/gst.h>
++#include <gst/video/videooverlay.h>
++
++#if !GST_CHECK_VERSION(1,0,0)
+ #include <gst/interfaces/xoverlay.h>
+ #include <gst/interfaces/propertyprobe.h>
++#endif
+ 
+ 
+ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elementName)
+@@ -49,18 +53,25 @@ QGstreamerVideoWindow::QGstreamerVideoWindow(QObject *parent, const char *elemen
+     , m_fullScreen(false)
+     , m_colorKey(QColor::Invalid)
+ {
+-    if (elementName)
++    if (elementName) {
+         m_videoSink = gst_element_factory_make(elementName, NULL);
+-    else
++    } else {
+         m_videoSink = gst_element_factory_make("xvimagesink", NULL);
++    }
+ 
+     if (m_videoSink) {
+         qt_gst_object_ref_sink(GST_OBJECT(m_videoSink)); //Take ownership
+ 
+         GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
++#if GST_CHECK_VERSION(1,0,0)
++        m_bufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padBufferProbe, this, NULL);
++#else
+         m_bufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padBufferProbe), this);
++#endif
+         gst_object_unref(GST_OBJECT(pad));
+     }
++    else
++        qDebug() << "No m_videoSink available!";
+ }
+ 
+ QGstreamerVideoWindow::~QGstreamerVideoWindow()
+@@ -82,11 +93,15 @@ void QGstreamerVideoWindow::setWinId(WId id)
+     WId oldId = m_windowId;
+ 
+     m_windowId = id;
+-
++#if GST_CHECK_VERSION(1,0,0)
++    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
++        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
++    }
++#else
+     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
+         gst_x_overlay_set_xwindow_id(GST_X_OVERLAY(m_videoSink), m_windowId);
+     }
+-
++#endif
+     if (!oldId)
+         emit readyChanged(true);
+ 
+@@ -97,7 +112,20 @@ void QGstreamerVideoWindow::setWinId(WId id)
+ bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
+ {
+     GstMessage* gm = message.rawMessage();
++#if GST_CHECK_VERSION(1,0,0)
++    const GstStructure *s = gst_message_get_structure(gm);
++    if ((GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
++            gst_structure_has_name(s, "prepare-window-handle") &&
++            m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
++
++        gst_video_overlay_set_window_handle(GST_VIDEO_OVERLAY(m_videoSink), m_windowId);
+ 
++        GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
++        m_bufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padBufferProbe, this, NULL);
++
++        return true;
++    }
++#else
+     if ((GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) &&
+             gst_structure_has_name(gm->structure, "prepare-xwindow-id") &&
+             m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
+@@ -110,7 +138,7 @@ bool QGstreamerVideoWindow::processSyncMessage(const QGstreamerMessage &message)
+ 
+         return true;
+     }
+-
++#endif
+     return false;
+ }
+ 
+@@ -122,7 +150,19 @@ QRect QGstreamerVideoWindow::displayRect() const
+ void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
+ {
+     m_displayRect = rect;
+-
++#if GST_CHECK_VERSION(1,0,0)
++    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
++        if (m_displayRect.isEmpty())
++            gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY(m_videoSink), -1, -1, -1, -1);
++        else
++            gst_video_overlay_set_render_rectangle(GST_VIDEO_OVERLAY(m_videoSink),
++                                               m_displayRect.x(),
++                                               m_displayRect.y(),
++                                               m_displayRect.width(),
++                                               m_displayRect.height());
++        repaint();
++    }
++#else
+     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
+ #if GST_VERSION_MICRO >= 29
+         if (m_displayRect.isEmpty())
+@@ -136,6 +176,7 @@ void QGstreamerVideoWindow::setDisplayRect(const QRect &rect)
+         repaint();
+ #endif
+     }
++#endif
+ }
+ 
+ Qt::AspectRatioMode QGstreamerVideoWindow::aspectRatioMode() const
+@@ -157,6 +198,16 @@ void QGstreamerVideoWindow::setAspectRatioMode(Qt::AspectRatioMode mode)
+ 
+ void QGstreamerVideoWindow::repaint()
+ {
++#if GST_CHECK_VERSION(1,0,0)
++    if (m_videoSink && GST_IS_VIDEO_OVERLAY(m_videoSink)) {
++        //don't call gst_x_overlay_expose if the sink is in null state
++        GstState state = GST_STATE_NULL;
++        GstStateChangeReturn res = gst_element_get_state(m_videoSink, &state, NULL, 1000000);
++        if (res != GST_STATE_CHANGE_FAILURE && state != GST_STATE_NULL) {
++            gst_video_overlay_expose(GST_VIDEO_OVERLAY(m_videoSink));
++        }
++    }
++#else
+     if (m_videoSink && GST_IS_X_OVERLAY(m_videoSink)) {
+         //don't call gst_x_overlay_expose if the sink is in null state
+         GstState state = GST_STATE_NULL;
+@@ -165,6 +216,7 @@ void QGstreamerVideoWindow::repaint()
+             gst_x_overlay_expose(GST_X_OVERLAY(m_videoSink));
+         }
+     }
++#endif
+ }
+ 
+ QColor QGstreamerVideoWindow::colorKey() const
+@@ -296,11 +348,22 @@ QSize QGstreamerVideoWindow::nativeSize() const
+     return m_nativeSize;
+ }
+ 
++#if GST_CHECK_VERSION(1,0,0)
++GstPadProbeReturn QGstreamerVideoWindow::padBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
++#else
+ void QGstreamerVideoWindow::padBufferProbe(GstPad *pad, GstBuffer * /* buffer */, gpointer user_data)
++#endif
+ {
+     QGstreamerVideoWindow *control = reinterpret_cast<QGstreamerVideoWindow*>(user_data);
+     QMetaObject::invokeMethod(control, "updateNativeVideoSize", Qt::QueuedConnection);
++
++#if GST_CHECK_VERSION(1,0,0)
++    Q_UNUSED(pad);
++    Q_UNUSED(info);
++    return GST_PAD_PROBE_REMOVE;
++#else
+     gst_pad_remove_buffer_probe(pad, control->m_bufferProbeId);
++#endif
+ }
+ 
+ void QGstreamerVideoWindow::updateNativeVideoSize()
+@@ -311,7 +374,11 @@ void QGstreamerVideoWindow::updateNativeVideoSize()
+     if (m_videoSink) {
+         //find video native size to update video widget size hint
+         GstPad *pad = gst_element_get_static_pad(m_videoSink,"sink");
++#if GST_CHECK_VERSION(1,0,0)
++        GstCaps *caps = gst_pad_get_current_caps(pad);
++#else
+         GstCaps *caps = gst_pad_get_negotiated_caps(pad);
++#endif
+         gst_object_unref(GST_OBJECT(pad));
+ 
+         if (caps) {
+diff --git a/src/gsttools/qgstutils.cpp b/src/gsttools/qgstutils.cpp
+index 465f439..cb26137 100644
+--- a/src/gsttools/qgstutils.cpp
++++ b/src/gsttools/qgstutils.cpp
+@@ -90,8 +90,13 @@ static void addTagToMap(const GstTagList *list,
+             break;
+         default:
+             // GST_TYPE_DATE is a function, not a constant, so pull it out of the switch
++#if GST_CHECK_VERSION(1,0,0)
++            if (G_VALUE_TYPE(&val) == G_TYPE_DATE) {
++                const GDate *date = (const GDate *)g_value_get_boxed(&val);
++#else
+             if (G_VALUE_TYPE(&val) == GST_TYPE_DATE) {
+                 const GDate *date = gst_value_get_date(&val);
++#endif
+                 if (g_date_valid(date)) {
+                     int year = g_date_get_year(date);
+                     int month = g_date_get_month(date);
+@@ -255,6 +260,24 @@ QAudioFormat QGstUtils::audioFormatForCaps(const GstCaps *caps)
+ }
+ 
+ 
++
++#if GST_CHECK_VERSION(1,0,0)
++/*!
++  Returns audio format for a buffer.
++  If the buffer doesn't have a valid audio format, an empty QAudioFormat is returned.
++*/
++
++QAudioFormat QGstUtils::audioFormatForSample(GstSample *sample)
++{
++    GstCaps* caps = gst_sample_get_caps(sample);
++    if (!caps)
++        return QAudioFormat();
++
++    QAudioFormat format = QGstUtils::audioFormatForCaps(caps);
++    gst_caps_unref(caps);
++    return format;
++}
++#else
+ /*!
+   Returns audio format for a buffer.
+   If the buffer doesn't have a valid audio format, an empty QAudioFormat is returned.
+@@ -270,7 +293,7 @@ QAudioFormat QGstUtils::audioFormatForBuffer(GstBuffer *buffer)
+     gst_caps_unref(caps);
+     return format;
+ }
+-
++#endif
+ 
+ /*!
+   Builds GstCaps for an audio format.
+@@ -588,7 +611,7 @@ QByteArray QGstUtils::cameraDriver(const QString &device, GstElementFactory *fac
+ 
+ void qt_gst_object_ref_sink(gpointer object)
+ {
+-#if (GST_VERSION_MAJOR >= 0) && (GST_VERSION_MINOR >= 10) && (GST_VERSION_MICRO >= 24)
++#if (GST_VERSION_MAJOR >= 0) && (GST_VERSION_MINOR >= 10) && (GST_VERSION_MICRO >= 24) || GST_CHECK_VERSION(1,0,0)
+     gst_object_ref_sink(object);
+ #else
+     g_return_if_fail (GST_IS_OBJECT(object));
+diff --git a/src/gsttools/qgstvideobuffer.cpp b/src/gsttools/qgstvideobuffer.cpp
+index 18702ec..93f22f5 100644
+--- a/src/gsttools/qgstvideobuffer.cpp
++++ b/src/gsttools/qgstvideobuffer.cpp
+@@ -70,21 +70,33 @@ QAbstractVideoBuffer::MapMode QGstVideoBuffer::mapMode() const
+ uchar *QGstVideoBuffer::map(MapMode mode, int *numBytes, int *bytesPerLine)
+ {
+     if (mode != NotMapped && m_mode == NotMapped) {
+-        if (numBytes)
+-            *numBytes = m_buffer->size;
++        m_mode = mode;
+ 
+         if (bytesPerLine)
+             *bytesPerLine = m_bytesPerLine;
+ 
+-        m_mode = mode;
++#if GST_CHECK_VERSION(1,0,0)
++        gst_buffer_map(m_buffer, &m_mapInfo, GST_MAP_READ);
++        if (numBytes)
++            *numBytes = m_mapInfo.size;
++
++        return m_mapInfo.data;
++#else
++        if (numBytes)
++            *numBytes = m_buffer->size;
+ 
+         return m_buffer->data;
++#endif
+     } else {
+         return 0;
+     }
+ }
+ void QGstVideoBuffer::unmap()
+ {
++#if GST_CHECK_VERSION(1,0,0)
++    if (m_mode != NotMapped)
++        gst_buffer_unmap(m_buffer, &m_mapInfo);
++#endif
+     m_mode = NotMapped;
+ }
+ 
+diff --git a/src/gsttools/qvideosurfacegstsink.cpp b/src/gsttools/qvideosurfacegstsink.cpp
+index f3e2d88..94aaee7 100644
+--- a/src/gsttools/qvideosurfacegstsink.cpp
++++ b/src/gsttools/qvideosurfacegstsink.cpp
+@@ -43,7 +43,11 @@
+ 
+ #include "qvideosurfacegstsink_p.h"
+ 
+-//#define DEBUG_VIDEO_SURFACE_SINK
++#if GST_VERSION_MAJOR >=1
++#include <gst/video/video.h>
++#endif
++
++#define DEBUG_VIDEO_SURFACE_SINK
+ 
+ QT_BEGIN_NAMESPACE
+ 
+@@ -62,10 +66,12 @@ QVideoSurfaceGstDelegate::QVideoSurfaceGstDelegate(
+     if (m_surface) {
+         foreach (QObject *instance, bufferPoolLoader()->instances(QGstBufferPoolPluginKey)) {
+             QGstBufferPoolInterface* plugin = qobject_cast<QGstBufferPoolInterface*>(instance);
++
+             if (plugin) {
+                 m_pools.append(plugin);
+             }
+         }
++
+         updateSupportedFormats();
+         connect(m_surface, SIGNAL(supportedFormatsChanged()), this, SLOT(updateSupportedFormats()));
+     }
+@@ -198,6 +204,8 @@ GstFlowReturn QVideoSurfaceGstDelegate::render(GstBuffer *buffer)
+     if (QThread::currentThread() == thread()) {
+         if (!m_surface.isNull())
+             m_surface->present(m_frame);
++        else
++            qWarning() << "m_surface.isNull().";
+     } else {
+         QMetaObject::invokeMethod(this, "queuedRender", Qt::QueuedConnection);
+         m_renderCondition.wait(&m_mutex, 300);
+@@ -283,6 +291,27 @@ void QVideoSurfaceGstDelegate::updateSupportedFormats()
+     }
+ }
+ 
++#if GST_CHECK_VERSION(1,0,0)
++struct YuvFormat
++{
++    QVideoFrame::PixelFormat pixelFormat;
++    GstVideoFormat vfmt;
++    guint32 fourcc;
++    int bitsPerPixel;
++};
++
++static const YuvFormat qt_yuvColorLookup[] =
++{
++    { QVideoFrame::Format_YUV420P, GST_VIDEO_FORMAT_I420, GST_MAKE_FOURCC('I','4','2','0'), 8  },
++    { QVideoFrame::Format_YV12,    GST_VIDEO_FORMAT_YV12, GST_MAKE_FOURCC('Y','V','1','2'), 8  },
++    { QVideoFrame::Format_UYVY,    GST_VIDEO_FORMAT_UYVY, GST_MAKE_FOURCC('U','Y','V','Y'), 16 },
++    { QVideoFrame::Format_YUYV,    GST_VIDEO_FORMAT_YUY2, GST_MAKE_FOURCC('Y','U','Y','2'), 16 },
++    { QVideoFrame::Format_NV12,    GST_VIDEO_FORMAT_NV12, GST_MAKE_FOURCC('N','V','1','2'), 8 },
++    { QVideoFrame::Format_NV21,    GST_VIDEO_FORMAT_NV21, GST_MAKE_FOURCC('N','V','2','1'), 8 },
++    { QVideoFrame::Format_AYUV444, GST_VIDEO_FORMAT_AYUV, GST_MAKE_FOURCC('A','Y','U','V'), 32 },
++};
++
++#else
+ struct YuvFormat
+ {
+     QVideoFrame::PixelFormat pixelFormat;
+@@ -300,6 +329,7 @@ static const YuvFormat qt_yuvColorLookup[] =
+     { QVideoFrame::Format_NV21,    GST_MAKE_FOURCC('N','V','2','1'), 8 },
+     { QVideoFrame::Format_AYUV444, GST_MAKE_FOURCC('A','Y','U','V'), 32 }
+ };
++#endif
+ 
+ static int indexOfYuvColor(QVideoFrame::PixelFormat format)
+ {
+@@ -312,12 +342,20 @@ static int indexOfYuvColor(QVideoFrame::PixelFormat format)
+     return -1;
+ }
+ 
++#if GST_VERSION_MAJOR >=1
++static int indexOfYuvColor(GstVideoFormat vfmt)
++#else
+ static int indexOfYuvColor(guint32 fourcc)
++#endif
+ {
+     const int count = sizeof(qt_yuvColorLookup) / sizeof(YuvFormat);
+ 
+     for (int i = 0; i < count; ++i)
++#if GST_VERSION_MAJOR >=1
++        if (qt_yuvColorLookup[i].vfmt == vfmt)
++#else
+         if (qt_yuvColorLookup[i].fourcc == fourcc)
++#endif
+             return i;
+ 
+     return -1;
+@@ -388,13 +426,13 @@ GType QVideoSurfaceGstSink::get_type()
+     if (type == 0) {
+         static const GTypeInfo info =
+         {
+-            sizeof(QVideoSurfaceGstSinkClass),                    // class_size
++            sizeof(QVideoSurfaceGstSinkClass),                 // class_size
+             base_init,                                         // base_init
+             NULL,                                              // base_finalize
+             class_init,                                        // class_init
+             NULL,                                              // class_finalize
+             NULL,                                              // class_data
+-            sizeof(QVideoSurfaceGstSink),                         // instance_size
++            sizeof(QVideoSurfaceGstSink),                      // instance_size
+             0,                                                 // n_preallocs
+             instance_init,                                     // instance_init
+             0                                                  // value_table
+@@ -419,7 +457,11 @@ void QVideoSurfaceGstSink::class_init(gpointer g_class, gpointer class_data)
+     GstBaseSinkClass *base_sink_class = reinterpret_cast<GstBaseSinkClass *>(g_class);
+     base_sink_class->get_caps = QVideoSurfaceGstSink::get_caps;
+     base_sink_class->set_caps = QVideoSurfaceGstSink::set_caps;
++// FIXME:
++#if GST_CHECK_VERSION(1,0,0)
++#else
+     base_sink_class->buffer_alloc = QVideoSurfaceGstSink::buffer_alloc;
++#endif
+     base_sink_class->start = QVideoSurfaceGstSink::start;
+     base_sink_class->stop = QVideoSurfaceGstSink::stop;
+ 
+@@ -434,6 +476,18 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
+ {
+     static GstStaticPadTemplate sink_pad_template = GST_STATIC_PAD_TEMPLATE(
+             "sink", GST_PAD_SINK, GST_PAD_ALWAYS, GST_STATIC_CAPS(
++#if GST_CHECK_VERSION(1,0,0)
++                    "video/x-raw, "
++                    "format = (string) RGBA,"
++                    "framerate = (fraction) [ 0, MAX ], "
++                    "width = (int) [ 1, MAX ], "
++                    "height = (int) [ 1, MAX ]; "
++                    "video/x-raw, "
++                    "format = (string) I420,"
++                    "framerate = (fraction) [ 0, MAX ], "
++                    "width = (int) [ 1, MAX ], "
++                    "height = (int) [ 1, MAX ]"));
++#else
+                     "video/x-raw-rgb, "
+                     "framerate = (fraction) [ 0, MAX ], "
+                     "width = (int) [ 1, MAX ], "
+@@ -442,6 +496,7 @@ void QVideoSurfaceGstSink::base_init(gpointer g_class)
+                     "framerate = (fraction) [ 0, MAX ], "
+                     "width = (int) [ 1, MAX ], "
+                     "height = (int) [ 1, MAX ]"));
++#endif
+ 
+     gst_element_class_add_pad_template(
+             GST_ELEMENT_CLASS(g_class), gst_static_pad_template_get(&sink_pad_template));
+@@ -490,7 +545,11 @@ GstStateChangeReturn QVideoSurfaceGstSink::change_state(
+             element, transition);
+ }
+ 
+-GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
++GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base
++#if GST_CHECK_VERSION(1,0,0)
++                                        , GstCaps* /*filterCaps*/
++#endif
++)
+ {
+     VO_SINK(base);
+ 
+@@ -503,6 +562,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
+     QList<QVideoFrame::PixelFormat> poolHandleFormats;
+     sink->delegate->poolMutex()->lock();
+     QGstBufferPoolInterface *pool = sink->delegate->pool();
++
+     if (pool)
+         poolHandleFormats = sink->delegate->supportedPixelFormats(pool->handleType());
+     sink->delegate->poolMutex()->unlock();
+@@ -518,11 +578,19 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
+ 
+         if (index != -1) {
+             gst_caps_append_structure(caps, gst_structure_new(
++#if GST_CHECK_VERSION(1,0,0)
++                    "video/x-raw",
++#else
+                     "video/x-raw-yuv",
++#endif
+                     "framerate", GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
+                     "width"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
+                     "height"   , GST_TYPE_INT_RANGE, 1, INT_MAX,
++#if GST_CHECK_VERSION(1,0,0)
++                    "format"   , G_TYPE_STRING, gst_video_format_to_string(qt_yuvColorLookup[index].vfmt),
++#else
+                     "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
++#endif
+                     NULL));
+             continue;
+         }
+@@ -532,7 +600,18 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
+         for (int i = 0; i < count; ++i) {
+             if (qt_rgbColorLookup[i].pixelFormat == format) {
+                 GstStructure *structure = gst_structure_new(
++#if GST_CHECK_VERSION(1,0,0)
++                        "video/x-raw",
++                        "format"    , G_TYPE_STRING, gst_video_format_to_string(gst_video_format_from_masks(qt_rgbColorLookup[i].depth,
++                                                                                 qt_rgbColorLookup[i].bitsPerPixel,
++                                                                                 qt_rgbColorLookup[i].endianness,
++                                                                                 qt_rgbColorLookup[i].red,
++                                                                                 qt_rgbColorLookup[i].green,
++                                                                                 qt_rgbColorLookup[i].blue,
++                                                                                 qt_rgbColorLookup[i].alpha)),
++#else
+                         "video/x-raw-rgb",
++#endif
+                         "framerate" , GST_TYPE_FRACTION_RANGE, 0, 1, INT_MAX, 1,
+                         "width"     , GST_TYPE_INT_RANGE, 1, INT_MAX,
+                         "height"    , GST_TYPE_INT_RANGE, 1, INT_MAX,
+@@ -553,6 +632,7 @@ GstCaps *QVideoSurfaceGstSink::get_caps(GstBaseSink *base)
+         }
+     }
+ 
++//    printf("get Caps %"GST_PTR_FORMAT"\n", caps);
+     return caps;
+ }
+ 
+@@ -592,7 +672,7 @@ gboolean QVideoSurfaceGstSink::set_caps(GstBaseSink *base, GstCaps *caps)
+         sink->lastRequestedCaps = 0;
+ 
+ #ifdef DEBUG_VIDEO_SURFACE_SINK
+-        qDebug() << "Staring video surface, format:";
++        qDebug() << "Starting video surface, format:";
+         qDebug() << format;
+         qDebug() << "bytesPerLine:" << bytesPerLine;
+ #endif
+@@ -617,11 +697,49 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
+     gst_structure_get_int(structure, "width", &size.rwidth());
+     gst_structure_get_int(structure, "height", &size.rheight());
+ 
++#if GST_CHECK_VERSION(1, 0, 0)
++    GstVideoInfo info;
++    gst_video_info_from_caps(&info, caps);
++
++    if (info.finfo->format == GST_VIDEO_FORMAT_I420) {
++        int index = indexOfYuvColor(GST_VIDEO_FORMAT_I420);
++
++        if (index != -1) {
++            pixelFormat = qt_yuvColorLookup[index].pixelFormat;
++            bitsPerPixel = qt_yuvColorLookup[index].bitsPerPixel;
++        }
++    } else if (info.finfo->format == GST_VIDEO_FORMAT_RGBx) {
++        int depth = 0;
++        int endianness = 0;
++        int red = 0;
++        int green = 0;
++        int blue = 0;
++        int alpha = 0;
++
++        gst_structure_get_int(structure, "bpp", &bitsPerPixel);
++        gst_structure_get_int(structure, "depth", &depth);
++        gst_structure_get_int(structure, "endianness", &endianness);
++        gst_structure_get_int(structure, "red_mask", &red);
++        gst_structure_get_int(structure, "green_mask", &green);
++        gst_structure_get_int(structure, "blue_mask", &blue);
++        gst_structure_get_int(structure, "alpha_mask", &alpha);
++
++        int index = indexOfRgbColor(bitsPerPixel, depth, endianness, red, green, blue, alpha);
++        printf("INDEX %x\n", index);
++        if (index != -1)
++            pixelFormat = qt_rgbColorLookup[index].pixelFormat;
++    }
++#else
++
+     if (qstrcmp(gst_structure_get_name(structure), "video/x-raw-yuv") == 0) {
+         guint32 fourcc = 0;
++#if GST_CHECK_VERSION(1, 0, 0)
++        int index = indexOfYuvColor(gst_video_format_from_string(gst_structure_get_string(structure, "format")));
++#else
+         gst_structure_get_fourcc(structure, "format", &fourcc);
+ 
+         int index = indexOfYuvColor(fourcc);
++#endif
+         if (index != -1) {
+             pixelFormat = qt_yuvColorLookup[index].pixelFormat;
+             bitsPerPixel = qt_yuvColorLookup[index].bitsPerPixel;
+@@ -647,6 +765,7 @@ QVideoSurfaceFormat QVideoSurfaceGstSink::formatForCaps(GstCaps *caps, int *byte
+         if (index != -1)
+             pixelFormat = qt_rgbColorLookup[index].pixelFormat;
+     }
++#endif
+ 
+     if (pixelFormat != QVideoFrame::Format_Invalid) {
+         QVideoSurfaceFormat format(size, pixelFormat, handleType);
+@@ -722,7 +841,11 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
+ 
+     poolLock.unlock();
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    GstCaps *intersection = gst_caps_intersect(get_caps(GST_BASE_SINK(sink), NULL), caps);
++#else
+     GstCaps *intersection = gst_caps_intersect(get_caps(GST_BASE_SINK(sink)), caps);
++#endif
+ 
+     if (gst_caps_is_empty (intersection)) {
+         gst_caps_unref(intersection);
+@@ -763,7 +886,7 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
+     QVideoSurfaceFormat surfaceFormat = sink->delegate->surfaceFormat();
+ 
+     if (!pool->isFormatSupported(surfaceFormat)) {
+-        //qDebug() << "sink doesn't support native pool format, skip custom buffers allocation";
++        qDebug() << "sink doesn't support native pool format, skip custom buffers allocation";
+         return GST_FLOW_OK;
+     }
+ 
+@@ -787,7 +910,6 @@ GstFlowReturn QVideoSurfaceGstSink::buffer_alloc(
+ gboolean QVideoSurfaceGstSink::start(GstBaseSink *base)
+ {
+     Q_UNUSED(base);
+-
+     return TRUE;
+ }
+ 
+diff --git a/src/multimedia/gsttools_headers/qgstappsrc_p.h b/src/multimedia/gsttools_headers/qgstappsrc_p.h
+index 4af9252..0e0fc0a 100644
+--- a/src/multimedia/gsttools_headers/qgstappsrc_p.h
++++ b/src/multimedia/gsttools_headers/qgstappsrc_p.h
+@@ -39,7 +39,10 @@
+ 
+ #include <gst/gst.h>
+ #include <gst/app/gstappsrc.h>
++
++#if GST_VERSION_MAJOR < 1
+ #include <gst/app/gstappbuffer.h>
++#endif
+ 
+ QT_BEGIN_NAMESPACE
+ 
+diff --git a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
+index 34669b8..0f3b165 100644
+--- a/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
++++ b/src/multimedia/gsttools_headers/qgstreameraudioprobecontrol_p.h
+@@ -47,8 +47,11 @@ class QGstreamerAudioProbeControl : public QMediaAudioProbeControl
+ public:
+     explicit QGstreamerAudioProbeControl(QObject *parent);
+     virtual ~QGstreamerAudioProbeControl();
+-
++#if GST_CHECK_VERSION(1,0,0)
++    void bufferProbed(GstBuffer* buffer, GstCaps* caps);
++#else
+     void bufferProbed(GstBuffer* buffer);
++#endif
+ 
+ private slots:
+     void bufferProbed();
+diff --git a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
+index 49064f9..fce6309 100644
+--- a/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
++++ b/src/multimedia/gsttools_headers/qgstreamervideoprobecontrol_p.h
+@@ -48,7 +48,11 @@ public:
+     explicit QGstreamerVideoProbeControl(QObject *parent);
+     virtual ~QGstreamerVideoProbeControl();
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    void bufferProbed(GstBuffer* buffer, GstCaps*);
++#else
+     void bufferProbed(GstBuffer* buffer);
++#endif
+     void startFlushing();
+     void stopFlushing();
+ 
+diff --git a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
+index 81e5764..c9fdb5c 100644
+--- a/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
++++ b/src/multimedia/gsttools_headers/qgstreamervideowindow_p.h
+@@ -104,7 +104,11 @@ private slots:
+     void updateNativeVideoSize();
+ 
+ private:
++#if GST_CHECK_VERSION(1,0,0)
++    static GstPadProbeReturn padBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data);
++#else
+     static void padBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
++#endif
+ 
+     GstElement *m_videoSink;
+     WId m_windowId;
+diff --git a/src/multimedia/gsttools_headers/qgstutils_p.h b/src/multimedia/gsttools_headers/qgstutils_p.h
+index 65ff759..6015980 100644
+--- a/src/multimedia/gsttools_headers/qgstutils_p.h
++++ b/src/multimedia/gsttools_headers/qgstutils_p.h
+@@ -73,7 +73,11 @@ namespace QGstUtils {
+     QSize capsResolution(const GstCaps *caps);
+     QSize capsCorrectedResolution(const GstCaps *caps);
+     QAudioFormat audioFormatForCaps(const GstCaps *caps);
++#if GST_CHECK_VERSION(1,0,0)
++    QAudioFormat audioFormatForSample(GstSample *sample);
++#else
+     QAudioFormat audioFormatForBuffer(GstBuffer *buffer);
++#endif
+     GstCaps *capsForAudioFormat(QAudioFormat format);
+     void initializeGst();
+     QMultimedia::SupportEstimate hasSupport(const QString &mimeType,
+diff --git a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
+index 1e0fda8..be48820 100644
+--- a/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
++++ b/src/multimedia/gsttools_headers/qgstvideobuffer_p.h
+@@ -71,6 +71,9 @@ private:
+     int m_bytesPerLine;
+     MapMode m_mode;
+     QVariant m_handle;
++#if GST_CHECK_VERSION(1,0,0)
++    GstMapInfo m_mapInfo;
++#endif
+ };
+ 
+ QT_END_NAMESPACE
+diff --git a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
+index 11b305d..01935f7 100644
+--- a/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
++++ b/src/multimedia/gsttools_headers/qvideosurfacegstsink_p.h
+@@ -131,7 +131,11 @@ private:
+ 
+     static GstStateChangeReturn change_state(GstElement *element, GstStateChange transition);
+ 
+-    static GstCaps *get_caps(GstBaseSink *sink);
++    static GstCaps *get_caps(GstBaseSink *sink
++#if GST_CHECK_VERSION(1,0,0)
++                             , GstCaps* /*filterCaps*/
++#endif
++                            );
+     static gboolean set_caps(GstBaseSink *sink, GstCaps *caps);
+ 
+     static GstFlowReturn buffer_alloc(
+diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
+index 3098aab..9c54663 100644
+--- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
++++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecoderserviceplugin.cpp
+@@ -74,29 +74,42 @@ void QGstreamerAudioDecoderServicePlugin::updateSupportedMimeTypes() const
+     gst_init(NULL, NULL);
+ 
+     GList *plugins, *orig_plugins;
++#if GST_CHECK_VERSION(1,0,0)
++    orig_plugins = plugins = gst_registry_get_plugin_list (gst_registry_get());
++#else
+     orig_plugins = plugins = gst_default_registry_get_plugin_list ();
+-
++#endif
+     while (plugins) {
+         GList *features, *orig_features;
+ 
+         GstPlugin *plugin = (GstPlugin *) (plugins->data);
+         plugins = g_list_next (plugins);
+ 
++#if GST_CHECK_VERSION(1,0,0)
++        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
++            continue;
++#else
+         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
+             continue;
+-
+-        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get_default (),
+-                                                                        plugin->desc.name);
++#endif
++        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get (),
++                                                                         gst_plugin_get_name(plugin));
+         while (features) {
+             if (!G_UNLIKELY(features->data == NULL)) {
+                 GstPluginFeature *feature = GST_PLUGIN_FEATURE(features->data);
+                 if (GST_IS_ELEMENT_FACTORY (feature)) {
+                     GstElementFactory *factory = GST_ELEMENT_FACTORY(gst_plugin_feature_load(feature));
+                     if (factory
+-                       && factory->numpadtemplates > 0
++                       && gst_element_factory_get_num_pad_templates(factory) > 0
++#if GST_CHECK_VERSION(1,0,0)
++                       && (qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Decoder/Audio") == 0
++                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Demux") == 0 )
++#else
+                        && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
+-                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )) {
+-                        const GList *pads = factory->staticpadtemplates;
++                           || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )
++#endif
++                        ) {
++                        const GList *pads = gst_element_factory_get_static_pad_templates(factory);
+                         while (pads) {
+                             GstStaticPadTemplate *padtemplate = (GstStaticPadTemplate*)(pads->data);
+                             pads = g_list_next (pads);
+diff --git a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
+index f944a60..72d1cf1 100644
+--- a/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
++++ b/src/plugins/gstreamer/audiodecoder/qgstreameraudiodecodersession.cpp
+@@ -446,21 +446,40 @@ QAudioBuffer QGstreamerAudioDecoderSession::read()
+         if (buffersAvailable == 1)
+             emit bufferAvailableChanged(false);
+ 
++        const char* bufferData = 0;
++        int bufferSize = 0;
++
++#if GST_CHECK_VERSION(1,0,0)
++        GstSample *sample = gst_app_sink_pull_sample(m_appSink);
++        GstBuffer *buffer = gst_sample_get_buffer(sample);
++        GstMapInfo mapInfo;
++        gst_buffer_map(buffer, &mapInfo, GST_MAP_READ);
++        bufferData = (const char*)mapInfo.data;
++        bufferSize = mapInfo.size;
++        QAudioFormat format = QGstUtils::audioFormatForSample(sample);
++#else
+         GstBuffer *buffer = gst_app_sink_pull_buffer(m_appSink);
+-
++        bufferData = (const char*)buffer->data;
++        bufferSize = buffer->size;
+         QAudioFormat format = QGstUtils::audioFormatForBuffer(buffer);
++#endif
++
+         if (format.isValid()) {
+             // XXX At the moment we have to copy data from GstBuffer into QAudioBuffer.
+             // We could improve performance by implementing QAbstractAudioBuffer for GstBuffer.
+             qint64 position = getPositionFromBuffer(buffer);
+-            audioBuffer = QAudioBuffer(QByteArray((const char*)buffer->data, buffer->size), format, position);
++            audioBuffer = QAudioBuffer(QByteArray((const char*)bufferData, bufferSize), format, position);
+             position /= 1000; // convert to milliseconds
+             if (position != m_position) {
+                 m_position = position;
+                 emit positionChanged(m_position);
+             }
+         }
++#if GST_CHECK_VERSION(1,0,0)
++        gst_sample_unref(sample);
++#else
+         gst_buffer_unref(buffer);
++#endif
+     }
+ 
+     return audioBuffer;
+@@ -531,7 +550,12 @@ void QGstreamerAudioDecoderSession::addAppSink()
+ 
+     GstAppSinkCallbacks callbacks;
+     memset(&callbacks, 0, sizeof(callbacks));
++#if GST_CHECK_VERSION(1,0,0)
++    // ### Should perhaps also rename new_buffer to new_sample.
++    callbacks.new_sample = &new_buffer;
++#else
+     callbacks.new_buffer = &new_buffer;
++#endif
+     gst_app_sink_set_callbacks(m_appSink, &callbacks, this, NULL);
+     gst_app_sink_set_max_buffers(m_appSink, MAX_BUFFERS_IN_QUEUE);
+     gst_base_sink_set_sync(GST_BASE_SINK(m_appSink), FALSE);
+@@ -557,8 +581,13 @@ void QGstreamerAudioDecoderSession::updateDuration()
+     gint64 gstDuration = 0;
+     int duration = -1;
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    if (m_playbin && gst_element_query_duration(m_playbin, format, &gstDuration))
++        duration = gstDuration / 1000000;
++#else
+     if (m_playbin && gst_element_query_duration(m_playbin, &format, &gstDuration))
+         duration = gstDuration / 1000000;
++#endif
+ 
+     if (m_duration != duration) {
+         m_duration = duration;
+diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
+index 1ed663b..e0c6b50 100644
+--- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
++++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
+@@ -796,7 +796,11 @@ qint64 CameraBinSession::duration() const
+         if (fileSink) {
+             GstFormat format = GST_FORMAT_TIME;
+             gint64 duration = 0;
++#if GST_CHECK_VERSION(1,0,0)
++            bool ret = gst_element_query_duration(fileSink, format, &duration);
++#else
+             bool ret = gst_element_query_position(fileSink, &format, &duration);
++#endif
+             gst_object_unref(GST_OBJECT(fileSink));
+             if (ret)
+                 return duration / 1000000;
+@@ -833,8 +837,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
+ 
+     if (m_camerabin) {
+         GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
++#if GST_CHECK_VERSION(1,0,0)
++        GValue *element = 0;
++        while (gst_iterator_next(elements, element) == GST_ITERATOR_OK) {
++#else
+         GstElement *element = 0;
+         while (gst_iterator_next(elements, (void**)&element) == GST_ITERATOR_OK) {
++#endif
+             gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
+ 
+             QMapIterator<QByteArray, QVariant> it(data);
+@@ -895,7 +904,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+ 
+     if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
+         if (m_captureMode == QCamera::CaptureStillImage &&
++#if GST_CHECK_VERSION(1,0,0)
++            gst_message_has_name (gm, "preview-image")) {
++#else
+             gst_structure_has_name(gm->structure, "preview-image")) {
++#endif
+             st = gst_message_get_structure(gm);
+ 
+             if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
+@@ -905,7 +918,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+ 
+                     QImage img;
+ 
++#if GST_CHECK_VERSION(1,0,0)
+                     GstCaps *caps = gst_buffer_get_caps(buffer);
++#else
++                    GstCaps *caps = gst_buffer_get_caps(buffer);
++#endif
+                     if (caps) {
+                         GstStructure *structure = gst_caps_get_structure(caps, 0);
+                         gint width = 0;
+@@ -1178,7 +1195,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
+         gst_structure_remove_all_fields(structure);
+         gst_structure_set_value(structure, "framerate", &rate);
+     }
++#if GST_CHECK_VERSION(1,0,0)
++    caps = gst_caps_simplify(caps);
++#else
+     gst_caps_do_simplify(caps);
++#endif
+ 
+ 
+     for (uint i=0; i<gst_caps_get_size(caps); i++) {
+@@ -1298,7 +1319,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
+         gst_structure_set_value(structure, "width", &w);
+         gst_structure_set_value(structure, "height", &h);
+     }
++#if GST_CHECK_VERSION(1,0,0)
++    caps = gst_caps_simplify(caps);
++#else
+     gst_caps_do_simplify(caps);
++#endif
+ 
+     for (uint i=0; i<gst_caps_get_size(caps); i++) {
+         GstStructure *structure = gst_caps_get_structure(caps, i);
+diff --git a/src/plugins/gstreamer/common.pri b/src/plugins/gstreamer/common.pri
+index 8b421b8..2e7f746 100644
+--- a/src/plugins/gstreamer/common.pri
++++ b/src/plugins/gstreamer/common.pri
+@@ -12,14 +12,17 @@ LIBS += -lqgsttools_p
+ CONFIG += link_pkgconfig
+ 
+ PKGCONFIG += \
+-    gstreamer-0.10 \
+-    gstreamer-base-0.10 \
+-    gstreamer-interfaces-0.10 \
+-    gstreamer-audio-0.10 \
+-    gstreamer-video-0.10 \
+-    gstreamer-pbutils-0.10
++    gstreamer-$$GST_VERSION \
++    gstreamer-base-$$GST_VERSION \
++    gstreamer-audio-$$GST_VERSION \
++    gstreamer-video-$$GST_VERSION \
++    gstreamer-pbutils-$$GST_VERSION
+ 
+-maemo*:PKGCONFIG +=gstreamer-plugins-bad-0.10
++maemo*:PKGCONFIG +=gstreamer-plugins-bad-$$GST_VERSION
++
++mir: {
++    DEFINES += HAVE_MIR
++}
+ 
+ config_resourcepolicy {
+     DEFINES += HAVE_RESOURCE_POLICY
+@@ -27,8 +30,8 @@ config_resourcepolicy {
+ }
+ 
+ config_gstreamer_appsrc {
+-    PKGCONFIG += gstreamer-app-0.10
++    PKGCONFIG += gstreamer-app-$$GST_VERSION
+     DEFINES += HAVE_GST_APPSRC
+-    LIBS += -lgstapp-0.10
++    LIBS += -lgstapp-$$GST_VERSION
+ }
+ 
+diff --git a/src/plugins/gstreamer/gstreamer.pro b/src/plugins/gstreamer/gstreamer.pro
+index 7649010..fce55ac 100644
+--- a/src/plugins/gstreamer/gstreamer.pro
++++ b/src/plugins/gstreamer/gstreamer.pro
+@@ -2,11 +2,10 @@ TEMPLATE = subdirs
+ 
+ SUBDIRS += \
+     audiodecoder \
+-    mediacapture \
+     mediaplayer
+ 
+ config_gstreamer_encodingprofiles {
+-    SUBDIRS += camerabin
++#    SUBDIRS += camerabin
+ }
+ 
+ OTHER_FILES += \
+diff --git a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
+index a2bd80d..d12e9a5 100644
+--- a/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
++++ b/src/plugins/gstreamer/mediacapture/qgstreamercapturesession.cpp
+@@ -498,6 +498,11 @@ GstElement *QGstreamerCaptureSession::buildImageCapture()
+     gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
+     gst_object_unref(GST_OBJECT(pad));
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, passImageFilter, this);
++#else
++    gst_pad_add_buffer_probe(pad, G_CALLBACK(passImageFilter), this);
++#endif
+     g_object_set(G_OBJECT(sink), "signal-handoffs", TRUE, NULL);
+     g_signal_connect(G_OBJECT(sink), "handoff",
+                      G_CALLBACK(saveImageFilter), this);
+diff --git a/src/plugins/gstreamer/mediaplayer/mediaplayer.pro b/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
+index 2ca9377..b986fc7 100644
+--- a/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
++++ b/src/plugins/gstreamer/mediaplayer/mediaplayer.pro
+@@ -28,4 +28,3 @@ SOURCES += \
+ 
+ OTHER_FILES += \
+     mediaplayer.json
+-
+diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
+index fed756a..8239710 100644
+--- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
++++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayercontrol.cpp
+@@ -537,6 +537,8 @@ void QGstreamerPlayerControl::processEOS()
+         m_session->showPrerollFrames(false); // stop showing prerolled frames in stop state
+     }
+ 
++    qWarning() << "Processing EOS!";
++
+     popAndNotifyState();
+ }
+ 
+diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
+index ddc828e..00bee36 100644
+--- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
++++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerservice.cpp
+@@ -51,7 +51,11 @@
+ #include <private/qgstreamervideorenderer_p.h>
+ 
+ #if defined(Q_WS_MAEMO_6) && defined(__arm__)
+-#include "qgstreamergltexturerenderer.h"
++#include "private/qgstreamergltexturerenderer.h"
++#endif
++
++#if defined(HAVE_MIR) && defined (__arm__)
++#include "private/qgstreamermirtexturerenderer_p.h"
+ #endif
+ 
+ #include "qgstreamerstreamscontrol.h"
+@@ -82,6 +86,9 @@ QGstreamerPlayerService::QGstreamerPlayerService(QObject *parent):
+ 
+ #if defined(Q_WS_MAEMO_6) && defined(__arm__)
+     m_videoRenderer = new QGstreamerGLTextureRenderer(this);
++#elif defined(HAVE_MIR) && defined (__arm__)
++    //m_videoRenderer = new QGstreamerVideoRenderer(this);
++    m_videoRenderer = new QGstreamerMirTextureRenderer(this, m_session);
+ #else
+     m_videoRenderer = new QGstreamerVideoRenderer(this);
+ #endif
+diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
+index 7d20b6d..bf2f9f8 100644
+--- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
++++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayerserviceplugin.cpp
+@@ -87,7 +87,11 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
+     gst_init(NULL, NULL);
+ 
+     GList *plugins, *orig_plugins;
++#if GST_CHECK_VERSION(1,0,0)
++    orig_plugins = plugins = gst_registry_get_plugin_list (gst_registry_get());
++#else
+     orig_plugins = plugins = gst_default_registry_get_plugin_list ();
++#endif
+ 
+     while (plugins) {
+         GList *features, *orig_features;
+@@ -95,22 +99,33 @@ void QGstreamerPlayerServicePlugin::updateSupportedMimeTypes() const
+         GstPlugin *plugin = (GstPlugin *) (plugins->data);
+         plugins = g_list_next (plugins);
+ 
++#if GST_CHECK_VERSION(1,0,0)
++        if (GST_OBJECT_FLAG_IS_SET(plugin, GST_PLUGIN_FLAG_BLACKLISTED))
++            continue;
++#else
+         if (plugin->flags & (1<<1)) //GST_PLUGIN_FLAG_BLACKLISTED
+             continue;
++#endif
+ 
+-        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get_default (),
+-                                                                        plugin->desc.name);
++        orig_features = features = gst_registry_get_feature_list_by_plugin(gst_registry_get(),
++                                                                           gst_plugin_get_name(plugin));
+         while (features) {
+             if (!G_UNLIKELY(features->data == NULL)) {
+                 GstPluginFeature *feature = GST_PLUGIN_FEATURE(features->data);
+                 if (GST_IS_ELEMENT_FACTORY (feature)) {
+                     GstElementFactory *factory = GST_ELEMENT_FACTORY(gst_plugin_feature_load(feature));
+                     if (factory
+-                       && factory->numpadtemplates > 0
+-                       && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
++#if GST_CHECK_VERSION(1,0,0)
++                        && (qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Decoder/Audio") == 0
++                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS),"Codec/Decoder/Video") == 0
++                          || qstrcmp(gst_element_factory_get_metadata(factory, GST_ELEMENT_METADATA_KLASS), "Codec/Demux") == 0 )
++#else
++                        && (qstrcmp(factory->details.klass, "Codec/Decoder/Audio") == 0
+                           || qstrcmp(factory->details.klass, "Codec/Decoder/Video") == 0
+-                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )) {
+-                        const GList *pads = factory->staticpadtemplates;
++                          || qstrcmp(factory->details.klass, "Codec/Demux") == 0 )
++#endif
++                        ) {
++                        const GList *pads = gst_element_factory_get_static_pad_templates(factory);
+                         while (pads) {
+                             GstStaticPadTemplate *padtemplate = (GstStaticPadTemplate*)(pads->data);
+                             pads = g_list_next (pads);
+diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
+index 15924a6..8013d0d 100644
+--- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
++++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.cpp
+@@ -85,6 +85,16 @@ typedef enum {
+     GST_PLAY_FLAG_BUFFERING     = 0x000000100
+ } GstPlayFlags;
+ 
++#if GST_CHECK_VERSION(1,0,0)
++#define DEFAULT_RAW_CAPS \
++    "video/x-surface; " \
++    "text/plain; " \
++    "text/x-pango-markup; " \
++    "video/x-dvd-subpicture; " \
++    "subpicture/x-pgs" \
++    "video/x-raw" \
++    "audio/x-raw"
++#else
+ #define DEFAULT_RAW_CAPS \
+     "video/x-raw-yuv; " \
+     "video/x-raw-rgb; " \
+@@ -97,6 +107,8 @@ typedef enum {
+     "text/x-pango-markup; " \
+     "video/x-dvd-subpicture; " \
+     "subpicture/x-pgs"
++#endif
++
+ static GstStaticCaps static_RawCaps = GST_STATIC_CAPS(DEFAULT_RAW_CAPS);
+ 
+ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+@@ -137,8 +149,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+     gboolean result = gst_type_find_register(0, "playlist", GST_RANK_MARGINAL, playlistTypeFindFunction, 0, 0, this, 0);
+     Q_ASSERT(result == TRUE);
+     Q_UNUSED(result);
+-
++#if GST_CHECK_VERSION(1,0,0)
++    m_playbin = gst_element_factory_make("playbin", NULL);
++#else
+     m_playbin = gst_element_factory_make("playbin2", NULL);
++#endif
+ 
+     if (m_playbin) {
+         //GST_PLAY_FLAG_NATIVE_VIDEO omits configuration of ffmpegcolorspace and videoscale,
+@@ -188,7 +203,11 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+     m_videoIdentity = GST_ELEMENT(g_object_new(gst_video_connector_get_type(), 0)); // floating ref
+     g_signal_connect(G_OBJECT(m_videoIdentity), "connection-failed", G_CALLBACK(insertColorSpaceElement), (gpointer)this);
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    m_colorSpace = gst_element_factory_make("videoconvert", "ffmpegcolorspace-vo");
++#else
+     m_colorSpace = gst_element_factory_make("ffmpegcolorspace", "ffmpegcolorspace-vo");
++#endif
+     // might not get a parent, take ownership to avoid leak
+     qt_gst_object_ref_sink(GST_OBJECT(m_colorSpace));
+ 
+@@ -206,7 +225,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+ 
+     // add ghostpads
+     GstPad *pad = gst_element_get_static_pad(m_videoIdentity,"sink");
+-    gst_element_add_pad(GST_ELEMENT(m_videoOutputBin), gst_ghost_pad_new("videosink", pad));
++    gst_element_add_pad(GST_ELEMENT(m_videoOutputBin), gst_ghost_pad_new("sink", pad));
+     gst_object_unref(GST_OBJECT(pad));
+ 
+     if (m_playbin != 0) {
+@@ -218,7 +237,7 @@ QGstreamerPlayerSession::QGstreamerPlayerSession(QObject *parent)
+         g_object_set(G_OBJECT(m_playbin), "video-sink", m_videoOutputBin, NULL);
+ 
+         g_signal_connect(G_OBJECT(m_playbin), "notify::source", G_CALLBACK(playbinNotifySource), this);
+-        g_signal_connect(G_OBJECT(m_playbin), "element-added",  G_CALLBACK(handleElementAdded), this);
++        //g_signal_connect(G_OBJECT(m_playbin), "element-added",  G_CALLBACK(handleElementAdded), this);
+ 
+         if (usePlaybinVolume()) {
+             updateVolume();
+@@ -342,9 +361,13 @@ qint64 QGstreamerPlayerSession::position() const
+     GstFormat   format = GST_FORMAT_TIME;
+     gint64      position = 0;
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    if ( m_playbin && gst_element_query_position(m_playbin, format, &position))
++        m_lastPosition = position / 1000000;
++#else
+     if ( m_playbin && gst_element_query_position(m_playbin, &format, &position))
+         m_lastPosition = position / 1000000;
+-
++#endif
+     return m_lastPosition;
+ }
+ 
+@@ -474,9 +497,18 @@ bool QGstreamerPlayerSession::isAudioAvailable() const
+     return m_audioAvailable;
+ }
+ 
++#if GST_CHECK_VERSION(1,0,0)
++static GstPadProbeReturn block_pad_cb(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
++#else
+ static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_data)
++#endif
+ {
+     Q_UNUSED(pad);
++#if GST_CHECK_VERSION(1,0,0)
++    Q_UNUSED(info);
++    Q_UNUSED(user_data);
++    return GST_PAD_PROBE_OK;
++#else
+ #ifdef DEBUG_PLAYBIN
+     qDebug() << "block_pad_cb, blocked:" << blocked;
+ #endif
+@@ -485,6 +517,7 @@ static void block_pad_cb(GstPad *pad, gboolean blocked, gpointer user_data)
+         QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
+         QMetaObject::invokeMethod(session, "finishVideoOutputChange", Qt::QueuedConnection);
+     }
++#endif
+ }
+ 
+ void QGstreamerPlayerSession::updateVideoRenderer()
+@@ -529,7 +562,7 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
+     m_renderer = renderer;
+ 
+ #ifdef DEBUG_VO_BIN_DUMP
+-    _gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
++    gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
+                                   GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
+                                   "playbin_set");
+ #endif
+@@ -633,7 +666,11 @@ void QGstreamerPlayerSession::setVideoRenderer(QObject *videoOutput)
+ 
+         //block pads, async to avoid locking in paused state
+         GstPad *srcPad = gst_element_get_static_pad(m_videoIdentity, "src");
++#if GST_CHECK_VERSION(1,0,0)
++        this->pad_probe_id = gst_pad_add_probe(srcPad, (GstPadProbeType)(GST_PAD_PROBE_TYPE_BUFFER | GST_PAD_PROBE_TYPE_BLOCK), block_pad_cb, this, NULL);
++#else
+         gst_pad_set_blocked_async(srcPad, true, &block_pad_cb, this);
++#endif
+         gst_object_unref(GST_OBJECT(srcPad));
+ 
+         //Unpause the sink to avoid waiting until the buffer is processed
+@@ -674,7 +711,11 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
+         //video output was change back to the current one,
+         //no need to torment the pipeline, just unblock the pad
+         if (gst_pad_is_blocked(srcPad))
++#if GST_CHECK_VERSION(1,0,0)
++            gst_pad_remove_probe(srcPad, this->pad_probe_id);
++#else
+             gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
++#endif
+ 
+         m_pendingVideoSink = 0;
+         gst_object_unref(GST_OBJECT(srcPad));
+@@ -760,12 +801,17 @@ void QGstreamerPlayerSession::finishVideoOutputChange()
+ 
+     //don't have to wait here, it will unblock eventually
+     if (gst_pad_is_blocked(srcPad))
+-        gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
++#if GST_CHECK_VERSION(1,0,0)
++            gst_pad_remove_probe(srcPad, this->pad_probe_id);
++#else
++            gst_pad_set_blocked_async(srcPad, false, &block_pad_cb, 0);
++#endif
++
+     gst_object_unref(GST_OBJECT(srcPad));
+ 
+ #ifdef DEBUG_VO_BIN_DUMP
+-    _gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
+-                                  GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES*/),
++    gst_debug_bin_to_dot_file_with_ts(GST_BIN(m_playbin),
++                                  GstDebugGraphDetails(GST_DEBUG_GRAPH_SHOW_ALL /* | GST_DEBUG_GRAPH_SHOW_MEDIA_TYPE | GST_DEBUG_GRAPH_SHOW_NON_DEFAULT_PARAMS | GST_DEBUG_GRAPH_SHOW_STATES */),
+                                   "playbin_finish");
+ #endif
+ }
+@@ -830,6 +876,7 @@ bool QGstreamerPlayerSession::play()
+ #ifdef DEBUG_PLAYBIN
+     qDebug() << Q_FUNC_INFO;
+ #endif
++
+     m_everPlayed = false;
+     if (m_playbin) {
+         m_pendingState = QMediaPlayer::PlayingState;
+@@ -1327,8 +1374,11 @@ void QGstreamerPlayerSession::getStreamsInfo()
+         default:
+             break;
+         }
+-
++#if GST_CHECK_VERSION(1,0,0)
++        if (tags && GST_IS_TAG_LIST(tags)) {
++#else
+         if (tags && gst_is_tag_list(tags)) {
++#endif
+             gchar *languageCode = 0;
+             if (gst_tag_list_get_string(tags, GST_TAG_LANGUAGE_CODE, &languageCode))
+                 streamProperties[QMediaMetaData::Language] = QString::fromUtf8(languageCode);
+@@ -1367,7 +1417,11 @@ void QGstreamerPlayerSession::updateVideoResolutionTag()
+     QSize aspectRatio;
+ 
+     GstPad *pad = gst_element_get_static_pad(m_videoIdentity, "src");
++#if GST_CHECK_VERSION(1,0,0)
++    GstCaps *caps = gst_pad_get_current_caps(pad);
++#else
+     GstCaps *caps = gst_pad_get_negotiated_caps(pad);
++#endif
+ 
+     if (caps) {
+         const GstStructure *structure = gst_caps_get_structure(caps, 0);
+@@ -1411,7 +1465,11 @@ void QGstreamerPlayerSession::updateDuration()
+     gint64 gstDuration = 0;
+     int duration = -1;
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    if (m_playbin && gst_element_query_duration(m_playbin, format, &gstDuration))
++#else
+     if (m_playbin && gst_element_query_duration(m_playbin, &format, &gstDuration))
++#endif
+         duration = gstDuration / 1000000;
+ 
+     if (m_duration != duration) {
+@@ -1467,7 +1525,11 @@ void QGstreamerPlayerSession::playbinNotifySource(GObject *o, GParamSpec *p, gpo
+ 
+     // The rest
+     if (g_object_class_find_property(G_OBJECT_GET_CLASS(source), "extra-headers") != 0) {
++#if GST_CHECK_VERSION(1,0,0)
++        GstStructure *extras = gst_structure_new_empty("extras");
++#else
+         GstStructure *extras = gst_structure_empty_new("extras");
++#endif
+ 
+         foreach (const QByteArray &rawHeader, self->m_request.rawHeaderList()) {
+             if (rawHeader == userAgentString) // Filter User-Agent
+@@ -1623,7 +1685,11 @@ GstAutoplugSelectResult QGstreamerPlayerSession::handleAutoplugSelect(GstBin *bi
+     const gchar *factoryName = gst_plugin_feature_get_name(GST_PLUGIN_FEATURE(factory));
+     if (g_str_has_prefix(factoryName, "vaapi")) {
+         GstPad *sinkPad = gst_element_get_static_pad(session->m_videoSink, "sink");
++#if GST_CHECK_VERSION(1,0,0)
++        GstCaps *sinkCaps = gst_pad_query_caps(sinkPad, NULL);
++#else
+         GstCaps *sinkCaps = gst_pad_get_caps(sinkPad);
++#endif
+ 
+ #if (GST_VERSION_MAJOR == 0) && ((GST_VERSION_MINOR < 10) || (GST_VERSION_MICRO < 33))
+         if (!factory_can_src_any_caps(factory, sinkCaps))
+@@ -1652,14 +1718,19 @@ void QGstreamerPlayerSession::handleElementAdded(GstBin *bin, GstElement *elemen
+         // Disable on-disk buffering.
+         g_object_set(G_OBJECT(element), "temp-template", NULL, NULL);
+     } else if (g_str_has_prefix(elementName, "uridecodebin") ||
+-               g_str_has_prefix(elementName, "decodebin2")) {
+-
++#if GST_CHECK_VERSION(1,0,0)
++        g_str_has_prefix(elementName, "decodebin")) {
++#else
++        g_str_has_prefix(elementName, "decodebin2")) {
++#endif
+         if (g_str_has_prefix(elementName, "uridecodebin")) {
+             // Add video/x-surface (VAAPI) to default raw formats
+             g_object_set(G_OBJECT(element), "caps", gst_static_caps_get(&static_RawCaps), NULL);
+             // listen for uridecodebin autoplug-select to skip VAAPI usage when the current
+             // video sink doesn't support it
++#if !(GST_CHECK_VERSION(1,0,0))
+             g_signal_connect(element, "autoplug-select", G_CALLBACK(handleAutoplugSelect), session);
++#endif
+         }
+ 
+         //listen for queue2 element added to uridecodebin/decodebin2 as well.
+@@ -1727,7 +1798,27 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerVideoProbeControl* probe)
+     // Assume user releases any outstanding references to video frames.
+ }
+ 
+-gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
++#if GST_CHECK_VERSION(1,0,0)
++GstPadProbeReturn QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data)
++{
++    Q_UNUSED(pad);
++    GstBuffer* buffer = GST_PAD_PROBE_INFO_BUFFER(info);
++
++    QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
++    QMutexLocker locker(&session->m_videoProbeMutex);
++
++    if (session->m_videoProbes.isEmpty())
++        return GST_PAD_PROBE_OK;
++
++    foreach (QGstreamerVideoProbeControl* probe, session->m_videoProbes)
++        probe->bufferProbed(buffer, gst_pad_get_current_caps(pad));
++
++    return GST_PAD_PROBE_OK;
++}
++
++#else
++
++static gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
+ {
+     Q_UNUSED(pad);
+ 
+@@ -1742,6 +1833,7 @@ gboolean QGstreamerPlayerSession::padVideoBufferProbe(GstPad *pad, GstBuffer *bu
+ 
+     return TRUE;
+ }
++#endif
+ 
+ void QGstreamerPlayerSession::addProbe(QGstreamerAudioProbeControl* probe)
+ {
+@@ -1759,6 +1851,24 @@ void QGstreamerPlayerSession::removeProbe(QGstreamerAudioProbeControl* probe)
+     m_audioProbes.removeOne(probe);
+ }
+ 
++#if GST_CHECK_VERSION(1,0,0)
++GstPadProbeReturn  QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstPadProbeInfo* info, gpointer user_data)
++{
++    Q_UNUSED(pad);
++    GstBuffer* buffer = GST_PAD_PROBE_INFO_BUFFER(info);
++
++    QGstreamerPlayerSession *session = reinterpret_cast<QGstreamerPlayerSession*>(user_data);
++    QMutexLocker locker(&session->m_audioProbeMutex);
++
++    if (session->m_audioProbes.isEmpty())
++        return GST_PAD_PROBE_OK;
++
++    foreach (QGstreamerAudioProbeControl* probe, session->m_audioProbes)
++        probe->bufferProbed(buffer, gst_pad_get_current_caps(pad));
++
++    return GST_PAD_PROBE_OK;
++}
++#else
+ gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data)
+ {
+     Q_UNUSED(pad);
+@@ -1774,7 +1884,7 @@ gboolean QGstreamerPlayerSession::padAudioBufferProbe(GstPad *pad, GstBuffer *bu
+ 
+     return TRUE;
+ }
+-
++#endif
+ // This function is similar to stop(),
+ // but does not set m_everPlayed, m_lastPosition,
+ // and setSeekable() values.
+@@ -1807,7 +1917,11 @@ void QGstreamerPlayerSession::removeVideoBufferProbe()
+ 
+     GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
+     if (pad) {
++#if GST_CHECK_VERSION(1,0,0)
++        gst_pad_remove_probe(pad, m_videoBufferProbeId);
++#else
+         gst_pad_remove_buffer_probe(pad, m_videoBufferProbeId);
++#endif
+         gst_object_unref(GST_OBJECT(pad));
+     }
+ 
+@@ -1822,7 +1936,11 @@ void QGstreamerPlayerSession::addVideoBufferProbe()
+ 
+     GstPad *pad = gst_element_get_static_pad(m_videoSink, "sink");
+     if (pad) {
++#if GST_CHECK_VERSION(1,0,0)
++        m_videoBufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padVideoBufferProbe, this, NULL);
++#else
+         m_videoBufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padVideoBufferProbe), this);
++#endif
+         gst_object_unref(GST_OBJECT(pad));
+     }
+ }
+@@ -1839,7 +1957,11 @@ void QGstreamerPlayerSession::removeAudioBufferProbe()
+ 
+     GstPad *pad = gst_element_get_static_pad(m_audioSink, "sink");
+     if (pad) {
++#if GST_CHECK_VERSION(1,0,0)
++        gst_pad_remove_probe(pad, m_audioBufferProbeId);
++#else
+         gst_pad_remove_buffer_probe(pad, m_audioBufferProbeId);
++#endif
+         gst_object_unref(GST_OBJECT(pad));
+     }
+ 
+@@ -1854,7 +1976,11 @@ void QGstreamerPlayerSession::addAudioBufferProbe()
+ 
+     GstPad *pad = gst_element_get_static_pad(m_audioSink, "sink");
+     if (pad) {
++#if GST_CHECK_VERSION(1,0,0)
++        m_audioBufferProbeId = gst_pad_add_probe(pad, GST_PAD_PROBE_TYPE_BUFFER, padAudioBufferProbe, this, NULL);
++#else
+         m_audioBufferProbeId = gst_pad_add_buffer_probe(pad, G_CALLBACK(padAudioBufferProbe), this);
++#endif
+         gst_object_unref(GST_OBJECT(pad));
+     }
+ }
+@@ -1887,7 +2013,7 @@ void QGstreamerPlayerSession::playlistTypeFindFunction(GstTypeFind *find, gpoint
+         length = qMin(length, guint64(1024));
+ 
+     while (length > 0) {
+-        guint8 *data = gst_type_find_peek(find, 0, length);
++        const guint8 *data = gst_type_find_peek(find, 0, length);
+         if (data) {
+             session->m_isPlaylist = (QPlaylistFileParser::findPlaylistType(QString::fromUtf8(uri), 0, data, length) != QPlaylistFileParser::UNKNOWN);
+             return;
+diff --git a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
+index f2e760a..50bda3d 100644
+--- a/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
++++ b/src/plugins/gstreamer/mediaplayer/qgstreamerplayersession.h
+@@ -119,11 +119,19 @@ public:
+ 
+     void addProbe(QGstreamerVideoProbeControl* probe);
+     void removeProbe(QGstreamerVideoProbeControl* probe);
++#if GST_CHECK_VERSION(1,0,0)
++    static GstPadProbeReturn padVideoBufferProbe(GstPad *pad, GstPadProbeInfo *info, gpointer user_data);
++#else
+     static gboolean padVideoBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
++#endif
+ 
+     void addProbe(QGstreamerAudioProbeControl* probe);
+     void removeProbe(QGstreamerAudioProbeControl* probe);
++#if GST_CHECK_VERSION(1,0,0)
++    static GstPadProbeReturn padAudioBufferProbe(GstPad *pad, GstPadProbeInfo* info, gpointer user_data);
++#else
+     static gboolean padAudioBufferProbe(GstPad *pad, GstBuffer *buffer, gpointer user_data);
++#endif
+ 
+     void endOfMediaReset();
+ 
+@@ -252,6 +260,7 @@ private:
+     bool m_isLiveSource;
+ 
+     bool m_isPlaylist;
++    gulong pad_probe_id;
+ };
+ 
+ QT_END_NAMESPACE
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch b/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
deleted file mode 100644
index d0f4eb9..0000000
--- a/recipes-qt/qt5/qtserialport-git/0001-Unix-Clear-serial_struct-instances.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From cdaa89e30e12d247a8086763d341e5f020151b67 Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Mon, 9 Mar 2015 22:35:56 +1100
-Subject: [PATCH] Unix: Clear serial_struct instances
-
-Silences the following Valgrind warning:
-Conditional jump or move depends on uninitialised value(s)
-
-Upstream-Status: Backport from 5.5 branch
-
-Change-Id: I8fd8cfd6aa6f75ed515e6151cfc282faca508bdc
-Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- src/serialport/qserialport_unix.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/serialport/qserialport_unix.cpp b/src/serialport/qserialport_unix.cpp
-index cda73b2..62c454c 100644
---- a/src/serialport/qserialport_unix.cpp
-+++ b/src/serialport/qserialport_unix.cpp
-@@ -451,6 +451,8 @@ QSerialPortPrivate::setStandardBaudRate(qint32 baudRate, QSerialPort::Directions
- {
-     struct serial_struct currentSerialInfo;
- 
-+    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
-+
-     if ((::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) != -1)
-             && (currentSerialInfo.flags & ASYNC_SPD_CUST)) {
-         currentSerialInfo.flags &= ~ASYNC_SPD_CUST;
-@@ -481,6 +483,8 @@ QSerialPortPrivate::setCustomBaudRate(qint32 baudRate, QSerialPort::Directions d
- 
-     struct serial_struct currentSerialInfo;
- 
-+    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
-+
-     if (::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) == -1)
-         return decodeSystemError();
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch b/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch
new file mode 100644
index 0000000..d0f4eb9
--- /dev/null
+++ b/recipes-qt/qt5/qtserialport/0001-Unix-Clear-serial_struct-instances.patch
@@ -0,0 +1,42 @@
+From cdaa89e30e12d247a8086763d341e5f020151b67 Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Mon, 9 Mar 2015 22:35:56 +1100
+Subject: [PATCH] Unix: Clear serial_struct instances
+
+Silences the following Valgrind warning:
+Conditional jump or move depends on uninitialised value(s)
+
+Upstream-Status: Backport from 5.5 branch
+
+Change-Id: I8fd8cfd6aa6f75ed515e6151cfc282faca508bdc
+Reviewed-by: Denis Shienkov <denis.shienkov@gmail.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/serialport/qserialport_unix.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/serialport/qserialport_unix.cpp b/src/serialport/qserialport_unix.cpp
+index cda73b2..62c454c 100644
+--- a/src/serialport/qserialport_unix.cpp
++++ b/src/serialport/qserialport_unix.cpp
+@@ -451,6 +451,8 @@ QSerialPortPrivate::setStandardBaudRate(qint32 baudRate, QSerialPort::Directions
+ {
+     struct serial_struct currentSerialInfo;
+ 
++    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
++
+     if ((::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) != -1)
+             && (currentSerialInfo.flags & ASYNC_SPD_CUST)) {
+         currentSerialInfo.flags &= ~ASYNC_SPD_CUST;
+@@ -481,6 +483,8 @@ QSerialPortPrivate::setCustomBaudRate(qint32 baudRate, QSerialPort::Directions d
+ 
+     struct serial_struct currentSerialInfo;
+ 
++    ::memset(&currentSerialInfo, 0, sizeof(currentSerialInfo));
++
+     if (::ioctl(descriptor, TIOCGSERIAL, &currentSerialInfo) == -1)
+         return decodeSystemError();
+ 
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
deleted file mode 100644
index cb12fc1..0000000
--- a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From 6d3adbdeee29af76b41a319016dfd396659ac0b0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.jansa@gmail.com>
-Date: Wed, 11 Sep 2013 18:30:08 +0200
-Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
-
-This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
-is built without GUI support (no-png is set) and we still want to build
-native lrelease + lupdate + lconvert tools.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- examples/examples.pro     |  3 ++-
- src/designer/src/src.pro  | 16 +++++++++-------
- src/linguist/linguist.pro |  2 +-
- src/src.pro               | 14 ++++++++------
- tests/auto/auto.pro       | 24 +++++++++++++-----------
- 5 files changed, 33 insertions(+), 26 deletions(-)
-
-diff --git a/examples/examples.pro b/examples/examples.pro
-index 69365d1..da7b38b 100644
---- a/examples/examples.pro
-+++ b/examples/examples.pro
-@@ -1,4 +1,5 @@
- TEMPLATE = subdirs
--qtHaveModule(widgets): SUBDIRS += help designer linguist uitools assistant
-+!linguistonly:qtHaveModule(widgets): SUBDIRS += help designer assistant
-+qtHaveModule(widgets): SUBDIRS += linguist uitools
- 
- winrt: SUBDIRS -= assistant designer
-diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
-index e02ca8e..49527c5 100644
---- a/src/designer/src/src.pro
-+++ b/src/designer/src/src.pro
-@@ -1,18 +1,20 @@
- TEMPLATE = subdirs
- 
--SUBDIRS = \
--    uitools \
--    lib \
--    components \
--    designer
-+!linguistonly {
-+    SUBDIRS = \
-+        lib \
-+        components \
-+        designer
-+}
-+SUBDIRS += uitools
- 
--contains(QT_CONFIG, shared): SUBDIRS += plugins
-+!linguistonly:contains(QT_CONFIG, shared): SUBDIRS += plugins
- 
- components.depends = lib
- designer.depends = components
- plugins.depends = lib
- 
--qtNomakeTools( \
-+!linguistonly:qtNomakeTools( \
-     lib \
-     components \
-     designer \
-diff --git a/src/linguist/linguist.pro b/src/linguist/linguist.pro
-index 3a70580..a977878 100644
---- a/src/linguist/linguist.pro
-+++ b/src/linguist/linguist.pro
-@@ -3,7 +3,7 @@ SUBDIRS  = \
-     lrelease \
-     lupdate \
-     lconvert
--!no-png:qtHaveModule(widgets): SUBDIRS += linguist
-+!linguistonly:!no-png:qtHaveModule(widgets): SUBDIRS += linguist
- 
- qtNomakeTools( \
-     linguist \
-diff --git a/src/src.pro b/src/src.pro
-index 722b32e..9453152 100644
---- a/src/src.pro
-+++ b/src/src.pro
-@@ -4,10 +4,12 @@ qtHaveModule(widgets) {
-     no-png {
-         message("Some graphics-related tools are unavailable without PNG support")
-     } else {
--        SUBDIRS = assistant \
-+        !linguistonly {
-+            SUBDIRS = assistant \
-                   pixeltool \
--                  qtestlib \
--                  designer
-+                  qtestlib
-+        }
-+        SUBDIRS += designer
- #    unix:!mac:!embedded:!qpa:SUBDIRS += qtconfig
- 
-         linguist.depends = designer
-@@ -15,7 +17,7 @@ qtHaveModule(widgets) {
- }
- 
- SUBDIRS += linguist
--if(!android|android_app):!ios: SUBDIRS += qtpaths
-+if(!android|android_app):!linguistonly:!ios: SUBDIRS += qtpaths
- 
- mac {
-     SUBDIRS += macdeployqt
-@@ -25,11 +27,11 @@ android {
-     SUBDIRS += androiddeployqt
- }
- 
--qtHaveModule(dbus): SUBDIRS += qdbus
-+!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
- 
- win32|winrt:SUBDIRS += windeployqt
- winrt:SUBDIRS += winrtrunner
--qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
-+!linguistonly:qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
- 
- qtNomakeTools( \
-     pixeltool \
-diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
-index df240e3..27ee687 100644
---- a/tests/auto/auto.pro
-+++ b/tests/auto/auto.pro
-@@ -1,15 +1,17 @@
- TEMPLATE=subdirs
--SUBDIRS=\
--    linguist \
--    host.pro \
--    qhelpcontentmodel \
--    qhelpenginecore \
--    qhelpgenerator \
--    qhelpindexmodel \
--    qhelpprojectdata \
--    cmake \
--    installed_cmake \
--    qtdiag
-+!linguistonly {
-+    SUBDIRS=\
-+        linguist \
-+        host.pro \
-+        qhelpcontentmodel \
-+        qhelpenginecore \
-+        qhelpgenerator \
-+        qhelpindexmodel \
-+        qhelpprojectdata \
-+        cmake \
-+        installed_cmake
-+        qtdiag
-+}
- 
- installed_cmake.depends = cmake
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
deleted file mode 100644
index 72fc3a4..0000000
--- a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 5bf38c5d5555ddcaea4a601fdfa304b3f0e5b943 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 17 Jan 2014 14:33:19 +0100
-Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-else we get:
-| ...ld: warning: libQt5CLucene.so.5, needed by ...libQt5Help.so, not found (try using -rpath or -rpath-link)
-| ...undefined reference to `QCLucenePhraseQuery::getTerms() const'
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/assistant/help/help.pro | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
-index 168d23d..a9c3b59 100644
---- a/src/assistant/help/help.pro
-+++ b/src/assistant/help/help.pro
-@@ -59,3 +59,5 @@ HEADERS += qhelpenginecore.h \
- # access to clucene
- HEADERS += qhelpsearchindexwriter_clucene_p.h \
-     qhelpsearchindexreader_clucene_p.h
-+
-+LIBS += -lQt5CLucene
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
deleted file mode 100644
index 7ceb84a..0000000
--- a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c9f7a83107d01b30cb150f7783441fe73003cfa1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 4 Jun 2014 11:28:16 +0200
-Subject: [PATCH 3/3] add noqtwebkit configuration
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropiate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/assistant/assistant/assistant.pro | 4 ++--
- src/designer/src/plugins/plugins.pro  | 2 +-
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
-index 6e82b07..56df78c 100644
---- a/src/assistant/assistant/assistant.pro
-+++ b/src/assistant/assistant/assistant.pro
-@@ -1,4 +1,4 @@
--qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
-+qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
-     QT += webkitwidgets
- } else {
-     DEFINES += QT_NO_WEBKIT
-@@ -71,7 +71,7 @@ SOURCES += aboutdialog.cpp \
-     openpageswidget.cpp \
-     openpagesmanager.cpp \
-     openpagesswitcher.cpp
--qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
-+qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
-     SOURCES += helpviewer_qwv.cpp
- } else {
-     SOURCES += helpviewer_qtb.cpp
-diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
-index 500a153..b60fa2d 100644
---- a/src/designer/src/plugins/plugins.pro
-+++ b/src/designer/src/plugins/plugins.pro
-@@ -1,6 +1,6 @@
- TEMPLATE = subdirs
- 
- # qtHaveModule(opengl): SUBDIRS += tools/view3d
--qtHaveModule(webkitwidgets): SUBDIRS += qwebview
-+qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit): SUBDIRS += qwebview
- win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
- qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
new file mode 100644
index 0000000..cb12fc1
--- /dev/null
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -0,0 +1,155 @@
+From 6d3adbdeee29af76b41a319016dfd396659ac0b0 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.jansa@gmail.com>
+Date: Wed, 11 Sep 2013 18:30:08 +0200
+Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
+
+This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
+is built without GUI support (no-png is set) and we still want to build
+native lrelease + lupdate + lconvert tools.
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ examples/examples.pro     |  3 ++-
+ src/designer/src/src.pro  | 16 +++++++++-------
+ src/linguist/linguist.pro |  2 +-
+ src/src.pro               | 14 ++++++++------
+ tests/auto/auto.pro       | 24 +++++++++++++-----------
+ 5 files changed, 33 insertions(+), 26 deletions(-)
+
+diff --git a/examples/examples.pro b/examples/examples.pro
+index 69365d1..da7b38b 100644
+--- a/examples/examples.pro
++++ b/examples/examples.pro
+@@ -1,4 +1,5 @@
+ TEMPLATE = subdirs
+-qtHaveModule(widgets): SUBDIRS += help designer linguist uitools assistant
++!linguistonly:qtHaveModule(widgets): SUBDIRS += help designer assistant
++qtHaveModule(widgets): SUBDIRS += linguist uitools
+ 
+ winrt: SUBDIRS -= assistant designer
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
+index 722b32e..9453152 100644
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
+-if(!android|android_app):!ios: SUBDIRS += qtpaths
++if(!android|android_app):!linguistonly:!ios: SUBDIRS += qtpaths
+ 
+ mac {
+     SUBDIRS += macdeployqt
+@@ -25,11 +27,11 @@ android {
+     SUBDIRS += androiddeployqt
+ }
+ 
+-qtHaveModule(dbus): SUBDIRS += qdbus
++!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
+ 
+ win32|winrt:SUBDIRS += windeployqt
+ winrt:SUBDIRS += winrtrunner
+-qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
++!linguistonly:qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
+ 
+ qtNomakeTools( \
+     pixeltool \
+diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
+index df240e3..27ee687 100644
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
++        installed_cmake
++        qtdiag
++}
+ 
+ installed_cmake.depends = cmake
+ 
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
new file mode 100644
index 0000000..72fc3a4
--- /dev/null
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -0,0 +1,32 @@
+From 5bf38c5d5555ddcaea4a601fdfa304b3f0e5b943 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 17 Jan 2014 14:33:19 +0100
+Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
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
+2.3.5
+
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
new file mode 100644
index 0000000..7ceb84a
--- /dev/null
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -0,0 +1,51 @@
+From c9f7a83107d01b30cb150f7783441fe73003cfa1 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Wed, 4 Jun 2014 11:28:16 +0200
+Subject: [PATCH 3/3] add noqtwebkit configuration
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Inappropiate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/assistant/assistant/assistant.pro | 4 ++--
+ src/designer/src/plugins/plugins.pro  | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/assistant/assistant/assistant.pro b/src/assistant/assistant/assistant.pro
+index 6e82b07..56df78c 100644
+--- a/src/assistant/assistant/assistant.pro
++++ b/src/assistant/assistant/assistant.pro
+@@ -1,4 +1,4 @@
+-qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
++qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
+     QT += webkitwidgets
+ } else {
+     DEFINES += QT_NO_WEBKIT
+@@ -71,7 +71,7 @@ SOURCES += aboutdialog.cpp \
+     openpageswidget.cpp \
+     openpagesmanager.cpp \
+     openpagesswitcher.cpp
+-qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static) {
++qtHaveModule(webkitwidgets):!contains(QT_CONFIG, static):!contains(CONFIG, noqtwebkit) {
+     SOURCES += helpviewer_qwv.cpp
+ } else {
+     SOURCES += helpviewer_qtb.cpp
+diff --git a/src/designer/src/plugins/plugins.pro b/src/designer/src/plugins/plugins.pro
+index 500a153..b60fa2d 100644
+--- a/src/designer/src/plugins/plugins.pro
++++ b/src/designer/src/plugins/plugins.pro
+@@ -1,6 +1,6 @@
+ TEMPLATE = subdirs
+ 
+ # qtHaveModule(opengl): SUBDIRS += tools/view3d
+-qtHaveModule(webkitwidgets): SUBDIRS += qwebview
++qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit): SUBDIRS += qwebview
+ win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
+ qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
deleted file mode 100644
index a7be5e5..0000000
--- a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From ecaf131c0307f198f8efbf06410976ded97aab80 Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Fri, 19 Jul 2013 13:35:14 +0000
-Subject: [PATCH] Install the qtwaylandscanner tool to the native side
-
-Upstream-Status: Inappropiate [configuration]
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
----
- src/qtwaylandscanner/qtwaylandscanner.pro | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/qtwaylandscanner/qtwaylandscanner.pro b/src/qtwaylandscanner/qtwaylandscanner.pro
-index ac2d07b..7a46a24 100644
---- a/src/qtwaylandscanner/qtwaylandscanner.pro
-+++ b/src/qtwaylandscanner/qtwaylandscanner.pro
-@@ -1,6 +1,10 @@
- option(host_build)
- 
--SOURCES += qtwaylandscanner.cpp
-+TARGET = qtwaylandscanner$$qtPlatformTargetSuffix()
-+CONFIG += console warn_off
-+QT = core
- 
--load(qt_tool)
-+SOURCES += qtwaylandscanner.cpp
- 
-+target.path = $$[QT_HOST_BINS]
-+INSTALLS += target
--- 
-2.3.1
-
diff --git a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
deleted file mode 100644
index e1a41db..0000000
--- a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 90fc9f3f059c19e84ffd29718482a2f06ec3f0bf Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 22 Feb 2014 17:47:44 +0100
-Subject: [PATCH] examples/wayland: include server-buffer only when building
- with opengles2
-
-* it's using glBindBuffer in
-  server-buffer/client/serverbufferrenderer.cpp
-
-Change-Id: I8412dfd4ebb95c147328ac6e4dfff14a0cff4e78
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- examples/wayland/wayland.pro | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/examples/wayland/wayland.pro b/examples/wayland/wayland.pro
-index d633fb9..643c7cd 100644
---- a/examples/wayland/wayland.pro
-+++ b/examples/wayland/wayland.pro
-@@ -9,5 +9,7 @@ contains(CONFIG, wayland-compositor) {
-         SUBDIRS += qml-compositor
-     }
- 
--    SUBDIRS += server-buffer
-+    contains(QT_CONFIG, opengles2) {
-+        SUBDIRS += server-buffer
-+    }
- }
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
new file mode 100644
index 0000000..a7be5e5
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -0,0 +1,32 @@
+From ecaf131c0307f198f8efbf06410976ded97aab80 Mon Sep 17 00:00:00 2001
+From: Simon Busch <morphis@gravedo.de>
+Date: Fri, 19 Jul 2013 13:35:14 +0000
+Subject: [PATCH] Install the qtwaylandscanner tool to the native side
+
+Upstream-Status: Inappropiate [configuration]
+
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+---
+ src/qtwaylandscanner/qtwaylandscanner.pro | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/qtwaylandscanner/qtwaylandscanner.pro b/src/qtwaylandscanner/qtwaylandscanner.pro
+index ac2d07b..7a46a24 100644
+--- a/src/qtwaylandscanner/qtwaylandscanner.pro
++++ b/src/qtwaylandscanner/qtwaylandscanner.pro
+@@ -1,6 +1,10 @@
+ option(host_build)
+ 
+-SOURCES += qtwaylandscanner.cpp
++TARGET = qtwaylandscanner$$qtPlatformTargetSuffix()
++CONFIG += console warn_off
++QT = core
+ 
+-load(qt_tool)
++SOURCES += qtwaylandscanner.cpp
+ 
++target.path = $$[QT_HOST_BINS]
++INSTALLS += target
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
new file mode 100644
index 0000000..e1a41db
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -0,0 +1,31 @@
+From 90fc9f3f059c19e84ffd29718482a2f06ec3f0bf Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 22 Feb 2014 17:47:44 +0100
+Subject: [PATCH] examples/wayland: include server-buffer only when building
+ with opengles2
+
+* it's using glBindBuffer in
+  server-buffer/client/serverbufferrenderer.cpp
+
+Change-Id: I8412dfd4ebb95c147328ac6e4dfff14a0cff4e78
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ examples/wayland/wayland.pro | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/examples/wayland/wayland.pro b/examples/wayland/wayland.pro
+index d633fb9..643c7cd 100644
+--- a/examples/wayland/wayland.pro
++++ b/examples/wayland/wayland.pro
+@@ -9,5 +9,7 @@ contains(CONFIG, wayland-compositor) {
+         SUBDIRS += qml-compositor
+     }
+ 
+-    SUBDIRS += server-buffer
++    contains(QT_CONFIG, opengles2) {
++        SUBDIRS += server-buffer
++    }
+ }
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
deleted file mode 100644
index b4a8852..0000000
--- a/recipes-qt/qt5/qtwebengine-git/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 21d008c31a262ddcaeb3a8457de49061361ed882 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
- when building for x64 arch
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- chromium/base/base.gypi | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
-index a5a990a..af30cfa 100644
---- a/src/3rdparty/chromium/base/base.gypi
-+++ b/src/3rdparty/chromium/base/base.gypi
-@@ -745,7 +745,7 @@
-                 ['include', '^nix/'],
-               ],
-           }],
--          ['use_qt==1 and target_arch=="ia32"', {
-+          ['use_qt==1 and target_arch=="ia32" or target_arch=="x64"', {
-               'sources/': [
-                 ['include', 'atomicops_internals_x86_gcc.cc'],
-               ],
--- 
-2.3.1
-
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
deleted file mode 100644
index 134133b..0000000
--- a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b6ca6c086aa21985e17d11592a830f18159f1c3b Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
- anywhere in path, but at the end
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 4c2547d..64c08ad 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -87,8 +87,8 @@ defineReplace(findIncludedMocFiles) {
- defineReplace(mocOutput) {
-   out = $$1
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|)), $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
--  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|)), $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-+  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
-   return($$out)
- }
- 
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
deleted file mode 100644
index 8d1c5fd..0000000
--- a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From cfe706846298d41defbf0386f85b17e70108b7af Mon Sep 17 00:00:00 2001
-From: Simon Busch <morphis@gravedo.de>
-Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
- generate it's moc'ed abbreviation
-
-Signed-off-by: Simon Busch <morphis@gravedo.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 64c08ad..b46478b 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -85,7 +85,8 @@ defineReplace(findIncludedMocFiles) {
- }
- 
- defineReplace(mocOutput) {
--  out = $$1
-+  in = $$1
-+  out = $$basename(in)
-   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
-   out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
-   out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
deleted file mode 100644
index 4e5e453..0000000
--- a/recipes-qt/qt5/qtwebengine-git/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9595a2dd48dbf45ba1661cf1fd4d38fac8192a4f Mon Sep 17 00:00:00 2001
-From: Frieder Schrempf <frieder.schrempf@online.de>
-Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- tools/qmake/mkspecs/features/functions.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index b46478b..6205bf4 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -10,7 +10,7 @@ defineTest(isPlatformSupported) {
- 
-   linux-g++*:!isGCCVersionSupported(): return(false)
-   !isPythonVersionSupported(): return(false)
--  linux-g++*|win32-msvc2013|macx-clang: return(true)
-+  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang: return(true)
-   boot2qt: return(true)
- 
-   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
new file mode 100644
index 0000000..b4a8852
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -0,0 +1,27 @@
+From 21d008c31a262ddcaeb3a8457de49061361ed882 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 3 Oct 2014 03:52:11 +0200
+Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
+ when building for x64 arch
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ chromium/base/base.gypi | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
+index a5a990a..af30cfa 100644
+--- a/src/3rdparty/chromium/base/base.gypi
++++ b/src/3rdparty/chromium/base/base.gypi
+@@ -745,7 +745,7 @@
+                 ['include', '^nix/'],
+               ],
+           }],
+-          ['use_qt==1 and target_arch=="ia32"', {
++          ['use_qt==1 and target_arch=="ia32" or target_arch=="x64"', {
+               'sources/': [
+                 ['include', 'atomicops_internals_x86_gcc.cc'],
+               ],
+-- 
+2.3.1
+
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
new file mode 100644
index 0000000..134133b
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -0,0 +1,29 @@
+From b6ca6c086aa21985e17d11592a830f18159f1c3b Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 30 Jun 2014 20:08:17 +0200
+Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+ anywhere in path, but at the end
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 4c2547d..64c08ad 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -87,8 +87,8 @@ defineReplace(findIncludedMocFiles) {
+ defineReplace(mocOutput) {
+   out = $$1
+   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
+-  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|)), $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
+-  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|)), $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
++  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
++  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
+   return($$out)
+ }
+ 
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
new file mode 100644
index 0000000..8d1c5fd
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -0,0 +1,29 @@
+From cfe706846298d41defbf0386f85b17e70108b7af Mon Sep 17 00:00:00 2001
+From: Simon Busch <morphis@gravedo.de>
+Date: Tue, 18 Nov 2014 10:38:18 +0100
+Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
+ generate it's moc'ed abbreviation
+
+Signed-off-by: Simon Busch <morphis@gravedo.de>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 64c08ad..b46478b 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -85,7 +85,8 @@ defineReplace(findIncludedMocFiles) {
+ }
+ 
+ defineReplace(mocOutput) {
+-  out = $$1
++  in = $$1
++  out = $$basename(in)
+   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
+   out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
+   out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
new file mode 100644
index 0000000..4e5e453
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -0,0 +1,29 @@
+From 9595a2dd48dbf45ba1661cf1fd4d38fac8192a4f Mon Sep 17 00:00:00 2001
+From: Frieder Schrempf <frieder.schrempf@online.de>
+Date: Mon, 1 Dec 2014 14:34:40 +0000
+Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Frieder Schrempf <frieder.schrempf@online.de>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index b46478b..6205bf4 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -10,7 +10,7 @@ defineTest(isPlatformSupported) {
+ 
+   linux-g++*:!isGCCVersionSupported(): return(false)
+   !isPythonVersionSupported(): return(false)
+-  linux-g++*|win32-msvc2013|macx-clang: return(true)
++  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang: return(true)
+   boot2qt: return(true)
+ 
+   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
deleted file mode 100644
index 886a954..0000000
--- a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b3d43d2b8c1e11122ac36e3e0b102c2ffef83010 Mon Sep 17 00:00:00 2001
-From: Trevor Woerner <trevor.woerner@linaro.org>
-Date: Fri, 7 Feb 2014 04:07:17 +0100
-Subject: [PATCH 1/2] qtwebkit: fix QA issue (bad RPATH)
-
-Building qtwebkit causes a QA issue such that QtWebPluginProcess and
-QtWebProcess contain bad RPATHs which point into the build location. This fix
-adds a patch to not include the rpath.prf which causes this problem.
-
-Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Tools/qmake/mkspecs/features/unix/default_post.prf | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
-index fd66af6..ef754c3 100644
---- a/Tools/qmake/mkspecs/features/unix/default_post.prf
-+++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
-@@ -61,7 +61,6 @@ linux-*g++* {
-     }
- }
- 
--contains(TEMPLATE, app): CONFIG += rpath
- 
- CONFIG(debug, debug|release)|force_debug_info {
-     # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch
deleted file mode 100644
index de21a7c..0000000
--- a/recipes-qt/qt5/qtwebkit-git/0002-Remove-TEXTREL-tag-in-x86.patch
+++ /dev/null
@@ -1,79 +0,0 @@
-From 491cbd653eb7b992202f06bd2e62cf29f5f495af Mon Sep 17 00:00:00 2001
-From: Magnus Granberg <zorry@gentoo.org>
-Date: Fri, 27 Feb 2015 11:55:09 +0100
-Subject: [PATCH 2/2] Remove TEXTREL tag in x86
-
-Fix textrel QA warnings when building qtwebkit for x86:
-
-  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
-
-Patch from upstream webkit:
-
-  https://bugs.webkit.org/show_bug.cgi?id=70610
-
-Minor refresh required to apply cleanly to the older webkit sources used
-by qtwebkit. Specifically, the patch needed to be modified to account
-for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
-part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
-
-Upstream status [webkit] : backport
-Upstream status [qtwebkit] : unclear
-
-Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
- Source/WTF/wtf/InlineASM.h                    |  2 ++
- 2 files changed, 26 insertions(+)
-
-diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-index 9684df2..8af82d8 100644
---- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-+++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
-@@ -524,6 +524,30 @@ double jsRound(double d)
-     } \
-     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
- 
-+#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
-+#define defineUnaryDoubleOpWrapper(function) \
-+    asm( \
-+        ".text\n" \
-+        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
-+        HIDE_SYMBOL(function##Thunk) "\n" \
-+        SYMBOL_STRING(function##Thunk) ":" "\n" \
-+        "pushl %ebx\n" \
-+        "subl $20, %esp\n" \
-+        "movsd %xmm0, (%esp) \n" \
-+        "call __x86.get_pc_thunk.bx\n" \
-+        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
-+        "call " GLOBAL_REFERENCE(function) "\n" \
-+        "fstpl (%esp) \n" \
-+        "movsd (%esp), %xmm0 \n" \
-+        "addl $20, %esp\n" \
-+        "popl %ebx\n" \
-+        "ret\n" \
-+    );\
-+    extern "C" { \
-+        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
-+    } \
-+    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
-+
- #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
- #define defineUnaryDoubleOpWrapper(function) \
-     asm( \
-diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
-index 0a2fe78..2dc40ef 100644
---- a/Source/WTF/wtf/InlineASM.h
-+++ b/Source/WTF/wtf/InlineASM.h
-@@ -46,6 +46,8 @@
- #define GLOBAL_REFERENCE(name) #name "@plt"
- #elif CPU(X86) && COMPILER(MINGW)
- #define GLOBAL_REFERENCE(name) "@" #name "@4"
-+#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
-+#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
- #else
- #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
- #endif
--- 
-2.3.5
-
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
new file mode 100644
index 0000000..886a954
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -0,0 +1,30 @@
+From b3d43d2b8c1e11122ac36e3e0b102c2ffef83010 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <trevor.woerner@linaro.org>
+Date: Fri, 7 Feb 2014 04:07:17 +0100
+Subject: [PATCH 1/2] qtwebkit: fix QA issue (bad RPATH)
+
+Building qtwebkit causes a QA issue such that QtWebPluginProcess and
+QtWebProcess contain bad RPATHs which point into the build location. This fix
+adds a patch to not include the rpath.prf which causes this problem.
+
+Signed-off-by: Trevor Woerner <trevor.woerner@linaro.org>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Tools/qmake/mkspecs/features/unix/default_post.prf | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Tools/qmake/mkspecs/features/unix/default_post.prf b/Tools/qmake/mkspecs/features/unix/default_post.prf
+index fd66af6..ef754c3 100644
+--- a/Tools/qmake/mkspecs/features/unix/default_post.prf
++++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
+@@ -61,7 +61,6 @@ linux-*g++* {
+     }
+ }
+ 
+-contains(TEMPLATE, app): CONFIG += rpath
+ 
+ CONFIG(debug, debug|release)|force_debug_info {
+     # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
+-- 
+2.3.5
+
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
new file mode 100644
index 0000000..de21a7c
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -0,0 +1,79 @@
+From 491cbd653eb7b992202f06bd2e62cf29f5f495af Mon Sep 17 00:00:00 2001
+From: Magnus Granberg <zorry@gentoo.org>
+Date: Fri, 27 Feb 2015 11:55:09 +0100
+Subject: [PATCH 2/2] Remove TEXTREL tag in x86
+
+Fix textrel QA warnings when building qtwebkit for x86:
+
+  WARNING: QA Issue: ELF binary '/home/andre/rdk/rdk-master/build-vbox32/tmp/work/core2-32-rdk-linux/qtwebkit/5.4.0-r0/packages-split/qtwebkit/usr/lib/libQt5WebKit.so.5.4.0' has relocations in .text [textrel]
+
+Patch from upstream webkit:
+
+  https://bugs.webkit.org/show_bug.cgi?id=70610
+
+Minor refresh required to apply cleanly to the older webkit sources used
+by qtwebkit. Specifically, the patch needed to be modified to account
+for PLATFORM(MAC) -> OS(DARWIN) renaming in recent webkit which is not
+part of qtwebkit yet ( https://bugs.webkit.org/show_bug.cgi?id=99683 ).
+
+Upstream status [webkit] : backport
+Upstream status [qtwebkit] : unclear
+
+Bug: https://bugs.webkit.org/show_bug.cgi?id=70610
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ Source/JavaScriptCore/jit/ThunkGenerators.cpp | 24 ++++++++++++++++++++++++
+ Source/WTF/wtf/InlineASM.h                    |  2 ++
+ 2 files changed, 26 insertions(+)
+
+diff --git a/Source/JavaScriptCore/jit/ThunkGenerators.cpp b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+index 9684df2..8af82d8 100644
+--- a/Source/JavaScriptCore/jit/ThunkGenerators.cpp
++++ b/Source/JavaScriptCore/jit/ThunkGenerators.cpp
+@@ -524,6 +524,30 @@ double jsRound(double d)
+     } \
+     static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
+ 
++#elif CPU(X86) && COMPILER(GCC) && OS(LINUX) && defined(__PIC__)
++#define defineUnaryDoubleOpWrapper(function) \
++    asm( \
++        ".text\n" \
++        ".globl " SYMBOL_STRING(function##Thunk) "\n" \
++        HIDE_SYMBOL(function##Thunk) "\n" \
++        SYMBOL_STRING(function##Thunk) ":" "\n" \
++        "pushl %ebx\n" \
++        "subl $20, %esp\n" \
++        "movsd %xmm0, (%esp) \n" \
++        "call __x86.get_pc_thunk.bx\n" \
++        "addl $_GLOBAL_OFFSET_TABLE_, %ebx\n" \
++        "call " GLOBAL_REFERENCE(function) "\n" \
++        "fstpl (%esp) \n" \
++        "movsd (%esp), %xmm0 \n" \
++        "addl $20, %esp\n" \
++        "popl %ebx\n" \
++        "ret\n" \
++    );\
++    extern "C" { \
++        MathThunkCallingConvention function##Thunk(MathThunkCallingConvention); \
++    } \
++    static MathThunk UnaryDoubleOpWrapper(function) = &function##Thunk;
++
+ #elif CPU(X86) && COMPILER(GCC) && (PLATFORM(MAC) || OS(LINUX))
+ #define defineUnaryDoubleOpWrapper(function) \
+     asm( \
+diff --git a/Source/WTF/wtf/InlineASM.h b/Source/WTF/wtf/InlineASM.h
+index 0a2fe78..2dc40ef 100644
+--- a/Source/WTF/wtf/InlineASM.h
++++ b/Source/WTF/wtf/InlineASM.h
+@@ -46,6 +46,8 @@
+ #define GLOBAL_REFERENCE(name) #name "@plt"
+ #elif CPU(X86) && COMPILER(MINGW)
+ #define GLOBAL_REFERENCE(name) "@" #name "@4"
++#elif OS(LINUX) && CPU(X86) && defined(__PIC__)
++#define GLOBAL_REFERENCE(name) SYMBOL_STRING(name) "@plt"
+ #else
+ #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
+ #endif
+-- 
+2.3.5
+
-- 
2.4.2


