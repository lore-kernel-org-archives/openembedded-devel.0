Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0F0EC6E304
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Mar 2014 13:10:31 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id lf10so2548703pab.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Mar 2014 05:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=b2viJn+Iu6swmsoZGjClWZw7b7qqvjoE6+W1ahzXROc=;
	b=R7JdUx+3GIarnan+bZGpNsifcVeD1FkiJadpKFj+zQjDIslakdouqRF2a60+TFC/LB
	nx3+4xrOaPyAnfWto5kBskaNzUkGi2Rs+6dqsaR2IcEKyJwN7WbyzArLtsZQ3gIb73U1
	qYxiRuOSiDBie8OOThk/SYv4dMJgqkCxQnFn3ry78+9C5w/Bl5JUk1zmj0sG9rSXm5RX
	7/24mKxXd+4S7Wwc+lud6PO3j0LaR34+Azfk+Xtm53iJEtjHd5mwS2tImJCgKJ1H7LJQ
	phJXvQ8fgyJIZs6yxmzQkssAPllh7UBLLhuT3cqU4KpNYECJlI8mn6+dqYDZcqdgBsQf
	H8Jw==
X-Received: by 10.66.181.70 with SMTP id du6mr5842655pac.23.1393938630982;
	Tue, 04 Mar 2014 05:10:30 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id j3sm47774831pbh.38.2014.03.04.05.10.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Mar 2014 05:10:30 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Mar 2014 00:15:22 +1100
Message-Id: <1393938922-23584-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [meta-qt5][PATCH] qtbase: prevent artifacts on raster windows using eglfs plugin
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
X-List-Received-Date: Tue, 04 Mar 2014 13:10:34 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
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
 .../0015-Fix-linuxfb-argument-mmsize-parsing.patch |  2 +-
 .../qtbase/0016-eglfs-Fix-quad-coordinates.patch   | 39 ++++++++++++++++++++++
 16 files changed, 54 insertions(+), 15 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch

diff --git a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
index 030a091..b256f14 100644
--- a/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
+++ b/recipes-qt/qt5/qtbase/0001-Add-linux-oe-g-platform.patch
@@ -1,7 +1,7 @@
 From f883ec8652ee603d9bb9def7eb669ed82c493961 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Mon, 15 Apr 2013 04:29:32 +0200
-Subject: [PATCH 01/15] Add linux-oe-g++ platform
+Subject: [PATCH 01/16] Add linux-oe-g++ platform
 
 * This qmake.conf unlike other platforms reads most variables from
   shell environment, because it's easier for qt recipes to export
diff --git a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
index 525260a..870aa9f 100644
--- a/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
+++ b/recipes-qt/qt5/qtbase/0002-qlibraryinfo-allow-to-set-qt.conf-from-the-outside-u.patch
@@ -1,7 +1,7 @@
 From 841d1f06f3fd2f59f6b18067b02d5fcfc93aaa7a Mon Sep 17 00:00:00 2001
 From: Holger Freyther <zecke@selfish.org>
 Date: Wed, 26 Sep 2012 17:22:30 +0200
-Subject: [PATCH 02/15] qlibraryinfo: allow to set qt.conf from the outside
+Subject: [PATCH 02/16] qlibraryinfo: allow to set qt.conf from the outside
  using the environment
 
 Allow to set a qt.conf from the outside using the environment. This allows
diff --git a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
index 91b0a6c..c82e9d1 100644
--- a/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
+++ b/recipes-qt/qt5/qtbase/0003-Add-external-hostbindir-option.patch
@@ -1,7 +1,7 @@
 From 3648eeddaed0cf31fba226ec713d2321f398974f Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 6 Apr 2013 13:15:07 +0200
-Subject: [PATCH 03/15] Add -external-hostbindir option
+Subject: [PATCH 03/16] Add -external-hostbindir option
 
 * when cross-compiling it's sometimes useful to use existing tools from machine
   (or in OpenEmbedded built with separate native recipe) when building for target
diff --git a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
index b1cdfa4..f1184e5 100644
--- a/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
+++ b/recipes-qt/qt5/qtbase/0004-configureapp-Prefix-default-LIBDIRS-and-INCDIRS-with.patch
@@ -1,7 +1,7 @@
 From 698f073fb8cc6dc1ced277b6ae2056cb9d02f2d5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 22:33:33 +0200
-Subject: [PATCH 04/15] configureapp: Prefix default LIBDIRS and INCDIRS with
+Subject: [PATCH 04/16] configureapp: Prefix default LIBDIRS and INCDIRS with
  SYSROOT
 
 Upstream-Status: Pending
diff --git a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
index 9ac5f6a..f1770bd 100644
--- a/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
+++ b/recipes-qt/qt5/qtbase/0005-qt_module-Fix-pkgconfig-replacement.patch
@@ -1,7 +1,7 @@
 From 7999eeb3f2ab1150aa301ec26ae9bf0788d09c9e Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Sat, 27 Apr 2013 23:15:37 +0200
-Subject: [PATCH 05/15] qt_module: Fix pkgconfig replacement
+Subject: [PATCH 05/16] qt_module: Fix pkgconfig replacement
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch b/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
index d514da3..0bd53cf 100644
--- a/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
+++ b/recipes-qt/qt5/qtbase/0006-configure-don-t-export-SYSTEM_VARIABLES-to-.qmake.va.patch
@@ -1,7 +1,7 @@
 From ebd38fc708cf7190e47a75754235f56fa5d86300 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Wed, 8 May 2013 23:54:35 +0200
-Subject: [PATCH 06/15] configure: don't export SYSTEM_VARIABLES to .qmake.vars
+Subject: [PATCH 06/16] configure: don't export SYSTEM_VARIABLES to .qmake.vars
 
 * linux-oe-g++ should handle this correctly and exporting LD as QMAKE_LINK is
   causing issues as we need g++ to be used as linker
diff --git a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
index 821e5b8..abe26a1 100644
--- a/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
+++ b/recipes-qt/qt5/qtbase/0007-configure.prf-Allow-to-add-extra-arguments-to-make.patch
@@ -1,7 +1,7 @@
 From 828eecd8f361cb965bd40f535435efa91665c8e5 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <Martin.Jansa@gmail.com>
 Date: Thu, 9 May 2013 10:06:50 +0200
-Subject: [PATCH 07/15] configure.prf: Allow to add extra arguments to make
+Subject: [PATCH 07/16] configure.prf: Allow to add extra arguments to make
 
 * sometimes we would like to add -e or define some variable and respect it from both
   Makefiles used in configure tests and also Makefiles to build the application
diff --git a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch b/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
index 4abc465..7011025 100644
--- a/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
+++ b/recipes-qt/qt5/qtbase/0008-configure-make-pulseaudio-alsa-freetype-a-configurab.patch
@@ -1,7 +1,7 @@
 From 3923edc900d1b3dd23e0a6af3a32255707cd497c Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Tue, 28 Feb 2012 15:10:24 +0000
-Subject: [PATCH 08/15] configure: make pulseaudio, alsa, freetype a
+Subject: [PATCH 08/16] configure: make pulseaudio, alsa, freetype a
  configurable option
 
 Allows disabling pulseaudio, alsa, freetype support at configure time
diff --git a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
index b52d02d..6b7bc1e 100644
--- a/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
+++ b/recipes-qt/qt5/qtbase/0009-cmake-Use-OE_QMAKE_PATH_EXTERNAL_HOST_BINS-to-determ.patch
@@ -1,7 +1,7 @@
 From acbd622d1b91c1aa9ec8c48d10d91354d175345c Mon Sep 17 00:00:00 2001
 From: Simon Busch <morphis@gravedo.de>
 Date: Mon, 22 Jul 2013 21:09:41 +0000
-Subject: [PATCH 09/15] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
+Subject: [PATCH 09/16] cmake: Use OE_QMAKE_PATH_EXTERNAL_HOST_BINS to
  determine path to host binaries
 
 Upstream-Status: Inappropiate (configuration)
diff --git a/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch b/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch
index eb2da1e..e9266cb 100644
--- a/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch
+++ b/recipes-qt/qt5/qtbase/0010-qmake-is-already-built-in-qtbase-native.patch
@@ -1,7 +1,7 @@
 From 77a18a9fe2d0e4a1dcd95e2d78c85eb37452bc73 Mon Sep 17 00:00:00 2001
 From: Michael Krelin <hacker@klever.net>
 Date: Mon, 29 Oct 2012 20:07:49 -0700
-Subject: [PATCH 10/15] qmake is already built in qtbase-native
+Subject: [PATCH 10/16] qmake is already built in qtbase-native
 
 Ported from OE by: Yu Ke <ke.yu@intel.com>
 Upstream-Status: Inappropriate [configuration]
diff --git a/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch b/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch
index e028f35..a477348 100644
--- a/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch
+++ b/recipes-qt/qt5/qtbase/0011-Allow-building-a-separate-qmake-for-the-target.patch
@@ -1,7 +1,7 @@
 From dd14f3eda61669c66c95dbcbca3afbd61f9aa746 Mon Sep 17 00:00:00 2001
 From: Paul Eggleton <paul.eggleton@linux.intel.com>
 Date: Mon, 29 Oct 2012 20:26:36 -0700
-Subject: [PATCH 11/15] Allow building a separate qmake for the target
+Subject: [PATCH 11/16] Allow building a separate qmake for the target
 
 Upstream-Status: Inappropriate [config]
 
diff --git a/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch b/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
index 3e8f1e2..19ba150 100644
--- a/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
+++ b/recipes-qt/qt5/qtbase/0012-qtbase-allow-build-of-examples.patch
@@ -1,7 +1,7 @@
 From 6e5e22110b4731b4324d309bc579393f422ba99d Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
 Date: Sat, 25 May 2013 17:34:32 +0200
-Subject: [PATCH 12/15] qtbase: allow build of examples
+Subject: [PATCH 12/16] qtbase: allow build of examples
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
diff --git a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch b/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
index 8366364..e1eabb5 100644
--- a/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
+++ b/recipes-qt/qt5/qtbase/0013-QOpenGLPaintDevice-sub-area-support.patch
@@ -1,7 +1,7 @@
 From 2fad0a6fa3c06577995ac44ed0a2a12eaef819c2 Mon Sep 17 00:00:00 2001
 From: Jani Hautakangas <jani.hautakangas@ixonos.com>
 Date: Thu, 16 May 2013 09:52:07 +0300
-Subject: [PATCH 13/15] QOpenGLPaintDevice sub-area support
+Subject: [PATCH 13/16] QOpenGLPaintDevice sub-area support
 
 Allows creating QOpenGLPaintDevice targetting sub-area
 of binded framebuffer.
diff --git a/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch b/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
index 9c366b6..0835a6f 100644
--- a/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
+++ b/recipes-qt/qt5/qtbase/0014-eglfs-fix-egl-error-for-platforms-only-supporting-on.patch
@@ -1,7 +1,7 @@
 From c8995c6eb6cf4bfa8daf1e3e96bd4885a096f405 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Wed, 5 Feb 2014 18:35:08 +0100
-Subject: [PATCH 14/15] eglfs: fix egl error for platforms only supporting one
+Subject: [PATCH 14/16] eglfs: fix egl error for platforms only supporting one
  window/surface
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
diff --git a/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
index c9836c8..a4b1379 100644
--- a/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
+++ b/recipes-qt/qt5/qtbase/0015-Fix-linuxfb-argument-mmsize-parsing.patch
@@ -1,7 +1,7 @@
 From 99979159a404df09495c8ddd6a052837f66b8739 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Peter=20K=C3=BCmmel?= <syntheticpp@gmx.net>
 Date: Fri, 7 Feb 2014 13:12:37 +0100
-Subject: [PATCH 15/15] Fix linuxfb argument 'mmsize' parsing
+Subject: [PATCH 15/16] Fix linuxfb argument 'mmsize' parsing
 
 Parse first for 'mmsize' because the regex for 'size' also fits to 'mmsize'.
 
diff --git a/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch b/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
new file mode 100644
index 0000000..f0dfc9c
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0016-eglfs-Fix-quad-coordinates.patch
@@ -0,0 +1,39 @@
+From 84756d94c73885803ad8044099ab47c0c49b5076 Mon Sep 17 00:00:00 2001
+From: Laszlo Agocs <laszlo.agocs@digia.com>
+Date: Thu, 23 Jan 2014 11:45:22 +0100
+Subject: [PATCH 16/16] eglfs: Fix quad coordinates
+
+Prevent artifacts on raster windows by properly mapping
+the coordinates to [-1,1].
+
+Upstream-Status: Backport
+
+Task-number: QTBUG-36370
+Change-Id: I95d0d03952f597ef4ce6a950c6533a3af2df964a
+Reviewed-by: Andy Nichols <andy.nichols@digia.com>
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+---
+ src/plugins/platforms/eglfs/qeglfscompositor.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/plugins/platforms/eglfs/qeglfscompositor.cpp b/src/plugins/platforms/eglfs/qeglfscompositor.cpp
+index 845bb5b..1efc4f7 100644
+--- a/src/plugins/platforms/eglfs/qeglfscompositor.cpp
++++ b/src/plugins/platforms/eglfs/qeglfscompositor.cpp
+@@ -153,10 +153,11 @@ void QEglFSCompositor::render(QEglFSWindow *window, uint texture, bool raster)
+     QPoint tl = r.topLeft();
+     QPoint br = r.bottomRight();
+ 
++    // Map to [-1,1]
+     GLfloat x1 = (tl.x() / sr.width()) * 2 - 1;
+-    GLfloat x2 = (br.x() / sr.width()) * 2 - 1;
+     GLfloat y1 = ((sr.height() - tl.y()) / sr.height()) * 2 - 1;
+-    GLfloat y2 = ((sr.height() - br.y()) / sr.height()) * 2 - 1;
++    GLfloat x2 = ((br.x() + 1) / sr.width()) * 2 - 1;
++    GLfloat y2 = ((sr.height() - (br.y() + 1)) / sr.height()) * 2 - 1;
+ 
+     if (!raster)
+         qSwap(y1, y2);
+-- 
+1.7.1
+
-- 
1.9.0


