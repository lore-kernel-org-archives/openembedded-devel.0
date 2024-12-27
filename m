Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31239E7718F
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 10:58:10 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.10961.1735297086262826519
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 02:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=s9IPJjz/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2024122710580332f0225beac02bf01b-igvnfo@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024122710580332f0225beac02bf01b
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 27 Dec 2024 11:58:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=LJnKvFAlQ0uRi/Q4bL+U+5JAbANslUecTn+lLs9nc2Q=;
 b=s9IPJjz/2T820B9CGiTLjtTH7tEMeJLUUlCYKlhIU95JWyb3bHxroKrDXV3gFqmWd+gYQY
 2WWHH9iO39tt4NNR2rpPvO4GXPOViJgWegagEHMEjdGmgoBGVQm+9wrbL3DM/Hpwaj0I5zH6
 9AB7a5YB66MmG1UmNM2SIsKEdWsydEiXWDu1Y7d8Yel8fDnruLGP/S9VZk1Nvgfs6o3N035c
 ogqJRT70ycN5VJmTQVa13fbnhHipN5okmALUudTCW1wkZ7OzPGdFuFSqG3z0KXzrYCEMIsAA
 /mJDKQ+QXWQbmn7SicC49UpuAu9fotTUdd8Y8y4cHvCYzMqrnG70cGmg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 10/15] limwmf: upgrade 0.2.8.4 -> 0.2.13
Date: Fri, 27 Dec 2024 11:56:10 +0100
Message-Id: <20241227105615.3303193-11-peter.marko@siemens.com>
In-Reply-To: <20241227105615.3303193-1-peter.marko@siemens.com>
References: <20241227105615.3303193-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 10:58:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114568

From: Peter Marko <peter.marko@siemens.com>

$ git log --oneline | grep CVE
f58c813 merge in fixes for libgd CVE-2019-6978
407a58b CVE-2017-6362
dabcb8c CVE-2016-10168
b691e47 CVE-2016-10167
16919b4 CVE-2016-9317
2208b48 CVE-2016-9011
f47cbdf CVE-2015-4696
b5ae5d1 CVE-2015-4695
879d6bf CVE-2015-0848+CVE-2015-4588
44f37ac CVE-2009-3546
7bd8ce0 CVE-2007-2756
cfc0916 CVE-2007-3477
5ec7547 CVE-2007-3473
fdd21b1 CVE-2007-3472
5588450 CVE-2007-0455
2c84480 CVE-2009-1364, Use-after-free vulnerability
b9cc022 CVE-2006-3376 Integer overflow in player.c

Adaptations:
* removed patches included in new version.
* extended buildpaths fix to pc file
* changed paths from libdir/gtk-2 to libdir/gdk-pixbuf-2.0

Test - built imagemagick (only recipe in meta-openembedded depending
on libwmf) with wmf PACKAGECONFIG.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...onfigure-use-pkg-config-for-freetype.patch | 67 -------------------
 .../libwmf/libwmf-0.2.8.4-intoverflow.patch   | 33 ---------
 .../libwmf/libwmf-0.2.8.4-useafterfree.patch  | 16 -----
 .../{libwmf_0.2.8.4.bb => libwmf_0.2.13.bb}   | 18 ++---
 4 files changed, 7 insertions(+), 127 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
 delete mode 100644 meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
 delete mode 100644 meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
 rename meta-oe/recipes-extended/libwmf/{libwmf_0.2.8.4.bb => libwmf_0.2.13.bb} (57%)

diff --git a/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch b/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
deleted file mode 100644
index 21a6f292c8..0000000000
--- a/meta-oe/recipes-extended/libwmf/libwmf/0001-configure-use-pkg-config-for-freetype.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 61655f82224cadb261e81f8bae111eaaa7bdf531 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 6 Aug 2014 14:53:03 +0200
-Subject: [PATCH] configure: use pkg-config for freetype
-
-Upstream-Status: Pending
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- configure.ac | 37 ++++++++-----------------------------
- 1 file changed, 8 insertions(+), 29 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3cfe974..0055a8c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -399,40 +399,19 @@ AC_ARG_WITH(freetype,[  --with-freetype=DIR     use freetype2 in DIR],[
- 	fi
- ])
- 
--if [ test -n "$FREETYPE_DIR" ]; then
--	AC_PATH_PROG(FREETYPE_CONFIG,freetype-config, ,[$FREETYPE_DIR/bin:$PATH])
--else
--	AC_PATH_PROG(FREETYPE_CONFIG,freetype-config)
--fi
--
--if [ test -n "$FREETYPE_CONFIG" ]; then
--	if [ test -n "$FREETYPE_DIR" ]; then
--		freetype_cflags="`$FREETYPE_CONFIG --cflags` -I$FREETYPE_DIR/include"
--		freetype_libs=`$FREETYPE_CONFIG --libs`
--	else
--		freetype_cflags=`$FREETYPE_CONFIG --cflags`
--		freetype_libs=`$FREETYPE_CONFIG --libs`
--	fi
--else
--	if [ test -n "$FREETYPE_DIR" ]; then
--		freetype_cflags="-I$FREETYPE_DIR/include/freetype2 -I$FREETYPE_DIR/include"
--		freetype_libs="-L$FREETYPE_DIR/lib -lfreetype"
--	else
--		freetype_cflags=""
--		freetype_libs="-lfreetype"
--	fi
--fi
--
--CPPFLAGS="$freetype_cflags $CPPFLAGS"
--LDFLAGS="$LDFLAGS $freetype_libs"
-+PKG_CHECK_MODULES(FREETYPE2, freetype2, 
-+    CFLAGS="$CFLAGS $FREETYPE2_CFLAGS"
-+    LDFLAGS="$LDFLAGS $FREETYPE2_LIBS",
-+    AC_MSG_ERROR([*** Unable to find FreeType2 library (http://www.freetype.org/)])
-+)
- 
- AC_CHECK_LIB(freetype,FT_Init_FreeType,[
--	WMF_FT_LDFLAGS="$freetype_libs"
-+	WMF_FT_LDFLAGS="$FREETYPE2_LIBS"
- ],[	AC_MSG_ERROR([* * * freetype(2) is required * * *])
- ])
- AC_CHECK_HEADER(ft2build.h,[
--	WMF_FT_CFLAGS="$freetype_cflags"
--	WMF_FT_CONFIG_CFLAGS="$freetype_cflags"
-+	WMF_FT_CFLAGS="$FREETYPE2_CFLAGS"
-+	WMF_FT_CONFIG_CFLAGS="$FREETYPE2_CFLAGS"
- ],[	AC_MSG_ERROR([* * * freetype(2) is required * * *])
- ])
- 
--- 
-1.9.0
-
diff --git a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
deleted file mode 100644
index 4e7cd8887a..0000000000
--- a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-intoverflow.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Pending
-
-http://cvs.fedoraproject.org/viewvc/devel/libwmf/libwmf-0.2.8.4-intoverflow.patch?view=log
-
-CVE-2006-3376 libwmf integer overflow
-
---- libwmf-0.2.8.4.orig/src/player.c	2002-12-10 19:30:26.000000000 +0000
-+++ libwmf-0.2.8.4/src/player.c	2006-07-12 15:12:52.000000000 +0100
-@@ -42,6 +42,7 @@
- #include "player/defaults.h" /* Provides: default settings               */
- #include "player/record.h"   /* Provides: parameter mechanism            */
- #include "player/meta.h"     /* Provides: record interpreters            */
-+#include <stdint.h>
- 
- /**
-  * @internal
-@@ -132,8 +134,14 @@
- 		}
- 	}
- 
--/*	P->Parameters = (unsigned char*) wmf_malloc (API,(MAX_REC_SIZE(API)-3) * 2 * sizeof (unsigned char));
-- */	P->Parameters = (unsigned char*) wmf_malloc (API,(MAX_REC_SIZE(API)  ) * 2 * sizeof (unsigned char));
-+	if (MAX_REC_SIZE(API) > UINT32_MAX / 2)
-+	{
-+		API->err = wmf_E_InsMem;
-+		WMF_DEBUG (API,"bailing...");
-+		return (API->err);
-+	}
-+	
-+ 	P->Parameters = (unsigned char*) wmf_malloc (API,(MAX_REC_SIZE(API)  ) * 2 * sizeof (unsigned char));
- 
- 	if (ERR (API))
- 	{	WMF_DEBUG (API,"bailing...");
diff --git a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch b/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
deleted file mode 100644
index 9a8cbcb508..0000000000
--- a/meta-oe/recipes-extended/libwmf/libwmf/libwmf-0.2.8.4-useafterfree.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Pending
-
-
-http://cvs.fedoraproject.org/viewvc/devel/libwmf/libwmf-0.2.8.4-useafterfree.patch?view=log
-Resolves: CVE-2009-1364
-
---- libwmf-0.2.8.4/src/extra/gd/gd_clip.c.CVE-2009-1364-im-clip-list	2009-04-24 04:06:44.000000000 -0400
-+++ libwmf-0.2.8.4/src/extra/gd/gd_clip.c	2009-04-24 04:08:30.000000000 -0400
-@@ -70,6 +70,7 @@ void gdClipSetAdd(gdImagePtr im,gdClipRe
- 	{	more = gdRealloc (im->clip->list,(im->clip->max + 8) * sizeof (gdClipRectangle));
- 		if (more == 0) return;
- 		im->clip->max += 8;
-+                im->clip->list = more;
- 	}
- 	im->clip->list[im->clip->count] = (*rect);
- 	im->clip->count++;
diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
similarity index 57%
rename from meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
rename to meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
index 5e530b35de..7a82f6b4b6 100644
--- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
+++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.13.bb
@@ -16,21 +16,17 @@ inherit features_check autotools pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://github.com/caolanm/libwmf.git;protocol=https;branch=master \
-           file://libwmf-0.2.8.4-intoverflow.patch \
-           file://libwmf-0.2.8.4-useafterfree.patch \
-           file://0001-configure-use-pkg-config-for-freetype.patch \
-          "
-SRCREV = "27b4aaf8cf653b4cd2ebe14717ffa9e76560485e"
+SRC_URI = "git://github.com/caolanm/libwmf.git;protocol=https;branch=master"
+SRCREV = "9e4737f2293c0d127bda92e5b01896df10571424"
 
 S = "${WORKDIR}/git"
 
 do_install:append() {
-    sed -i -e 's@${RECIPE_SYSROOT}@@g' ${D}${bindir}/libwmf-config
+    sed -i -e 's@${RECIPE_SYSROOT}@@g' ${D}${bindir}/libwmf-config ${D}${libdir}/pkgconfig/libwmf.pc
 }
 
-FILES:${PN}-dbg += "${libdir}/gtk-2.0/2.10.0/loaders/.debug"
-FILES:${PN}-dev += "${libdir}/gtk-2.0/2.10.0/loaders/*.la"
-FILES:${PN}-staticdev += "${libdir}/gtk-2.0/2.10.0/loaders/*.a"
-FILES:${PN} += "${libdir}/gtk-2.0/2.10.0/loaders/*.so"
+FILES:${PN}-dbg += "${libdir}/gdk-pixbuf-2.0/2.10.0/loaders/.debug"
+FILES:${PN}-dev += "${libdir}/gdk-pixbuf-2.0/2.10.0/loaders/*.la"
+FILES:${PN}-staticdev += "${libdir}/gdk-pixbuf-2.0/2.10.0/loaders/*.a"
+FILES:${PN} += "${libdir}/gdk-pixbuf-2.0/2.10.0/loaders/*.so"
 
-- 
2.30.2


