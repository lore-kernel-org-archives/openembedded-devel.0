Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id EA26D6011C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 20:06:12 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id e201so63310254wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4K7UAknslGLzCF5SzlRkt7HCZj6QGF/Vszbp5vFDyP8=;
	b=G987nbDUj0e0rpviH8UDflIM/CLq25BDTlkE5Imu9EeFmHFQ96y/ssAvLU7MCg1BwW
	Cclfv53qGEnRSpPdID7zolPWLtgPY+cGN6boNT0sw7zx98CCrsBHDp7ZBrrNRKyA4NjE
	CDga2o3CX5MEVRPNWntwI2WKqop9jTmyk9pcCbDBs6s9LWU3LazzN3rYc7KDdWWzlcl7
	7RZtpaTaqYPt57a0fQ4DPgq80xtVH0nweROKo9yxUbtvecYvD+ZS8uzXXxBiATeWWj1w
	e/V1cEgw3eupbk+7cwX3kuWZMeFbTueeYzLJAYLNQIPEe+K1BMhOBwwS6LScnK3pNxL4
	Lg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4K7UAknslGLzCF5SzlRkt7HCZj6QGF/Vszbp5vFDyP8=;
	b=cxT/WJjxxFbhmwIlOnK5Hu8FmVH7M1vtDDI79/gvDCdtNsRIaU5ibjMZ+dzWrG3Z+7
	c6FRjdt2xcgx4lKNiWyKZHO4CKzzu143Qwm/L9qMI4l4fkws4GDutDyjoX9dO2fQ8DiR
	U7RUNfgq2jAYIaNGo1TznS+SMetUcRP3Nm0Q0MjO8+iI3ml+oI2li8q/i964KDMkCEii
	MY/hsUma1p2sBEpxi3kq3m2iFr0eG2ds1ygOFO9VHMWkun4bb4SnPC4AgQ+476rqDmrz
	omU0mZuefyYz7gYyBEDNCMSEsNQ+iKtJQcjc/Tpcd3SwUlS+glX3yb8+bNeb5IMeO4Xe
	gzwQ==
X-Gm-Message-State: AOPr4FWloSobMYUkl0tQHREVz6lNlQ9SwmgJZY9bdVsvjfYSvrwWSrKSD/6N+I4TNol+UQ==
X-Received: by 10.28.24.195 with SMTP id 186mr11028366wmy.30.1461182771790;
	Wed, 20 Apr 2016 13:06:11 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id gt7sm7261104wjc.1.2016.04.20.13.06.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Apr 2016 13:06:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2016 22:08:10 +0200
Message-Id: <1461182890-27344-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH][WIP][meta-qt5] qt5: upgrade to latest revision in 5.6 branch
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
X-List-Received-Date: Wed, 20 Apr 2016 20:06:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
  and
  qtwebkit/0004-Fix-linking-with-libpthread.patch
  were resolved upstream
* all patches were refreshed with:
  git format-patch --no-numbered --no-signature -NUMBER
  to remove numbering from Subject (it's good enough in filename) and to
  remove git version from signature (so it doesn't look differently when
  generated on different hosts with different git version).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb             |  2 +-
 recipes-qt/qt5/qtbase-native_git.bb                |  2 +-
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  9 ++----
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  9 ++----
 .../0003-Add-external-hostbindir-option.patch      | 13 ++++-----
 ...le-Fix-pkgconfig-and-libtool-replacements.patch | 13 ++++-----
 ...ump-path-length-from-256-to-512-character.patch |  9 ++----
 .../0006-QOpenGLPaintDevice-sub-area-support.patch |  7 ++---
 ...Invert-conditional-for-defining-QT_SOCKLE.patch |  8 ++----
 ...configure-paths-for-target-qmake-properly.patch |  9 ++----
 recipes-qt/qt5/qtbase/0009-Always-build-uic.patch  |  7 ++---
 ...external-hostbindir-option-for-native-sdk.patch | 17 +++++------
 recipes-qt/qt5/qtbase_git.bb                       |  2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                   |  2 +-
 recipes-qt/qt5/qtconnectivity_git.bb               |  2 +-
 .../0001-qmltestexample-fix-link.patch             |  5 +---
 ...mparison-fix-QCoreApplication-has-not-be.patch} |  5 +---
 recipes-qt/qt5/qtdeclarative_git.bb                |  4 +--
 recipes-qt/qt5/qtenginio_git.bb                    |  2 +-
 recipes-qt/qt5/qtgraphicaleffects_git.bb           |  2 +-
 ...ats.pro-Make-the-dependencies-determinist.patch |  5 +---
 recipes-qt/qt5/qtimageformats_git.bb               |  2 +-
 recipes-qt/qt5/qtlocation_git.bb                   |  2 +-
 ...1-Initial-porting-effort-to-GStreamer-1.0.patch |  5 +---
 recipes-qt/qt5/qtmultimedia_git.bb                 |  2 +-
 recipes-qt/qt5/qtquick1_git.bb                     |  2 +-
 ...fix-invalid-use-of-incomplete-type-class-.patch |  7 ++---
 recipes-qt/qt5/qtquickcontrols2_git.bb             |  2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb              |  2 +-
 recipes-qt/qt5/qtscript_git.bb                     |  2 +-
 recipes-qt/qt5/qtsensors_git.bb                    |  2 +-
 recipes-qt/qt5/qtserialport_git.bb                 |  2 +-
 ...pro-use-DEPLOYMENT-only-for-wince-like-ot.patch | 30 --------------------
 recipes-qt/qt5/qtsvg_git.bb                        |  4 +--
 ...w-to-build-only-lrelease-lupdate-lconvert.patch |  7 ++---
 ...t-help-fix-linking-of-dependent-libraries.patch | 15 ++++------
 .../0003-add-noqtwebkit-configuration.patch        |  7 ++---
 ...ols-cmake-allow-overriding-the-location-f.patch |  7 ++---
 recipes-qt/qt5/qttools_git.bb                      |  2 +-
 recipes-qt/qt5/qttranslations_git.bb               |  2 +-
 recipes-qt/qt5/qtwayland-native_git.bb             |  2 +-
 ...-qtwaylandscanner-tool-to-the-native-side.patch |  5 +---
 ...yland-include-server-buffer-only-when-bui.patch |  5 +---
 recipes-qt/qt5/qtwayland_git.bb                    |  2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                 |  2 +-
 ...se.gypi-include-atomicops_internals_x86_g.patch |  9 ++----
 ...rf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch |  7 ++---
 ...ange-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch |  7 ++---
 ...rf-Make-sure-we-only-use-the-file-name-to.patch |  7 ++---
 ...s.prf-allow-build-for-linux-oe-g-platform.patch |  7 ++---
 ...quickwebengineview_p_p.h-add-include-QCol.patch |  9 ++----
 ...-dependency-to-QCoreApplication-translate.patch |  7 ++---
 recipes-qt/qt5/qtwebengine_git.bb                  |  4 +--
 recipes-qt/qt5/qtwebkit-examples_git.bb            |  2 +-
 .../0001-qtwebkit-fix-QA-issue-bad-RPATH.patch     |  7 ++---
 .../qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch  |  7 ++---
 ...ude-backtrace-API-for-non-glibc-libraries.patch |  7 ++---
 .../0004-Fix-linking-with-libpthread.patch         | 33 ----------------------
 recipes-qt/qt5/qtwebkit_git.bb                     |  2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                 |  2 +-
 recipes-qt/qt5/qtx11extras_git.bb                  |  2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                |  2 +-
 62 files changed, 108 insertions(+), 267 deletions(-)
 rename recipes-qt/qt5/qtdeclarative/{0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch => 0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch} (91%)
 delete mode 100644 recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
 delete mode 100644 recipes-qt/qt5/qtwebkit/0004-Fix-linking-with-libpthread.patch

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 0bdfde5..4e55141 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -257,4 +257,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "41706400f605524a5a9953714aa0cfbf811dba7e"
+SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 78621b6..73900af 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -117,4 +117,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
+SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 68c3987..522afcd 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From bf8e0e2292c8a9233d55714aab5eb780c62a132d Mon Sep 17 00:00:00 2001
+From cabe9683b82493e2547e87ae0057f44f71efe519 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/10] Add linux-oe-g++ platform
+Subject: [PATCH] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
@@ -56,7 +56,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  create mode 100644 mkspecs/linux-oe-g++/qplatformdefs.h
 
 diff --git a/configure b/configure
-index f247401..011cd70 100755
+index 3e97c98..88a308d 100755
 --- a/configure
 +++ b/configure
 @@ -342,6 +342,16 @@ getQMakeConf()
@@ -361,6 +361,3 @@ index 0000000..dd12003
 +#endif
 +
 +#endif // QPLATFORMDEFS_H
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 3884c9c..0b0650d 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,8 +1,8 @@
-From 0d1049d3097f674260622adeb9ae8c5f4d6d0a44 Mon Sep 17 00:00:00 2001
+From 1edd17d452a7e9eeb2931b3c5697a4fc0ec4e6bc Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/10] qlibraryinfo: allow to set qt.conf from the outside
- using the environment
+Subject: [PATCH] qlibraryinfo: allow to set qt.conf from the outside using the
+ environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
 to inject new prefixes and other paths into qmake. This is needed when using
@@ -34,6 +34,3 @@ index 8bcacca..e1c87b5 100644
      if (QFile::exists(qtconfig))
          return new QSettings(qtconfig, QSettings::IniFormat);
  #ifdef QT_BUILD_QMAKE
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index f7feaec..ca271e6 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
-From 8bc74542bab1f29dfb4a0e5a2af2f8d91f049579 Mon Sep 17 00:00:00 2001
+From 3ecdcb6a10d125f1440c42ad9c79f04d43c257e0 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/10] Add -external-hostbindir option
+Subject: [PATCH] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -37,7 +37,7 @@ Conflicts:
  7 files changed, 38 insertions(+), 12 deletions(-)
 
 diff --git a/configure b/configure
-index 011cd70..d30b6e5 100755
+index 88a308d..f2611ed 100755
 --- a/configure
 +++ b/configure
 @@ -810,6 +810,7 @@ QT_HOST_BINS=
@@ -90,10 +90,10 @@ index 011cd70..d30b6e5 100755
  CFG_QCONFIG_PATH=$relpath/src/corelib/global/qconfig-${CFG_QCONFIG}.h
  case "$CFG_QCONFIG" in
 diff --git a/mkspecs/features/qt_functions.prf b/mkspecs/features/qt_functions.prf
-index b2c2507..fba4a58 100644
+index 8639695..d89d948 100644
 --- a/mkspecs/features/qt_functions.prf
 +++ b/mkspecs/features/qt_functions.prf
-@@ -57,7 +57,11 @@ defineTest(qtHaveModule) {
+@@ -70,7 +70,11 @@ defineTest(qtHaveModule) {
  defineTest(qtPrepareTool) {
      cmd = $$eval(QT_TOOL.$${2}.binary)
      isEmpty(cmd) {
@@ -224,6 +224,3 @@ index 99d87e2..5621dc0 100644
  !!ENDIF
      _qt5_Widgets_check_file_exists(${imported_location})
  
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index 4807df0..a35b6a2 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,7 +1,7 @@
-From db746d1ca0c41fe3da103d09fc240a0df9db5404 Mon Sep 17 00:00:00 2001
+From 7e5713e7f4807e204cd4a9f874cb1ca2985fc630 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 04/10] qt_module: Fix pkgconfig and libtool replacements
+Subject: [PATCH] qt_module: Fix pkgconfig and libtool replacements
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -68,10 +68,10 @@ Signed-off-by: Jonathan Liu <net147@gmail.com>
  2 files changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/mkspecs/features/qt.prf b/mkspecs/features/qt.prf
-index f62b6bb..91be8b3 100644
+index 75b84ff..ab36fa6 100644
 --- a/mkspecs/features/qt.prf
 +++ b/mkspecs/features/qt.prf
-@@ -321,6 +321,19 @@ contains(TEMPLATE, .*app) {
+@@ -317,6 +317,19 @@ contains(TEMPLATE, .*app) {
      QTPLUGIN = $$manualplugs $$autoplugs
  }
  
@@ -92,7 +92,7 @@ index f62b6bb..91be8b3 100644
  contains(QT_CONFIG, static) {
      QT_PLUGIN_VERIFY += QTPLUGIN
 diff --git a/mkspecs/features/qt_common.prf b/mkspecs/features/qt_common.prf
-index 38602f6..f9c401f 100644
+index cc8ed87..b7d4be2 100644
 --- a/mkspecs/features/qt_common.prf
 +++ b/mkspecs/features/qt_common.prf
 @@ -38,7 +38,7 @@ contains(TEMPLATE, .*lib) {
@@ -104,6 +104,3 @@ index 38602f6..f9c401f 100644
      }
      lib_replace.CONFIG = path
      QMAKE_PRL_INSTALL_REPLACE += lib_replace
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
index 53ab37f..e21b36d 100644
--- a/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0005-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,7 +1,7 @@
-From 561957e83aa0bc1404654506d1ae83251539d0eb Mon Sep 17 00:00:00 2001
+From e6ed023b0210375e594b7b61dfb620deb486ee8c Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
-Subject: [PATCH 05/10] configure: bump path length from 256 to 512 characters
+Subject: [PATCH] configure: bump path length from 256 to 512 characters
 
 Increase the path length that gets hardcoded into generated config.cpp file
 from 256 to 512 characters, as nativesdk path can be quite long.
@@ -14,7 +14,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index d30b6e5..aeb4ef2 100755
+index f2611ed..24a61db 100755
 --- a/configure
 +++ b/configure
 @@ -3930,10 +3930,10 @@ static const char qt_configure_licensed_products_str [256 + 12] = "qt_lcnsprod=$
@@ -31,6 +31,3 @@ index d30b6e5..aeb4ef2 100755
  #endif
  
  static const short qt_configure_str_offsets[] = {
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
index 57a0dd1..b675805 100644
--- a/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0006-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
-From f6d59b0835e32f0575ec1671dff0348af1886da6 Mon Sep 17 00:00:00 2001
+From 05a3901af7a467f9ea5fa9e6f63a574d8d2a9f77 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 06/10] QOpenGLPaintDevice sub-area support
+Subject: [PATCH] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
@@ -152,6 +152,3 @@ index c179143..fad68d5 100644
          pex->updateClipScissorTest();
      } else {
          if (m_vao.isCreated()) {
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
index 62e8a0d..2fab888 100644
--- a/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ b/recipes-qt/qt5/qtbase/0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -1,8 +1,7 @@
-From 0cac609e192c303e26d139b4a7d5b35897a020a8 Mon Sep 17 00:00:00 2001
+From 6a0d4af2083dbacddb98245c0b4b83c6e014a1ae Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Jun 2015 13:59:25 -0700
-Subject: [PATCH 07/10] linux-oe-g++: Invert conditional for defining
- QT_SOCKLEN_T
+Subject: [PATCH] linux-oe-g++: Invert conditional for defining QT_SOCKLEN_T
 
 This helps to make sure that QT_SOCKLEN_T is defined to be 'int'
 only when its glibc < 2 and not also for the libraries which may define
@@ -31,6 +30,3 @@ index dd12003..8623651 100644
  #endif
  
  #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
index 2ea1954..7ca1913 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-paths-for-target-qmake-properly.patch
@@ -1,7 +1,7 @@
-From caa2e16f3efaede09abcc4cf263e82b4c1cfa6a0 Mon Sep 17 00:00:00 2001
+From b5c826a39760519010884547d6981c3af031d9c8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 13 Nov 2015 12:36:11 +0100
-Subject: [PATCH 08/10] configure paths for target qmake properly
+Subject: [PATCH] configure paths for target qmake properly
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -19,7 +19,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 19 insertions(+), 4 deletions(-)
 
 diff --git a/configure b/configure
-index aeb4ef2..c696e7e 100755
+index 24a61db..2e99d39 100755
 --- a/configure
 +++ b/configure
 @@ -3875,8 +3875,13 @@ if [ "$CFG_COMPILE_EXAMPLES" = "yes" ]; then
@@ -73,6 +73,3 @@ index aeb4ef2..c696e7e 100755
  #endif
  
  static const short qt_configure_str_offsets[] = {
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
index e2b57ce..230c966 100644
--- a/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0009-Always-build-uic.patch
@@ -1,7 +1,7 @@
-From 376eba77c429a503b05256786f2996b397c2e36f Mon Sep 17 00:00:00 2001
+From 49b2100ff86ab5b4977608903b30cb71075592c6 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
-Subject: [PATCH 09/10] Always build uic
+Subject: [PATCH] Always build uic
 
 Even if we are not building gui or widgets. This tool is needed later
 as a native tool when compiling the target.
@@ -26,6 +26,3 @@ index 1671338..83de483 100644
  
  nacl: SUBDIRS -= src_network src_testlib
  
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
index 9fa0a33..5bb73e7 100644
--- a/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0010-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,7 +1,7 @@
-From 2b55cf1075167ce6b7e4cff1ea89dc2c27265f23 Mon Sep 17 00:00:00 2001
+From 5b4ae15a19a9135d3dc8a35aa2d109ba8d29868a Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 10/10] Add -external-hostbindir option for native(sdk)
+Subject: [PATCH] Add -external-hostbindir option for native(sdk)
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
@@ -37,7 +37,7 @@ Conflicts:
  5 files changed, 16 insertions(+), 1 deletion(-)
 
 diff --git a/configure b/configure
-index c696e7e..310eb1d 100755
+index 2e99d39..a0641d2 100755
 --- a/configure
 +++ b/configure
 @@ -3922,6 +3922,7 @@ fi
@@ -94,10 +94,10 @@ index 1ad7637..5a8b127 100644
          HostSpecPath,
          HostPrefixPath,
 diff --git a/tools/configure/configureapp.cpp b/tools/configure/configureapp.cpp
-index 555ccbf..d9a5b08 100644
+index 6f1e2b7..ae03143 100644
 --- a/tools/configure/configureapp.cpp
 +++ b/tools/configure/configureapp.cpp
-@@ -1248,6 +1248,13 @@ void Configure::parseCmdLine()
+@@ -1256,6 +1256,13 @@ void Configure::parseCmdLine()
              dictionary[ "QT_EXT_PREFIX" ] = configCmdLine.at(i);
          }
  
@@ -111,7 +111,7 @@ index 555ccbf..d9a5b08 100644
          else if (configCmdLine.at(i) == "-make-tool") {
              ++i;
              if (i == argCount)
-@@ -4214,6 +4221,9 @@ void Configure::generateQConfigCpp()
+@@ -4232,6 +4239,9 @@ void Configure::generateQConfigCpp()
  
      if (dictionary["QT_REL_HOST_DATA"].isEmpty())
          dictionary["QT_REL_HOST_DATA"] = haveHpx ? "." : dictionary["QT_REL_INSTALL_ARCHDATA"];
@@ -121,7 +121,7 @@ index 555ccbf..d9a5b08 100644
  
      confStringOff = 0;
      addConfStr(0, dictionary["QT_REL_INSTALL_DOCS"]);
-@@ -4233,6 +4243,7 @@ void Configure::generateQConfigCpp()
+@@ -4251,6 +4261,7 @@ void Configure::generateQConfigCpp()
      addConfStr(1, dictionary["QT_REL_HOST_BINS"]);
      addConfStr(1, dictionary["QT_REL_HOST_LIBS"]);
      addConfStr(1, dictionary["QT_REL_HOST_DATA"]);
@@ -129,6 +129,3 @@ index 555ccbf..d9a5b08 100644
      addConfStr(1, targSpec);
      addConfStr(1, hostSpec);
  
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 473d1df..09f8ebd 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -261,4 +261,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "d0cdc7ad1e2728caf363abf328b2ad81f2ed5a5b"
+SRCREV = "cec15a89d058424794978910cc8da65b43d71606"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 205593f..5b12d1a 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "5a17c4ca0552c9f4e6b5646f0cee2b21a55c3d18"
+SRCREV = "791ddce7d41b126ba4744a6701597f49dbf99f3b"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 7a442c3..03990d8 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -25,4 +25,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "8b550f0a7508ed413cded71a20485e61010b0aa3"
+SRCREV = "dedff12a896d51c469d2af82664b86a10f8fa7fe"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index b3f7621..ee56820 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From 1755b8c7ab87f9e6bf072bd0bef50086c14dd9ff Mon Sep 17 00:00:00 2001
+From d26a676827ef2d64b4627090690d3240e62f6565 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -83,6 +83,3 @@ index 1bb913e..56f2dd5 100644
  CONFIG += no_import_scan
  
  load(qt_tool)
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch b/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
similarity index 91%
rename from recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
rename to recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
index 1687fbe..60c9685 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
+++ b/recipes-qt/qt5/qtdeclarative/0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch
@@ -1,4 +1,4 @@
-From 1cdd3278a0b1508640d983720782d39eb919caaf Mon Sep 17 00:00:00 2001
+From 9d39293e354120a9ec5e92c87b4cd695acdeb3f5 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:38:58 -0400
 Subject: [PATCH] qquickviewcomparison: fix QCoreApplication has not been
@@ -23,6 +23,3 @@ index 5b86c93..e77514e 100644
  
  QT_FORWARD_DECLARE_CLASS(QRadioButton)
  QT_FORWARD_DECLARE_CLASS(QCheckBox)
--- 
-2.2.0
-
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 3f8c3da..bf3a108 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -15,7 +15,7 @@ DEPENDS += "qtbase"
 
 SRC_URI += " \
     file://0001-qmltestexample-fix-link.patch \
-    file://0001-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
+    file://0002-qquickviewcomparison-fix-QCoreApplication-has-not-be.patch \
 "
 
 EXTRA_OEMAKE += "QMAKE_SYNCQT=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/syncqt"
@@ -34,6 +34,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "dc558b69f083c89aa8c02952e5f167405939a61a"
+SRCREV = "26ff8f9029107877bfbfdc2f099f9b11861183ed"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtenginio_git.bb b/recipes-qt/qt5/qtenginio_git.bb
index 23b9417..04f5a79 100644
--- a/recipes-qt/qt5/qtenginio_git.bb
+++ b/recipes-qt/qt5/qtenginio_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative qtxmlpatterns"
 
-SRCREV = "2a19257a5eef7a25a05d5cf7ea69ecc4184226f3"
+SRCREV = "cf717b99fdb1b7221dd556bf3be32feba0ed8afe"
diff --git a/recipes-qt/qt5/qtgraphicaleffects_git.bb b/recipes-qt/qt5/qtgraphicaleffects_git.bb
index 7d9636c..606b873 100644
--- a/recipes-qt/qt5/qtgraphicaleffects_git.bb
+++ b/recipes-qt/qt5/qtgraphicaleffects_git.bb
@@ -17,4 +17,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "4b8e9a348ca379b203c26ff14dd236267dd60646"
+SRCREV = "6523d7c4843e1d4176035c46e1514c39bdcfc3bf"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 8964a5d..1211898 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -1,4 +1,4 @@
-From 14a68abb4c492fb7ba55dbccaf61057e861bbf3c Mon Sep 17 00:00:00 2001
+From c4c008c46291be290312b5674af1c1b9c446fa8e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 4 Aug 2014 19:19:05 +0200
 Subject: [PATCH] qtimageformats.pro: Make the dependencies deterministic
@@ -26,6 +26,3 @@ index 8382e5c..63d13ce 100644
 +OE_LIBWEBP_ENABLED:qtCompileTest(libwebp)
  
  load(qt_parts)
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtimageformats_git.bb b/recipes-qt/qt5/qtimageformats_git.bb
index 0a97f12..4c4431d 100644
--- a/recipes-qt/qt5/qtimageformats_git.bb
+++ b/recipes-qt/qt5/qtimageformats_git.bb
@@ -28,4 +28,4 @@ EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'jasper', 'CONFIG+=OE_
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libtiff', 'CONFIG+=OE_LIBTIFF_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'libwebp', 'CONFIG+=OE_LIBWEBP_ENABLED', '', d)}"
 
-SRCREV = "0bd46d5861fa7b48c87cd3a734d00671df929869"
+SRCREV = "bf5b49878d75d316f31225f76152e8381a3d5f0f"
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index 2ee747f..d573b6b 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "ca4bce553d03a64fa119650990083267ea9c8d31"
+SRCREV = "d1f66746ab0b77b4f3300cbeeaafe61d25d78e98"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index a4ac12a..05f5473 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From e8e2e289288acd3124536a41351e7bcd639bef07 Mon Sep 17 00:00:00 2001
+From 98455d75df7b040817e323417b6042118c093d56 Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
@@ -54,6 +54,3 @@ index 98bb315..287887f 100644
      }
  
      qtCompileTest(resourcepolicy)
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 61c767e..328fdd7 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "9985224a89b830dc182b428f491b6187d6f0e1ba"
+SRCREV = "2170a3b0fcda613daf76a337fa45cb97e0714cdf"
diff --git a/recipes-qt/qt5/qtquick1_git.bb b/recipes-qt/qt5/qtquick1_git.bb
index 32b9aba..61b02a1 100644
--- a/recipes-qt/qt5/qtquick1_git.bb
+++ b/recipes-qt/qt5/qtquick1_git.bb
@@ -23,4 +23,4 @@ do_configure_prepend() {
     sed -i 's#^qtHaveModule(webkitwidgets):#enable-webkit:qtHaveModule(webkitwidgets):#g' ${S}/src/imports/imports.pro
 }
 
-SRCREV = "dcc5e5c01c28b227f0e5e5e4976a9d26e8a45295"
+SRCREV = "563ce3888f3c04abcc96ba236b20c7a822bc88e2"
diff --git a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
index 10793e6..c57943d 100644
--- a/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
+++ b/recipes-qt/qt5/qtquickcontrols/0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch
@@ -1,4 +1,4 @@
-From c39a563984693efac577adb137115693634c038f Mon Sep 17 00:00:00 2001
+From d5faf29f8a41b0e28132fb23828cff8043174cb8 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Thu, 31 Mar 2016 19:57:01 -0400
 Subject: [PATCH] texteditor: fix invalid use of incomplete type 'class QDebug'
@@ -11,7 +11,7 @@ Signed-off-by: Denys Dmytriyenko <denys@ti.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/examples/quick/controls/texteditor/src/documenthandler.cpp b/examples/quick/controls/texteditor/src/documenthandler.cpp
-index 2e9987a..c8bf419 100644
+index 2e03f74..3d1b3c8 100644
 --- a/examples/quick/controls/texteditor/src/documenthandler.cpp
 +++ b/examples/quick/controls/texteditor/src/documenthandler.cpp
 @@ -44,6 +44,7 @@
@@ -22,6 +22,3 @@ index 2e9987a..c8bf419 100644
  
  DocumentHandler::DocumentHandler()
      : m_target(0)
--- 
-2.2.0
-
diff --git a/recipes-qt/qt5/qtquickcontrols2_git.bb b/recipes-qt/qt5/qtquickcontrols2_git.bb
index 41c781e..e3c580f 100644
--- a/recipes-qt/qt5/qtquickcontrols2_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols2_git.bb
@@ -12,4 +12,4 @@ DEPENDS += "qtdeclarative"
 
 FILES_${PN}-qmlplugins += "${libdir}/qt5/qml/Qt"
 
-SRCREV = "7fc567eda8a187e365f4c29c6e8f08440bf31218"
+SRCREV = "ac152bfcd37f94453e9705b57ca6520ad30bade0"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index a770fbe..7a5ca23 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -17,4 +17,4 @@ SRC_URI += " \
     file://0001-texteditor-fix-invalid-use-of-incomplete-type-class-.patch \
 "
 
-SRCREV = "85c2d2cce4c7d49bc425ccd0be2bbd9841b7e79b"
+SRCREV = "01e52200e2a76ec51c3bb9710617ac0c249a78bc"
diff --git a/recipes-qt/qt5/qtscript_git.bb b/recipes-qt/qt5/qtscript_git.bb
index eea6911..565ca84 100644
--- a/recipes-qt/qt5/qtscript_git.bb
+++ b/recipes-qt/qt5/qtscript_git.bb
@@ -27,4 +27,4 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 
 DEPENDS += "qtbase"
 
-SRCREV = "a70f6a1b9599931fccd13b15a1700e61137f7e72"
+SRCREV = "b16873afea798d08799d7a0b255b8d200337f35b"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index 6f2f1a3..16c2095 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "7197e7f4b385315cb241043495cbfad58deb911a"
+SRCREV = "0b00ee6f6c311a7f5c0b4f2441dad97a454d172e"
diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
index 0d1133d..4139db1 100644
--- a/recipes-qt/qt5/qtserialport_git.bb
+++ b/recipes-qt/qt5/qtserialport_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "03d492e49e74eefa1c83e37e833d862f4b9f1e45"
+SRCREV = "9a70ee2389d3302f6a4262325f8a76e4d867b478"
diff --git a/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch b/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
deleted file mode 100644
index c0e1389..0000000
--- a/recipes-qt/qt5/qtsvg/0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From f3b363acbe125c1eb1f1d4cf28973d2914cda024 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 5 Nov 2015 12:25:05 +0100
-Subject: [PATCH] textobject.pro: use DEPLOYMENT only for wince like other
- examples
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- examples/svg/richtext/textobject/textobject.pro | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/examples/svg/richtext/textobject/textobject.pro b/examples/svg/richtext/textobject/textobject.pro
-index 794ad32..0ecd2c7 100644
---- a/examples/svg/richtext/textobject/textobject.pro
-+++ b/examples/svg/richtext/textobject/textobject.pro
-@@ -12,6 +12,8 @@ RESOURCES       = resources.qrc
- target.path = $$[QT_INSTALL_EXAMPLES]/svg/richtext/textobject
- INSTALLS += target
- 
--filesToDeploy.files = files/*.svg
--filesToDeploy.path = files
--DEPLOYMENT += filesToDeploy
-+wince* {
-+    filesToDeploy.files = files/*.svg
-+    filesToDeploy.path = files
-+    DEPLOYMENT += filesToDeploy
-+}
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtsvg_git.bb b/recipes-qt/qt5/qtsvg_git.bb
index 83abbe6..6c300e5 100644
--- a/recipes-qt/qt5/qtsvg_git.bb
+++ b/recipes-qt/qt5/qtsvg_git.bb
@@ -13,6 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "38777ea7451d55e9c3d32d88d46063016013f60c"
-
-SRC_URI += "file://0001-textobject.pro-use-DEPLOYMENT-only-for-wince-like-ot.patch"
+SRCREV = "e02df9c098b4d304b34c0ff65806a0576e45ed1a"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 45a4fc7..dbb9438 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,7 +1,7 @@
-From a6f3bde30cb78e109a26fec6b336f8a504d4fa3c Mon Sep 17 00:00:00 2001
+From c6d62fcf2e02b5a86c36b4afd78dfb7a3f29ad91 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
-Subject: [PATCH 1/4] Allow to build only lrelease + lupdate + lconvert
+Subject: [PATCH] Allow to build only lrelease + lupdate + lconvert
 
 This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
 is built without GUI support (no-png is set) and we still want to build
@@ -156,6 +156,3 @@ index 20b5fec..8a42d1f 100644
  
  installed_cmake.depends = cmake
  
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index c4c0a14..b5e9293 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,7 +1,7 @@
-From 1140fd4bb5768d49cad9e834a9ce5eb05b711d0e Mon Sep 17 00:00:00 2001
+From 34f23c43f1c656ccd424528821a9ac65a98c5fec Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
-Subject: [PATCH 2/4] assistant/help: fix linking of dependent libraries
+Subject: [PATCH] assistant/help: fix linking of dependent libraries
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -18,15 +18,12 @@ Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/assistant/help/help.pro b/src/assistant/help/help.pro
-index 168d23d..a9c3b59 100644
+index 37d5ba4..8de8763 100644
 --- a/src/assistant/help/help.pro
 +++ b/src/assistant/help/help.pro
-@@ -59,3 +59,5 @@ HEADERS += qhelpenginecore.h \
- # access to clucene
- HEADERS += qhelpsearchindexwriter_clucene_p.h \
+@@ -60,3 +60,5 @@ HEADERS += qhelpsearchindexwriter_clucene_p.h \
      qhelpsearchindexreader_clucene_p.h
+ 
+ load(qt_module)
 +
 +LIBS += -lQt5CLucene
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 81b511f..f0f40b7 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,7 +1,7 @@
-From a0637f231d513dfc15f1eec185d5d5e7fb03e292 Mon Sep 17 00:00:00 2001
+From b77f225e25360832074692681c5ff7c13862102d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
-Subject: [PATCH 3/4] add noqtwebkit configuration
+Subject: [PATCH] add noqtwebkit configuration
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -46,6 +46,3 @@ index 500a153..b60fa2d 100644
 +qtHaveModule(webkitwidgets):!contains(CONFIG, noqtwebkit): SUBDIRS += qwebview
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index 0e7061a..16ff71e 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,7 +1,7 @@
-From 3f1754dec603e3508a45f3e1800edf0a44411084 Mon Sep 17 00:00:00 2001
+From e65c5ea9f7ce6fade201ed15b44dcb4d82219b3f Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
-Subject: [PATCH 4/4] linguist-tools cmake: allow overriding the location for
+Subject: [PATCH] linguist-tools cmake: allow overriding the location for
  lupdate and lrelease
 
 ---
@@ -58,6 +58,3 @@ index 4318b16..2e3b70f 100644
      _qt5_LinguistTools_check_file_exists(${imported_location})
  
      set_target_properties(Qt5::lconvert PROPERTIES
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qttools_git.bb b/recipes-qt/qt5/qttools_git.bb
index afa4f79..3a27bbd 100644
--- a/recipes-qt/qt5/qttools_git.bb
+++ b/recipes-qt/qt5/qttools_git.bb
@@ -31,6 +31,6 @@ PACKAGECONFIG[qtwebkit] = ",,qtwebkit"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtwebkit', '', 'CONFIG+=noqtwebkit', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'linguistonly', 'CONFIG+=linguistonly', '', d)}"
 
-SRCREV = "9904992dc4eb9a5958fcfbac238374ff38498143"
+SRCREV = "e33532e048fa12ee32429ca83ee31aa8f065147d"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/recipes-qt/qt5/qttranslations_git.bb b/recipes-qt/qt5/qttranslations_git.bb
index cc84755..93b147d 100644
--- a/recipes-qt/qt5/qttranslations_git.bb
+++ b/recipes-qt/qt5/qttranslations_git.bb
@@ -114,4 +114,4 @@ FILES_${PN}-qt = " \
     ${OE_QMAKE_PATH_TRANSLATIONS}/qt_*.qm \
 "
 
-SRCREV = "41d212290c3822b8eef151785d89ac5f5b246bde"
+SRCREV = "13f1f2f12ddfc9b84535361d77a5f0f0ec8c3e0f"
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index a094419..ca47da8 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "29b8bd8b1117589341110502fe516bf22c920747"
+SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 06168e3..45493cf 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 8841d31cb66fda833dc0ae557f13887716f4c46b Mon Sep 17 00:00:00 2001
+From cadcacf58301251629a63ecd2682d58e6bf24cb8 Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -27,6 +27,3 @@ index ac2d07b..7a46a24 100644
  
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index 3604757..f39707c 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From efec881d1bff247e6452a10a60821612c2585c67 Mon Sep 17 00:00:00 2001
+From 52971db84e3b2c429e8777953c0532dcb88b8e6b Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -26,6 +26,3 @@ index d633fb9..643c7cd 100644
 +        SUBDIRS += server-buffer
 +    }
  }
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index a5e3abe..a1cee86 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -36,4 +36,4 @@ SRC_URI += " \
     file://0001-examples-wayland-include-server-buffer-only-when-bui.patch \
 "
 
-SRCREV = "29b8bd8b1117589341110502fe516bf22c920747"
+SRCREV = "26e27845a43319d0ecad0c6392f05d1ed50da2a2"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 7d923d8..79c6b23 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "92d903d92b430222cd3f89eab08d61d947e5abea"
+SRCREV = "64a106da72796377bbff5cce0ecc5a379b105498"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index a1ea375..75350c1 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,8 +1,8 @@
-From 90d2f7aefa8922c3aa29e6907c1520c814d1797f Mon Sep 17 00:00:00 2001
+From 04be78d20ecc23e289e171e907bb5daf9393619d Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
-Subject: [PATCH 1/2] <chromium> base.gypi: include
- atomicops_internals_x86_gcc.cc when building for x64 arch
+Subject: [PATCH] <chromium> base.gypi: include atomicops_internals_x86_gcc.cc
+ when building for x64 arch
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
 ---
@@ -22,6 +22,3 @@ index b860735..0ed5de3 100644
                'sources/': [
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index 88d4826..c95fad0 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,7 +1,7 @@
-From f052458fe39733602751f9f9a09d1c0d78bea421 Mon Sep 17 00:00:00 2001
+From dde0edc1681bb49580584028c2d7b5757e177cd1 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
-Subject: [PATCH 1/5] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
+Subject: [PATCH] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
  anywhere in path, but at the end
 
 Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
@@ -25,6 +25,3 @@ index 2df689b..8d984c7 100644
    return($$out)
  }
  
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
index 1227d0a..00432bc 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch
@@ -1,7 +1,7 @@
-From a015bddaf2005cac376be7dda4603637afc5844c Mon Sep 17 00:00:00 2001
+From 3ae00f0217e4a0039f0855ea6cd945209b1734ee Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 12:46:58 -0200
-Subject: [PATCH 2/2] chromium: Change false to FALSE and 1 to TRUE, FIX
+Subject: [PATCH] chromium: Change false to FALSE and 1 to TRUE, FIX
  qtwebengine compile
 
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
@@ -61,6 +61,3 @@ index 8a08fe0..32b2a05 100644
  
    // we want to always get RGB data out
    switch (cinfo.jpeg_color_space) {
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index dbc1e24..18f268c 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,7 +1,7 @@
-From 5f6389fe3493420c2afeec8f2786165f1d08901a Mon Sep 17 00:00:00 2001
+From 6576e3135b839b53c422befac0a233f6dd1966bf Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
-Subject: [PATCH 2/5] functions.prf: Make sure we only use the file name to
+Subject: [PATCH] functions.prf: Make sure we only use the file name to
  generate it's moc'ed abbreviation
 
 Signed-off-by: Simon Busch <morphis@gravedo.de>
@@ -24,6 +24,3 @@ index 8d984c7..055e960 100644
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
    for(ext, $$list($${QMAKE_EXT_CPP})): \
        out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index 28960ed..78cb3fc 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
-From 348a74cb924cf6ac4384069d84ee3995644b2ce1 Mon Sep 17 00:00:00 2001
+From f4c64fbabdcc30d46d9181401aa1c9d78fcb0b2f Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
-Subject: [PATCH 3/5] functions.prf: allow build for linux-oe-g++ platform
+Subject: [PATCH] functions.prf: allow build for linux-oe-g++ platform
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -28,6 +28,3 @@ index 055e960..379c9b5 100644
    } else:win32 {
      winrt {
        skipBuild("WinRT is not supported.")
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
index 4a3deb9..901462c 100644
--- a/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-WebEngine-qquickwebengineview_p_p.h-add-include-QCol.patch
@@ -1,7 +1,7 @@
-From 80f5e26073ef58c1a2ff510c6ccdb7423bcb2fc3 Mon Sep 17 00:00:00 2001
+From a2670f5ad67822b399e9dd7b3b87589be1da9749 Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Fri, 25 Dec 2015 18:16:05 -0200
-Subject: [PATCH 4/5] WebEngine qquickwebengineview_p_p.h add include QColor
+Subject: [PATCH] WebEngine qquickwebengineview_p_p.h add include QColor
 
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
 ---
@@ -9,7 +9,7 @@ Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/src/webengine/api/qquickwebengineview_p_p.h b/src/webengine/api/qquickwebengineview_p_p.h
-index dbbbf91..94268b6 100644
+index 65bf25e..0447d07 100644
 --- a/src/webengine/api/qquickwebengineview_p_p.h
 +++ b/src/webengine/api/qquickwebengineview_p_p.h
 @@ -56,6 +56,8 @@
@@ -21,6 +21,3 @@ index dbbbf91..94268b6 100644
  
  namespace QtWebEngineCore {
  class WebContentsAdapter;
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
index 6fd9e49..fa3faf4 100644
--- a/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
+++ b/recipes-qt/qt5/qtwebengine/0005-Include-dependency-to-QCoreApplication-translate.patch
@@ -1,7 +1,7 @@
-From b3f3154e4852a830fdc4e311d4f5105fc337e8f2 Mon Sep 17 00:00:00 2001
+From b523c4dd76f6205389d8f5771124f0451ec7183f Mon Sep 17 00:00:00 2001
 From: Cleiton Bueno <cleitonrbueno@gmail.com>
 Date: Thu, 24 Dec 2015 15:59:51 -0200
-Subject: [PATCH 5/5] Include dependency to QCoreApplication::translate()
+Subject: [PATCH] Include dependency to QCoreApplication::translate()
 
 Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>
 ---
@@ -21,6 +21,3 @@ index 500fe76..eda2824 100644
  #include "web_contents_adapter_client.h"
  
  #include "base/callback.h"
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index ec9aa3c..98b4bab 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -119,8 +119,8 @@ SRC_URI += " \
     file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw.patch \
 "
 
-SRCREV_qtwebengine = "5c4ae298b0a3d75c4c5ea8aef0595914ab25607f"
-SRCREV_chromium = "cbe3845eff59c2d1726ed3dc0f934f7f483a1271"
+SRCREV_qtwebengine = "643aa579fc94933eefa8eb20af6729e2140cf480"
+SRCREV_chromium = "8252b18aa3efa52138e91f9756945afb142a1c8c"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine_chromium"
diff --git a/recipes-qt/qt5/qtwebkit-examples_git.bb b/recipes-qt/qt5/qtwebkit-examples_git.bb
index a0d4e9f..63d02fa 100644
--- a/recipes-qt/qt5/qtwebkit-examples_git.bb
+++ b/recipes-qt/qt5/qtwebkit-examples_git.bb
@@ -19,4 +19,4 @@ DEPENDS += "qtwebkit qtxmlpatterns"
 RDEPENDS_${PN}-examples += "qtwebkit-qmlplugins"
 RDEPENDS_${PN}-examples += "${@base_contains('PACKAGECONFIG_OPENSSL', 'openssl', 'ca-certificates', '', d)}"
 
-SRCREV = "7988aecdbcb07f3a214c2c804a39db3fc5617844"
+SRCREV = "1b9a0fc9d1ded4f4f11b04eb0bb7d1de82d6eb34"
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index e8b0e43..1f3dd2a 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -1,7 +1,7 @@
-From 1735a8484ef9ae336f8d607b56bda64c8af10c79 Mon Sep 17 00:00:00 2001
+From 3e321803386278c52508d114f5096883e974a4bb Mon Sep 17 00:00:00 2001
 From: Trevor Woerner <trevor.woerner@linaro.org>
 Date: Fri, 7 Feb 2014 04:07:17 +0100
-Subject: [PATCH 1/3] qtwebkit: fix QA issue (bad RPATH)
+Subject: [PATCH] qtwebkit: fix QA issue (bad RPATH)
 
 Building qtwebkit causes a QA issue such that QtWebPluginProcess and
 QtWebProcess contain bad RPATHs which point into the build location. This fix
@@ -25,6 +25,3 @@ index fd66af6..ef754c3 100644
  
  CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index b3a8615..2114b42 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -1,7 +1,7 @@
-From ae16ce17cc7060274a0b0c165b953fc32540f977 Mon Sep 17 00:00:00 2001
+From f1eb41ada1a9bb5f4073c8a48010555cbefeec34 Mon Sep 17 00:00:00 2001
 From: Magnus Granberg <zorry@gentoo.org>
 Date: Fri, 27 Feb 2015 11:55:09 +0100
-Subject: [PATCH 2/3] Remove TEXTREL tag in x86
+Subject: [PATCH] Remove TEXTREL tag in x86
 
 Fix textrel QA warnings when building qtwebkit for x86:
 
@@ -74,6 +74,3 @@ index 0a2fe78..2dc40ef 100644
  #else
  #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
  #endif
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
index 4379866..5edc939 100644
--- a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -1,7 +1,7 @@
-From 6c36f0ff8c1f5852c33d2b23714f9f187cc6ff26 Mon Sep 17 00:00:00 2001
+From 5e5545f49d91e1c40d85d2497e16495ee9e53c11 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 5 Jun 2015 19:55:05 -0700
-Subject: [PATCH 3/3] Exclude backtrace() API for non-glibc libraries
+Subject: [PATCH] Exclude backtrace() API for non-glibc libraries
 
 It was excluding musl with current checks, so lets make it such that it
 considers only glibc when using backtrace API
@@ -33,6 +33,3 @@ index 1b2091f..ba03a28 100644
      *size = backtrace(stack, *size);
  #elif OS(WINDOWS) && !OS(WINCE)
      // The CaptureStackBackTrace function is available in XP, but it is not defined
--- 
-2.7.0
-
diff --git a/recipes-qt/qt5/qtwebkit/0004-Fix-linking-with-libpthread.patch b/recipes-qt/qt5/qtwebkit/0004-Fix-linking-with-libpthread.patch
deleted file mode 100644
index c5e6ac5..0000000
--- a/recipes-qt/qt5/qtwebkit/0004-Fix-linking-with-libpthread.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5dd4bb67cfce812fd7686e43616e2069f354a7df Mon Sep 17 00:00:00 2001
-From: Allan Sandfeld Jensen <allan.jensen@theqtcompany.com>
-Date: Mon, 22 Feb 2016 10:57:32 +0100
-Subject: [PATCH] Fix linking with libpthread
-
-WebKit use libpthread directly but is depending on other qt modules
-causing it to be linked against, which might break unless -lpthread
-is last. Instead just add it explicitly after the static libraries.
-
-Upstream-Status: Backport from 5.7 branch
-
-Change-Id: I2b95cff2c96373f8dce6f95052c4fccbe1982b33
-Reviewed-by: Simon Hausmann <simon.hausmann@theqtcompany.com>
-Signed-off-by: Jonathan Liu <net147@gmail.com>
----
- Tools/qmake/mkspecs/features/default_post.prf | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Tools/qmake/mkspecs/features/default_post.prf b/Tools/qmake/mkspecs/features/default_post.prf
-index 67276b7..39bb3f7 100644
---- a/Tools/qmake/mkspecs/features/default_post.prf
-+++ b/Tools/qmake/mkspecs/features/default_post.prf
-@@ -201,6 +201,7 @@ needToLink() {
-         linkAgainstLibrary($$library, $$eval(WEBKIT.$${library_identifier}.root_source_dir))
-         LIBS += $$eval(WEBKIT.$${library_identifier}.dependent_libs)
-     }
-+    posix:!darwin: LIBS += -lpthread
- }
- 
- creating_module {
--- 
-2.7.1
-
diff --git a/recipes-qt/qt5/qtwebkit_git.bb b/recipes-qt/qt5/qtwebkit_git.bb
index 62a7650..b94c1f8 100644
--- a/recipes-qt/qt5/qtwebkit_git.bb
+++ b/recipes-qt/qt5/qtwebkit_git.bb
@@ -72,4 +72,4 @@ PACKAGES_remove = "${PN}-examples-dev ${PN}-examples-staticdev ${PN}-examples-db
 RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
 export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
 
-SRCREV = "be8e169ba38c84562194906047d0da04bf3ae91a"
+SRCREV = "71136c9621103522e85654c8e144d5f1c961de1c"
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index cac3884..66d9d74 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "88946bbe209cb6148b4a3284077bb9a06c7bc1ef"
+SRCREV = "ba9306ec5a1271275d79b2f48ceb227f79352f33"
diff --git a/recipes-qt/qt5/qtx11extras_git.bb b/recipes-qt/qt5/qtx11extras_git.bb
index ac33fb2..d8beb50 100644
--- a/recipes-qt/qt5/qtx11extras_git.bb
+++ b/recipes-qt/qt5/qtx11extras_git.bb
@@ -13,4 +13,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "d64ee96f0df4d3baa6959b8552bc59d53cb0b451"
+SRCREV = "f27489d66cc6d8263130451c26c7e4ae40acc6b4"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 2f24933..d78df14 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "de2dadb8af67f9d425c3a8d2353a7d5b07588915"
+SRCREV = "5e6acdb2ea92add793835561e7a2d6b0ed8890f8"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.8.1


