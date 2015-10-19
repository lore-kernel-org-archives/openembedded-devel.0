Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 262497708E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:48:57 +0000 (UTC)
Received: by wicfv8 with SMTP id fv8so6795256wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=xBjp9SHxeAWIHJWdFAj0CoLY4KsQh9dKaK2DM3TcewM=;
	b=NdhxfhOumdJ2Jvqyz4CI5Ob3g5Lke6h8pqpcjP4OZE7mfS6eQlUuFNUaMYJB/lBS0E
	LryHyfoqLoeYPsV5w8FWZDDyfbQwgOAgKA+fFTOatFXx7LBLRazd8jvterL7H1pneH00
	K7jHS2U6ZJ/ptEMFLbEsvx1/cZn1SzummfBZny3OtVDv5ACYouqiNpiSLYA94gh/yvAI
	mb0P8F8oN8nsv1ohDFTwAFHD8QrwYNDAT6fvcaMCjRaam4jS2/nH6ygCYHimpqXlO5cN
	CDORpmmq6lSMPSHgH0re7JjqFszpaKFJQwGgxGG2enRo3bxVwQb9F4G9aNHhGFZDdQni
	bPgg==
X-Received: by 10.181.13.101 with SMTP id ex5mr16880094wid.2.1445262537783;
	Mon, 19 Oct 2015 06:48:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gd10sm40379669wjb.47.2015.10.19.06.48.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 06:48:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 15:48:59 +0200
Message-Id: <1445262539-13621-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <1445262539-13621-1-git-send-email-Martin.Jansa@gmail.com>
References: <1445262539-13621-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [WIP][meta-qt5][PATCH 2/2] qt5: upgrade to latest revision in 5.6 branch (5.6.0-alpha1+)
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
X-List-Received-Date: Mon, 19 Oct 2015 13:48:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  13 +-
 recipes-qt/qt5/qt3d_git.bb                         |   2 +-
 recipes-qt/qt5/qt5-git.inc                         |   2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  11 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  16 +--
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   6 +-
 .../0003-Add-external-hostbindir-option.patch      |  32 ++---
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  14 +-
 ...ump-path-length-from-256-to-512-character.patch |  36 +++++
 ...mintegration-Undefine-CursorShape-from-X..patch |  30 ----
 .../0006-QOpenGLPaintDevice-sub-area-support.patch | 157 +++++++++++++++++++++
 ...ump-path-length-from-256-to-512-character.patch |  36 -----
 recipes-qt/qt5/qtbase/0007-Always-build-uic.patch  |  31 ++++
 .../0007-QOpenGLPaintDevice-sub-area-support.patch | 157 ---------------------
 ...-build-it-in-configure-but-allow-to-build.patch |  68 +++++++++
 ...external-hostbindir-option-for-native-sdk.patch | 134 ++++++++++++++++++
 recipes-qt/qt5/qtbase/0008-Always-build-uic.patch  |  31 ----
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  36 +++++
 ...-build-it-in-configure-but-allow-to-build.patch |  68 ---------
 ...external-hostbindir-option-for-native-sdk.patch | 134 ------------------
 ...reserve-built-qmake-and-swap-with-native-.patch |  29 ++++
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  36 -----
 ...reserve-built-qmake-and-swap-with-native-.patch |  30 ----
 ...mscreen.cpp-reorder-headers-to-fix-build-.patch |  49 -------
 recipes-qt/qt5/qtbase_git.bb                       |  12 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |   2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   2 +-
 .../0001-qmltestexample-fix-link.patch             |   2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |   2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |   3 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |   2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |   2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |   2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |   2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch |   2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |   2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |   2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |   2 +-
 recipes-qt/qt5/qtscript_git.bb                     |   2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |   2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |   2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |   2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |   2 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |   2 +-
 .../0003-add-noqtwebkit-configuration.patch        |   2 +-
 ...ols-cmake-allow-overriding-the-location-f.patch |   2 +-
 recipes-qt/qt5/qttools_git.bb                      |   2 +-
 recipes-qt/qt5/qttranslations_git.bb               |   2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |   2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |   2 +-
 ...yland-include-server-buffer-only-when-bui.patch |   2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |   2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |  10 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |   8 +-
 ...ird_party-boringssl-Demand-for-newer-POSI.patch |  38 -----
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |   8 +-
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  14 +-
 .../0004-Generate-usable-qmake_extras.gypi.patch   |  71 ----------
 recipes-qt/qt5/qtwebengine_git.bb                  |   8 +-
 ...amples-enable-building-examples-by-defaul.patch |   2 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |   2 +-
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |   2 +-
 ...ude-backtrace-API-for-non-glibc-libraries.patch |   2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |   2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |   2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |   2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
 70 files changed, 604 insertions(+), 800 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
 create mode 100644 recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
 create mode 100644 recipes-qt/qt5/qtbase/0007-Always-build-uic.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
 create mode 100644 recipes-qt/qt5/qtbase/0007-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 create mode 100644 recipes-qt/qt5/qtbase/0008-Add-external-hostbindir-option-for-native-sdk.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
 create mode 100644 recipes-qt/qt5/qtbase/0008-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
 create mode 100644 recipes-qt/qt5/qtbase/0009-configure-preserve-built-qmake-and-swap-with-native-.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index e787993..08e21ac 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -26,20 +26,19 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0007-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0008-Always-build-uic.patch \
-    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0007-Always-build-uic.patch \
+    file://0008-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # specific for nativesdk-qtbase
 SRC_URI += " \
-    file://0010-configure-preserve-built-qmake-and-swap-with-native-.patch \
+    file://0009-configure-preserve-built-qmake-and-swap-with-native-.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
@@ -278,4 +277,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
+SRCREV = "3cae29b746df804ddfa37a3e27b48bd89686d2c1"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 437f41c..1cb9aad 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -15,4 +15,4 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "ec963e106397d46e5c853e9adb3fbec1b27d9b04"
+SRCREV = "18964d9ebed281a72506eccdf26319ce18be46d7"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index bfe1f85..9fbb787 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,7 +11,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.5.1+git${SRCPV}"
+PV = "5.5.99+5.6.0-alpha1+git${SRCPV}"
 
 #LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 #LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 10496f0..b15d27f 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -20,15 +20,14 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0007-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0008-Always-build-uic.patch \
-    file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0007-Always-build-uic.patch \
+    file://0008-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 CLEANBROKEN = "1"
@@ -116,4 +115,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
+SRCREV = "3cae29b746df804ddfa37a3e27b48bd89686d2c1"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index a9c448d..1583790 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 76283f2bca936a7565e8bf38a4630ec98f47ef50 Mon Sep 17 00:00:00 2001
+From 0b9071f546f5f70a823e3d1187f3c55e93fc1ba8 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/10] Add linux-oe-g++ platform
+Subject: [PATCH 1/8] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -52,7 +52,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index cea62fb..e1929e7 100755
+index 85de53c..48772d0 100755
 --- a/configure
 +++ b/configure
 @@ -342,6 +342,16 @@ getQMakeConf()
@@ -89,7 +89,7 @@ index cea62fb..e1929e7 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -564,24 +584,14 @@ fi
+@@ -557,24 +577,14 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -120,7 +120,7 @@ index cea62fb..e1929e7 100755
  fi'`
      eval "$cmd"
  done
-@@ -3350,7 +3360,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3400,7 +3410,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -129,7 +129,7 @@ index cea62fb..e1929e7 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3407,7 +3417,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3457,7 +3467,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -138,7 +138,7 @@ index cea62fb..e1929e7 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3909,6 +3919,14 @@ setBootstrapVariable()
+@@ -3958,6 +3968,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -153,7 +153,7 @@ index cea62fb..e1929e7 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3947,14 +3965,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3996,14 +4014,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index c5f14c9..aac64ec 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,8 +1,8 @@
-From f15c77264cc3ee82cba4127e58be4f6401b791f6 Mon Sep 17 00:00:00 2001
+From 9c801995ddd66c66d5d196da33bd9bae38dda2a1 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/10] qlibraryinfo: allow to set qt.conf from the outside
- using the environment
+Subject: [PATCH 2/8] qlibraryinfo: allow to set qt.conf from the outside using
+ the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index e969f6f..c7cca8c 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From 9529fdce0bd5516f86de1cb18aa6d18a66317ba5 Mon Sep 17 00:00:00 2001
+From 326ff99804f402adc700508f7739cb1bc1dd18ae Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/10] Add -external-hostbindir option
+Subject: [PATCH 3/8] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -29,18 +29,18 @@ Conflicts:
 ---
  configure                                   | 14 ++++++++++++++
  mkspecs/features/qt_functions.prf           |  6 +++++-
- mkspecs/features/qt_tool.prf                |  4 ++--
+ mkspecs/features/qt_tool.prf                |  5 +++--
  qtbase.pro                                  | 13 ++++++++++---
  src/corelib/Qt5CoreConfigExtras.cmake.in    |  6 +++---
  src/dbus/Qt5DBusConfigExtras.cmake.in       |  4 ++--
  src/widgets/Qt5WidgetsConfigExtras.cmake.in |  2 +-
- 7 files changed, 37 insertions(+), 12 deletions(-)
+ 7 files changed, 38 insertions(+), 12 deletions(-)
 
 diff --git a/configure b/configure
-index e1929e7..a757ce5 100755
+index 48772d0..dbfd63c 100755
 --- a/configure
 +++ b/configure
-@@ -809,6 +809,7 @@ QT_HOST_BINS=
+@@ -808,6 +808,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -48,7 +48,7 @@ index e1929e7..a757ce5 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -928,6 +929,7 @@ while [ "$#" -gt 0 ]; do
+@@ -927,6 +928,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -66,7 +66,7 @@ index e1929e7..a757ce5 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2383,6 +2388,10 @@ Installation options:
+@@ -2419,6 +2424,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +77,7 @@ index e1929e7..a757ce5 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3110,6 +3119,11 @@ fi
+@@ -3158,6 +3167,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,10 +90,10 @@ index e1929e7..a757ce5 100755
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index a1c4996..fca679c 100644
+index 6616aa4..3d40bf9 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -198,7 +198,11 @@ defineTest(qtAddRpathLink) {
+@@ -57,7 +57,11 @@ defineTest(qtHaveModule) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
@@ -107,15 +107,15 @@ index a1c4996..fca679c 100644
              cmd = perl -w $$system_path($${cmd}.pl)
          } else: contains(QMAKE_HOST.os, Windows) {
 diff --git a/mkspecs/features/qt_tool.prf b/mkspecs/features/qt_tool.prf
-index 1d3e88c..9b26adf 100644
+index 3f0301a..7dc66de 100644
 --- a/mkspecs/features/qt_tool.prf
 +++ b/mkspecs/features/qt_tool.prf
-@@ -12,11 +12,11 @@
- load(qt_app)
- 
+@@ -14,10 +14,11 @@ load(qt_app)
  CONFIG += console
-+QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
+ DEFINES *= QT_USE_QSTRINGBUILDER
  
++QT_EXTERNAL_HOST_BINS = $$[QT_EXTERNAL_HOST_BINS]
++
  # If we are doing a prefix build, create a "module" pri which enables
  # qtPrepareTool() to work with the non-installed build.
 -# Non-bootstrapped tools always need this because of the environment setup.
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index b2cf522..47b229f 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From b6d708efc205f2ffc0280e2da94596384bd98049 Mon Sep 17 00:00:00 2001
+From 5141367ddabad10edc9ad6dd8ab492f8553f9423 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 04/10] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH 4/8] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -67,10 +67,10 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  2 files changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index 55f65b5..2412fdd 100644
+index 38602f6..f9c401f 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
-@@ -36,7 +36,7 @@ contains(TEMPLATE, .*lib) {
+@@ -38,7 +38,7 @@ contains(TEMPLATE, .*lib) {
          lib_replace.replace =
      } else {
          lib_replace.match = $$rplbase/lib
@@ -80,10 +80,10 @@ index 55f65b5..2412fdd 100644
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
 diff --git a/mkspecs/features/qt_module.prf b/mkspecs/features/qt_module.prf
-index c89b6d2..23d4366 100644
+index 3c05260..f18efb9 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -214,6 +214,11 @@ unix|mingw {
+@@ -238,6 +238,11 @@ unix|mingw {
      pclib_replace.CONFIG = path
      QMAKE_PKGCONFIG_INSTALL_REPLACE += pclib_replace
  
@@ -95,7 +95,7 @@ index c89b6d2..23d4366 100644
      unix {
          CONFIG += create_libtool explicitlib
          host_build: \
-@@ -225,6 +230,11 @@ unix|mingw {
+@@ -249,6 +254,11 @@ unix|mingw {
              ltlib_replace.replace = $$QMAKE_LIBTOOL_LIBDIR
          ltlib_replace.CONFIG = path
          QMAKE_LIBTOOL_INSTALL_REPLACE += ltlib_replace
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
new file mode 100644
index 0000000..4c2b8f4
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -0,0 +1,36 @@
+From c2dd082f147310ceae5338158aa68198a23b78d8 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 25 Aug 2015 10:05:15 -0400
+Subject: [PATCH 5/8] configure: bump path length from 256 to 512 characters
+
+Increase the path length that gets hardcoded into generated config.cpp file
+from 256 to 512 characters, as nativesdk path can be quite long.
+
+Also update length of EXT_PREFIX and HOST_PREFIX now.
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ configure | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure b/configure
+index dbfd63c..8136485 100755
+--- a/configure
++++ b/configure
+@@ -3912,10 +3912,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+ static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
+ 
+ /* Installation Info */
+-static const char qt_configure_prefix_path_str       [256 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
++static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
+ #ifdef QT_BUILD_QMAKE
+-static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
+-static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
++static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
++static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
+ #endif
+ 
+ static const short qt_configure_str_offsets[] = {
+-- 
+2.6.1
+
diff --git a/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
deleted file mode 100644
index 64f29a5..0000000
--- a/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 168690a50a5d8bb1068d254532710cec8c93a08f Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 19 Mar 2014 18:32:28 +0100
-Subject: [PATCH 05/10] qeglplatformintegration: Undefine CursorShape from X.h
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/platformsupport/eglconvenience/qeglplatformintegration_p.h | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/src/platformsupport/eglconvenience/qeglplatformintegration_p.h b/src/platformsupport/eglconvenience/qeglplatformintegration_p.h
-index 42fbf8c..8950f2d 100644
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
- class QEGLPlatformWindow;
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
new file mode 100644
index 0000000..67187c5
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
@@ -0,0 +1,157 @@
+From 69a648940fb408ac1643bbb183282fe43b9848d1 Mon Sep 17 00:00:00 2001
+From: Jani Hautakangas <jani.hautakangas@ixonos.com>
+Date: Thu, 16 May 2013 09:52:07 +0300
+Subject: [PATCH 6/8] QOpenGLPaintDevice sub-area support
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
+index 17a3277..85425da 100644
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
+@@ -216,6 +222,11 @@ QOpenGLContext *QOpenGLPaintDevice::context() const
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
+index 804e485..88b481a 100644
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
+index 54ea092..f660143 100644
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
+index 4836dde..3f99b16 100644
+--- a/src/gui/opengl/qopenglpaintengine.cpp
++++ b/src/gui/opengl/qopenglpaintengine.cpp
+@@ -2091,7 +2091,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
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
+@@ -2178,7 +2181,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
+         d->device->ensureActiveTarget();
+ 
+         d->transferMode(BrushDrawingMode);
+-        d->funcs.glViewport(0, 0, d->width, d->height);
++        d->funcs.glViewport(d->x, d->y, d->width, d->height);
+         d->needsSync = false;
+         d->shaderManager->setDirty();
+         d->syncGlState();
+@@ -2220,6 +2223,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
+     if (bounds == QRect(0, 0, width, height)) {
+         funcs.glDisable(GL_SCISSOR_TEST);
+     } else {
++        bounds = QRect(bounds.x(), bounds.y(), bounds.width(), bounds.height());
+         funcs.glEnable(GL_SCISSOR_TEST);
+         setScissor(bounds);
+     }
+@@ -2228,12 +2232,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
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
+index 17be72b..43e88f6 100644
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
+index c179143..fad68d5 100644
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
+2.6.1
+
diff --git a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
deleted file mode 100644
index 6fd8b2b..0000000
--- a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 3c6cdb9c315e8457b8d191c0f1192499e8edc009 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 25 Aug 2015 10:05:15 -0400
-Subject: [PATCH 06/10] configure: bump path length from 256 to 512 characters
-
-Increase the path length that gets hardcoded into generated config.cpp file
-from 256 to 512 characters, as nativesdk path can be quite long.
-
-Also update length of EXT_PREFIX and HOST_PREFIX now.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure b/configure
-index a757ce5..f0f42ab 100755
---- a/configure
-+++ b/configure
-@@ -3863,10 +3863,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
- static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
- 
- /* Installation Info */
--static const char qt_configure_prefix_path_str       [256 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
-+static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
- #ifdef QT_BUILD_QMAKE
--static const char qt_configure_ext_prefix_path_str   [256 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
--static const char qt_configure_host_prefix_path_str  [256 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
-+static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
-+static const char qt_configure_host_prefix_path_str  [512 + 12] = "qt_hpfxpath=$QT_HOST_PREFIX";
- #endif
- 
- static const short qt_configure_str_offsets[] = {
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase/0007-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0007-Always-build-uic.patch
new file mode 100644
index 0000000..d082b36
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0007-Always-build-uic.patch
@@ -0,0 +1,31 @@
+From d8a2796e04e3ec6ea4a5e1acdb503cae260809e2 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 16 Nov 2013 00:32:30 +0100
+Subject: [PATCH 7/9] Always build uic
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
+index 07ace99..1e165fc 100644
+--- a/src/src.pro
++++ b/src/src.pro
+@@ -182,7 +182,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+         }
+     }
+ }
+-SUBDIRS += src_plugins src_tools_qdoc
++SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
+ 
+ nacl: SUBDIRS -= src_network src_testlib
+ 
+-- 
+2.6.1
+
diff --git a/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
deleted file mode 100644
index 28ecfd5..0000000
--- a/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From d68aa317015ca452b7097b267e5a1fa576aaa5e8 Mon Sep 17 00:00:00 2001
-From: Jani Hautakangas <jani.hautakangas@ixonos.com>
-Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 07/10] QOpenGLPaintDevice sub-area support
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
-index c0657fe..395ec14 100644
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
-index 804e485..88b481a 100644
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
-index 57d93ee..5b5c0d9 100644
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
-index a9a4ada..de3c518 100644
---- a/src/gui/opengl/qopenglpaintengine.cpp
-+++ b/src/gui/opengl/qopenglpaintengine.cpp
-@@ -2091,7 +2091,10 @@ bool QOpenGL2PaintEngineEx::begin(QPaintDevice *pdev)
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
-@@ -2178,7 +2181,7 @@ void QOpenGL2PaintEngineEx::ensureActive()
-         d->device->ensureActiveTarget();
- 
-         d->transferMode(BrushDrawingMode);
--        d->funcs.glViewport(0, 0, d->width, d->height);
-+        d->funcs.glViewport(d->x, d->y, d->width, d->height);
-         d->needsSync = false;
-         d->shaderManager->setDirty();
-         d->syncGlState();
-@@ -2220,6 +2223,7 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
-     if (bounds == QRect(0, 0, width, height)) {
-         funcs.glDisable(GL_SCISSOR_TEST);
-     } else {
-+        bounds = QRect(bounds.x(), bounds.y(), bounds.width(), bounds.height());
-         funcs.glEnable(GL_SCISSOR_TEST);
-         setScissor(bounds);
-     }
-@@ -2228,12 +2232,13 @@ void QOpenGL2PaintEngineExPrivate::updateClipScissorTest()
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
-index 17be72b..43e88f6 100644
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
-index c179143..fad68d5 100644
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
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase/0007-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0007-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
new file mode 100644
index 0000000..472bcf6
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0007-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -0,0 +1,68 @@
+From 0e8ac1a88ed367c57e960f4217c2f6ac1dedf2fa Mon Sep 17 00:00:00 2001
+From: Michael Krelin <hacker@klever.net>
+Date: Mon, 29 Oct 2012 20:07:49 -0700
+Subject: [PATCH 7/8] qmake: don't build it in configure, but allow to build it
+ separately
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
+index 8136485..232b6c4 100755
+--- a/configure
++++ b/configure
+@@ -3991,7 +3991,7 @@ setBootstrapEvalVariable()
+ 
+ 
+ # build qmake
+-if true; then ###[ '!' -f "$outpath/bin/qmake" ];
++if false; then ###[ '!' -f "$outpath/bin/qmake" ];
+     echo "Creating qmake..."
+ 
+     mkdir -p "$outpath/qmake" || exit
+diff --git a/qmake/qmake.pri b/qmake/qmake.pri
+index 782151d..4b314a8 100644
+--- a/qmake/qmake.pri
++++ b/qmake/qmake.pri
+@@ -80,7 +80,8 @@ bootstrap { #Qt code
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
+2.6.1
+
diff --git a/recipes-qt/qt5/qtbase/0008-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0008-Add-external-hostbindir-option-for-native-sdk.patch
new file mode 100644
index 0000000..eec2cd2
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0008-Add-external-hostbindir-option-for-native-sdk.patch
@@ -0,0 +1,134 @@
+From 3b7b349bb1627eea3c9979d3edb32d50c00bbde7 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Sat, 6 Apr 2013 13:15:07 +0200
+Subject: [PATCH 8/9] Add -external-hostbindir option for native(sdk)
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
+
+Conflicts:
+        tools/configure/configureapp.cpp
+---
+ configure                           |  1 +
+ qmake/property.cpp                  |  1 +
+ src/corelib/global/qlibraryinfo.cpp |  3 ++-
+ src/corelib/global/qlibraryinfo.h   |  1 +
+ tools/configure/configureapp.cpp    | 11 +++++++++++
+ 5 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 8136485..e2799e2 100755
+--- a/configure
++++ b/configure
+@@ -3895,6 +3895,7 @@ addConfStr "$CFG_SYSROOT"
+ addConfStr "$QT_REL_HOST_BINS"
+ addConfStr "$QT_REL_HOST_LIBS"
+ addConfStr "$QT_REL_HOST_DATA"
++addConfStr "$QT_EXTERNAL_HOST_BINS"
+ addConfStr "$shortxspec"
+ addConfStr "$shortspec"
+ 
+diff --git a/qmake/property.cpp b/qmake/property.cpp
+index 817ae95..c69539f 100644
+--- a/qmake/property.cpp
++++ b/qmake/property.cpp
+@@ -68,6 +68,7 @@ static const struct {
+     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
+     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
+     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
++    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
+     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
+     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
+ };
+diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
+index c3b5c2d..1381658 100644
+--- a/src/corelib/global/qlibraryinfo.cpp
++++ b/src/corelib/global/qlibraryinfo.cpp
+@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
+  */
+ 
+ static const struct {
+-    char key[19], value[13];
++    char key[21], value[13];
+ } qtConfEntries[] = {
+     { "Prefix", "." },
+     { "Documentation", "doc" }, // should be ${Data}/doc
+@@ -398,6 +398,7 @@ static const struct {
+     { "HostBinaries", "bin" },
+     { "HostLibraries", "lib" },
+     { "HostData", "." },
++    { "ExternalHostBinaries", "" },
+     { "TargetSpec", "" },
+     { "HostSpec", "" },
+     { "HostPrefix", "" },
+diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
+index 1ad7637..5a8b127 100644
+--- a/src/corelib/global/qlibraryinfo.h
++++ b/src/corelib/global/qlibraryinfo.h
+@@ -81,6 +81,7 @@ public:
+         HostBinariesPath,
+         HostLibrariesPath,
+         HostDataPath,
++        ExternalHostBinariesPath,
+         TargetSpecPath,
+         HostSpecPath,
+         HostPrefixPath,
+diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
+index 1fdc4bb..fca006b 100644
+--- a/tools/configure/configureapp.cpp
++++ b/tools/configure/configureapp.cpp
+@@ -1243,6 +1243,13 @@ void Configure::parseCmdLine()
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
+@@ -4205,6 +4212,9 @@ void Configure::generateQConfigCpp()
+ 
+     if (dictionary["QT_REL_HOST_DATA"].isEmpty())
+         dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
++    
++    if (dictionary["QT_EXTERNAL_HOST_BINS"].isEmpty())
++        dictionary["QT_EXTERNAL_HOST_BINS"] = haveHpx ? "bin" : dictionary["QT_REL_INSTALL_BINS"];
+ 
+     confStringOff = 0;
+     addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
+@@ -4224,6 +4234,7 @@ void Configure::generateQConfigCpp()
+     addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
+     addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
+     addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
++    addConfStr(1, dictionary["QT_EXTERNAL_HOST_BINS"]);
+     addConfStr(1, targSpec);
+     addConfStr(1, hostSpec);
+ 
+-- 
+2.6.1
+
diff --git a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
deleted file mode 100644
index b2a478d..0000000
--- a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From cbd61cc5f4c447a9539e0a6a1dd378ac34471aff Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 08/10] Always build uic
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
-index 61e5ce2..a4047aa 100644
---- a/src/src.pro
-+++ b/src/src.pro
-@@ -182,7 +182,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
-         }
-     }
- }
--SUBDIRS += src_plugins src_tools_qdoc
-+SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
- 
- nacl: SUBDIRS -= src_network src_testlib
- 
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase/0008-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0008-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
new file mode 100644
index 0000000..a4f791f
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0008-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -0,0 +1,36 @@
+From ef265171a5531f626f2aa29dd694b028fe478a37 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Jun 2015 13:59:25 -0700
+Subject: [PATCH 8/8] linux-oe-g++: Invert conditional for defining
+ QT_SOCKLEN_T
+
+This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
+only when its glibc < 2 and not also for the libraries which may define
+it as per standards but are not glibc, e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mkspecs/linux-oe-g++/qplatformdefs.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
+index dd12003..8623651 100644
+--- a/mkspecs/linux-oe-g++/qplatformdefs.h
++++ b/mkspecs/linux-oe-g++/qplatformdefs.h
+@@ -86,10 +86,10 @@
+ 
+ #undef QT_SOCKLEN_T
+ 
+-#if defined(__GLIBC__) && (__GLIBC__ >= 2)
+-#define QT_SOCKLEN_T            socklen_t
+-#else
++#if defined(__GLIBC__) && (__GLIBC__ < 2)
+ #define QT_SOCKLEN_T            int
++#else
++#define QT_SOCKLEN_T            socklen_t
+ #endif
+ 
+ #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
+-- 
+2.6.1
+
diff --git a/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
deleted file mode 100644
index 3ba6641..0000000
--- a/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 3442aad5295956c1a177bdf7ab73e1f0d86ab5fc Mon Sep 17 00:00:00 2001
-From: Michael Krelin <hacker@klever.net>
-Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 08/10] qmake: don't build it in configure, but allow to build
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
-index f0f42ab..6f338f3 100755
---- a/configure
-+++ b/configure
-@@ -3942,7 +3942,7 @@ setBootstrapEvalVariable()
- 
- 
- # build qmake
--if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-+if false; then ###[ '!' -f "$outpath/bin/qmake" ];
-     echo "Creating qmake..."
- 
-     mkdir -p "$outpath/qmake" || exit
-diff --git a/qmake/qmake.pri b/qmake/qmake.pri
-index 782151d..4b314a8 100644
---- a/qmake/qmake.pri
-+++ b/qmake/qmake.pri
-@@ -80,7 +80,8 @@ bootstrap { #Qt code
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
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
deleted file mode 100644
index 683cf27..0000000
--- a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
+++ /dev/null
@@ -1,134 +0,0 @@
-From 12d06b2c5857a1c9cac4c964f32a582d029e9dfa Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 09/10] Add -external-hostbindir option for native(sdk)
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
-
-Conflicts:
-        tools/configure/configureapp.cpp
----
- configure                           |  1 +
- qmake/property.cpp                  |  1 +
- src/corelib/global/qlibraryinfo.cpp |  3 ++-
- src/corelib/global/qlibraryinfo.h   |  1 +
- tools/configure/configureapp.cpp    | 11 +++++++++++
- 5 files changed, 16 insertions(+), 1 deletion(-)
-
-diff --git a/configure b/configure
-index f0f42ab..04fd1ba 100755
---- a/configure
-+++ b/configure
-@@ -3846,6 +3846,7 @@ addConfStr "$CFG_SYSROOT"
- addConfStr "$QT_REL_HOST_BINS"
- addConfStr "$QT_REL_HOST_LIBS"
- addConfStr "$QT_REL_HOST_DATA"
-+addConfStr "$QT_EXTERNAL_HOST_BINS"
- addConfStr "$shortxspec"
- addConfStr "$shortspec"
- 
-diff --git a/qmake/property.cpp b/qmake/property.cpp
-index 817ae95..c69539f 100644
---- a/qmake/property.cpp
-+++ b/qmake/property.cpp
-@@ -68,6 +68,7 @@ static const struct {
-     { "QT_HOST_DATA", QLibraryInfo::HostDataPath, true },
-     { "QT_HOST_BINS", QLibraryInfo::HostBinariesPath, true },
-     { "QT_HOST_LIBS", QLibraryInfo::HostLibrariesPath, true },
-+    { "QT_EXTERNAL_HOST_BINS", QLibraryInfo::ExternalHostBinariesPath, true },
-     { "QMAKE_SPEC", QLibraryInfo::HostSpecPath, true },
-     { "QMAKE_XSPEC", QLibraryInfo::TargetSpecPath, true },
- };
-diff --git a/src/corelib/global/qlibraryinfo.cpp b/src/corelib/global/qlibraryinfo.cpp
-index c3b5c2d..1381658 100644
---- a/src/corelib/global/qlibraryinfo.cpp
-+++ b/src/corelib/global/qlibraryinfo.cpp
-@@ -373,7 +373,7 @@ QLibraryInfo::isDebugBuild()
-  */
- 
- static const struct {
--    char key[19], value[13];
-+    char key[21], value[13];
- } qtConfEntries[] = {
-     { "Prefix", "." },
-     { "Documentation", "doc" }, // should be ${Data}/doc
-@@ -398,6 +398,7 @@ static const struct {
-     { "HostBinaries", "bin" },
-     { "HostLibraries", "lib" },
-     { "HostData", "." },
-+    { "ExternalHostBinaries", "" },
-     { "TargetSpec", "" },
-     { "HostSpec", "" },
-     { "HostPrefix", "" },
-diff --git a/src/corelib/global/qlibraryinfo.h b/src/corelib/global/qlibraryinfo.h
-index 1ad7637..5a8b127 100644
---- a/src/corelib/global/qlibraryinfo.h
-+++ b/src/corelib/global/qlibraryinfo.h
-@@ -81,6 +81,7 @@ public:
-         HostBinariesPath,
-         HostLibrariesPath,
-         HostDataPath,
-+        ExternalHostBinariesPath,
-         TargetSpecPath,
-         HostSpecPath,
-         HostPrefixPath,
-diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 3bf0546..53bf146 100644
---- a/tools/configure/configureapp.cpp
-+++ b/tools/configure/configureapp.cpp
-@@ -1217,6 +1217,13 @@ void Configure::parseCmdLine()
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
-@@ -4101,6 +4108,9 @@ void Configure::generateQConfigCpp()
- 
-     if (dictionary["QT_REL_HOST_DATA"].isEmpty())
-         dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
-+    
-+    if (dictionary["QT_EXTERNAL_HOST_BINS"].isEmpty())
-+        dictionary["QT_EXTERNAL_HOST_BINS"] = haveHpx ? "bin" : dictionary["QT_REL_INSTALL_BINS"];
- 
-     confStringOff = 0;
-     addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4120,6 +4130,7 @@ void Configure::generateQConfigCpp()
-     addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
-     addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
-     addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
-+    addConfStr(1, dictionary["QT_EXTERNAL_HOST_BINS"]);
-     addConfStr(1, targSpec);
-     addConfStr(1, hostSpec);
- 
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase/0009-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0009-configure-preserve-built-qmake-and-swap-with-native-.patch
new file mode 100644
index 0000000..cd09f4f
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0009-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -0,0 +1,29 @@
+From 5305d1175e89f24d0e2e117d1581d3e1658df99c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 11 Nov 2013 20:22:34 -0500
+Subject: [PATCH 9/9] configure: preserve built qmake and swap with native one
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
+index e2799e2..b5c0164 100755
+--- a/configure
++++ b/configure
+@@ -4164,6 +4164,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+         echo "Done."
+     fi
+ fi # Build qmake
++mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
++mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
+ 
+ echo "Running configuration tests (phase 2)..."
+ 
+-- 
+2.6.1
+
diff --git a/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
deleted file mode 100644
index 2650337..0000000
--- a/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 8ed228de093947c176cd1d8984a61e3b338bbe66 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 8 Jun 2015 13:59:25 -0700
-Subject: [PATCH 09/10] linux-oe-g++: Invert conditional for defining
- QT_SOCKLEN_T
-
-This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
-only when its glibc < 2 and not also for the libraries which may define
-it as per standards but are not glibc, e.g. musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- mkspecs/linux-oe-g++/qplatformdefs.h | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/mkspecs/linux-oe-g++/qplatformdefs.h b/mkspecs/linux-oe-g++/qplatformdefs.h
-index dd12003..8623651 100644
---- a/mkspecs/linux-oe-g++/qplatformdefs.h
-+++ b/mkspecs/linux-oe-g++/qplatformdefs.h
-@@ -86,10 +86,10 @@
- 
- #undef QT_SOCKLEN_T
- 
--#if defined(__GLIBC__) && (__GLIBC__ >= 2)
--#define QT_SOCKLEN_T            socklen_t
--#else
-+#if defined(__GLIBC__) && (__GLIBC__ < 2)
- #define QT_SOCKLEN_T            int
-+#else
-+#define QT_SOCKLEN_T            socklen_t
- #endif
- 
- #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
deleted file mode 100644
index 83f5b58..0000000
--- a/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 02f14a8fc5513f47d185ad04e6b1b82f3d642e67 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 11 Nov 2013 20:22:34 -0500
-Subject: [PATCH 10/10] configure: preserve built qmake and swap with native
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
-index 04fd1ba..8914e9c 100755
---- a/configure
-+++ b/configure
-@@ -4112,6 +4112,8 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
-         echo "Done."
-     fi
- fi # Build qmake
-+mv "$outpath/bin/qmake" "$outpath/bin/qmake-real"
-+mv "$outpath/bin/qmake-native" "$outpath/bin/qmake"
- 
- echo "Running configuration tests..."
- 
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch b/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
deleted file mode 100644
index ed661a4..0000000
--- a/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From fc9f9217495738cbffab34f23dc61bd51fdea952 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Sat, 12 Sep 2015 12:58:46 +0200
-Subject: [PATCH 10/10] qeglplatformscreen.cpp: reorder headers to fix build
- with egl enabled
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fixes:
-In file included from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/X11/Xlib.h:44:0,
-                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglvivante.h:244,
-                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/eglplatform.h:38,
-                 from /home/superandy/tmp/oe-core-glibc/sysroots/varsomimx6q/usr/include/EGL/egl.h:39,
-                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen_p.h:52,
-                 from /home/superandy/tmp/oe-core-glibc/work/cortexa9t2hf-vfp-neon-mx6qdl-angstrom-linux-gnueabi/qtbase/5.5.0+gitAUTOINC+2fde9f59ee-r0/git/src/platformsupport/eglconvenience/qeglplatformscreen.cpp:34:
-../../include/QtCore/../../../git/src/corelib/io/qurl.h:131:9: error: expected identifier before numeric constant
-         None = 0x0,
-         ^
-
-This patch has a very limited lifetime: In branch dev and 5.6 the patched file is gone. Therefore:
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/platformsupport/eglconvenience/qeglplatformscreen.cpp | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
-index 61f8cdd..ceec797 100644
---- a/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
-+++ b/src/platformsupport/eglconvenience/qeglplatformscreen.cpp
-@@ -31,10 +31,10 @@
- **
- ****************************************************************************/
- 
--#include "qeglplatformscreen_p.h"
--#include "qeglplatformwindow_p.h"
- #include <QtGui/qwindow.h>
- #include <qpa/qwindowsysteminterface.h>
-+#include "qeglplatformscreen_p.h"
-+#include "qeglplatformwindow_p.h"
- #include <QtPlatformSupport/private/qopenglcompositor_p.h>
- 
- QT_BEGIN_NAMESPACE
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 4cffccf..1af7c33 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -16,16 +16,14 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0007-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
 "
 
 # specific for target qtbase
 SRC_URI += "\
-    file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
-    file://0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch \
+    file://0007-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
+    file://0008-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -279,4 +277,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
+SRCREV = "3cae29b746df804ddfa37a3e27b48bd89686d2c1"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 9678a60..8a14555 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "9a714258f32a6a5318eb461903af25f64b7c80d2"
+SRCREV = "3534d9a6fa7d1d2034963732e22081182864ae83"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 84360e8..b874d91 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -22,4 +22,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "cf8b244f94fdabf5c960d82c4bbcbf13c91c29b1"
+SRCREV = "b3fbfe3f525c2b5f97e2dbcf2ffbbcd6ae94c0ff"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index 1a4b5c5..fd2586e 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From 54fca19532b5224e8f79d7a010f2654ee196d326 Mon Sep 17 00:00:00 2001
+From d5e0c3af853c7bdb202f15a12117db76f744cc55 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 5ea5323..59131e5 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -33,6 +33,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "3e9f61f305dc4c988e6f2718df56df80f639734e"
+SRCREV = "bb28b13d51648a51244e49e30426cd6ca9ac3e08"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 47f2a1d..5c0a373 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,5 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-QT_MODULE_BRANCH = "1.2"
-SRCREV = "e32bcb7b714454f9167c4d49776a95c9a5799d70"
+SRCREV = "6702506920e61fe7af38222928528553c5a1f167"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index e707dee..36b3e91 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "9aa0edc6d13d20796feb1712883eddb7cd411ecd"
+SRCREV = "859c89fb98154d87e856dce575ff8979218f5fb6"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 4d0402f..a112439 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From 464c01a76acdde344248a873f63c5016d0258a31 Mon Sep 17 00:00:00 2001
+From 903682bb95cc2cdb51a1155c3977d0ec8619a73d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 85a1dce..febaa90 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "3c68f26c052b06da9b43bb775cbe5a539fccb0c3"
+SRCREV = "bdc2df1a04f65c35651ad962f12723e177f4bd2f"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 63642aa..f85c5ed 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "63b118c7da215d994e1695797fd44c2ad35298c3"
+SRCREV = "cd543e15c12c838eb0b30fc1d656bdebda13b324"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index d4601d7..696f1c0 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From 64ad5e10c41e234151d18e71bfa315c7906eba16 Mon Sep 17 00:00:00 2001
+From 066a997479b2431d7bc479655ce37ae083e7a224 Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index faf05d4..2554717 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "0cf41ef53f7b336509ed7d1ae6518655276af70f"
+SRCREV = "f5235af0dc3aa433435dbd42b716776097af5acf"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index edd47f6..e1fbb56 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -24,4 +24,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "f079636a3ee5538eb79fd4e7e6ffcb0465a015a0"
+SRCREV = "b0382acf65dbc0debcb7cf956ba954117a682d90"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 54de87c..404de3e 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,4 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "61889f06fa828b483513b8315b4f0870532ece66"
+SRCREV = "d7f3ab35deeed07404990591d232b559ac960c61"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index b07675f..97fbc13 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -26,4 +26,4 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "50446e4edb0360871309a5d72a9a873f45fb17bd"
+SRCREV = "021a503205caf1c645aca0610f3b6fc07a17f998"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index e495c5b..aefcfec 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "6a16281aceedb713676e16c3074e6f7ea1e70b79"
+SRCREV = "d8e357f75a05bce5e1286c94e2b1954f6591218e"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 53e6069..11055d3 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "ad108e9d56e7838eac3726e0492a246086d53e70"
+SRCREV = "8fe85944e6e17691cfa0d230af37ca2be6781cee"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index dc0bd5f..cc02150 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "b5d689eaafd1e243d38f4df30f2d35eaab8b3b44"
+SRCREV = "daca60175f2401f54709be610f999ab6e4444411"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 7e36e80..27d2bff 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -28,6 +28,6 @@ do_install_append() {
 QT_MODULE_BRANCH = "dev"
 
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
-# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.5
+# qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
 
 SRCREV = "0577ffca58b7fed78c1820fc1c2b7ab3533d5698"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index e1255d8..fdb99d4 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 922931781bd4fd765de996f1709aff95b6ac3fba Mon Sep 17 00:00:00 2001
+From 3209dbfc50632a69f1d0bab880a77527fe1f2473 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/4] Allow to build only lrelease + lupdate + lconvert
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 3116b3d..a8a5a3d 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 83493e0f4e0d8b4dbf1da982e4459fefea61c582 Mon Sep 17 00:00:00 2001
+From b85a42c467fd2b5b56342b84c70620a12237d334 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/4] assistant/help: fix linking of dependent libraries
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index a0306e5..ca9fa57 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From ad5e4266eda956a1ff408bf3fe875badc5f4c866 Mon Sep 17 00:00:00 2001
+From 3a63c4102b8283aaed57aee834d05765fb3117d7 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/4] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index ce4a0b7..aceae2a 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From e9e9a79d1a58981dd33d18c0f43b1fb982100a61 Mon Sep 17 00:00:00 2001
+From dc4ee28483fabb6d50d531101c0c95becbc561a4 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH 4/4] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index ff95b85..d6ee134 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -32,6 +32,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "02402887562f55b822fd29a64437da3d1252fd5b"
+SRCREV = "a7ff0d7d9ac2ff17e540521ef59029bf5cb35e14"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 673e25d..fb584ab 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -99,4 +99,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "6fbc830e0ebeb66a5570e8c432c27658670cd071"
+SRCREV = "9c6d1af76ac28de8d59be344ea3a21b2607fa118"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index b351b38..ac7c01e 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "9d408649458a274864ae2e7c2d67b4fa3cabbfcd"
+SRCREV = "a727ee0b2f1044ad8d5689208aed3f469b8de1ba"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index caaceef..8b539b6 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 7d40a551397f9914cacd5470bf17ac40a7b7330b Mon Sep 17 00:00:00 2001
+From 7c34dff33e7669e9227df548c8ab08a850c72e39 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 384c1fa..27dada2 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From d1de302c09ddbb4baac4bc781a6d53de11f387b3 Mon Sep 17 00:00:00 2001
+From e3469724404a8afaa51939e17fc85f6cb40b5196 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 2ea3285..71237d3 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -46,4 +46,4 @@ do_install_append() {
     install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
 }
 
-SRCREV = "9d408649458a274864ae2e7c2d67b4fa3cabbfcd"
+SRCREV = "a727ee0b2f1044ad8d5689208aed3f469b8de1ba"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index aa7cb25..1cc084e 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "906d910415454d64ff0b021b06f0df422a8c82bd"
+SRCREV = "459a6ad0ae963b30c484a14b8cb910a29e1b1dcb"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index 062d9ed..b6500ea 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,8 +1,8 @@
-From 2a264c2ea7080b026ea1ec85f6317de13c5a6f4f Mon Sep 17 00:00:00 2001
+From 53e16d6f07005c1176455a4488cd8f93218e3cde Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH 1/2] <chromium> base.gypi: include
- atomicops_internals_x86_gcc.cc when building for x64 arch
+Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
+ when building for x64 arch
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
-index a5a285a..f1cad86 100644
+index b860735..0ed5de3 100644
 --- a/src/3rdparty/chromium/base/base.gypi
 +++ b/src/3rdparty/chromium/base/base.gypi
-@@ -759,7 +759,7 @@
+@@ -785,7 +785,7 @@
                  ['include', '^nix/'],
                ],
            }],
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 02381e0..e9283e3 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,7 +1,7 @@
-From cf7f63dfcf71b7baee30112ef73fed67504033f7 Mon Sep 17 00:00:00 2001
+From db3ba87b8022984409f028b66ebe632aff5457e2 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/4] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+Subject: [PATCH 1/3] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
  anywhere in path, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 64064bd..8287c8f 100644
+index 3a86beb..7505d09 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -105,9 +105,9 @@ defineReplace(mocOutput) {
+@@ -113,9 +113,9 @@ defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
    for(ext, $$list($${QMAKE_EXT_CPP})): \
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
deleted file mode 100644
index ae91cd2..0000000
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From b534874479a150d1fef4e0a4fb79a176d0a342eb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 27 Jun 2015 13:29:52 -0700
-Subject: [PATCH 2/2] chromium/third_party/boringssl: Demand for newer POSIX
- macro
-
-Reason for change: Define _POSIX_C_SOURCE such that it demands correct
-posix interfaces, netdb.h declares interfaces such as
-getaddrinfo if __USE_POSIX, i.e. POSIX.1:1990 or later.
-However, these interfaces were new in the 2001 edition of POSIX
-therefore ask for Extension from POSIX.1:2001 since we use addrinfo
-structure here.
-
-Change-Id: Icb1c92745d1a0ca958108ae80c270c630628729e
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Reviewed-on: https://boringssl-review.googlesource.com/5253
-Reviewed-by: Adam Langley <agl@google.com>
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c b/src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c
-index ba65a1a..66c3976 100644
---- a/src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c
-+++ b/src/3rdparty/chromium/third_party/boringssl/src/crypto/bio/socket_helper.c
-@@ -12,7 +12,7 @@
-  * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
-  * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE. */
- 
--#define _POSIX_SOURCE
-+#define _POSIX_C_SOURCE 200112L
- 
- #include <openssl/bio.h>
- #include <openssl/err.h>
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 2ba8fec..09dc102 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,7 +1,7 @@
-From 7f81bad8fcd00afcf2214285856d46f50f91b55c Mon Sep 17 00:00:00 2001
+From ab284b45d8fa1228bd8b66ee47dc7186becb6a95 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH 2/4] functions.prf: Make sure we only use the file name to
+Subject: [PATCH 2/3] functions.prf: Make sure we only use the file name to
  generate it's moc'ed abbreviation
 
 Signed-off-by: Simon Busch <morphis@gravedo.de>
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 8287c8f..04bdba5 100644
+index 7505d09..e9362dd 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -102,7 +102,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -110,7 +110,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 23be489..b8a6345 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From a7bb8e37abb3a11e6257d6e154d33c7af5856dcc Mon Sep 17 00:00:00 2001
+From 947f25bfb16052b92d469fa754ca3884c9aaed7c Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH 3/4] functions.prf: allow build for linux-oe-g++ platform
+Subject: [PATCH 3/3] functions.prf: allow build for linux-oe-g++ platform
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -12,18 +12,18 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 04bdba5..4206661 100644
+index e9362dd..383c030 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -14,7 +14,7 @@ defineTest(isPlatformSupported) {
+@@ -22,7 +22,7 @@ defineTest(isPlatformSupported) {
  
    linux-g++*:!isGCCVersionSupported(): return(false)
    !isPythonVersionSupported(): return(false)
--  linux-g++*|win32-msvc2013|macx-clang*: return(true)
-+  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang*: return(true)
+-  linux-g++*|linux-clang|win32-msvc2013|macx-clang*: return(true)
++  inux-oe-g++*|linux-g++*|linux-clang|win32-msvc2013|macx-clang*: return(true)
    boot2qt: return(true)
  
-   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
+   skipBuild("Qt WebEngine can currently only be built for Linux (GCC/clang), Windows (MSVC 2013), OS X (10.9/XCode 5.1+) or Qt for Device Creation.")
 -- 
 2.6.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch b/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch
deleted file mode 100644
index 037b0e4..0000000
--- a/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 324eab1b148df1e8330b2dbbd114ab696c163e46 Mon Sep 17 00:00:00 2001
-From: Samuli Piippo <samuli.piippo@theqtcompany.com>
-Date: Mon, 11 May 2015 13:47:06 +0300
-Subject: [PATCH 4/4] Generate usable qmake_extras.gypi
-
-Running qmake recursively does not take .depends into account, so
-the SUBDIRS need to be in correct order so that qmake_extras.gypi
-is used for the ninja files. Do no try to write compiler tools as
-it will break the build.
-
-Task-number: QTBUG-45706
-Upstream-Status: Pending
----
- src/core/core.pro                 | 7 ++++---
- src/core/gyp_configure_host.pro   | 3 ---
- src/core/gyp_configure_target.pro | 3 ---
- 3 files changed, 4 insertions(+), 9 deletions(-)
-
-diff --git a/src/core/core.pro b/src/core/core.pro
-index cf00f39..747b711 100644
---- a/src/core/core.pro
-+++ b/src/core/core.pro
-@@ -12,9 +12,7 @@ gyp_run.depends = core_gyp_generator
- core_module.file = core_module.pro
- core_module.depends = gyp_run
- 
--SUBDIRS += core_gyp_generator \
--           gyp_run \
--           core_module
-+SUBDIRS += core_gyp_generator
- 
- !win32 {
-     # gyp_configure_host.pro and gyp_configure_target.pro are phony pro files that
-@@ -28,3 +26,6 @@ SUBDIRS += core_gyp_generator \
-     gyp_run.depends += gyp_configure_host gyp_configure_target
-     SUBDIRS += gyp_configure_host gyp_configure_target
- }
-+
-+SUBDIRS += gyp_run \
-+           core_module
-diff --git a/src/core/gyp_configure_host.pro b/src/core/gyp_configure_host.pro
-index eb94cb8..859bcbf 100644
---- a/src/core/gyp_configure_host.pro
-+++ b/src/core/gyp_configure_host.pro
-@@ -6,9 +6,6 @@ option(host_build)
- 
- GYPI_CONTENTS = "{" \
-                 "  'make_global_settings': [" \
--                "    ['CC.host', '$$which($$QMAKE_CC)']," \
--                "    ['CXX.host', '$$which($$QMAKE_CXX)']," \
--                "    ['LD.host', '$$which($$QMAKE_LINK)'],"
- 
- GYPI_FILE = $$OUT_PWD/qmake_extras.gypi
- !build_pass {
-diff --git a/src/core/gyp_configure_target.pro b/src/core/gyp_configure_target.pro
-index 2a59966..317d24a 100644
---- a/src/core/gyp_configure_target.pro
-+++ b/src/core/gyp_configure_target.pro
-@@ -3,9 +3,6 @@ TEMPLATE = aux
- 
- TOOLCHAIN_INCLUDES = $${QMAKE_INCDIR_EGL} $${INCLUDEPATH} $${QMAKE_INCDIR}
- 
--GYPI_CONTENTS += "    ['CC', '$$which($$QMAKE_CC)']," \
--                 "    ['CXX', '$$which($$QMAKE_CXX)']," \
--                 "    ['LD', '$$which($$QMAKE_LINK)'],"
- GYPI_CONTENTS += "  ]," \
-                  "  'target_defaults': {" \
-                  "    'target_conditions': [" \
--- 
-2.6.1
-
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index fe92338..cbd4236 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -71,19 +71,17 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "40.0.2214-based"
+QT_MODULE_BRANCH_CHROMIUM = "45-based"
 
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
     file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-    file://0004-Generate-usable-qmake_extras.gypi.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
-    file://0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch \
 "
-SRCREV_qtwebengine = "ce095e94b686196629244073990530441b9b5f4f"
-SRCREV_chromium = "146ebe26dce3289eb440bed7d5d0a7988ff5f5c9"
+SRCREV_qtwebengine = "0e9555838c83ccf5a6a28ee99d6fd556ebf5b3b2"
+SRCREV_chromium = "9409dd36053110043e048ebdc5ded4c72f26f479"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
index eb90a06..3034f95 100644
--- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
+++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
@@ -1,4 +1,4 @@
-From 9097d1fe3b21df880ec799414aeab78e62f032d2 Mon Sep 17 00:00:00 2001
+From 8900f45818b7f181d2b57ceebdf086c78d2ee6b0 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 8 Oct 2013 00:18:10 -0400
 Subject: [PATCH] qtwebkit-examples: enable building examples by default
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 3e89d80..f915083 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -21,4 +21,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "df729f9f284df2d30db432de351e7e80360097c8"
+SRCREV = "7988aecdbcb07f3a214c2c804a39db3fc5617844"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 66dfd13..33e7dd2 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From d765da41bafa8349d4c64a74a841ebe3b2fb9443 Mon Sep 17 00:00:00 2001
+From a5aae8adf808bb07b0326edbf2dc66bfb4917963 Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH 1/3] qtwebkit: fix QA issue (bad RPATH)
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index 3d4ba18..3c3b489 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,4 +1,4 @@
-From 05e0ba998775d92bd3c0701cd5e290815700e3f4 Mon Sep 17 00:00:00 2001
+From 08e983e065acce369aa95e3fcb5b7fe6ca563e04 Mon Sep 17 00:00:00 2001
 From: Magnus Granberg <zorry@gentoo.org>
 Date: Fri, 27 Feb 2015 11:55:09 +0100
 Subject: [PATCH 2/3] Remove TEXTREL tag in x86
diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
index 0351e22..4465093 100644
--- a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -1,4 +1,4 @@
-From c9ed11eff6f200ea42ae64372186d560880591bc Mon Sep 17 00:00:00 2001
+From d4ea11922ebaf865f0b0c57e6746d6b985bf840f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 5 Jun 2015 19:55:05 -0700
 Subject: [PATCH 3/3] Exclude backtrace() API for non-glibc libraries
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index b0d1e4e..862abd2 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -64,4 +64,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "0d592678bad23a77f35c109253a0263664e69812"
+SRCREV = "93cc8d306f8033551fb60e2e1f8f480330778a21"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 4d0a51f..4fc7ebc 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "08582917b43af8670658c210b2cb2a8b06e04252"
+SRCREV = "a594bd5ddb0926a0854c031307606ac7a143ac77"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 5af0ac5..ac33fb2 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "e4f2f0a146a83fa3160687ca06e11430ff02c5a8"
+SRCREV = "d64ee96f0df4d3baa6959b8552bc59d53cb0b451"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index bea55c4..49d7756 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "3338de7bbe76bac44652c525003bc66b14ef16d4"
+SRCREV = "688b29fc5aeab0eafbb457a0fa6953856eeac928"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.6.1


