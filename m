Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f195.google.com (mail-wi0-f195.google.com
	[209.85.212.195])
	by mail.openembedded.org (Postfix) with ESMTP id 114DE77070
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 13:48:55 +0000 (UTC)
Received: by wibvt6 with SMTP id vt6so951832wib.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 06:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=tfScd0GFR4xF8LzLMfvijm61EKC0ehqZ7NGgERbqyI8=;
	b=Q+Rxsrz7aLqo82O6gRfeFnxbKEd+IEm3wxZex3m7hlFqxVS3EsRMYuZnQsA5m4Prh5
	XXVNXb2WSH2SGuiIo4Jceah5wrtU2t/1TS49kVuDArkyqQ1r8ad+av52eJom6Y/NsNrM
	WZ4hVUaLhdi8NaE/dsS/lWjiokgP9y5xLhZORzjmydXNfprynl9dZzJnGjtssVzb9RAP
	w2gdvzS8CH0Z6Wnwu9eiadSzawq9aVezbR1Mq7T94ATHq7OULuFYcaHgRfHyb4jfTkf9
	MqwYC8D1WJSfnwlSG39FGyBSxzu1INEhDLiLkbEHoJnqGthePGZVqkM7KAF4BAsgtHp3
	or3g==
X-Received: by 10.180.206.52 with SMTP id ll20mr19820859wic.48.1445262535123; 
	Mon, 19 Oct 2015 06:48:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	z4sm35855950wjz.29.2015.10.19.06.48.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Oct 2015 06:48:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 15:48:58 +0200
Message-Id: <1445262539-13621-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.1
Subject: [WIP][meta-qt5][PATCH 1/2] qt5: upgrade to latest revision in 5.5 branch (5.5.1+)
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
X-List-Received-Date: Mon, 19 Oct 2015 13:48:57 -0000

* this is probably last upgrade for jethro branch, master will switch
  to 5.6 soon

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/nativesdk-qtbase_git.bb                            | 2 +-
 recipes-qt/qt5/qt3d_git.bb                                        | 2 +-
 recipes-qt/qt5/qt5-git.inc                                        | 2 +-
 recipes-qt/qt5/qtbase-native_git.bb                               | 2 +-
 recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch          | 4 ++--
 ...002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch | 4 ++--
 recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch   | 4 ++--
 .../0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch   | 4 ++--
 ...005-qeglplatformintegration-Undefine-CursorShape-from-X..patch | 4 ++--
 ...006-configure-bump-path-length-from-256-to-512-character.patch | 4 ++--
 .../qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch     | 4 ++--
 recipes-qt/qt5/qtbase/0008-Always-build-uic.patch                 | 4 ++--
 ...008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch | 4 ++--
 .../0009-Add-external-hostbindir-option-for-native-sdk.patch      | 4 ++--
 ...009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch | 4 ++--
 ...010-configure-preserve-built-qmake-and-swap-with-native-.patch | 4 ++--
 ...010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch | 4 ++--
 recipes-qt/qt5/qtbase_git.bb                                      | 2 +-
 recipes-qt/qt5/qtcanvas3d_git.bb                                  | 2 +-
 recipes-qt/qt5/qtconnectivity_git.bb                              | 2 +-
 recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch   | 4 ++--
 recipes-qt/qt5/qtdeclarative_git.bb                               | 2 +-
 ...001-qtimageformats.pro-Make-the-dependencies-determinist.patch | 2 +-
 recipes-qt/qt5/qtlocation_git.bb                                  | 2 +-
 .../0001-Initial-porting-effort-to-GStreamer-1.0.patch            | 4 ++--
 recipes-qt/qt5/qtmultimedia_git.bb                                | 2 +-
 recipes-qt/qt5/qtquickcontrols_git.bb                             | 2 +-
 recipes-qt/qt5/qtsensors_git.bb                                   | 2 +-
 .../0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch      | 4 ++--
 .../0002-assistant-help-fix-linking-of-dependent-libraries.patch  | 4 ++--
 recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch    | 4 ++--
 ...004-linguist-tools-cmake-allow-overriding-the-location-f.patch | 6 +++---
 recipes-qt/qt5/qtwayland-native_git.bb                            | 2 +-
 ...001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch | 4 ++--
 ...001-examples-wayland-include-server-buffer-only-when-bui.patch | 4 ++--
 recipes-qt/qt5/qtwayland_git.bb                                   | 2 +-
 recipes-qt/qt5/qtwebchannel_git.bb                                | 2 +-
 ...001-chromium-base.gypi-include-atomicops_internals_x86_g.patch | 4 ++--
 ...001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch | 8 ++++----
 ...002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch | 4 ++--
 ...002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch | 8 ++++----
 .../0003-functions.prf-allow-build-for-linux-oe-g-platform.patch  | 6 +++---
 .../qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch  | 4 ++--
 recipes-qt/qt5/qtwebengine_git.bb                                 | 4 ++--
 ...001-qtwebkit-examples-enable-building-examples-by-defaul.patch | 2 +-
 .../qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch       | 2 +-
 recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch      | 2 +-
 .../0003-Exclude-backtrace-API-for-non-glibc-libraries.patch      | 2 +-
 recipes-qt/qt5/qtwebsockets_git.bb                                | 2 +-
 recipes-qt/qt5/qtxmlpatterns_git.bb                               | 2 +-
 50 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nativesdk-qtbase_git.bb
index 3003323..e787993 100644
--- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
+++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
@@ -278,4 +278,4 @@ fakeroot do_generate_qt_environment_file() {
 
 addtask generate_qt_environment_file after do_install before do_package
 
-SRCREV = "c619d2daac9b1f61e8ad2320b59c648b6af6af90"
+SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
diff --git a/recipes-qt/qt5/qt3d_git.bb b/recipes-qt/qt5/qt3d_git.bb
index d42cf57..437f41c 100644
--- a/recipes-qt/qt5/qt3d_git.bb
+++ b/recipes-qt/qt5/qt3d_git.bb
@@ -15,4 +15,4 @@ FILES_${PN}-qmlplugins += " \
     ${OE_QMAKE_PATH_QML}/*/*/*.obj \
 "
 
-SRCREV = "0bcb6600db2a74ee8c8b51207d3ba15e4973aa95"
+SRCREV = "ec963e106397d46e5c853e9adb3fbec1b27d9b04"
diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
index 34b8ca4..bfe1f85 100644
--- a/recipes-qt/qt5/qt5-git.inc
+++ b/recipes-qt/qt5/qt5-git.inc
@@ -11,7 +11,7 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-PV = "5.5.0+git${SRCPV}"
+PV = "5.5.1+git${SRCPV}"
 
 #LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
 #LIC_FILES_CHKSUM = "file://LICENSE.LGPLv21;md5=58a180e1cf84c756c29f782b3a485c29 \
diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase-native_git.bb
index 0f77fa2..10496f0 100644
--- a/recipes-qt/qt5/qtbase-native_git.bb
+++ b/recipes-qt/qt5/qtbase-native_git.bb
@@ -116,4 +116,4 @@ do_install() {
     ln -sf syncqt.pl ${D}${OE_QMAKE_PATH_QT_BINS}/syncqt
 }
 
-SRCREV = "c619d2daac9b1f61e8ad2320b59c648b6af6af90"
+SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 91bb9f3..a9c448d 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From 566de5f3f4dc14bae25a1b77eb6859c820447a32 Mon Sep 17 00:00:00 2001
+From 76283f2bca936a7565e8bf38a4630ec98f47ef50 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
 Subject: [PATCH 01/10] Add linux-oe-g++ platform
@@ -350,5 +350,5 @@ index 0000000..dd12003
 +
 +#endif // QPLATFORMDEFS_H
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 800d42a..c5f14c9 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,4 +1,4 @@
-From 9e987abf08c5841fcce3331aceec51e00a26dcc8 Mon Sep 17 00:00:00 2001
+From f15c77264cc3ee82cba4127e58be4f6401b791f6 Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
 Subject: [PATCH 02/10] qlibraryinfo: allow to set qt.conf from the outside
@@ -35,5 +35,5 @@ index 0cfcc4e..c3b5c2d 100644
          return new QSettings(qtconfig, QSettings::IniFormat);
  #ifdef QT_BUILD_QMAKE
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index de8e1a4..e969f6f 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,4 +1,4 @@
-From 90f3f8f59dd23f67e14c9988c2f4449a31762752 Mon Sep 17 00:00:00 2001
+From 9529fdce0bd5516f86de1cb18aa6d18a66317ba5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 03/10] Add -external-hostbindir option
@@ -225,5 +225,5 @@ index 99d87e2..5621dc0 100644
      _qt5_Widgets_check_file_exists(${imported_location})
  
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
index e7155bb..b2cf522 100644
--- a/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
+++ b/recipes-qt/qt5/qtbase/0004-qt_module-Fix-pkgconfig-and-libtool-replacements.patch
@@ -1,4 +1,4 @@
-From d28d15f9489ab9bb09627014003ad1bde2a79e1f Mon Sep 17 00:00:00 2001
+From b6d708efc205f2ffc0280e2da94596384bd98049 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
 Subject: [PATCH 04/10] qt_module: Fix pkgconfig and libtool replacements
@@ -108,5 +108,5 @@ index c89b6d2..23d4366 100644
  }
  
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch b/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
index 0875bd8..64f29a5 100644
--- a/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
+++ b/recipes-qt/qt5/qtbase/0005-qeglplatformintegration-Undefine-CursorShape-from-X..patch
@@ -1,4 +1,4 @@
-From c3f540be8541f71fdb7b7baa9000583a914ac7f7 Mon Sep 17 00:00:00 2001
+From 168690a50a5d8bb1068d254532710cec8c93a08f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 19 Mar 2014 18:32:28 +0100
 Subject: [PATCH 05/10] qeglplatformintegration: Undefine CursorShape from X.h
@@ -26,5 +26,5 @@ index 42fbf8c..8950f2d 100644
  
  class QEGLPlatformWindow;
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch b/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
index 0635a2f..6fd8b2b 100644
--- a/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
+++ b/recipes-qt/qt5/qtbase/0006-configure-bump-path-length-from-256-to-512-character.patch
@@ -1,4 +1,4 @@
-From 37aec78ac44bad8754c3bd5b56836025e4eed50a Mon Sep 17 00:00:00 2001
+From 3c6cdb9c315e8457b8d191c0f1192499e8edc009 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Tue, 25 Aug 2015 10:05:15 -0400
 Subject: [PATCH 06/10] configure: bump path length from 256 to 512 characters
@@ -32,5 +32,5 @@ index a757ce5..f0f42ab 100755
  
  static const short qt_configure_str_offsets[] = {
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
index e2d2115..28ecfd5 100644
--- a/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0007-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,4 +1,4 @@
-From ca3b8fabcc38a9545e935a7c530565689fb85ff7 Mon Sep 17 00:00:00 2001
+From d68aa317015ca452b7097b267e5a1fa576aaa5e8 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
 Subject: [PATCH 07/10] QOpenGLPaintDevice sub-area support
@@ -153,5 +153,5 @@ index c179143..fad68d5 100644
      } else {
          if (m_vao.isCreated()) {
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch b/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
index d84e298..b2a478d 100644
--- a/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
+++ b/recipes-qt/qt5/qtbase/0008-Always-build-uic.patch
@@ -1,4 +1,4 @@
-From d1feb6d0a80460e66872749d931cddc8ed22851d Mon Sep 17 00:00:00 2001
+From cbd61cc5f4c447a9539e0a6a1dd378ac34471aff Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 16 Nov 2013 00:32:30 +0100
 Subject: [PATCH 08/10] Always build uic
@@ -27,5 +27,5 @@ index 61e5ce2..a4047aa 100644
  nacl: SUBDIRS -= src_network src_testlib
  
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch b/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
index 9bc1315..3ba6641 100644
--- a/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
+++ b/recipes-qt/qt5/qtbase/0008-qmake-don-t-build-it-in-configure-but-allow-to-build.patch
@@ -1,4 +1,4 @@
-From dcc588b11abdc12b4ed08534334e338f35d96ed1 Mon Sep 17 00:00:00 2001
+From 3442aad5295956c1a177bdf7ab73e1f0d86ab5fc Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
 Subject: [PATCH 08/10] qmake: don't build it in configure, but allow to build
@@ -64,5 +64,5 @@ index 89d6ea5..0ff4a96 100644
  VPATH += \
      ../src/corelib/global \
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch b/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
index 292ced8..683cf27 100644
--- a/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
+++ b/recipes-qt/qt5/qtbase/0009-Add-external-hostbindir-option-for-native-sdk.patch
@@ -1,4 +1,4 @@
-From 22c6746515470bab482b8cbb9a256033470d3647 Mon Sep 17 00:00:00 2001
+From 12d06b2c5857a1c9cac4c964f32a582d029e9dfa Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
 Subject: [PATCH 09/10] Add -external-hostbindir option for native(sdk)
@@ -130,5 +130,5 @@ index 3bf0546..53bf146 100644
      addConfStr(1, hostSpec);
  
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch b/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
index 760f446..2650337 100644
--- a/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
+++ b/recipes-qt/qt5/qtbase/0009-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch
@@ -1,4 +1,4 @@
-From b0648c997d24855b2a6f56fc61e3159af815fb4d Mon Sep 17 00:00:00 2001
+From 8ed228de093947c176cd1d8984a61e3b338bbe66 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 8 Jun 2015 13:59:25 -0700
 Subject: [PATCH 09/10] linux-oe-g++: Invert conditional for defining
@@ -32,5 +32,5 @@ index dd12003..8623651 100644
  
  #if defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE >= 500)
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch b/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
index 9a8ddbb..83f5b58 100644
--- a/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
+++ b/recipes-qt/qt5/qtbase/0010-configure-preserve-built-qmake-and-swap-with-native-.patch
@@ -1,4 +1,4 @@
-From 706d9a8b270d5eb803e93005cc90a1aa1553572a Mon Sep 17 00:00:00 2001
+From 02f14a8fc5513f47d185ad04e6b1b82f3d642e67 Mon Sep 17 00:00:00 2001
 From: Denys Dmytriyenko <denys@ti.com>
 Date: Mon, 11 Nov 2013 20:22:34 -0500
 Subject: [PATCH 10/10] configure: preserve built qmake and swap with native
@@ -26,5 +26,5 @@ index 04fd1ba..8914e9c 100755
  echo "Running configuration tests..."
  
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch b/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
index b2dbbfd..ed661a4 100644
--- a/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
+++ b/recipes-qt/qt5/qtbase/0010-qeglplatformscreen.cpp-reorder-headers-to-fix-build-.patch
@@ -1,4 +1,4 @@
-From c09e6ef0bf6a879455ffee496c716a0bc1787cdf Mon Sep 17 00:00:00 2001
+From fc9f9217495738cbffab34f23dc61bd51fdea952 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Sat, 12 Sep 2015 12:58:46 +0200
 Subject: [PATCH 10/10] qeglplatformscreen.cpp: reorder headers to fix build
@@ -45,5 +45,5 @@ index 61f8cdd..ceec797 100644
  
  QT_BEGIN_NAMESPACE
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 39d02a9..4cffccf 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -279,4 +279,4 @@ sysroot_stage_dirs_append() {
     rm -rf $to${OE_QMAKE_PATH_QT_FONTS}
 }
 
-SRCREV = "c619d2daac9b1f61e8ad2320b59c648b6af6af90"
+SRCREV = "5afc431323454225363dae30e67a1cb909086bf9"
diff --git a/recipes-qt/qt5/qtcanvas3d_git.bb b/recipes-qt/qt5/qtcanvas3d_git.bb
index 4616a21..9678a60 100644
--- a/recipes-qt/qt5/qtcanvas3d_git.bb
+++ b/recipes-qt/qt5/qtcanvas3d_git.bb
@@ -10,4 +10,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "qtdeclarative"
 
-SRCREV = "e372a67c1bbdf695f8e550950a3dbf3106389479"
+SRCREV = "9a714258f32a6a5318eb461903af25f64b7c80d2"
diff --git a/recipes-qt/qt5/qtconnectivity_git.bb b/recipes-qt/qt5/qtconnectivity_git.bb
index 24988cd..84360e8 100644
--- a/recipes-qt/qt5/qtconnectivity_git.bb
+++ b/recipes-qt/qt5/qtconnectivity_git.bb
@@ -22,4 +22,4 @@ do_configure_prepend() {
     sed -i 's/^qtCompileTest(bluez)/OE_BLUEZ_ENABLED:qtCompileTest(bluez)/g' ${S}/qtconnectivity.pro
 }
 
-SRCREV = "b31cbd7c5d6b16a20035ace6675835356b69fd65"
+SRCREV = "cf8b244f94fdabf5c960d82c4bbcbf13c91c29b1"
diff --git a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
index 5dd0aa4..1a4b5c5 100644
--- a/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
+++ b/recipes-qt/qt5/qtdeclarative/0001-qmltestexample-fix-link.patch
@@ -1,4 +1,4 @@
-From c866d9b3f38f1a0adabdeb19648058711a66a900 Mon Sep 17 00:00:00 2001
+From 54fca19532b5224e8f79d7a010f2654ee196d326 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sun, 26 May 2013 14:26:19 +0200
 Subject: [PATCH] qmltestexample: fix link
@@ -84,5 +84,5 @@ index 1bb913e..56f2dd5 100644
  
  load(qt_tool)
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtdeclarative_git.bb b/recipes-qt/qt5/qtdeclarative_git.bb
index 57e76e3..5ea5323 100644
--- a/recipes-qt/qt5/qtdeclarative_git.bb
+++ b/recipes-qt/qt5/qtdeclarative_git.bb
@@ -33,6 +33,6 @@ do_configure_prepend() {
 
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'qtxmlpatterns', 'CONFIG+=OE_QTXMLPATTERNS_ENABLED', '', d)}"
 
-SRCREV = "9794e7d66c30f012a19ec9530d719293b7c5bc7c"
+SRCREV = "3e9f61f305dc4c988e6f2718df56df80f639734e"
 
 BBCLASSEXTEND =+ "native nativesdk"
diff --git a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
index 66000c5..4d0402f 100644
--- a/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
+++ b/recipes-qt/qt5/qtimageformats/0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
@@ -27,5 +27,5 @@ index 8382e5c..63d13ce 100644
  
  load(qt_parts)
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtlocation_git.bb b/recipes-qt/qt5/qtlocation_git.bb
index df5a67d..63642aa 100644
--- a/recipes-qt/qt5/qtlocation_git.bb
+++ b/recipes-qt/qt5/qtlocation_git.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'geoclue', 'CONFIG+=OE_GEOCLUE_ENABLED', '', d)}"
 EXTRA_QMAKEVARS_PRE += "${@base_contains('PACKAGECONFIG', 'gypsy', 'CONFIG+=OE_GYPSY_ENABLED', '', d)}"
 
-SRCREV = "d1c91515ef0ad4208c41a4052f92bfb817333aca"
+SRCREV = "63b118c7da215d994e1695797fd44c2ad35298c3"
diff --git a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
index ec96ddc..d4601d7 100644
--- a/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
+++ b/recipes-qt/qt5/qtmultimedia/0001-Initial-porting-effort-to-GStreamer-1.0.patch
@@ -1,4 +1,4 @@
-From c75cdeeb0ea705b9415c3cf777c611aee01f62c2 Mon Sep 17 00:00:00 2001
+From 64ad5e10c41e234151d18e71bfa315c7906eba16 Mon Sep 17 00:00:00 2001
 From: Yoann Lopes <yoann.lopes@digia.com>
 Date: Thu, 31 Oct 2013 15:06:30 +0100
 Subject: [PATCH] Initial porting effort to GStreamer 1.0.
@@ -55,5 +55,5 @@ index 1225ffb..4f675fe 100644
  
      qtCompileTest(resourcepolicy)
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtmultimedia_git.bb b/recipes-qt/qt5/qtmultimedia_git.bb
index 7103c04..faf05d4 100644
--- a/recipes-qt/qt5/qtmultimedia_git.bb
+++ b/recipes-qt/qt5/qtmultimedia_git.bb
@@ -35,4 +35,4 @@ SRC_URI += "\
      file://0001-Initial-porting-effort-to-GStreamer-1.0.patch \
 "
 
-SRCREV = "46a83d5b86a792e62f14674e27c5d95695f2b44d"
+SRCREV = "0cf41ef53f7b336509ed7d1ae6518655276af70f"
diff --git a/recipes-qt/qt5/qtquickcontrols_git.bb b/recipes-qt/qt5/qtquickcontrols_git.bb
index bd42cc9..54de87c 100644
--- a/recipes-qt/qt5/qtquickcontrols_git.bb
+++ b/recipes-qt/qt5/qtquickcontrols_git.bb
@@ -13,4 +13,4 @@ DEPENDS += "qtdeclarative"
 
 RDEPENDS_${PN}-dev = ""
 
-SRCREV = "b35b0d60c8252b44e21e53922cba9c3a2d1abbc1"
+SRCREV = "61889f06fa828b483513b8315b4f0870532ece66"
diff --git a/recipes-qt/qt5/qtsensors_git.bb b/recipes-qt/qt5/qtsensors_git.bb
index c37a12d..e495c5b 100644
--- a/recipes-qt/qt5/qtsensors_git.bb
+++ b/recipes-qt/qt5/qtsensors_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "a7b94516e1412073eb9d3fb57e49315ef966b183"
+SRCREV = "6a16281aceedb713676e16c3074e6f7ea1e70b79"
diff --git a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
index 7d14014..e1255d8 100644
--- a/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
+++ b/recipes-qt/qt5/qttools/0001-Allow-to-build-only-lrelease-lupdate-lconvert.patch
@@ -1,7 +1,7 @@
 From 922931781bd4fd765de996f1709aff95b6ac3fba Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.jansa@gmail.com>
 Date: Wed, 11 Sep 2013 18:30:08 +0200
-Subject: [PATCH 1/3] Allow to build only lrelease + lupdate + lconvert
+Subject: [PATCH 1/4] Allow to build only lrelease + lupdate + lconvert
 
 This is useful e.g. when cross compiling with OpenEmbedded where qtbase-native
 is built without GUI support (no-png is set) and we still want to build
@@ -155,5 +155,5 @@ index 20b5fec..8a42d1f 100644
  installed_cmake.depends = cmake
  
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
index 7496a4a..3116b3d 100644
--- a/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
+++ b/recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
@@ -1,7 +1,7 @@
 From 83493e0f4e0d8b4dbf1da982e4459fefea61c582 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Fri, 17 Jan 2014 14:33:19 +0100
-Subject: [PATCH 2/3] assistant/help: fix linking of dependent libraries
+Subject: [PATCH 2/4] assistant/help: fix linking of dependent libraries
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -28,5 +28,5 @@ index 168d23d..a9c3b59 100644
 +
 +LIBS += -lQt5CLucene
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
index 55506f8..a0306e5 100644
--- a/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
+++ b/recipes-qt/qt5/qttools/0003-add-noqtwebkit-configuration.patch
@@ -1,7 +1,7 @@
 From ad5e4266eda956a1ff408bf3fe875badc5f4c866 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 4 Jun 2014 11:28:16 +0200
-Subject: [PATCH 3/3] add noqtwebkit configuration
+Subject: [PATCH 3/4] add noqtwebkit configuration
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -47,5 +47,5 @@ index 500a153..b60fa2d 100644
  win32: qtHaveModule(axcontainer): SUBDIRS += activeqt
  qtHaveModule(quickwidgets): SUBDIRS += qquickwidget
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
index ae96384..ce4a0b7 100644
--- a/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
+++ b/recipes-qt/qt5/qttools/0004-linguist-tools-cmake-allow-overriding-the-location-f.patch
@@ -1,7 +1,7 @@
-From b105af5084ec1ee51c1428769b881c260f01d4d5 Mon Sep 17 00:00:00 2001
+From e9e9a79d1a58981dd33d18c0f43b1fb982100a61 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 9 Jul 2015 11:28:19 -0400
-Subject: [PATCH] linguist-tools cmake: allow overriding the location for
+Subject: [PATCH 4/4] linguist-tools cmake: allow overriding the location for
  lupdate and lrelease
 
 ---
@@ -59,5 +59,5 @@ index 4318b16..2e3b70f 100644
  
      set_target_properties(Qt5::lconvert PROPERTIES
 -- 
-2.4.5
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwayland-native_git.bb b/recipes-qt/qt5/qtwayland-native_git.bb
index 48a94e5..b351b38 100644
--- a/recipes-qt/qt5/qtwayland-native_git.bb
+++ b/recipes-qt/qt5/qtwayland-native_git.bb
@@ -25,4 +25,4 @@ do_install() {
     oe_runmake install INSTALL_ROOT=${D}
 }
 
-SRCREV = "10fd51a3e69a0a2ee6b8cd151fa6c847f684253c"
+SRCREV = "9d408649458a274864ae2e7c2d67b4fa3cabbfcd"
diff --git a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
index 3d26a5e..caaceef 100644
--- a/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
+++ b/recipes-qt/qt5/qtwayland/0001-Install-the-qtwaylandscanner-tool-to-the-native-side.patch
@@ -1,4 +1,4 @@
-From 09ba9e7eaebd72be5703d29848f5a65e5ca2e21c Mon Sep 17 00:00:00 2001
+From 7d40a551397f9914cacd5470bf17ac40a7b7330b Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Fri, 19 Jul 2013 13:35:14 +0000
 Subject: [PATCH] Install the qtwaylandscanner tool to the native side
@@ -28,5 +28,5 @@ index ac2d07b..7a46a24 100644
 +target.path = $$[QT_HOST_BINS]
 +INSTALLS += target
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
index d271f25..384c1fa 100644
--- a/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
+++ b/recipes-qt/qt5/qtwayland/0001-examples-wayland-include-server-buffer-only-when-bui.patch
@@ -1,4 +1,4 @@
-From 19a3382694b3d66a056207e4e0345348f1d5bd57 Mon Sep 17 00:00:00 2001
+From d1de302c09ddbb4baac4bc781a6d53de11f387b3 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 22 Feb 2014 17:47:44 +0100
 Subject: [PATCH] examples/wayland: include server-buffer only when building
@@ -27,5 +27,5 @@ index d633fb9..643c7cd 100644
 +    }
  }
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwayland_git.bb b/recipes-qt/qt5/qtwayland_git.bb
index 8e6f9d0..2ea3285 100644
--- a/recipes-qt/qt5/qtwayland_git.bb
+++ b/recipes-qt/qt5/qtwayland_git.bb
@@ -46,4 +46,4 @@ do_install_append() {
     install ${B}/include/QtCompositor/${QT_VERSION}/QtCompositor/private/*protocol*.h ${D}${OE_QMAKE_PATH_QT_HEADERS}/QtCompositor/${QT_VERSION}/QtCompositor/private
 }
 
-SRCREV = "10fd51a3e69a0a2ee6b8cd151fa6c847f684253c"
+SRCREV = "9d408649458a274864ae2e7c2d67b4fa3cabbfcd"
diff --git a/recipes-qt/qt5/qtwebchannel_git.bb b/recipes-qt/qt5/qtwebchannel_git.bb
index 60d3f38..aa7cb25 100644
--- a/recipes-qt/qt5/qtwebchannel_git.bb
+++ b/recipes-qt/qt5/qtwebchannel_git.bb
@@ -15,4 +15,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtdeclarative qtwebsockets"
 
-SRCREV = "6a7de61bc15d0cde3a3c91c58f45ba10957aa39b"
+SRCREV = "906d910415454d64ff0b021b06f0df422a8c82bd"
diff --git a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
index f8808c1..062d9ed 100644
--- a/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch
@@ -1,4 +1,4 @@
-From 8752cdaf7961ad0be8482cd6ebf76c91972f5088 Mon Sep 17 00:00:00 2001
+From 2a264c2ea7080b026ea1ec85f6317de13c5a6f4f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Fri, 3 Oct 2014 03:52:11 +0200
 Subject: [PATCH 1/2] <chromium> base.gypi: include
@@ -23,5 +23,5 @@ index a5a285a..f1cad86 100644
                  ['include', 'atomicops_internals_x86_gcc.cc'],
                ],
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
index cceba8d..02381e0 100644
--- a/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
+++ b/recipes-qt/qt5/qtwebengine/0001-functions.prf-Don-t-match-QMAKE_EXT_CPP-or-QMAKE_EXT.patch
@@ -1,4 +1,4 @@
-From f66dceb807d27e4c0a3d1dd4d5b4f448b08317c9 Mon Sep 17 00:00:00 2001
+From cf7f63dfcf71b7baee30112ef73fed67504033f7 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 30 Jun 2014 20:08:17 +0200
 Subject: [PATCH 1/4] functions.prf: Don't match QMAKE_EXT_CPP or QMAKE_EXT_H
@@ -10,10 +10,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 69d3fd3..5689ce0 100644
+index 64064bd..8287c8f 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -98,9 +98,9 @@ defineReplace(mocOutput) {
+@@ -105,9 +105,9 @@ defineReplace(mocOutput) {
    out = $$1
    # The order is important, since the output of the second replace would end up accidentaly transformed by the first one
    for(ext, $$list($${QMAKE_EXT_CPP})): \
@@ -26,5 +26,5 @@ index 69d3fd3..5689ce0 100644
  }
  
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch b/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
index 87d21db..ae91cd2 100644
--- a/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch
@@ -1,4 +1,4 @@
-From 1efcdf981e6f4cc4e2b5e5dfe407030dc1e43e65 Mon Sep 17 00:00:00 2001
+From b534874479a150d1fef4e0a4fb79a176d0a342eb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 Jun 2015 13:29:52 -0700
 Subject: [PATCH 2/2] chromium/third_party/boringssl: Demand for newer POSIX
@@ -34,5 +34,5 @@ index ba65a1a..66c3976 100644
  #include <openssl/bio.h>
  #include <openssl/err.h>
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
index 1448197..2ba8fec 100644
--- a/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
+++ b/recipes-qt/qt5/qtwebengine/0002-functions.prf-Make-sure-we-only-use-the-file-name-to.patch
@@ -1,4 +1,4 @@
-From 3cdf1ffa138026a601df8e8ddff5ac0723edb0b7 Mon Sep 17 00:00:00 2001
+From 7f81bad8fcd00afcf2214285856d46f50f91b55c Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Tue, 18 Nov 2014 10:38:18 +0100
 Subject: [PATCH 2/4] functions.prf: Make sure we only use the file name to
@@ -11,10 +11,10 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index 5689ce0..e71e6e4 100644
+index 8287c8f..04bdba5 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
-@@ -95,7 +95,8 @@ defineReplace(findIncludedMocFiles) {
+@@ -102,7 +102,8 @@ defineReplace(findIncludedMocFiles) {
  }
  
  defineReplace(mocOutput) {
@@ -25,5 +25,5 @@ index 5689ce0..e71e6e4 100644
    for(ext, $$list($${QMAKE_EXT_CPP})): \
        out = $$replace(out, ^(.*)($$re_escape($${ext}))$, $${QMAKE_CPP_MOD_MOC}\\1$${QMAKE_EXT_CPP_MOC})
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
index bfde82e..23be489 100644
--- a/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtwebengine/0003-functions.prf-allow-build-for-linux-oe-g-platform.patch
@@ -1,4 +1,4 @@
-From b7b5fa151e1ff1749ab5b04763f0f64a156e6e48 Mon Sep 17 00:00:00 2001
+From a7bb8e37abb3a11e6257d6e154d33c7af5856dcc Mon Sep 17 00:00:00 2001
 From: Frieder Schrempf <frieder.schrempf@online.de>
 Date: Mon, 1 Dec 2014 14:34:40 +0000
 Subject: [PATCH 3/4] functions.prf: allow build for linux-oe-g++ platform
@@ -12,7 +12,7 @@ Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/tools/qmake/mkspecs/features/functions.prf b/tools/qmake/mkspecs/features/functions.prf
-index e71e6e4..2161505 100644
+index 04bdba5..4206661 100644
 --- a/tools/qmake/mkspecs/features/functions.prf
 +++ b/tools/qmake/mkspecs/features/functions.prf
 @@ -14,7 +14,7 @@ defineTest(isPlatformSupported) {
@@ -25,5 +25,5 @@ index e71e6e4..2161505 100644
  
    skipBuild("Qt WebEngine can currently only be built for Linux (GCC), Windows (MSVC 2013), OS X (XCode 5.1+) or Qt for Device Creation.")
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch b/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch
index 55dc557..037b0e4 100644
--- a/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch
+++ b/recipes-qt/qt5/qtwebengine/0004-Generate-usable-qmake_extras.gypi.patch
@@ -1,4 +1,4 @@
-From 55c5a15f0a11c76a930020ac725e57303da2ef48 Mon Sep 17 00:00:00 2001
+From 324eab1b148df1e8330b2dbbd114ab696c163e46 Mon Sep 17 00:00:00 2001
 From: Samuli Piippo <samuli.piippo@theqtcompany.com>
 Date: Mon, 11 May 2015 13:47:06 +0300
 Subject: [PATCH 4/4] Generate usable qmake_extras.gypi
@@ -67,5 +67,5 @@ index 2a59966..317d24a 100644
                   "  'target_defaults': {" \
                   "    'target_conditions': [" \
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebengine_git.bb
index 7127c8f..fe92338 100644
--- a/recipes-qt/qt5/qtwebengine_git.bb
+++ b/recipes-qt/qt5/qtwebengine_git.bb
@@ -82,8 +82,8 @@ SRC_URI += " \
     file://0001-chromium-base.gypi-include-atomicops_internals_x86_g.patch \
     file://0002-chromium-third_party-boringssl-Demand-for-newer-POSI.patch \
 "
-SRCREV_qtwebengine = "ccb373c4937777ce4af10918f7412c606cbd56ce"
-SRCREV_chromium = "305284960db83fe9b9ae47674db9914d82180c23"
+SRCREV_qtwebengine = "ce095e94b686196629244073990530441b9b5f4f"
+SRCREV_chromium = "146ebe26dce3289eb440bed7d5d0a7988ff5f5c9"
 SRCREV = "${SRCREV_qtwebengine}"
 
 SRCREV_FORMAT = "qtwebengine"
diff --git a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
index caf8a38..eb90a06 100644
--- a/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
+++ b/recipes-qt/qt5/qtwebkit-examples/0001-qtwebkit-examples-enable-building-examples-by-defaul.patch
@@ -25,5 +25,5 @@ index 3fcecf1..2da8a36 100644
 -SUBDIRS += doc
 +SUBDIRS += doc examples
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
index 17f9ee4..66dfd13 100644
--- a/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
+++ b/recipes-qt/qt5/qtwebkit/0001-qtwebkit-fix-QA-issue-bad-RPATH.patch
@@ -26,5 +26,5 @@ index fd66af6..ef754c3 100644
  CONFIG(debug, debug|release)|force_debug_info {
      # Make ld not cache the symbol tables of input files in memory to avoid memory exhaustion during the linking phase.
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
index 39cfc62..3d4ba18 100644
--- a/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
+++ b/recipes-qt/qt5/qtwebkit/0002-Remove-TEXTREL-tag-in-x86.patch
@@ -75,5 +75,5 @@ index 0a2fe78..2dc40ef 100644
  #define GLOBAL_REFERENCE(name) SYMBOL_STRING(name)
  #endif
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
index 819cc27..0351e22 100644
--- a/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
+++ b/recipes-qt/qt5/qtwebkit/0003-Exclude-backtrace-API-for-non-glibc-libraries.patch
@@ -34,5 +34,5 @@ index 1b2091f..ba03a28 100644
  #elif OS(WINDOWS) && !OS(WINCE)
      // The CaptureStackBackTrace function is available in XP, but it is not defined
 -- 
-2.5.3
+2.6.1
 
diff --git a/recipes-qt/qt5/qtwebsockets_git.bb b/recipes-qt/qt5/qtwebsockets_git.bb
index 11ce7f4..4d0a51f 100644
--- a/recipes-qt/qt5/qtwebsockets_git.bb
+++ b/recipes-qt/qt5/qtwebsockets_git.bb
@@ -11,4 +11,4 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase qtdeclarative"
 
-SRCREV = "12e424f241b29ef26ad2a3a70740d8b320e9e85a"
+SRCREV = "08582917b43af8670658c210b2cb2a8b06e04252"
diff --git a/recipes-qt/qt5/qtxmlpatterns_git.bb b/recipes-qt/qt5/qtxmlpatterns_git.bb
index 2581af0..bea55c4 100644
--- a/recipes-qt/qt5/qtxmlpatterns_git.bb
+++ b/recipes-qt/qt5/qtxmlpatterns_git.bb
@@ -13,6 +13,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS += "qtbase"
 
-SRCREV = "670b2073c0b1c40f5b67fc36c18ed15fe2cdfee2"
+SRCREV = "3338de7bbe76bac44652c525003bc66b14ef16d4"
 
 BBCLASSEXTEND =+ "native nativesdk"
-- 
2.6.1


