Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2761CA9ED5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 00:11:03 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3495.1791763859892724347
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 17:10:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OyEzKqXv;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ab62a8250aso718917a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791763859; x=1792368659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QiV0nfZtc98gxzDTeDh7ZHrHNNpjxQXVoYPbjSwhmo=;
        b=OyEzKqXvqT5CRnO4c5A9qLvOg1cSOOC+kL3sTbwbRw7qqDqp/wIiXaTVWWEwDkX8s8
         FN0MdiRDBTJhPlDVKfUV5swXfwyIydtTKUGpSHku7ckE98EcUsJwKa4dw3mHNNX2KSxa
         FwFDYyvhJ1FxeyyYF/t1TJkO5JOs2QyA+wlO+UeK+onIlO+1Uscu+RpttVTdLUQQpR8/
         EeTwKR3oxKBMC1nQ+/l+scTUcfw7K8k3d1tWklEQSm63kOVSRdgSc2EWNb9YRgVZggDw
         l8jszur1RdpHmHdwPDc4Z+aSYy+xz43hLelA/lbvO/KYoojMJx0Rbtm2XOwVPiVnY6Dv
         Blvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791763859; x=1792368659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QiV0nfZtc98gxzDTeDh7ZHrHNNpjxQXVoYPbjSwhmo=;
        b=dwhzwMXsa6oyeX+52V2P/sE8copNQTJYo8F1EcY6iMvSbbWf2xJ987qWqZ8HBvpX9W
         j5oF8ZwYooDxVxbdj/S7O7RrWBcVsM6u2I5g8DCRx8lF5eLF3mMAK7dHbnAHwyiMcugD
         /jSu4JCofKVaOsBbVxmzfoGfeCBeI5Gt+Xrs9AkLysvDMEoH1cE82jEhHw5wHtWgM9v2
         nkOs/f/NVCAJVhH6vyZRgRHNOJN8LOfW1O+gWI1FYNhtRmd77QCI7ODaTYutGQowa2k+
         q/twXrzx3nG5LEqSfhWcfmrcZkvdjrRO/jRK5CagsgsnEwtfzNBA2UlHPARf1NgMn3M4
         9D2w==
X-Gm-Message-State: AFq9FYI7OgNEY+kK7dL/Xn6CrY67hpX+Wq6HS0oNeJRih3UzHpfmfBkN
	LZ7VBYi+fqNu75XIqJMaXMUU8/QK5K2DdL+JcvA1dXqLAD9Biw+79Mw9cg4aJuG5Z4U=
X-Gm-Gg: AYBFou3MKrAn4pQfCzTiyiTQMrgE1IBGn39XrELz1wy2Co0d3LZtJ0iEStUHi2NCzVH
	eG8A9T5MkFwBt5Bui+9nqDbs4DhgvvaHJcGZwqjaMg0QdVjcJNa1VK+0Wy9phNxOuXX+miYuv8y
	2Veg5Cx+dVwrdscCZjxgTRap9uCiosq8hCCyag+vE9nxbOX3Sq3Nq4tFdP/nqgxKEJ8rIgVOu66
	MdJkqc+SSIzpCNWTz08NjpMuHgZChvfArpRAn5JvHD/gOFr3sIBvYoDok4AhCc7Nu3uQZYoIofs
	zTjFyt2MyZqkX7VE2A6fEDVniGpFl6xubq24gSNMb3ItGXlDX6DOaj+SNj5up7p24XNdNHBdCxh
	gwFFfsN+gayeaqotpM82ELrMqBwn56VkmajxFn6VtAsadh1l5CJ6shWbbx6okDO4SFkV8fn+AVX
	Fm/XFP9vypwb4WO+xlRqDIfs1M71k7Sl/4Do/85Q+GKFeDIZewp1P3AhCmcZzidiMgu8djh5q5Q
	3tWaUNuwUQ639gV7E6YigkNGZHMkSvlnnj8RvIUDXohrWLaxQ==
X-Received: by 2002:a17:90a:d450:b0:3ab:364a:951f with SMTP id 98e67ed59e1d1-3ab3a3593dbmr5356307a91.6.1791763859207;
        Sun, 11 Oct 2026 17:10:59 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3966dc7dsm7850379a91.2.2026.10.11.17.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 17:10:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][PATCH 17/28] libde265: patch CVE-2026-49346
Date: Mon, 12 Oct 2026 13:09:55 +1300
Message-ID: <20261012001007.2541673-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 00:11:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130742

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49346

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 4a63a2afa1c984b82a663ed8951b62f0ae5da093)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-49346.patch    | 102 ++++++++++++++++++
 .../libde265/libde265_1.0.19.bb               |   1 +
 2 files changed, 103 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49346.patch
new file mode 100644
index 00000000000..288295b08a8
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
index 5fcf6411131..a02d6dd5d8c 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
            file://CVE-2026-49295.patch \
            file://CVE-2026-49337.patch \
+           file://CVE-2026-49346.patch \
 "
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 

