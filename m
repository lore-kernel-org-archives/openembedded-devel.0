Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59F5477E55
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTmor022147
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:49 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:48 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:18 -0500
Message-ID: <1504725809-12825-21-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 20/31] libart-lgpg: Obsolete, replaced by version in oe-core
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:47 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../libart-lgpl/libart-lgpl/Makefile.am.patch      | 17 -------------
 .../libart-lgpl/libart-lgpl/aarch64/art_config.h   | 10 --------
 .../libart-lgpl/libart-lgpl/aarch64be/art_config.h | 10 --------
 .../libart-lgpl/aarch64be_32/art_config.h          | 10 --------
 .../libart-lgpl/libart-lgpl/arm/art_config.h       | 10 --------
 .../libart-lgpl/libart-lgpl/armeb/art_config.h     | 10 --------
 .../libart-lgpl/libart-lgpl/i386/art_config.h      | 10 --------
 .../libart-lgpl/libart-lgpl/i586/art_config.h      | 10 --------
 .../libart-lgpl/libart-lgpl/i686/art_config.h      | 10 --------
 .../libart-lgpl/libart-lgpl/mips/art_config.h      | 10 --------
 .../libart-lgpl/libart-lgpl/mips64/art_config.h    | 10 --------
 .../libart-lgpl/libart-lgpl/mips64el/art_config.h  | 10 --------
 .../libart-lgpl/libart-lgpl/mipsel/art_config.h    | 10 --------
 .../libart-lgpl/libart-lgpl/powerpc/art_config.h   | 10 --------
 .../libart-lgpl/libart-lgpl/powerpc64/art_config.h | 10 --------
 .../libart-lgpl/libart-lgpl/x86_64/art_config.h    | 10 --------
 .../libart-lgpl/libart-lgpl_2.3.21.bb              | 28 ----------------------
 17 files changed, 195 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h
 delete mode 100644 meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb

diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch
deleted file mode 100644
index 190ba96..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/Makefile.am.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Index: libart_lgpl-2.3.21/Makefile.am
-===================================================================
---- libart_lgpl-2.3.21.orig/Makefile.am	2009-04-18 05:29:25.000000000 -0700
-+++ libart_lgpl-2.3.21/Makefile.am	2010-11-23 23:12:32.445450075 -0800
-@@ -7,8 +7,8 @@
- 
- BUILT_SOURCES = art_config.h
- 
--art_config.h:
--	./gen_art_config.sh > art_config.h
-+#art_config.h:
-+#	./gen_art_config.sh > art_config.h
- 
- EXTRA_DIST = 			\
- 	libart.def		\
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h
deleted file mode 100644
index 500ffc3..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h
deleted file mode 100644
index 500ffc3..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/aarch64be_32/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/arm/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/armeb/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i386/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i586/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/i686/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h
deleted file mode 100644
index d10cd95..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h
deleted file mode 100644
index d10cd95..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mips64el/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/mipsel/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h
deleted file mode 100644
index b0e74ad..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 4
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h
deleted file mode 100644
index 500ffc3..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/powerpc64/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h
deleted file mode 100644
index 500ffc3..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl/x86_64/art_config.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* Automatically generated by gen_art_config.c */
-
-#define ART_SIZEOF_CHAR 1
-#define ART_SIZEOF_SHORT 2
-#define ART_SIZEOF_INT 4
-#define ART_SIZEOF_LONG 8
-
-typedef unsigned char art_u8;
-typedef unsigned short art_u16;
-typedef unsigned int art_u32;
diff --git a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb b/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb
deleted file mode 100644
index 7b29506..0000000
--- a/meta-gnome/recipes-gnome/libart-lgpl/libart-lgpl_2.3.21.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Library of functions for 2D graphics"
-SECTION = "x11/gnome"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-PR = "r2"
-
-ART_CONFIG = "${HOST_ARCH}/art_config.h"
-
-# can't use gnome.oeclass due to _ in filename
-SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
-       file://${ART_CONFIG} \
-       file://Makefile.am.patch"
-
-SRC_URI[md5sum] = "08559ff3c67fd95d57b0c5e91a6b4302"
-SRC_URI[sha256sum] = "fdc11e74c10fc9ffe4188537e2b370c0abacca7d89021d4d303afdf7fd7476fa"
-
-inherit autotools pkgconfig
-
-DEPENDS = ""
-
-FILES_${PN} = "${libdir}/*.so.*"
-FILES_${PN}-dev += "${bindir}/libart2-config"
-
-S = "${WORKDIR}/libart_lgpl-${PV}"
-
-do_configure_prepend() {
-    cp ${WORKDIR}/${ART_CONFIG} ${S}/art_config.h
-}
-- 
1.8.3.1


