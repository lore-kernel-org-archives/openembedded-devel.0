Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1Q9cxq-0000uF-1h
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Apr 2011 14:45:02 +0200
Received: (qmail invoked by alias); 12 Apr 2011 12:42:45 -0000
Received: from unknown (EHLO pink.cheepee.homedns.org) [95.76.68.223]
	by mail.gmx.net (mp037) with SMTP; 12 Apr 2011 14:42:45 +0200
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX1/NudonKEfNOcNx47U1wcm+24NyZglfCWDd8E7cGw
	GJExD2lxElnwhg
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Apr 2011 15:42:37 +0300
Message-Id: <1302612157-7633-1-git-send-email-cheepeero@gmx.net>
X-Mailer: git-send-email 1.7.3.4
X-Y-GMX-Trusted: 0
Subject: [PATCH] Fixed build of qt4-tools-native on Gentoo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Apr 2011 12:45:02 -0000

More on the problem can be found at

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg15734.html

Signed-off-by: Ciprian Ciubotariu <cheepeero@gmx.net>
---
 recipes/qt4/files/hack-out-egl_config.patch |   28 +++++++++++++++++++++++++++
 recipes/qt4/qt4-tools-native.inc            |    1 +
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/qt4/files/hack-out-egl_config.patch

diff --git a/recipes/qt4/files/hack-out-egl_config.patch b/recipes/qt4/files/hack-out-egl_config.patch
new file mode 100644
index 0000000..4c7be2e
--- /dev/null
+++ b/recipes/qt4/files/hack-out-egl_config.patch
@@ -0,0 +1,28 @@
+diff -Naur qt-everywhere-opensource-src-4.6.3-orig/configure qt-everywhere-opensource-src-4.6.3/configure
+--- qt-everywhere-opensource-src-4.6.3-orig/configure	2011-04-11 19:53:09.858229325 +0300
++++ qt-everywhere-opensource-src-4.6.3/configure	2011-04-11 19:53:41.865539747 +0300
+@@ -4949,15 +4949,15 @@
+ if [ "$PLATFORM_X11" = "yes" -o "$PLATFORM_QWS" = "yes" ]; then
+ 
+     # detect EGL support
+-    if "$unixtests/compile.test" "$XQMAKESPEC" "$QMAKE_CONFIG" $OPT_VERBOSE "$relpath" "$outpath" "config.tests/unix/egl" "EGL (EGL/egl.h)" $L_FLAGS $I_FLAGS $l_FLAGS; then
+-        # EGL specified by QMAKE_*_EGL, included with <EGL/egl.h>
+-        CFG_EGL=yes
+-        CFG_EGL_GLES_INCLUDES=no
+-    elif "$unixtests/compile.test" "$XQMAKESPEC" "$QMAKE_CONFIG" $OPT_VERBOSE "$relpath" "$outpath" "config.tests/unix/egl4gles1" "EGL (GLES/egl.h)" $L_FLAGS $I_FLAGS $l_FLAGS; then
+-        # EGL specified by QMAKE_*_EGL, included with <GLES/egl.h>
+-        CFG_EGL=yes
+-        CFG_EGL_GLES_INCLUDES=yes
+-    fi
++#    if "$unixtests/compile.test" "$XQMAKESPEC" "$QMAKE_CONFIG" $OPT_VERBOSE "$relpath" "$outpath" "config.tests/unix/egl" "EGL (EGL/egl.h)" $L_FLAGS $I_FLAGS $l_FLAGS; then
++#        # EGL specified by QMAKE_*_EGL, included with <EGL/egl.h>
++#        CFG_EGL=yes
++#        CFG_EGL_GLES_INCLUDES=no
++#    elif "$unixtests/compile.test" "$XQMAKESPEC" "$QMAKE_CONFIG" $OPT_VERBOSE "$relpath" "$outpath" "config.tests/unix/egl4gles1" "EGL (GLES/egl.h)" $L_FLAGS $I_FLAGS $l_FLAGS; then
++#        # EGL specified by QMAKE_*_EGL, included with <GLES/egl.h>
++#        CFG_EGL=yes
++#        CFG_EGL_GLES_INCLUDES=yes
++#    fi
+     if ( [ "$CFG_OPENGL" = "es1" ] || [ "$CFG_OPENGL" = "es1cl" ] || [ "$CFG_OPENGL" = "es2" ] ) && [ "$CFG_EGL" != "yes" ]; then
+         echo "The EGL functionality test failed!"
+         echo " EGL is required for OpenGL ES to manage contexts & surfaces."
diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-native.inc
index 4a0ccce..2934751 100644
--- a/recipes/qt4/qt4-tools-native.inc
+++ b/recipes/qt4/qt4-tools-native.inc
@@ -10,6 +10,7 @@ INC_PR = "r10"
 inherit native
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+           file://hack-out-egl_config.patch \
            file://qt-config.patch \
            file://g++.conf \
            file://linux.conf"
-- 
1.7.3.4



