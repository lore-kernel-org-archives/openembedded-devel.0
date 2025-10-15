Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4582CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 06:35:50 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.9522.1760510146069276318
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 23:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fW3AiOZs;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b555ab7fabaso5685186a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 23:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760510145; x=1761114945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZH0wf017pxvDomy9pGBp+8SRLNscbR1Cys4bPCtSLHk=;
        b=fW3AiOZsyNXrF5/eDVYT1ULd3opz9fwuLlsR1jHGVc2bYQkkxLt11R0nyOtixVp2T3
         sYExUALVc+DM6+Ic2IhkKCRpsjNtSiwU0P3inWgeJHwIMves7CO3t73sVMyrBcMYgxBF
         uznZFuTWxXM9wNd+0nw0m2HM2ZlTHft0bR2g8qXtHZkFRGv9P7s6flLt/n4om4clbt9J
         qyf7YknRfYzYkgisyYFN63HjRMlypCHK9Cc0QUYQjWlsYmKNRZ3V9aLWkQAMrE4FrqRn
         5qa64qEXxNxtC8fC+C/mgd72krrad1btVthnsjoBylammmbx8DSXdk+C3hwJhTxr9gyx
         f/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760510145; x=1761114945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZH0wf017pxvDomy9pGBp+8SRLNscbR1Cys4bPCtSLHk=;
        b=Ic3Op5E4uSuwI7u3o1kltPoivamFS3WhjCjVxhq9vD3b4Cr0zc9A57YqlCu7fgLKSn
         wMZSyxb8a1jHjIb2F25bj+FM3bP5dqiW1TrgveWQdQzTQnfP15NMa/WglkDdHZerC21F
         pmxz9wG1Zj2LXygUrag/+5Fvjl4V7zhOYUFr9Ps1ErFpzHNM+sQuw2G/KFay384/iayW
         u61mA3cBUZEWSSGBdNDCuUXnQQU2qBn7adq3RHirz45xHTz12bte9nm+xWZVloejNFH0
         S23WGgKrxzRcO/KOknsvbmcwIDsqdpEgXLAqgx91m/SvK5Pjerj+SM+7Y+Mh1kkLu/Zz
         3syA==
X-Gm-Message-State: AOJu0YxwByAjuNOt5ZTfrGcw3irpAuXVxkZQnxkw+5/ObQA+BRb/No0a
	SKQI/0c4aifXq5P8tI0v3s2oihePrIVqdVmjOxRMZb8dCVLgfn65iKeSNOh2JA==
X-Gm-Gg: ASbGncuP4p+qcpkzMBB+ZR5cuho5i5F9K6iOeeMeQvB90oXvgvKvswPdZCxhC/GonvP
	cAhA9xEHMxgTzzdJMXXG9QYGEiCVd9LPD9MrD/Le1gHGTEHnYIY3mW7ZvKX9u3jGQj47+GSNiEK
	ceuWbGnK1H2ZR9jjxOdHLNL/bDAmGQI0t8sg/8ReWT2p6X71ZBc8vSN1CaAKOAvFIRe9HJ+31dR
	KNH275N9Rs7/oUxKlUAO30x0E8TpxNtqVkXPV2dITQpcsyZael0KvMeP9uHMT5htNeJin3KdCRg
	BHO71XgtLN9ua6Mm+2tPVIDudrEa0lOJyfEt2Kn94MGHy8+Af8/kAVj6J2kl6lFz/WcVRXMpXVN
	nT2KdxjnRuRaCskhqNrNLVjbF5tmUxEBLxMzsY2Ym0DKlTakAHYeP11ybkS/zT+wNWA==
X-Google-Smtp-Source: AGHT+IF94AItb0+qHXQV7NrJgs71ohJTeH+wk/Awjk6eNpi43K983w/0ULYT9PwZrIUw0Y9seDEiSA==
X-Received: by 2002:a17:902:e785:b0:288:e46d:b32b with SMTP id d9443c01a7336-290273748d3mr372188955ad.17.1760510145047;
        Tue, 14 Oct 2025 23:35:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de6fd3sm186191205ad.25.2025.10.14.23.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 23:35:44 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/4] libvpx: patch CVE-2024-5197
Date: Wed, 15 Oct 2025 19:35:29 +1300
Message-ID: <20251015063531.1573191-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
References: <20251015063531.1573191-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 06:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120691

Details https://nvd.nist.gov/vuln/detail/CVE-2024-5197
---
 .../webm/libvpx/CVE-2024-5197.patch           | 225 ++++++++++++++++++
 .../recipes-multimedia/webm/libvpx_1.14.0.bb  |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/webm/libvpx/CVE-2024-5197.patch

diff --git a/meta-oe/recipes-multimedia/webm/libvpx/CVE-2024-5197.patch b/meta-oe/recipes-multimedia/webm/libvpx/CVE-2024-5197.patch
new file mode 100644
index 0000000000..5ab7f6d8d5
--- /dev/null
+++ b/meta-oe/recipes-multimedia/webm/libvpx/CVE-2024-5197.patch
@@ -0,0 +1,225 @@
+From 402e649a26196152a1703a949a71e4c8985edb8a Mon Sep 17 00:00:00 2001
+From: Wan-Teh Chang <wtc@google.com>
+Date: Wed, 10 Apr 2024 17:01:10 -0700
+Subject: [PATCH] CVE-2024-5197
+
+[1] Fix integer overflows in calc of stride_in_bytes
+
+A port of the libaom CL
+https://aomedia-review.googlesource.com/c/aom/+/188761.
+
+Fix unsigned integer overflows in the calculation of stride_in_bytes in
+img_alloc_helper() when d_w is huge.
+
+Change the type of stride_in_bytes from unsigned int to int because it
+will be assigned to img->stride[VPX_PLANE_Y], which is of the int type.
+
+Test:
+. ../libvpx/tools/set_analyzer_env.sh integer
+../libvpx/configure --enable-debug --disable-optimizations
+make -j
+./test_libvpx --gtest_filter=VpxImageTest.VpxImgAllocHugeWidth
+
+Bug: chromium:332382766
+Change-Id: I3b39d78f61c7255e10cbf72ba2f4975425a05a82
+
+[2] Avoid integer overflows in arithmetic operations
+
+A port of the libaom CL
+https://aomedia-review.googlesource.com/c/aom/+/188823.
+
+Impose maximum values on the input parameters so that we can perform
+arithmetic operations without worrying about overflows.
+
+Also change the VpxImageTest.VpxImgAllocHugeWidth test to write to the
+first and last samples in the first row of the Y plane, so that the test
+will crash if there is unsigned integer overflow in the calculation of
+stride_in_bytes.
+
+Bug: chromium:332382766
+Change-Id: I54cec6c9e26377abaa8a991042ba277ff70afdf3
+
+[3] Fix a bug in alloc_size for high bit depths
+
+I introduced this bug in commit 2e32276:
+https://chromium-review.googlesource.com/c/webm/libvpx/+/5446333
+
+I changed the line
+
+  stride_in_bytes = (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
+
+to three lines:
+
+  s = (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
+  if (s > INT_MAX) goto fail;
+  stride_in_bytes = (int)s;
+
+But I didn't realize that `s` is used later in the calculation of
+alloc_size.
+
+As a quick fix, undo the effect of s * 2 for high bit depths after `s`
+has been assigned to stride_in_bytes.
+
+Bug: chromium:332382766
+Change-Id: I53fbf405555645ab1d7254d31aadabe4f426be8c
+
+(cherry picked from commit c5640e3300690705c336966e2a8bb346a388c829)
+(cherry picked from commit 9d7054c0cb83665a74cf6f59b6261f455e692149)
+(cherry picked from commit 61c4d556bd03b97d84e3fa49180d14bde5a62baa)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+
+CVE: CVE-2024-5197
+Upstream-Status: Backport
+[1] [https://chromium.googlesource.com/webm/libvpx/+/c5640e3300690705c336966e2a8bb346a388c829]
+[2] [https://chromium.googlesource.com/webm/libvpx/+/9d7054c0cb83665a74cf6f59b6261f455e692149]
+[3] [https://chromium.googlesource.com/webm/libvpx/+/61c4d556bd03b97d84e3fa49180d14bde5a62baa]
+---
+ vpx/src/vpx_image.c | 45 +++++++++++++++++++++++++++++++++------------
+ vpx/vpx_image.h     | 16 +++++++++++-----
+ 2 files changed, 44 insertions(+), 17 deletions(-)
+
+diff --git a/vpx/src/vpx_image.c b/vpx/src/vpx_image.c
+index f9f0dd602..838a9ea4e 100644
+--- a/vpx/src/vpx_image.c
++++ b/vpx/src/vpx_image.c
+@@ -8,6 +8,7 @@
+  *  be found in the AUTHORS file in the root of the source tree.
+  */
+ 
++#include <assert.h>
+ #include <limits.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -21,12 +22,23 @@ static vpx_image_t *img_alloc_helper(vpx_image_t *img, vpx_img_fmt_t fmt,
+                                      unsigned int buf_align,
+                                      unsigned int stride_align,
+                                      unsigned char *img_data) {
+-  unsigned int h, w, s, xcs, ycs, bps;
+-  unsigned int stride_in_bytes;
++  unsigned int h, w, xcs, ycs, bps;
++  uint64_t s;
++  int stride_in_bytes;
+   unsigned int align;
+ 
+   if (img != NULL) memset(img, 0, sizeof(vpx_image_t));
+ 
++  if (fmt == VPX_IMG_FMT_NONE) goto fail;
++
++  /* Impose maximum values on input parameters so that this function can
++   * perform arithmetic operations without worrying about overflows.
++   */
++  if (d_w > 0x08000000 || d_h > 0x08000000 || buf_align > 65536 ||
++      stride_align > 65536) {
++    goto fail;
++  }
++
+   /* Treat align==0 like align==1 */
+   if (!buf_align) buf_align = 1;
+ 
+@@ -80,9 +92,12 @@ static vpx_image_t *img_alloc_helper(vpx_image_t *img, vpx_img_fmt_t fmt,
+    * and height shouldn't be adjusted. */
+   w = d_w;
+   h = d_h;
+-  s = (fmt & VPX_IMG_FMT_PLANAR) ? w : bps * w / 8;
+-  s = (s + stride_align - 1) & ~(stride_align - 1);
+-  stride_in_bytes = (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
++  s = (fmt & VPX_IMG_FMT_PLANAR) ? w : (uint64_t)bps * w / 8;
++  s = (s + stride_align - 1) & ~((uint64_t)stride_align - 1);
++  s = (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
++  if (s > INT_MAX) goto fail;
++  stride_in_bytes = (int)s;
++  s = (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s / 2 : s;
+ 
+   /* Allocate the new image */
+   if (!img) {
+@@ -100,12 +115,16 @@ static vpx_image_t *img_alloc_helper(vpx_image_t *img, vpx_img_fmt_t fmt,
+     /* Calculate storage sizes given the chroma subsampling */
+     align = (1 << xcs) - 1;
+     w = (d_w + align) & ~align;
++    assert(d_w <= w);
+     align = (1 << ycs) - 1;
+     h = (d_h + align) & ~align;
++    assert(d_h <= h);
+ 
+-    s = (fmt & VPX_IMG_FMT_PLANAR) ? w : bps * w / 8;
+-    s = (s + stride_align - 1) & ~(stride_align - 1);
+-    stride_in_bytes = (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
++    s = (fmt & VPX_IMG_FMT_PLANAR) ? w : (uint64_t)bps * w / 8;
++    s = (s + stride_align - 1) & ~((uint64_t)stride_align - 1);
++    s = (fmt & VPX_IMG_FMT_HIGHBITDEPTH) ? s * 2 : s;
++    if (s > INT_MAX) goto fail;
++    stride_in_bytes = (int)s;
+     alloc_size = (fmt & VPX_IMG_FMT_PLANAR) ? (uint64_t)h * s * bps / 8
+                                             : (uint64_t)h * s;
+ 
+@@ -170,12 +189,12 @@ int vpx_img_set_rect(vpx_image_t *img, unsigned int x, unsigned int y,
+       if (img->fmt & VPX_IMG_FMT_HAS_ALPHA) {
+         img->planes[VPX_PLANE_ALPHA] =
+             data + x * bytes_per_sample + y * img->stride[VPX_PLANE_ALPHA];
+-        data += img->h * img->stride[VPX_PLANE_ALPHA];
++        data += (size_t)img->h * img->stride[VPX_PLANE_ALPHA];
+       }
+ 
+       img->planes[VPX_PLANE_Y] =
+           data + x * bytes_per_sample + y * img->stride[VPX_PLANE_Y];
+-      data += img->h * img->stride[VPX_PLANE_Y];
++      data += (size_t)img->h * img->stride[VPX_PLANE_Y];
+ 
+       if (img->fmt == VPX_IMG_FMT_NV12) {
+         img->planes[VPX_PLANE_U] =
+@@ -186,7 +205,8 @@ int vpx_img_set_rect(vpx_image_t *img, unsigned int x, unsigned int y,
+         img->planes[VPX_PLANE_U] =
+             data + (x >> img->x_chroma_shift) * bytes_per_sample +
+             (y >> img->y_chroma_shift) * img->stride[VPX_PLANE_U];
+-        data += (img->h >> img->y_chroma_shift) * img->stride[VPX_PLANE_U];
++        data +=
++            (size_t)(img->h >> img->y_chroma_shift) * img->stride[VPX_PLANE_U];
+         img->planes[VPX_PLANE_V] =
+             data + (x >> img->x_chroma_shift) * bytes_per_sample +
+             (y >> img->y_chroma_shift) * img->stride[VPX_PLANE_V];
+@@ -194,7 +214,8 @@ int vpx_img_set_rect(vpx_image_t *img, unsigned int x, unsigned int y,
+         img->planes[VPX_PLANE_V] =
+             data + (x >> img->x_chroma_shift) * bytes_per_sample +
+             (y >> img->y_chroma_shift) * img->stride[VPX_PLANE_V];
+-        data += (img->h >> img->y_chroma_shift) * img->stride[VPX_PLANE_V];
++        data +=
++            (size_t)(img->h >> img->y_chroma_shift) * img->stride[VPX_PLANE_V];
+         img->planes[VPX_PLANE_U] =
+             data + (x >> img->x_chroma_shift) * bytes_per_sample +
+             (y >> img->y_chroma_shift) * img->stride[VPX_PLANE_U];
+diff --git a/vpx/vpx_image.h b/vpx/vpx_image.h
+index 1adc9b9d9..2c30a8993 100644
+--- a/vpx/vpx_image.h
++++ b/vpx/vpx_image.h
+@@ -132,10 +132,13 @@ typedef struct vpx_image_rect {
+  *                         is NULL, the storage for the descriptor will be
+  *                         allocated on the heap.
+  * \param[in]    fmt       Format for the image
+- * \param[in]    d_w       Width of the image
+- * \param[in]    d_h       Height of the image
++ * \param[in]    d_w       Width of the image. Must not exceed 0x08000000
++ *                         (2^27).
++ * \param[in]    d_h       Height of the image. Must not exceed 0x08000000
++ *                         (2^27).
+  * \param[in]    align     Alignment, in bytes, of the image buffer and
+- *                         each row in the image(stride).
++ *                         each row in the image (stride). Must not exceed
++ *                         65536.
+  *
+  * \return Returns a pointer to the initialized image descriptor. If the img
+  *         parameter is non-null, the value of the img parameter will be
+@@ -155,9 +158,12 @@ vpx_image_t *vpx_img_alloc(vpx_image_t *img, vpx_img_fmt_t fmt,
+  *                             parameter is NULL, the storage for the descriptor
+  *                             will be allocated on the heap.
+  * \param[in]    fmt           Format for the image
+- * \param[in]    d_w           Width of the image
+- * \param[in]    d_h           Height of the image
++ * \param[in]    d_w           Width of the image. Must not exceed 0x08000000
++ *                             (2^27).
++ * \param[in]    d_h           Height of the image. Must not exceed 0x08000000
++ *                             (2^27).
+  * \param[in]    stride_align  Alignment, in bytes, of each row in the image.
++ *                             Must not exceed 65536.
+  * \param[in]    img_data      Storage to use for the image
+  *
+  * \return Returns a pointer to the initialized image descriptor. If the img
diff --git a/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb b/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
index b4d49842ea..13e342d420 100644
--- a/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
+++ b/meta-oe/recipes-multimedia/webm/libvpx_1.14.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d5b04755015be901744a78cc30d390d4"
 SRCREV = "602e2e8979d111b02c959470da5322797dd96a19"
 SRC_URI += "git://chromium.googlesource.com/webm/libvpx;protocol=https;branch=main \
            file://libvpx-configure-support-blank-prefix.patch \
+           file://CVE-2024-5197.patch \
            "
 
 S = "${WORKDIR}/git"

