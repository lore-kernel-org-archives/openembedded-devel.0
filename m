Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF7E16B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:18:26 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a186so2462210qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 06:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RLfP846oeUhuLrK6OsCTpS3/kL82A8up/3kTAk70mJk=;
	b=M/3bEtpwesIfP0Qo8Oy030J/3C05QOpv98HHeDdt/pugZr3MPu+olTBuK6dKbacypw
	WW5/YmCwBfqKq47buJYZWXiRrVp2xAtxyA4zkOeNgihy2UVtAXO5qw93H6PwHTio199o
	FqTA1nBGCkMoOcqpcbff9ILhenZoNzdcfWPJV6hclpgjx5eT0t8riVE4CvjW/xw5uYaN
	C1fcPNjUocFUBSBMbpoRtm6e8LDhKCaXJEK3Tkx+F3PSOSdVxdhB4Rx2r1c+wRzV+s3Z
	mCV8RDdg656abbW24h4VYZ8HG3dxAjze32zfGCik2n9kPSVL9X4Ewf7aE5qE3qQUTuNK
	LFIg==
X-Gm-Message-State: ALyK8tK+nBPGu0ON9kC39pfy6dyx9bRCETOvkjsdaV5irGGgx3Nhe9MGJ8GiPVIqYXGp0Q==
X-Received: by 10.55.126.7 with SMTP id z7mr24553879qkc.137.1465996707208;
	Wed, 15 Jun 2016 06:18:27 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id e3sm9558871qtb.44.2016.06.15.06.18.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 06:18:26 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 09:18:02 -0400
Message-Id: <1465996682-6163-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] libgphoto2: correct compatibility issues with libjpeg-turbo-1.5.0
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
X-List-Received-Date: Wed, 15 Jun 2016 13:18:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../0002-correct-jpeg-memsrcdest-support.patch     | 54 ++++++++++++++++++++++
 .../recipes-graphics/gphoto2/libgphoto2_2.5.8.bb   |  5 +-
 2 files changed, 55 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch
new file mode 100644
index 0000000..cf2d86d
--- /dev/null
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2-2.5.8/0002-correct-jpeg-memsrcdest-support.patch
@@ -0,0 +1,54 @@
+--- libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.h.orig	2016-06-15 09:03:20.625774684 -0400
++++ libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.h	2016-06-15 09:03:47.049774148 -0400
+@@ -1,5 +1,7 @@
+ #include <jpeglib.h>
+ 
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+@@ -7,3 +9,5 @@
+ void
+ jpeg_mem_dest (j_compress_ptr cinfo, unsigned char ** outbuffer,
+ 	unsigned long * outsize);
++
++#endif
+--- libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.c.orig	2016-06-15 09:03:58.689773913 -0400
++++ libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.c	2016-06-15 09:04:17.769773526 -0400
+@@ -26,7 +26,7 @@
+ 
+ /* libjpeg8 and later come with their own (API compatible) memory source
+    and dest */
+-#if JPEG_LIB_VERSION < 80
++#if JPEG_LIB_VERSION < 80  && !defined(MEM_SRCDST_SUPPORTED)
+ 
+ /* Expanded data source object for memory input */
+ 
+--- libgphoto2-2.5.8/camlibs/jl2005c/jpeg_memsrcdest.h.orig	2016-06-15 09:05:01.893772632 -0400
++++ libgphoto2-2.5.8/camlibs/jl2005c/jpeg_memsrcdest.h	2016-06-15 09:05:17.433772318 -0400
+@@ -1,5 +1,7 @@
+ #include <jpeglib.h>
+ 
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+@@ -7,3 +9,5 @@
+ void
+ jpeg_mem_dest (j_compress_ptr cinfo, unsigned char ** outbuffer,
+ 	unsigned long * outsize);
++
++#endif
+--- libgphoto2-2.5.8/camlibs/jl2005c/jpeg_memsrcdest.c.orig	2016-06-15 09:04:42.641773022 -0400
++++ libgphoto2-2.5.8/camlibs/jl2005c/jpeg_memsrcdest.c	2016-06-15 09:04:48.657772901 -0400
+@@ -26,7 +26,7 @@
+ 
+ /* libjpeg8 and later come with their own (API compatible) memory source
+    and dest */
+-#if JPEG_LIB_VERSION < 80
++#if JPEG_LIB_VERSION < 80  && !defined(MEM_SRCDST_SUPPORTED)
+ 
+ /* Expanded data source object for memory input */
+ 
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
index f0e8b13..dde14ad 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
@@ -14,6 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/libgphoto2-${PV}.tar.bz2;name=libgphoto2
            file://10-camera-libgphoto2.fdi \
            file://40-libgphoto2.rules \
            file://0001-configure.ac-remove-AM_PO_SUBDIRS.patch \
+           file://0002-correct-jpeg-memsrcdest-support.patch \
 "
 
 SRC_URI[libgphoto2.md5sum] = "873ab01aced49c6b92a98e515db5dcef"
@@ -52,7 +53,3 @@ FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 FILES_${PN} += "${nonarch_base_libdir}/udev/* ${datadir}/hal"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 FILES_${PN}-dev += "${libdir}/*/*/*.la"
-
-# | ../../libgphoto2-2.5.8/camlibs/ax203/jpeg_memsrcdest.h:4:1: error: conflicting types for 'jpeg_mem_src'
-# |  jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
-PNBLACKLIST[libgphoto2] ?= "Not compatible with libjpeg-turbo-1.5.0"
-- 
1.9.1


