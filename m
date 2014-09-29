Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 443CD71697
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 21:57:08 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id p10so2331963wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Sep 2014 14:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=DPt5DBiKO2D8gAcxlkadHHEeWn8z+dFCHOQH0Te/V8s=;
	b=0clYSi16OXVJUY4kRE2PBmfuHCu0aXLqrAeqvldJZ6GawnIi2Cc26gitbf/UAwFpUo
	hEGD/ldfTocA/bc+fXkdm9Fi3T1dIUgGyywchSLnZZHzdV6IWxL4j86y6oHXaHjnaRg4
	WrRqOMbTl6KB3WJ3SsQBul6pKQqM+onoRImRlNKyhzlFMVsvUND/Tc2cKpgVI09Zj0RX
	mLf4IZ1wpKkFpxDDODzMuK8i/diYS0ijRSQRxQQzrBmiTVAt+iDdLl8OLKdu44O1gXDF
	APk0doJJZRp5W8ydtNiN4F8ytowIFBiqPdjxjt5K7OIEMTNkwJ8tZaNr+Kv1JtD5PHFg
	1DnQ==
X-Received: by 10.180.101.100 with SMTP id ff4mr728944wib.43.1412027829639;
	Mon, 29 Sep 2014 14:57:09 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g6sm17079281wjf.13.2014.09.29.14.57.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Sep 2014 14:57:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Sep 2014 23:57:55 +0200
Message-Id: <1412027875-24924-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412027875-24924-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412027875-24924-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][WIP][PATCH 4/4] qt5: upgrade git recipes to 5.4-alpha1
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
X-List-Received-Date: Mon, 29 Sep 2014 21:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/qt5-versions.inc               |  2 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb             | 16 ++--
 recipes-qt/qt5/qt5-git.inc                         |  4 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  | 36 ++++-----
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch | 10 +--
 .../0003-Add-external-hostbindir-option.patch      | 44 +++++------
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch | 10 +--
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 10 +--
 ...lfs-Print-the-chosen-config-in-debug-mode.patch | 56 --------------
 ...integration-Undefine-CursorShape-from-X..patch} | 12 +--
 ...mp-path-length-from-256-to-512-character.patch} | 10 +--
 ...l-error-for-platforms-only-supporting-on.patch} | 16 ++--
 ...0009-QOpenGLPaintDevice-sub-area-support.patch} | 36 ++++-----
 ...build-uic.patch => 0010-Always-build-uic.patch} | 10 +--
 ...10-Revert-Use-the-gcc-feature-in-simd.prf.patch | 26 -------
 ...build-it-in-configure-but-allow-to-build.patch} | 10 +--
 ...eserve-built-qmake-and-swap-with-native-.patch} | 10 +--
 recipes-qt/qt5/qtbase-native_git.bb                | 14 ++--
 recipes-qt/qt5/qtbase_git.bb                       | 14 ++--
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             | 88 ++++++++++++++++++++++
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  3 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +
 ...w-to-build-only-lrelease-lupdate-lconvert.patch | 29 +++----
 ...t-help-fix-linking-of-dependent-libraries.patch |  6 +-
 .../0003-add-noqtwebkit-configuration.patch        |  4 +-
 recipes-qt/qt5/qttools-native_git.bb               |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  6 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  6 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 45 files changed, 258 insertions(+), 268 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
 rename recipes-qt/qt5/qtbase-git/{0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch => 0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch} (79%)
 rename recipes-qt/qt5/qtbase-git/{0008-configure-bump-path-length-from-256-to-512-character.patch => 0007-configure-bump-path-length-from-256-to-512-character.patch} (78%)
 rename recipes-qt/qt5/qtbase-git/{0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch => 0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch} (85%)
 rename recipes-qt/qt5/qtbase-git/{0011-QOpenGLPaintDevice-sub-area-support.patch => 0009-QOpenGLPaintDevice-sub-area-support.patch} (84%)
 rename recipes-qt/qt5/qtbase-git/{0011-Always-build-uic.patch => 0010-Always-build-uic.patch} (77%)
 delete mode 100644 recipes-qt/qt5/qtbase-git/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
 rename recipes-qt/qt5/qtbase-git/{0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch => 0010-qmake-don-t-build-it-in-configure-but-allow-to-build.patch} (84%)
 rename recipes-qt/qt5/qtbase-git/{0012-configure-preserve-built-qmake-and-swap-with-native-.patch => 0011-configure-preserve-built-qmake-and-swap-with-native-.patch} (74%)
 create mode 100644 recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index ff2eae7..d1a0767 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,5 +1,5 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.3.2", "5.3.0+git%"
+# possible values now "5.3.2", "5.3.0+5.4.0-alpha1+git"
 
 QT5_VERSION ?= "5.3.2"
 
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4b91539..e775d5e 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -15,22 +15,20 @@ SRC_URI += "\
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
     file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0011-Always-build-uic.patch \
+    file://0010-Always-build-uic.patch \
 "    
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0011-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
-SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
+SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 3e714e0..6f63c31 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -1,7 +1,7 @@
 # Copyright (C) 2012 O.S. Systems Software LTDA.
 # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
 
-QT_MODULE_BRANCH ?= "stable"
+QT_MODULE_BRANCH ?= "5.4"
 
 # each module needs to define valid SRCREV
 SRC_URI += " \
@@ -10,7 +10,7 @@ SRC_URI += " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.3.0+git${SRCPV}"
+PV = "5.3.0+5.4.0-alpha1+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index eca6b36..7f39ea0 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 9c7d71880c6ec5b07e3030b7c7a23e004d5c60a2 Mon Sep 17 00:00:00 2001
+From 679fe396c16e7ec5b862a3ddbf4b9a56287c06ff Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/12] Add linux-oe-g++ platform
+Subject: [PATCH 01/11] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -43,18 +43,18 @@ Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
  configure                            |  66 ++++++++++++++++-------
- mkspecs/features/configure.prf       |   4 +-
+ mkspecs/features/configure.prf       |   2 +-
  mkspecs/linux-oe-g++/qmake.conf      |  40 ++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 188 insertions(+), 22 deletions(-)
+ 4 files changed, 187 insertions(+), 21 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index d5c2b08..4eae0d3 100755
+index 1efb645..b1dfca9 100755
 --- a/configure
 +++ b/configure
-@@ -324,6 +324,16 @@ getQMakeConf()
+@@ -316,6 +316,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
  
@@ -71,7 +71,7 @@ index d5c2b08..4eae0d3 100755
  getXQMakeConf()
  {
      if [ -z "$xspecvals" ]; then
-@@ -333,6 +343,16 @@ getXQMakeConf()
+@@ -325,6 +335,16 @@ getXQMakeConf()
      getSingleQMakeVariable "$1" "$xspecvals"
  }
  
@@ -88,7 +88,7 @@ index d5c2b08..4eae0d3 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -548,21 +568,19 @@ fi
+@@ -541,21 +561,19 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -118,7 +118,7 @@ index d5c2b08..4eae0d3 100755
  # Use CC/CXX to run config.tests
  mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
-@@ -3140,7 +3158,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3141,7 +3159,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -127,7 +127,7 @@ index d5c2b08..4eae0d3 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3175,7 +3193,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3176,7 +3194,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -136,7 +136,7 @@ index d5c2b08..4eae0d3 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3633,6 +3651,14 @@ setBootstrapVariable()
+@@ -3647,6 +3665,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -151,7 +151,7 @@ index d5c2b08..4eae0d3 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3671,14 +3697,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3685,14 +3711,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -175,10 +175,10 @@ index d5c2b08..4eae0d3 100755
          if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index fe41c54..e2db923 100644
+index 05e10c9..62f4a88 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -60,12 +60,12 @@ defineTest(qtCompileTest) {
+@@ -60,7 +60,7 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
@@ -187,12 +187,6 @@ index fe41c54..e2db923 100644
  
      mkpath($$test_out_dir)|error("Aborting.")
  
-     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qmake_configs $$shell_quote($$test_dir)") {
--        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
-+        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
-             log("yes$$escape_expand(\\n)")
-             msg = "test $$1 succeeded"
-             write_file($$QMAKE_CONFIG_LOG, msg, append)
 diff --git a/mkspecs/linux-oe-g++/qmake.conf b/mkspecs/linux-oe-g++/qmake.conf
 new file mode 100644
 index 0000000..ca26b10
@@ -346,5 +340,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 29f788e..0125ab3 100644
--- a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From ad884ab378939e685a3b00af03bb6875d9bdc1d5 Mon Sep 17 00:00:00 2001
+From 50401a1b5bae733a56d457c2d884751c3e6a60fc Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/12] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/11] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 6d25325..80e0f30 100644
+index c3ec2bc..1be2659 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -153,7 +153,10 @@ QLibrarySettings::QLibrarySettings()
+@@ -147,7 +147,10 @@ QLibrarySettings::QLibrarySettings()
  
  QSettings *QLibraryInfoPrivate::findConfiguration()
  {
@@ -35,5 +35,5 @@ index 6d25325..80e0f30 100644
      if(!QFile::exists(qtconfig))
          qtconfig = qt_libraryInfoFile();
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 2abea8f..1bf2d14 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From b544f5f3462e2981ada045a32038b7f116f8590c Mon Sep 17 00:00:00 2001
+From 5fe40be6428c3e2116203a27e290e7092c965327 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/12] Add -external-hostbindir option
+Subject: [PATCH 03/11] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -38,10 +38,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  11 files changed, 51 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index d5c2b08..dcd066c 100755
+index b1dfca9..dcd1790 100755
 --- a/configure
 +++ b/configure
-@@ -759,6 +759,7 @@ QT_HOST_BINS=
+@@ -768,6 +768,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -49,7 +49,7 @@ index d5c2b08..dcd066c 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -878,6 +879,7 @@ while [ "$#" -gt 0 ]; do
+@@ -887,6 +888,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -57,7 +57,7 @@ index d5c2b08..dcd066c 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1092,6 +1094,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1101,6 +1103,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -67,7 +67,7 @@ index d5c2b08..dcd066c 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2230,6 +2235,10 @@ Installation options:
+@@ -2252,6 +2257,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -78,7 +78,7 @@ index d5c2b08..dcd066c 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2897,6 +2906,11 @@ fi
+@@ -2916,6 +2925,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,7 +90,7 @@ index d5c2b08..dcd066c 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3577,6 +3591,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3609,6 +3623,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -99,10 +99,10 @@ index d5c2b08..dcd066c 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 9a4d80e..dfc1cff 100644
+index 709248a..ea2fed0 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -193,7 +193,11 @@ defineTest(qtAddRpathLink) {
+@@ -191,7 +191,11 @@ defineTest(qtAddRpathLink) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
@@ -134,10 +134,10 @@ index 1d3e88c..9b26adf 100644
  
      !host_build|!force_bootstrap: MODULE_DEPENDS = $$replace(QT, -private$, _private)
 diff --git a/qmake/property.cpp b/qmake/property.cpp
-index e50485c..71291ad 100644
+index 051e056..50da6ed 100644
 --- a/qmake/property.cpp
 +++ b/qmake/property.cpp
-@@ -75,6 +75,7 @@ static const struct {
+@@ -67,6 +67,7 @@ static const struct {
      { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
      { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
      { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
@@ -211,10 +211,10 @@ index 9bda70e..6e3605a 100644
      _qt5_Core_check_file_exists(${imported_location})
  
 diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index 174c1d0..1fe03cb 100644
+index 1be2659..6c3718a 100644
 --- a/src/corelib/global/qlibraryinfo.cpp
 +++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -333,7 +333,7 @@ QLibraryInfo::isDebugBuild()
+@@ -357,7 +357,7 @@ QLibraryInfo::isDebugBuild()
   */
  
  static const struct {
@@ -223,7 +223,7 @@ index 174c1d0..1fe03cb 100644
  } qtConfEntries[] = {
      { "Prefix", "." },
      { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -359,6 +359,7 @@ static const struct {
+@@ -383,6 +383,7 @@ static const struct {
      { "HostBinaries", "bin" },
      { "HostLibraries", "lib" },
      { "HostData", "." },
@@ -232,10 +232,10 @@ index 174c1d0..1fe03cb 100644
      { "HostSpec", "" },
  #endif
 diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 0b573c2..b5535ee 100644
+index 543c4b3..a02e03a 100644
 --- a/src/corelib/global/qlibraryinfo.h
 +++ b/src/corelib/global/qlibraryinfo.h
-@@ -88,6 +88,7 @@ public:
+@@ -80,6 +80,7 @@ public:
          HostBinariesPath,
          HostLibrariesPath,
          HostDataPath,
@@ -279,10 +279,10 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index b756509..7e61845 100644
+index ef71097..7969132 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1213,6 +1213,13 @@ void Configure::parseCmdLine()
+@@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -296,7 +296,7 @@ index b756509..7e61845 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -3983,6 +3990,7 @@ void Configure::generateQConfigCpp()
+@@ -3984,6 +3991,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
@@ -305,5 +305,5 @@ index b756509..7e61845 100644
                    << "    \"qt_hostspec=" << hostSpec << "\"," << endl
                    << "#endif" << endl
 -- 
-2.0.1
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index 78fb3c6..a932de0 100644
--- a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
-From 8a14a69d5b0078554ed002e682c72e995b1e6320 Mon Sep 17 00:00:00 2001
+From df112e16f1bbd0c90a1ac17a6c3281a1be08fd93 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/12] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 04/11] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 7e61845..29c6358 100644
+index 7969132..439dcfb 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -3370,8 +3370,8 @@ void Configure::generateQConfigPri()
+@@ -3373,8 +3373,8 @@ void Configure::generateQConfigPri()
          configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
          if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
              // FIXME: add detection
@@ -26,5 +26,5 @@ index 7e61845..29c6358 100644
          configStream << "}" << endl;
          configStream << "QT_CONFIG += " << qtConfig.join(' ') << endl;
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 182de79..d1a3ee3 100644
--- a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From 1e87c127c5d268870c51894c955bf24cde83ff69 Mon Sep 17 00:00:00 2001
+From 191da67d9291ab25e0838831c3ea545074c7212d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 05/12] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH 05/11] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -67,7 +67,7 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  2 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index 4dcabe9..d04bc3e 100644
+index ebc5f00..46319d8 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -33,7 +33,7 @@ contains(TEMPLATE, .*lib) {
@@ -80,7 +80,7 @@ index 4dcabe9..d04bc3e 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 8bf4c92..ee2e989 100644
+index 6ab8267..2b4943c 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
 @@ -188,10 +188,25 @@ unix|mingw {
@@ -110,5 +110,5 @@ index 8bf4c92..ee2e989 100644
  }
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
deleted file mode 100644
index 0e3bc99..0000000
--- a/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From ca212fd10a95b2c694f3c89c3f22a2b0ae185198 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 06/12] Revert "eglfs: Print the chosen config in debug mode"
-
-This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
----
- src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
- src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
- 2 files changed, 3 insertions(+), 8 deletions(-)
-
-diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index 5eed470..39c7c1f 100644
---- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
-+++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-@@ -451,9 +451,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
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
- #ifdef Q_OS_LINUX
-diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-index eec6463..4a7c69b 100644
---- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-+++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-@@ -44,7 +44,6 @@
- #include "qeglpbuffer_p.h"
- #include <qpa/qplatformwindow.h>
- #include <QOpenGLContext>
--#include <QDebug>
- 
- QT_BEGIN_NAMESPACE
- 
-@@ -192,12 +191,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
-         return;
-     }
- 
--    static const bool printConfig = qgetenv("QT_QPA_EGLFS_DEBUG").toInt();
--    if (printConfig) {
--        qDebug() << "Created context for format" << format << "with config:";
--        q_printEglConfig(m_eglDisplay, m_eglConfig);
--    }
--
- #ifndef QT_NO_OPENGL
-     // Make the context current to ensure the GL version query works. This needs a surface too.
-     const EGLint pbufferAttributes[] = {
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
similarity index 79%
rename from recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
rename to recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 1f029a2..5b06b68 100644
--- a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 3d61189d1706d3367eada4e7db6f2c6c167130ce Mon Sep 17 00:00:00 2001
+From a1c780527273d348d9b59e084ceeec39fe8544ad Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 07/12] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 06/11] qeglplatformintegration: Undefine CursorShape from X.h
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -9,11 +9,11 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-index f665455..9eb783c 100644
+index 4d7adce..c9b6873 100644
 --- a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
 +++ b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-@@ -46,6 +46,12 @@
- #include <qpa/qplatformnativeinterface.h>
+@@ -50,6 +50,12 @@
+ #include <QtCore/QVariant>
  #include <EGL/egl.h>
  
 +// Undefine CursorShape from X.h, which is causing breakage in Qt::CursorShape in platformsupport/eglconvenience/
@@ -26,5 +26,5 @@ index f665455..9eb783c 100644
  
  class QEGLPlatformScreen;
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
similarity index 78%
rename from recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
rename to recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
index b1c4690..4669df1 100644
--- a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase-git/0007-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 107fe67947ced65315550e6a7795be24efaab371 Mon Sep 17 00:00:00 2001
+From dc8e9f9bab476ee75db1146b7f682c3e30cea943 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 08/12] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 07/11] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -12,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 48d5119..3c0347a 100755
+index dcd1790..fe6bed4 100755
 --- a/configure
 +++ b/configure
-@@ -3573,7 +3573,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3587,7 +3587,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
  
  /* Installation Info */
@@ -25,5 +25,5 @@ index 48d5119..3c0347a 100755
      "qt_prfxpath=$QT_SYSROOT_PREFIX",
      "qt_docspath=$QT_SYSROOT_DOCS",
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
similarity index 85%
rename from recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
rename to recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index cbd0bcd..80fd241 100644
--- a/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From b8f2fdcd7683058554b5d76b270c5f4bb3d0b91a Mon Sep 17 00:00:00 2001
+From b5d896a5849877572f6872c778b292a0cd2182ca Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 09/12] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 08/11] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -27,10 +27,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 15 insertions(+), 1 deletion(-)
 
 diff --git a/src/plugins/platforms/eglfs/qeglfswindow.cpp b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-index 2d36c0b..854531e 100644
+index c83b894..b937881 100644
 --- a/src/plugins/platforms/eglfs/qeglfswindow.cpp
 +++ b/src/plugins/platforms/eglfs/qeglfswindow.cpp
-@@ -74,6 +74,15 @@ void QEglFSWindow::create()
+@@ -66,6 +66,15 @@ void QEglFSWindow::create()
  
      m_flags = Created;
  
@@ -46,16 +46,16 @@ index 2d36c0b..854531e 100644
      if (window()->type() == Qt::Desktop)
          return;
  
-@@ -85,7 +94,7 @@ void QEglFSWindow::create()
-         if (isRaster() && screen->compositingWindow())
+@@ -79,7 +88,7 @@ void QEglFSWindow::create()
              return;
+         }
  
 -#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK)
 +#if !defined(Q_OS_ANDROID) || defined(Q_OS_ANDROID_NO_SDK) || defined(EGL_API_FB)
          // We can have either a single OpenGL window or multiple raster windows.
          // Other combinations cannot work.
          qFatal("EGLFS: OpenGL windows cannot be mixed with others.");
-@@ -105,6 +114,11 @@ void QEglFSWindow::create()
+@@ -99,6 +108,11 @@ void QEglFSWindow::create()
  
      resetSurface();
  
@@ -68,5 +68,5 @@ index 2d36c0b..854531e 100644
  
      if (isRaster()) {
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase-git/0011-QOpenGLPaintDevice-sub-area-support.patch
rename to recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
index 27496db..024c481 100644
--- a/recipes-qt/qt5/qtbase-git/0011-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase-git/0009-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From 606dc31c85d97dff52b07ec9c896718c6533f670 Mon Sep 17 00:00:00 2001
+From d07f08f4180c1963c734a1f976e2848aa6c5f292 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 11/11] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 09/11] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -20,10 +20,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  5 files changed, 23 insertions(+), 3 deletions(-)
 
 diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index 6750458..034630a 100644
+index 59bca6e..ea0ee88 100644
 --- a/src/gui/opengl/qopenglpaintdevice.cpp
 +++ b/src/gui/opengl/qopenglpaintdevice.cpp
-@@ -111,6 +111,7 @@ class QOpenGLPaintDevicePrivate
+@@ -103,6 +103,7 @@ class QOpenGLPaintDevicePrivate
  public:
      QOpenGLPaintDevicePrivate(const QSize &size);
  
@@ -31,7 +31,7 @@ index 6750458..034630a 100644
      QSize size;
      QOpenGLContext *ctx;
  
-@@ -159,6 +160,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
+@@ -151,6 +152,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
  {
  }
  
@@ -44,7 +44,7 @@ index 6750458..034630a 100644
  /*!
      Destroys the QOpenGLPaintDevice.
  */
-@@ -228,6 +235,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
+@@ -220,6 +227,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
      return d_ptr->ctx;
  }
  
@@ -57,10 +57,10 @@ index 6750458..034630a 100644
      Returns the pixel size of the paint device.
  
 diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index c05571c..01eb1bc 100644
+index e1be9b5..1a3ddbc 100644
 --- a/src/gui/opengl/qopenglpaintdevice.h
 +++ b/src/gui/opengl/qopenglpaintdevice.h
-@@ -62,12 +62,14 @@ public:
+@@ -54,12 +54,14 @@ public:
      QOpenGLPaintDevice();
      explicit QOpenGLPaintDevice(const QSize &size);
      QOpenGLPaintDevice(int width, int height);
@@ -76,10 +76,10 @@ index c05571c..01eb1bc 100644
      void setSize(const QSize &size);
      void setDevicePixelRatio(qreal devicePixelRatio);
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 81a0d82..ce57261 100644
+index 21bc4a9..ce008a4 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -1985,7 +1985,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -1999,7 +1999,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -90,7 +90,7 @@ index 81a0d82..ce57261 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2070,7 +2073,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2084,7 +2087,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
@@ -99,7 +99,7 @@ index 81a0d82..ce57261 100644
          d->needsSync = false;
          d->lastMaskTextureUsed = 0;
          d->shaderManager->setDirty();
-@@ -2113,6 +2116,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2127,6 +2130,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          funcs.glDisable(GL_SCISSOR_TEST);
      } else {
@@ -107,7 +107,7 @@ index 81a0d82..ce57261 100644
          funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2121,12 +2125,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2135,12 +2139,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
@@ -123,10 +123,10 @@ index 81a0d82..ce57261 100644
  
      funcs.glScissor(left, bottom, width, height);
 diff --git a/src/gui/opengl/qopenglpaintengine_p.h b/src/gui/opengl/qopenglpaintengine_p.h
-index 4f0e2e5..f211de1 100644
+index 5ef0366..c5b517d 100644
 --- a/src/gui/opengl/qopenglpaintengine_p.h
 +++ b/src/gui/opengl/qopenglpaintengine_p.h
-@@ -264,6 +264,7 @@ public:
+@@ -256,6 +256,7 @@ public:
      QOpenGL2PaintEngineEx* q;
      QOpenGLEngineShaderManager* shaderManager;
      QOpenGLPaintDevice* device;
@@ -135,10 +135,10 @@ index 4f0e2e5..f211de1 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index 0610ab6..ea1e3b2 100644
+index 6e16b2d..ddec9bb 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -316,7 +316,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+@@ -308,7 +308,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
      funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
@@ -148,5 +148,5 @@ index 0610ab6..ea1e3b2 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.0.2
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0010-Always-build-uic.patch
similarity index 77%
rename from recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase-git/0010-Always-build-uic.patch
index a1af18e..a28d2e4 100644
--- a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From 271db04ebfbaf67e2e8c30ff050510c5a42acfa4 Mon Sep 17 00:00:00 2001
+From e7345be82063524538573cbe3fed7b5280b49e3e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 11/12] Always build uic
+Subject: [PATCH 10/11] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 6a805a6..90623a6 100644
+index ab93641..a48606b 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -158,7 +158,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -161,7 +161,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
@@ -27,5 +27,5 @@ index 6a805a6..90623a6 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch b/recipes-qt/qt5/qtbase-git/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
deleted file mode 100644
index da05f28..0000000
--- a/recipes-qt/qt5/qtbase-git/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 8d8db9db8518289f4c1856dd3062c2e324c5c9be Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 4 Jun 2014 15:26:11 +0200
-Subject: [PATCH 10/12] Revert "Use the "gcc" feature in simd.prf"
-
-This reverts commit 3b00cc480400d47c59c29d3507c7fcdc9be2a489.
----
- mkspecs/features/simd.prf | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mkspecs/features/simd.prf b/mkspecs/features/simd.prf
-index 62a63f9..4f86f60 100644
---- a/mkspecs/features/simd.prf
-+++ b/mkspecs/features/simd.prf
-@@ -18,7 +18,7 @@ QT_CPU_FEATURES = $$eval(QT_CPU_FEATURES.$$QT_ARCH)
- #
- # Set up compilers for SIMD (SSE/AVX, NEON etc)
- #
--gcc {       # includes intel_icc and clang variants
-+*-g++*|intel_icc|*-clang*|*-qcc* {
-     sse2 {
-         HEADERS += $$SSE2_HEADERS
- 
--- 
-2.0.0
-
diff --git a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0010-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
rename to recipes-qt/qt5/qtbase-git/0010-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 820fb21..d098b98 100644
--- a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,7 +1,7 @@
-From ac507c953112630d7e929be35586e97396b76327 Mon Sep 17 00:00:00 2001
+From 846d20dc7d6f1c4815af77ac6a8217772781f1c7 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
+Subject: [PATCH 10/10] qmake: don't build it in configure, but allow to build
  it separately
 
 * it is already built in qtbase-native, so we don't need it in configure
@@ -20,10 +20,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 3c0347a..a75ca11 100755
+index fe6bed4..9628be2 100755
 --- a/configure
 +++ b/configure
-@@ -3675,7 +3675,7 @@ setBootstrapEvalVariable()
+@@ -3689,7 +3689,7 @@ setBootstrapEvalVariable()
  
  
  # build qmake
@@ -46,5 +46,5 @@ index 89d6ea5..7c605b9 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
similarity index 74%
rename from recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
rename to recipes-qt/qt5/qtbase-git/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
index 81b05f3..41d0988 100644
--- a/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,7 +1,7 @@
-From 11bd34bfe629767ec32a36593386ef0655e86f24 Mon Sep 17 00:00:00 2001
+From 7d8c74816849c8ed0cc8b7c111bbf361cbcc747e Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
+Subject: [PATCH 11/11] configure: preserve built qmake and swap with native
  one
 
 Let configure script build the real qmake, but right after it's built, swap
@@ -13,10 +13,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index 3c0347a..c51f785 100755
+index fe6bed4..ea661a3 100755
 --- a/configure
 +++ b/configure
-@@ -3825,6 +3825,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3839,6 +3839,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
  
      (cd "$outpath/qmake"; "$MAKE") || exit 2
  fi # Build qmake
@@ -26,5 +26,5 @@ index 3c0347a..c51f785 100755
  echo "Running configuration tests..."
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 9a9d3ca..e391cd6 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -12,17 +12,15 @@ SRC_URI += "\
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
     file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0011-Always-build-uic.patch \
+    file://0010-Always-build-uic.patch \
 "
 
 do_install_append() {
@@ -31,4 +29,4 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
+SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 65e92a0..34ab181 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -12,17 +12,15 @@ SRC_URI += "\
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch \
     file://0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch \
-    file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0008-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0006-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
+    file://0007-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0008-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0009-QOpenGLPaintDevice-sub-area-support.patch \
 "
  
 # specific for qtbase
 SRC_URI += "\
-    file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0010-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
-SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
+SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 7b81b2c..717cf63 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "5fe214b8db0c192ea5520e7fdb20f546b02af88b"
+SRCREV = "0f6e9cc18007c718de8ec399f5b60687ecffe9c2"
diff --git a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
new file mode 100644
index 0000000..78ef3e1
--- /dev/null
+++ b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
@@ -0,0 +1,88 @@
+From 3bab0b12be56ec7c85c5648a304aba98dc09ed60 Mon Sep 17 00:00:00 2001
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
+2.1.1
+
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 4611a2d..613eb13 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e6bf3d444f3818145d7807ad37b6a0ab9f8d4a47"
+SRCREV = "29b77e5e0759472ab1f7da1dd756b857d3b2ddd7"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index b7f2f79..2a6f3dc 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -1,4 +1,5 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "07885f25ed57b98a695f28337fc4b91e611991aa"
+QT_MODULE_BRANCH = "1.1"
+SRCREV = "2b93eb45116e0bf2cc62f614de66cfd261c552df"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index ef9cf50..747f4cb 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "82abf6975b6737259ee656564e5ec7f8ad1d0508"
+SRCREV = "bdd7e47ff1357bcc3b81c7ff5c10189c6a9b0290"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 16e12bb..62c0722 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "1c66c5786c35a7d841e0004757cff06da3f9a2cc"
+SRCREV = "08f40bc0f00716c3a8cbda70ed00dc2f16515e85"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 690cb46..09688f0 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "f90f40de7006c4204df6aa414776616dc6f47f57"
+SRCREV = "b90e043af09955d94a7a9555f11b5d6f3add4c3a"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 7cb29a6..3c63fba 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "26e713cddcc8a62e49ce7a3352d3b5f13ffd7d52"
+SRCREV = "af503cb8014c5b0fb2928ac1596a042d979a94a3"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 7f094b2..1d97e64 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "8deeceb12e68dd429ee53d6ef667f1ec79bce4de"
+SRCREV = "ebbf3629ae53755c3b5dd0912585a40545f391fc"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index a436915..8e28eaa 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "2b71f5f2ce41deb9baf91df2db9ec568e98814e8"
+SRCREV = "14710df8fa3b8c31cdbf0243d268a006e667e13a"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 97a70ae..d41c79a 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "87b569ccc4df161e33d41f7a5f1f25eced6f65c3"
+SRCREV = "4756a79d456d2fdd7aa1e5cb562a50165daf3d7f"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 945a8d4..7a88b75 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "19da18b96897c7d0b9dce2dd589d0135b397005e"
+SRCREV = "ef8ed357881b212e2debe2ccf975996bca2331c2"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 9420ff8..9ee0738 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "35a2f0880831d38c60d2b4820dac808f48f6f3a8"
+SRCREV = "bf249abee98727d517f52b1126dc7fda8af4e302"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index c264ab0..45f6b0e 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -1,6 +1,8 @@
 require qt5-git.inc
 require ${PN}.inc
 
+QT_MODULE_BRANCH = "stable"
+
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
 
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 9a31c13..c176b4e 100644
--- a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,7 +1,7 @@
-From 50fdb63c074138f783a448bc2db97b6f0ccfefea Mon Sep 17 00:00:00 2001
+From ba804f69b32dc9a3554d2901cd1897039be33553 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
-Subject: [PATCH 1/2] Allow to build only lrelease + lupdate + lconvert
+Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
 
 This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
 is built without GUI support (no-png is set) and we still want to build
@@ -9,25 +9,26 @@ native lrelease + lupdate + lconvert tools.
 
 Upstream-Status: Pending
 
-Signed-off-by: Martin Jansa <Martin.jansa@gmail.com>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- examples/examples.pro     |  4 ++--
+ examples/examples.pro     |  3 ++-
  src/designer/src/src.pro  | 16 +++++++++-------
  src/linguist/linguist.pro |  2 +-
  src/src.pro               | 14 ++++++++------
  tests/auto/auto.pro       | 24 +++++++++++++-----------
- 5 files changed, 33 insertions(+), 27 deletions(-)
+ 5 files changed, 33 insertions(+), 26 deletions(-)
 
 diff --git a/examples/examples.pro b/examples/examples.pro
-index 4955969..8e86419 100644
+index 69365d1..da7b38b 100644
 --- a/examples/examples.pro
 +++ b/examples/examples.pro
-@@ -1,3 +1,3 @@
+@@ -1,4 +1,5 @@
  TEMPLATE = subdirs
 -qtHaveModule(widgets): SUBDIRS += help designer linguist uitools assistant
--
 +!linguistonly:qtHaveModule(widgets): SUBDIRS += help designer assistant
 +qtHaveModule(widgets): SUBDIRS += linguist uitools
+ 
+ winrt: SUBDIRS -= assistant designer
 diff --git a/src/designer/src/src.pro b/src/designer/src/src.pro
 index e02ca8e..49527c5 100644
 --- a/src/designer/src/src.pro
@@ -74,7 +75,7 @@ index 3a70580..a977878 100644
  qtNomakeTools( \
      linguist \
 diff --git a/src/src.pro b/src/src.pro
-index a486d65..393eac2 100644
+index 722b32e..9453152 100644
 --- a/src/src.pro
 +++ b/src/src.pro
 @@ -4,10 +4,12 @@ qtHaveModule(widgets) {
@@ -82,7 +83,7 @@ index a486d65..393eac2 100644
          message("Some graphics-related tools are unavailable without PNG support")
      } else {
 -        SUBDIRS = assistant \
-+        !linguistonly { 
++        !linguistonly {
 +            SUBDIRS = assistant \
                    pixeltool \
 -                  qtestlib \
@@ -110,14 +111,14 @@ index a486d65..393eac2 100644
 +!linguistonly:qtHaveModule(dbus): SUBDIRS += qdbus
  
  win32|winrt:SUBDIRS += windeployqt
- winrt:SUBDIRS += winrtrunner qtd3dservice
+ winrt:SUBDIRS += winrtrunner
 -qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
 +!linguistonly:qtHaveModule(gui):!android:!ios:!qnx:!wince*:!winrt*:SUBDIRS += qtdiag
  
  qtNomakeTools( \
      pixeltool \
 diff --git a/tests/auto/auto.pro b/tests/auto/auto.pro
-index c3acfe3..b48e711 100644
+index df240e3..27ee687 100644
 --- a/tests/auto/auto.pro
 +++ b/tests/auto/auto.pro
 @@ -1,15 +1,17 @@
@@ -143,12 +144,12 @@ index c3acfe3..b48e711 100644
 +        qhelpindexmodel \
 +        qhelpprojectdata \
 +        cmake \
-+        installed_cmake \
++        installed_cmake
 +        qtdiag
 +}
  
  installed_cmake.depends = cmake
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index eaf4694..1385791 100644
--- a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,7 +1,7 @@
-From f375385c4795e3cd7df7aca2a4c769597164aaa8 Mon Sep 17 00:00:00 2001
+From ac277dcb43d53ce6d87c58f4afef295fe44a49ea Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
-Subject: [PATCH 2/2] assistant/help: fix linking of dependent libraries
+Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
index fa3ac1a..ba96f5a 100644
--- a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 6bb257d69ba7ac93b2b11aae35e0a523785d94ad Mon Sep 17 00:00:00 2001
+From b50a6739b3d38f06901e7812864e3f7122f3d0c8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.0.4
+2.1.1
 
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index bf06b08..40782b5 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "aa35d132010f4410d72e30d03e3dd713c7a2241d"
+SRCREV = "a1ca5b48fafc536b619617f8fa6a3e4798283812"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index bf06b08..40782b5 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "aa35d132010f4410d72e30d03e3dd713c7a2241d"
+SRCREV = "a1ca5b48fafc536b619617f8fa6a3e4798283812"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 82750e7..7e2d028 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,11 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-# qtwayland wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
-# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
-
-SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
-QT_MODULE_BRANCH = "5.4"
+SRCREV = "5f718c7d04d44c3878018e8070b18cf0e7486eb0"
 
 # wayland-scanner and qtwaylandscanner must be in same path to work properly
 do_install_append() {
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 0bbb5ab..d126537 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,11 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-# qtwayland wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
-# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
-
-SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
-QT_MODULE_BRANCH = "5.4"
+SRCREV = "5f718c7d04d44c3878018e8070b18cf0e7486eb0"
 
 SRC_URI += " \
     file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index f0ceb5d..27dd7ee 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "bce5056b9e16a943357e362455a46685d3f22093"
+SRCREV = "70bd4d5253f134bf48a30544030bb832f1eba8b3"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 30f2f7a..4124127 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "db1ec4efadf930cd8088286605128ae1d01d23e8"
+SRCREV = "3a51e3ee766490fe6f9ab9511d19e16f75e07db8"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index ff13986..0631f56 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "eb16b1970293dfeb5918751afbdf1fb7f62028e1"
+SRCREV = "f6175568bb32b87a3d6cd55382fa1c8e1a1de2b4"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index fdb8094..6867e04 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "2d84caf5ef1b5dace0d678df4581db3c955be6ee"
+SRCREV = "a21bbb45019e1bbc7b583811ff2e84757082a01a"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 5d63a6b..a21ab79 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e13d30be68228ccda3b6310ac44a84981b17f03b"
+SRCREV = "eef0ba60200d8039c05073ce707c2352ac0944a8"
-- 
2.1.1


