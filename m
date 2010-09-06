Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OsTMq-0007Nb-41
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 06:31:55 +0200
Received: by mail-px0-f175.google.com with SMTP id 11so930229pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Sep 2010 21:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=nlnNdbIBGy64o2zvdILm8evUK177zc0617MRTSFjWDE=;
	b=f9ivsSoH4Sy/CsRQW4EZECv8RIK64dpKXr+l9llBHRipugNMNwi57be62tTcDGd32O
	sg3F9DU+0cpOpOFifVwCkzCSLCX7rjgR/520dnwJuS9dwj4suRYHXIFjvwT4uRw2kOXB
	rzTx/23zt3eib/5InsLXn1ABF3tixO//C+7s8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=t6PdzHNeSbhosaiJ5XJViqqjsgevfvUyIRZqZ0rOaeGcrmsMDI1KX/2WktpfZlMeWW
	XN56ThutYQbPOJQbJSwTKAWLMOyKxs6o07FFtxUmTt83jNB4rXGyDmHVQ1wefZ8uPeZy
	EZr6r/21bgIz6PlIuRSNyeKgxRb+mQ0tgKeCU=
Received: by 10.142.164.18 with SMTP id m18mr2104594wfe.219.1283747462633;
	Sun, 05 Sep 2010 21:31:02 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	n36sm3626845wfa.16.2010.09.05.21.31.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 05 Sep 2010 21:31:02 -0700 (PDT)
Message-ID: <4C846E82.6060204@gmail.com>
Date: Mon, 06 Sep 2010 14:00:58 +0930
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100721 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] mupdf_0.6.bb: remove recipe.
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
X-List-Received-Date: Mon, 06 Sep 2010 04:32:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

This is now an old release. Much better to use git version instead,
as the release tarballs get moved once a new release occurs.

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/mupdf/mupdf-0.6/Makerules                  |    8 --
 recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch |   90 --------------------
 recipes/mupdf/mupdf_0.6.bb                         |   62 --------------
 3 files changed, 0 insertions(+), 160 deletions(-)
 delete mode 100644 recipes/mupdf/mupdf-0.6/Makerules
 delete mode 100644 recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch
 delete mode 100644 recipes/mupdf/mupdf_0.6.bb

diff --git a/recipes/mupdf/mupdf-0.6/Makerules b/recipes/mupdf/mupdf-0.6/Makerules
deleted file mode 100644
index 5f3d4e2..0000000
--- a/recipes/mupdf/mupdf-0.6/Makerules
+++ /dev/null
@@ -1,8 +0,0 @@
-# Configuration for the Makefile
-LIBS := -ljbig2dec -lopenjpeg -ljpeg -lz -lm
-CFLAGS := -Wall --std=gnu99 -Ifitz -Imupdf $(THIRD_INCS)
-
-CFLAGS += `pkg-config --cflags freetype2`
-LDFLAGS += `pkg-config --libs freetype2`
-X11LIBS = -lX11 -lXext
-PDFVIEW_EXE = $(X11VIEW_EXE)
diff --git a/recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch b/recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch
deleted file mode 100644
index 056e145..0000000
--- a/recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-Patch from upstream darcs repository, see this bugzilla entry for details:
-http://bugs.ghostscript.com/show_bug.cgi?id=690932
-
-Wed Jun 16 10:29:54 UTC 2010  tor@ghostscript.com
-  * Do runtime endianness test instead of relying on unreliable preprocessor macros.
-diff -rN -u old-mupdf/apps/x11_image.c new-mupdf-1/apps/x11_image.c
---- old-mupdf/apps/x11_image.c	2010-06-16 12:33:35.000000000 +0000
-+++ new-mupdf-1/apps/x11_image.c	2010-06-16 12:33:35.000000000 +0000
-@@ -10,7 +10,7 @@
- # define _XOPEN_SOURCE 1
- #endif
- 
--#include <fitz.h>
-+#include "fitz.h"
- 
- #include <X11/Xlib.h>
- #include <X11/Xutil.h>
-@@ -205,11 +205,10 @@
- 	unsigned long rs, gs, bs;
- 
- 	byteorder = ImageByteOrder(info.display);
--#if BYTE_ORDER == BIG_ENDIAN
--	byterev = byteorder != MSBFirst;
--#else
--	byterev = byteorder != LSBFirst;
--#endif
-+	if (fz_isbigendian())
-+		byterev = byteorder != MSBFirst;
-+	else
-+		byterev = byteorder != LSBFirst;
- 
- 	rm = info.visual.red_mask;
- 	gm = info.visual.green_mask;
-diff -rN -u old-mupdf/draw/imageunpack.c new-mupdf-1/draw/imageunpack.c
---- old-mupdf/draw/imageunpack.c	2010-06-16 12:33:35.000000000 +0000
-+++ new-mupdf-1/draw/imageunpack.c	2010-06-16 12:33:36.000000000 +0000
-@@ -31,6 +31,12 @@
- 		justinvert &= min[i] == 255 && max[i] == 0 && sub[i] == -255;
- 	}
- 
-+	unsigned mask;
-+	if (fz_isbigendian())
-+		mask = 0x00ff00ff;
-+	else
-+		mask = 0xff00ff00;
-+
- 	if (!needed)
- 		return;
- 
-@@ -51,11 +57,7 @@
- 				wh = wh - 2 * hwh;
- 				while(hwh--) {
- 					unsigned in = *wp;
--#if BYTE_ORDER == LITTLE_ENDIAN
--					unsigned out = in ^ 0xff00ff00;
--#else
--					unsigned out = in ^ 0x00ff00ff;
--#endif
-+					unsigned out = in ^ mask;
- 					*wp++ = out;
- 				}
- 				p = (byte *)wp;
-diff -rN -u old-mupdf/fitz/base_cpudep.c new-mupdf-1/fitz/base_cpudep.c
---- old-mupdf/fitz/base_cpudep.c	2010-06-16 12:33:35.000000000 +0000
-+++ new-mupdf-1/fitz/base_cpudep.c	2010-06-16 12:33:36.000000000 +0000
-@@ -10,6 +10,12 @@
- /* global run-time constant */
- unsigned fz_cpuflags = 0;
- 
-+int fz_isbigendian(void)
-+{
-+	static const int one = 1;
-+	return *(char*)&one == 0;
-+}
-+
- #ifndef HAVE_CPUDEP
- 
- void fz_cpudetect(void)
-diff -rN -u old-mupdf/fitz/fitz_base.h new-mupdf-1/fitz/fitz_base.h
---- old-mupdf/fitz/fitz_base.h	2010-06-16 12:33:35.000000000 +0000
-+++ new-mupdf-1/fitz/fitz_base.h	2010-06-16 12:33:36.000000000 +0000
-@@ -86,6 +86,8 @@
- /* treat as constant! */
- extern unsigned fz_cpuflags;
- 
-+int fz_isbigendian(void);
-+
- /*
-  * Base Fitz runtime.
-  */
diff --git a/recipes/mupdf/mupdf_0.6.bb b/recipes/mupdf/mupdf_0.6.bb
deleted file mode 100644
index 16d49d8..0000000
--- a/recipes/mupdf/mupdf_0.6.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-DESCRIPTION = "A lightweight PDF viewer and toolkit written in portable C."
-HOMEPAGE = "http://www.mupdf.com"
-SECTION = "x11/applications"
-LICENSE = "GPLv3"
-PR = "r0"
-
-DEPENDS = "openjpeg-native jbig2dec-native jpeg-native freetype-native libpng-native openjpeg jbig2dec jpeg zlib virtual/libx11 libxext freetype"
-
-SRC_URI = "http://mupdf.com/download/source/${PN}-${PV}.tar.gz \
-           file://mupdf_fix_endianness.patch \
-           file://Makerules"
-
-S = "${WORKDIR}/mupdf"
-
-PACKAGES =+ "${PN}-tools ${PN}-tools-doc "
-FILES_${PN}-tools = "${bindir}/pdfclean ${bindir}/pdfdraw ${bindir}/pdfshow \
-                     ${bindir}/pdfextract ${bindir}/pdfinfo"
-FILES_${PN}-tools-doc = "${mandir}/man1/pdfclean.1 ${mandir}/man1/pdfdraw.1 \
-                         ${mandir}/man1/pdfshow.1"
-
-# mupdf crashes (at least on arm) when built with high level of optimization
-# so we need to provide some safe settings
-FULL_OPTIMIZATION = "-O2"
-
-do_configure() {
-    cp ${WORKDIR}/Makerules ${S}/Makerules
-
-    # we don't include CJK fonts to make binary more slim
-    # comment out following two lines if you need support for CJK
-    sed -i 's:^\t\$.GENDIR./font_cjk.c::g' ${S}/Makefile
-    echo "CFLAGS += -DNOCJK" >> ${S}/Makerules
-}
-
-do_compile() {
-    # mupdf uses couple of tools for code generation during build process
-    # so we need to compile them first with host compiler
-    unset CFLAGS LDFLAGS
-    export PKG_CONFIG_PATH=${STAGING_LIBDIR_NATIVE}/pkgconfig
-    oe_runmake build/debug
-    oe_runmake build/debug/cmapdump LD="${BUILD_CC} -L${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE}" CC=${BUILD_CC}
-    oe_runmake build/debug/fontdump LD="${BUILD_CC} -L${STAGING_LIBDIR_NATIVE} -Wl,-rpath,${STAGING_LIBDIR_NATIVE}" CC=${BUILD_CC}
-
-    export PKG_CONFIG_PATH=${STAGING_LIBDIR}/pkgconfig
-    # ...and then we fire 'make', feeding proper
-    # cross-compilation flags through Makerules file
-    echo "CFLAGS += ${CFLAGS}" >> ${S}/Makerules
-    echo "LDFLAGS += ${LDFLAGS}" >> ${S}/Makerules
-    oe_runmake LD="${CC}"
-}
-
-do_install() {
-    oe_runmake install prefix="${D}/usr"
-    install -d ${D}/${datadir}/applications
-    install -d ${D}/${datadir}/pixmaps
-    install -d ${D}/${mandir}/man1
-    install -m 0644 ${S}/debian/mupdf.xpm ${D}/${datadir}/pixmaps/
-    install -m 0644 ${S}/debian/mupdf.desktop ${D}/${datadir}/applications/
-    install -m 0644 ${S}/debian/*.1 ${D}/${mandir}/man1/
-}
-
-SRC_URI[md5sum] = "d1e1a1df8fb3e4d1c601506797b75036"
-SRC_URI[sha256sum] = "6f87c4f113ee9e0f4bdfd3a316ef44052edc4febc8f7b531c4a3f44ffe149605"
-- 
1.7.1



