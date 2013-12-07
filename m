Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 02CF16C72F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Dec 2013 07:20:05 +0000 (UTC)
Received: by mail-pd0-f170.google.com with SMTP id g10so2239931pdj.15
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2013 23:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=muUioNRjDcI34TJd5/BU9rWeSSmmA6iOjNKGiS6nzXM=;
	b=iCrwP2k+hpQxAV5jhV0jeM3pnROLKaH4GmcZwXp6UBvBBr76j6oho5B6AjWK1DHDjm
	0oDNL/VkTPsde9ReuEXhmSe5RlKCMqrWzOAXQqDF1WrpmRmLqYmunaBQ+yToqwsV633a
	AoBAPktqJ3C3sBV2B9rIHjoq3viCcK9+00002eyQEyBVeAmDrDBE8eJwNGFvEMcTcljD
	73ZAGffDXeDEd9shZeVN7cpAsGyfc8lhaj5GmKUM+rueOm+hFTrIx/jD6B7Q615yD42X
	cACwnR7NF/tyWjUG8+xnTFC3oQEsfWtgAZ9a54/cAJDY0j8ZS87DJCOtPmX1N2ExS+W6
	rYEg==
X-Received: by 10.66.136.101 with SMTP id pz5mr8772427pab.118.1386400805474;
	Fri, 06 Dec 2013 23:20:05 -0800 (PST)
Received: from ghoda.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id pe3sm2352611pbc.23.2013.12.06.23.20.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Dec 2013 23:20:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  6 Dec 2013 23:20:18 -0800
Message-Id: <1386400818-15562-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-gnome][PATCH] libgnomeprint: Add missing dependency on freetype
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
X-List-Received-Date: Sat, 07 Dec 2013 07:20:07 -0000

Fixes compile errors like

| gnome-rfont.c:31:30: fatal error: freetype/ftglyph.h: No such file or
directory
|  #include <freetype/ftglyph.h>
|                               ^
| compilation terminated.
| make[3]: *** [gnome-rfont.lo] Error 1

Fix header inclusion mechanism for freetype headers

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome/libgnomeprint/freetype.patch             |   38 ++++++++++++++++++++
 .../recipes-gnome/gnome/libgnomeprint_2.18.7.bb    |    6 ++--
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome/libgnomeprint/freetype.patch

diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint/freetype.patch b/meta-gnome/recipes-gnome/gnome/libgnomeprint/freetype.patch
new file mode 100644
index 0000000..7a27ecd
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint/freetype.patch
@@ -0,0 +1,38 @@
+Use proper method to include freetype headers
+
+FreeType wants to use these special macros to include its APIs
+so be it.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libgnomeprint-2.18.7/libgnomeprint/gnome-font-face.c
+===================================================================
+--- libgnomeprint-2.18.7.orig/libgnomeprint/gnome-font-face.c
++++ libgnomeprint-2.18.7/libgnomeprint/gnome-font-face.c
+@@ -36,7 +36,9 @@
+ #include <stdarg.h>
+ #include <locale.h>
+ 
+-#include <freetype/ftoutln.h>
++#include <ft2build.h>
++#include FT_FREETYPE_H
++
+ 
+ #include <libgnomeprint/gnome-print-private.h>
+ #include <libgnomeprint/gnome-font-private.h>
+Index: libgnomeprint-2.18.7/libgnomeprint/gnome-rfont.c
+===================================================================
+--- libgnomeprint-2.18.7.orig/libgnomeprint/gnome-rfont.c
++++ libgnomeprint-2.18.7/libgnomeprint/gnome-rfont.c
+@@ -28,8 +28,8 @@
+ 
+ #include <ft2build.h>
+ #include FT_FREETYPE_H
+-#include <freetype/ftglyph.h>
+-#include <freetype/ftbbox.h>
++#include FT_GLYPH_H
++#include FT_BBOX_H
+ #include <libart_lgpl/art_misc.h>
+ #include <libart_lgpl/art_affine.h>
+ #include <libart_lgpl/art_vpath.h>
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
index 8e31f1d..606c752 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.7.bb
@@ -3,13 +3,15 @@ SECTION = "x11/gnome/libs"
 
 PR = "r2"
 
-DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common"
+DEPENDS = "libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common freetype"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit pkgconfig gnome
 
-SRC_URI += "file://fix.includes.patch"
+SRC_URI += "file://fix.includes.patch \
+            file://freetype.patch \
+           "
 
 SRC_URI[archive.md5sum] = "d66b81ee8aa3b3a33f5efc9a47ce07e3"
 SRC_URI[archive.sha256sum] = "8b34f81599423ef3da9c43775495da602f83cbbee069c9e760ffeae6aa4768e6"
-- 
1.7.10.4


