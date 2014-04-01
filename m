Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id DC9746B720
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 15:22:08 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id z2so3629012wiv.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 08:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=RlmoQNwgHt+gFXoUdOQSh3Mx2G4CXzyfSGHP2M7LFrU=;
	b=gSWMT3yGSTLWgNSg/dDJESnU35pSV2CdYVmaMqLjxk0gJWobbkNlPsrYrgG0Nf91pT
	ZdXxDBsgY9n1iogU4Az87k7Wg1KHWS3Vjw5TFRg4qPdCD9olwYycHL2HbWSxS1gWc6Q+
	D+ZQoOnkMblfdmFPERBc4VwsFRv68toy52BgawB+NaXHJfrZJL9unPc1QhEPikF7elYg
	oTupXk0h555GI7yl1k6f83pez9QX/Xs5o3Jvf+kYKMVKc7jJm1vynJ+oDVry2gx8O6Or
	9+ftzNwrMUN8aoqLVVkoXKLN2vpJw2sNxvcPwKPxLyK9z5eQVKvS756SUAdVoaaXOVfr
	UiEw==
X-Received: by 10.180.13.197 with SMTP id j5mr20972867wic.14.1396365729097;
	Tue, 01 Apr 2014 08:22:09 -0700 (PDT)
Received: from localhost.localdomain (ip-176-198-252-199.unitymediagroup.de.
	[176.198.252.199])
	by mx.google.com with ESMTPSA id 48sm41246865eee.2.2014.04.01.08.22.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Apr 2014 08:22:08 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Apr 2014 17:21:46 +0200
Message-Id: <1396365706-14220-11-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
References: <1396365706-14220-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce/meta-gnome 10/10] abiword: update to 3.0.0 to fix build
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
X-List-Received-Date: Tue, 01 Apr 2014 15:22:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../abiword/abiword/abiword-cxx-for-ld-fix.patch   |  12 ---
 .../abiword/abiword/abiword.fix.glib-2.32.patch    |  21 -----
 meta-gnome/recipes-gnome/abiword/abiword/cdump.pl  |  32 -------
 .../abiword/abiword/debian_patches_boost54.patch   |  32 +++++++
 .../abiword/abiword/fix.no.undefined.param.patch   | 104 ---------------------
 .../recipes-gnome/abiword/abiword/libpng15.patch   | 102 --------------------
 .../recipes-gnome/abiword/abiword/nodolt.patch     |  12 ---
 .../abiword/{abiword_2.8.6.bb => abiword_3.0.0.bb} |  39 +++-----
 8 files changed, 47 insertions(+), 307 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/abiword-cxx-for-ld-fix.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch
 delete mode 100755 meta-gnome/recipes-gnome/abiword/abiword/cdump.pl
 create mode 100644 meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword/nodolt.patch
 rename meta-gnome/recipes-gnome/abiword/{abiword_2.8.6.bb => abiword_3.0.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword/abiword-cxx-for-ld-fix.patch b/meta-gnome/recipes-gnome/abiword/abiword/abiword-cxx-for-ld-fix.patch
deleted file mode 100644
index e49b1e9..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/abiword-cxx-for-ld-fix.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-libstc++ isn't in staging anymore, so we must use g++ for linking
-
---- /tmp/configure.ac	2008-03-31 11:39:13.130631737 +0200
-+++ abiword-plugins-2.6.0/configure.ac	2008-03-31 11:39:22.754586487 +0200
-@@ -14,6 +14,7 @@
- AC_PROG_INSTALL
- AC_PROG_LN_S
- AC_PROG_MAKE_SET
-+AC_LANG_CPLUSPLUS
- 
- AM_INIT_AUTOMAKE
- 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch b/meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch
deleted file mode 100644
index e466ef6..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/abiword.fix.glib-2.32.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- abiword-2.8.6/goffice-bits/goffice/app/goffice-app.h	2012-04-30 15:06:28.000000000 +0200
-+++ abiword-2.8.6.orig/goffice-bits/goffice/app/goffice-app.h	2007-01-17 00:17:27.000000000 +0100
-@@ -22,7 +22,7 @@
- #ifndef GOFFICE_APP_H
- #define GOFFICE_APP_H
- 
--#include <glib/gmacros.h>
-+#include <glib.h>
- 
- G_BEGIN_DECLS
- 
---- abiword-2.8.6/src/af/util/xp/ut_go_file.h	2012-04-30 15:08:43.000000000 +0200
-+++ abiword-2.8.6.orig/src/af/util/xp/ut_go_file.h	2009-08-27 15:27:10.000000000 +0200
-@@ -31,7 +31,6 @@
- 
- #include <glib.h>
- #include <gsf/gsf.h>
--#include <glib/gerror.h>
- #include <time.h>
- 
- G_BEGIN_DECLS
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/cdump.pl b/meta-gnome/recipes-gnome/abiword/abiword/cdump.pl
deleted file mode 100755
index 76f9c88..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/cdump.pl
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/usr/bin/perl
-
-# This script replace the cdump tool we used to build the ap_wp_Splash.cpp 
-# Because the cdump tool has to be run as a part of building the AW package,
-# it breaks cross-compilation. A perl script seemed like a generic solution
-
-
-if ($#ARGV != 1 )
-{
-	print "Usage: $0 datafile arrayname $#ARGV $ARGV[0] $ARGV[1]\n";
-	exit(-1);
-}
-
-open FROM, "<$ARGV[0]" or die "Could not open file $ARGV[0]";
-binmode FROM;
-
-print "unsigned char $ARGV[1] [] = {\n";
-
-while ($len = read(FROM, $buf, 16))
-{
-	foreach(split(//,$buf))
-	{
-		printf("0x%02x,", ord($_));
-	}
-
-	print "\n";
-}
-
-
-printf "};\nunsigned long $ARGV[1]_sizeof = sizeof($ARGV[1]);\n";
-
-close FROM;
\ No newline at end of file
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch b/meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch
new file mode 100644
index 0000000..cf50cb2
--- /dev/null
+++ b/meta-gnome/recipes-gnome/abiword/abiword/debian_patches_boost54.patch
@@ -0,0 +1,32 @@
+Last-Update: 2014-02-05
+Forwarded: yes
+Author: Dmitry Smirnov <onlyjob@member.fsf.org>
+Bug-Debian: http://bugs.debian.org/737551
+Bug-Abiword: http://bugzilla.abisource.com/13602
+Description: fix FTBFS with libboost1.54-dev
+Upstream-Status: Applied
+
+--- a/plugins/collab/core/sync/xp/SynchronizedQueue.h
++++ b/plugins/collab/core/sync/xp/SynchronizedQueue.h
+@@ -21,8 +21,9 @@
+ 
+ #include <deque>
+ #include <boost/bind.hpp>
+ #include <boost/function.hpp>
++#include <boost/noncopyable.hpp>
+ #include <sync/xp/lock.h>
+ #include <sync/xp/Synchronizer.h>
+ 
+ class EmptyQueueException {};
+--- a/plugins/collab/backends/tcp/xp/Session.h
++++ b/plugins/collab/backends/tcp/xp/Session.h
+@@ -21,8 +21,9 @@
+ 
+ #include <boost/function.hpp>
+ #include <boost/bind.hpp>
+ #include <boost/enable_shared_from_this.hpp>
++#include <boost/noncopyable.hpp>
+ #include <deque>
+ #include <sync/xp/lock.h>
+ #include <sync/xp/Synchronizer.h>
+ 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch b/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch
deleted file mode 100644
index aaccf09..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/fix.no.undefined.param.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-| make[3]: Entering directory
-`/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/abiword-2.8.6/src'
-| /bin/sh ../arm-oe-linux-gnueabi-libtool --tag=CXX   --mode=link
-arm-oe-linux-gnueabi-g++  -march=armv7-a -fno-tree-vectorize
--mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
---sysroot=/OE/shr-core/tmp/sysroots/nokia900  -O2 -pipe -g
--feliminate-unused-debug-types -fpermissive
--fvisibility-inlines-hidden  --no-undefined -avoid-version
--export-dynamic -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o
-abiword abiword-UnixMain.o libabiword-2.8.la  -pthread -lfribidi -lwv
--lpng -lgsf-1 -lxml2 -lenchant -lz -lgtk-x11-2.0 -lgdk-x11-2.0
--latk-1.0 -lpangoft2-1.0 -lpangocairo-1.0 -lpango-1.0 -lfreetype
--lfontconfig -lrsvg-2 -lm -lgio-2.0 -lgdk_pixbuf-2.0 -lcairo
--lgmodule-2.0 -lgobject-2.0 -lgthread-2.0 -lrt -lglib-2.0   -ljpeg
-| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-g++
--march=armv7-a -fno-tree-vectorize -mthumb-interwork
--mfloat-abi=softfp -mfpu=neon -mtune=cortex-a8
---sysroot=/OE/shr-core/tmp/sysroots/nokia900 -O2 -pipe -g
--feliminate-unused-debug-types -fpermissive
--fvisibility-inlines-hidden --no-undefined -Wl,-O1
--Wl,--hash-style=gnu -Wl,--as-needed -o .libs/abiword
-abiword-UnixMain.o -pthread -Wl,--export-dynamic
-./.libs/libabiword-2.8.so -L=/usr/lib
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfribidi.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libwv.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgsf-1.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libbz2.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libenchant.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgtk-x11-2.0.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgdk-x11-2.0.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libatk-1.0.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/librsvg-2.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libxml2.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpangocairo-1.0.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpangoft2-1.0.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libstdc++.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpango-1.0.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgdk_pixbuf-2.0.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgio-2.0.so -lresolv
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libcairo.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpixman-1.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfontconfig.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libexpat.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libfreetype.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libpng12.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXrender.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libX11.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libxcb.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXau.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libXdmcp.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libERROR: Function
-'do_compile' failed (see
-/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/temp/log.do_compile.10916
-for further information)
-| z.so -lm /OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgmodule-2.0.so
--ldl /OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgobject-2.0.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libffi.so
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libgthread-2.0.so -lpthread
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libglib-2.0.so -lrt
-/OE/shr-core/tmp/sysroots/nokia900/usr/lib/libjpeg.so -pthread
-| arm-oe-linux-gnueabi-g++: error: unrecognized option '--no-undefined'
-| make[3]: *** [abiword] Error 1
-| make[3]: Leaving directory
-`/OE/shr-core/tmp/work/armv7a-vfp-neon-oe-linux-gnueabi/abiword-2.8.6-r0/abiword-2.8.6/src'
-
-Maybe it's related to
-http://lists.gnu.org/archive/html/libtool/2011-03/msg00015.html
-
-Remove extra '-' in no-undefined.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-diff -uNr abiword-2.8.6.orig/src/Makefile.am abiword-2.8.6/src/Makefile.am
---- abiword-2.8.6.orig/src/Makefile.am	2009-09-09 15:11:01.000000000 +0200
-+++ abiword-2.8.6/src/Makefile.am	2011-11-23 09:06:06.000000000 +0100
-@@ -44,7 +44,7 @@
- 
- libabiword_2_8_la_LDFLAGS = \
- 	$(DEPS_LIBS) \
--	--no-undefined \
-+	-no-undefined \
- 	-avoid-version \
- 	-export-dynamic
- 
-@@ -107,7 +107,7 @@
- 
- AbiWord_LDFLAGS = \
- 	$(DEPS_LIBS) \
--	--no-undefined \
-+	-no-undefined \
- 	-avoid-version \
- 	-export-dynamic \
- 	-headerpad_max_install_names 
-@@ -129,7 +129,7 @@
- 
- abiword_LDFLAGS = \
- 	$(platform_ldflags) \
--	--no-undefined      \
-+	-no-undefined      \
- 	-avoid-version      \
- 	-export-dynamic
- 
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch b/meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch
deleted file mode 100644
index 0fc93c5..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/libpng15.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-Imported from gentoo
-
-$NetBSD: patch-plugins_bmp_xp_ie__impGraphic__BMP.cpp,v 1.1 2011/02/01 10:48:15 wiz Exp $
-
-Fix build with png-1.5.
-
---- a/plugins/bmp/xp/ie_impGraphic_BMP.cpp.orig	2009-06-25 04:02:06.000000000 +0000
-+++ b/plugins/bmp/xp/ie_impGraphic_BMP.cpp
-@@ -191,7 +191,10 @@ UT_Error IE_ImpGraphic_BMP::_convertGrap
- 
- 	/* Clean Up Memory Used */
- 		
--	FREEP(m_pPNGInfo->palette);
-+	png_colorp palette;
-+	int num_palette;
-+	png_get_PLTE( m_pPNG, m_pPNGInfo, &palette, &num_palette );
-+	FREEP(palette);
- 	DELETEP(pBB);
- 	png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
-    
-@@ -313,7 +316,7 @@ UT_Error IE_ImpGraphic_BMP::Initialize_P
- 	 * the normal method of doing things with libpng).  REQUIRED unless you
- 	 * set up your own error handlers in the png_create_read_struct() earlier.
- 	 */
--	if (setjmp(m_pPNG->jmpbuf))
-+	if (setjmp(png_jmpbuf(m_pPNG)))
- 	{
- 		/* Free all of the memory associated with the png_ptr and info_ptr */
- 		png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
-@@ -332,7 +335,7 @@ UT_Error IE_ImpGraphic_BMP::Initialize_P
- 	UT_Error IE_ImpGraphic_BMP::Convert_BMP_Pallet(UT_ByteBuf* pBB)
- 	{
- 		/* Reset error handling for libpng */
--		if (setjmp(m_pPNG->jmpbuf))
-+		if (setjmp(png_jmpbuf(m_pPNG)))
- 		{
- 			png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
- 			return UT_ERROR;
-@@ -372,7 +375,7 @@ UT_Error IE_ImpGraphic_BMP::Initialize_P
- UT_Error IE_ImpGraphic_BMP::Convert_BMP(UT_ByteBuf* pBB)
- {
- 	/* Reset error handling for libpng */
--	if (setjmp(m_pPNG->jmpbuf))
-+	if (setjmp(png_jmpbuf(m_pPNG)))
- 	{
- 		png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
- 		return UT_ERROR;
-
-$NetBSD: patch-plugins_garble_xp_abiword-garble-png.cpp,v 1.1 2011/02/01 10:48:15 wiz Exp $
-
-Fix build with png-1.5.
-
---- a/plugins/garble/xp/abiword-garble-png.cpp.orig	2009-09-05 15:34:44.000000000 +0000
-+++ b/plugins/garble/xp/abiword-garble-png.cpp
-@@ -79,7 +79,7 @@ bool abiword_document::garble_png( void*
- 		png_set_strip_alpha( png_ptr );
- 		png_set_interlace_handling( png_ptr );
- 		png_set_bgr( png_ptr );
--		rowbytes = info_ptr->rowbytes;
-+		rowbytes = png_get_rowbytes( png_ptr, info_ptr );
- 		png_destroy_read_struct( &png_ptr, &info_ptr, NULL );
- 	}
- 
-$NetBSD: patch-af,v 1.12 2011/01/15 15:07:11 wiz Exp $
-
-Fix build with png-1.5.
-
---- a/src/wp/impexp/gtk/ie_impGraphic_GdkPixbuf.cpp.orig	2009-07-01 04:02:04.000000000 +0000
-+++ b/src/wp/impexp/gtk/ie_impGraphic_GdkPixbuf.cpp
-@@ -185,7 +185,7 @@ UT_Error IE_ImpGraphic_GdkPixbuf::import
- /** needed for the stejmp context */
- UT_Error IE_ImpGraphic_GdkPixbuf::_png_write(GdkPixbuf * pixbuf)
- {
--	if (setjmp(m_pPNG->jmpbuf))
-+	if (setjmp(png_jmpbuf(m_pPNG)))
- 	{
- 		DELETEP(m_pPngBB);
- 		png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
-@@ -446,7 +446,7 @@ UT_Error IE_ImpGraphic_GdkPixbuf::Initia
- 	 * the normal method of doing things with libpng).  REQUIRED unless you
- 	 * set up your own error handlers in the png_create_read_struct() earlier.
- 	 */
--	if (setjmp(m_pPNG->jmpbuf))
-+	if (setjmp(png_jmpbuf(m_pPNG)))
- 	{
- 		/* Free all of the memory associated with the png_ptr and info_ptr */
- 		png_destroy_write_struct(&m_pPNG, &m_pPNGInfo);
-$NetBSD: patch-ae,v 1.21 2011/01/15 15:07:11 wiz Exp $
-
-Fix build with png-1.5.
-
---- a/src/af/util/xp/ut_png.cpp.orig	2008-02-24 03:33:07.000000000 +0000
-+++ b/src/af/util/xp/ut_png.cpp
-@@ -71,7 +71,7 @@ bool UT_PNG_getDimensions(const UT_ByteB
- 	 * the normal method of doing things with libpng).  REQUIRED unless you
- 	 * set up your own error handlers in the png_create_read_struct() earlier.
- 	 */
--	if (setjmp(png_ptr->jmpbuf))
-+	if (setjmp(png_jmpbuf(png_ptr)))
- 	{
- 		/* Free all of the memory associated with the png_ptr and info_ptr */
- 		png_destroy_read_struct(&png_ptr, &info_ptr, static_cast<png_infopp>(NULL));
diff --git a/meta-gnome/recipes-gnome/abiword/abiword/nodolt.patch b/meta-gnome/recipes-gnome/abiword/abiword/nodolt.patch
deleted file mode 100644
index 1546720..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword/nodolt.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: abiword-2.8.1/configure.in
-===================================================================
---- abiword-2.8.1.orig/configure.in
-+++ abiword-2.8.1/configure.in
-@@ -132,7 +132,6 @@ AC_PROG_INSTALL
- #AC_DISABLE_STATIC
- AC_LIBTOOL_WIN32_DLL
- AC_PROG_LIBTOOL
--DOLT
- AC_PROG_LN_S
- 
- AC_MSG_CHECKING([for platform and toolkit])
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
rename to meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
index de1b335..69d62ef 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.0.bb
@@ -4,36 +4,29 @@ SECTION = "x11/office"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
 DEPENDS     = "perl-native wv libglade libfribidi jpeg libpng \
-               librsvg libwmf-native gtkmathview asio"
+               librsvg libwmf-native gtkmathview asio gtk+"
 RDEPENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
                glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
 RCONFLICTS_${PN} = "${PN}-embedded"
 
 SRC_URI = "http://www.abisource.com/downloads/${BPN}/${PV}/source/${BP}.tar.gz \
+           file://debian_patches_boost54.patch \
            file://autogen-common.sh \
-           file://nodolt.patch \
-           file://fix.no.undefined.param.patch \
-           file://abiword.fix.glib-2.32.patch \
-           file://libpng15.patch \
 "
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=ecd3ac329fca77e2d0e412bec38e1c20"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c5edcc3ccd864b19004d14e9c1c9a26a"
 
-SRC_URI[md5sum] = "f883b0a7f26229a9c66fd6a1a94381aa"
-SRC_URI[sha256sum] = "d99089a63a6cfc1a6a4a026be9278028d47d224088d24b1853acb67e95683a15"
+SRC_URI[md5sum] = "8d9c41cff3a8fbef8d0c835c65600e65"
+SRC_URI[sha256sum] = "d17e318c00ff4eb353e0e7994b098b1d4f9ddd8712ac0261a0e38b89081fac01"
 
-#want 2.x from 2.x.y for the installation directory
+#want 3.x from 3.x.y for the installation directory
 SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
-PR = "r8"
-
 inherit autotools pkgconfig
 
-PARALLEL_MAKE = ""
-
 PACKAGECONFIG ??= "collab-backend-xmpp collab-backend-tcp collab-backend-service"
 PACKAGECONFIG[spell] = "--enable-spell,--disable-spell,enchant"
-PACKAGECONFIG[collab-backend-xmpp] = "--enable-collab-backend-xmpp,--disable-collab-backend-xmpp,libgsf libxml2 loudmouth gtk+"
+PACKAGECONFIG[collab-backend-xmpp] = "--enable-collab-backend-xmpp,--disable-collab-backend-xmpp,libgsf libxml2 loudmouth"
 PACKAGECONFIG[collab-backend-tcp] = "--enable-collab-backend-tcp,--disable-collab-backend-tcp,libgsf libxml2"
 PACKAGECONFIG[collab-backend-service] = "--enable-collab-backend-service,--disable-collab-backend-service,libgsf libxml2 libsoup-2.4 gnutls"
 PACKAGECONFIG[collab-backend-telepathy] = "--enable-collab-backend-telepathy,--disable-collab-backend-telepathy,libgsf libxml2 telepathy-glib telepathy-mission-control"
@@ -41,7 +34,10 @@ PACKAGECONFIG[collab-backend-sugar] = "--enable-collab-backend-sugar,--disable-c
 
 EXTRA_OECONF = " --disable-static  \
                  --enable-plugins \
+                 --enable-clipart \
+                 --enable-templates \
                  --without-gnomevfs \
+                 --with-gtk2 \
                  --with-libwmf-config=${STAGING_DIR} \
 "
 
@@ -54,13 +50,7 @@ do_configure() {
     autotools_do_configure
 }
 
-do_install_append() {
-    install -d ${D}${datadir}/pixmaps/
-    mv ${D}${datadir}/icons/* ${D}${datadir}/pixmaps/
-    rmdir ${D}${datadir}/icons
-}
-
-PACKAGES += " ${PN}-clipart ${PN}-icons ${PN}-strings ${PN}-systemprofiles ${PN}-templates "
+PACKAGES += " ${PN}-clipart ${PN}-strings ${PN}-systemprofiles ${PN}-templates "
 
 FILES_${PN} += " \
                 ${libdir}/lib${PN}-*.so \
@@ -86,7 +76,7 @@ FILES_${PN} += " \
                 ${datadir}/${PN}-${SHRT_VER}/Pr*.xml \
 "
 
-# don't steal /usr/lib/libabiword-2.8.so from ${PN}
+# don't steal /usr/lib/libabiword-3.0.so from ${PN}
 # in this case it's needed in ${PN}
 FILES_${PN}-dev = " \
                   ${includedir} \
@@ -101,7 +91,6 @@ FILES_${PN}-doc += "${datadir}/${PN}-*/readme*"
 FILES_${PN}-strings        += "${datadir}/${PN}-${SHRT_VER}/strings"
 FILES_${PN}-systemprofiles += "${datadir}/${PN}-${SHRT_VER}/system.profile*"
 FILES_${PN}-clipart        += "${datadir}/${PN}-${SHRT_VER}/clipart"
-FILES_${PN}-icons          += "${datadir}/${PN}-${SHRT_VER}/icons"
 FILES_${PN}-strings        += "${datadir}/${PN}-${SHRT_VER}/AbiWord/strings"
 FILES_${PN}-systemprofiles += "${datadir}/${PN}-${SHRT_VER}/AbiWord/system.profile*"
 FILES_${PN}-templates      += "${datadir}/${PN}-${SHRT_VER}/templates"
@@ -109,7 +98,7 @@ FILES_${PN}-templates      += "${datadir}/${PN}-${SHRT_VER}/templates"
 PACKAGES_DYNAMIC += "^${PN}-meta.* ^${PN}-plugin-.*"
 
 python populate_packages_prepend () {
-    abiword_libdir    = d.expand('${libdir}/abiword-2.8/plugins')
+    abiword_libdir    = d.expand('${libdir}/${PN}-${SHRT_VER}/plugins')
     do_split_packages(d, abiword_libdir, '(.*)\.so$', 'abiword-plugin-%s', 'Abiword plugin for %s', extra_depends='')
 
     metapkg = "abiword-meta"
@@ -127,3 +116,5 @@ python populate_packages_prepend () {
     packages.append(metapkg)
     d.setVar('PACKAGES', ' '.join(packages))
 }
+
+FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
-- 
1.8.3.1


