Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f65.google.com (mail-qg0-f65.google.com
	[209.85.192.65])
	by mail.openembedded.org (Postfix) with ESMTP id 40F3A6FFA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 13:33:09 +0000 (UTC)
Received: by mail-qg0-f65.google.com with SMTP id 78so1641816qgt.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 06:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=67/uYJi0yhi3TGormYS62SBprkfQXpmyn1WFXNKLsQY=;
	b=IGyk8TFc5FYNgSg+wE1lfs+21ZcT0HbYlTqypA5Qhnhq2c0zatcde2/Lgsn5BDnqKV
	gqyOYKg8PIZ4jnHyExQ6Vu2scvMKYIWjJde/XGQl2Q6iyE3IRlX3uohQmCsWtQ/vP2W5
	epGPBNL513S8wvtzHWmNCzbgAqxJw7Zv4ktf1VD4RsTh59PyLGLtGHWh3VQ0MGlAduZS
	j/XCGTrWHonB7Oehi7va4n4lsqReFFdgWhbDSFfiutP+30ySevy05TyWVotd3EGX56T5
	j1toGrXUKJ8cgwhnh5NXdRPsNe7Iq/pxcdBJ46cCml2J2ebEp7FmHUN/TcqtiR1elSMj
	PKww==
X-Gm-Message-State: ALyK8tKWjIJKkjoIEGJQyy6fJaHvoYGk+Canle/bN7yVFuDBU4AlyjR6Sxpz0us/d6eaMA==
X-Received: by 10.140.236.83 with SMTP id h80mr20282122qhc.97.1465997590086;
	Wed, 15 Jun 2016 06:33:10 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168]) by smtp.gmail.com with ESMTPSA id
	f41sm9654568qtf.41.2016.06.15.06.33.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 06:33:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 09:33:00 -0400
Message-Id: <1465997580-28046-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] v4l-utils: correct compatibility issues with libjpeg-turbo-1.5.0
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
X-List-Received-Date: Wed, 15 Jun 2016 13:33:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../0002-correct-jpeg-memsrcdest-support.patch     | 27 ++++++++++++++++++++++
 .../recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb |  5 +---
 2 files changed, 28 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-correct-jpeg-memsrcdest-support.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-correct-jpeg-memsrcdest-support.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-correct-jpeg-memsrcdest-support.patch
new file mode 100644
index 0000000..d3aa1bd
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/0002-correct-jpeg-memsrcdest-support.patch
@@ -0,0 +1,27 @@
+--- v4l-utils-1.6.2/lib/libv4lconvert/jpeg_memsrcdest.h.orig	2016-06-15 09:22:29.765751407 -0400
++++ v4l-utils-1.6.2/lib/libv4lconvert/jpeg_memsrcdest.h	2016-06-15 09:22:47.153751055 -0400
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
+--- v4l-utils-1.6.2/lib/libv4lconvert/jpeg_memsrcdest.c.orig	2016-06-15 09:23:03.825750717 -0400
++++ v4l-utils-1.6.2/lib/libv4lconvert/jpeg_memsrcdest.c	2016-06-15 09:23:12.817750535 -0400
+@@ -27,7 +27,7 @@
+ 
+ /* libjpeg8 and later come with their own (API compatible) memory source
+    and dest */
+-#if JPEG_LIB_VERSION < 80
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
+ /* Expanded data source object for memory input */
+ 
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index 1141bff..81babdb 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
            file://mediactl-pkgconfig.patch \
            file://export-mediactl-headers.patch \
+           file://0002-correct-jpeg-memsrcdest-support.patch \
           "
 SRC_URI[md5sum] = "9cb3c178f937954e65bf30920af433ef"
 SRC_URI[sha256sum] = "d3d6eb1f0204fb11f3d318bfca35d5f73cc077f88fac7665a47856a16496be7d"
@@ -43,7 +44,3 @@ FILES_libv4l-dbg += "${libdir}/libv4l/.debug ${libdir}/libv4l/plugins/.debug"
 FILES_libv4l-dev += "${includedir} ${libdir}/pkgconfig \
                      ${libdir}/libv4l*${SOLIBSDEV} ${libdir}/*.la \
                      ${libdir}/v4l*${SOLIBSDEV} ${libdir}/libv4l/*.la ${libdir}/libv4l/plugins/*.la"
-
-# | ../../../v4l-utils-1.6.2/lib/libv4lconvert/jpeg_memsrcdest.h:4:1: error: conflicting types for 'jpeg_mem_src'
-# |  jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
-PNBLACKLIST[v4l-utils] ?= "Not compatible with libjpeg-turbo-1.5.0"
-- 
1.9.1


