Return-Path: <contact@jgueytat.fr>
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
	[217.70.183.198])
	by mail.openembedded.org (Postfix) with ESMTP id 0790660107
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Apr 2016 17:45:47 +0000 (UTC)
Received: from mfilter13-d.gandi.net (mfilter13-d.gandi.net [217.70.178.141])
	by relay6-d.mail.gandi.net (Postfix) with ESMTP id 4432FFB8C1;
	Wed, 27 Apr 2016 19:45:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter13-d.gandi.net
Received: from relay6-d.mail.gandi.net ([IPv6:::ffff:217.70.183.198])
	by mfilter13-d.gandi.net (mfilter13-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id A9lJpAMOHgov; Wed, 27 Apr 2016 19:45:45 +0200 (CEST)
X-Originating-IP: 92.245.156.62
Received: from Happy.febio.local (unknown [92.245.156.62])
	(Authenticated sender: contact@jgueytat.fr)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 3AAFCFB8BF;
	Wed, 27 Apr 2016 19:45:44 +0200 (CEST)
From: Julien Gueytat <contact@jgueytat.fr>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Apr 2016 19:45:44 +0200
Message-Id: <1461779144-2274-1-git-send-email-contact@jgueytat.fr>
X-Mailer: git-send-email 1.9.1
Cc: j.madieu@expemb.com
Subject: [meta-qt5][PATCH] Reorder EGL libraries from pkgconfig and defaults:
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
X-List-Received-Date: Wed, 27 Apr 2016 17:45:48 -0000

https://bugreports.qt.io/browse/QTBUG-50838
https://bugreports.qt.io/browse/QTBUG-52739

The modification is the less intrusive possible. It only swaps LIBS and QMAKE_LIBS_EGL.
The reason behind that was that for the RaspberryPi:
 *  -lEGL -GLESv2 can link
 *  -lGLESv2 -lEGL can't

Adding -lEGL -lGLESv2 and then -lEGL gives -lGLESv2 -lEGL ... the libraries swaped.

Signed-off-by: Julien Gueytat <contact@jgueytat.fr>
---
 ...EGL-libraries-from-pkgconfig-and-defaults.patch | 98 ++++++++++++++++++++++
 recipes-qt/qt5/qtbase_git.bb                       |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 recipes-qt/qt5/qtbase/0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch

diff --git a/recipes-qt/qt5/qtbase/0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch b/recipes-qt/qt5/qtbase/0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
new file mode 100644
index 0000000..3c0b9e6
--- /dev/null
+++ b/recipes-qt/qt5/qtbase/0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch
@@ -0,0 +1,98 @@
+From d623d2c2ed49c4dc57fb0dde1faab20976dfc3dc Mon Sep 17 00:00:00 2001
+From: Julien Gueytat <contact@jgueytat.fr>
+Date: Wed, 27 Apr 2016 19:24:39 +0200
+Subject: [PATCH] Reorder EGL libraries from pkgconfig and defaults:
+
+https://bugreports.qt.io/browse/QTBUG-50838
+https://bugreports.qt.io/browse/QTBUG-52739
+
+The modification is the less intrusive possible. It only swaps LIBS and QMAKE_LIBS_EGL.
+The reason behind that was that for the RaspberryPi:
+ *  -lEGL -GLESv2 can link
+ *  -lGLESv2 -lEGL can't
+
+Adding -lEGL -lGLESv2 and then -lEGL gives -lGLESv2 -lEGL ... the libraries swaped.
+
+Signed-off-by: Julien Gueytat <contact@jgueytat.fr>
+---
+ config.tests/qpa/egl/egl.pro               |  5 ++++-
+ config.tests/qpa/eglfs-brcm/eglfs-brcm.pro | 12 +++++++-----
+ configure                                  | 16 ++++++++++++++--
+ 3 files changed, 25 insertions(+), 8 deletions(-)
+
+diff --git a/config.tests/qpa/egl/egl.pro b/config.tests/qpa/egl/egl.pro
+index b5396da..828b674 100644
+--- a/config.tests/qpa/egl/egl.pro
++++ b/config.tests/qpa/egl/egl.pro
+@@ -5,6 +5,9 @@ for(p, QMAKE_LIBDIR_EGL) {
+ }
+ 
+ !isEmpty(QMAKE_INCDIR_EGL): INCLUDEPATH += $$QMAKE_INCDIR_EGL
+-!isEmpty(QMAKE_LIBS_EGL): LIBS += $$QMAKE_LIBS_EGL
++
++BACKUP_LIBS = $$LIBS
++!isEmpty(QMAKE_LIBS_EGL): LIBS = $$QMAKE_LIBS_EGL
++LIBS += $$BACKUP_LIBS
+ 
+ CONFIG -= qt
+diff --git a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
+index d8b1c3e..06f7241 100644
+--- a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
++++ b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
+@@ -1,11 +1,13 @@
+ SOURCES = eglfs-brcm.cpp
+ 
+-CONFIG -= qt
+-
+-INCLUDEPATH += $$QMAKE_INCDIR_EGL
+-
+ for(p, QMAKE_LIBDIR_EGL) {
+     LIBS += -L$$p
+ }
+ 
+-LIBS += -lEGL -lGLESv2 -lbcm_host
++INCLUDEPATH += $$QMAKE_INCDIR_EGL
++
++BACKUP_LIBS = $$LIBS
++LIBS = -lEGL -lGLESv2 -lbcm_host
++LIBS += $$BACKUP_LIBS
++
++CONFIG -= qt
+diff --git a/configure b/configure
+index 2e99d39..072838b 100755
+--- a/configure
++++ b/configure
+@@ -5803,7 +5803,9 @@ if [ "$CFG_EGL" != "no" ]; then
+         QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
+         QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
+         QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | sed -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
+-    fi       # detect EGL support
++    fi
++    
++    # detect EGL support
+     if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
+         CFG_EGL=yes
+         if compileTest qpa/egl-x11 "EGL-X11" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
+@@ -5826,8 +5828,18 @@ fi
+ if [ "$CFG_EGLFS" != "no" ]; then
+     if [ "$XPLATFORM_QNX" = "no" ] && [ "$CFG_OPENGL" != "no" ]; then
+         CFG_EGLFS="$CFG_EGL"
++
++        if [ -n "$PKG_CONFIG" ] && $PKG_CONFIG --exists egl 2>/dev/null; then
++            QMAKE_INCDIR_EGL=`$PKG_CONFIG --cflags-only-I egl 2>/dev/null | sed -e 's,^-I,,g' -e 's, -I, ,g'`
++            QMAKE_LIBS_EGL=`$PKG_CONFIG --libs egl 2>/dev/null`
++            QMAKE_CFLAGS_EGL=`$PKG_CONFIG --cflags egl 2>/dev/null`
++            QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
++            QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
++            QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | sed -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
++        fi
++
+         # Detect eglfs backends.
+-        if compileTest qpa/eglfs-brcm "eglfs-brcm"; then
++        if compileTest qpa/eglfs-brcm "eglfs-brcm" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
+             CFG_EGLFS_BRCM=yes
+         else
+             CFG_EGLFS_BRCM=no
+-- 
+1.9.1
+
diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 09f8ebd..ac8c1b8 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -20,6 +20,7 @@ SRC_URI += "\
     file://0006-QOpenGLPaintDevice-sub-area-support.patch \
     file://0007-linux-oe-g-Invert-conditional-for-defining-QT_SOCKLE.patch \
     file://0008-configure-paths-for-target-qmake-properly.patch \
+    file://0011-Reorder-EGL-libraries-from-pkgconfig-and-defaults.patch \
 "
 
 DEPENDS += "qtbase-native"
-- 
1.9.1


