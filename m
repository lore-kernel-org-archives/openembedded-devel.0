Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 563DBCA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 08:54:03 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9159.1791795230907235676
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 01:53:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Eg4+RMMI;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2df982e04c1so8505435ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 01:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795230; x=1792400030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QiV0nfZtc98gxzDTeDh7ZHrHNNpjxQXVoYPbjSwhmo=;
        b=Eg4+RMMI3Lnfxe4mz2/KmuQCnyBsqsOidSsUE/wdeLwA9r+CI+vCBlM3qXiquiPRc6
         XSkF3XyX/Ltxr8rQZIlG6FQeYt6EUcYH8U9C3a6ASy5dqbzw4FFCNOsnrQNnRf2VdIYO
         +WGhDN3AmZ5LElwSj+9h56j/33GlCDQZsnI1CKf1yOFTWxbcAY/nQHevar1vyJo/8jDP
         /LGiQAcg/QFxfP+oyAds/6Tx87wLpmsr8iYJhePDs4pOTt3DXCiR/7zdcme9wHITpok8
         UYLwKV/hgwE/oIDKCyQncAgBsXwj48/dahb/kO8o9kabUNo+EOPWLChOcPl4EaWpieHv
         50GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795230; x=1792400030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QiV0nfZtc98gxzDTeDh7ZHrHNNpjxQXVoYPbjSwhmo=;
        b=D1MKG5AR25UXqZD3OyAljf9whICfnThTFf6kMidbfs5U28Me1hTtqDd9hw/uw47Pk7
         eujS1kv0qXkpv7UgDK5g7+5VVv1M1r1A36GIdGPGtKTK3kInI4YQggpdA5E50UagU8M4
         kmXZOU1MR8xwmi65JmuiR9u6hdsLKysw328HlYpLe7gnh7l1T/7APRuxKJTiakW+W3J5
         G9dga5uKSqLnHXGvX8U/TavBpfqIwmK5kkjZRzMDIYoJhxkzujAsxi7JZ3vToi8sRmTC
         VOALLTNjggqnYZPDN8uSBwE5iBuv1Ct5lYsCTmFY4HrYpzOCaHtAUzCAJHTND3lDzaRM
         zFjA==
X-Gm-Message-State: AFq9FYLAbsm9sAZuN12cMBlDNQ9931FlVbLRUwJ1gynhoxYAeqtpsGkS
	yyILiYk+NZ55EncA6Xj3OhXwsfN2H/5vhWFuy1ItnO1hraKIc5GZsGflH5rWkQCpSR4=
X-Gm-Gg: AYBFou3Amwo+iZlZEhxd2bYwow+DxoB1wTTRKgLAK0anIqved2rgJ0BL9gEP3PWn7ij
	pvAf744Ra8a5W5z0fNsc0R0elTur3/0yYLJY8/lr/w3X9udUC+tHoznj8QQMv1ZYrUFRgOvdaP1
	KHv4mNaE0CIU0yBmmxOc/0frJOrkunIVmEl/jJHG+68PA2WVco8x9iIzeCkbVI8qBcrXUonHVr5
	MQIySlTD3nqKqGantzvlzT6XQ2ZxdiJDPtqAS2tnYy246jH5hZWR1akqU7AG8wNsnrXIYM21ETE
	OFMcaazU99uNY2Da/sBnvw0uzH2KHbGNA7w/9tjJIbPraxCgbW0W097QlZCeUlK6N8eZ10CKDg7
	Y5Rbjdz1eIubzmwNjXjD9Dn+IUyBFzE/5QVyPxnjKhSdYZcL9PzBrVeSiaxuV2IXsrjJeCD3LZi
	GM7vAI9isEXe5+bWzowMO73UQKqQMd3EAJEE5hM95UytLLh+Rdz6JqBAGponSHWc7hwoSi6Dcu1
	rudcHRipC09UGy0CNB3g1o6zfU5ZKFe/xA1ul2myUctR2+nsw==
X-Received: by 2002:a17:902:db0b:b0:2e2:cebe:d811 with SMTP id d9443c01a7336-2e842ce805amr75629925ad.46.1791795230102;
        Mon, 12 Oct 2026 01:53:50 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8acfa3b6csm14943335ad.41.2026.10.12.01.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:53:49 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][PATCH v2 3/4] libde265: patch CVE-2026-49346
Date: Mon, 12 Oct 2026 21:53:36 +1300
Message-ID: <20261012085337.2879365-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012085337.2879365-1-ankur.tyagi85@gmail.com>
References: <20261012085337.2879365-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 08:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130757

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
 

