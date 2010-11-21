Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PKJpe-0005la-NP
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 01:00:32 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id C8B96314AE9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id QmTNWGZRmfhB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:15 +0100 (CET)
Received: from pepe.multimedia-labs.de (dreamboxupdate.com [82.149.226.174])
	by mail.multimedia-labs.de (Postfix) with SMTP id 34833314AEA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 00:59:14 +0100 (CET)
Received: by pepe.multimedia-labs.de (sSMTP sendmail emulation);
	Sun, 21 Nov 2010 23:59:14 +0000
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Nov 2010 23:59:11 +0000
Message-Id: <1290383951-6683-3-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
References: <1290383951-6683-1-git-send-email-obi@opendreambox.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 3/3] swfdec: remove unused old recipes
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
X-List-Received-Date: Mon, 22 Nov 2010 00:00:33 -0000

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 recipes/swfdec/swfdec-mozilla_0.7.2.bb      |   21 -----------
 recipes/swfdec/swfdec-mozilla_0.7.4.bb      |   21 -----------
 recipes/swfdec/swfdec-mozilla_0.8.2.bb      |   24 ------------
 recipes/swfdec/swfdec/arm/jsautocfg.h       |   52 ---------------------------
 recipes/swfdec/swfdec/fix-cross-build.patch |   14 -------
 recipes/swfdec/swfdec_0.4.0.bb              |   20 ----------
 recipes/swfdec/swfdec_0.7.2.bb              |   27 --------------
 recipes/swfdec/swfdec_0.7.4.bb              |   25 -------------
 recipes/swfdec/swfdec_0.8.2.bb              |   23 ------------
 9 files changed, 0 insertions(+), 227 deletions(-)
 delete mode 100644 recipes/swfdec/swfdec-mozilla_0.7.2.bb
 delete mode 100644 recipes/swfdec/swfdec-mozilla_0.7.4.bb
 delete mode 100644 recipes/swfdec/swfdec-mozilla_0.8.2.bb
 delete mode 100644 recipes/swfdec/swfdec/arm/jsautocfg.h
 delete mode 100644 recipes/swfdec/swfdec/fix-cross-build.patch
 delete mode 100644 recipes/swfdec/swfdec_0.4.0.bb
 delete mode 100644 recipes/swfdec/swfdec_0.7.2.bb
 delete mode 100644 recipes/swfdec/swfdec_0.7.4.bb
 delete mode 100644 recipes/swfdec/swfdec_0.8.2.bb

diff --git a/recipes/swfdec/swfdec-mozilla_0.7.2.bb b/recipes/swfdec/swfdec-mozilla_0.7.2.bb
deleted file mode 100644
index 0f453aa..0000000
--- a/recipes/swfdec/swfdec-mozilla_0.7.2.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Swfdec plugin for browsers using NPAPI. Swfdec is a decoder/renderer for Macromedia Flash animations."
-LICENSE = "LGPL"
-
-PR = "r3"
-
-DEPENDS = "gst-ffmpeg swfdec gstreamer libsoup-2.4 pango cairo liboil zlib gtk+ alsa-lib \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-RDEPENDS_${PN} = "gst-ffmpeg"
-
-SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/${P}.tar.gz \
-"
-
-inherit autotools pkgconfig 
-
-FILES_${PN} += "${libdir}/mozilla/plugins/*.so"
-FILES_${PN}-dev += "${libdir}/mozilla/plugins/*a"
-FILES_${PN}-dbg += "${libdir}/mozilla/plugins/.debug"
-
-
-SRC_URI[md5sum] = "3bc6a49357b4b8b478ce3dfb4f007f18"
-SRC_URI[sha256sum] = "84962251e647fdcdcf111bef0c478f7d3679ae104267ba72e59ad749c6955cc2"
diff --git a/recipes/swfdec/swfdec-mozilla_0.7.4.bb b/recipes/swfdec/swfdec-mozilla_0.7.4.bb
deleted file mode 100644
index 4eb3ebb..0000000
--- a/recipes/swfdec/swfdec-mozilla_0.7.4.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Swfdec plugin for browsers using NPAPI. Swfdec is a decoder/renderer for Macromedia Flash animations."
-LICENSE = "LGPL"
-
-PR = "r2"
-
-DEPENDS = "gst-ffmpeg swfdec gstreamer libsoup-2.4 pango cairo liboil zlib gtk+ alsa-lib \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-RDEPENDS_${PN} = "gst-ffmpeg"
-
-SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/${P}.tar.gz \
-"
-
-inherit autotools pkgconfig 
-
-FILES_${PN} += "${libdir}/mozilla/plugins/*.so"
-FILES_${PN}-dev += "${libdir}/mozilla/plugins/*a"
-FILES_${PN}-dbg += "${libdir}/mozilla/plugins/.debug"
-
-
-SRC_URI[md5sum] = "c5958f3b003190b21977495021ac2b28"
-SRC_URI[sha256sum] = "0d7927f2e791321b2867c120eb4140d9017c59b77925eb909b2a03f3ef2a8fe4"
diff --git a/recipes/swfdec/swfdec-mozilla_0.8.2.bb b/recipes/swfdec/swfdec-mozilla_0.8.2.bb
deleted file mode 100644
index 5710b93..0000000
--- a/recipes/swfdec/swfdec-mozilla_0.8.2.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Swfdec plugin for browsers using NPAPI. Swfdec is a decoder/renderer for Macromedia Flash animations."
-LICENSE = "LGPL"
-
-DEPENDS = "swfdec glib-2.0"
-RDEPENDS_${PN} = "gst-ffmpeg"
-PR = "r1"
-
-SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.8/${P}.tar.gz \
-"
-
-inherit autotools pkgconfig gtk-icon-cache
-
-EXTRA_OECONF = "--disable-static"
-
-do_install_append() {
-	rm ${D}${libdir}/mozilla/plugins/*.la
-}
-
-FILES_${PN} += "${libdir}/mozilla/plugins/*.so"
-FILES_${PN}-dbg += "${libdir}/mozilla/plugins/.debug"
-
-
-SRC_URI[md5sum] = "716632e0d35b3c1582c180569ba30346"
-SRC_URI[sha256sum] = "49fd905f41b67832e7b2cfa2cf664657ab08f8fef4a2324e74202fc951396cd5"
diff --git a/recipes/swfdec/swfdec/arm/jsautocfg.h b/recipes/swfdec/swfdec/arm/jsautocfg.h
deleted file mode 100644
index 7e8171f..0000000
--- a/recipes/swfdec/swfdec/arm/jsautocfg.h
+++ /dev/null
@@ -1,52 +0,0 @@
-#ifndef js_cpucfg___
-#define js_cpucfg___
-
-/* AUTOMATICALLY GENERATED - DO NOT EDIT */
-
-#define IS_LITTLE_ENDIAN 1
-#undef  IS_BIG_ENDIAN
-
-#define JS_BYTES_PER_BYTE   1L
-#define JS_BYTES_PER_SHORT  2L
-#define JS_BYTES_PER_INT    4L
-#define JS_BYTES_PER_INT64  8L
-#define JS_BYTES_PER_LONG   4L
-#define JS_BYTES_PER_FLOAT  4L
-#define JS_BYTES_PER_DOUBLE 8L
-#define JS_BYTES_PER_WORD   4L
-#define JS_BYTES_PER_DWORD  8L
-
-#define JS_BITS_PER_BYTE    8L
-#define JS_BITS_PER_SHORT   16L
-#define JS_BITS_PER_INT     32L
-#define JS_BITS_PER_INT64   64L
-#define JS_BITS_PER_LONG    32L
-#define JS_BITS_PER_FLOAT   32L
-#define JS_BITS_PER_DOUBLE  64L
-#define JS_BITS_PER_WORD    32L
-
-#define JS_BITS_PER_BYTE_LOG2   3L
-#define JS_BITS_PER_SHORT_LOG2  4L
-#define JS_BITS_PER_INT_LOG2    5L
-#define JS_BITS_PER_INT64_LOG2  6L
-#define JS_BITS_PER_LONG_LOG2   5L
-#define JS_BITS_PER_FLOAT_LOG2  5L
-#define JS_BITS_PER_DOUBLE_LOG2 6L
-#define JS_BITS_PER_WORD_LOG2   5L
-
-#define JS_ALIGN_OF_SHORT   2L
-#define JS_ALIGN_OF_INT     4L
-#define JS_ALIGN_OF_LONG    4L
-#define JS_ALIGN_OF_INT64   8L
-#define JS_ALIGN_OF_FLOAT   4L
-#define JS_ALIGN_OF_DOUBLE  8L
-#define JS_ALIGN_OF_POINTER 4L
-#define JS_ALIGN_OF_WORD    4L
-
-#define JS_BYTES_PER_WORD_LOG2   2L
-#define JS_BYTES_PER_DWORD_LOG2  3L
-#define JS_WORDS_PER_DWORD_LOG2  1L
-
-#define JS_STACK_GROWTH_DIRECTION (-1)
-
-#endif /* js_cpucfg___ */
diff --git a/recipes/swfdec/swfdec/fix-cross-build.patch b/recipes/swfdec/swfdec/fix-cross-build.patch
deleted file mode 100644
index d83e66a..0000000
--- a/recipes/swfdec/swfdec/fix-cross-build.patch
+++ /dev/null
@@ -1,14 +0,0 @@
---- /tmp/Makefile.am	2006-12-29 18:42:25.000000000 +0100
-+++ swfdec-0.4.0/libswfdec/js/Makefile.am	2006-12-29 18:42:47.522227000 +0100
-@@ -93,11 +93,4 @@
- 	-DXP_UNIX -DDEBUG -fno-strict-aliasing
- libjs_la_LDFLAGS = -lm
- 
--CLEANFILES = jsautocfg.h
--
--jsapi.c: jsautocfg.h
--
--jsautocfg.h: jscpucfg
--	./jscpucfg >jsautocfg.h
--
- 
diff --git a/recipes/swfdec/swfdec_0.4.0.bb b/recipes/swfdec/swfdec_0.4.0.bb
deleted file mode 100644
index 570ac57..0000000
--- a/recipes/swfdec/swfdec_0.4.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Swfdec is a decoder/renderer for Macromedia Flash animations."
-LICENSE = "LGPL"
-
-DEPENDS = "pango cairo liboil zlib gtk+ alsa-lib \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-PR = "r1"
-
-SRC_URI = "http://swfdec.freedesktop.org/download/swfdec/0.4/${P}.tar.gz \
-           file://jsautocfg.h \
-	   file://fix-cross-build.patch"
-
-inherit autotools pkgconfig lib_package
-
-do_configure_append() {
-	cp -f ${WORKDIR}/jsautocfg.h ${S}/libswfdec/js
-}
-
-
-SRC_URI[md5sum] = "157d31c9dc02aa22b5f27323e5a203fc"
-SRC_URI[sha256sum] = "c31d3bbee984c7971d2b24cddc279d8ad65edff8216778d617484c147ba3ae3d"
diff --git a/recipes/swfdec/swfdec_0.7.2.bb b/recipes/swfdec/swfdec_0.7.2.bb
deleted file mode 100644
index 3fcfa2f..0000000
--- a/recipes/swfdec/swfdec_0.7.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Swfdec is a decoder/renderer for Macromedia Flash animations."
-LICENSE = "LGPL"
-
-DEPENDS = "gstreamer libsoup-2.4 pango cairo liboil zlib gtk+ alsa-lib \
-           ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad', d)}"
-PR = "r1"
-
-SRC_URI = "http://swfdec.freedesktop.org/download/swfdec/0.7/${P}.tar.gz \
-"
-
-inherit autotools pkgconfig 
-
-do_install_append() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
-}
-
-PACKAGES =+ "libswfdecgtk libswfdec"
-
-FILES_${PN} += "${datadir}/icons"
-FILES_libswfdec = "${libdir}/libswfdec-0.7.so.*"
-FILES_libswfdecgtk = "${libdir}/libswfdec-gtk-0.7.so*"
-
-
-
-SRC_URI[md5sum] = "7624b5642c947fb054273f091a1d970c"
-SRC_URI[sha256sum] = "c6b2ee967ae04776fd60a47dc283570917e387dbcffc907a0dfc91f567c139f7"
diff --git a/recipes/swfdec/swfdec_0.7.4.bb b/recipes/swfdec/swfdec_0.7.4.bb
deleted file mode 100644
index 874bb11..0000000
--- a/recipes/swfdec/swfdec_0.7.4.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "Swfdec is a decoder/renderer for Macromedia Flash animations."
-LICENSE = "LGPL"
-
-DEPENDS = "gstreamer libsoup-2.4 pango cairo liboil zlib libmad gtk+ alsa-lib"
-
-SRC_URI = "http://swfdec.freedesktop.org/download/swfdec/0.7/${P}.tar.gz \
-"
-
-inherit autotools pkgconfig 
-
-do_install_append() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
-}
-
-PACKAGES =+ "libswfdecgtk libswfdec"
-
-FILES_${PN} += "${datadir}/icons"
-FILES_libswfdec = "${libdir}/libswfdec-0.7.so.*"
-FILES_libswfdecgtk = "${libdir}/libswfdec-gtk-0.7.so*"
-
-
-
-SRC_URI[md5sum] = "08fcda4a46454bfc66b97fba2d385f8c"
-SRC_URI[sha256sum] = "4345da2a4790125bd7205bd10a3326bf94e36f97229850b99ec9e8f050a9ab4a"
diff --git a/recipes/swfdec/swfdec_0.8.2.bb b/recipes/swfdec/swfdec_0.8.2.bb
deleted file mode 100644
index 9c65dba..0000000
--- a/recipes/swfdec/swfdec_0.8.2.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Swfdec is a decoder/renderer for Macromedia Flash animations."
-LICENSE = "LGPL"
-
-DEPENDS = "gstreamer gst-plugins-base libsoup-2.4 pango cairo liboil zlib gtk+ alsa-lib"
-
-SRC_URI = "http://swfdec.freedesktop.org/download/swfdec/0.8/${P}.tar.gz \
-"
-
-inherit autotools pkgconfig 
-
-EXTRA_OECONF = "--disable-static"
-
-do_install_append() {
-	install -d ${D}/${bindir}
-	install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
-}
-
-PACKAGES =+ "libswfdecgtk libswfdec"
-FILES_libswfdec = "${libdir}/libswfdec-0.8.so.*"
-FILES_libswfdecgtk = "${libdir}/libswfdec-gtk-0.8.so.*"
-
-SRC_URI[md5sum] = "2fb20b04c0e426a1e894a4c4bf22cf87"
-SRC_URI[sha256sum] = "10fd6f07264d3fbd92c03858a99637cd4b9d98ab00fb4d31720adce0c1ed7af4"
-- 
1.7.1



