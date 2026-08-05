Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DF7C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 15:44:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43199.1785944648038849450
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 08:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=aZ8/Yw7x;
 spf=pass (domain: konsulko.com, ip: 209.85.128.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954d29264cso6088135e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 08:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785944646; x=1786549446; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Zam/zHej4PInrbiZEslfrmISjSOPJTlOEnJCRnXFXI=;
        b=aZ8/Yw7xDukQqP34WMwFPop1XkLDWbqerZJZ8AeQ6HTOx26B+mxPP37fMVDqdbscan
         BAs1l9qNzqftYS3xWc5K57jQU8xVh1AAkwKSM6YcslS7v4fYhDguU4r0Bvfej3mWhJpm
         5jjefP5kKgGFtiqDURba62A+UegzlBvj6plWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785944646; x=1786549446;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Zam/zHej4PInrbiZEslfrmISjSOPJTlOEnJCRnXFXI=;
        b=rVi07lUnJ+RR20vbD66uiWTLsx7rzEJCsZiEUNtqptQc35TBbf1Y/Dpba0LyOEk2yC
         GAIR1hFnaT/2utn34F29qjVOWaEb29VSMDExce21AczZTAXGDh77rFWxtJnpdj/1GIcF
         8ry3mJPDgeJYQgkgBiseppDuYJZfp/FS0OIbIhGGtPh4UhK79TGNlE3F4ILfs9df6XbO
         ct8OEoaFhAcbyDHpkW4kRsgMBUpcuLawloH/4EnYXvd0BN/Yfqgs45eb8JVt/uv7n3vY
         cVOUeDRd2h9dZWITOPwr6Q8E47iDnJNQhayyHI+SqBL3HIJYpepDWwTzxZ5mgHtLwrN/
         1tBQ==
X-Gm-Message-State: AOJu0YzWc8z/qDYEPRV+sL6ry59g3KSXaSuNoD1ZCNR9zikyeyn1bbKF
	jMiyVl8gi9qDN9lrMBG96rYgHJu++pChpMsFLtEOrSovXH3ykyUsU5HT//04I30YKhV4w8l5HRp
	D4Cuw
X-Gm-Gg: AR+sD11WtnU1GztnLVZc3zxEV/4peoansDzt4G3n6jrKuIq527DZtypchFIrb+gTdED
	lIYZu+ysBGWGg33A1o8NpuZQeNlWU0fYg6pwl9PWeyEXiqu2HTBzEtFbXEXPj1queHC1dQ7uo8M
	j39sKMroAHPZpmghSTbF3buSy6xQ3Fw/Lku8HYAAvMpcfbCrXGw8wU+9oP8HjTCrqiYBhfdsl6z
	2u0xUSPML9mBHcJUm2K95f/xJuc/sVbYszih43hQpWnSBLnz5CmN82hMcoN/CBpqGtgNzWlHXqq
	7c8zGccLvwVHhdADJzsBi1FPdoEEK5LEcoLDGv2ewPU7idn+zFnEv7C7XP1wNQqos53yNEsJsL6
	n8uMNKTNZxDTqkk9sq2D0RAdJmwrhXGKNLNCEH9rhB6Fp21s+hW+rX9bRKd0K+NL+ko6Z/DORFn
	pJj9l8RLW6c/VYF4LcJ3oJ7XXkRnldWaRVybTr3yBfxJf2Ao77IHMvo597/18FWUS7vpxpZSlsP
	Ahc71r/V6NAP4qzplRweV9pfK7PukYYi8oi90ARppnKxkAIFET69I1vA59jSF77wcJXEkVxKiGQ
	lGwvzJO0m3+53R+bIcugo7H8
X-Received: by 2002:a05:600c:19cd:b0:498:519:e660 with SMTP id 5b1f17b1804b1-4994e72f7b6mr93823115e9.4.1785944646005;
        Wed, 05 Aug 2026 08:44:06 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99319bsm50858375e9.3.2026.08.05.08.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:44:05 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH] python3-pikepdf: Upgrade 10.10.0 -> 10.11.0
Date: Wed,  5 Aug 2026 18:44:01 +0300
Message-ID: <20260805154401.2869647-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 15:44:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128820

Upgrade to release 10.11.0:

- Extended PDF outline (bookmark) support to cover more of the spec
- Fixed 1-bit /Indexed images losing their palette when extracted.
  {meth}pikepdf.PdfImage.as_pil_image and
  {meth}pikepdf.PdfImage.extract_to previously ignored the palette
  of a 1-bit indexed image over a /DeviceCMYK base (returning a
  bilevel grayscale image) and of a single-colour palette (hival 0).
  Both now decode correctly, matching the existing behavior for
  2/4/8-bit indexed images.
- A 1-bit /Indexed image whose base colour space is unsupported (for
  example /DeviceN or /Separation) now raises NotImplementedError
  instead of silently returning an unpalettized image, matching the
  2/4/8-bit path.
- Image extraction now verifies that the image stream holds enough\
  data for the declared /Width and /Height before allocating, raising
  {exc}~pikepdf.exceptions.ImageDecompressionError when it does not.
  This closes the remaining decompression-bomb gaps left by the
  {attr}pikepdf.PdfImage.MAX_IMAGE_PIXELS limit added in v10.10.0:
  that limit bounds the declared size, but said nothing about whether
  the declared size was consistent with the data present, so a 4-bit
  image declaring 12000x12000 -- well under the default 500M pixel
  budget -- still allocated ~300 MB from a single byte of stream
  data, and setting the limit to None restored the unbounded case
  entirely. The 2-bit and 4-bit unpack path and the 1-bit path
  (where Pillow allocates a byte per pixel before it notices the
  data is short) are both covered; 8-bit and 16-bit images already
  failed cleanly. The check applies regardless of MAX_IMAGE_PIXELS.
- The 2-bit and 4-bit unpack buffer is no longer over-allocated by
  a factor of the packing ratio, reducing peak memory for those
  images by 4x and 2x respectively.
- Extracting a 1-, 2-, or 4-bit image whose stream is shorter than
  its declared dimensions require now raises
- {exc}~pikepdf.exceptions.ImageDecompressionError rather than
  returning a partially decoded image with a black tail. This
  matches what 8-bit and 16-bit images have always done for the
  same defect.
- An image with a non-positive /Width or /Height raises
  {exc}~pikepdf.exceptions.InvalidPdfImageError instead of failing
  further down with an obscure error from Pillow.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pikepdf_10.10.0.bb => python3-pikepdf_10.11.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.10.0.bb => python3-pikepdf_10.11.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
index 7355c68c8b..d34b4f3813 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
@@ -1,9 +1,10 @@
 SUMMARY = "Read and write PDFs with Python, powered by qpdf"
+DESCRIPTION = "Read, write, repair, and transform PDFs in Python, powered by qpdf"
 HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "9f134806b2fe608ccb21379a664ddcefeac3f6944100d343b350299d3c69754e"
+SRC_URI[sha256sum] = "4bebc59ac74411064e7c97a4036174023e22ccbecd22b78750ab76551eb38988"
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
-- 
2.47.3


