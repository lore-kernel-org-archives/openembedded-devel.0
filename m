Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3175075D4A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 19:55:51 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so17408083wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 12:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=xK92nCnUEsCNAUtUNxwPBYqy9sDm6E5pP2XFAeTLMWU=;
	b=d+7c3TkMbxHOsYaV5kvgdb2IKoylfLFaYm9cNL/RZWwt7KojFEG+zNydU2606HjZLR
	5ulWWetPfsp/jRvFMo+JomEQ/9dxDXaYD7jL/T9LNq7ogoqjkHZaHs933G5uYyFUVBIV
	Rluo8KNh+Jd+WiCuP2v96s1jSzZAmml9j1xvNkLgJeb2xwJwA8jgtSjW6IVu6tlQ/JR5
	0cUnqoZl0Foci1iUHuahnabWZv0TLd4xQw4ySgsPyblfzk3JPXcS9N2KkEJvX3dj/zfH
	wYTXchM4CfRA7f7+luz15hFuWireTuxa92IXYi2ZPMb/5M+CcJPgMzBdDfTkMtUaszLp
	VVHA==
X-Received: by 10.194.115.100 with SMTP id jn4mr11717663wjb.155.1446234951510; 
	Fri, 30 Oct 2015 12:55:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	d22sm4407759wma.21.2015.10.30.12.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Oct 2015 12:55:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Oct 2015 20:56:22 +0100
Message-Id: <1446234982-3213-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1445262539-13621-2-git-send-email-Martin.Jansa@gmail.com>
References: <1445262539-13621-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-qt5] qt5: upgrade to latest revision in 5.6 branch (5.6.0-alpha1+)
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
X-List-Received-Date: Fri, 30 Oct 2015 19:55:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 classes/qmake5_base.bbclass                        |   4 +-
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  24 ++--
 recipes-qt/qt5/qt3d_git.bb                         |   2 +-
 recipes-qt/qt5/qt5-git.inc                         |   4 +-
 recipes-qt/qt5/qtbase-native_git.bb                |   8 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  34 +++--
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |   8 +-
 .../0003-Add-external-hostbindir-option.patch      |  34 ++---
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  16 +--
 ...ump-path-length-from-256-to-512-character.patch |  36 +++++
 ...mintegration-Undefine-CursorShape-from-X..patch |  30 ----
 .../0006-QOpenGLPaintDevice-sub-area-support.patch | 157 +++++++++++++++++++++
 ...ump-path-length-from-256-to-512-character.patch |  36 -----
 .../0007-QOpenGLPaintDevice-sub-area-support.patch | 157 ---------------------
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  36 +++++
 recipes-qt/qt5/qtbase/0008-Always-build-uic.patch  |  14 +-
 ...-build-it-in-configure-but-allow-to-build.patch |  68 ---------
 ...external-hostbindir-option-for-native-sdk.patch |  18 +--
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  36 -----
 ...reserve-built-qmake-and-swap-with-native-.patch |  30 ----
 ...mscreen.cpp-reorder-headers-to-fix-build-.patch |  49 -------
 recipes-qt/qt5/qtbase_git.bb                       |  36 ++---
 recipes-qt/qt5/qtcanvas3d_git.bb                   |   4 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |   2 +-
 .../0001-qmltestexample-fix-link.patch             |   2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |   2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |   3 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |   2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |   2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |   4 +-
 recipes-qt/qt5/qtlocation_git.bb                   |   2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch |   2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |   2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |   5 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |   2 +-
 recipes-qt/qt5/qtscript_git.bb                     |   2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |   2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |   2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |   2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |   2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  18 +--
 ...t-help-fix-linking-of-dependent-libraries.patch |   4 +-
 .../0003-add-noqtwebkit-configuration.patch        |   4 +-
 ...ols-cmake-allow-overriding-the-location-f.patch |   4 +-
 recipes-qt/qt5/qttools_git.bb                      |   2 +-
 recipes-qt/qt5/qttranslations_git.bb               |   2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |   2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |   2 +-
 ...yland-include-server-buffer-only-when-bui.patch |   2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |   4 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |   2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |  10 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  10 +-
 ...ird_party-boringssl-Demand-for-newer-POSI.patch |  38 -----
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  10 +-
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  29 ----
 .../0004-Generate-usable-qmake_extras.gypi.patch   |  71 ----------
 recipes-qt/qt5/qtwebengine_git.bb                  |   9 +-
 ...amples-enable-building-examples-by-defaul.patch |   2 +-
 recipes-qt/qt5/qtwebkit-examples_git.bb            |   2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |   2 +-
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |   2 +-
 ...ude-backtrace-API-for-non-glibc-libraries.patch |   2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |   2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |   2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |   2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |   2 +-
 67 files changed, 394 insertions(+), 728 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
 create mode 100644 recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
 create mode 100644 recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
 delete mode 100644 recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
 delete mode 100644 recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch

diff --git a/classes/qmake5_base.bbclass b/classes/qmake5_base.bbclass
index 9ebfa08..a766cc6 100644
--- a/classes/qmake5_base.bbclass
+++ b/classes/qmake5_base.bbclass
@@ -164,14 +164,14 @@ qmake5_base_native_do_install() {
 
 qmake5_base_nativesdk_do_install() {
     # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
+    find -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_HOST},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
 }
 
 qmake5_base_do_install() {
     # Fix install paths for all
-    find -name "Makefile*" | xargs sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
+    find -name "Makefile*" | xargs -r sed -i "s,(INSTALL_ROOT)${STAGING_DIR_TARGET},(INSTALL_ROOT),g"
 
     oe_runmake install INSTALL_ROOT=${D}
 
diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index e787993..f712af7 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -26,9 +26,9 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0007-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
@@ -37,11 +37,6 @@ SRC_URI += " \
     file://0009-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
-# specific for nativesdk-qtbase
-SRC_URI += " \
-    file://0010-configure-preserve-built-qmake-and-swap-with-native-.patch \
-"
-
 # CMake's toolchain configuration of nativesdk-qtbase
 SRC_URI += " \
     file://OEQt5Toolchain.cmake \
@@ -149,10 +144,9 @@ OE_QMAKE_QMAKE = "bin/qmake"
 do_configure() {
     # we need symlink in path relative to source, because
     # EffectivePaths:Prefix is relative to qmake location
-    # Also, configure expects qmake-native to swap with real one
-    if [ ! -e ${B}/bin/qmake-native ]; then
-        mkdir ${B}/bin
-        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake-native
+    if [ ! -e ${B}/bin/qmake ]; then
+        mkdir -p ${B}/bin
+        ln -sf ${OE_QMAKE_QMAKE_ORIG} ${B}/bin/qmake
     fi
 
     ${S}/configure -v \
@@ -223,9 +217,7 @@ do_install() {
 
     oe_runmake install INSTALL_ROOT=${D}
 
-    # replace the native qmake installed above with nativesdk version
-    rm -rf ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
-    install -m 755 ${B}/bin/qmake-real ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
+    install -m 755 ${B}/bin/qmake-target ${D}${OE_QMAKE_PATH_HOST_BINS}/qmake
 
     # for modules which are still using syncqt and call qtPrepareTool(QMAKE_SYNCQT, syncqt)
     # e.g. qt3d, qtwayland
@@ -278,4 +270,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
+SRCREV = "f7f4dde80e13ff1c05a9399297ffb746ab505e62"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index 437f41c..0ec99c6 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -15,4 +15,4 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "ec963e106397d46e5c853e9adb3fbec1b27d9b04"
+SRCREV = "9b9f34701f47824e8201453d148152fb0855f98a"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index bfe1f85..172a170 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -2,7 +2,7 @@
 # Copyright (C) 2013-2014 Martin Jansa <martin.jansa@gmail.com>
 
 QT_MODULE ?= "${BPN}"
-QT_MODULE_BRANCH ?= "5.5"
+QT_MODULE_BRANCH ?= "5.6"
 
 # each module needs to define valid SRCREV
 SRC_URI = " \
@@ -11,7 +11,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.5.1+git${SRCPV}"
+PV = "5.5.99+5.6.0-alpha1+git${SRCPV}"
 
 #LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 #LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 10496f0..e27d34b 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -20,9 +20,9 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0007-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
@@ -116,4 +116,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
+SRCREV = "f7f4dde80e13ff1c05a9399297ffb746ab505e62"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index a9c448d..2b8c9d3 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 76283f2bca936a7565e8bf38a4630ec98f47ef50 Mon Sep 17 00:00:00 2001
+From 729b7873256b11778832c5786dc50fd9ea860a7d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/10] Add linux-oe-g++ platform
+Subject: [PATCH 1/9] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -37,22 +37,26 @@ Subject: [PATCH 01/10] Add linux-oe-g++ platform
     /bin/sh: line 0: test: -gt: unary operator expected
     which are not fatal, but still misleading in do_configure output
 
+* add -target suffix to qmake built in qtbase configure, this way we can
+  use qmake from qtbase-native, but then include qmake built for target
+  in qtbase-tools package (smilarly for nativesdk-qtbase).
+
 Upstream-Status: Inappropriate [embedded specific]
                  too OE specific, probably cannot be upstreamed
 
 Change-Id: I0591ed5da0d61d7cf1509d420e6b293582f1863c
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- configure                            |  70 +++++++++++++++---------
+ configure                            |  71 ++++++++++++++++---------
  mkspecs/features/configure.prf       |   4 +-
  mkspecs/linux-oe-g++/qmake.conf      |  42 +++++++++++++++
  mkspecs/linux-oe-g++/qplatformdefs.h | 100 +++++++++++++++++++++++++++++++++++
- 4 files changed, 188 insertions(+), 28 deletions(-)
+ 4 files changed, 189 insertions(+), 28 deletions(-)
  create mode 100644 mkspecs/linux-oe-g++/qmake.conf
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index cea62fb..e1929e7 100755
+index 16e8fb4..9897fe6 100755
 --- a/configure
 +++ b/configure
 @@ -342,6 +342,16 @@ getQMakeConf()
@@ -89,7 +93,7 @@ index cea62fb..e1929e7 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -564,24 +584,14 @@ fi
+@@ -557,24 +577,14 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -120,7 +124,7 @@ index cea62fb..e1929e7 100755
  fi'`
      eval "$cmd"
  done
-@@ -3350,7 +3360,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3400,7 +3410,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -129,7 +133,7 @@ index cea62fb..e1929e7 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3407,7 +3417,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3457,7 +3467,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -138,7 +142,7 @@ index cea62fb..e1929e7 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3909,6 +3919,14 @@ setBootstrapVariable()
+@@ -3958,6 +3968,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -153,7 +157,7 @@ index cea62fb..e1929e7 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3947,14 +3965,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3996,14 +4014,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -176,6 +180,14 @@ index cea62fb..e1929e7 100755
  
          if [ "$CFG_RELEASE_QMAKE" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
+@@ -4052,6 +4070,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+                         \"\$(SOURCE_PATH)/src/corelib/io/qfsfileengine_unix.cpp\" \
+                         \"\$(SOURCE_PATH)/src/corelib/tools/qlocale_unix.cpp\""
+             EXEEXT=
++            [ "$QT_CROSS_COMPILE" = "yes" ] && EXEEXT=-target
+         fi
+         if [ "$BUILD_ON_MAC" = "yes" ]; then
+             echo "COCOA_LFLAGS =-framework Foundation -framework CoreServices" >>"$mkfile"
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
 index 6b37a04..dcf6025 100644
 --- a/mkspecs/features/configure.prf
@@ -350,5 +362,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index c5f14c9..0183238 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,8 +1,8 @@
-From f15c77264cc3ee82cba4127e58be4f6401b791f6 Mon Sep 17 00:00:00 2001
+From f902b73eda6d459a3669fd78a3c8908ae13e705b Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/10] qlibraryinfo: allow to set qt.conf from the outside
- using the environment
+Subject: [PATCH 2/9] qlibraryinfo: allow to set qt.conf from the outside using
+ the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
@@ -35,5 +35,5 @@ index 0cfcc4e..c3b5c2d 100644
          return new QSettings(qtconfig, QSettings::IniFormat);
  #ifdef QT_BUILD_QMAKE
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index e969f6f..ea15279 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From 9529fdce0bd5516f86de1cb18aa6d18a66317ba5 Mon Sep 17 00:00:00 2001
+From 175d86ddb36117c0ca2ff47ae42693980dbfa098 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/10] Add -external-hostbindir option
+Subject: [PATCH 3/9] Add -external-hostbindir option
 
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
+index 9897fe6..aa89d30 100755
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
@@ -225,5 +225,5 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index b2cf522..2bbb92c 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From b6d708efc205f2ffc0280e2da94596384bd98049 Mon Sep 17 00:00:00 2001
+From a76a6c33be512a2909904b6136a6044e4b747ffd Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 04/10] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH 4/9] qt_module: Fix pkgconfig and libtool replacements
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
+index 193629b..38ff9a8 100644
 --- a/mkspecs/features/qt_module.prf
 +++ b/mkspecs/features/qt_module.prf
-@@ -214,6 +214,11 @@ unix|mingw {
+@@ -255,6 +255,11 @@ unix|mingw {
      pclib_replace.CONFIG = path
      QMAKE_PKGCONFIG_INSTALL_REPLACE += pclib_replace
  
@@ -95,7 +95,7 @@ index c89b6d2..23d4366 100644
      unix {
          CONFIG += create_libtool explicitlib
          host_build: \
-@@ -225,6 +230,11 @@ unix|mingw {
+@@ -266,6 +271,11 @@ unix|mingw {
              ltlib_replace.replace = $$QMAKE_LIBTOOL_LIBDIR
          ltlib_replace.CONFIG = path
          QMAKE_LIBTOOL_INSTALL_REPLACE += ltlib_replace
@@ -108,5 +108,5 @@ index c89b6d2..23d4366 100644
  }
  
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
new file mode 100644
index 0000000..a3470f6
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -0,0 +1,36 @@
+From 9f80241e140b0e22d58aa2ac6ef13a277c38fe9f Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 25 Aug 2015 10:05:15 -0400
+Subject: [PATCH 5/9] configure: bump path length from 256 to 512 characters
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
+index aa89d30..6edfffd 100755
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
+2.6.2
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
index 0000000..0dbee0b
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
@@ -0,0 +1,157 @@
+From 4772fd9332b7c71543d058c1e1cfa24399a9f269 Mon Sep 17 00:00:00 2001
+From: Jani Hautakangas <jani.hautakangas@ixonos.com>
+Date: Thu, 16 May 2013 09:52:07 +0300
+Subject: [PATCH 6/9] QOpenGLPaintDevice sub-area support
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
+2.6.2
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
diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
new file mode 100644
index 0000000..55f8276
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -0,0 +1,36 @@
+From a3c5659464c911c60f31834187f3b1e914f0bf1f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 8 Jun 2015 13:59:25 -0700
+Subject: [PATCH 7/9] linux-oe-g++: Invert conditional for defining
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
+2.6.2
+
diff --git a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
index b2a478d..359be5f 100644
--- a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From cbd61cc5f4c447a9539e0a6a1dd378ac34471aff Mon Sep 17 00:00:00 2001
+From e3ce176f43e9214808cbdac13ace0aa8d8ec046d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 08/10] Always build uic
+Subject: [PATCH 8/9] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -14,18 +14,18 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 61e5ce2..a4047aa 100644
+index a970391..66c66d0 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -182,7 +182,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -176,7 +176,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
--SUBDIRS += src_plugins src_tools_qdoc
-+SUBDIRS += src_plugins src_tools_qdoc src_tools_uic
+-SUBDIRS += src_plugins
++SUBDIRS += src_plugins src_tools_uic
  
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.6.1
+2.6.2
 
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
index 683cf27..4d654a4 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,7 +1,7 @@
-From 12d06b2c5857a1c9cac4c964f32a582d029e9dfa Mon Sep 17 00:00:00 2001
+From 38ecbe7300925d440fa3d7c58e40ed5a53b2d73a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 09/10] Add -external-hostbindir option for native(sdk)
+Subject: [PATCH 9/9] Add -external-hostbindir option for native(sdk)
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -37,10 +37,10 @@ Conflicts:
  5 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index f0f42ab..04fd1ba 100755
+index 6edfffd..313d921 100755
 --- a/configure
 +++ b/configure
-@@ -3846,6 +3846,7 @@ addConfStr "$CFG_SYSROOT"
+@@ -3895,6 +3895,7 @@ addConfStr "$CFG_SYSROOT"
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
@@ -94,10 +94,10 @@ index 1ad7637..5a8b127 100644
          HostSpecPath,
          HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 3bf0546..53bf146 100644
+index 6c3217b..980c578 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1217,6 +1217,13 @@ void Configure::parseCmdLine()
+@@ -1243,6 +1243,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -111,7 +111,7 @@ index 3bf0546..53bf146 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4101,6 +4108,9 @@ void Configure::generateQConfigCpp()
+@@ -4198,6 +4205,9 @@ void Configure::generateQConfigCpp()
  
      if (dictionary["QT_REL_HOST_DATA"].isEmpty())
          dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
@@ -121,7 +121,7 @@ index 3bf0546..53bf146 100644
  
      confStringOff = 0;
      addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4120,6 +4130,7 @@ void Configure::generateQConfigCpp()
+@@ -4217,6 +4227,7 @@ void Configure::generateQConfigCpp()
      addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
      addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
      addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
@@ -130,5 +130,5 @@ index 3bf0546..53bf146 100644
      addConfStr(1, hostSpec);
  
 -- 
-2.6.1
+2.6.2
 
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
index 9a8ddbb..0000000
--- a/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 706d9a8b270d5eb803e93005cc90a1aa1553572a Mon Sep 17 00:00:00 2001
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
-2.5.3
-
diff --git a/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch b/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
deleted file mode 100644
index b2dbbfd..0000000
--- a/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From c09e6ef0bf6a879455ffee496c716a0bc1787cdf Mon Sep 17 00:00:00 2001
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
-2.5.3
-
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index ecaccd3..69d37df 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -16,16 +16,9 @@ SRC_URI += "\
     file://0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch \
     file://0003-Add-external-hostbindir-option.patch \
     file://0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch \
-    file://0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch \
-    file://0006-configure-bump-path-length-from-256-to-512-character.patch \
-    file://0007-QOpenGLPaintDevice-sub-area-support.patch \
-"
-
-# specific for target qtbase
-SRC_URI += "\
-    file://0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch \
-    file://0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
-    file://0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch \
+    file://0005-configure-bump-path-length-from-256-to-512-character.patch \
+    file://0006-QOpenGLPaintDevice-sub-area-support.patch \
+    file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -207,21 +200,8 @@ do_configure() {
     qmake5_base_do_configure
 }
 
-do_compile_append() {
-    # copy corelib/3rdparty/qmake sources required by qmake -> ${B}
-    cp -ra ${S}/src/corelib ${B}/src
-    cp -ra ${S}/src/3rdparty ${B}/src
-    cp -ra ${S}/qmake ${B}
-    cp ${S}/.qmake.conf ${B}/qmake
-    cd ${B}/qmake
-    # align qt5 tools source path to ${S}
-    sed -i 's:\.\./tools:${S}/tools:g' qmake.pro
-    ../${OE_QMAKE_QMAKE}
-    oe_runmake CC="${CC}" CXX="${CXX}"
-}
-
 do_install_append() {
-    install -m 0755 ${B}/qmake/bin/qmake ${D}/${bindir}${QT_DIR_NAME}
+    install -m 0755 ${B}/bin/qmake-target ${D}/${bindir}${QT_DIR_NAME}/qmake
 
     ### Fix up the binaries to the right location
     ### TODO: FIX
@@ -240,9 +220,9 @@ do_install_append() {
     rm -rf ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/macx-ios-clang
 
     # Replace host paths with qmake built-in properties
-    sed -i -e 's| ${STAGING_DIR_NATIVE}${prefix_native}| $$[QT_HOST_PREFIX]|g' \
-        -e 's| ${STAGING_DIR_HOST}| $$[QT_SYSROOT]|g' \
-        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
+#    sed -i -e 's| ${STAGING_DIR_NATIVE}${prefix_native}| $$[QT_HOST_PREFIX]|g' \
+#        -e 's| ${STAGING_DIR_HOST}| $$[QT_SYSROOT]|g' \
+#        ${D}/${OE_QMAKE_PATH_QT_ARCHDATA}/mkspecs/qconfig.pri
 }
 
 PACKAGES =. " \
@@ -279,4 +259,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
+SRCREV = "f7f4dde80e13ff1c05a9399297ffb746ab505e62"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 9678a60..c892d9b 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -5,9 +5,9 @@ LICENSE = "LGPL-3.0 | GPL-3.0"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
     file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
-    file://LICENSE.GPL;md5=05832301944453ec79e40ba3c3cfceec \
+    file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
 "
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "9a714258f32a6a5318eb461903af25f64b7c80d2"
+SRCREV = "a84dad27182ba6cb4c6f9bf4008a9e63346a7a83"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 84360e8..b1e155e 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -22,4 +22,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "cf8b244f94fdabf5c960d82c4bbcbf13c91c29b1"
+SRCREV = "a7617f963c1d375fb7ac7d5c17f450acdb2796b8"
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
index 5ea5323..de71c39 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -33,6 +33,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "3e9f61f305dc4c988e6f2718df56df80f639734e"
+SRCREV = "1064d5100f4d00af5f56b87331251f97d78f8b87"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 47f2a1d..5854abe 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,5 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-QT_MODULE_BRANCH = "1.2"
-SRCREV = "e32bcb7b714454f9167c4d49776a95c9a5799d70"
+SRCREV = "34d66f3836051dca35a854577fe04b45af3630f2"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index e707dee..463e15b 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "9aa0edc6d13d20796feb1712883eddb7cd411ecd"
+SRCREV = "ad227e9808288b12726114365ae1474386c6cdf8"
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
index 85a1dce..a847fb2 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
     file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
     file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
-    file://LGPL_EXCEPTION.txt;md5=0145c4d1b6f96a661c2c139dfb268fb6 \
+    file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
 "
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "3c68f26c052b06da9b43bb775cbe5a539fccb0c3"
+SRCREV = "67cbcf399aa1a18b9b1dbac0a6572a865687230a"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 63642aa..2c66ad4 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "63b118c7da215d994e1695797fd44c2ad35298c3"
+SRCREV = "1fd85dd9426b65198b396c686edd42e42d5b8149"
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
index faf05d4..96a21cd 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "0cf41ef53f7b336509ed7d1ae6518655276af70f"
+SRCREV = "ac1b772ec8e428acd23322a6fccbde2bda6b8bd2"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index edd47f6..d7cf434 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -7,8 +7,7 @@ require qt5-git.inc
 LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 LIC_FILES_CHKSUM = " \
     file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
-    file://LICENSE.LGPLv3;md5=b8c75190712063cde04e1f41b6fdad98 \
-    file://LICENSE.GPLv3;md5=40f9bf30e783ddc201497165dfb32afb \
+    file://LICENSE.LGPLv3;md5=c4fe8c6de4eef597feec6e90ed62e962 \
     file://LGPL_EXCEPTION.txt;md5=9625233da42f9e0ce9d63651a9d97654 \
     file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
     file://LICENSE.GPLv2;md5=05832301944453ec79e40ba3c3cfceec \
@@ -24,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "f079636a3ee5538eb79fd4e7e6ffcb0465a015a0"
+SRCREV = "b0382acf65dbc0debcb7cf956ba954117a682d90"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 54de87c..644b70e 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,4 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "61889f06fa828b483513b8315b4f0870532ece66"
+SRCREV = "2e48d16e4a230069884ac0585ae111037f4171fb"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index b07675f..c6dca51 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -26,4 +26,4 @@ ARM_INSTRUCTION_SET = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "50446e4edb0360871309a5d72a9a873f45fb17bd"
+SRCREV = "7ebf02ea3e8e91b13eb2d34847c005d8a487e9da"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index e495c5b..a422544 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "6a16281aceedb713676e16c3074e6f7ea1e70b79"
+SRCREV = "d8d4a5e9ac1251e82d1ec639bc3bff7e7f53c083"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 53e6069..c95844c 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "ad108e9d56e7838eac3726e0492a246086d53e70"
+SRCREV = "2575d33fab4042baba67384f92119c58c0ce0245"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index dc0bd5f..b3bc50f 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "b5d689eaafd1e243d38f4df30f2d35eaab8b3b44"
+SRCREV = "9ee5ee12a7b92a57624dafed935b3ac1fad426d9"
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
index e1255d8..e743a35 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From 922931781bd4fd765de996f1709aff95b6ac3fba Mon Sep 17 00:00:00 2001
+From 0fb675dfdff64a270b92d768bedc0d6b355675b4 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH 1/4] Allow to build only lrelease + lupdate + lconvert
@@ -14,9 +14,9 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  examples/examples.pro     |  3 ++-
  src/designer/src/src.pro  | 18 ++++++++++--------
  src/linguist/linguist.pro |  2 +-
- src/src.pro               | 14 ++++++++------
+ src/src.pro               | 16 +++++++++-------
  tests/auto/auto.pro       | 24 +++++++++++++-----------
- 5 files changed, 34 insertions(+), 27 deletions(-)
+ 5 files changed, 35 insertions(+), 28 deletions(-)
 
 diff --git a/examples/examples.pro b/examples/examples.pro
 index 69365d1..da7b38b 100644
@@ -79,10 +79,10 @@ index 3a70580..a977878 100644
  qtNomakeTools( \
      linguist \
 diff --git a/src/src.pro b/src/src.pro
-index 494898f..c02848d 100644
+index 387d54f..56b7d0c 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -4,10 +4,12 @@ qtHaveModule(widgets) {
+@@ -4,19 +4,21 @@ qtHaveModule(widgets) {
      no-png {
          message("Some graphics-related tools are unavailable without PNG support")
      } else {
@@ -98,16 +98,18 @@ index 494898f..c02848d 100644
  
          linguist.depends = designer
      }
-@@ -15,7 +17,7 @@ qtHaveModule(widgets) {
+ }
  
  SUBDIRS += linguist \
+-    qdoc \
      qtplugininfo
 -if(!android|android_app):!ios: SUBDIRS += qtpaths
++!linguistonly: SUBDIRS +=  qdoc
 +if(!android|android_app):!ios:!linguistonly: SUBDIRS += qtpaths
  
  mac {
      SUBDIRS += macdeployqt
-@@ -25,11 +27,11 @@ android {
+@@ -26,11 +28,11 @@ android {
      SUBDIRS += androiddeployqt
  }
  
@@ -155,5 +157,5 @@ index 20b5fec..8a42d1f 100644
  installed_cmake.depends = cmake
  
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 3116b3d..754213f 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 83493e0f4e0d8b4dbf1da982e4459fefea61c582 Mon Sep 17 00:00:00 2001
+From d480a725a36482f7a1df52c5c170961382a8e730 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH 2/4] assistant/help: fix linking of dependent libraries
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index a0306e5..3e87400 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From ad5e4266eda956a1ff408bf3fe875badc5f4c866 Mon Sep 17 00:00:00 2001
+From d26b82742e20d4fff96856f7b9a7828ccb1aea68 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH 3/4] add noqtwebkit configuration
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index ce4a0b7..55e7ec5 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From e9e9a79d1a58981dd33d18c0f43b1fb982100a61 Mon Sep 17 00:00:00 2001
+From eb882650473cea1cd71cef7813512b381429fd5c Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH 4/4] linguist-tools cmake: allow overriding the location for
@@ -59,5 +59,5 @@ index 4318b16..2e3b70f 100644
  
      set_target_properties(Qt5::lconvert PROPERTIES
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index ff95b85..5ee1e86 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -32,6 +32,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "02402887562f55b822fd29a64437da3d1252fd5b"
+SRCREV = "57301c0003e9d776d31953f1411cc06a395b752e"
 
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
index b351b38..ba07591 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "9d408649458a274864ae2e7c2d67b4fa3cabbfcd"
+SRCREV = "bd21beea9a433a8878c0e719a7bfb8c14df47840"
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
index 2ea3285..98b24e3 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -38,7 +38,7 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-QT_VERSION ?= "5.5.1"
+QT_VERSION ?= "5.6.0"
 
 do_install_append() {
     # do install files created by qtwaylandscanner
@@ -46,4 +46,4 @@ do_install_append() {
     install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
 }
 
-SRCREV = "9d408649458a274864ae2e7c2d67b4fa3cabbfcd"
+SRCREV = "bd21beea9a433a8878c0e719a7bfb8c14df47840"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index aa7cb25..e070d13 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "906d910415454d64ff0b021b06f0df422a8c82bd"
+SRCREV = "97577a0f27a1f427948871ae535645a2e0788bf7"
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
index 02381e0..3249f83 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,7 +1,7 @@
-From cf7f63dfcf71b7baee30112ef73fed67504033f7 Mon Sep 17 00:00:00 2001
+From 38efc016f223a1277bd3a92e4c78ac816adbcdaa Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/4] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+Subject: [PATCH 1/2] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
  anywhere in path, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 64064bd..8287c8f 100644
+index d5265ab..2825457 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -105,9 +105,9 @@ defineReplace(mocOutput) {
+@@ -113,9 +113,9 @@ defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
    for(ext, $$list($${QMAKE_EXT_CPP})): \
@@ -26,5 +26,5 @@ index 64064bd..8287c8f 100644
  }
  
 -- 
-2.6.1
+2.6.2
 
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
index 2ba8fec..4224d32 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,7 +1,7 @@
-From 7f81bad8fcd00afcf2214285856d46f50f91b55c Mon Sep 17 00:00:00 2001
+From ebfec8ca32379bffd18cbab1f4335a458fcc7e41 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH 2/4] functions.prf: Make sure we only use the file name to
+Subject: [PATCH 2/2] functions.prf: Make sure we only use the file name to
  generate it's moc'ed abbreviation
 
 Signed-off-by: Simon Busch <morphis@gravedo.de>
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 8287c8f..04bdba5 100644
+index 2825457..f761b64 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -102,7 +102,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -110,7 +110,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
@@ -25,5 +25,5 @@ index 8287c8f..04bdba5 100644
    for(ext, $$list($${QMAKE_EXT_CPP})): \
        out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
 -- 
-2.6.1
+2.6.2
 
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
deleted file mode 100644
index 23be489..0000000
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From a7bb8e37abb3a11e6257d6e154d33c7af5856dcc Mon Sep 17 00:00:00 2001
-From: Frieder Schrempf <frieder.schrempf@online.de>
-Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH 3/4] functions.prf: allow build for linux-oe-g++ platform
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
-index 04bdba5..4206661 100644
---- a/tools/qmake/mkspecs/features/functions.prf
-+++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -14,7 +14,7 @@ defineTest(isPlatformSupported) {
- 
-   linux-g++*:!isGCCVersionSupported(): return(false)
-   !isPythonVersionSupported(): return(false)
--  linux-g++*|win32-msvc2013|macx-clang*: return(true)
-+  linux-g++*|linux-oe-g++*|win32-msvc2013|macx-clang*: return(true)
-   boot2qt: return(true)
- 
-   skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
--- 
-2.6.1
-
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
index fe92338..b8269b8 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -71,19 +71,16 @@ RDEPENDS_${PN}-examples += " \
     qtdeclarative-qmlplugins \
 "
 
-QT_MODULE_BRANCH_CHROMIUM = "40.0.2214-based"
+QT_MODULE_BRANCH_CHROMIUM = "45-based"
 
 SRC_URI += " \
     ${QT_GIT}/qtwebengine-chromium.git;name=chromium;branch=${QT_MODULE_BRANCH_CHROMIUM};destsuffix=git/src/3rdparty \
     file://0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch \
     file://0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch \
-    file://0003-functions.prf-allow-build-for-linux-oe-g-platform.patch \
-    file://0004-Generate-usable-qmake_extras.gypi.patch \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
-    file://0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch \
 "
-SRCREV_qtwebengine = "ce095e94b686196629244073990530441b9b5f4f"
-SRCREV_chromium = "146ebe26dce3289eb440bed7d5d0a7988ff5f5c9"
+SRCREV_qtwebengine = "cfee452174c58fe4048b1604503d03de2764fc8e"
+SRCREV_chromium = "ec5b3304fc266dfdec7666b8b73d57a3971ea35f"
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
index 4d0a51f..6aea0a6 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "08582917b43af8670658c210b2cb2a8b06e04252"
+SRCREV = "469f748515b65cd4c9bec8794ec37ca6cf5df026"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index 5af0ac5..ac33fb2 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "e4f2f0a146a83fa3160687ca06e11430ff02c5a8"
+SRCREV = "d64ee96f0df4d3baa6959b8552bc59d53cb0b451"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index bea55c4..4b511d0 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "3338de7bbe76bac44652c525003bc66b14ef16d4"
+SRCREV = "94136d42805abeaf3dd9d6ded7b74e3d27fd3777"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.6.2


