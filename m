Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id B1F0260601
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 17:33:55 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hi2so7798021wib.15
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=+h+Gj+kGOgPteu3hVP6P0WNx+9FulsMptHzxkcyxTZ8=;
	b=Yoxc3zJgLSjklB+6hongOfyF3IuxV50Njw31YxvA9eN3YwbiSdOpeZyF59DW35dfRm
	0sXPkFbCvn0ic1FnYHuCopoofKjFuNQJVkiO4UnA4WBqcibZjsipZGSWk+iL8VG6aO56
	eLw/x2zkfwm02hu8kJBHF/JWzTRN3KYFEBlB5wKkhXF/u1tSHE0tYB+pAdne2fAlX+Xh
	TOdTxj2KjAUax0w3fV9Q71/bpscj/6UWs4lTs5jC5pcsZkJU//b629dHO23RmOa7xCAG
	I5stOHCpixtipojmlBs4eH/NuBvH5bbgD/jDNI7iE1nu7BLDZhinqacBxcSGy5m3h+GT
	6tHw==
X-Received: by 10.180.208.42 with SMTP id mb10mr21642659wic.49.1413826435588; 
	Mon, 20 Oct 2014 10:33:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	td9sm10327334wic.15.2014.10.20.10.33.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 10:33:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 19:33:48 +0200
Message-Id: <1413826432-483-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.1
Subject: [meta-qt5][WIP][PATCH 1/5] qt5: upgrade git recipes to 5.4-beta1
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
X-List-Received-Date: Mon, 20 Oct 2014 17:34:02 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/nativesdk-qttools_git.bb            |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  2 +-
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 .../qtbase-git/0001-Add-linux-oe-g-platform.patch  | 12 ++---
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  2 +-
 .../0003-Add-external-hostbindir-option.patch      | 22 ++++-----
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  6 +--
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  6 +--
 ...lfs-Print-the-chosen-config-in-debug-mode.patch | 37 ++++-----------
 ...mintegration-Undefine-CursorShape-from-X..patch |  2 +-
 ...ump-path-length-from-256-to-512-character.patch |  6 +--
 ...gl-error-for-platforms-only-supporting-on.patch |  2 +-
 .../0010-QOpenGLPaintDevice-sub-area-support.patch | 54 ++++++++++++----------
 .../qt5/qtbase-git/0011-Always-build-uic.patch     |  2 +-
 ...-build-it-in-configure-but-allow-to-build.patch |  6 +--
 ...reserve-built-qmake-and-swap-with-native-.patch |  6 +--
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch | 32 ++++++-------
 ...a.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  2 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  2 +-
 .../0003-add-noqtwebkit-configuration.patch        |  2 +-
 recipes-qt/qt5/qttools-native_git.bb               |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch | 32 +++++++++++++
 ...yland-include-server-buffer-only-when-bui.patch | 31 +++++++++++++
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  4 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch | 29 ++++++++++++
 ...0002-functions.prf-Try-to-add-_moc-suffix.patch | 34 ++++++++++++++
 recipes-qt/qt5/qtwebengine_git.bb                  |  7 ++-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 50 files changed, 252 insertions(+), 140 deletions(-)
 create mode 100644 recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
 create mode 100644 recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
 create mode 100644 recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
 create mode 100644 recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Try-to-add-_moc-suffix.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 6de07e0..96d86db 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -32,7 +32,7 @@ SRC_URI += " \
     file://0012-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
-SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
+SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
diff --git a/recipes-qt/qt5/nativesdk-qttools_git.bb b/recipes-qt/qt5/nativesdk-qttools_git.bb
index b3169bc..7107d5b 100644
--- a/recipes-qt/qt5/nativesdk-qttools_git.bb
+++ b/recipes-qt/qt5/nativesdk-qttools_git.bb
@@ -4,7 +4,7 @@ require ${PN}.inc
 # prepend this again, because ${PN}.inc prepneds ${PN}
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
-SRCREV = "a1ca5b48fafc536b619617f8fa6a3e4798283812"
+SRCREV = "f3abe81d510bef5b984544a6d58551ce04cb8b48"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 2e32549..71aa858 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -4,4 +4,4 @@ require ${PN}.inc
 QT_MODULE_BRANCH = "master"
 
 # last tag before this SRCREV is 5.0.0-beta1, but version says 5.3.0 already
-SRCREV = "bdb98baf8253c69949a8c259369203da9ffb269c"
+SRCREV = "8a9723d7420829a2ba0141a9f7d8dc8cd11d8331"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 36fbaf8..919880d 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -10,7 +10,7 @@ SRC_URI += " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.3.99+5.4.0-alpha1+git${SRCPV}"
+PV = "5.3.99+5.4.0-beta1+git${SRCPV}"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/${BPN}-git:"
 
diff --git a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
index 60a2339..8f95ccb 100644
--- a/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase-git/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 7a573e702d37f3e83b92f6b07345aaab05261e7b Mon Sep 17 00:00:00 2001
+From 71a2437e2ee5a1214ab88c8a3d1d0ddcc012698d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH 01/11] Add linux-oe-g++ platform
@@ -51,7 +51,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 1efb645..b1dfca9 100755
+index 7d6ba9f..1de01a9 100755
 --- a/configure
 +++ b/configure
 @@ -316,6 +316,16 @@ getQMakeConf()
@@ -118,7 +118,7 @@ index 1efb645..b1dfca9 100755
  # Use CC/CXX to run config.tests
  mkdir -p "$outpath/config.tests"
  rm -f "$outpath/config.tests/.qmake.cache"
-@@ -3141,7 +3159,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3167,7 +3185,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -127,7 +127,7 @@ index 1efb645..b1dfca9 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3176,7 +3194,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3205,7 +3223,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -136,7 +136,7 @@ index 1efb645..b1dfca9 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3647,6 +3665,14 @@ setBootstrapVariable()
+@@ -3676,6 +3694,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -151,7 +151,7 @@ index 1efb645..b1dfca9 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3685,14 +3711,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3714,14 +3740,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
diff --git a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 06331aa..e4ef88c 100644
--- a/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase-git/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From e521cd2d84acad69fb3d57a5e97073898d03fbf0 Mon Sep 17 00:00:00 2001
+From 1e7e18bca925638cb381edbba3f10ce79799d460 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH 02/11] qlibraryinfo: allow to set qt.conf from the outside
diff --git a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
index 88bb484..8735942 100644
--- a/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase-git/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 735d4f58381452854ed7b0c2f762030d747098e1 Mon Sep 17 00:00:00 2001
+From 8f5a3f5b5d8f50661a2c69d5741a9df237600094 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/11] Add -external-hostbindir option
@@ -38,10 +38,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  11 files changed, 51 insertions(+), 13 deletions(-)
 
 diff --git a/configure b/configure
-index b1dfca9..dcd1790 100755
+index 1de01a9..7d7a98a 100755
 --- a/configure
 +++ b/configure
-@@ -768,6 +768,7 @@ QT_HOST_BINS=
+@@ -769,6 +769,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -49,7 +49,7 @@ index b1dfca9..dcd1790 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -887,6 +888,7 @@ while [ "$#" -gt 0 ]; do
+@@ -888,6 +889,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -57,7 +57,7 @@ index b1dfca9..dcd1790 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1101,6 +1103,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1102,6 +1104,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -67,7 +67,7 @@ index b1dfca9..dcd1790 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2252,6 +2257,10 @@ Installation options:
+@@ -2260,6 +2265,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -78,7 +78,7 @@ index b1dfca9..dcd1790 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -2916,6 +2925,11 @@ fi
+@@ -2939,6 +2948,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,7 +90,7 @@ index b1dfca9..dcd1790 100755
  # update QT_CONFIG to show our current predefined configuration
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
-@@ -3609,6 +3623,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
+@@ -3638,6 +3652,7 @@ static const char qt_configure_prefix_path_strs[][256 + 12] = {
      "qt_hbinpath=$QT_HOST_BINS",
      "qt_hlibpath=$QT_HOST_LIBS",
      "qt_hdatpath=$QT_HOST_DATA",
@@ -99,7 +99,7 @@ index b1dfca9..dcd1790 100755
      "qt_hostspec=$shortspec",
  #endif
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 709248a..ea2fed0 100644
+index a9a622d..b6f1db0 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
 @@ -191,7 +191,11 @@ defineTest(qtAddRpathLink) {
@@ -279,7 +279,7 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index ef71097..7969132 100644
+index 99ecc7b..6e0f4da 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
 @@ -1191,6 +1191,13 @@ void Configure::parseCmdLine()
@@ -296,7 +296,7 @@ index ef71097..7969132 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -3984,6 +3991,7 @@ void Configure::generateQConfigCpp()
+@@ -3994,6 +4001,7 @@ void Configure::generateQConfigCpp()
                    << "    \"qt_hbinpath=" << formatPath(dictionary["QT_HOST_BINS"]) << "\"," << endl
                    << "    \"qt_hlibpath=" << formatPath(dictionary["QT_HOST_LIBS"]) << "\"," << endl
                    << "    \"qt_hdatpath=" << formatPath(dictionary["QT_HOST_DATA"]) << "\"," << endl
diff --git a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index b7e515a..b5b7746 100644
--- a/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase-git/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,4 +1,4 @@
-From 73d7d25b8a424eecef197de60a3a504e163f0816 Mon Sep 17 00:00:00 2001
+From e74a3790f613771099e3373f8e6df506c3520b73 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
 Subject: [PATCH 04/11] configureapp: Prefix default LIBDIRS and INCDIRS with
@@ -11,10 +11,10 @@ Upstream-Status: Pending
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 7969132..439dcfb 100644
+index 6e0f4da..d72c302 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -3373,8 +3373,8 @@ void Configure::generateQConfigPri()
+@@ -3383,8 +3383,8 @@ void Configure::generateQConfigPri()
          configStream << "    QT_ARCH = " << dictionary["QT_ARCH"] << endl;
          if (dictionary.contains("XQMAKESPEC") && !dictionary["XQMAKESPEC"].startsWith("wince")) {
              // FIXME: add detection
diff --git a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index d1ec16c..4661606 100644
--- a/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase-git/0005-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From fcbe3eefa24348cbf98ca9fc9e137ac6ccaf1f87 Mon Sep 17 00:00:00 2001
+From 9f7dd27bb14cf0c3425c2c8fdec2f6d0df3852f9 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 05/11] qt_module: Fix pkgconfig and libtool replacements
@@ -80,10 +80,10 @@ index ebc5f00..46319d8 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index 6ab8267..2b4943c 100644
+index 8599a47..7da73a6 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -188,10 +188,25 @@ unix|mingw {
+@@ -190,10 +190,25 @@ unix|mingw {
          QMAKE_PKGCONFIG_DESCRIPTION = $$replace(TARGET, ^Qt, "Qt ") module
      QMAKE_PKGCONFIG_INSTALL_REPLACE += lib_replace
  
diff --git a/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch b/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
index 1324802..6e47e81 100644
--- a/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
+++ b/recipes-qt/qt5/qtbase-git/0006-Revert-eglfs-Print-the-chosen-config-in-debug-mode.patch
@@ -1,4 +1,4 @@
-From 285b31f709a81b7e51b5c3d96061fa731cdfdf7d Mon Sep 17 00:00:00 2001
+From 4b6778e44b35d97bd08baded4e5d1f570693ae05 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 21 Apr 2014 19:22:04 +0200
 Subject: [PATCH 06/11] Revert "eglfs: Print the chosen config in debug mode"
@@ -40,15 +40,18 @@ With this change the build is failing with:
 
 This reverts commit dc685cf6331f5fb46285cf10d6464c2ecf41f73e.
 
+Will be partially resolved in newer revision with:
+https://codereview.qt-project.org/96220
+
 Change-Id: I7a6a926b7525d4f137824c71f2ec8cd089c21f13
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/platformsupport/eglconvenience/qeglconvenience.cpp         | 4 +++-
- src/platformsupport/eglconvenience/qeglplatformcontext.cpp     | 7 -------
- src/platformsupport/eglconvenience/qeglplatformintegration.cpp | 4 ++--
- 3 files changed, 5 insertions(+), 10 deletions(-)
+ src/platformsupport/eglconvenience/qeglconvenience.cpp     | 4 +++-
+ src/platformsupport/eglconvenience/qeglplatformcontext.cpp | 7 -------
+ 2 files changed, 3 insertions(+), 8 deletions(-)
 
 diff --git a/src/platformsupport/eglconvenience/qeglconvenience.cpp b/src/platformsupport/eglconvenience/qeglconvenience.cpp
-index b7ce6df..e8c1925 100644
+index 1fdeec3..0fa3d88 100644
 --- a/src/platformsupport/eglconvenience/qeglconvenience.cpp
 +++ b/src/platformsupport/eglconvenience/qeglconvenience.cpp
 @@ -443,9 +443,11 @@ void q_printEglConfig(EGLDisplay display, EGLConfig config)
@@ -89,28 +92,6 @@ index 7cc3300..ccbd974 100644
      updateFormatFromGL();
  }
  
-diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration.cpp b/src/platformsupport/eglconvenience/qeglplatformintegration.cpp
-index b8205dc..6005684 100644
---- a/src/platformsupport/eglconvenience/qeglplatformintegration.cpp
-+++ b/src/platformsupport/eglconvenience/qeglplatformintegration.cpp
-@@ -193,7 +193,7 @@ enum ResourceType {
-     EglContext,
-     EglConfig,
-     NativeDisplay,
--    Display
-+    XDisplay
- };
- 
- static int resourceType(const QByteArray &key)
-@@ -236,7 +236,7 @@ void *QEGLPlatformIntegration::nativeResourceForScreen(const QByteArray &resourc
-     void *result = 0;
- 
-     switch (resourceType(resource)) {
--    case Display:
-+    case XDisplay:
-         // Play nice when using the x11 hooks: Be compatible with xcb that allows querying
-         // the X Display pointer, which is nothing but our native display.
-         result = reinterpret_cast<void*>(nativeDisplay());
 -- 
 2.1.1
 
diff --git a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 8f46910..ddc541a 100644
--- a/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase-git/0007-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,4 +1,4 @@
-From 9563ef306503f2503a09aadce63020b3048a185d Mon Sep 17 00:00:00 2001
+From 2ec9a882cd9a0893f2060ef36d28e0568416f9fe Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
 Subject: [PATCH 07/11] qeglplatformintegration: Undefine CursorShape from X.h
diff --git a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
index afe9b74..508f9f9 100644
--- a/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase-git/0008-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 33d46bd0229ff9635c14724231eb95f556afd5c2 Mon Sep 17 00:00:00 2001
+From 00906b6ca765e7e71d354bf675b27b3862af535c Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:27:30 -0500
 Subject: [PATCH 08/11] configure: bump path length from 256 to 512 characters
@@ -12,10 +12,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index dcd1790..fe6bed4 100755
+index 7d7a98a..3f05383 100755
 --- a/configure
 +++ b/configure
-@@ -3587,7 +3587,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3616,7 +3616,7 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=`date +%Y-%m-%d`";
  
  /* Installation Info */
diff --git a/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index de3e2d6..0f66330 100644
--- a/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase-git/0009-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,4 +1,4 @@
-From 5d088522706a3533800e51c011c93d3d2ea58a4d Mon Sep 17 00:00:00 2001
+From 46cf3a50908de0ccec31de6705674a4c69fb8d6c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
 Subject: [PATCH 09/11] eglfs: fix egl error for platforms only supporting one
diff --git a/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
index db979bd..51a244d 100644
--- a/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase-git/0010-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From 709c35b889e46f2b1bc36d88c732f1b440e6c236 Mon Sep 17 00:00:00 2001
+From e7b9af7232c4f7eb50933dde208e58438bedd964 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 10/11] QOpenGLPaintDevice sub-area support
@@ -12,26 +12,19 @@ Change-Id: Ida2f079aa1ac0b87d36b54129e226399dbcdda80
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/gui/opengl/qopenglpaintdevice.cpp       | 12 ++++++++++++
+ src/gui/opengl/qopenglpaintdevice.cpp       | 11 +++++++++++
  src/gui/opengl/qopenglpaintdevice.h         |  2 ++
+ src/gui/opengl/qopenglpaintdevice_p.h       |  1 +
  src/gui/opengl/qopenglpaintengine.cpp       |  9 +++++++--
  src/gui/opengl/qopenglpaintengine_p.h       |  1 +
  src/gui/opengl/qopengltextureglyphcache.cpp |  2 +-
- 5 files changed, 23 insertions(+), 3 deletions(-)
+ 6 files changed, 23 insertions(+), 3 deletions(-)
 
 diff --git a/src/gui/opengl/qopenglpaintdevice.cpp b/src/gui/opengl/qopenglpaintdevice.cpp
-index 59bca6e..ea0ee88 100644
+index e908fd8..8f0ef56 100644
 --- a/src/gui/opengl/qopenglpaintdevice.cpp
 +++ b/src/gui/opengl/qopenglpaintdevice.cpp
-@@ -103,6 +103,7 @@ class QOpenGLPaintDevicePrivate
- public:
-     QOpenGLPaintDevicePrivate(const QSize &size);
- 
-+    QPoint offset;
-     QSize size;
-     QOpenGLContext *ctx;
- 
-@@ -151,6 +152,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
+@@ -135,6 +135,12 @@ QOpenGLPaintDevice::QOpenGLPaintDevice(int width, int height)
  {
  }
  
@@ -42,9 +35,9 @@ index 59bca6e..ea0ee88 100644
 +}
 +
  /*!
-     Destroys the QOpenGLPaintDevice.
- */
-@@ -220,6 +227,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
+     \internal
+  */
+@@ -212,6 +218,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
      return d_ptr->ctx;
  }
  
@@ -57,17 +50,18 @@ index 59bca6e..ea0ee88 100644
      Returns the pixel size of the paint device.
  
 diff --git a/src/gui/opengl/qopenglpaintdevice.h b/src/gui/opengl/qopenglpaintdevice.h
-index e1be9b5..1a3ddbc 100644
+index dda3bfe..9965553 100644
 --- a/src/gui/opengl/qopenglpaintdevice.h
 +++ b/src/gui/opengl/qopenglpaintdevice.h
-@@ -54,12 +54,14 @@ public:
+@@ -53,6 +53,7 @@ public:
      QOpenGLPaintDevice();
      explicit QOpenGLPaintDevice(const QSize &size);
      QOpenGLPaintDevice(int width, int height);
 +    QOpenGLPaintDevice(int x, int y, int width, int height);
+     QOpenGLPaintDevice(QOpenGLPaintDevicePrivate *dd);
      virtual ~QOpenGLPaintDevice();
  
-     int devType() const { return QInternal::OpenGL; }
+@@ -60,6 +61,7 @@ public:
      QPaintEngine *paintEngine() const;
  
      QOpenGLContext *context() const;
@@ -75,11 +69,23 @@ index e1be9b5..1a3ddbc 100644
      QSize size() const;
      void setSize(const QSize &size);
      void setDevicePixelRatio(qreal devicePixelRatio);
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
 diff --git a/src/gui/opengl/qopenglpaintengine.cpp b/src/gui/opengl/qopenglpaintengine.cpp
-index 21bc4a9..ce008a4 100644
+index c490726..1d775fd 100644
 --- a/src/gui/opengl/qopenglpaintengine.cpp
 +++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -1999,7 +1999,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
+@@ -2002,7 +2002,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
      for (int i = 0; i < QT_GL_VERTEX_ARRAY_TRACKED_COUNT; ++i)
          d->vertexAttributeArraysEnabledState[i] = false;
  
@@ -90,7 +96,7 @@ index 21bc4a9..ce008a4 100644
      d->width = sz.width();
      d->height = sz.height();
      d->mode = BrushDrawingMode;
-@@ -2084,7 +2087,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+@@ -2089,7 +2092,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
          d->device->ensureActiveTarget();
  
          d->transferMode(BrushDrawingMode);
@@ -99,7 +105,7 @@ index 21bc4a9..ce008a4 100644
          d->needsSync = false;
          d->lastMaskTextureUsed = 0;
          d->shaderManager->setDirty();
-@@ -2127,6 +2130,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2132,6 +2135,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
      if (bounds == QRect(0, 0, width, height)) {
          funcs.glDisable(GL_SCISSOR_TEST);
      } else {
@@ -107,7 +113,7 @@ index 21bc4a9..ce008a4 100644
          funcs.glEnable(GL_SCISSOR_TEST);
          setScissor(bounds);
      }
-@@ -2135,12 +2139,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+@@ -2140,12 +2144,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
  
  void QOpenGL2PaintEngineExPrivate::setScissor(const QRect &rect)
  {
diff --git a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
index 9bd001b..8ef6eaa 100644
--- a/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 2dd5a897d7e2f073b4223595a7bf214d3481b68a Mon Sep 17 00:00:00 2001
+From 8a3493c260f8b0580f9dd0ab2dafbf968c14e019 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 11/12] Always build uic
diff --git a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index e39693f..1e701c7 100644
--- a/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase-git/0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,4 +1,4 @@
-From 5d6e6b18d2049bad370c594e5ab30fd85c0ed047 Mon Sep 17 00:00:00 2001
+From d750936020f354b8c59bbfcbf3930115c390d36d Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
 Subject: [PATCH 11/11] qmake: don't build it in configure, but allow to build
@@ -20,10 +20,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index fe6bed4..9628be2 100755
+index 3f05383..05ae996 100755
 --- a/configure
 +++ b/configure
-@@ -3689,7 +3689,7 @@ setBootstrapEvalVariable()
+@@ -3718,7 +3718,7 @@ setBootstrapEvalVariable()
  
  
  # build qmake
diff --git a/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
index c994120..d89f344 100644
--- a/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase-git/0012-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,4 +1,4 @@
-From f1b4d7d4c96b6ded9bd312f6db2ba735feb001c0 Mon Sep 17 00:00:00 2001
+From 36b89f6e50e2b28d8646a5e77cdac36ecbd6ba4f Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
 Subject: [PATCH 12/12] configure: preserve built qmake and swap with native
@@ -13,10 +13,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/configure b/configure
-index fe6bed4..ea661a3 100755
+index 3f05383..d6ff774 100755
 --- a/configure
 +++ b/configure
-@@ -3839,6 +3839,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3868,6 +3868,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
  
      (cd "$outpath/qmake"; "$MAKE") || exit 2
  fi # Build qmake
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index d902b18..5853731 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -30,7 +30,7 @@ do_install_append() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
+SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 2e938c9..443f64a 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -24,7 +24,7 @@ SRC_URI += "\
     file://0011-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
 "
 
-SRCREV = "8456adf0eeb9df8dd5f0547d4ad5a81888295f03"
+SRCREV = "06e706bdbb826b521389409b53079483fda5584a"
 
 LICENSE = "GFDL-1.3 & LGPL-2.1 | LGPL-3.0"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 195b267..505d33b 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${BPN}.inc
 
-SRCREV = "0f6e9cc18007c718de8ec399f5b60687ecffe9c2"
+SRCREV = "4a6d4e8682384887d1b30b9c3107f47c57d7ee3f"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
index 78ef3e1..2c0b3b6 100644
--- a/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative-git/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From 3bab0b12be56ec7c85c5648a304aba98dc09ed60 Mon Sep 17 00:00:00 2001
+From 74983b3dfdf23880ce63d7ecb866a9e08bff923d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 5957c45..99e9ebb 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "29b77e5e0759472ab1f7da1dd756b857d3b2ddd7"
+SRCREV = "d767254ee09e9fd773bd40c93395609ac8bbf7e6"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index ff3c1c4..c54bec7 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -2,7 +2,7 @@ require qt5-git.inc
 require ${PN}.inc
 
 QT_MODULE_BRANCH = "1.1"
-SRCREV = "2b93eb45116e0bf2cc62f614de66cfd261c552df"
+SRCREV = "f8ad37de2d7170d1548252608f8c04aac6ec1035"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 95aac63..2e024b1 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "bdd7e47ff1357bcc3b81c7ff5c10189c6a9b0290"
+SRCREV = "9e9600d92224084f7942a6bd83b926c630a29747"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 4f15caa..cfbf70a 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "08f40bc0f00716c3a8cbda70ed00dc2f16515e85"
+SRCREV = "fef13b3b4c1a8af83086ecf49430903778e63624"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 38980b1..d85307f 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "b90e043af09955d94a7a9555f11b5d6f3add4c3a"
+SRCREV = "eebf55a6919dff9eec4dd8529223aae6f6d0f569"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 3960131..5c12cbd 100644
--- a/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia-git/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From 4f9e752e6ecd4e2058f5d4f43578e5b21b6efbf8 Mon Sep 17 00:00:00 2001
+From b16e42196969a6277e7b8902488fad1950a52d0d Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH 1/2] Initial porting effort to GStreamer 1.0.
@@ -1689,22 +1689,22 @@ index f944a60..72d1cf1 100644
      if (m_duration != duration) {
          m_duration = duration;
 diff --git a/src/plugins/gstreamer/camerabin/camerabinsession.cpp b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-index 850f8c1..f4e2383 100644
+index 0197839..128ab58 100644
 --- a/src/plugins/gstreamer/camerabin/camerabinsession.cpp
 +++ b/src/plugins/gstreamer/camerabin/camerabinsession.cpp
-@@ -724,7 +724,11 @@ qint64 CameraBinSession::duration() const
-     GstFormat   format = GST_FORMAT_TIME;
-     gint64      duration = 0;
- 
+@@ -728,7 +728,11 @@ qint64 CameraBinSession::duration() const
+         if (fileSink) {
+             GstFormat format = GST_FORMAT_TIME;
+             gint64 duration = 0;
 +#if GST_CHECK_VERSION(1,0,0)
-+    if ( m_camerabin && gst_element_query_duration(m_camerabin, format, &duration))
++            bool ret = gst_element_query_duration(fileSink, format, &duration);
 +#else
-     if ( m_camerabin && gst_element_query_position(m_camerabin, &format, &duration))
+             bool ret = gst_element_query_position(fileSink, &format, &duration);
 +#endif
-         return duration / 1000000;
-     else
-         return 0;
-@@ -757,8 +761,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
+             gst_object_unref(GST_OBJECT(fileSink));
+             if (ret)
+                 return duration / 1000000;
+@@ -765,8 +769,13 @@ void CameraBinSession::setMetaData(const QMap<QByteArray, QVariant> &data)
  
      if (m_camerabin) {
          GstIterator *elements = gst_bin_iterate_all_by_interface(GST_BIN(m_camerabin), GST_TYPE_TAG_SETTER);
@@ -1718,7 +1718,7 @@ index 850f8c1..f4e2383 100644
              gst_tag_setter_reset_tags(GST_TAG_SETTER(element));
  
              QMapIterator<QByteArray, QVariant> it(data);
-@@ -819,7 +828,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -827,7 +836,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
      if (gm && GST_MESSAGE_TYPE(gm) == GST_MESSAGE_ELEMENT) {
          if (m_captureMode == QCamera::CaptureStillImage &&
@@ -1730,7 +1730,7 @@ index 850f8c1..f4e2383 100644
              st = gst_message_get_structure(gm);
  
              if (gst_structure_has_field_typed(st, "buffer", GST_TYPE_BUFFER)) {
-@@ -829,7 +842,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
+@@ -837,7 +850,11 @@ bool CameraBinSession::processSyncMessage(const QGstreamerMessage &message)
  
                      QImage img;
  
@@ -1742,7 +1742,7 @@ index 850f8c1..f4e2383 100644
                      if (caps) {
                          GstStructure *structure = gst_caps_get_structure(caps, 0);
                          gint width = 0;
-@@ -1102,7 +1119,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
+@@ -1110,7 +1127,11 @@ QList< QPair<int,int> > CameraBinSession::supportedFrameRates(const QSize &frame
          gst_structure_remove_all_fields(structure);
          gst_structure_set_value(structure, "framerate", &rate);
      }
@@ -1754,7 +1754,7 @@ index 850f8c1..f4e2383 100644
  
  
      for (uint i=0; i<gst_caps_get_size(caps); i++) {
-@@ -1222,7 +1243,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
+@@ -1230,7 +1251,11 @@ QList<QSize> CameraBinSession::supportedResolutions(QPair<int,int> rate,
          gst_structure_set_value(structure, "width", &w);
          gst_structure_set_value(structure, "height", &h);
      }
diff --git a/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch b/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
index 1f82d49..d225d07 100644
--- a/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
+++ b/recipes-qt/qt5/qtmultimedia-git/0002-qtmultimedia.pro-Respect-OE_GSTREAMER_ENABLED-OE_GST.patch
@@ -1,4 +1,4 @@
-From ee12423779327f2cbb46ada326fa0a997c93a93d Mon Sep 17 00:00:00 2001
+From 392d324d86e3b889acfce4f3469158dd942cc969 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 5 Jul 2014 09:10:02 +0200
 Subject: [PATCH 2/2] qtmultimedia.pro: Respect
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 48cab35..f6eadd9 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "f02d9e934322fbf9af8a5503c1bda37552988b2b"
+SRCREV = "b366a99eb14f166ebdcfcb6d328b4d7552227b71"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 873c359..8a48e0c 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "af503cb8014c5b0fb2928ac1596a042d979a94a3"
+SRCREV = "61df13088c6c1d6a1b5a6d329dcc6879b33d69ba"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 77b499a..9a5e28c 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "ebbf3629ae53755c3b5dd0912585a40545f391fc"
+SRCREV = "737379ad810d4431a93bed214f50b25632ba00e5"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 029c107..1d5c448 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "14710df8fa3b8c31cdbf0243d268a006e667e13a"
+SRCREV = "9871b41531d632105f1d11e3a9683b05061177c1"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 6e2a36a..fc828fd 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "4756a79d456d2fdd7aa1e5cb562a50165daf3d7f"
+SRCREV = "ff98a9a27a18e6a48afa705e5cd84bd9461ad554"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 6d2ab1c..82a58bd 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "ef8ed357881b212e2debe2ccf975996bca2331c2"
+SRCREV = "3bb682ea29ffaf72ff73e6eb57abdc5c59524e8a"
 
 # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
 # other qt* components use :/
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 118a099..704a199 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "bf249abee98727d517f52b1126dc7fda8af4e302"
+SRCREV = "9f1c31c8a3cfd0f341987e8011abad172592dd3c"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
diff --git a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index c176b4e..af431dc 100644
--- a/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools-git/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From ba804f69b32dc9a3554d2901cd1897039be33553 Mon Sep 17 00:00:00 2001
+From f8476dd4e4069b4403f26b5ccd5c3d9d9402c7bd Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
diff --git a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 1385791..764c3e5 100644
--- a/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools-git/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From ac277dcb43d53ce6d87c58f4afef295fe44a49ea Mon Sep 17 00:00:00 2001
+From d43c5a3759ceee4ba0e0e6d94c61d13850e142ec Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
diff --git a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
index ba96f5a..535a24c 100644
--- a/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools-git/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From b50a6739b3d38f06901e7812864e3f7122f3d0c8 Mon Sep 17 00:00:00 2001
+From 5012d9057afa20e34aa8a36c195f87b89d0fbf8c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/3] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools-native_git.bb b/recipes-qt/qt5/qttools-native_git.bb
index db3e540..fade625 100644
--- a/recipes-qt/qt5/qttools-native_git.bb
+++ b/recipes-qt/qt5/qttools-native_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "a1ca5b48fafc536b619617f8fa6a3e4798283812"
+SRCREV = "f3abe81d510bef5b984544a6d58551ce04cb8b48"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index db3e540..fade625 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "a1ca5b48fafc536b619617f8fa6a3e4798283812"
+SRCREV = "f3abe81d510bef5b984544a6d58551ce04cb8b48"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.LGPLv3;md5=c1939be5579666be947371bc8120425f \
diff --git a/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
new file mode 100644
index 0000000..16433d5
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland-git/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -0,0 +1,32 @@
+From 3cf60039ff1825c58bee5c79c66e7d12f4039fc7 Mon Sep 17 00:00:00 2001
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
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
new file mode 100644
index 0000000..1af124a
--- /dev/null
+++ b/recipes-qt/qt5/qtwayland-git/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -0,0 +1,31 @@
+From 9c98c0c411ecaf4cb95b76d0c07e72af75a8d7f0 Mon Sep 17 00:00:00 2001
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
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 7934955..f7d0466 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "5f718c7d04d44c3878018e8070b18cf0e7486eb0"
+SRCREV = "c3d2a7bd8af4102441c113e088bd6a2cb50b97cf"
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 62a718e..3d53a32 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -1,10 +1,10 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "5f718c7d04d44c3878018e8070b18cf0e7486eb0"
+SRCREV = "c3d2a7bd8af4102441c113e088bd6a2cb50b97cf"
 
 SRC_URI += " \
-    file://0001-examples.pro-include-server-buffer-only-when-buildin.patch \
+    file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
 QT_VERSION ?= "5.4.0"
diff --git a/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
new file mode 100644
index 0000000..3e8d7ac
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine-git/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -0,0 +1,29 @@
+From 1e2fbd3bbf3eb94a4d78c53068bbb58d4227ab46 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Mon, 30 Jun 2014 20:08:17 +0200
+Subject: [PATCH 1/2] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+ anywhere in patch, but at the end
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 02c3872..3b9babe 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -61,8 +61,8 @@ defineReplace(findIncludedMocFiles) {
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
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Try-to-add-_moc-suffix.patch b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Try-to-add-_moc-suffix.patch
new file mode 100644
index 0000000..646d2a6
--- /dev/null
+++ b/recipes-qt/qt5/qtwebengine-git/0002-functions.prf-Try-to-add-_moc-suffix.patch
@@ -0,0 +1,34 @@
+From 4fd50d344ad5e7f89e538222605dd50d0f636d3a Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Tue, 1 Jul 2014 15:58:16 +0200
+Subject: [PATCH 2/2] functions.prf: Try to add _moc suffix
+
+* otherwise moc generated files have the same basename and do_configure fails with:
+  core_generated.gyp:QtWebEngineCore#target has several files with the same basename:
+  |   javascript_dialog_controller: javascript_dialog_controller.cpp
+  | /OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/qtwebengine/0.9.99+gitAUTOINC+21f6ce84ec-r0/git/src/core/.moc/moc_/OE/build/oe-core/tmp-eglibc/work/i586-oe-linux/qtwebengine/0.9.99+gitAUTOI.moc+21f6ce84ec-r0/git/src/core/javascript_dialog_controller.cpp
+  ...
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ tools/qmake/mkspecs/features/functions.prf | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
+index 3b9babe..6d691df 100644
+--- a/tools/qmake/mkspecs/features/functions.prf
++++ b/tools/qmake/mkspecs/features/functions.prf
+@@ -61,8 +61,8 @@ defineReplace(findIncludedMocFiles) {
+ defineReplace(mocOutput) {
+   out = $$1
+   # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
+-  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
+-  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1$${first(QMAKE_EXT_CPP)})
++  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_CPP,|))$, $${QMAKE_CPP_MOD_MOC}\\1_moc$${QMAKE_EXT_CPP_MOC})
++  out = $$replace(out, ^(.*)($$join(QMAKE_EXT_H,|))$, $${QMAKE_H_MOD_MOC}\\1_moc$${first(QMAKE_EXT_CPP)})
+   return($$out)
+ }
+ 
+-- 
+2.1.1
+
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 360a1c8..7fe2190 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -10,14 +10,13 @@ QT_MODULE_BRANCH_CHROMIUM = "33.0.1750.170-based"
 SRC_URI = " \
     git://gitorious.org/qt/qtwebengine.git;name=qtwebengine;protocol=git;branch=${QT_MODULE_BRANCH} \
     git://gitorious.org/qt/qtwebengine-chromium.git;name=chromium;protocol=git;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
-    file://0001-Use-ninja-supplied-by-environment-variable-NINJA_PAT.patch \
-    file://0002-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
-    file://0003-functions.prf-Try-to-add-_moc-suffix.patch \
+    file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
+    file://0002-functions.prf-Try-to-add-_moc-suffix.patch \
     file://0001-chromium-Drop-build-time-only-dependency-on-x11-libr.patch \
     file://0002-chromium-Strip-unwanted-echo-compiling-prefix-from-C.patch \
     file://0003-chromium-base.gypi-include-atomicops_internals_x86_gcc.cc-whe.patch \
 "
-SRCREV_qtwebengine = "4ffc07ddb8739da9e94a2b23b03c63fd7b74c09a"
+SRCREV_qtwebengine = "14fcf0d3193e2ee2bf904a305c9f34ff8d0e5ce7"
 SRCREV_chromium = "1f3cc8c2618979b557d60ef1ad984a49dca83bff"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index e54d397..216d910 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -3,4 +3,4 @@ require ${PN}.inc
 
 DEPENDS += "leveldb"
 
-SRCREV = "3a51e3ee766490fe6f9ab9511d19e16f75e07db8"
+SRCREV = "7778f881ff7dc92fca44dd414b02e7345f8db930"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 0631f56..28e972a 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -1,4 +1,4 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "f6175568bb32b87a3d6cd55382fa1c8e1a1de2b4"
+SRCREV = "0854eda408de542047a0ef38c37953719a8f9fde"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 5c7246d..9033536 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -1,7 +1,7 @@
 require qt5-git.inc
 require ${PN}.inc
 
-SRCREV = "eef0ba60200d8039c05073ce707c2352ac0944a8"
+SRCREV = "045028f951959dc217a0fc1c19f014989bfaaa1f"
 
 LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=cff17b12416c896e10ae2c17a64252e7 \
                     file://LICENSE.GPLv2;md5=e782f55badfa137e5e59c330f12cc8ed \
-- 
2.1.1


