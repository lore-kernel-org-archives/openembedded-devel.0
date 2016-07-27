Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id A158F606BF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 15:49:55 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so7093727wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jul 2016 08:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VunsZitdSw+UbNu8Jg542CMP1sV+fMIkw5HPnnzSRbo=;
	b=Jyr8uGc/6sWenC7bNwJ0t4hEMaqDC0EdOxhxULf1xl1FtE9g2hq2WxWA+uHK8NsWpO
	fhaz2FjnP74jDKxPetMidj0pF5rzu3SiEecgtjv126rdlRD2i+1B4x2rCiBOLuB8i5wk
	cHzwg6CoqX+vknO7BUe2ZDOJlznHepztdc60FevbTM2ipwdoK89GMXMZdrhtvZVK39wB
	+7zu4jyKElmidGT5D5jU6MRBJcI1+mVlNqh/SkOF8Xx/lfPUc+NKvxI+NFTYwUyqlhaR
	DhYYXk1C47sBHiOPSftFoBkbMWTl8YPtYmjXVxn0DPbId3HT+OXGJRyKHYfwaFnvbYuw
	rRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VunsZitdSw+UbNu8Jg542CMP1sV+fMIkw5HPnnzSRbo=;
	b=KUabSbFHzyska/7xOaIrIYyyWSmTjY4IEMjLh00kxHARCpKs/o5czbNSNQ+LLsVlo2
	9Pr6EbsrxJXME2cjG7j89NVkdBLNPzzsscZZXx269lJcQOFvtJVTR3swqyBoKzcSiwjF
	OS8toFuhgCZDq6F+U/ZjxCTY1z7kZPxm29Re+THkJsF0Y81ma1A0jy+vrg8CV/mUeevh
	+svrK8AceGjyW4plaaGAfM5vH7JTIk+QP2ODqXl5MQi7uc+a8TSg+Mm3Bv2PTkQWXNeU
	7d8nN2dwnOctR7j/aD5cJHu54xKyb40uj0z41x3GQZqIayUtv9QlcvHEx5d4xB78mrXm
	Ykmw==
X-Gm-Message-State: AEkoouuUnah2TfxUipLSghJLO8/zQGzedaq1XUdiyv+yT80kD4uVp/nc3Cu9Di+uOGhfgg==
X-Received: by 10.194.221.232 with SMTP id qh8mr28252824wjc.117.1469634593784; 
	Wed, 27 Jul 2016 08:49:53 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	c13sm7042473wjx.12.2016.07.27.08.49.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jul 2016 08:49:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jul 2016 17:49:53 +0200
Message-Id: <20160727154953.13918-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
Subject: [meta-qt5][WIP][PATCH] qt5: upgrade to latest revisions in 5.7 branch
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
X-List-Received-Date: Wed, 27 Jul 2016 15:49:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  9 ++++---
 .../qt5/qt3d/0001-Allow-a-tools-only-build.patch   |  2 +-
 recipes-qt/qt5/qt3d_git.bb                         |  4 +--
 recipes-qt/qt5/qt5-git.inc                         |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  8 +++---
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  | 24 ++++++++---------
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  2 +-
 .../0003-Add-external-hostbindir-option.patch      | 16 +++++------
 ...le-Fix-pkgconfig-and-libtool-replacements.patch |  6 ++---
 ...ump-path-length-from-256-to-512-character.patch |  6 ++---
 .../0006-QOpenGLPaintDevice-sub-area-support.patch |  6 ++---
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  2 +-
 ...configure-paths-for-target-qmake-properly.patch | 12 ++++-----
 ...GL-libraries-from-pkgconfig-and-defaults.patch} | 11 +++-----
 ...wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch} |  6 +----
 ...build-uic.patch => 0011-Always-build-uic.patch} |  6 ++---
 ...xternal-hostbindir-option-for-native-sdk.patch} | 14 +++++-----
 recipes-qt/qt5/qtbase_git.bb                       |  6 ++---
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtcharts_git.bb                     |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 recipes-qt/qt5/qtdatavis3d_git.bb                  |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  4 +--
 ...omparison-fix-QCoreApplication-has-not-be.patch |  2 +-
 recipes-qt/qt5/qtdeclarative_git.bb                |  2 +-
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |  2 +-
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch |  2 +-
 recipes-qt/qt5/qtmultimedia_git.bb                 |  4 +--
 ...etextinput-update-to-match-QWidgetLineCon.patch | 31 ----------------------
 recipes-qt/qt5/qtquick1_git.bb                     |  4 +--
 ...fix-invalid-use-of-incomplete-type-class-.patch | 10 +++----
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialbus_git.bb                  |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 recipes-qt/qt5/qtsvg_git.bb                        |  2 +-
 recipes-qt/qt5/qtsystems_git.bb                    |  2 +-
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  2 +-
 ...t-help-fix-linking-of-dependent-libraries.patch |  2 +-
 .../0003-add-noqtwebkit-configuration.patch        |  2 +-
 ...ols-cmake-allow-overriding-the-location-f.patch |  2 +-
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtvirtualkeyboard_git.bb            |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  2 +-
 ...yland-include-server-buffer-only-when-bui.patch |  6 ++---
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |  2 +-
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  4 +--
 ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |  4 +--
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  4 +--
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  4 +--
 ...quickwebengineview_p_p.h-add-include-QCol.patch |  4 +--
 ...-dependency-to-QCoreApplication-translate.patch |  2 +-
 recipes-qt/qt5/qtwebengine_git.bb                  |  6 +++--
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 67 files changed, 134 insertions(+), 167 deletions(-)
 rename recipes-qt/qt5/qtbase/{0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch => 0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch} (94%)
 rename recipes-qt/qt5/qtbase/{0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch => 0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch} (96%)
 rename recipes-qt/qt5/qtbase/{0009-Always-build-uic.patch => 0011-Always-build-uic.patch} (81%)
 rename recipes-qt/qt5/qtbase/{0010-Add-external-hostbindir-option-for-native-sdk.patch => 0012-Add-external-hostbindir-option-for-native-sdk.patch} (93%)
 delete mode 100644 recipes-qt/qt5/qtquick1/0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index b66c8a5..fe75ce4 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -30,12 +30,15 @@ SRC_URI += "\
     file://0005-configure-bump-path-length-from-256-to-512-character.patch \
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
+    file://0008-configure-paths-for-target-qmake-properly.patch \
+    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
+    file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0009-Always-build-uic.patch \
-    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0011-Always-build-uic.patch \
+    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 # CMake's toolchain configuration of nativesdk-qtbase
@@ -257,4 +260,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "84330007e12122bf1b690a4e68b5ef8e973c7882"
+SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
diff --git a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
index 8d69ca3..bb337fd 100644
--- a/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
+++ b/recipes-qt/qt5/qt3d/0001-Allow-a-tools-only-build.patch
@@ -1,4 +1,4 @@
-From 16a6bfc8f93f8d4e0d4a6e09cdfb0c4a8412e38f Mon Sep 17 00:00:00 2001
+From befe1fd63c485b8d10d1b9f1eca3368f3ee0042b Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Wed, 10 Feb 2016 09:02:09 +0200
 Subject: [PATCH] Allow a tools-only build
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index c3a5bc5..9708ec9 100644
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
 
-SRCREV = "be29a39ede4355a5aa18e93c27a75a1c3f81bde4"
+SRCREV = "c3fdb888fbd94de0f6b7b1a6859cba8132ecc93d"
 
 BBCLASSEXTEND += "native nativesdk"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index ad0abe8..e1e25ba 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -12,4 +12,4 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.6.99+5.7.0-beta+git${SRCPV}"
+PV = "5.7.0+git${SRCPV}"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 426e0ae..6b94f48 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -24,12 +24,14 @@ SRC_URI += "\
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
+    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
+    file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 # common for qtbase-native and nativesdk-qtbase
 SRC_URI += " \
-    file://0009-Always-build-uic.patch \
-    file://0010-Add-external-hostbindir-option-for-native-sdk.patch \
+    file://0011-Always-build-uic.patch \
+    file://0012-Add-external-hostbindir-option-for-native-sdk.patch \
 "
 
 CLEANBROKEN = "1"
@@ -117,4 +119,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "84330007e12122bf1b690a4e68b5ef8e973c7882"
+SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index af85fe9..b28ca8b 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 79f881eaa0a4a980963ce4ea1bc4c5e26c640c9a Mon Sep 17 00:00:00 2001
+From d6c75f788e15fb552eacb08359698a1342a97f20 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH] Add linux-oe-g++ platform
@@ -56,10 +56,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index b65c564..ffe6931 100755
+index 0ba0c31..052872e 100755
 --- a/configure
 +++ b/configure
-@@ -339,6 +339,16 @@ getQMakeConf()
+@@ -333,6 +333,16 @@ getQMakeConf()
      getSingleQMakeVariable "$1" "$specvals"
  }
  
@@ -76,8 +76,8 @@ index b65c564..ffe6931 100755
  getXQMakeConf()
  {
      if [ -z "$xspecvals" ]; then
-@@ -348,6 +358,16 @@ getXQMakeConf()
-     getSingleQMakeVariable "$1" "$xspecvals"
+@@ -357,6 +367,16 @@ testXConfig()
+     esac
  }
  
 +# OE qmake.conf is reading some variables from shell env
@@ -93,7 +93,7 @@ index b65c564..ffe6931 100755
  compilerSupportsFlag()
  {
      cat >conftest.cpp <<EOF
-@@ -569,24 +589,14 @@ fi
+@@ -578,24 +598,14 @@ fi
  # initalize variables
  #-------------------------------------------------------------------------------
  
@@ -124,7 +124,7 @@ index b65c564..ffe6931 100755
  fi'`
      eval "$cmd"
  done
-@@ -3428,7 +3438,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
+@@ -3443,7 +3453,7 @@ if [ "$XPLATFORM_MAC" = "yes" ]; then
      [ "$CFG_GTK" = "auto" ] && CFG_GTK=no
  fi
  
@@ -133,7 +133,7 @@ index b65c564..ffe6931 100755
  
  TEST_COMPILER=$QMAKE_CONF_COMPILER
  
-@@ -3479,7 +3489,7 @@ if [ "$XPLATFORM_ANDROID" = "yes" ] ; then
+@@ -3494,7 +3504,7 @@ if [ "$XPLATFORM_ANDROID" = "yes" ] ; then
      fi
  fi
  
@@ -142,7 +142,7 @@ index b65c564..ffe6931 100755
  
  GCC_MACHINE_DUMP=
  case "$TEST_COMPILER" in *g++) GCC_MACHINE_DUMP=$($TEST_COMPILER -dumpmachine);; esac
-@@ -3878,6 +3888,14 @@ setBootstrapVariable()
+@@ -3893,6 +3903,14 @@ setBootstrapVariable()
      getQMakeConf "$1" | echo ${2-$1} = `if [ -n "$3" ]; then sed "$3"; else cat; fi` >> "$mkfile"
  }
  
@@ -157,7 +157,7 @@ index b65c564..ffe6931 100755
  # build qmake
  if true; then ###[ '!' -f "$outpath/bin/qmake" ];
      echo "Creating qmake..."
-@@ -3977,6 +3995,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
+@@ -3986,6 +4004,7 @@ if true; then ###[ '!' -f "$outpath/bin/qmake" ];
              EXEEXT=
              ;;
          esac
@@ -166,10 +166,10 @@ index b65c564..ffe6931 100755
              echo "COCOA_LFLAGS =-framework Foundation -framework CoreServices" >>"$mkfile"
              echo "CARBON_LFLAGS =-framework ApplicationServices" >>"$mkfile"
 diff --git a/mkspecs/features/configure.prf b/mkspecs/features/configure.prf
-index 92c288c..f3019e0 100644
+index a890c7f..151630c 100644
 --- a/mkspecs/features/configure.prf
 +++ b/mkspecs/features/configure.prf
-@@ -63,14 +63,14 @@ defineTest(qtCompileTest) {
+@@ -71,14 +71,14 @@ defineTest(qtCompileTest) {
      }
  
      # Clean up after previous run
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 54895df..699e385 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From aaa1675d3c9f0d100f596ca4e2ddf3bd25fae5b6 Mon Sep 17 00:00:00 2001
+From e5f8607cfa1d2bcc798686cdf7c87ea0c6577d30 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 11cd97b..381cde2 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 502b95b840a5f79e5a68e9bd5b10dbdc92485f1f Mon Sep 17 00:00:00 2001
+From c1dc6165d6a085f162ed32ef5697f645019f9ee0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option
@@ -39,10 +39,10 @@ Change-Id: Iacaa1c5531cd6dcc094891610c351673db55d7b2
  7 files changed, 44 insertions(+), 8 deletions(-)
 
 diff --git a/configure b/configure
-index ffe6931..5aa87b4 100755
+index 052872e..1fcbb3a 100755
 --- a/configure
 +++ b/configure
-@@ -825,6 +825,7 @@ QT_HOST_BINS=
+@@ -834,6 +834,7 @@ QT_HOST_BINS=
  QT_HOST_LIBS=
  QT_HOST_DATA=
  QT_EXT_PREFIX=
@@ -50,7 +50,7 @@ index ffe6931..5aa87b4 100755
  
  #flags for SQL drivers
  QT_CFLAGS_PSQL=
-@@ -944,6 +945,7 @@ while [ "$#" -gt 0 ]; do
+@@ -953,6 +954,7 @@ while [ "$#" -gt 0 ]; do
      -testsdir| \
      -hostdatadir| \
      -hostbindir| \
@@ -58,7 +58,7 @@ index ffe6931..5aa87b4 100755
      -hostlibdir| \
      -extprefix| \
      -sysroot| \
-@@ -1176,6 +1178,9 @@ while [ "$#" -gt 0 ]; do
+@@ -1185,6 +1187,9 @@ while [ "$#" -gt 0 ]; do
      extprefix)
          QT_EXT_PREFIX="$VAL"
          ;;
@@ -68,7 +68,7 @@ index ffe6931..5aa87b4 100755
      pkg-config)
          if [ "$VAL" = "yes" ] || [ "$VAL" = "no" ]; then
              CFG_PKGCONFIG="$VAL"
-@@ -2438,6 +2443,10 @@ Installation options:
+@@ -2447,6 +2452,10 @@ Installation options:
      -hostdatadir <dir> . Data used by qmake will be installed to <dir>
                           (default HOSTPREFIX)
  
@@ -79,7 +79,7 @@ index ffe6931..5aa87b4 100755
  Configure options:
  
   The defaults (*) are usually acceptable. A plus (+) denotes a default value
-@@ -3196,6 +3205,11 @@ fi
+@@ -3209,6 +3218,11 @@ fi
  # command line and environment validation
  #-------------------------------------------------------------------------------
  
@@ -92,7 +92,7 @@ index ffe6931..5aa87b4 100755
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index cfac583..41ca7f1 100644
+index 54641ce..7d7baa4 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
 @@ -71,7 +71,11 @@ defineTest(qtHaveModule) {
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index b3677eb..e24d475 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From ac2f94a42878c1500e1ab6bbbec7834d9e5edfbb Mon Sep 17 00:00:00 2001
+From d83234c35de8f52ce3bf6eb262ad8e6af467ac34 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
@@ -68,7 +68,7 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
-index 03ec36a..2ab192b 100644
+index 71e96b4..0d7535c 100644
 --- a/mkspecs/features/qt.prf
 +++ b/mkspecs/features/qt.prf
 @@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
@@ -92,7 +92,7 @@ index 03ec36a..2ab192b 100644
  contains(QT_CONFIG, static) {
      QT_PLUGIN_VERIFY += QTPLUGIN
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index c1c668a..67d916d 100644
+index b367bc1..209cc43 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -38,7 +38,7 @@ contains(TEMPLATE, .*lib) {
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
index 404c068..d455d2c 100644
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From d108da324156b9d709c106c1698bd7466cb26f69 Mon Sep 17 00:00:00 2001
+From 60f490b57faf979a912074506a75c74767a27d3b Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH] configure: bump path length from 256 to 512 characters
@@ -14,10 +14,10 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 5aa87b4..17bca95 100755
+index 1fcbb3a..f49a674 100755
 --- a/configure
 +++ b/configure
-@@ -3832,10 +3832,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
+@@ -3847,10 +3847,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
  static const char qt_configure_installation          [12+11]    = "qt_instdate=2012-12-20";
  
  /* Installation Info */
diff --git a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
index 92ecb13..c58b1d9 100644
--- a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From 17450df40d6c163c85b66c1cc485317fd6f9a9c9 Mon Sep 17 00:00:00 2001
+From f207997b59f1381cf3523521209cb435b1a73f25 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH] QOpenGLPaintDevice sub-area support
@@ -140,10 +140,10 @@ index c9f3282..7c0616b 100644
      QOpenGLContext *ctx;
      EngineMode mode;
 diff --git a/src/gui/opengl/qopengltextureglyphcache.cpp b/src/gui/opengl/qopengltextureglyphcache.cpp
-index 8f69095..cf82ee7 100644
+index 9a7b1eb..6f301f8 100644
 --- a/src/gui/opengl/qopengltextureglyphcache.cpp
 +++ b/src/gui/opengl/qopengltextureglyphcache.cpp
-@@ -316,7 +316,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
+@@ -403,7 +403,7 @@ void QOpenGLTextureGlyphCache::resizeTextureData(int width, int height)
      funcs->glBindFramebuffer(GL_FRAMEBUFFER, (GLuint)oldFbo);
  
      if (pex != 0) {
diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
index 4cc8ce6..4ea4061 100644
--- a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -1,4 +1,4 @@
-From edb00662de57d0b6ddb39f80800cf3d20c6c07fd Mon Sep 17 00:00:00 2001
+From 7ab6ff7ba20a3173c10a76814d3c9ed312c80627 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Jun 2015 13:59:25 -0700
 Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLEN_T
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
index 106486f..bac1841 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
@@ -1,4 +1,4 @@
-From e1bc7a14ae9e433112006b1b6944f8b0e3f619ab Mon Sep 17 00:00:00 2001
+From 0f4ab3e27938002134e8f3f9eb12cf9c50b2ab95 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 13 Nov 2015 12:36:11 +0100
 Subject: [PATCH] configure paths for target qmake properly
@@ -19,10 +19,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 19 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index 17bca95..6abdd6b 100755
+index f49a674..d30d0ca 100755
 --- a/configure
 +++ b/configure
-@@ -3777,8 +3777,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
+@@ -3792,8 +3792,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
      QMAKE_CONFIG="$QMAKE_CONFIG compile_examples"
  fi
  
@@ -38,7 +38,7 @@ index 17bca95..6abdd6b 100755
  
  QT_CONFIGURE_STR_OFF=0
  
-@@ -3811,7 +3816,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
+@@ -3826,7 +3831,11 @@ QT_CONFIGURE_STRS_ALL=$QT_CONFIGURE_STRS
  
  QT_CONFIGURE_STR_OFFSETS=
  QT_CONFIGURE_STRS=
@@ -51,7 +51,7 @@ index 17bca95..6abdd6b 100755
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
-@@ -3823,6 +3832,12 @@ addConfStr "$shortspec"
+@@ -3838,6 +3847,12 @@ addConfStr "$shortspec"
  #-------------------------------------------------------------------------------
  [ -d "$outpath/src/corelib/global" ] || mkdir -p "$outpath/src/corelib/global"
  
@@ -64,7 +64,7 @@ index 17bca95..6abdd6b 100755
  cat > "$outpath/src/corelib/global/qconfig.cpp.new" <<EOF
  /* License Info */
  static const char qt_configure_licensee_str          [256 + 12] = "qt_lcnsuser=$Licensee";
-@@ -3835,7 +3850,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
+@@ -3850,7 +3865,7 @@ static const char qt_configure_installation          [12+11]    = "qt_instdate=2
  static const char qt_configure_prefix_path_str       [512 + 12] = "qt_prfxpath=$QT_INSTALL_PREFIX";
  #ifdef QT_BUILD_QMAKE
  static const char qt_configure_ext_prefix_path_str   [512 + 12] = "qt_epfxpath=$QT_EXT_PREFIX";
diff --git a/recipes-qt/qt5/qtbase/0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch b/recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
similarity index 94%
rename from recipes-qt/qt5/qtbase/0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
rename to recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
index 3c0b9e6..23d0ab3 100644
--- a/recipes-qt/qt5/qtbase/0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
+++ b/recipes-qt/qt5/qtbase/0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
@@ -1,4 +1,4 @@
-From d623d2c2ed49c4dc57fb0dde1faab20976dfc3dc Mon Sep 17 00:00:00 2001
+From 91b87aed0a2a96b0d6b54757ea13c75ee648a9b0 Mon Sep 17 00:00:00 2001
 From: Julien Gueytat <contact@jgueytat.fr>
 Date: Wed, 27 Apr 2016 19:24:39 +0200
 Subject: [PATCH] Reorder EGL libraries from pkgconfig and defaults:
@@ -59,10 +59,10 @@ index d8b1c3e..06f7241 100644
 +
 +CONFIG -= qt
 diff --git a/configure b/configure
-index 2e99d39..072838b 100755
+index d30d0ca..14f348c 100755
 --- a/configure
 +++ b/configure
-@@ -5803,7 +5803,9 @@ if [ "$CFG_EGL" != "no" ]; then
+@@ -5891,7 +5891,9 @@ if [ "$CFG_EGL" != "no" ]; then
          QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
          QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
          QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | sed -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
@@ -73,7 +73,7 @@ index 2e99d39..072838b 100755
      if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
          CFG_EGL=yes
          if compileTest qpa/egl-x11 "EGL-X11" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
-@@ -5826,8 +5828,18 @@ fi
+@@ -5914,8 +5916,18 @@ fi
  if [ "$CFG_EGLFS" != "no" ]; then
      if [ "$XPLATFORM_QNX" = "no" ] && [ "$CFG_OPENGL" != "no" ]; then
          CFG_EGLFS="$CFG_EGL"
@@ -93,6 +93,3 @@ index 2e99d39..072838b 100755
              CFG_EGLFS_BRCM=yes
          else
              CFG_EGLFS_BRCM=no
--- 
-1.9.1
-
diff --git a/recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch b/recipes-qt/qt5/qtbase/0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
similarity index 96%
rename from recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
rename to recipes-qt/qt5/qtbase/0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
index 7a24459..1d0ea3e 100644
--- a/recipes-qt/qt5/qtbase/0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
+++ b/recipes-qt/qt5/qtbase/0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch
@@ -1,4 +1,4 @@
-From f5a949e17aa8b37491fbc414c38557c9920fa1e5 Mon Sep 17 00:00:00 2001
+From b397a71531e31383ee86135e21072d033480f5bc Mon Sep 17 00:00:00 2001
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
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
similarity index 81%
rename from recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
rename to recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
index bee10d5..fb3d316 100644
--- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0011-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From 14b037afc3fa6992733891205a46b44991402afb Mon Sep 17 00:00:00 2001
+From 1b94b0f2579edcf870bc953f820af8fb2ec4376f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH] Always build uic
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/src.pro b/src/src.pro
-index 4a165a2..0f84791 100644
+index 3d18540..d128b3a 100644
 --- a/src/src.pro
 +++ b/src/src.pro
-@@ -180,7 +180,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
+@@ -195,7 +195,7 @@ contains(QT_CONFIG, concurrent):SUBDIRS += src_concurrent
          }
      }
  }
diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
similarity index 93%
rename from recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
rename to recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
index 949b323..1ab8abe 100644
--- a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0012-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From 6df8d620081bd78319fc97846e52b1a83042401a Mon Sep 17 00:00:00 2001
+From cb66a3193b1b1b8b402548b615c3675c4adcf13a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH] Add -external-hostbindir option for native(sdk)
@@ -37,10 +37,10 @@ Conflicts:
  5 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index 6abdd6b..7c5a066 100755
+index 14f348c..61f22e8 100755
 --- a/configure
 +++ b/configure
-@@ -3824,6 +3824,7 @@ fi
+@@ -3839,6 +3839,7 @@ fi
  addConfStr "$QT_REL_HOST_BINS"
  addConfStr "$QT_REL_HOST_LIBS"
  addConfStr "$QT_REL_HOST_DATA"
@@ -94,10 +94,10 @@ index 362d47d..a2326e2 100644
          HostSpecPath,
          HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 7fd0b98..47fa6c3 100644
+index 0fa205b..2921e2b 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1202,6 +1202,13 @@ void Configure::parseCmdLine()
+@@ -1219,6 +1219,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -111,7 +111,7 @@ index 7fd0b98..47fa6c3 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4121,6 +4128,9 @@ void Configure::generateQConfigCpp()
+@@ -4171,6 +4178,9 @@ void Configure::generateQConfigCpp()
  
      if (dictionary["QT_REL_HOST_DATA"].isEmpty())
          dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
@@ -121,7 +121,7 @@ index 7fd0b98..47fa6c3 100644
  
      confStringOff = 0;
      addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4140,6 +4150,7 @@ void Configure::generateQConfigCpp()
+@@ -4190,6 +4200,7 @@ void Configure::generateQConfigCpp()
      addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
      addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
      addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index a2a865d..8190456 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -20,8 +20,8 @@ SRC_URI += "\
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
-    file://0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
-    file://0011-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
+    file://0009-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
+    file://0010-Pretend-Qt5-wasn-t-found-if-OE_QMAKE_PATH_EXTERNAL_H.patch \
 "
 
 DEPENDS += "qtbase-native"
@@ -221,4 +221,4 @@ do_install_append() {
 
 RRECOMMENDS_${PN}-plugins += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libx11-locale', '', d)}"
 
-SRCREV = "84330007e12122bf1b690a4e68b5ef8e973c7882"
+SRCREV = "69b43e74d78e050cf5e40197acafa4bc9f90c0bd"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index a1c8f7f..8cf316b 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "32404e27101c5ec81b4ab965faf38263429bbc5a"
+SRCREV = "1568c60d2a0d1758acfeec9f002af7ff5b4d28ee"
diff --git a/recipes-qt/qt5/qtcharts_git.bb b/recipes-qt/qt5/qtcharts_git.bb
index 99d1471..21f6f13 100644
--- a/recipes-qt/qt5/qtcharts_git.bb
+++ b/recipes-qt/qt5/qtcharts_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia"
 
-SRCREV = "8a781841812a42ed728a76c0dcdcaa6196eac44e"
+SRCREV = "03a6177a3223f928a5f329c8b1fc4d5fe376deed"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index b84ad04..2920dda 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "f8759f683cfc433c432059e1160d2ab657baaec6"
+SRCREV = "8755a1f2460fa523782e27b6ca7a430a0176ac61"
diff --git a/recipes-qt/qt5/qtdatavis3d_git.bb b/recipes-qt/qt5/qtdatavis3d_git.bb
index ccdd1b3..50a0bcc 100644
--- a/recipes-qt/qt5/qtdatavis3d_git.bb
+++ b/recipes-qt/qt5/qtdatavis3d_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtxmlpatterns"
 
-SRCREV = "2f6074fde0ec050c77f881e0d2ce265fa93a0fcc"
+SRCREV = "d6a8da66dc3c141621c9be4b7509a6e43c60e15c"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index 1a8a5f0..b71e3a4 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From c978b2ed0e1ce48b2d4a4a6eb660927bc88aed57 Mon Sep 17 00:00:00 2001
+From 0d742f34ef91fb4e35c68b1274f68daef594f0c3 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -47,7 +47,7 @@ index c9d78e2..5861613 100644
  SOURCES += tst_qjsengine.cpp
  RESOURCES += qjsengine.qrc
 diff --git a/tests/auto/qmltest/qmltest.pro b/tests/auto/qmltest/qmltest.pro
-index 54db7a7..8c6986c 100644
+index 52fd6bf..843cae6 100644
 --- a/tests/auto/qmltest/qmltest.pro
 +++ b/tests/auto/qmltest/qmltest.pro
 @@ -4,6 +4,7 @@ CONFIG += qmltestcase
diff --git a/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch b/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
index dc707ab..d0d0f8e 100644
--- a/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
+++ b/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
@@ -1,4 +1,4 @@
-From 493e91c9c3527d577f7051de9a582a178ca43fcf Mon Sep 17 00:00:00 2001
+From 6b1cef42f828cd2374739aa7e3b3800d579315d6 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:38:58 -0400
 Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 5e96633..a0f4ced 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -34,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "31ef2e858c2a0835c040b3199c9557f0f6c66808"
+SRCREV = "d48b397cc79265e80c8437888f9ded0b0364e418"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index d5e8dfa..6088c4d 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "0f6e294fb8534f677a5ec75113679cfe24f559c1"
+SRCREV = "cedca298f081e1c1cdac615eed6171fe687f35e2"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 1ecc4f7..5780d7f 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "d85fd81f338f9c6f2e95b92b2cb9ccd4f9889c6b"
+SRCREV = "d3023be0d839440ac046adf2af75d9e4306dd5ef"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 11a9726..03432c9 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From 6f01ba8602a4efdb31bf01bf58aa4cb23552e9ac Mon Sep 17 00:00:00 2001
+From 7eb3fddc70871048f170211a88194c8cdeeca4dd Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 6c983c2..76bceda 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'jasper', 'CONFIG+
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "42b07b2ddf443d3eafd18e169f2e5ab5e36604a5"
+SRCREV = "d4401c9f519dfe82c38fe9ded674e454655f1866"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index ce240c5..7a9ecb4 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "e41c3a9b345536ccee0840ac6f049173aa6a0785"
+SRCREV = "4e1008b4ac1eea776585ca41a6a3db127cf500ff"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index 81fcd39..fa6b585 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From df587e2a3bb2aa297088bd3ada4309c4b9a85195 Mon Sep 17 00:00:00 2001
+From 26fd6cf787a7a413d54205b8b42d16a63ed5d36a Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 5c72337..746a1b1 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -32,7 +32,7 @@ EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'gstreamer010', 'G
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains_any('PACKAGECONFIG', 'gstreamer gstreamer010', '', 'CONFIG+=done_config_gstreamer', d)}"
 
 SRC_URI += "\
-     file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
+    file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "c85fd6df07935b9c0fa08f881271cd94ad100003"
+SRCREV = "1be4f74843b41f8bc1d1d64e83485f4eb864e8b4"
diff --git a/recipes-qt/qt5/qtquick1/0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch b/recipes-qt/qt5/qtquick1/0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch
deleted file mode 100644
index 27a2140..0000000
--- a/recipes-qt/qt5/qtquick1/0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 450d5dee6cc4f35a7475af507b90ba67327ad724 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 26 Apr 2016 17:48:18 +0200
-Subject: [PATCH] qdeclarativetextinput: update to match QWidgetLineControl API
- change
-
-* setCursorBlinkPeriod was replaced with setBlinkingCursorEnabled &
-  updateCursorBlinking in qtbase commit:
-  commit 1b5bc9723c0b23ca5197097c3087df6bbe024a2a
-  Author: Richard Moe Gustavsen <richard.gustavsen@theqtcompany.com>
-  Date:   Tue Apr 19 10:15:54 2016 +0200
-  Subject: QWidgetLineControl: respect run-time changes to cursorFlashTime
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/declarative/graphicsitems/qdeclarativetextinput.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/declarative/graphicsitems/qdeclarativetextinput.cpp b/src/declarative/graphicsitems/qdeclarativetextinput.cpp
-index 3ff75fd..e39d1af 100644
---- a/src/declarative/graphicsitems/qdeclarativetextinput.cpp
-+++ b/src/declarative/graphicsitems/qdeclarativetextinput.cpp
-@@ -514,7 +514,7 @@ void QDeclarativeTextInput::setCursorVisible(bool on)
-     if (d->cursorVisible == on)
-         return;
-     d->cursorVisible = on;
--    d->control->setCursorBlinkPeriod(on?QApplication::cursorFlashTime():0);
-+    d->control->setBlinkingCursorEnabled(on);
-     QRect r = d->control->cursorRect();
-     if (d->control->inputMask().isEmpty())
-         updateRect(r);
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index e34cc22..9e2ec02 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -16,8 +16,6 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtscript qtsvg qtxmlpatterns"
 # qttools
 
-SRC_URI += "file://0001-qdeclarativetextinput-update-to-match-QWidgetLineCon.patch"
-
 PACKAGECONFIG ??= "webkit"
 PACKAGECONFIG[webkit] = "CONFIG+=enable-webkit,CONFIG-=enable-webkit,qtwebkit"
 
@@ -25,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "5e3bd5cb28e7af95b289a617ca2f7a8892498225"
+SRCREV = "857fc5ec4644a6111ba8725e4e1a84dd5ea6bfca"
diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
index ad2b489..85fcc15 100644
--- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
+++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -1,4 +1,4 @@
-From 00bb7694b9287f23d4d059ae134e9409db69673e Mon Sep 17 00:00:00 2001
+From fca6212d5ebc5851f28e820e4ff0ebe04a9d44d7 Mon Sep 17 00:00:00 2001
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
 index bdecf5b..811a761 100644
---- a/examples/quick/controls/texteditor/src/documenthandler.cpp
-+++ b/examples/quick/controls/texteditor/src/documenthandler.cpp
+--- a/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
++++ b/examples/quickcontrols/controls/texteditor/src/documenthandler.cpp
 @@ -54,6 +54,7 @@
  #include <QtGui/QTextCursor>
  #include <QtGui/QFontDatabase>
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 00fe4fc..7271a19 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative"
 
-SRCREV = "2a5c64a1ddf5b6fdb9104faf99260925a327b2f4"
+SRCREV = "cc0ee8e4f3345023f1b85fc815739c0a75ea5686"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index 9231a79..ed1947e 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "3411c3579fb9e767c819c0c8d9f35c52c9964b06"
+SRCREV = "37f8b753be1b16975220c8b611b17a428eafb9e9"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index 7859ec5..63d9b63 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "b49bfdaad11be1de632f907d43485a7ac701ddc5"
+SRCREV = "b8845794b95376e8be39dbdafca2c85b5ec4c195"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 1098f25..1d7e134 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "33d15b76dfdb95da5970b8e0294bbb87ea1eb9a8"
+SRCREV = "e03c37077ea4841b9e0b591d29a34737d7d8dd32"
diff --git a/recipes-qt/qt5/qtserialbus_git.bb b/recipes-qt/qt5/qtserialbus_git.bb
index 731bd48..3cde771 100644
--- a/recipes-qt/qt5/qtserialbus_git.bb
+++ b/recipes-qt/qt5/qtserialbus_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtserialport"
 
-SRCREV = "f9201ca7bad9220149fb39b89914e83a4a14dffc"
+SRCREV = "88554d068d287870740b842864a50604f53e8509"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index b16978b..d5f37d5 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "84feab670cce8414ad54f4d19b46291c7fdb14cf"
+SRCREV = "7346857f4f675f57572d54f15cfad9111af2abde"
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 09fef6c..6f5d7ab 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "612c3041475550837dee7149b9f5e9e4f55c17a0"
+SRCREV = "64ca369c7e3d61f0416bc1fd6a102f0c62924433"
diff --git a/recipes-qt/qt5/qtsystems_git.bb b/recipes-qt/qt5/qtsystems_git.bb
index a467f99..7c155a2 100644
--- a/recipes-qt/qt5/qtsystems_git.bb
+++ b/recipes-qt/qt5/qtsystems_git.bb
@@ -30,4 +30,4 @@ do_install_append() {
 
 QT_MODULE_BRANCH = "dev"
 
-SRCREV = "236b6b544fd2049eb46e8f79d13bb7aa35ba002f"
+SRCREV = "434af789f0d56ca7a521ca2d9ec8cf3b1057fd37"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 8cf6ada..94cd048 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,4 +1,4 @@
-From e80743f15443212823e95d2be82073980a4700bc Mon Sep 17 00:00:00 2001
+From 68ecc4f25789321fc29ec9e4981fcfa27e706f1c Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
 Subject: [PATCH] Allow to build only lrelease + lupdate + lconvert
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index fe8fe3d..17d5d51 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,4 +1,4 @@
-From d7943b08bdb858bd2501c93a428ebc13bc9f3cfc Mon Sep 17 00:00:00 2001
+From 95a418157ce5f49052ec1c349581d1811a79c9eb Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
 Subject: [PATCH] assistant/help: fix linking of dependent libraries
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index aca2fbc..88c39c7 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,4 +1,4 @@
-From 6c5bbd423c3c8f87d00c18384460ab418dccea95 Mon Sep 17 00:00:00 2001
+From a798e469e69e31248610a3b5f29c63c5d12cda26 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
 Subject: [PATCH] add noqtwebkit configuration
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 4f59980..1a201de 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,4 +1,4 @@
-From 3dfe38ac9b83ee94c8abfe1bb78b14050b0c9a6f Mon Sep 17 00:00:00 2001
+From f805a2bf4a0d35a01726d214279ba1caa81b278f Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
 Subject: [PATCH] linguist-tools cmake: allow overriding the location for
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index fbc5a38..6982377 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@bb.utils.contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "d36d2c3026cae67c119384f47cb2680552c81aaf"
+SRCREV = "0597b535f82d3458a1db1828c5e5f725bbcf59fd"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index 70f57bf..0c4025a 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "745f8d5329d0d6d98a8577a254d2ee3e7174634e"
+SRCREV = "2209b3fd6a56bfc44da5369c4fbd345bbca31777"
diff --git a/recipes-qt/qt5/qtvirtualkeyboard_git.bb b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
index a8fcb9c..ff478f3 100644
--- a/recipes-qt/qt5/qtvirtualkeyboard_git.bb
+++ b/recipes-qt/qt5/qtvirtualkeyboard_git.bb
@@ -8,4 +8,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtmultimedia qtquickcontrols qtsvg qtxmlpatterns"
 
-SRCREV = "42344a4b21b95bce913d60267d554ac17e120af1"
+SRCREV = "626e78c9660cff063e1f9370538b5a424631571c"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 505f19b..c8844fb 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "bfa66ccb29f747e2cb07a4f2e561b165be9f211d"
+SRCREV = "a172672484b9496819e588b51ac2ff9fb4a21941"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index c199f71..847ba06 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 4334643f02fc333fa8b633ff614fa4ceecf4a8e6 Mon Sep 17 00:00:00 2001
+From 47457635603ddb484a479834a052699cce5b34a3 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 72f2953..a21c109 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From 3c5c13f2f991cc79363969fb3873d553dd985e7b Mon Sep 17 00:00:00 2001
+From 733a85c14cb4ade510a0c78b32cd12cb2d70dbbd Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -14,10 +14,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/examples/wayland/wayland.pro b/examples/wayland/wayland.pro
-index b67d12e..c5daad0 100644
+index 503190c..9943c52 100644
 --- a/examples/wayland/wayland.pro
 +++ b/examples/wayland/wayland.pro
-@@ -9,4 +9,6 @@ qtHaveModule(quick) {
+@@ -10,4 +10,6 @@ qtHaveModule(quick) {
      SUBDIRS += custom-extension
  }
  
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index df42f30..d0238c1 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -45,4 +45,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "bfa66ccb29f747e2cb07a4f2e561b165be9f211d"
+SRCREV = "a172672484b9496819e588b51ac2ff9fb4a21941"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 869851b..01b098b 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "a2c3b32d08ed24279609a8c01b09c1147a9ff6b9"
+SRCREV = "3836fd7d12777fc53836a72d6542d2fbf2f20ac9"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index 5fd3f06..ccd43e2 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,4 +1,4 @@
-From 66af547c2b3ed473b81421aa239d931d364f644d Mon Sep 17 00:00:00 2001
+From db56cd0fd185a9f3858f5aa6e95b24e63dee119f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
 Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 287bf2b..b7bd5a4 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From d28e6ef9c684a7f8f59995995b5cb5a0b1791ee1 Mon Sep 17 00:00:00 2001
+From 793db05d66b7a92ebe069dc76093487489dd8b69 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -10,7 +10,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 26db26f..277bf98 100644
+index 20fb278..7aa0b4a 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -168,9 +168,9 @@ defineReplace(mocOutput) {
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index d5ed1ab..34f58de 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,4 +1,4 @@
-From e40a18da9631fa21202836caf69b3343e8bae973 Mon Sep 17 00:00:00 2001
+From de6311b4d556abbe131462a3cd962ae87da59522 Mon Sep 17 00:00:00 2001
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
index 38e97d1..e487c6a 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From 9f314e95248795bcce787f88bce77ba6058b34c7 Mon Sep 17 00:00:00 2001
+From aa5bb11072bc0e441dc6533f53ed5359c5000088 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH] functions.prf: Make sure we only use the file name to
@@ -11,7 +11,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 277bf98..d263be4 100644
+index 7aa0b4a..9b3a639 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -165,7 +165,8 @@ defineReplace(findIncludedMocFiles) {
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index e041063..786a383 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 617028757a9afd334a0938e617429cca78363d69 Mon Sep 17 00:00:00 2001
+From 6918d25c54ec4bc17a9b612c0d24b0f01be3aca1 Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 6 insertions(+)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index d263be4..879287a 100644
+index 9b3a639..dc5ed1c 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -5,6 +5,12 @@ defineTest(isPlatformSupported) {
diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 0a708af..d10ddf7 100644
--- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,4 +1,4 @@
-From d084661f50dbdc6a4014f9a2181462bba770437f Mon Sep 17 00:00:00 2001
+From 6ed60f35761ab268004727be544e9ccf70594211 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
 Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index 892e99c..a4429d5 100644
+index f13bfd0..0e12244 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -60,6 +60,8 @@
diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
index 3a97a4a..27bd141 100644
--- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,4 +1,4 @@
-From 0999fbfe32480e737f23ed8fce8f35897b97c20a Mon Sep 17 00:00:00 2001
+From 4105c12d6f91171934f60b4dbb74b1ca7a9a3eb2 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
 Subject: [PATCH] Include dependency to QCoreApplication::translate()
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 48c955c..ee6993a 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -122,8 +122,10 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "63cf26268996ae5580c77095a252696fa549b593"
-SRCREV_chromium = "ba40ed24a6d23e606397b650a7982b0998dbeaf4"
+SRCREV_qtwebengine = "dbf7dd27428ff755444eac5e975cb69802ac9771"
+# This is in git submodule, but we're using the latest in 49-based
+# SRCREV_chromium = "c109a95a067af783e48f93d1cdeca870cda98878"
+SRCREV_chromium = "29c16917b33c26ad32893fa05af971c6c6f50297"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 58b86c8..78ca1f5 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -83,4 +83,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "2e8517924b70a778463e463873eb3d8d0b623eed"
+SRCREV = "76e2732f013732461c09a1d6c6b4c77fcab1c0d0"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 282ae98..8c238db 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "00156d63eea2fb7681a8a00a3144392d6325e5cb"
+SRCREV = "8d17ddfc2f62df56ac067bd0f9736c6e8d37aa97"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index e422817..9a4d6d7 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "b414120c60ef8c3cc2aad7dca41092647d741a36"
+SRCREV = "bae8bfc7a811af2bf51b227cbf8467e50a2a149a"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 33cedd6..92ef7e4 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "fb1dc19bf195c530b7f44d18cc927472b9866a46"
+SRCREV = "574d92a43e1fc5480a7f5f79cc6baf566a53349f"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.9.2


