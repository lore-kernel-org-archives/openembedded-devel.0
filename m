Return-Path: <contact@jgueytat.fr>
Received: from slow1-d.mail.gandi.net (slow1-d.mail.gandi.net [217.70.178.86])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6526E681
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 16:06:05 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
	[217.70.183.197])
	by slow1-d.mail.gandi.net (Postfix) with ESMTP id 082B847BCC0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2016 18:05:28 +0200 (CEST)
Received: from mfilter49-d.gandi.net (mfilter49-d.gandi.net [217.70.178.180])
	by relay5-d.mail.gandi.net (Postfix) with ESMTP id 27FE041C0C7;
	Mon, 25 Apr 2016 18:05:24 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfilter49-d.gandi.net
Received: from relay5-d.mail.gandi.net ([IPv6:::ffff:217.70.183.197])
	by mfilter49-d.gandi.net (mfilter49-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id Y6Xespb8z6TF; Mon, 25 Apr 2016 18:05:21 +0200 (CEST)
X-Originating-IP: 92.245.156.62
Received: from Happy.febio.local (unknown [92.245.156.62])
	(Authenticated sender: contact@jgueytat.fr)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 8338341C0A5;
	Mon, 25 Apr 2016 18:05:21 +0200 (CEST)
From: Julien Gueytat <contact@jgueytat.fr>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2016 18:05:20 +0200
Message-Id: <1461600320-20104-1-git-send-email-contact@jgueytat.fr>
X-Mailer: git-send-email 1.9.1
Cc: j.madieu@expemb.com
Subject: [meta-qt5][PATCH] Use completely PKG_CONFIG which set the variables: - $libdir_raw - $incdir_raw - $libs - $cflags There is no need to have anything in the .pro files then.
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
X-List-Received-Date: Mon, 25 Apr 2016 16:06:07 -0000

Please note that the variables used directly through mkspecs set the end variables
while pkgconfig set $libdir_raw - $incdir_raw - $libs - $cflags.

The previous code was trying to set the variable like QMAKE_LIBS_EGL
through pkgconfig but it was not working.

Use compileTestWithPkgconfig for the EGL test and the EGLFS RaspberryPi test.

The package config file from EGL already triggers bcm_host as a dependency.

The master branch of meta-raspberrypi does the proper job.

The way *.pro files and pkg_config needs changes.
---
 config.tests/qpa/egl/egl.pro               |  8 --------
 config.tests/qpa/eglfs-brcm/eglfs-brcm.pro |  9 ---------
 config.tests/unix/opengles2/opengles2.pro  |  7 -------
 configure                                  | 12 ++----------
 4 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/config.tests/qpa/egl/egl.pro b/config.tests/qpa/egl/egl.pro
index f04d053..c1889c5 100644
--- a/config.tests/qpa/egl/egl.pro
+++ b/config.tests/qpa/egl/egl.pro
@@ -1,10 +1,2 @@
 SOURCES = egl.cpp
-
-for(p, QMAKE_LIBDIR_EGL) {
-    exists($$p):LIBS += -L$$p
-}
-
-!isEmpty(QMAKE_INCDIR_EGL): INCLUDEPATH += $$QMAKE_INCDIR_EGL
-!isEmpty(QMAKE_LIBS_EGL): LIBS += $$QMAKE_LIBS_EGL
-
 CONFIG -= qt
diff --git a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
index ce16a3a..164cdb4 100644
--- a/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
+++ b/config.tests/qpa/eglfs-brcm/eglfs-brcm.pro
@@ -1,11 +1,2 @@
 SOURCES = eglfs-brcm.cpp
-
 CONFIG -= qt
-
-INCLUDEPATH += $$QMAKE_INCDIR_EGL
-
-for(p, QMAKE_LIBDIR_EGL) {
-    exists($$p):LIBS += -L$$p
-}
-
-LIBS += -lEGL -lGLESv2 -lbcm_host
diff --git a/config.tests/unix/opengles2/opengles2.pro b/config.tests/unix/opengles2/opengles2.pro
index c4d7689..899ad99 100644
--- a/config.tests/unix/opengles2/opengles2.pro
+++ b/config.tests/unix/opengles2/opengles2.pro
@@ -1,12 +1,5 @@
 SOURCES = opengles2.cpp
-INCLUDEPATH += $$QMAKE_INCDIR_OPENGL_ES2
-
-for(p, QMAKE_LIBDIR_OPENGL_ES2) {
-    exists($$p):LIBS += -L$$p
-}
-
 CONFIG -= qt
-LIBS += $$QMAKE_LIBS_OPENGL_ES2
 mac {
     DEFINES += BUILD_ON_MAC
 }
diff --git a/configure b/configure
index c696e7e..6d0567b 100755
--- a/configure
+++ b/configure
@@ -5796,15 +5796,7 @@ if [ "$CFG_EGL" != "no" ]; then
         exit 101
     fi
 
-    if [ -n "$PKG_CONFIG" ] && $PKG_CONFIG --exists egl 2>/dev/null; then
-        QMAKE_INCDIR_EGL=`$PKG_CONFIG --cflags-only-I egl 2>/dev/null | sed -e 's,^-I,,g' -e 's, -I, ,g'`
-        QMAKE_LIBS_EGL=`$PKG_CONFIG --libs egl 2>/dev/null`
-        QMAKE_CFLAGS_EGL=`$PKG_CONFIG --cflags egl 2>/dev/null`
-        QMakeVar set QMAKE_INCDIR_EGL "$QMAKE_INCDIR_EGL"
-        QMakeVar set QMAKE_LIBS_EGL "$QMAKE_LIBS_EGL"
-        QMakeVar set QMAKE_CFLAGS_EGL "`echo " $QMAKE_CFLAGS_EGL " | sed -e 's, -I[^ ]* , ,g;s,^ ,,;s, $,,'`"
-    fi       # detect EGL support
-    if compileTest qpa/egl "EGL" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
+    if compileTestWithPkgConfig egl qpa/egl "EGL" EGL; then
         CFG_EGL=yes
         if compileTest qpa/egl-x11 "EGL-X11" $QMAKE_CFLAGS_EGL $QMAKE_LIBS_EGL; then
             CFG_EGL_X=yes
@@ -5827,7 +5819,7 @@ if [ "$CFG_EGLFS" != "no" ]; then
     if [ "$XPLATFORM_QNX" = "no" ] && [ "$CFG_OPENGL" != "no" ]; then
         CFG_EGLFS="$CFG_EGL"
         # Detect eglfs backends.
-        if compileTest qpa/eglfs-brcm "eglfs-brcm"; then
+        if compileTestWithPkgConfig egl qpa/eglfs-brcm "eglfs-brcm" EGLFS_BRCM; then
             CFG_EGLFS_BRCM=yes
         else
             CFG_EGLFS_BRCM=no
-- 
1.9.1


