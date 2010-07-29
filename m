Received: from us194mx009.tycoelectronics.net ([198.175.154.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay.snyder@tycoelectronics.com>) id 1OeSI0-0002Nf-9u
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 14:32:57 +0200
Received: from [163.241.71.52] (163.241.71.52) by
	us194mx009.tycoelectronics.net (163.241.185.250) with Microsoft SMTP
	Server id 8.1.393.1; Thu, 29 Jul 2010 08:32:15 -0400
Message-ID: <4C5174CD.70500@tycoelectronics.com>
Date: Thu, 29 Jul 2010 08:32:13 -0400
From: Jay Snyder <jay.snyder@tycoelectronics.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <mailman.157.1280347758.17151.openembedded-devel@lists.openembedded.org>
In-Reply-To: <mailman.157.1280347758.17151.openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 198.175.154.211
X-SA-Exim-Mail-From: jay.snyder@tycoelectronics.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Qt4 recipe fix; fixes configure so compiler is,, detected, properly, and QXMLPatterns gets built
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
X-List-Received-Date: Thu, 29 Jul 2010 12:33:00 -0000
Content-Type: multipart/mixed; boundary="------------060603000300030309010607"

--------------060603000300030309010607
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

I have updated the patch to include incrementing the INC_PR numbers in 
.inc files.    Please see attached (or the URL below).

http://home.comcast.net/~jay.snyder/Qt4-recipe-compiler-fix/Qt4-recipe-compiler-fix.patch


Regards,
Jay


--------------060603000300030309010607
Content-Type: text/x-diff; name="Qt4-recipe-compiler-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="Qt4-recipe-compiler-fix.patch"

diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/files/configure-conf_compiler-fix.patch /home/oe/local/recipes/qt4/files/configure-conf_compiler-fix.patch
--- /home/oe/2010-06-23/openembedded/recipes/qt4/files/configure-conf_compiler-fix.patch	1969-12-31 19:00:00.000000000 -0500
+++ /home/oe/local/recipes/qt4/files/configure-conf_compiler-fix.patch	2010-07-28 09:42:06.000000000 -0400
@@ -0,0 +1,12 @@
+Index qt-everywhere-opensource-src-4.6.0.orig/configure
+===================================================================
+--- qt-everywhere-opensource-src-4.6.0/configure.orig	2009-12-10 15:49:49.000000000 -0500
++++ qt-everywhere-opensource-src-4.6.0/configure	2009-12-10 15:50:20.000000000 -0500
+@@ -2917,6 +2917,7 @@
+ fi
+ 
+ QMAKE_CONF_COMPILER=`getQMakeConf "$XQMAKESPEC" | grep "^QMAKE_CXX[^_A-Z0-9]" | sed "s,.* *= *\(.*\)$,\1," | tail -1`
++eval QMAKE_CONF_COMPILER=$(echo $QMAKE_CONF_COMPILER | sed "s/(/{/" | sed "s/)/}/")
+ TEST_COMPILER="$CC"
+ [ -z "$TEST_COMPILER" ] && TEST_COMPILER=$QMAKE_CONF_COMPILER
+ 
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt-4.6.0.inc /home/oe/local/recipes/qt4/qt-4.6.0.inc
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt-4.6.0.inc	2010-06-23 16:50:01.000000000 -0400
+++ /home/oe/local/recipes/qt4/qt-4.6.0.inc	2010-07-28 09:43:19.000000000 -0400
@@ -3,6 +3,7 @@
 FILESPATHPKG .= ":qt-${PV}"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt-4.6.2.inc /home/oe/local/recipes/qt4/qt-4.6.2.inc
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt-4.6.2.inc	2010-06-23 16:50:01.000000000 -0400
+++ /home/oe/local/recipes/qt4/qt-4.6.2.inc	2010-07-28 09:43:16.000000000 -0400
@@ -3,6 +3,7 @@
 FILESPATHPKG .= ":qt-${PV}"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-everywhere-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0004-no-qmake.patch \
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-embedded.inc /home/oe/local/recipes/qt4/qt4-embedded.inc
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-embedded.inc	2010-06-23 16:50:01.000000000 -0400
+++ /home/oe/local/recipes/qt4/qt4-embedded.inc	2010-07-29 08:23:23.000000000 -0400
@@ -4,7 +4,7 @@
 PRIORITY = "optional"
 HOMEPAGE = "http://www.trolltech.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r20"
+INC_PR = "r21"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
@@ -12,6 +12,7 @@
 QT_LIBINFIX = "E"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0003-no-tools.patch \
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-embedded.inc.~1~ /home/oe/local/recipes/qt4/qt4-embedded.inc.~1~
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-embedded.inc.~1~	1969-12-31 19:00:00.000000000 -0500
+++ /home/oe/local/recipes/qt4/qt4-embedded.inc.~1~	2010-07-28 09:43:31.000000000 -0400
@@ -0,0 +1,52 @@
+SUMMARY = "Qt is a versatile cross-platform application framework -- this is the embedded version."
+SECTION = "libs"
+LICENSE = "GPL QPL"
+PRIORITY = "optional"
+HOMEPAGE = "http://www.trolltech.com"
+DEPENDS += "directfb tslib"
+INC_PR = "r20"
+
+QT_BASE_NAME ?= "qt4-embedded"
+QT_BASE_LIB  ?= "libqt-embedded"
+QT_DIR_NAME = "qtopia"
+QT_LIBINFIX = "E"
+
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-embedded-linux-opensource-src-${PV}.tar.bz2 \
+	   file://configure-conf_compiler-fix.patch \
+           file://0001-cross-compile.patch \
+           file://0002-fix-resinit-declaration.patch \
+           file://0003-no-tools.patch \
+           file://0004-no-qmake.patch \
+           file://0006-freetype-host-includes.patch \
+           file://0007-openssl-host-includes.patch \
+           file://0008-qt-lib-infix.patch \
+           file://0009-support-2bpp.patch \
+           file://fix-config-tests.patch \
+           file://g++.conf \
+           file://linux.conf \
+           "
+
+# Set necessary variables in the profile
+SRC_URI += "file://qte.sh"
+
+S = "${WORKDIR}/qt-embedded-linux-opensource-src-${PV}"
+
+QT_CONFIG_FLAGS += " \
+    -qtlibinfix ${QT_LIBINFIX} \
+    -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
+    -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
+    -qt-kbd-tty \
+    -DQT_KEYPAD_NAVIGATION \
+    "
+
+require qt4.inc
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/profile.d/
+	install -m 0755 ${WORKDIR}/qte.sh ${D}${sysconfdir}/profile.d/
+}
+
+FILES_qt4-embedded += " ${sysconfdir}/profile.d/qte.sh"
+
+inherit qt4e
+
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-x11-free.inc /home/oe/local/recipes/qt4/qt4-x11-free.inc
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-x11-free.inc	2010-06-29 16:11:40.000000000 -0400
+++ /home/oe/local/recipes/qt4/qt4-x11-free.inc	2010-07-29 08:23:19.000000000 -0400
@@ -5,9 +5,10 @@
 LICENSE = "GPL QPL"
 DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r18"
+INC_PR = "r19"
 
 SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
            file://0001-cross-compile.patch \
            file://0002-fix-resinit-declaration.patch \
            file://0003-no-tools.patch \
diff -Naur /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-x11-free.inc.~1~ /home/oe/local/recipes/qt4/qt4-x11-free.inc.~1~
--- /home/oe/2010-06-23/openembedded/recipes/qt4/qt4-x11-free.inc.~1~	1969-12-31 19:00:00.000000000 -0500
+++ /home/oe/local/recipes/qt4/qt4-x11-free.inc.~1~	2010-07-28 09:44:02.000000000 -0400
@@ -0,0 +1,35 @@
+DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
+SECTION = "x11/libs"
+PRIORITY = "optional"
+HOMEPAGE = "http://www.trolltech.com"
+LICENSE = "GPL QPL"
+DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+
+INC_PR = "r18"
+
+SRC_URI = "ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-${PV}.tar.gz \
+	   file://configure-conf_compiler-fix.patch \
+           file://0001-cross-compile.patch \
+           file://0002-fix-resinit-declaration.patch \
+           file://0003-no-tools.patch \
+           file://0004-no-qmake.patch \
+           file://0006-freetype-host-includes.patch \
+           file://0007-openssl-host-includes.patch \ 
+           file://0008-qt-lib-infix.patch \
+           file://fix-config-tests.patch \
+           file://g++.conf \
+           file://linux.conf \
+           "
+S = "${WORKDIR}/qt-x11-opensource-src-${PV}"
+
+QT_GLFLAGS ?= "-no-opengl"
+QT_CONFIG_FLAGS += "-no-xinerama -no-xkb ${QT_GLFLAGS}"
+QT_BASE_NAME ?= "qt4"
+QT_BASE_LIB  ?= "libqt"
+QT_DIR_NAME = "qt4"
+QT_LIBINFIX = ""
+
+require qt4.inc
+
+inherit qt4x11
+

--------------060603000300030309010607--
