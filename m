Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 691FC7318D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 15:08:14 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id e5so24223889ith.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2016 08:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nDAflNv9n+0Fa3d+/4DdrVBv0TXJamJigPIbRF/Yoc4=;
	b=tGnCkb+M6pBnmZk02ftmOYH4YmsuUKE4WM/C4QuzTNQuhJhQKMxWt0nFgBt+LAZLYI
	FZJLlVfobDhLbGdq/8Y5kN3OS0s+nHh9mu2RG81EUN1bw+EG+koZlJeRq15Cjfx3TioC
	8lmsu4oaeXUd9Q+LMf2JVC9hOwVyTfeQo7591VC2f5L9yib0OG8tmIDUHdEXcAsxZcJ1
	jAagpiR4OrRYKCyfjSpDGs0+4ULBsvxwYu1D2q6Y4tLxLoDDrM5v4p1f9FLCeUiDN05V
	UDZsKhy8cmqP0m2TIAQDRSrNxFJt9JmIJsUe1Zy9havYlZ4J842RlnPI5oPkgpkMlB97
	1zNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nDAflNv9n+0Fa3d+/4DdrVBv0TXJamJigPIbRF/Yoc4=;
	b=A/722C4/eTIJ49MtfdirG6P6lKmZPSKICqBD5TW1RtZO+2+rHX+9xycv/UmZg07DQ7
	cm3jTQWJEx6aBAz4v5iYlKaylhkwccx9ky0NnGkRPlL4AegHADTBSPha2TucdHr2nfDl
	1Ir0B8gWmMOQUdhSxIjVudIo3l2vSMMcZPyC7OzsfuiCMWqdRTjedMeXYoC3Mbwzga+v
	/XdSJB3g+AkcRnuYLfIx3Gtq5i6S1yt7sBodpEvqvl3IkWYdYXY5h73ZqkNiUi195KTh
	qnvpDiw5DRmYYX+iG7yMMGDdPMKCzKBb9exIaekMSlXuuHA+cD8nZV7wQoLLgQQclTRR
	XPbQ==
X-Gm-Message-State: ALyK8tLsg9rN6YGnvSjrObYBV10xGSfsOK9XBwInNhnMXUhrhPRAfAmUe+HjVjWDEqVzCZxM
X-Received: by 10.36.76.71 with SMTP id a68mr29578970itb.77.1466003295561;
	Wed, 15 Jun 2016 08:08:15 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8D2EE.dip0.t-ipconnect.de.
	[93.232.210.238])
	by smtp.gmail.com with ESMTPSA id o4sm4362486itc.18.2016.06.15.08.08.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Jun 2016 08:08:14 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2016 17:08:02 +0200
Message-Id: <1466003282-21411-2-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466003282-21411-1-git-send-email-patrick.ohly@intel.com>
References: <1466002419.9543.1.camel@intel.com>
	<1466003282-21411-1-git-send-email-patrick.ohly@intel.com>
Subject: [meta-oe][PATCH 2/2] v4l-utils: fix compatibility with libjpeg-turbo
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
X-List-Received-Date: Wed, 15 Jun 2016 15:08:15 -0000

The libjpeg-turbo update to 1.5.0 broke components which embedd their
own, conflicting definitions of the jpeg_mem functions.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 .../jpeg_memsrcdest-extend-feature-check.patch     | 62 ++++++++++++++++++++++
 .../recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/v4l2apps/v4l-utils/jpeg_memsrcdest-extend-feature-check.patch

diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/jpeg_memsrcdest-extend-feature-check.patch b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/jpeg_memsrcdest-extend-feature-check.patch
new file mode 100644
index 0000000..17f8ba9
--- /dev/null
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils/jpeg_memsrcdest-extend-feature-check.patch
@@ -0,0 +1,62 @@
+From c40f7873d89fd88b0485fd94f45c139be41e1899 Mon Sep 17 00:00:00 2001
+From: Patrick Ohly <patrick.ohly@intel.com>
+Date: Wed, 15 Jun 2016 10:33:24 +0200
+Subject: [PATCH] jpeg_memsrcdest: extend feature check
+
+libjpeg.h in OpenEmbedded master (from libjpeg-turbo 1.5.0) provides
+these methods if "JPEG_LIB_VERSION >= 80 ||
+defined(MEM_SRCDST_SUPPORTED)".
+
+The support for the jpeg_mem functions was added even when not
+emulating the libjpeg8 API, controlled via the MEM_SRCDST_SUPPORTED
+define, so checking for the version alone is not enough anymore.
+
+See https://github.com/libjpeg-turbo/libjpeg-turbo/commit/ab70623eb29e09e67222be5b9e1ea320fe5aa0e9
+
+This fixes errors about conflicting declarations (signed vs. unsigned
+char).
+
+Upstream-Status: Submitted [http://article.gmane.org/gmane.linux.drivers.video-input-infrastructure/102965]
+
+Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
+---
+ lib/libv4lconvert/jpeg_memsrcdest.c | 4 ++--
+ lib/libv4lconvert/jpeg_memsrcdest.h | 4 ++++
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/libv4lconvert/jpeg_memsrcdest.c b/lib/libv4lconvert/jpeg_memsrcdest.c
+index b70af8e..8ada421 100644
+--- a/lib/libv4lconvert/jpeg_memsrcdest.c
++++ b/lib/libv4lconvert/jpeg_memsrcdest.c
+@@ -26,8 +26,8 @@
+ #include "jpeg_memsrcdest.h"
+ 
+ /* libjpeg8 and later come with their own (API compatible) memory source
+-   and dest */
+-#if JPEG_LIB_VERSION < 80
++   and dest, and older versions may have it backported */
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
+ 
+ /* Expanded data source object for memory input */
+ 
+diff --git a/lib/libv4lconvert/jpeg_memsrcdest.h b/lib/libv4lconvert/jpeg_memsrcdest.h
+index e971182..b13bf3f 100644
+--- a/lib/libv4lconvert/jpeg_memsrcdest.h
++++ b/lib/libv4lconvert/jpeg_memsrcdest.h
+@@ -1,5 +1,7 @@
+ #include <jpeglib.h>
+ 
++#if JPEG_LIB_VERSION < 80 && !defined(MEM_SRCDST_SUPPORTED)
++
+ void
+ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ 	unsigned long bufsize);
+@@ -7,3 +9,5 @@ jpeg_mem_src (j_decompress_ptr cinfo, unsigned char * buffer,
+ void
+ jpeg_mem_dest (j_compress_ptr cinfo, unsigned char ** outbuffer,
+ 	unsigned long * outsize);
++
++#endif
+-- 
+2.1.4
+
diff --git a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
index 75a42a2..46cd942 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.6.2.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://linuxtv.org/downloads/v4l-utils/v4l-utils-${PV}.tar.bz2 \
            file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
            file://mediactl-pkgconfig.patch \
            file://export-mediactl-headers.patch \
+           file://jpeg_memsrcdest-extend-feature-check.patch \
           "
 SRC_URI[md5sum] = "9cb3c178f937954e65bf30920af433ef"
 SRC_URI[sha256sum] = "d3d6eb1f0204fb11f3d318bfca35d5f73cc077f88fac7665a47856a16496be7d"
-- 
2.1.4


