Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Pcv3m-0005HN-G7
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 08:23:58 +0100
Received: by fxm17 with SMTP id 17so260332fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 23:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=3edl/dKZRr5sEWEgu6Gk8KMJY0MKr3PTla4AABiWhwM=;
	b=bG8wNFQOQBZeTyMPbifVhWPUjKYOQObDBfxCeCzpOD7tj/Ys8aPsiQ8mm9HlBPlxkN
	6hUqf4G+pJGaKPFqNqOmRYyTgjT7+GM3FMvUWWtSiO0EuJt0IqsXwY6GSCQGvhlTbO0Z
	5JZQ8PG7lAYrkP7mmGb4SktBH2WOVDR8aO+Dc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=nltQwO9WP77wg2qDrh2TZAHOXqjgmuEA0xZeSzJpaeHyf51jfMsw06Wu0BuHwdOood
	nlPCjk3rwfqcy2ctWO8BHO9n4If8RaZVJ1/lhIlSHg12590G1R0lV/hcoWyXHNFMrFO8
	CPomEfKdHW2e7xlvIQE/dK46RT4LV6At2nq5U=
Received: by 10.223.98.193 with SMTP id r1mr608586fan.83.1294817006269;
	Tue, 11 Jan 2011 23:23:26 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n3sm70888fax.7.2011.01.11.23.23.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 23:23:25 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 08:23:34 +0100
Message-Id: <1294817015-16540-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.rc1
Subject: [PATCH 1/2] xorg: new versions 2011-01-12
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
X-List-Received-Date: Wed, 12 Jan 2011 07:23:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-driver/xf86-video-geode_2.11.10.bb    |    9 ------
 recipes/xorg-driver/xf86-video-geode_2.11.11.bb    |    9 ++++++
 recipes/xorg-driver/xf86-video-intel_2.13.0.bb     |   11 -------
 recipes/xorg-driver/xf86-video-intel_2.14.0.bb     |   11 +++++++
 .../xorg-lib/libx11-1.4.0/keysymdef_include.patch  |   19 -------------
 .../libx11-1.4.0/x11_disable_makekeys.patch        |   29 --------------------
 .../xorg-lib/libx11-1.4.1/keysymdef_include.patch  |   19 +++++++++++++
 .../libx11-1.4.1/x11_disable_makekeys.patch        |   29 ++++++++++++++++++++
 recipes/xorg-lib/libx11_1.4.0.bb                   |    8 -----
 recipes/xorg-lib/libx11_1.4.1.bb                   |    8 +++++
 recipes/xorg-lib/libxaw_1.0.8.bb                   |   25 -----------------
 recipes/xorg-lib/libxaw_1.0.9.bb                   |   25 +++++++++++++++++
 12 files changed, 101 insertions(+), 101 deletions(-)
 delete mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.10.bb
 create mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.11.bb
 delete mode 100644 recipes/xorg-driver/xf86-video-intel_2.13.0.bb
 create mode 100644 recipes/xorg-driver/xf86-video-intel_2.14.0.bb
 delete mode 100644 recipes/xorg-lib/libx11-1.4.0/keysymdef_include.patch
 delete mode 100644 recipes/xorg-lib/libx11-1.4.0/x11_disable_makekeys.patch
 create mode 100644 recipes/xorg-lib/libx11-1.4.1/keysymdef_include.patch
 create mode 100644 recipes/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
 delete mode 100644 recipes/xorg-lib/libx11_1.4.0.bb
 create mode 100644 recipes/xorg-lib/libx11_1.4.1.bb
 delete mode 100644 recipes/xorg-lib/libxaw_1.0.8.bb
 create mode 100644 recipes/xorg-lib/libxaw_1.0.9.bb

diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.10.bb b/recipes/xorg-driver/xf86-video-geode_2.11.10.bb
deleted file mode 100644
index ea3c171..0000000
--- a/recipes/xorg-driver/xf86-video-geode_2.11.10.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "8161cd380673c44177245d1d84366219"
-SRC_URI[archive.sha256sum] = "8e45c4849a2405cecff7a24c990c2b0a88621aeb103d1937c5ac05d78a1fabfd"
-
-COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.11.bb b/recipes/xorg-driver/xf86-video-geode_2.11.11.bb
new file mode 100644
index 0000000..9574523
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-geode_2.11.11.bb
@@ -0,0 +1,9 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.org server -- Geode GX2/LX display driver"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ea36cc51588a1ba73442237db2bf560b"
+SRC_URI[archive.sha256sum] = "861727b1f183060a2d0d89997e0fb3e1564c5d4c2e7b453ab2999f3d6c15400c"
+
+COMPATIBLE_HOST = "i.86.*-linux"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.13.0.bb b/recipes/xorg-driver/xf86-video-intel_2.13.0.bb
deleted file mode 100644
index 63a18bc..0000000
--- a/recipes/xorg-driver/xf86-video-intel_2.13.0.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require xorg-driver-video.inc
-DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
-DEPENDS += " virtual/libx11 libxvmc drm xf86driproto "
-RDEPENDS_${PN} += "xserver-xorg-extension-dri \
-             xserver-xorg-extension-dri2 \
-             xserver-xorg-extension-glx"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "de2f8a5836d90c71f3175dcd46d03ec0"
-SRC_URI[archive.sha256sum] = "d8b2fae8d0c4ae372994cb7df8de8aa995b8e89b1bc5766c53ea0751752fc887"
diff --git a/recipes/xorg-driver/xf86-video-intel_2.14.0.bb b/recipes/xorg-driver/xf86-video-intel_2.14.0.bb
new file mode 100644
index 0000000..ae9b95f
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-intel_2.14.0.bb
@@ -0,0 +1,11 @@
+require xorg-driver-video.inc
+DESCRIPTION = "X.Org X server -- Intel i8xx, i9xx display driver"
+DEPENDS += " virtual/libx11 libxvmc drm xf86driproto "
+RDEPENDS_${PN} += "xserver-xorg-extension-dri \
+             xserver-xorg-extension-dri2 \
+             xserver-xorg-extension-glx"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "05f187582aeabda57fcd6f2782cfbf8e"
+SRC_URI[archive.sha256sum] = "e18c37a579a960516e69de5c6f74750ca02208c0e41cf763ae5630c84db507df"
diff --git a/recipes/xorg-lib/libx11-1.4.0/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.4.0/keysymdef_include.patch
deleted file mode 100644
index 1a30e34..0000000
--- a/recipes/xorg-lib/libx11-1.4.0/keysymdef_include.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
---- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
-+++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
-@@ -355,7 +355,14 @@
- # Find keysymdef.h
- #
- AC_MSG_CHECKING([keysym definitions])
--KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+AC_ARG_WITH(keysymdefdir,
-+        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
-+        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
-+
-+if test x$KEYSYMDEFDIR = x; then
-+	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
-+fi
-+
- FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
- for i in $FILES; do
-     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/recipes/xorg-lib/libx11-1.4.0/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.4.0/x11_disable_makekeys.patch
deleted file mode 100644
index 9763313..0000000
--- a/recipes/xorg-lib/libx11-1.4.0/x11_disable_makekeys.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Index: libX11-1.3.4/src/util/Makefile.am
-===================================================================
---- libX11-1.3.4.orig/src/util/Makefile.am
-+++ libX11-1.3.4/src/util/Makefile.am
-@@ -1,24 +1 @@
--
--noinst_PROGRAMS=makekeys
--
--makekeys_CFLAGS = \
--	$(X11_CFLAGS) \
--	$(CWARNFLAGS)
--
--CC = @CC_FOR_BUILD@
--CPPFLAGS = @CPPFLAGS_FOR_BUILD@
--CFLAGS = @CFLAGS_FOR_BUILD@
--LDFLAGS = @LDFLAGS_FOR_BUILD@
--
- EXTRA_DIST = mkks.sh
--
--if LINT
--# Check source code with tools like lint & sparse
--
--ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
--		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
--
--lint:
--	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
--
--endif LINT
diff --git a/recipes/xorg-lib/libx11-1.4.1/keysymdef_include.patch b/recipes/xorg-lib/libx11-1.4.1/keysymdef_include.patch
new file mode 100644
index 0000000..1a30e34
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.4.1/keysymdef_include.patch
@@ -0,0 +1,19 @@
+diff -uNr libX11-1.3.6.orig//configure.ac libX11-1.3.6/configure.ac
+--- libX11-1.3.6.orig//configure.ac	2010-09-20 08:04:16.000000000 +0200
++++ libX11-1.3.6/configure.ac	2010-09-28 16:29:26.000000000 +0200
+@@ -355,7 +355,14 @@
+ # Find keysymdef.h
+ #
+ AC_MSG_CHECKING([keysym definitions])
+-KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++AC_ARG_WITH(keysymdefdir,
++        AC_HELP_STRING([--with-keysymdefdir=DIR], [The location of keysymdef.h]),
++        KEYSYMDEFDIR=$withval, KEYSYMDEFDIR="")
++
++if test x$KEYSYMDEFDIR = x; then
++	KEYSYMDEFDIR=`$PKG_CONFIG --variable=includedir xproto`/X11
++fi
++
+ FILES="keysymdef.h XF86keysym.h Sunkeysym.h DECkeysym.h HPkeysym.h"
+ for i in $FILES; do
+     if test -f "$KEYSYMDEFDIR/$i"; then
diff --git a/recipes/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch b/recipes/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
new file mode 100644
index 0000000..9763313
--- /dev/null
+++ b/recipes/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
@@ -0,0 +1,29 @@
+Index: libX11-1.3.4/src/util/Makefile.am
+===================================================================
+--- libX11-1.3.4.orig/src/util/Makefile.am
++++ libX11-1.3.4/src/util/Makefile.am
+@@ -1,24 +1 @@
+-
+-noinst_PROGRAMS=makekeys
+-
+-makekeys_CFLAGS = \
+-	$(X11_CFLAGS) \
+-	$(CWARNFLAGS)
+-
+-CC = @CC_FOR_BUILD@
+-CPPFLAGS = @CPPFLAGS_FOR_BUILD@
+-CFLAGS = @CFLAGS_FOR_BUILD@
+-LDFLAGS = @LDFLAGS_FOR_BUILD@
+-
+ EXTRA_DIST = mkks.sh
+-
+-if LINT
+-# Check source code with tools like lint & sparse
+-
+-ALL_LINT_FLAGS=$(LINT_FLAGS) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) \
+-		$(AM_CPPFLAGS) $(CPPFLAGS) $(AM_CFLAGS)
+-
+-lint:
+-	$(LINT) $(ALL_LINT_FLAGS) makekeys.c
+-
+-endif LINT
diff --git a/recipes/xorg-lib/libx11_1.4.0.bb b/recipes/xorg-lib/libx11_1.4.0.bb
deleted file mode 100644
index 2b6b1bb..0000000
--- a/recipes/xorg-lib/libx11_1.4.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libx11.inc
-#--without-xcb is not an option anymore
-#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
-DEPENDS_virtclass-native = "libxcb-native ${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "b63d9f7493a61df51d0c0be04ac435e4"
-SRC_URI[archive.sha256sum] = "b2f8fcf30b72226ed5e83975ed1b0665c5fcb3d77d626cc0e66d58f951d1cffb"
diff --git a/recipes/xorg-lib/libx11_1.4.1.bb b/recipes/xorg-lib/libx11_1.4.1.bb
new file mode 100644
index 0000000..d07ee46
--- /dev/null
+++ b/recipes/xorg-lib/libx11_1.4.1.bb
@@ -0,0 +1,8 @@
+require libx11.inc
+#--without-xcb is not an option anymore
+#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
+DEPENDS_virtclass-native = "libxcb-native ${COMMON_DEPENDS}"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "4603bdbce1bd73cbc140de402fe6ed24"
+SRC_URI[archive.sha256sum] = "70f4e0f798645a0f269f362bfdbd4c7934dae3a2dd9ecbad28d6ede414f63ce2"
diff --git a/recipes/xorg-lib/libxaw_1.0.8.bb b/recipes/xorg-lib/libxaw_1.0.8.bb
deleted file mode 100644
index 8639fb6..0000000
--- a/recipes/xorg-lib/libxaw_1.0.8.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require xorg-lib-common.inc
-DESCRIPTION = "X Athena Widget Set"
-DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
-PE = "1"
-PR = "${INC_PR}.0"
-
-SRC_URI[archive.md5sum] = "030fced589e9128c3cf57564d4a2e1ab"
-SRC_URI[archive.sha256sum] = "3daeab01ee702cbc4ac91f11d553710ad31d4151510386093c186a94ccd4beba"
-
-# disable docs as groff detection doesn't work on some hosts while cross compilling
-EXTRA_OECONF += " --disable-docs "
-
-do_install_append () {
-        ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
-        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
-}
-
-PACKAGES =+ "libxaw6 libxaw7 libxaw8"
-
-FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
-FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
-FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
-
-XORG_PN = "libXaw"
diff --git a/recipes/xorg-lib/libxaw_1.0.9.bb b/recipes/xorg-lib/libxaw_1.0.9.bb
new file mode 100644
index 0000000..a4d2cf4
--- /dev/null
+++ b/recipes/xorg-lib/libxaw_1.0.9.bb
@@ -0,0 +1,25 @@
+require xorg-lib-common.inc
+DESCRIPTION = "X Athena Widget Set"
+DEPENDS += "xproto virtual/libx11 libxext xextproto libxt libxmu libxpm libxp printproto libxau"
+PE = "1"
+PR = "${INC_PR}.0"
+
+SRC_URI[archive.md5sum] = "ccc57478c41b7a75b9702241b889b1d4"
+SRC_URI[archive.sha256sum] = "a83977546b78e24ac5dca86affc10b6404a87c16272405b05386feca1a2db037"
+
+# disable docs as groff detection doesn't work on some hosts while cross compilling
+EXTRA_OECONF += " --disable-docs "
+
+do_install_append () {
+        ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
+        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so.7
+        ln -sf libXaw7.so.7 ${D}${libdir}/libXaw.so
+}
+
+PACKAGES =+ "libxaw6 libxaw7 libxaw8"
+
+FILES_libxaw6 = "${libdir}/libXaw*.so.6*"
+FILES_libxaw7 = "${libdir}/libXaw*.so.7*"
+FILES_libxaw8 = "${libdir}/libXaw8.so.8*"
+
+XORG_PN = "libXaw"
-- 
1.7.4.rc1



