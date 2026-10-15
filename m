Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46602CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:43:47 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33241.1792043017893712582
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sJ9m6B+5;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso11432735ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043017; x=1792647817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XTpruYOA5HD02LmQuLsYexraXtzG4jhrzvWFHai0fig=;
        b=sJ9m6B+5rGB8bJ3umFA5rZurxRf5eCW1brwCf4XS6CxXobIK7RjabMiNEXuA3uJJl8
         jOQU9Ta3z4sGXhHJ1iu9YdBUnomCRoW4W9IAu97gkDNC2Aq5UykRvoQlUH8YK3rsxVYQ
         LCQMlUDag061NyF+oD/Rd7rwNWIRNNqn9NPP+YuK6nA7b8G1QCj5u6gRaSHGx42exjFg
         D1n9qRyAJQwU4M/0qyEjVovCCRHsPyeQItarEQ6xn3aNxXME9Ymc7KNj7EfY9uKlBm7i
         Tt0ing4T8xmIxeFaNlPZdI1ab2RCF/QeA46rRPC5nYLzHrGlDhD2YrquqGcR/t/unK/T
         1YUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043017; x=1792647817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=XTpruYOA5HD02LmQuLsYexraXtzG4jhrzvWFHai0fig=;
        b=rhwM0+DOOlzB1p2LxHMiTbQNIxTlh1TnEGdr4P1JJFppKM0Npes/fgiIAbbfyR+HYl
         Vw20mUgFVn+rON8R/dr6zEoW+xGw0/BneIrzTUyvSAMWUeHTAeRYT76CU2tIwnZRRTv1
         639XXCgkAbJ6zcLL1WqHx0ZkCa4CnlqkEXBiFaS05XeIDwPOwgxHBfPa7eLwhT9DlZ2i
         Pok0VzeiILofkYMirOzj9B31kv3S+kvkk0Hk6zw6ryQql6nNqiDwbD2/YrHuIc6fKDBn
         TRssC7p8WR5UlyecAjZ2OJQIJiRTiI8DuTmY2M553Iq2PqDUiM2rwnnDN6BSFVGkjSsU
         vFvQ==
X-Gm-Message-State: AFq9FYJ9ENIvzN3u1bqxtb/hEkBlujI/JQxdtmsJ9nF5gj1s7uMrdUMY
	84cN2Kads9e2EJFACff7coH12OHVcJNs/baJk5p3qDWdTm5XB4NLFJto062dnw==
X-Gm-Gg: AYBFou02ML3jizAvsJ37qN54gWBKqtKrTgqREc9SpUy96A+b/qg9wMWWx/9EMS3lviz
	vgpqrMkA/JfZlRiF+Ds0d1A5T7GDoY9KjiDQ2kWeS5YLVRC430m6YzvxrYaOLSopvg5g0PKHreZ
	3Khmfxo3cZ4ueXvmvsHlfES+nF+HZIQGDpyygy+LS5LC5veyod2tqy8tDSXu0X2mo/4Cr3lnaI7
	ar169P56N0y1irU4on1hpuFBHKMyAkuQefIt6wpxlIGk+sdiT3MVqr9fyV4/5L/J/GDR5cXYGEW
	LUY5lESsXVDen2PZR0zY1cdW0aiYqvJse2CkQ2QG1AURp9K3Io4hnUlwdqfzxBFM//p7TICw6MT
	Hg0P7V4yE5Aa27gS/0Rr87aN8age24i150R7qeJ4KQ2a1c5MVnNOCT/8Gi/CJTZOUv1AuI5zubL
	G6yifRMqJ+6XiSQ5L5moWa9wMxltwvSQc6CdsPnRCVouA5s+PibSmZdGme3Dhz5LuRmBrmWhuGE
	Qqd6GK5CYM05xaG4clw++g=
X-Received: by 2002:a17:903:19cf:b0:2e5:41dc:9ac7 with SMTP id d9443c01a7336-2e842bc7708mr167789635ad.24.1792043017066;
        Wed, 14 Oct 2026 22:43:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.43.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:43:36 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 23/82] libde265: patch CVE-2026-49346
Date: Thu, 15 Oct 2026 18:41:11 +1300
Message-ID: <3745d07efc93d008978220e27cfdba32a370e040.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130943

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
index 5fcf641113..a02d6dd5d8 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
            file://CVE-2026-49295.patch \
            file://CVE-2026-49337.patch \
+           file://CVE-2026-49346.patch \
 "
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 

