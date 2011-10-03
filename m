Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAieF-0004GA-MC
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Oct 2011 15:33:35 +0200
Received: by bke11 with SMTP id 11so5354801bke.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=vDXNb2bw6SWrOfi2Dya8bXnGLR89oMNr9kF/4nN88o0=;
	b=mN/Ueo7AiY8yagakudVcs/K+6+H9JL+ToZy59KZkWLFew1qXfUCVYWPAe7XDXnEfQ3
	rFNhJs4nq5EdWASXZKzDqbnhQTYJdSHICogMaJhWt3EtJTzD3ZTNZqmirvOrJlIK7llZ
	6s8nPw7tefaysKUpwmgfCKYc75N7n5IgApa/o=
Received: by 10.204.4.138 with SMTP id 10mr10066032bkr.374.1317648482601;
	Mon, 03 Oct 2011 06:28:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm7282673fad.1.2011.10.03.06.28.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:28:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:27:03 +0200
Message-Id: <29af35fa2f73a2b3df67b191079527cf3fbc1559.1317648011.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
References: <ebe115dd156cf69f5e7fb7076816c5faa3748ce6.1317648011.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648011.git.Martin.Jansa@gmail.com>
References: <cover.1317648011.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCHv2 05/25] libx11: drop here, 1.4.4 should be in oe-core
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
X-List-Received-Date: Mon, 03 Oct 2011 13:33:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libx11-1.4.3/keysymdef_include.patch  |   19 -------
 .../libx11-1.4.3/x11_disable_makekeys.patch        |   29 -----------
 meta-oe/recipes-graphics/xorg-lib/libx11.inc       |   52 --------------------
 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb  |   11 ----
 4 files changed, 0 insertions(+), 111 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/keysymdef_include.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11.inc
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/keysymdef_include.patch b/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/keysymdef_include.patch
deleted file mode 100644
index 1a30e34..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/keysymdef_include.patch
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
diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch b/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
deleted file mode 100644
index 9763313..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.3/x11_disable_makekeys.patch
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
diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11.inc b/meta-oe/recipes-graphics/xorg-lib/libx11.inc
deleted file mode 100644
index 9f7e990..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libx11.inc
+++ /dev/null
@@ -1,52 +0,0 @@
-require xorg-lib-common.inc
-
-DESCRIPTION = "Base X libs."
-DEPENDS += "util-macros xtrans libxdmcp libxau \
-            bigreqsproto xproto xextproto xcmiscproto \
-            xf86bigfontproto kbproto inputproto libxcb \
-	    xproto-native"
-
-FILESPATHPKG .= ":libx11-${PV}:libx11"
-BBCLASSEXTEND = "native nativesdk"
-PROVIDES = "virtual/libx11"
-PE = "1"
-
-PACKAGES =+ "${PN}-xcb"
-
-FILES_${PN} += "${datadir}/X11/XKeysymDB ${datadir}/X11/XErrorDB ${libdir}/X11/Xcms.txt"
-FILES_${PN}-xcb += "${libdir}/libX11-xcb.so.*"
-FILES_${PN}-locale += "${datadir}/X11/locale ${libdir}/X11/locale"
-
-XORG_PN = "libX11"
-
-EXTRA_OECONF += "--with-keysymdefdir=${STAGING_INCDIR}/X11 --with-groff=no --with-ps2pdf=no --with-fop=no --disable-specs"
-
-# Below option is added to overcome the GCC bug on ARM
-# see http://gcc.gnu.org/PR42981 for further details.
-# We could potentially take it off when its fixed in gcc 4.5
-
-CFLAGS_append_arm = " -fforward-propagate "
-
-SRC_URI += " file://keysymdef_include.patch \
-             file://x11_disable_makekeys.patch \
-"
-
-do_compile_prepend() {
-	(
-		unset CC LD CXX CCLD CFLAGS CPPFLAGS LDFLAGS CXXFLAGS
-		cd src/util; 
-		mv makekeys.c.orig makekeys.c || true
-		# MIN_REHASH 10 is only in 1.0.1
-		sed -i -e 's:MIN_REHASH 10:MIN_REHASH 16:g' makekeys.c
-		sed -i -e 's:MIN_REHASH 15:MIN_REHASH 16:g' makekeys.c
-		touch makekeys-makekeys.o ; ${BUILD_CC} ${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE} makekeys.c -o makekeys
-		# mv to stop it getting rebuilt
-		mv makekeys.c makekeys.c.orig
-		cd ../../
-	) || exit 1
-}
-
-python () {
-       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
-       	  raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
-}
diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb b/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
deleted file mode 100644
index 3c6a170..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.3.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require libx11.inc
-
-LICENSE = "MIT & MIT-style & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
-
-#--without-xcb is not an option anymore
-#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "85e942627aaa020813e0eb8433353563"
-SRC_URI[sha256sum] = "38b5ddd93291714a46a02cb8a5dd94b995a04ed76a608551c44d1598e113635a"
-- 
1.7.7



