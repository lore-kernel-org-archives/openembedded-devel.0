Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TmkoY-00016i-Fr
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 13:37:59 +0100
Received: by mail-ea0-f182.google.com with SMTP id a14so2611205eaa.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 04:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=8upxV2agiDouYkIbrwDpsBJeTnv94F4UfKcq3/p/0RU=;
	b=IogRUnYoTyJ6v6epzv+QsixWkdSd6DNXSh9XMSkqO1ruRtQtPknrIaoD9646ALJ02v
	Di1r6NL82g626ixeYkzxzlTyuE7M7J8XZsDpngopxHDy65Zii9ClL+E+fvRCvpBZJDNc
	G1jtfeUFso+uRg2zrbN4Q0vbB997DMIEHkLyZJV2UbA9AVtBuFxwz1WIGr2WohMOSjIz
	00GcI1Yg3pAI+BqlGWoU5hngR9O+5oRuPs7vC5NFONwKvwKqJ+HSAsbztW59cvIWPxcC
	Vox8QBoJ07oZy2MzoFQBSvQSV7wE2mbn3llgG8pBzUhQso9SRTh+7B/1iSlsNJKPVh3j
	OcMw==
X-Received: by 10.14.174.132 with SMTP id x4mr47145918eel.39.1356265390163;
	Sun, 23 Dec 2012 04:23:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id k4sm34569263eep.15.2012.12.23.04.23.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 04:23:09 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 13:21:33 +0100
Message-Id: <28c25eb268b4f40a2c16a249d7a9fb7d8a94909a.1356264861.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0.2
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1356264861.git.Martin.Jansa@gmail.com>
References: <cover.1356264861.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 08/30] abiword: fix build with libpng-1.5 from oe-core
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
X-List-Received-Date: Sun, 23 Dec 2012 12:38:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-gnome/abiword/abiword/libpng15.patch   | 102 +++++++++++++++++++++
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |   6 +-
 2 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch b/meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch
new file mode 100644
index 0000000..0fc93c5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch
@@ -0,0 +1,102 @@
+Imported from gentoo
+
+$NetBSD: patch-plugins_bmp_xp_ie__impGraphic__BMP.cpp,v 1.1 2011/02/01 10:48:15 wiz Exp $
+
+Fix build with png-1.5.
+
+--- a/plugins/bmp/xp/ie_impGraphic_BMP.cpp.orig	2009-06-25 04:02:06.000000000 +0000
++++ b/plugins/bmp/xp/ie_impGraphic_BMP.cpp
+@@ -191,7 +191,10 @@ UT_Error IE_ImpGraphic_BMP::_convertGrap
+ 
+ 	/* Clean Up Memory Used */
+ 		
+-	FREEP(m_pPNGInfo->palette);
++	png_colorp palette;
++	int num_palette;
++	png_get_PLTE( m_pPNG, m_pPNGInfo, &palette, &num_palette );
++	FREEP(palette);
+ 	DELETEP(pBB);
+ 	png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
+    
+@@ -313,7 +316,7 @@ UT_Error IE_ImpGraphic_BMP::Initialize_P
+ 	 * the normal method of doing things with libpng).  REQUIRED unless you
+ 	 * set up your own error handlers in the png_create_read_struct() earlier.
+ 	 */
+-	if (setjmp(m_pPNG->jmpbuf))
++	if (setjmp(png_jmpbuf(m_pPNG)))
+ 	{
+ 		/* Free all of the memory associated with the png_ptr and info_ptr */
+ 		png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
+@@ -332,7 +335,7 @@ UT_Error IE_ImpGraphic_BMP::Initialize_P
+ 	UT_Error IE_ImpGraphic_BMP::Convert_BMP_Pallet(UT_ByteBuf* pBB)
+ 	{
+ 		/* Reset error handling for libpng */
+-		if (setjmp(m_pPNG->jmpbuf))
++		if (setjmp(png_jmpbuf(m_pPNG)))
+ 		{
+ 			png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
+ 			return UT_ERROR;
+@@ -372,7 +375,7 @@ UT_Error IE_ImpGraphic_BMP::Initialize_P
+ UT_Error IE_ImpGraphic_BMP::Convert_BMP(UT_ByteBuf* pBB)
+ {
+ 	/* Reset error handling for libpng */
+-	if (setjmp(m_pPNG->jmpbuf))
++	if (setjmp(png_jmpbuf(m_pPNG)))
+ 	{
+ 		png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
+ 		return UT_ERROR;
+
+$NetBSD: patch-plugins_garble_xp_abiword-garble-png.cpp,v 1.1 2011/02/01 10:48:15 wiz Exp $
+
+Fix build with png-1.5.
+
+--- a/plugins/garble/xp/abiword-garble-png.cpp.orig	2009-09-05 15:34:44.000000000 +0000
++++ b/plugins/garble/xp/abiword-garble-png.cpp
+@@ -79,7 +79,7 @@ bool abiword_document::garble_png( void*
+ 		png_set_strip_alpha( png_ptr );
+ 		png_set_interlace_handling( png_ptr );
+ 		png_set_bgr( png_ptr );
+-		rowbytes = info_ptr->rowbytes;
++		rowbytes = png_get_rowbytes( png_ptr, info_ptr );
+ 		png_destroy_read_struct( &png_ptr, &info_ptr, NULL );
+ 	}
+ 
+$NetBSD: patch-af,v 1.12 2011/01/15 15:07:11 wiz Exp $
+
+Fix build with png-1.5.
+
+--- a/src/wp/impexp/gtk/ie_impGraphic_GdkPixbuf.cpp.orig	2009-07-01 04:02:04.000000000 +0000
++++ b/src/wp/impexp/gtk/ie_impGraphic_GdkPixbuf.cpp
+@@ -185,7 +185,7 @@ UT_Error IE_ImpGraphic_GdkPixbuf::import
+ /** needed for the stejmp context */
+ UT_Error IE_ImpGraphic_GdkPixbuf::_png_write(GdkPixbuf * pixbuf)
+ {
+-	if (setjmp(m_pPNG->jmpbuf))
++	if (setjmp(png_jmpbuf(m_pPNG)))
+ 	{
+ 		DELETEP(m_pPngBB);
+ 		png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
+@@ -446,7 +446,7 @@ UT_Error IE_ImpGraphic_GdkPixbuf::Initia
+ 	 * the normal method of doing things with libpng).  REQUIRED unless you
+ 	 * set up your own error handlers in the png_create_read_struct() earlier.
+ 	 */
+-	if (setjmp(m_pPNG->jmpbuf))
++	if (setjmp(png_jmpbuf(m_pPNG)))
+ 	{
+ 		/* Free all of the memory associated with the png_ptr and info_ptr */
+ 		png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
+$NetBSD: patch-ae,v 1.21 2011/01/15 15:07:11 wiz Exp $
+
+Fix build with png-1.5.
+
+--- a/src/af/util/xp/ut_png.cpp.orig	2008-02-24 03:33:07.000000000 +0000
++++ b/src/af/util/xp/ut_png.cpp
+@@ -71,7 +71,7 @@ bool UT_PNG_getDimensions(const UT_ByteB
+ 	 * the normal method of doing things with libpng).  REQUIRED unless you
+ 	 * set up your own error handlers in the png_create_read_struct() earlier.
+ 	 */
+-	if (setjmp(png_ptr->jmpbuf))
++	if (setjmp(png_jmpbuf(png_ptr)))
+ 	{
+ 		/* Free all of the memory associated with the png_ptr and info_ptr */
+ 		png_destroy_read_struct(&png_ptr, &info_ptr, static_cast<png_infopp>(NULL));
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index c4bf344..a2cd1cc 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -13,7 +13,9 @@ SRC_URI = "http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
            file://autogen-common.sh \
            file://nodolt.patch \
            file://fix.no.undefined.param.patch \
-           file://abiword.fix.glib-2.32.patch"
+           file://abiword.fix.glib-2.32.patch \
+           file://libpng15.patch \
+"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 
@@ -23,7 +25,7 @@ SRC_URI[sha256sum] = "d99089a63a6cfc1a6a4a026be9278028d47d224088d24b1853acb67e95
 #want 2.x from 2.x.y for the installation directory
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-PR = "r7"
+PR = "r8"
 
 inherit autotools pkgconfig
 
-- 
1.8.0.2



