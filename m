Received: from mail.asoft.ru ([91.205.86.207])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1ORTOB-0006Pc-AD
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 19:05:56 +0200
Received: from lighthouse.office.asoft.ru (office.asoft.ru [62.205.175.245])
	(authenticated bits=0)
	by mail.asoft.ru (8.14.3/8.14.3) with ESMTP id o5NH0dGI028612
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 21:00:48 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Jun 2010 21:00:38 +0400
Message-Id: <1277312438-326-4-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1277312438-326-1-git-send-email-mad_soft@inbox.ru>
References: <1277312438-326-1-git-send-email-mad_soft@inbox.ru>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.2.3
	(mail.asoft.ru [91.205.86.207]);
	Wed, 23 Jun 2010 21:00:48 +0400 (MSD)
X-SA-Exim-Connect-IP: 91.205.86.207
X-SA-Exim-Mail-From: mad_soft@inbox.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] mupdf-0.6: new recipe
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
X-List-Received-Date: Wed, 23 Jun 2010 17:06:13 -0000

MuPDF is a slim and fast PDF viewer/toolkit.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 recipes/mupdf/mupdf-0.6/Makerules                  |    8 ++
 recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch |   90 ++++++++++++++++++++
 recipes/mupdf/mupdf_0.6.bb                         |   60 +++++++++++++
 3 files changed, 158 insertions(+), 0 deletions(-)
 create mode 100644 recipes/mupdf/mupdf-0.6/Makerules
 create mode 100644 recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch
 create mode 100644 recipes/mupdf/mupdf_0.6.bb

diff --git a/recipes/mupdf/mupdf-0.6/Makerules b/recipes/mupdf/mupdf-0.6/Makerules
new file mode 100644
index 0000000..5f3d4e2
--- /dev/null
+++ b/recipes/mupdf/mupdf-0.6/Makerules
@@ -0,0 +1,8 @@
+# Configuration for the Makefile
+LIBS := -ljbig2dec -lopenjpeg -ljpeg -lz -lm
+CFLAGS := -Wall --std=gnu99 -Ifitz -Imupdf $(THIRD_INCS)
+
+CFLAGS += `pkg-config --cflags freetype2`
+LDFLAGS += `pkg-config --libs freetype2`
+X11LIBS = -lX11 -lXext
+PDFVIEW_EXE = $(X11VIEW_EXE)
diff --git a/recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch b/recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch
new file mode 100644
index 0000000..056e145
--- /dev/null
+++ b/recipes/mupdf/mupdf-0.6/mupdf_fix_endianness.patch
@@ -0,0 +1,90 @@
+Patch from upstream darcs repository, see this bugzilla entry for details:
+http://bugs.ghostscript.com/show_bug.cgi?id=690932
+
+Wed Jun 16 10:29:54 UTC 2010  tor@ghostscript.com
+  * Do runtime endianness test instead of relying on unreliable preprocessor macros.
+diff -rN -u old-mupdf/apps/x11_image.c new-mupdf-1/apps/x11_image.c
+--- old-mupdf/apps/x11_image.c	2010-06-16 12:33:35.000000000 +0000
++++ new-mupdf-1/apps/x11_image.c	2010-06-16 12:33:35.000000000 +0000
+@@ -10,7 +10,7 @@
+ # define _XOPEN_SOURCE 1
+ #endif
+ 
+-#include <fitz.h>
++#include "fitz.h"
+ 
+ #include <X11/Xlib.h>
+ #include <X11/Xutil.h>
+@@ -205,11 +205,10 @@
+ 	unsigned long rs, gs, bs;
+ 
+ 	byteorder = ImageByteOrder(info.display);
+-#if BYTE_ORDER == BIG_ENDIAN
+-	byterev = byteorder != MSBFirst;
+-#else
+-	byterev = byteorder != LSBFirst;
+-#endif
++	if (fz_isbigendian())
++		byterev = byteorder != MSBFirst;
++	else
++		byterev = byteorder != LSBFirst;
+ 
+ 	rm = info.visual.red_mask;
+ 	gm = info.visual.green_mask;
+diff -rN -u old-mupdf/draw/imageunpack.c new-mupdf-1/draw/imageunpack.c
+--- old-mupdf/draw/imageunpack.c	2010-06-16 12:33:35.000000000 +0000
++++ new-mupdf-1/draw/imageunpack.c	2010-06-16 12:33:36.000000000 +0000
+@@ -31,6 +31,12 @@
+ 		justinvert &= min[i] == 255 && max[i] == 0 && sub[i] == -255;
+ 	}
+ 
++	unsigned mask;
++	if (fz_isbigendian())
++		mask = 0x00ff00ff;
++	else
++		mask = 0xff00ff00;
++
+ 	if (!needed)
+ 		return;
+ 
+@@ -51,11 +57,7 @@
+ 				wh = wh - 2 * hwh;
+ 				while(hwh--) {
+ 					unsigned in = *wp;
+-#if BYTE_ORDER == LITTLE_ENDIAN
+-					unsigned out = in ^ 0xff00ff00;
+-#else
+-					unsigned out = in ^ 0x00ff00ff;
+-#endif
++					unsigned out = in ^ mask;
+ 					*wp++ = out;
+ 				}
+ 				p = (byte *)wp;
+diff -rN -u old-mupdf/fitz/base_cpudep.c new-mupdf-1/fitz/base_cpudep.c
+--- old-mupdf/fitz/base_cpudep.c	2010-06-16 12:33:35.000000000 +0000
++++ new-mupdf-1/fitz/base_cpudep.c	2010-06-16 12:33:36.000000000 +0000
+@@ -10,6 +10,12 @@
+ /* global run-time constant */
+ unsigned fz_cpuflags = 0;
+ 
++int fz_isbigendian(void)
++{
++	static const int one = 1;
++	return *(char*)&one == 0;
++}
++
+ #ifndef HAVE_CPUDEP
+ 
+ void fz_cpudetect(void)
+diff -rN -u old-mupdf/fitz/fitz_base.h new-mupdf-1/fitz/fitz_base.h
+--- old-mupdf/fitz/fitz_base.h	2010-06-16 12:33:35.000000000 +0000
++++ new-mupdf-1/fitz/fitz_base.h	2010-06-16 12:33:36.000000000 +0000
+@@ -86,6 +86,8 @@
+ /* treat as constant! */
+ extern unsigned fz_cpuflags;
+ 
++int fz_isbigendian(void);
++
+ /*
+  * Base Fitz runtime.
+  */
diff --git a/recipes/mupdf/mupdf_0.6.bb b/recipes/mupdf/mupdf_0.6.bb
new file mode 100644
index 0000000..bcd8534
--- /dev/null
+++ b/recipes/mupdf/mupdf_0.6.bb
@@ -0,0 +1,60 @@
+DESCRIPTION = "A lightweight PDF viewer and toolkit written in portable C."
+HOMEPAGE = "http://www.mupdf.com"
+SECTION = "x11/applications"
+LICENSE = "GPLv3"
+PR = "r0"
+
+DEPENDS = "openjpeg jbig2dec jpeg zlib virtual/libx11 libxext freetype"
+
+SRC_URI = "http://mupdf.com/download/source/${PN}-${PV}-source.tar.gz \
+           file://mupdf_fix_endianness.patch \
+           file://Makerules"
+
+S = "${WORKDIR}/mupdf"
+
+PACKAGES =+ "${PN}-tools ${PN}-tools-doc "
+FILES_${PN}-tools = "${bindir}/pdfclean ${bindir}/pdfdraw ${bindir}/pdfshow \
+                     ${bindir}/pdfextract ${bindir}/pdfinfo"
+FILES_${PN}-tools-doc = "${mandir}/man1/pdfclean.1 ${mandir}/man1/pdfdraw.1 \
+                         ${mandir}/man1/pdfshow.1"
+
+# mupdf crashes (at least on arm) when built with high level of optimization
+# so we need to provide some safe settings
+FULL_OPTIMIZATION = "-O2"
+
+do_configure() {
+    cp ${WORKDIR}/Makerules ${S}/Makerules
+
+    # we don't include CJK fonts to make binary more slim
+    # comment out following two lines if you need support for CJK
+    sed -i 's:^\t\$.GENDIR./font_cjk.c::g' ${S}/Makefile
+    echo "CFLAGS += -DNOCJK" >> ${S}/Makerules
+}
+
+do_compile() {
+    # mupdf uses couple of tools for code generation during build process
+    # so we need to compile them first with host compiler
+    unset CFLAGS LDFLAGS
+    oe_runmake build/debug
+    oe_runmake build/debug/cmapdump LD=${BUILD_CC} CC=${BUILD_CC}
+    oe_runmake build/debug/fontdump LD=${BUILD_CC} CC=${BUILD_CC}
+
+    # ...and then we fire 'make', feeding proper
+    # cross-compilation flags through Makerules file
+    echo "CFLAGS += ${CFLAGS}" >> ${S}/Makerules
+    echo "LDFLAGS += ${LDFLAGS}" >> ${S}/Makerules
+    oe_runmake LD="${CC}"
+}
+
+do_install() {
+    oe_runmake install prefix="${D}/usr"
+    install -d ${D}/${datadir}/applications
+    install -d ${D}/${datadir}/pixmaps
+    install -d ${D}/${mandir}/man1
+    install -m 0644 ${S}/debian/mupdf.xpm ${D}/${datadir}/pixmaps/
+    install -m 0644 ${S}/debian/mupdf.desktop ${D}/${datadir}/applications/
+    install -m 0644 ${S}/debian/*.1 ${D}/${mandir}/man1/
+}
+
+SRC_URI[md5sum] = "d1e1a1df8fb3e4d1c601506797b75036"
+SRC_URI[sha256sum] = "6f87c4f113ee9e0f4bdfd3a316ef44052edc4febc8f7b531c4a3f44ffe149605"
-- 
1.7.1



