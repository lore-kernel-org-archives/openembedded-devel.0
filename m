Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A661C4450B
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 14:15:16 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6761.1784124912315913285
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 07:15:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qRSNuYzz;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so12097705e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 07:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1784124910; x=1784729710; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEA6nIqhZBi93SFy+DoVHNlR1CH12Nl9AVbAv7Xsk8w=;
        b=qRSNuYzzw/3d6zniYoGGduXDszMpBzbcmW2J4Nm8t9HWIL2JMnZwcJRXPo9fYxrcgu
         pWyYFnDvzV5GNkiRpF/71GbQiz2aRXdtDKYC5j7g1N5rbIwZfn8JVz0tQSWPDRW2gFe2
         B5rGPUtRSh95GnyjClfHGA1GqZ2bSyMRdVt4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784124910; x=1784729710;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEA6nIqhZBi93SFy+DoVHNlR1CH12Nl9AVbAv7Xsk8w=;
        b=HbsB7Dv9Wg4/OpV5WFq8/C+rlQmVGei7diaxLAIbe+SCx+LX0e+tVK6MWxBSsNtmRJ
         xQCvyON51mqIC977GnHuuWHbvkL9h+alZRUibm1ztMJmEcjNNunjNRbSAuEQjVPHWrFO
         LsCPZLDsGhf/M5aLL8UFOSIAbrj0sKbSAPT9BS6kCIvg9G5hJF2khV8mTe/ph/APCqr/
         1PzgFEPCbDrQF6Xp9pHtfjdCs6rjB6Fk3hu+w/YA5sFAB/aX2Q6Y6jwHuzhT7/5oRgAX
         OngzwZY7ow6MvDPeEVlTQOA27wXS85JoCAzVARo/uXchxySgdLe0R47DK/K6WmV/4gYt
         LWhw==
X-Gm-Message-State: AOJu0YxCe+OfRKPUarg7vBe1lYz5aH4CCi7JMjhF6e5hH5RUD4yrM2ea
	VFPO+ebKHrU3oJ0KbAOdPOXGyANnTI7UYa1OWwN2Zb92g+mMP3gyekL4Q6/wOfvTT+jLELlr2tG
	w13WN
X-Gm-Gg: AfdE7cmEnG0cAms1IyDrZ7S1hNd3WjJXmmQbQn8ByV9uTILUA3hTNnWzojgm0jrygCn
	WZaW8ZsGnk5nfT1ZjG/diHWALSu0qLsSnzkPKlCMP9JCNfhaqu7tzMdStKjidVj4h1PC1ks8Xi8
	mlHz1ivWE8CqkM4rpiztccfdxTSrG5cEuiwi3I7h3j1ioR2Zhwpi5gmzyHP9bqiX7oIH5c7Tvpa
	Mnx39EcO0Vsje7iY5qKRencsIdwpWGislD1AyxSlGXAa9qLPjELxiBc/+/5v0KKJpIcDSz0YETm
	aUCeyuLuox/1bY8va4dF/cHfeBjY7CwqPtV/JKfTY5PzbNjtPUF2o+NLgHqp2lgbCixB0vp8o4q
	+sr+8GP/VWUuomNGMW1b+X2qVJmCLxqhDZHaozxh4aT1U/kq6t9JmoB9prgzwxBxfVn28PQii4i
	cxujumWuhinIGZXBJLuNmUFsx6RL5D/+j2y+BA9xMTlXl+udrN0pOAYLnwZwE114ZSwvLh4v+Eq
	k6+npt4gUbJZDbxVgIYqCWkU19mH6mDma2iRCzRXQ==
X-Received: by 2002:a05:600c:5395:b0:493:df5d:6ca6 with SMTP id 5b1f17b1804b1-493f881de70mr167827465e9.25.1784124910492;
        Wed, 15 Jul 2026 07:15:10 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950872424asm156777845e9.1.2026.07.15.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:15:09 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-pikepdf: Upgrade 10.9.1 -> 10.10.0
Date: Wed, 15 Jul 2026 17:15:05 +0300
Message-ID: <20260715141507.3352685-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 14:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128219

Upgrade to release 10.10.0:

- {meth}pikepdf.PdfImage.as_pil_image and
  {meth}pikepdf.PdfImage.extract_to now apply an image's soft mask
  (/SMask) or explicit/colour-key mask
- (/Mask) by default, returning an image with an alpha channel (LA
  or RGBA) and writing a transparency-capable format (.png).
  Previously the mask was silently ignored and the opaque base
  image was returned. Images without a mask are unaffected. Pass
  apply_mask=False to recover the old behavior and obtain only the
  opaque base image.
- Image masking is now honored when extracting images. /SMask soft
  masks, /Mask stencil (explicit) masks, and /Mask colour-key masks
  are composited into an alpha channel. Soft-mask images whose
  resolution differs from the base image are resampled to match
  (ISO 32000-2 §8.9.6).
- Added support for /CalRGB, /CalGray and /CalCMYK images, which
  previously raised NotImplementedError. The samples are decoded as
  their device equivalents, and for CalRGB/CalGray an ICC profile
  synthesized from the colour space's WhitePoint/Gamma/Matrix is
  attached to the extracted image so the calibration is preserved
  for colour-managed consumers.
- Added support for the /Lab colour space, extracted as a Pillow
  LAB image (saved as TIFF) with the PDF L*/a*/b* ranges remapped
  to Pillow's conventions.
- Added support for 16-bit-per-component images. 16-bit grayscale
  is extracted losslessly as Pillow I;16; 16-bit RGB and CMYK are
  reduced to 8-bit (with a warning) because Pillow has no
  higher-bit-depth raw mode for them.
- Extended colour-space handling to several cases that previously
  raised NotImplementedError: ICCBased CMYK images and indexed
  images now produce the correct default /Decode array, and inline
  images that name their colour space now resolve it from the
  in-scope /Resources when obtained via
  {func}pikepdf.parse_content_stream.
- JPEG (/DCTDecode) images with a non-default /ColorTransform -- a
  YCCK CMYK or a non-YCbCr RGB JPEG -- are now decoded via Pillow
  (which honours the JPEG's own markers) and transcoded, instead of
  failing to extract.
- Filter chains that wrap a single terminal image codec (/DCTDecode,
  /CCITTFaxDecode, /JPXDecode, /JBIG2Decode) in any number of
  generalized/specialized filters (Flate, LZW, ASCII85/Hex,
  RunLength) are now peeled and extracted seamlessly.
- Added {attr}pikepdf.PdfImage.MAX_IMAGE_PIXELS, a settable
  class-level limit on the number of pixels pikepdf will decode
  from a single image. Until set, it defaults to max(500_000_000,
  PIL.Image.MAX_IMAGE_PIXELS) -- a floor suited to high-DPI scanned
  PDFs -- and tracks Pillow's setting; once assigned it becomes
  independent of Pillow. Set it to None to disable the check.
- {class}pikepdf.Array now implements the standard Python list
  interface: slicing (including del on slices and slice assignment),
  and the clear(), count(), index(), insert(), pop(), remove(),
  and reverse() methods.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pikepdf_10.9.1.bb => python3-pikepdf_10.10.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pikepdf_10.9.1.bb => python3-pikepdf_10.10.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb b/meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
index a0ab6f275a..7355c68c8b 100644
--- a/meta-python/recipes-devtools/python/python3-pikepdf_10.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pikepdf_10.10.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pikepdf/pikepdf"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9741c346eef56131163e13b9db1241b3"
 
-SRC_URI[sha256sum] = "410fcf32bc9c8a0a96d94bbd6268ba7585333b1423b93a5fa2ef3c05f4eba3da"
+SRC_URI[sha256sum] = "9f134806b2fe608ccb21379a664ddcefeac3f6944100d343b350299d3c69754e"
 
 SRC_URI += "file://0001-pyproject.toml-Do-not-strip.patch"
 
-- 
2.47.3


