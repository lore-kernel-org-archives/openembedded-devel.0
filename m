Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1897FC624A4
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4053.1788429013874036776
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G3glF83q;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-853c07a76adso2544983b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429013; x=1789033813; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=59Fyx46p2ZUCg6GJLHi8Tq37NfYD3pXKLUToZQVcqNc=;
        b=G3glF83qOLpiH0SMyujsqtksHEMaIi+g0a85d32plMiSAnZnlidE2wu20VrZqwpxCI
         1c/jLfGWUDlEF3i/Q9Pcqio7J8MwEpn1Q1X2othHdmfbUC12wvhEhaJ/iR4yeGhqDAzu
         hUYX+EleBw3okKcOQmU4BgURxRBHK6D4xOfxQBjZoJQKY+61HNXKA297ZwP7pl+c3Mwt
         94Etb1CeSDm/PCpD05oXn/4p4dunTy/JvGruBCBg1OJuMob7Lw/SJDd8QsmDIezbK3tA
         Ryn8yRSJ5fG18t6NdzYJsAHnkUpDnpIFLVUxtSbJnzH0t2qZSAryXfZQHiZem16OmaLw
         nEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429013; x=1789033813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=59Fyx46p2ZUCg6GJLHi8Tq37NfYD3pXKLUToZQVcqNc=;
        b=EyaZHlXRIeNuJkUcqBpQgVNQU6SW3dGG/Whozqz/lI63OmWpu79YWMHAJ8rlRcm7Nw
         DJAxE6wxtl252yXBsHKWlAzLPHUv/6IxZ5CzO3jcmP1v05fviixEax8etQ9uObN6NdZF
         gXGSopEulzuUK2v+hIAeg+hPg5kXsCd+kjO5/CYZNutzwfHVa+kJ6KdydMi6EPgWtlvW
         Rw+RRGfn0kx/la5bqi8cv3FJUXJuMqoQNxQ3I7q8nwpi1GlI2iwtJOQcIvXWr7MYxMB+
         x0E/jAZFzH+OOXI199dR4/n+7ggYNzR7Tu705jJTD3aPNpVlOLrq0NH34uu+Si+3RR3S
         6YHg==
X-Gm-Message-State: AFuF++klSLj+Hsk7QEEY8jY7SD03yGMqWP06HCniwBUdXVug+GQ6Qjzl
	3CJHJzUOUsDljrYquJ0pqO305z1jO07ZUl+TjdAFlU9ynArKOcJOI41tXyqJtdoc
X-Gm-Gg: AYBFou0XDisjGIq4+Ynp7VoowaQ1Y7yYMbZ5qDlDBnn1VeyJ3vs3Fjxrxe8ub7DS0PE
	WhElzQdl9PoxjD25ioQEkFi9MRPeQYR6HLGF33YpU+NbuwOSDpna6V6VR4iT49t8ZvA8UaUmn/Z
	p2/7NqsH3ZpLvs+qGT8kk30gBPMR8TNgmpoqV9idSw68B2wWns3glvBZFNOrnXG36w0+Y7hRYzV
	G/WYRk8R1yuPBXj5w6Cpgv8/59xfaGci0B33AFewiqvruM7jMfIJ7gSucdQF1ln8R+7nnF0fSDq
	V6ZZfOlRUKViqo4Ytrf+fG7KR942ZPjDfl3vdltYlVXLPeEb67XiV7xTdEQW7QZriG9wp1v+Qq8
	AmKZszYh7ZSTc4XMXwo6yTf/fLh4PMFvdvquEDvxf6jWNzaPM3ZUEsvR5Ln7zPNUW2CrAj1KutY
	x64QKJg5N08D3D8D3t1Y1s+pRtpBQNps84+Pp09cvjJnXCXGZeXvFQIfb908fxEMUCR/ETg4mY
X-Received: by 2002:a05:6a00:27a4:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-85ed5cccc9dmr16519271b3a.1.1788429013239;
        Thu, 03 Sep 2026 02:50:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 6/22] libde265: patch CVE-2026-49346
Date: Thu,  3 Sep 2026 21:49:37 +1200
Message-ID: <20260903094954.3240723-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129722

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49346

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-49346.patch    | 102 ++++++++++++++++++
 .../libde265/libde265_1.0.19.bb               |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
new file mode 100644
index 0000000000..288295b08a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
@@ -0,0 +1,102 @@
+From 1667c33f2778a04f08ba4f7d6c1c16508350a779 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Tue, 26 May 2026 00:59:08 +0200
+Subject: [PATCH] fix integer overflow in image plane allocation size
+ (GHSA-vv8h-932h-7r86)
+
+(cherry picked from commit 8a1b5cf212f78e1c77cb46eb5d56e492a9336eb8)
+
+CVE: CVE-2026-49346
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/8a1b5cf212f78e1c77cb46eb5d56e492a9336eb8]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libde265/image.cc | 46 +++++++++++++++++++++++++++-------------------
+ 1 file changed, 27 insertions(+), 19 deletions(-)
+
+diff --git a/libde265/image.cc b/libde265/image.cc
+index 0b6071ba..94f3c974 100644
+--- a/libde265/image.cc
++++ b/libde265/image.cc
+@@ -70,10 +70,11 @@ LIBDE265_API void* de265_alloc_image_plane(struct de265_image* img, int cIdx,
+                                            void* inputdata, int inputstride, void *userdata)
+ {
+   int alignment = STANDARD_ALIGNMENT;
+-  int stride = (img->get_width(cIdx) + alignment-1) / alignment * alignment;
+-  int height = img->get_height(cIdx);
++  uint32_t stride = (img->get_width(cIdx) + alignment-1) / alignment * alignment;
++  uint32_t height = img->get_height(cIdx);
+ 
+-  uint8_t* p = static_cast<uint8_t*>(ALLOC_ALIGNED_16(stride * height + MEMORY_PADDING));
++  // size computed in size_t: stride*height can exceed UINT32_MAX for large planes
++  uint8_t* p = static_cast<uint8_t*>(ALLOC_ALIGNED_16(static_cast<size_t>(stride) * height + MEMORY_PADDING));
+ 
+   if (p==nullptr) { return nullptr; }
+ 
+@@ -82,12 +83,14 @@ LIBDE265_API void* de265_alloc_image_plane(struct de265_image* img, int cIdx,
+   // copy input data if provided
+ 
+   if (inputdata != nullptr) {
+-    if (inputstride == stride) {
+-      memcpy(p, inputdata, stride*height);
++    if (inputstride == static_cast<int>(stride)) {
++      memcpy(p, inputdata, static_cast<size_t>(stride) * height);
+     }
+     else {
+-      for (int y=0;y<height;y++) {
+-        memcpy(p+y*stride, static_cast<char*>(inputdata) + inputstride*y, inputstride);
++      for (uint32_t y=0;y<height;y++) {
++        memcpy(p + static_cast<size_t>(y) * stride,
++               static_cast<char*>(inputdata) + static_cast<size_t>(inputstride) * y,
++               inputstride);
+       }
+     }
+   }
+@@ -107,30 +110,35 @@ LIBDE265_API void de265_free_image_plane(struct de265_image* img, int cIdx)
+ static int  de265_image_get_buffer(de265_decoder_context* ctx,
+                                    de265_image_spec* spec, de265_image* img, void* userdata)
+ {
+-  const int rawChromaWidth  = spec->width  / img->SubWidthC;
+-  const int rawChromaHeight = spec->height / img->SubHeightC;
++  const uint32_t rawChromaWidth  = spec->width  / img->SubWidthC;
++  const uint32_t rawChromaHeight = spec->height / img->SubHeightC;
+ 
+-  int luma_stride   = (spec->width    + spec->alignment-1) / spec->alignment * spec->alignment;
+-  int chroma_stride = (rawChromaWidth + spec->alignment-1) / spec->alignment * spec->alignment;
++  uint32_t luma_stride   = (spec->width    + spec->alignment-1) / spec->alignment * spec->alignment;
++  uint32_t chroma_stride = (rawChromaWidth + spec->alignment-1) / spec->alignment * spec->alignment;
+ 
+   assert(img->BitDepth_Y >= 8 && img->BitDepth_Y <= 16);
+   assert(img->BitDepth_C >= 8 && img->BitDepth_C <= 16);
+ 
+-  int luma_bpl   = luma_stride   * ((img->BitDepth_Y+7)/8);
+-  int chroma_bpl = chroma_stride * ((img->BitDepth_C+7)/8);
++  uint32_t luma_bpl   = luma_stride   * ((img->BitDepth_Y+7)/8);
++  uint32_t chroma_bpl = chroma_stride * ((img->BitDepth_C+7)/8);
+ 
+-  int luma_height   = spec->height;
+-  int chroma_height = rawChromaHeight;
++  uint32_t luma_height   = spec->height;
++  uint32_t chroma_height = rawChromaHeight;
+ 
+   bool alloc_failed = false;
+ 
+-  uint8_t* p[3] = { 0,0,0 };
+-  p[0] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(luma_height   * luma_bpl   + MEMORY_PADDING));
++  // Compute the plane sizes in size_t. Each operand fits in uint32_t, but the
++  // height * bytes-per-line product can exceed UINT32_MAX for large frames, so
++  // the multiplication must be done in 64 bits. Computing it in 32 bits wraps
++  // the allocation size to a small value while fill_image() later writes the
++  // real (size_t) size -> heap buffer overflow (GHSA-vv8h-932h-7r86).
++  uint8_t* p[3] = { nullptr,nullptr,nullptr };
++  p[0] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(static_cast<size_t>(luma_height) * luma_bpl + MEMORY_PADDING));
+   if (p[0]==nullptr) { alloc_failed=true; }
+ 
+   if (img->get_chroma_format() != de265_chroma_mono) {
+-    p[1] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(chroma_height * chroma_bpl + MEMORY_PADDING));
+-    p[2] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(chroma_height * chroma_bpl + MEMORY_PADDING));
++    p[1] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(static_cast<size_t>(chroma_height) * chroma_bpl + MEMORY_PADDING));
++    p[2] = static_cast<uint8_t*>(ALLOC_ALIGNED_16(static_cast<size_t>(chroma_height) * chroma_bpl + MEMORY_PADDING));
+ 
+     if (p[1]==nullptr || p[2]==nullptr) { alloc_failed=true; }
+   }
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index bca5c9d776..07d108b915 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
            file://CVE-2026-49295.patch \
            file://CVE-2026-49337.patch \
+           file://CVE-2026-49346.patch \
 "
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 

