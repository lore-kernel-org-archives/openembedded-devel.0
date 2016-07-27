Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 88C0D60746
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 16:15:37 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so7176393wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/npbeYE7BaukIjRTgfka97ZE5leNVZ7QoA2jVvJ5mRw=;
	b=r09YhVd8dhviYXPWyO56EfkaJHFGRp00tAeiLLRF1DI9TcPrmixDc0akXSNlc3ITx2
	ERnAI7ibPGEW9lHMjQZvM+jLdNt0dRP/R2DYl75OKlFq0eUl65i38OOK4E1TMr2rkXlo
	83DGgJ01V/Rltl/bp5rpxQK5ImyYEnSPwy8cdACsEV34t+Alp9Y3uynYaJszlFzXFiP1
	MTC0WUyiQgQIHc47nZrcjHf87ljKacp0/ei+ucV0LCa7fNaYvfh3VHAXOXAQnRdGfD1W
	6pExDSUHIdZMSJDutKaEndBXnaez6rdKv6OSbvbJQdR4TJF6T6CIddQJ8URIjvfK8ndF
	QcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/npbeYE7BaukIjRTgfka97ZE5leNVZ7QoA2jVvJ5mRw=;
	b=RchK8p0h0DlQjJ2/t1Nw/DipEd1AJombONTh+2s594yaeu0twdmmI94DhWNcKEqrbz
	R2mswoAbHnyntQqnMJddvBisIpmTaJCHF7JUuDvMkhVfi4c6TzGEjDVv/ORyfFxXrcCN
	fEv/MQOYdWZYjJ4m8YlFtNqcVk0B+pgIQQljgcQKrgHpHi+16dPtPfoRct0Xifvnj4d8
	nVDjzbC+wZsdgDrFaJJQyLuwA8/gWZKP27naVNkRjEi9FGvG64pLwK2Vdpj2FUaUR8wg
	M6KeVAYU8zVPugICZewnF0bxpu1zVcZxPRyCS6QXSIAhn6uCd0SpPPx5UG/JvhKWAjkF
	me+A==
X-Gm-Message-State: ALyK8tLlEeTE+v4mWrAo1yYetzDGyqlsY0MtvNG+YkXVc4Yp0ULceQtvy0qX4G7aq3+WzQ==
X-Received: by 10.28.191.14 with SMTP id p14mr51696822wmf.39.1469636136935;
	Wed, 27 Jul 2016 09:15:36 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id n7sm7138185wjf.11.2016.07.27.09.15.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jul 2016 09:15:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2016 18:15:36 +0200
Message-Id: <20160727161536.25139-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-qt5][krogoth][WIP][PATCH] qt5: upgrade to latest revisions in 5.6 branch
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
X-List-Received-Date: Wed, 27 Jul 2016 16:15:41 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  8 ++++---
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  7 ++----
 recipes-qt/qt5/qt3d_git.bb                         |  4 ++--
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  7 +++---
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 28 +++++++++++-----------
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  2 +-
 .../0003-Add-external-hostbindir-option.patch      | 16 ++++++-------
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  6 ++---
 ...ump-path-length-from-256-to-512-character.patch |  6 ++---
 .../0006-QOpenGLPaintDevice-sub-area-support.patch |  2 +-
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  2 +-
 ...configure-paths-for-target-qmake-properly.patch | 12 +++++-----
 ...wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch} |  6 +----
 ...build-uic.patch => 0010-Always-build-uic.patch} |  6 ++---
 ...xternal-hostbindir-option-for-native-sdk.patch} | 14 +++++------
 recipes-qt/qt5/qtbase_git.bb                       |  4 ++--
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  4 ++--
 ...omparison-fix-QCoreApplication-has-not-be.patch |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 ...fix-invalid-use-of-incomplete-type-class-.patch | 10 ++++----
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  2 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  2 +-
 .../0003-add-noqtwebkit-configuration.patch        |  2 +-
 ...ols-cmake-allow-overriding-the-location-f.patch |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  2 +-
 ...yland-include-server-buffer-only-when-bui.patch |  2 +-
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |  4 ++--
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  6 ++---
 ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |  4 ++--
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  6 ++---
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  4 ++--
 ...quickwebengineview_p_p.h-add-include-QCol.patch |  4 ++--
 ...-dependency-to-QCoreApplication-translate.patch |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  6 +++--
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  2 +-
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |  2 +-
 ...ude-backtrace-API-for-non-glibc-libraries.patch |  2 +-
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 64 files changed, 127 insertions(+), 129 deletions(-)
 rename recipes-qt/qt5/qtbase/{0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch => 0009-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch} (96%)
 rename recipes-qt/qt5/qtbase/{0009-Always-build-uic.patch => 0010-Always-build-uic.patch} (81%)
 rename recipes-qt/qt5/qtbase/{0010-Add-external-hostbindir-option-for-native-sdk.patch => 0011-Add-external-hostbindir-option-for-native-sdk.patch} (93%)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 4e55141..dd26b7d 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -30,12 +30,14 @@ SRC_URI += "\
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
+    file://0008-configure-paths-for-target-qmake-properly.patch \
+    file://0009-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0009-Always-build-uic.patch \
-    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0010-Always-build-uic.patch \
+    file://0011-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
@@ -257,4 +259,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "7bf002c3b3f8009138fca217c7fa0c234aed21bd"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index c9d2223..8ff47a4 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 778d0c4515bae5bdeb650fb3e6b3e32a73722b51 Mon Sep 17 00:00:00 2001
+From 339e527e5ca0e1b7839d28e9f140630af634b569 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
@@ -8,7 +8,7 @@ Subject: [PATCH] Allow a tools-only build
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/qt3d.pro b/qt3d.pro
-index a26e76d..263e3c4 100644
+index a26e76d..016fb30 100644
 --- a/qt3d.pro
 +++ b/qt3d.pro
 @@ -1,4 +1,4 @@
@@ -26,6 +26,3 @@ index a26e76d..263e3c4 100644
 +    sub_tools.depends -= sub_src
 +    SUBDIRS = sub_tools
 +}
--- 
-1.9.1
-
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index a96b06c..3669841 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -13,7 +13,7 @@ DEPENDS_class-target += "qtdeclarative qt3d-native"
 
 SRC_URI += " \
     file://0001-Allow-a-tools-only-build.patch \
-    "
+"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG_class-native ??= "tools-only"
@@ -27,6 +27,6 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "7a208d76ed96bb506899becfe680df06f95451c7"
+SRCREV = "7fab1fa65675dfd62b1ddf6fed3226e465b37b67"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 8a6d93e..30c534e 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,4 +11,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.6.0+git${SRCPV}"
+PV = "5.6.1+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 73900af..c5213a6 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -24,12 +24,13 @@ SRC_URI += "\
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
+    file://0009-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0009-Always-build-uic.patch \
-    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0010-Always-build-uic.patch \
+    file://0011-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 CLEANBROKEN = "1"
@@ -117,4 +118,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "7bf002c3b3f8009138fca217c7fa0c234aed21bd"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 522afcd..e606cdb 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From cabe9683b82493e2547e87ae0057f44f71efe519 Mon Sep 17 00:00:00 2001
+From 46260d1a93e10a6a6f47f38d0b4355b4b63a4682 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -56,10 +56,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index 3e97c98..88a308d 100755
+index f4c7813..9ab6a9d 100755
 --- a/configure
 +++ b/configure
-@@ -342,6 +342,16 @@ getQMakeConf()
+@@ -343,6 +343,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
  
@@ -76,8 +76,8 @@ index 3e97c98..88a308d 100755
  getXQMakeConf()
  {
      if [ -z "$xspecvals" ]; then
-@@ -351,6 +361,16 @@ getXQMakeConf()
-     getSingleQMakeVariable "$1" "$xspecvals"
+@@ -367,6 +377,16 @@ testXConfig()
+     esac
  }
  
 +# OE qmake.conf is reading some variables from shell env
@@ -93,7 +93,7 @@ index 3e97c98..88a308d 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -557,24 +577,14 @@ fi
+@@ -573,24 +593,14 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -124,7 +124,7 @@ index 3e97c98..88a308d 100755
  fi'`
      eval "$cmd"
  done
-@@ -3418,7 +3428,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3443,7 +3453,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_QGTKSTYLE" = "auto" ] && CFG_QGTKSTYLE=no
  fi
  
@@ -133,7 +133,7 @@ index 3e97c98..88a308d 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3475,7 +3485,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
+@@ -3504,7 +3514,7 @@ if [ "$XPLATFORM_SYMBIAN_SBSV2" = "no" ]; then
          exit 1
      fi
  fi
@@ -142,7 +142,7 @@ index 3e97c98..88a308d 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3976,6 +3986,14 @@ setBootstrapVariable()
+@@ -4005,6 +4015,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -157,7 +157,7 @@ index 3e97c98..88a308d 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -4014,14 +4032,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -4043,14 +4061,14 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
          fi
  
          [ "$CFG_SILENT" = "yes" ] && CC_TRANSFORM='s,^,\@,' || CC_TRANSFORM=
@@ -178,9 +178,9 @@ index 3e97c98..88a308d 100755
 +        setBootstrapEvalVariable QMAKE_LFLAGS
 +        setBootstrapEvalVariable QMAKE_LFLAGS_GCSECTIONS
  
-         if [ "$CFG_RELEASE_TOOLS" = "yes" ]; then
+         if [ "$CFG_DEBUG" = "no" ] || [ "$CFG_RELEASE_TOOLS" = "yes" ]; then
              setBootstrapVariable QMAKE_CFLAGS_RELEASE
-@@ -4070,6 +4088,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -4093,6 +4111,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
                          \"\$(SOURCE_PATH)/src/corelib/io/qfsfileengine_unix.cpp\" \
                          \"\$(SOURCE_PATH)/src/corelib/tools/qlocale_unix.cpp\""
              EXEEXT=
@@ -189,10 +189,10 @@ index 3e97c98..88a308d 100755
          if [ "$BUILD_ON_MAC" = "yes" ]; then
              echo "COCOA_LFLAGS =-framework Foundation -framework CoreServices" >>"$mkfile"
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 6b37a04..dcf6025 100644
+index a3ec227..eef6006 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -63,12 +63,12 @@ defineTest(qtCompileTest) {
+@@ -71,12 +71,12 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 0b0650d..41d10ea 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 1edd17d452a7e9eeb2931b3c5697a4fc0ec4e6bc Mon Sep 17 00:00:00 2001
+From 03824427f227ff16c6d23d08c73708b0faf98e06 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index ca271e6..f706637 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 3ecdcb6a10d125f1440c42ad9c79f04d43c257e0 Mon Sep 17 00:00:00 2001
+From 7421a689c695a09fff2d5ffbdbe56e34d73f771d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option
@@ -37,10 +37,10 @@ Conflicts:
  7 files changed, 38 insertions(+), 12 deletions(-)
 
 diff --git a/configure b/configure
-index 88a308d..f2611ed 100755
+index 9ab6a9d..225b9f3 100755
 --- a/configure
 +++ b/configure
-@@ -810,6 +810,7 @@ QT_HOST_BINS=
+@@ -826,6 +826,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -48,7 +48,7 @@ index 88a308d..f2611ed 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -929,6 +930,7 @@ while [ "$#" -gt 0 ]; do
+@@ -945,6 +946,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -56,7 +56,7 @@ index 88a308d..f2611ed 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1159,6 +1161,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1175,6 +1177,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -66,7 +66,7 @@ index 88a308d..f2611ed 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2428,6 +2433,10 @@ Installation options:
+@@ -2444,6 +2449,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -77,7 +77,7 @@ index 88a308d..f2611ed 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3172,6 +3181,11 @@ fi
+@@ -3195,6 +3204,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -90,7 +90,7 @@ index 88a308d..f2611ed 100755
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index 8639695..d89d948 100644
+index 4a1d265..a2bdd29 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
 @@ -70,7 +70,11 @@ defineTest(qtHaveModule) {
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index a35b6a2..233a9c5 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From 7e5713e7f4807e204cd4a9f874cb1ca2985fc630 Mon Sep 17 00:00:00 2001
+From 156a2e3f61258de4127d582895376a1c674e30a6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
@@ -68,7 +68,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
-index 75b84ff..ab36fa6 100644
+index be08a2a..0310cbb 100644
 --- a/mkspecs/features/qt.prf
 +++ b/mkspecs/features/qt.prf
 @@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
@@ -92,7 +92,7 @@ index 75b84ff..ab36fa6 100644
  contains(QT_CONFIG, static) {
      QT_PLUGIN_VERIFY += QTPLUGIN
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index cc8ed87..b7d4be2 100644
+index de9ba9d..e59c5e5 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -38,7 +38,7 @@ contains(TEMPLATE, .*lib) {
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
index e21b36d..275bd71 100644
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From e6ed023b0210375e594b7b61dfb620deb486ee8c Mon Sep 17 00:00:00 2001
+From 4316f6b00153765fd39a0054896910049c607169 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -14,10 +14,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index f2611ed..24a61db 100755
+index 225b9f3..746a088 100755
 --- a/configure
 +++ b/configure
-@@ -3930,10 +3930,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3959,10 +3959,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
  
  /* Installation Info */
diff --git a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
index b675805..be1a6c3 100644
--- a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From 05a3901af7a467f9ea5fa9e6f63a574d8d2a9f77 Mon Sep 17 00:00:00 2001
+From af6fed015c4d685e922ed6761262610910ea2219 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH] QOpenGLPaintDevice sub-area support
diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
index 2fab888..ad9aef6 100644
--- a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -1,4 +1,4 @@
-From 6a0d4af2083dbacddb98245c0b4b83c6e014a1ae Mon Sep 17 00:00:00 2001
+From 92eafaf0f5902916ca87b8e3bd63040602ff18bf Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Jun 2015 13:59:25 -0700
 Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLEN_T
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
index 7ca1913..85ec8e8 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
@@ -1,4 +1,4 @@
-From b5c826a39760519010884547d6981c3af031d9c8 Mon Sep 17 00:00:00 2001
+From 92b13af05077dec0d194d4018e36568146d41232 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 13 Nov 2015 12:36:11 +0100
 Subject: [PATCH] configure paths for target qmake properly
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 19 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 24a61db..2e99d39 100755
+index 746a088..d98ea53 100755
 --- a/configure
 +++ b/configure
-@@ -3875,8 +3875,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
+@@ -3904,8 +3904,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
      QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
  fi
  
@@ -38,7 +38,7 @@ index 24a61db..2e99d39 100755
  
  QT_CONFIGURE_STR_OFF=0
  
-@@ -3909,7 +3914,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+@@ -3938,7 +3943,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
  
  QT_CONFIGURE_STR_OFFSETS=
  QT_CONFIGURE_STRS=
@@ -51,7 +51,7 @@ index 24a61db..2e99d39 100755
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
-@@ -3921,6 +3930,12 @@ addConfStr "$shortspec"
+@@ -3950,6 +3959,12 @@ addConfStr "$shortspec"
  #-------------------------------------------------------------------------------
  [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
  
@@ -64,7 +64,7 @@ index 24a61db..2e99d39 100755
  cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
  /* License Info */
  static const char qt_configure_licensee_str          [256 + 12] = "qt_lcnsuser=$Licensee";
-@@ -3933,7 +3948,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+@@ -3962,7 +3977,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
  static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
  #ifdef QT_BUILD_QMAKE
  static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
diff --git a/recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0009-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
similarity index 96%
rename from recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
rename to recipes-qt/qt5/qtbase/0009-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index 7a24459..1825ac2 100644
--- a/recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0009-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From f5a949e17aa8b37491fbc414c38557c9920fa1e5 Mon Sep 17 00:00:00 2001
+From e70b35ba680f2138f0a7ff65852e76248462d459 Mon Sep 17 00:00:00 2001
 From: Pascal Bach <pascal.bach@siemens.com>
 Date: Wed, 11 May 2016 15:20:41 +0200
 Subject: [PATCH] Pretend Qt5 wasn't found if OE_QMAKE_PATH_EXTERNAL_HOST_BINS
@@ -24,7 +24,6 @@ Upstream-Status: Pending
     - 0010-Add-external-hostbindir-option-for-native-sdk.patch
 
 Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
-
 ---
  mkspecs/features/data/cmake/Qt5BasicConfig.cmake.in | 5 +++++
  src/corelib/Qt5Config.cmake.in                      | 5 +++++
@@ -62,6 +61,3 @@ index a872d0e..233d663 100644
  if (NOT Qt5_FIND_COMPONENTS)
      set(Qt5_NOT_FOUND_MESSAGE \"The Qt5 package requires at least one component\")
      set(Qt5_FOUND False)
--- 
-2.1.4
-
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0010-Always-build-uic.patch
similarity index 81%
rename from recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase/0010-Always-build-uic.patch
index 230c966..a5915e9 100644
--- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0010-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 49b2100ff86ab5b4977608903b30cb71075592c6 Mon Sep 17 00:00:00 2001
+From 609d853b42509e8c7da4409e2c97dc44834db564 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 1671338..83de483 100644
+index ed752c3..dbb0b56 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -180,7 +180,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -186,7 +186,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0011-Add-external-hostbindir-option-for-native-sdk.patch
similarity index 93%
rename from recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
rename to recipes-qt/qt5/qtbase/0011-Add-external-hostbindir-option-for-native-sdk.patch
index 5bb73e7..d257d3f 100644
--- a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0011-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From 5b4ae15a19a9135d3dc8a35aa2d109ba8d29868a Mon Sep 17 00:00:00 2001
+From 2aa52f19cab8eafff84d1828367d1e38cb34315d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option for native(sdk)
@@ -37,10 +37,10 @@ Conflicts:
  5 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 2e99d39..a0641d2 100755
+index d98ea53..f42abe6 100755
 --- a/configure
 +++ b/configure
-@@ -3922,6 +3922,7 @@ fi
+@@ -3951,6 +3951,7 @@ fi
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
@@ -94,10 +94,10 @@ index 1ad7637..5a8b127 100644
          HostSpecPath,
          HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 6f1e2b7..ae03143 100644
+index f2b54f5..d973c11 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1256,6 +1256,13 @@ void Configure::parseCmdLine()
+@@ -1261,6 +1261,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -111,7 +111,7 @@ index 6f1e2b7..ae03143 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4232,6 +4239,9 @@ void Configure::generateQConfigCpp()
+@@ -4258,6 +4265,9 @@ void Configure::generateQConfigCpp()
  
      if (dictionary["QT_REL_HOST_DATA"].isEmpty())
          dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
@@ -121,7 +121,7 @@ index 6f1e2b7..ae03143 100644
  
      confStringOff = 0;
      addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4251,6 +4261,7 @@ void Configure::generateQConfigCpp()
+@@ -4277,6 +4287,7 @@ void Configure::generateQConfigCpp()
      addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
      addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
      addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 1ce8cd6..76cdc4d 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -20,7 +20,7 @@ SRC_URI += "\
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
-    file://0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0009-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -262,4 +262,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
+SRCREV = "7bf002c3b3f8009138fca217c7fa0c234aed21bd"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 5b12d1a..3eced66 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "791ddce7d41b126ba4744a6701597f49dbf99f3b"
+SRCREV = "95884805facd1721eea025467afd85ed64a70504"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 03990d8..861caf3 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "dedff12a896d51c469d2af82664b86a10f8fa7fe"
+SRCREV = "71a0d199a29001cc31bfde15aabcc53cf88aae1e"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index ee56820..b0e5fe8 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From d26a676827ef2d64b4627090690d3240e62f6565 Mon Sep 17 00:00:00 2001
+From 8228a74e72ad130f8ab91dd3ebe1969c0acfd81b Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -60,7 +60,7 @@ index c6d442e..3181dcd 100644
 +QT += core-private  qml-private testlib gui gui-private quick
  DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0
 diff --git a/tests/auto/qmltest/qmltest.pro b/tests/auto/qmltest/qmltest.pro
-index 7662cb1..a8f8ae2 100644
+index 175ed42..83e5d7d 100644
 --- a/tests/auto/qmltest/qmltest.pro
 +++ b/tests/auto/qmltest/qmltest.pro
 @@ -4,6 +4,7 @@ CONFIG += qmltestcase
diff --git a/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch b/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
index 60c9685..915d924 100644
--- a/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
+++ b/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
@@ -1,4 +1,4 @@
-From 9d39293e354120a9ec5e92c87b4cd695acdeb3f5 Mon Sep 17 00:00:00 2001
+From b958ab5685384a4c612f13c8cb83fa6b87fee18e Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:38:58 -0400
 Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 72b3d7b..1a246e2 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -34,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "26ff8f9029107877bfbfdc2f099f9b11861183ed"
+SRCREV = "a05f59388e004160899d5d311884cfabe10c3b8c"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 04f5a79..6833520 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "cf717b99fdb1b7221dd556bf3be32feba0ed8afe"
+SRCREV = "6c37300c667e3049178f049a5b86e7ea955c9671"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 606b873..379fb00 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "6523d7c4843e1d4176035c46e1514c39bdcfc3bf"
+SRCREV = "0b68e91d68902c4d05d0bb8aa045ae76c4e8c9b5"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 1211898..15b69f4 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From c4c008c46291be290312b5674af1c1b9c446fa8e Mon Sep 17 00:00:00 2001
+From ff035d111c39a0f3b1b5a93e99d266341878f573 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 573b330..0cb4a10 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "bf5b49878d75d316f31225f76152e8381a3d5f0f"
+SRCREV = "99f384ac2353df89a1522e47c96cae6a945749e1"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 8a41551..378b1a0 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "d1f66746ab0b77b4f3300cbeeaafe61d25d78e98"
+SRCREV = "04762a9eecafc80ebeb90c06258de551d451497f"
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 328fdd7..ea00bfb 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "2170a3b0fcda613daf76a337fa45cb97e0714cdf"
+SRCREV = "d7d31d63db5f0029a4a5e24d998601baee8bade0"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 61b02a1..5cc3525 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -23,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "563ce3888f3c04abcc96ba236b20c7a822bc88e2"
+SRCREV = "e90625f00a3727ca1c89a94407b7686327d03c19"
diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
index c57943d..fb7c5e1 100644
--- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
+++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -1,4 +1,4 @@
-From d5faf29f8a41b0e28132fb23828cff8043174cb8 Mon Sep 17 00:00:00 2001
+From 0dcc16dafac2fec76c178f3b3195f57bb2ac3d8e Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:57:01 -0400
 Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
@@ -7,13 +7,13 @@ Upstream-Status: Pending
 
 Signed-off-by: Denys Dmytriyenko <denys@ti.com>
 ---
- examples/quick/controls/texteditor/src/documenthandler.cpp | 1 +
+ examples/quickcontrols/controls/texteditor/src/documenthandler.cpp | 1 +
  1 file changed, 1 insertion(+)
 
-diff --git a/examples/quick/controls/texteditor/src/documenthandler.cpp b/examples/quick/controls/texteditor/src/documenthandler.cpp
+diff --git a/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp b/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
 index 2e03f74..3d1b3c8 100644
---- a/examples/quick/controls/texteditor/src/documenthandler.cpp
-+++ b/examples/quick/controls/texteditor/src/documenthandler.cpp
+--- a/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
++++ b/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
 @@ -44,6 +44,7 @@
  #include <QtGui/QTextCursor>
  #include <QtGui/QFontDatabase>
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index e3c580f..37cd7ce 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -12,4 +12,4 @@ DEPENDS += "qtdeclarative"
 
 FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
 
-SRCREV = "ac152bfcd37f94453e9705b57ca6520ad30bade0"
+SRCREV = "eed9b9dd83f0db9cbfe794072d8f5147e3d1234a"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 7a5ca23..664b1f9 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "01e52200e2a76ec51c3bb9710617ac0c249a78bc"
+SRCREV = "84a26f223b220a444dec2b43fffc71dab7e00d1d"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 565ca84..98b296d 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "b16873afea798d08799d7a0b255b8d200337f35b"
+SRCREV = "9dc78a2d847bca5ec7b1445356523383a030d7ce"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 16c2095..7f5d783 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "0b00ee6f6c311a7f5c0b4f2441dad97a454d172e"
+SRCREV = "8b79fc4ee1c0510c13dc6f1494f37727e3f8c0cf"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 4139db1..af357e9 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "9a70ee2389d3302f6a4262325f8a76e4d867b478"
+SRCREV = "133dbd59fb04974149d2140b267fce91a7cfd4a2"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 6c300e5..f3249b1 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "e02df9c098b4d304b34c0ff65806a0576e45ed1a"
+SRCREV = "2d55b4996eaa26c973afdf15f6f703c0a1840a96"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index 8cbe0e0..de316a5 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -33,4 +33,4 @@ QT_MODULE_BRANCH = "dev"
 # qtsystems wasn't released yet, last tag before this SRCREV is 5.0.0-beta1
 # qt5-git PV is only to indicate that this recipe is compatible with qt5 5.6
 
-SRCREV = "236b6b544fd2049eb46e8f79d13bb7aa35ba002f"
+SRCREV = "434af789f0d56ca7a521ca2d9ec8cf3b1057fd37"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index dbb9438..25cf6fe 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From c6d62fcf2e02b5a86c36b4afd78dfb7a3f29ad91 Mon Sep 17 00:00:00 2001
+From 782bef8198cc5aacd7b11903a4e4739950d6b90c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH] Allow to build only lrelease + lupdate + lconvert
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index b5e9293..b314513 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From 34f23c43f1c656ccd424528821a9ac65a98c5fec Mon Sep 17 00:00:00 2001
+From b7e29ffe5f00847de7e87a183e0ff2ecf0cccb20 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH] assistant/help: fix linking of dependent libraries
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index f0f40b7..ea487c5 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From b77f225e25360832074692681c5ff7c13862102d Mon Sep 17 00:00:00 2001
+From 79a9f6a65355203fc49fa610f6bb9fe8ddd07cda Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 16ff71e..b9a68f8 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From e65c5ea9f7ce6fade201ed15b44dcb4d82219b3f Mon Sep 17 00:00:00 2001
+From a2d297031e08f986189761dafdac78a95db39de8 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index e0b23b4..5d06e94 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "e33532e048fa12ee32429ca83ee31aa8f065147d"
+SRCREV = "bda7ece99a8162118a91e9f475c149be39846ecd"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 93b147d..f7c1708 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "13f1f2f12ddfc9b84535361d77a5f0f0ec8c3e0f"
+SRCREV = "4925f90e9ceb0b4081649d1fc1eec10beb65f722"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index ca47da8..e4e25dc 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
+SRCREV = "d8b4bef3ddff327598027c8f94a61e3d0b61a2dd"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 45493cf..6c65e2a 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From cadcacf58301251629a63ecd2682d58e6bf24cb8 Mon Sep 17 00:00:00 2001
+From 58cea434f7b4f0f2469ba6e8eb892a448e20f6a6 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index f39707c..6402710 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From 52971db84e3b2c429e8777953c0532dcb88b8e6b Mon Sep 17 00:00:00 2001
+From 2be2c512d07fb013022c9ccb7d81308295e71866 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index a1cee86..8c8ded9 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
+SRCREV = "d8b4bef3ddff327598027c8f94a61e3d0b61a2dd"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 79c6b23..6a4f67e 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "64a106da72796377bbff5cce0ecc5a379b105498"
+SRCREV = "3b28a6956cb3cab087481312dc82a907b118e0de"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index 75350c1..28e5540 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,4 +1,4 @@
-From 04be78d20ecc23e289e171e907bb5daf9393619d Mon Sep 17 00:00:00 2001
+From 092e3c94fbec392c6b2f29bc2999595a10d0e66f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
 Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
@@ -6,7 +6,7 @@ Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/3rdparty/chromium/base/base.gypi | 2 +-
+ chromium/base/base.gypi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/3rdparty/chromium/base/base.gypi b/src/3rdparty/chromium/base/base.gypi
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index c95fad0..fed7f11 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From dde0edc1681bb49580584028c2d7b5757e177cd1 Mon Sep 17 00:00:00 2001
+From 8d94528e14cc00934a0beaac53fa990567740596 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 2df689b..8d984c7 100644
+index a4abf45..47311c6 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -131,9 +131,9 @@ defineReplace(mocOutput) {
+@@ -125,9 +125,9 @@ defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
    for(ext, $$list($${QMAKE_EXT_CPP})): \
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 00432bc..ab6dbb6 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,4 +1,4 @@
-From 3ae00f0217e4a0039f0855ea6cd945209b1734ee Mon Sep 17 00:00:00 2001
+From eaaf8074a826137d3ad061f4c09bb36f449188a3 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
 Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
@@ -7,7 +7,7 @@ Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
- src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
+ chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
  1 file changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 18f268c..822aefb 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From 6576e3135b839b53c422befac0a233f6dd1966bf Mon Sep 17 00:00:00 2001
+From 19f7088dd18c4966ec40501cd7e07a0ea16613ae Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH] functions.prf: Make sure we only use the file name to
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 8d984c7..055e960 100644
+index 47311c6..be2b2a5 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -128,7 +128,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -122,7 +122,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 78cb3fc..609330d 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From f4c64fbabdcc30d46d9181401aa1c9d78fcb0b2f Mon Sep 17 00:00:00 2001
+From 99e307a75a331e60cb9bcb6d75bc3e0afb8e1b24 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 055e960..379c9b5 100644
+index be2b2a5..fb650c2 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -5,6 +5,12 @@ defineTest(isPlatformSupported) {
diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 901462c..d6069ae 100644
--- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From a2670f5ad67822b399e9dd7b3b87589be1da9749 Mon Sep 17 00:00:00 2001
+From dd72b83e84d0c9f8034096ff2db3d826ba708eb6 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index 65bf25e..0447d07 100644
+index 0fd187a..54b4b7f 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -56,6 +56,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
index fa3faf4..d420c33 100644
--- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From b523c4dd76f6205389d8f5771124f0451ec7183f Mon Sep 17 00:00:00 2001
+From 149dd23e66b3e0ea64f090478ac974a51e0b6a42 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 427cd95..e25e8dd 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -119,8 +119,10 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "643aa579fc94933eefa8eb20af6729e2140cf480"
-SRCREV_chromium = "8252b18aa3efa52138e91f9756945afb142a1c8c"
+SRCREV_qtwebengine = "808ca6e6917cf17e4c30fcd3ac609164b36594cc"
+# This is in git submodule, but we're using latest in 45-based
+# SRCREV_chromium = "79930a541473b2e0f950d040c16ab6f22e4aeef3"
+SRCREV_chromium = "9d6566ee193e8996fb867cf776dc13f697400f24"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index 933220d..3f1ab50 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@bb.utils.contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
+SRCREV = "2a143bf81b2ffb3bd7a5f47cf719e6ed347bf383"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 1f3dd2a..2ed9558 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,4 +1,4 @@
-From 3e321803386278c52508d114f5096883e974a4bb Mon Sep 17 00:00:00 2001
+From 24f843d4b73de923712c40335068f6f32ff65c7c Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
 Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index 2114b42..ebed729 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,4 +1,4 @@
-From f1eb41ada1a9bb5f4073c8a48010555cbefeec34 Mon Sep 17 00:00:00 2001
+From 63d1bab5741e08b91549a55ff039eeac36e745b8 Mon Sep 17 00:00:00 2001
 From: Magnus Granberg <zorry@gentoo.org>
 Date: Fri, 27 Feb 2015 11:55:09 +0100
 Subject: [PATCH] Remove TEXTREL tag in x86
diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
index 5edc939..32a05c1 100644
--- a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -1,4 +1,4 @@
-From 5e5545f49d91e1c40d85d2497e16495ee9e53c11 Mon Sep 17 00:00:00 2001
+From cec1f02bcd1e484fe422e98562a093541c9c9011 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 5 Jun 2015 19:55:05 -0700
 Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index eb05ce2..c71850a 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -71,4 +71,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "71136c9621103522e85654c8e144d5f1c961de1c"
+SRCREV = "a6c9dd667d534d3342bfba456f9d5c146a924de0"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 66d9d74..7c2b785 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "ba9306ec5a1271275d79b2f48ceb227f79352f33"
+SRCREV = "e66dcd51d0e5517e88cd59912fd08501522a2902"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index d8beb50..a8f52ac 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "f27489d66cc6d8263130451c26c7e4ae40acc6b4"
+SRCREV = "df10edcfae328f397c99192b322268c9e96f6dab"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index d78df14..773d93c 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "5e6acdb2ea92add793835561e7a2d6b0ed8890f8"
+SRCREV = "c0b6fbcadbefcc8a91e5db7fd98662dddcd7a0f8"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.9.2


