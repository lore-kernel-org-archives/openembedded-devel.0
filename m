Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBlok-0007Fd-CB
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:36:30 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317697fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=WZEa/U/xtVMCmG8+8ufSucIXzK6/UOjvLWnIXaQ860c=;
	b=gfsuDJA2DefU6+RSl+jv3K/oPIb/+OFWiQk89l8uG3UiTczMoYZ1LWJDGKtE6bFWSC
	kErT7LpFqemgJ4mClKh+yKNcGRmEj1/yEKSAHkFmtq6v7YKuQzdESgJMsHlGXdD3ul5D
	qCkKqxwWwViTv3aEuh9Y9aYGSLBm+QCFvw7hc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cF5Uh088ZdEvkGPEoUjSJ8H8jUrxfYf2roTTlb1OgMaPFxAo9EDlhsWzmT5hg8UX+P
	E/GDmsweLhzwESM3AeFIGD9oqXtJooIWWepbtzlNCin4h78E/8fv33QqznjXARPaigyy
	qdveyT3I8fZP88Lu/VSDm6Ay4qkbFs2Nb2XoI=
Received: by 10.223.161.194 with SMTP id s2mr4791499fax.143.1303122842096;
	Mon, 18 Apr 2011 03:34:02 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id n9sm1623534fax.27.2011.04.18.03.34.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:34:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:33:55 +0200
Message-Id: <caa015b5995e708756c83ef93797e3eb1f83a18e.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 10/13] libx11: drop older version 1.4.1
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
X-List-Received-Date: Mon, 18 Apr 2011 10:36:30 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-lib/libx11-1.4.1/keysymdef_include.patch  |   19 -------------
 .../libx11-1.4.1/x11_disable_makekeys.patch        |   29 --------------------
 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb  |   12 --------
 3 files changed, 0 insertions(+), 60 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/keysymdef_include.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
 delete mode 100644 meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/keysymdef_include.patch b/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/keysymdef_include.patch
deleted file mode 100644
index 1a30e34..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/keysymdef_include.patch
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
diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch b/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
deleted file mode 100644
index 9763313..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libx11-1.4.1/x11_disable_makekeys.patch
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
diff --git a/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb b/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb
deleted file mode 100644
index a442330..0000000
--- a/meta-oe/recipes-graphics/xorg-lib/libx11_1.4.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require libx11.inc
-
-LICENSE = "MIT & MIT-style & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
-
-#--without-xcb is not an option anymore
-#http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=15e5eaf62897b3179d1fbe457cb19f886f0449f8
-DEPENDS_virtclass-native = "libxcb-native ${COMMON_DEPENDS}"
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "4603bdbce1bd73cbc140de402fe6ed24"
-SRC_URI[sha256sum] = "70f4e0f798645a0f269f362bfdbd4c7934dae3a2dd9ecbad28d6ede414f63ce2"
-- 
1.7.5.rc1



