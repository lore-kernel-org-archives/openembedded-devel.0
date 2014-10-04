Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id E1DAA71547
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Oct 2014 02:25:10 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id fb4so389393wid.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Oct 2014 19:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=FLQPGpkJRenVRK2mtvqrcVwGnCCDVL7+UpYcjYK3vr0=;
	b=W/bnsOj6sEe21lPjFQkYtjSD2Pe4Q3NE8v03EmL1wzatYSOEbUnSIqDngq4iLRGh3v
	L1xoi9Q0WihbrnPKk802kezC0GSMMFJ/scsaLi6jRsxIjo1D4v2MwTcku1wn8mF3qzNl
	0k7hDG0hIlKA6NF4vK+WMUHSbqcQmFyL8atsNeffLHC9VPu7xgjN/DbwLeU86jGMSQ4D
	j+dvLYuaQVbbCp53X0zc5/jQVAcCoubY6g5ydRYIIC+zcu/bB+LBqCK3ywuNvVZXLRW0
	cyr83qPYd5B5B5Cfwpm/tyjh0gzhfuG9g76Ffh6TeTd3YRS5jHNNkMk9tUTTzDMcCUy0
	UvtA==
X-Received: by 10.194.77.195 with SMTP id u3mr494251wjw.115.1412389511625;
	Fri, 03 Oct 2014 19:25:11 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u10sm958466wix.8.2014.10.03.19.25.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Oct 2014 19:25:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  4 Oct 2014 04:25:58 +0200
Message-Id: <1412389558-13237-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
References: <1412389558-13237-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [meta-qt5][PATCH 7/7] qt5: upgrade git recipes to 5.4-alpha1
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
X-List-Received-Date: Sat, 04 Oct 2014 02:25:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* introduce 2nd set of qtwayland and qtwebengine recipes, because newer
  revision isn't compatible with 5.3.2 release

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/distro/include/qt5-versions.inc               |    6 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |   11 +-
 recipes-qt/qt5/nativesdk-qttools_git.bb            |    7 +-
 recipes-qt/qt5/qt5-git.inc                         |    4 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  |   26 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   10 +-
 .../0003-Add-external-hostbindir-option.patch      |   44 +-
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |   10 +-
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |   10 +-
 ...lfs-Print-the-chosen-config-in-debug-mode.patch |   90 +-
 ...mintegration-Undefine-CursorShape-from-X..patch |   12 +-
 ...ump-path-length-from-256-to-512-character.patch |   10 +-
 ...gl-error-for-platforms-only-supporting-on.patch |   16 +-
 ...0010-QOpenGLPaintDevice-sub-area-support.patch} |   36 +-
 ...10-Revert-Use-the-gcc-feature-in-simd.prf.patch |   26 -
 .../qt5/qtbase-git/0011-Always-build-uic.patch     |    8 +-
 ...-build-it-in-configure-but-allow-to-build.patch |    8 +-
 ...reserve-built-qmake-and-swap-with-native-.patch |    8 +-
 recipes-qt/qt5/qtbase-native_git.bb                |   11 +-
 recipes-qt/qt5/qtbase_git.bb                       |   11 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |    8 +-
 .../0001-qmltestexample-fix-link.patch             |   88 +
 recipes-qt/qt5/qtdeclarative_git.bb                |    8 +-
 recipes-qt/qt5/qtenginio_git.bb                    |    7 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |    8 +-
 recipes-qt/qt5/qtimageformats_git.bb               |    8 +-
 recipes-qt/qt5/qtlocation_git.bb                   |    8 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 2369 ++++++++++++++++++++
 ...a.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch |   53 +
 recipes-qt/qt5/qtmultimedia_git.bb                 |    8 +-
 recipes-qt/qt5/qtquick1_git.bb                     |    8 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |    8 +-
 recipes-qt/qt5/qtscript_git.bb                     |    8 +-
 recipes-qt/qt5/qtsensors_git.bb                    |    8 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   10 +-
 recipes-qt/qt5/qtsvg_git.bb                        |    8 +-
 recipes-qt/qt5/qtsystems_git.bb                    |    2 +
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |   29 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |    6 +-
 .../0003-add-noqtwebkit-configuration.patch        |    4 +-
 recipes-qt/qt5/qttools-native_git.bb               |    7 +-
 recipes-qt/qt5/qttools_git.bb                      |    7 +-
 recipes-qt/qt5/qtwayland-native_5.3.2+git.bb       |    9 +
 recipes-qt/qt5/qtwayland-native_git.bb             |    6 +-
 recipes-qt/qt5/qtwayland.inc                       |    2 +
 recipes-qt/qt5/qtwayland_5.3.2+git.bb              |   21 +
 recipes-qt/qt5/qtwayland_git.bb                    |    8 +-
 recipes-qt/qt5/qtwebengine.inc                     |    8 +-
 ...upplied-by-environment-variable-NINJA_PAT.patch |    4 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |    4 +-
 ...0003-functions.prf-Try-to-add-_moc-suffix.patch |    4 +-
 recipes-qt/qt5/qtwebengine_5.3.2+git.bb            |   28 +
 recipes-qt/qt5/qtwebengine_git.bb                  |    7 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |    2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |   30 +
 recipes-qt/qt5/qtwebkit_git.bb                     |    4 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |    2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |    2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |    8 +-
 59 files changed, 2966 insertions(+), 217 deletions(-)
 rename recipes-qt/qt5/qtbase-git/{0011-QOpenGLPaintDevice-sub-area-support.patch => 0010-QOpenGLPaintDevice-sub-area-support.patch} (84%)
 delete mode 100644 recipes-qt/qt5/qtbase-git/0010-Revert-Use-the-gcc-feature-in-simd.prf.patch
 create mode 100644 recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
 create mode 100644 recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
 create mode 100644 recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
 create mode 100644 recipes-qt/qt5/qtwayland-native_5.3.2+git.bb
 create mode 100644 recipes-qt/qt5/qtwayland_5.3.2+git.bb
 create mode 100644 recipes-qt/qt5/qtwebengine_5.3.2+git.bb
 create mode 100644 recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch

diff --git a/conf/distro/include/qt5-versions.inc b/conf/distro/include/qt5-versions.inc
index ff2eae7..7530a24 100644
--- a/conf/distro/include/qt5-versions.inc
+++ b/conf/distro/include/qt5-versions.inc
@@ -1,5 +1,5 @@
 # Select which version you prefer by defining QT5_VERSION and including this file
-# possible values now "5.3.2", "5.3.0+git%"
+# possible values now "5.3.2", "5.3.0+5.4.0-alpha1+git"
 
 QT5_VERSION ?= "5.3.2"
 
@@ -7,6 +7,7 @@ PREFERRED_VERSION_qtbase-native = "${QT5_VERSION}"
 PREFERRED_VERSION_qtbase = "${QT5_VERSION}"
 PREFERRED_VERSION_nativesdk-qtbase = "${QT5_VERSION}"
 PREFERRED_VERSION_qtdeclarative = "${QT5_VERSION}"
+PREFERRED_VERSION_qtconnectivity = "${QT5_VERSION}"
 PREFERRED_VERSION_qtenginio = "${QT5_VERSION}"
 PREFERRED_VERSION_qtjsbackend = "${QT5_VERSION}"
 PREFERRED_VERSION_qtjsbackend-native = "${QT5_VERSION}"
@@ -23,6 +24,9 @@ PREFERRED_VERSION_qtsvg = "${QT5_VERSION}"
 PREFERRED_VERSION_qttools = "${QT5_VERSION}"
 PREFERRED_VERSION_qttools-native = "${QT5_VERSION}"
 PREFERRED_VERSION_nativesdk-qttools = "${QT5_VERSION}"
+PREFERRED_VERSION_qtwayland = "${QT5_VERSION}"
+PREFERRED_VERSION_qtwayland-native = "${QT5_VERSION}"
+PREFERRED_VERSION_qtwebengine = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebkit = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebkit-examples = "${QT5_VERSION}"
 PREFERRED_VERSION_qtwebsockets = "${QT5_VERSION}"
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4b91539..6de07e0 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -19,8 +19,7 @@ SRC_URI += "\
     file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
@@ -33,4 +32,10 @@ SRC_URI += " \
     file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
-SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
+SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
+
+LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index 3d8dfeb..b3169bc 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -4,4 +4,9 @@ require ${PN}.inc
 # prepend this again, because ${PN}.inc prepneds ${PN}
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
-SRCREV = "aa35d132010f4410d72e30d03e3dd713c7a2241d"
+SRCREV = "a1ca5b48fafc536b619617f8fa6a3e4798283812"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 3e714e0..36fbaf8 100644
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
+PV = "5.3.99+5.4.0-alpha1+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index eca6b36..60a2339 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 9c7d71880c6ec5b07e3030b7c7a23e004d5c60a2 Mon Sep 17 00:00:00 2001
+From 7a573e702d37f3e83b92f6b07345aaab05261e7b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/12] Add linux-oe-g++ platform
+Subject: [PATCH 01/11] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -51,10 +51,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
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
@@ -175,7 +175,7 @@ index d5c2b08..4eae0d3 100755
          if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index fe41c54..e2db923 100644
+index 05e10c9..213eeb8 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
 @@ -60,12 +60,12 @@ defineTest(qtCompileTest) {
@@ -187,7 +187,7 @@ index fe41c54..e2db923 100644
  
      mkpath($$test_out_dir)|error("Aborting.")
  
-     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) $$qmake_configs $$shell_quote($$test_dir)") {
+     qtRunLoggedCommand("$$test_cmd_base $$system_quote($$system_path($$QMAKE_QMAKE)) -spec $$QMAKESPEC $$qmake_configs $$shell_quote($$test_dir)") {
 -        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE") {
 +        qtRunLoggedCommand("$$test_cmd_base $$QMAKE_MAKE $$(QMAKE_MAKE_ARGS)") {
              log("yes$$escape_expand(\\n)")
@@ -346,5 +346,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 29f788e..06331aa 100644
--- a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
-From ad884ab378939e685a3b00af03bb6875d9bdc1d5 Mon Sep 17 00:00:00 2001
+From e521cd2d84acad69fb3d57a5e97073898d03fbf0 Mon Sep 17 00:00:00 2001
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
index 2abea8f..88bb484 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From b544f5f3462e2981ada045a32038b7f116f8590c Mon Sep 17 00:00:00 2001
+From 735d4f58381452854ed7b0c2f762030d747098e1 Mon Sep 17 00:00:00 2001
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
index 78fb3c6..b7e515a 100644
--- a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
-From 8a14a69d5b0078554ed002e682c72e995b1e6320 Mon Sep 17 00:00:00 2001
+From 73d7d25b8a424eecef197de60a3a504e163f0816 Mon Sep 17 00:00:00 2001
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
index 182de79..d1ec16c 100644
--- a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From 1e87c127c5d268870c51894c955bf24cde83ff69 Mon Sep 17 00:00:00 2001
+From fcbe3eefa24348cbf98ca9fc9e137ac6ccaf1f87 Mon Sep 17 00:00:00 2001
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
index 0e3bc99..1324802 100644
--- a/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,19 +1,57 @@
-From ca212fd10a95b2c694f3c89c3f22a2b0ae185198 Mon Sep 17 00:00:00 2001
+From 285b31f709a81b7e51b5c3d96061fa731cdfdf7d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
-Subject: [PATCH 06/12] Revert "eglfs: Print the chosen config in debug mode"
+Subject: [PATCH 06/11] Revert "eglfs: Print the chosen config in debug mode"
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
 
 This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
+
+Change-Id: I7a6a926b7525d4f137824c71f2ec8cd089c21f13
 ---
- src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
- src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
- 2 files changed, 3 insertions(+), 8 deletions(-)
+ src/platformsupport/eglconvenience/qeglconvenience.cpp         | 4 +++-
+ src/platformsupport/eglconvenience/qeglplatformcontext.cpp     | 7 -------
+ src/platformsupport/eglconvenience/qeglplatformintegration.cpp | 4 ++--
+ 3 files changed, 5 insertions(+), 10 deletions(-)
 
 diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index 5eed470..39c7c1f 100644
+index b7ce6df..e8c1925 100644
 --- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
 +++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-@@ -451,9 +451,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
+@@ -443,9 +443,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
      for (index = 0; attrs[index].attr != -1; ++index) {
          EGLint value;
          if (eglGetConfigAttrib(display, config, attrs[index].attr, &value)) {
@@ -27,18 +65,18 @@ index 5eed470..39c7c1f 100644
  
  #ifdef Q_OS_LINUX
 diff --git a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-index eec6463..4a7c69b 100644
+index 7cc3300..ccbd974 100644
 --- a/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
 +++ b/src/platformsupport/eglconvenience/qeglplatformcontext.cpp
-@@ -44,7 +44,6 @@
- #include "qeglpbuffer_p.h"
+@@ -37,7 +37,6 @@
  #include <qpa/qplatformwindow.h>
  #include <QOpenGLContext>
+ #include <QtPlatformHeaders/QEGLNativeContext>
 -#include <QDebug>
  
  QT_BEGIN_NAMESPACE
  
-@@ -192,12 +191,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
+@@ -181,12 +180,6 @@ void QEGLPlatformContext::init(const QSurfaceFormat &format, QPlatformOpenGLCont
          return;
      }
  
@@ -48,9 +86,31 @@ index eec6463..4a7c69b 100644
 -        q_printEglConfig(m_eglDisplay, m_eglConfig);
 -    }
 -
- #ifndef QT_NO_OPENGL
-     // Make the context current to ensure the GL version query works. This needs a surface too.
-     const EGLint pbufferAttributes[] = {
+     updateFormatFromGL();
+ }
+ 
+diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration.cpp b/src/platformsupport/eglconvenience/qeglplatformintegration.cpp
+index b8205dc..6005684 100644
+--- a/src/platformsupport/eglconvenience/qeglplatformintegration.cpp
++++ b/src/platformsupport/eglconvenience/qeglplatformintegration.cpp
+@@ -193,7 +193,7 @@ enum ResourceType {
+     EglContext,
+     EglConfig,
+     NativeDisplay,
+-    Display
++    XDisplay
+ };
+ 
+ static int resourceType(const QByteArray &key)
+@@ -236,7 +236,7 @@ void *QEGLPlatformIntegration::nativeResourceForScreen(const QByteArray &resourc
+     void *result = 0;
+ 
+     switch (resourceType(resource)) {
+-    case Display:
++    case XDisplay:
+         // Play nice when using the x11 hooks: Be compatible with xcb that allows querying
+         // the X Display pointer, which is nothing but our native display.
+         result = reinterpret_cast<void*>(nativeDisplay());
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 1f029a2..8f46910 100644
--- a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,7 +1,7 @@
-From 3d61189d1706d3367eada4e7db6f2c6c167130ce Mon Sep 17 00:00:00 2001
+From 9563ef306503f2503a09aadce63020b3048a185d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 07/12] qeglplatformintegration: Undefine CursorShape from X.h
+Subject: [PATCH 07/11] qeglplatformintegration: Undefine CursorShape from X.h
 
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
 
diff --git a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
index b1c4690..afe9b74 100644
--- a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 107fe67947ced65315550e6a7795be24efaab371 Mon Sep 17 00:00:00 2001
+From 33d46bd0229ff9635c14724231eb95f556afd5c2 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
-Subject: [PATCH 08/12] configure: bump path length from 256 to 512 characters
+Subject: [PATCH 08/11] configure: bump path length from 256 to 512 characters
 
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
 
diff --git a/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index cbd0bcd..de3e2d6 100644
--- a/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
-From b8f2fdcd7683058554b5d76b270c5f4bb3d0b91a Mon Sep 17 00:00:00 2001
+From 5d088522706a3533800e51c011c93d3d2ea58a4d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 09/12] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 09/11] eglfs: fix egl error for platforms only supporting one
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
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
similarity index 84%
rename from recipes-qt/qt5/qtbase-git/0011-QOpenGLPaintDevice-sub-area-support.patch
rename to recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
index 27496db..db979bd 100644
--- a/recipes-qt/qt5/qtbase-git/0011-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From 606dc31c85d97dff52b07ec9c896718c6533f670 Mon Sep 17 00:00:00 2001
+From 709c35b889e46f2b1bc36d88c732f1b440e6c236 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 11/11] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 10/11] QOpenGLPaintDevice sub-area support
 
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
diff --git a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
index a1af18e..9bd001b 100644
--- a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 271db04ebfbaf67e2e8c30ff050510c5a42acfa4 Mon Sep 17 00:00:00 2001
+From 2dd5a897d7e2f073b4223595a7bf214d3481b68a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 11/12] Always build uic
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
 
diff --git a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 820fb21..e39693f 100644
--- a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,4 +1,4 @@
-From ac507c953112630d7e929be35586e97396b76327 Mon Sep 17 00:00:00 2001
+From 5d6e6b18d2049bad370c594e5ab30fd85c0ed047 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
 Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
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
 
diff --git a/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
index 81b05f3..c994120 100644
--- a/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,4 +1,4 @@
-From 11bd34bfe629767ec32a36593386ef0655e86f24 Mon Sep 17 00:00:00 2001
+From f1b4d7d4c96b6ded9bd312f6db2ba735feb001c0 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
 Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
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
index 9a9d3ca..d902b18 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -16,8 +16,7 @@ SRC_URI += "\
     file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
@@ -31,4 +30,10 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
+SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
+
+LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 65e92a0..2e938c9 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -16,8 +16,7 @@ SRC_URI += "\
     file://0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
     file://0008-configure-bump-path-length-from-256-to-512-character.patch \
     file://0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
-    file://0010-Revert-Use-the-gcc-feature-in-simd.prf.patch \
-    file://0011-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0010-QOpenGLPaintDevice-sub-area-support.patch \
 "
  
 # specific for qtbase
@@ -25,4 +24,10 @@ SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
-SRCREV = "7a4dcbaabf037a6913a5662ebb74cc47e04673b9"
+SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
+
+LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 7b81b2c..195b267 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "5fe214b8db0c192ea5520e7fdb20f546b02af88b"
+SRCREV = "0f6e9cc18007c718de8ec399f5b60687ecffe9c2"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
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
index 4611a2d..5957c45 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e6bf3d444f3818145d7807ad37b6a0ab9f8d4a47"
+SRCREV = "29b77e5e0759472ab1f7da1dd756b857d3b2ddd7"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index b7f2f79..ff3c1c4 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -1,4 +1,9 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "07885f25ed57b98a695f28337fc4b91e611991aa"
+QT_MODULE_BRANCH = "1.1"
+SRCREV = "2b93eb45116e0bf2cc62f614de66cfd261c552df"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index ef9cf50..95aac63 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "82abf6975b6737259ee656564e5ec7f8ad1d0508"
+SRCREV = "bdd7e47ff1357bcc3b81c7ff5c10189c6a9b0290"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 16e12bb..4f15caa 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "1c66c5786c35a7d841e0004757cff06da3f9a2cc"
+SRCREV = "08f40bc0f00716c3a8cbda70ed00dc2f16515e85"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 690cb46..38980b1 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "f90f40de7006c4204df6aa414776616dc6f47f57"
+SRCREV = "b90e043af09955d94a7a9555f11b5d6f3add4c3a"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
new file mode 100644
index 0000000..3960131
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -0,0 +1,2369 @@
+From 4f9e752e6ecd4e2058f5d4f43578e5b21b6efbf8 Mon Sep 17 00:00:00 2001
+From: Yoann Lopes <yoann.lopes@digia.com>
+Date: Thu, 31 Oct 2013 15:06:30 +0100
+Subject: [PATCH 1/2] Initial porting effort to GStreamer 1.0.
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
+ src/gsttools/qvideosurfacegstsink.cpp              | 138 +++++++++++++-
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
+ 36 files changed, 872 insertions(+), 130 deletions(-)
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
+index 3cec526..109dd81 100644
+--- a/qtmultimedia.pro
++++ b/qtmultimedia.pro
+@@ -17,11 +17,26 @@ win32 {
+ } else {
+     qtCompileTest(alsa)
+     qtCompileTest(pulseaudio)
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
+index 148366b..cf9be45 100644
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
+index aa2e2a3..14c1f04 100644
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
+@@ -169,9 +174,13 @@ bool QGstreamerVideoWidgetControl::processSyncMessage(const QGstreamerMessage &m
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
+@@ -199,18 +208,29 @@ bool QGstreamerVideoWidgetControl::processBusMessage(const QGstreamerMessage &me
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
+@@ -225,8 +245,13 @@ void QGstreamerVideoWidgetControl::updateNativeVideoSize()
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
+index 8d484aa..b0e377b 100644
+--- a/src/gsttools/qgstutils.cpp
++++ b/src/gsttools/qgstutils.cpp
+@@ -89,8 +89,13 @@ static void addTagToMap(const GstTagList *list,
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
+@@ -254,6 +259,24 @@ QAudioFormat QGstUtils::audioFormatForCaps(const GstCaps *caps)
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
+@@ -269,7 +292,7 @@ QAudioFormat QGstUtils::audioFormatForBuffer(GstBuffer *buffer)
+     gst_caps_unref(caps);
+     return format;
+ }
+-
++#endif
+ 
+ /*!
+   Builds GstCaps for an audio format.
+@@ -564,7 +587,7 @@ int QGstUtils::cameraOrientation(const QString &device, GstElementFactory * fact
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
+index f3e2d88..a964e82 100644
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
+-                    "format"   , GST_TYPE_FOURCC, qt_yuvColorLookup[index].fourcc,
++#if GST_CHECK_VERSION(1,0,0)
++                    "format"   , G_TYPE_STRING, gst_video_format_to_string(qt_yuvColorLookup[index].vfmt),
++#else
++                    "format"   , G_TYPE_STRING, qt_yuvColorLookup[index].fourcc,
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
+index 48434b2..96c23cb 100644
+--- a/src/multimedia/gsttools_headers/qgstutils_p.h
++++ b/src/multimedia/gsttools_headers/qgstutils_p.h
+@@ -72,7 +72,11 @@ namespace QGstUtils {
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
+index 850f8c1..f4e2383 100644
+--- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
++++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
+@@ -724,7 +724,11 @@ qint64 CameraBinSession::duration() const
+     GstFormat   format = GST_FORMAT_TIME;
+     gint64      duration = 0;
+ 
++#if GST_CHECK_VERSION(1,0,0)
++    if ( m_camerabin && gst_element_query_duration(m_camerabin, format, &duration))
++#else
+     if ( m_camerabin && gst_element_query_position(m_camerabin, &format, &duration))
++#endif
+         return duration / 1000000;
+     else
+         return 0;
+@@ -757,8 +761,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
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
+@@ -819,7 +828,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
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
+@@ -829,7 +842,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
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
+@@ -1102,7 +1119,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
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
+@@ -1222,7 +1243,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
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
+index ce267d7..062de07 100644
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
+2.1.1
+
diff --git a/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch b/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
new file mode 100644
index 0000000..1f82d49
--- /dev/null
+++ b/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
@@ -0,0 +1,53 @@
+From ee12423779327f2cbb46ada326fa0a997c93a93d Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 5 Jul 2014 09:10:02 +0200
+Subject: [PATCH 2/2] qtmultimedia.pro: Respect
+ OE_GSTREAMER_ENABLED,OE_GSTREAMER010_ENABLED and OE_OPENAL_ENABLED
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ qtmultimedia.pro | 21 ++++++++++++---------
+ 1 file changed, 12 insertions(+), 9 deletions(-)
+
+diff --git a/qtmultimedia.pro b/qtmultimedia.pro
+index 109dd81..54b67a8 100644
+--- a/qtmultimedia.pro
++++ b/qtmultimedia.pro
+@@ -1,7 +1,7 @@
+ requires(qtHaveModule(gui))
+ 
+ load(configure)
+-qtCompileTest(openal)
++OE_OPENAL_ENABLED:qtCompileTest(openal)
+ win32 {
+     qtCompileTest(directshow) {
+         qtCompileTest(wshellitem)
+@@ -18,14 +18,17 @@ win32 {
+     qtCompileTest(alsa)
+     qtCompileTest(pulseaudio)
+     !done_config_gstreamer {
+-        gstver=1.0
+-        cache(GST_VERSION, set, gstver);
+-        qtCompileTest(gstreamer) {
+-            qtCompileTest(gstreamer_photography)
+-            qtCompileTest(gstreamer_encodingprofiles)
+-            qtCompileTest(gstreamer_appsrc)
+-            qtCompileTest(linux_v4l)
+-        } else {
++        OE_GSTREAMER_ENABLED {
++            gstver=1.0
++            cache(GST_VERSION, set, gstver);
++            qtCompileTest(gstreamer) {
++                qtCompileTest(gstreamer_photography)
++                qtCompileTest(gstreamer_encodingprofiles)
++                qtCompileTest(gstreamer_appsrc)
++                qtCompileTest(linux_v4l)
++            }
++        }
++        !OE_GSTREAMER_ENABLED:OE_GSTREAMER010_ENABLED {
+             gstver=0.10
+             cache(GST_VERSION, set, gstver);
+             # Force a re-run of the test
+-- 
+2.1.1
+
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 120ae1d..48cab35 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "b99a4b3025f08df8f33efb02897397ae5e404acf"
+SRCREV = "f02d9e934322fbf9af8a5503c1bda37552988b2b"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 7cb29a6..873c359 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "26e713cddcc8a62e49ce7a3352d3b5f13ffd7d52"
+SRCREV = "af503cb8014c5b0fb2928ac1596a042d979a94a3"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 7f094b2..77b499a 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "8deeceb12e68dd429ee53d6ef667f1ec79bce4de"
+SRCREV = "ebbf3629ae53755c3b5dd0912585a40545f391fc"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index a436915..029c107 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "2b71f5f2ce41deb9baf91df2db9ec568e98814e8"
+SRCREV = "14710df8fa3b8c31cdbf0243d268a006e667e13a"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 97a70ae..6e2a36a 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "87b569ccc4df161e33d41f7a5f1f25eced6f65c3"
+SRCREV = "4756a79d456d2fdd7aa1e5cb562a50165daf3d7f"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 945a8d4..6d2ab1c 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,4 +1,12 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "19da18b96897c7d0b9dce2dd589d0135b397005e"
+SRCREV = "ef8ed357881b212e2debe2ccf975996bca2331c2"
+
+# text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
+# other qt* components use :/
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=eb6c371255e1262c55ae9b652a90b528 \
+                    file://LICENSE.FDL;md5=3801d7932fdc07fd9efe89f9854a6caa"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 9420ff8..118a099 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "35a2f0880831d38c60d2b4820dac808f48f6f3a8"
+SRCREV = "bf249abee98727d517f52b1126dc7fda8af4e302"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
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
index bf06b08..db3e540 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,4 +1,9 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "aa35d132010f4410d72e30d03e3dd713c7a2241d"
+SRCREV = "a1ca5b48fafc536b619617f8fa6a3e4798283812"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index bf06b08..db3e540 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,4 +1,9 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "aa35d132010f4410d72e30d03e3dd713c7a2241d"
+SRCREV = "a1ca5b48fafc536b619617f8fa6a3e4798283812"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
diff --git a/recipes-qt/qt5/qtwayland-native_5.3.2+git.bb b/recipes-qt/qt5/qtwayland-native_5.3.2+git.bb
new file mode 100644
index 0000000..e780810
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland-native_5.3.2+git.bb
@@ -0,0 +1,9 @@
+require qt5-git.inc
+require ${PN}.inc
+
+SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
+
+# this wasn't released, the PV is set just to signify that this SRCREV was tested together
+# with 5.3.2 version of other modules
+PV = "5.3.2"
+DEFAULT_PREFERENCE = "1"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 761cfb6..7934955 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,8 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-# qtwayland wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
-# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.2.1
-
-SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
-QT_MODULE_BRANCH = "5.4"
+SRCREV = "5f718c7d04d44c3878018e8070b18cf0e7486eb0"
diff --git a/recipes-qt/qt5/qtwayland.inc b/recipes-qt/qt5/qtwayland.inc
index bb52f0d..dc6be23 100644
--- a/recipes-qt/qt5/qtwayland.inc
+++ b/recipes-qt/qt5/qtwayland.inc
@@ -7,6 +7,8 @@ require qt5.inc
 XKB_DEPENDS = "libxkbcommon xproto"
 DEPENDS += "qtbase qtdeclarative wayland wayland-native qtwayland-native ${XKB_DEPENDS}"
 
+EXTRA_QMAKEVARS_POST += "CONFIG-=create_cmake"
+
 QT_WAYLAND_CONFIG ?= "wayland-compositor"
 QT_WAYLAND_DEFINES ?= ""
 QT_WAYLAND_BUILD_PARTS ?= "examples"
diff --git a/recipes-qt/qt5/qtwayland_5.3.2+git.bb b/recipes-qt/qt5/qtwayland_5.3.2+git.bb
new file mode 100644
index 0000000..bfbeab1
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland_5.3.2+git.bb
@@ -0,0 +1,21 @@
+require qt5-git.inc
+require ${PN}.inc
+
+SRCREV = "98dca3b54f52f08117c1e0d3a1b4826ed12ef23f"
+
+SRC_URI += " \
+    file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
+"
+
+# this wasn't released, the PV is set just to signify that this SRCREV was tested together
+# with 5.3.2 version of other modules
+PV = "5.3.2"
+DEFAULT_PREFERENCE = "1"
+
+QT_VERSION ?= "5.3.0"
+
+do_install_append() {
+    # do install files created by qtwaylandscanner
+    install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/qwayland-server-*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
+    install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
+}
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 0bbb5ab..62a718e 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,17 +1,13 @@
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
 "
 
-QT_VERSION ?= "5.3.0"
+QT_VERSION ?= "5.4.0"
 
 do_install_append() {
     # do install files created by qtwaylandscanner
diff --git a/recipes-qt/qt5/qtwebengine.inc b/recipes-qt/qt5/qtwebengine.inc
index 060faa7..397be70 100644
--- a/recipes-qt/qt5/qtwebengine.inc
+++ b/recipes-qt/qt5/qtwebengine.inc
@@ -23,6 +23,9 @@ S = "${WORKDIR}/git"
 SEPB = "${S}"
 B = "${SEPB}"
 
+# Project ERROR: Missing CMake tests. Either create tests in tests/auto/cmake, or disable cmake config file creation with CONFIG-=create_cmake.
+EXTRA_QMAKEVARS_POST += "CONFIG-=create_cmake"
+
 do_configure() {
     # replace LD with CXX, to workaround a possible gyp inheritssue?
     LD="${CXX}" export LD
@@ -33,12 +36,13 @@ do_configure() {
 
     # qmake can't find the OE_QMAKE_* variables on it's own so directly passing them as
     # arguments here
-    ${OE_QMAKE_QMAKE} -r QTWEBENGINE_ROOT="${S}" NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja" \
+    ${OE_QMAKE_QMAKE} -r ${EXTRA_QMAKEVARS_PRE} QTWEBENGINE_ROOT="${S}" NINJA_PATH="${STAGING_BINDIR_NATIVE}/ninja" \
         QMAKE_CXX="${OE_QMAKE_CXX}" QMAKE_CC="${OE_QMAKE_CC}" \
         QMAKE_LINK="${OE_QMAKE_LINK}" \
         QMAKE_CFLAGS="${OE_QMAKE_CFLAGS}" \
         QMAKE_CXXFLAGS="${OE_QMAKE_CXXFLAGS}" \
-        QMAKE_AR="${OE_QMAKE_AR}"
+        QMAKE_AR="${OE_QMAKE_AR}" \
+        -after ${EXTRA_QMAKEVARS_POST}
 }
 
 do_install_append() {
diff --git a/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch b/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
index 397929f..bd4e867 100644
--- a/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch
@@ -1,4 +1,4 @@
-From daf8cd1ccd533d5546ff3a11d19710e0f155cc68 Mon Sep 17 00:00:00 2001
+From c2defbfe5946a6c483e3f9df37fb16bdffeffc31 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 20 Jun 2014 09:09:12 +0200
 Subject: [PATCH 1/3] Use ninja supplied by environment variable NINJA_PATH
@@ -32,5 +32,5 @@ index 4dcd8ed..8725fd2 100644
 +    return($$NINJA_PATH)
  }
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index d9b75eb..b5fc71d 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From fd954d63f62c551c5aeaab662b7ab42a3f2ab527 Mon Sep 17 00:00:00 2001
+From 32f3b53d0b5861ac3e277552b04a579d8bd16558 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH 2/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -25,5 +25,5 @@ index 8725fd2..15c2941 100644
  }
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
index bc5a75c..173f7f7 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-Try-to-add-_moc-suffix.patch
@@ -1,4 +1,4 @@
-From 5089c3d10f13874e503f5548f40341d8f59e229f Mon Sep 17 00:00:00 2001
+From b0e844967728edf814d611bb1c69d320a8a6c64d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Tue, 1 Jul 2014 15:58:16 +0200
 Subject: [PATCH 3/3] functions.prf: Try to add _moc suffix
@@ -30,5 +30,5 @@ index 15c2941..78b1190 100644
  }
  
 -- 
-2.0.0
+2.1.1
 
diff --git a/recipes-qt/qt5/qtwebengine_5.3.2+git.bb b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
new file mode 100644
index 0000000..c9a6ea4
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine_5.3.2+git.bb
@@ -0,0 +1,28 @@
+require qt5-git.inc
+require ${PN}.inc
+
+# this wasn't released, the PV is set just to signify that this SRCREV was tested together
+# with 5.3.2 version of other modules
+PV = "5.3.2"
+DEFAULT_PREFERENCE = "1"
+
+QT_MODULE_BRANCH = "1.0"
+QT_MODULE_BRANCH_CHROMIUM = "33.0.1750.170-based"
+
+# For now we have to define SRC_URI here again as qt5-git.inc points to
+# qt.gitorious.org/qt/ but qtwebengine is still on qt.gitorious.org/qt-labs/ which will
+# switch soon.
+SRC_URI = " \
+    git://gitorious.org/qt/qtwebengine.git;name=qtwebengine;protocol=git;branch=${QT_MODULE_BRANCH} \
+    git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;protocol=git;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
+    file://0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch \
+    file://0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
+    file://0003-functions.prf-Try-to-add-_moc-suffix.patch \
+    file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
+    file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
+    file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
+"
+SRCREV_qtwebengine = "21f6ce84ecca9a4ff2aa980b21d2e5174c78d14b"
+SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
+
+SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index dd93d1f..360a1c8 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -1,11 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-# QtWebEngine has it's own version format currently and doesn't follow the major Qt
-# versions (but it's release are at the same time as of major Qt releases). We're tracking
-# the master branch which will lead to 1.0 when Qt 5.4 is released here.
-PV = "0.9.99+git${SRCPV}"
-
 QT_MODULE_BRANCH = "1.0"
 QT_MODULE_BRANCH_CHROMIUM = "33.0.1750.170-based"
 
@@ -22,7 +17,7 @@ SRC_URI = " \
     file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
     file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
 "
-SRCREV_qtwebengine = "21f6ce84ecca9a4ff2aa980b21d2e5174c78d14b"
+SRCREV_qtwebengine = "4ffc07ddb8739da9e94a2b23b03c63fd7b74c09a"
 SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index f0ceb5d..27dd7ee 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "bce5056b9e16a943357e362455a46685d3f22093"
+SRCREV = "70bd4d5253f134bf48a30544030bb832f1eba8b3"
diff --git a/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
new file mode 100644
index 0000000..2c471be
--- /dev/null
+++ b/recipes-qt/qt5/qtwebkit-git/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -0,0 +1,30 @@
+From a7d860fbc194c46591016ba41e138eadc1e50d84 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <trevor.woerner@linaro.org>
+Date: Fri, 7 Feb 2014 04:07:17 +0100
+Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
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
+index 9c52406..a68a101 100644
+--- a/Tools/qmake/mkspecs/features/unix/default_post.prf
++++ b/Tools/qmake/mkspecs/features/unix/default_post.prf
+@@ -59,7 +59,6 @@ linux-*g++* {
+     }
+ }
+ 
+-contains(TEMPLATE, app): CONFIG += rpath
+ 
+ CONFIG(debug, debug|release)|force_debug_info {
+     # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
+-- 
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 30f2f7a..e54d397 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -1,4 +1,6 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "db1ec4efadf930cd8088286605128ae1d01d23e8"
+DEPENDS += "leveldb"
+
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
index 5d63a6b..5c7246d 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,4 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "e13d30be68228ccda3b6310ac44a84981b17f03b"
+SRCREV = "eef0ba60200d8039c05073ce707c2352ac0944a8"
+
+LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
+                    file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
+                    file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
+                    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+                    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e"
-- 
2.1.1


