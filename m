Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8A3C55ABA
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 15:47:03 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43237.1785944821013921715
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 08:47:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=flV5Tma5;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so13222575e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 08:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785944819; x=1786549619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQ6du6qomFzzK+BOQNkAEViz75t5ZsQvjdl+5nflj8A=;
        b=flV5Tma5p52GA8LAlLW/8G+ttL/58ToVVNK1MdzGMSc9qEmkjC69PUdJ3A5RVae90j
         juHyYH4+tFcJKpk4rD5DNeEsy208M4qr+gppKGN7IfGwDdPmZExUsWcblhbxNKRfTlUp
         NlXURUhVxgk9mepKsPcYCWVfwD846OdlLdn3A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785944819; x=1786549619;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQ6du6qomFzzK+BOQNkAEViz75t5ZsQvjdl+5nflj8A=;
        b=LXSrcOiVSmJ4R/2Jy2OY2WuqDUAG0b7XKRh/29h9iMRLsDugWA3fXm6Hj2EKJ5DIFp
         qYrI+/ZFXP8TbPm2QMazZdpsAk2sLWQwSclVMp8AuNwR6FuKvjDJB6lRq36R5JZU9KzG
         uhho24JM0wkmw7L7xiSpz8EXyy99K1BQyWI44085xAKR6ArjqemW2ABGd+I8mVhBPwU3
         kdYlOxnDGkkw1oNVbZGfq+7aqqxVDHPmy4qOJkE0Z3JoJq/f1msyQaLlpZsUsydmz6zq
         2IaKA3bBGwkkQnlcA2Lat/VIfrPGvt91D+qKyDCqeGWYSdgb2Jlub6VLWL3B/d4SUqJ7
         Vp3g==
X-Gm-Message-State: AOJu0YxSpNYhEMvPY4pLbgahVEGVU6BT+OOs/CKrB1xqSZ35/Fb5A8e2
	jOKql2Nlsmww4XE16Va9NsorEUQ5OzKACAQmRrGYN4rAXuTEU9FeXgetATM0X7Gl0SwHNgtY9VQ
	zwfNG
X-Gm-Gg: AR+sD10o+aZ5xPcyrI876ZSm2tovFGTMhwTqQjGPy3eiD48Quy+gWJwBdXwCYySyzFc
	0NEMCbfP6o59Ll/VDjbaPT34pNwd9ahAuz++SOKd6tZIhfFhgOc7shFPxxcHD0DpedEUL2xIdzG
	IRxXszFDddg4FjChByKBbE+27exRhWN9R6t+3vJM+sQ7zF3+p9Jv1IcBEpQ49zv5U5LA2KoPl8H
	8fBeSZ6R5uXCP3+MgTYD0J65dslit3q2Vo3ck3kaeTbaBLIzZdSeNxxpCH4WHw2h5VmMuRwOOXy
	6srdycJFY3h4WPyerRLHjncYkdpUeKWSWfQVCtCCDBIj/Vm38tmGMDieWoJ6wB1tBtlEsR3xKQy
	VhhXYEHGAjAztJ0AADecEM9P4dvTvPiIm6sOBiqKtpK3aNeLSv2vnwa2vZY/AhfgqOwQb+jdjKT
	CFpJdRoztdkEKkxEVdiiEyWfl88lF26SHMxFtxj4/nCTJg2PgavPvyiepxGE0tIGWiZA6q9quua
	X6z0XJOY7LGRRZcOT11L/nksVirSk5+bv+02tb/vaYLoo2X5EQ+F3dnCTvLvQerS/+RtNOw+T+X
	t7kHvCi6Iqw99d1cRog5M5wt
X-Received: by 2002:a05:600c:3b20:b0:499:4893:97d3 with SMTP id 5b1f17b1804b1-4994e7cb8ebmr91552645e9.13.1785944819162;
        Wed, 05 Aug 2026 08:46:59 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e52d819sm48307915e9.1.2026.08.05.08.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:46:58 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCHv2] python3-pikepdf: Upgrade 10.10.0 -> 10.11.0
Date: Wed,  5 Aug 2026 18:46:55 +0300
Message-ID: <20260805154655.2870084-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 15:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128821

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

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-pikepdf_10.10.0.bb => python3-pikepdf_10.11.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.10.0.bb => python3-pikepdf_10.11.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
index 7355c68c8b..91ea5fd821 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.11.0.bb
@@ -1,9 +1,10 @@
-SUMMARY = "Read and write PDFs with Python, powered by qpdf"
+SUMMARY = "Read, write, repair, and transform PDFs in Python, powered by qpdf"
+DESCRIPTION = "A Python library for reading and writing PDF, powered by QPDF"
 HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "9f134806b2fe608ccb21379a664ddcefeac3f6944100d343b350299d3c69754e"
+SRC_URI[sha256sum] = "4bebc59ac74411064e7c97a4036174023e22ccbecd22b78750ab76551eb38988"
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
-- 
2.47.3


