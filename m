Return-Path: <net147@gmail.com>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7C36F572
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 03:30:53 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so4590527pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Mar 2014 19:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=yu0BlYc/eBf86b323mDEHTvK0wbsj5y807AalJK4dT0=;
	b=KziqVpboI7LgAO2A4SnSXl2wRJYCSaYKeQ53MoWBtxKPHdK4PIb9jBHUx6mZixcO8B
	GJclzxGYBOcdRQZOpwsGCamY801uFl5qP/3CZ8oolROyP60cEfa1tViXjgrD2qA0053R
	cZx3DiAAfDygQHmYiua9uLBPBmwfJFJjJPYAOaPkN4ymAeWvGfiKWW9ISoV2Ey5e7MzS
	sSrj9THcjuGmPlDpZmley9gjq+X2repTG+B8z2SoW1DCRejlxcLftE5ZRqUrnNaZspHw
	Cgr9m3Bf4xEoXpirILvjAmryVIkZZt6xJT6zhXEQb9iia6xaHSjW0nGQHtlOGo3xhw9/
	Hp0A==
X-Received: by 10.66.142.233 with SMTP id rz9mr3289978pab.71.1393903853437;
	Mon, 03 Mar 2014 19:30:53 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id q7sm41872022pbc.20.2014.03.03.19.30.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Mar 2014 19:30:52 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Mar 2014 14:35:14 +1100
Message-Id: <1393904114-10583-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] qtbase: fix mmsize argument parsing for linuxfb plugin
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
X-List-Received-Date: Tue, 04 Mar 2014 03:30:53 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 recipes-qt/qt5/qtbase.inc                          |  1 +
 .../qt5/qtbase/0001-Add-linux-oe-g-platform.patch  |  2 +-
 ...o-allow-to-set-qt.conf-from-the-outside-u.patch |  2 +-
 .../0003-Add-external-hostbindir-option.patch      |  2 +-
 ...p-Prefix-default-LIBDIRS-and-INCDIRS-with.patch |  2 +-
 .../0005-qt_module-Fix-pkgconfig-replacement.patch |  2 +-
 ...on-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch |  2 +-
 ....prf-Allow-to-add-extra-arguments-to-make.patch |  2 +-
 ...ake-pulseaudio-alsa-freetype-a-configurab.patch |  2 +-
 ...E_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch |  2 +-
 ...0-qmake-is-already-built-in-qtbase-native.patch |  2 +-
 ...-building-a-separate-qmake-for-the-target.patch |  2 +-
 .../0012-qtbase-allow-build-of-examples.patch      |  2 +-
 .../0013-QOpenGLPaintDevice-sub-area-support.patch |  2 +-
 ...gl-error-for-platforms-only-supporting-on.patch |  2 +-
 .../0015-Fix-linuxfb-argument-mmsize-parsing.patch | 42 ++++++++++++++++++++++
 16 files changed, 57 insertions(+), 14 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch

diff --git a/recipes-qt/qt5/qtbase.inc b/recipes-qt/qt5/qtbase.inc
index 378f229..f1a10bb 100644
--- a/recipes-qt/qt5/qtbase.inc
+++ b/recipes-qt/qt5/qtbase.inc
@@ -19,6 +19,7 @@ SRC_URI += "\
     file://0012-qtbase-allow-build-of-examples.patch \
     file://0013-QOpenGLPaintDevice-sub-area-support.patch \
     file://0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch \
+    file://0015-Fix-linuxfb-argument-mmsize-parsing.patch \
 "
 
 DEPENDS += "qtbase-native"
diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 5ce4cdd..030a091 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
 From f883ec8652ee603d9bb9def7eb669ed82c493961 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/14] Add linux-oe-g++ platform
+Subject: [PATCH 01/15] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 2f72dca..525260a 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
 From 841d1f06f3fd2f59f6b18067b02d5fcfc93aaa7a Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/14] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/15] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 7e03f74..91b0a6c 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
 From 3648eeddaed0cf31fba226ec713d2321f398974f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/14] Add -external-hostbindir option
+Subject: [PATCH 03/15] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
diff --git a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index 16317ac..b1cdfa4 100644
--- a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
 From 698f073fb8cc6dc1ced277b6ae2056cb9d02f2d5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/14] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 04/15] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
index b8768c8..9ac5f6a 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
+++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
@@ -1,7 +1,7 @@
 From 7999eeb3f2ab1150aa301ec26ae9bf0788d09c9e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 05/14] qt_module: Fix pkgconfig replacement
+Subject: [PATCH 05/15] qt_module: Fix pkgconfig replacement
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch b/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
index 726bfe0..d514da3 100644
--- a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
+++ b/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
@@ -1,7 +1,7 @@
 From ebd38fc708cf7190e47a75754235f56fa5d86300 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 8 May 2013 23:54:35 +0200
-Subject: [PATCH 06/14] configure: don't export SYSTEM_VARIABLES to .qmake.vars
+Subject: [PATCH 06/15] configure: don't export SYSTEM_VARIABLES to .qmake.vars
 
 * linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
   causing issues as we need g++ to be used as linker
diff --git a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
index e8a7784..821e5b8 100644
--- a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
+++ b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
@@ -1,7 +1,7 @@
 From 828eecd8f361cb965bd40f535435efa91665c8e5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 9 May 2013 10:06:50 +0200
-Subject: [PATCH 07/14] configure.prf: Allow to add extra arguments to make
+Subject: [PATCH 07/15] configure.prf: Allow to add extra arguments to make
 
 * sometimes we would like to add -e or define some variable and respect it from both
   Makefiles used in configure tests and also Makefiles to build the application
diff --git a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch b/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
index cccf7fb..4abc465 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
@@ -1,7 +1,7 @@
 From 3923edc900d1b3dd23e0a6af3a32255707cd497c Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 08/14] configure: make pulseaudio, alsa, freetype a
+Subject: [PATCH 08/15] configure: make pulseaudio, alsa, freetype a
  configurable option
 
 Allows disabling pulseaudio, alsa, freetype support at configure time
diff --git a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
index 23e22a8..b52d02d 100644
--- a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
+++ b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
@@ -1,7 +1,7 @@
 From acbd622d1b91c1aa9ec8c48d10d91354d175345c Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Mon, 22 Jul 2013 21:09:41 +0000
-Subject: [PATCH 09/14] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
+Subject: [PATCH 09/15] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
  determine path to host binaries
 
 Upstream-Status: Inappropiate (configuration)
diff --git a/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch b/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch
index 64ba88e..eb2da1e 100644
--- a/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch
+++ b/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch
@@ -1,7 +1,7 @@
 From 77a18a9fe2d0e4a1dcd95e2d78c85eb37452bc73 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 10/14] qmake is already built in qtbase-native
+Subject: [PATCH 10/15] qmake is already built in qtbase-native
 
 Ported from OE by: Yu Ke <ke.yu@intel.com>
 Upstream-Status: Inappropriate [configuration]
diff --git a/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch b/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch
index f80edbd..e028f35 100644
--- a/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch
+++ b/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch
@@ -1,7 +1,7 @@
 From dd14f3eda61669c66c95dbcbca3afbd61f9aa746 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Mon, 29 Oct 2012 20:26:36 -0700
-Subject: [PATCH 11/14] Allow building a separate qmake for the target
+Subject: [PATCH 11/15] Allow building a separate qmake for the target
 
 Upstream-Status: Inappropriate [config]
 
diff --git a/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch b/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
index 9d46d2f..3e8f1e2 100644
--- a/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
+++ b/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
@@ -1,7 +1,7 @@
 From 6e5e22110b4731b4324d309bc579393f422ba99d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sat, 25 May 2013 17:34:32 +0200
-Subject: [PATCH 12/14] qtbase: allow build of examples
+Subject: [PATCH 12/15] qtbase: allow build of examples
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
index c6ec67c..8366364 100644
--- a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
 From 2fad0a6fa3c06577995ac44ed0a2a12eaef819c2 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 13/14] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 13/15] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
diff --git a/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index 6fd2938..9c366b6 100644
--- a/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
 From c8995c6eb6cf4bfa8daf1e3e96bd4885a096f405 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 14/14] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 14/15] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
diff --git a/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
new file mode 100644
index 0000000..c9836c8
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
@@ -0,0 +1,42 @@
+From 99979159a404df09495c8ddd6a052837f66b8739 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
+Date: Fri, 7 Feb 2014 13:12:37 +0100
+Subject: [PATCH 15/15] Fix linuxfb argument 'mmsize' parsing
+
+Parse first for 'mmsize' because the regex for 'size' also fits to 'mmsize'.
+
+Upstream-Status: Backport
+
+Task-number: QTBUG-29133
+Change-Id: Idc4950270818e496d5d94a97a172b7c780f069b1
+Reviewed-by: Laszlo Agocs <laszlo.agocs@digia.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
+index 735a43d..33a9523 100644
+--- a/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
++++ b/src/plugins/platforms/linuxfb/qlinuxfbscreen.cpp
+@@ -333,6 +333,8 @@ bool QLinuxFbScreen::initialize()
+     foreach (const QString &arg, mArgs) {
+         if (arg == QLatin1String("nographicsmodeswitch"))
+             doSwitchToGraphicsMode = false;
++        else if (mmSizeRx.indexIn(arg) != -1)
++            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
+         else if (sizeRx.indexIn(arg) != -1)
+             userGeometry.setSize(QSize(sizeRx.cap(1).toInt(), sizeRx.cap(2).toInt()));
+         else if (offsetRx.indexIn(arg) != -1)
+@@ -341,8 +343,6 @@ bool QLinuxFbScreen::initialize()
+             ttyDevice = ttyRx.cap(1);
+         else if (fbRx.indexIn(arg) != -1)
+             fbDevice = fbRx.cap(1);
+-        else if (mmSizeRx.indexIn(arg) != -1)
+-            userMmSize = QSize(mmSizeRx.cap(1).toInt(), mmSizeRx.cap(2).toInt());
+     }
+ 
+     if (fbDevice.isEmpty()) {
+-- 
+1.7.1
+
-- 
1.9.0


