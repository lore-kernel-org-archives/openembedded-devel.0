Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25914C4167B
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:09:51 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.11093.1699963789019452556
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=D+ngx03l;
 spf=pass (domain: konsulko.com, ip: 209.85.167.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5098e423ba2so7929795e87.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 04:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1699963787; x=1700568587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ktc6o8sFyKTum8H6hXTAsW3agISEEZ282rsjoV5bmI=;
        b=D+ngx03lx80ug4kIQPVPykiIgN9cEvPZRWSez4kUc7PLsKRU4nJiws+MTAoMi6GZdY
         g1YG20fKaubqr1/kGfaqqzcty0f2ZVDJLQ8pZURiIWMcbJlOJxdweEsoEfP9AuQDfS+N
         /eWPt3O/XfQwHlU1Pw0ZFj80Cz06hW+Oh0y8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699963787; x=1700568587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ktc6o8sFyKTum8H6hXTAsW3agISEEZ282rsjoV5bmI=;
        b=sJKEkB17xatYY9zTXeH/Mbdus9vgIixV1ERnW4gzFr2tAPWQlz2IKr2HvU2MXxjEbO
         P7BH2lc8satQJWTwFiuSRZ3XLcYLOFYd5+/6Xc6oPnI+pUxVBZdp1tAgktNRbZNmvVI4
         T75u1Pe2ac24bul9HYlbRcGdnV/hOrGL7+cDcoLc8Q3oUpqOMj7QSQF2vKO6IUGIHjZK
         0yUI2WKRwURdDcnF2ndagHLfmfnzsHQJ1KOd+bv8ftbQchq8kqVBYhB+ivUVOpzY+AzU
         hOR+G0yE1AkOATU38zesSHtv6NP7nN4ogjJrYMlNtLToGf1cMNIMzH+15sddc1zVfmHy
         Klqg==
X-Gm-Message-State: AOJu0YwlHeQkbCIidGX19X2zL0u8+jRWAJjj6wF9fq7lXLKuhlbg+b4x
	AzVzIx0PoLkrpx7897f1cJBhfC/8GXr90MeRsAU=
X-Google-Smtp-Source: AGHT+IFfv6PicMg5qPnHPO925oCV/pAxqSdo0mpMrA6U36sSCeV1/sg4HwgZcS6zer1o3srGEKFndA==
X-Received: by 2002:a05:6512:3044:b0:50a:77bf:1efe with SMTP id b4-20020a056512304400b0050a77bf1efemr7190571lfb.27.1699963786811;
        Tue, 14 Nov 2023 04:09:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id o5-20020aa7c505000000b00532eba07773sm4946958edq.25.2023.11.14.04.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 04:09:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-pillow: Upgrade 10.0.1 -> 10.1.0
Date: Tue, 14 Nov 2023 14:09:40 +0200
Message-Id: <20231114120944.3741068-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 12:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106709

Upgrade to release 10.1.0:

- Added TrueType default font to allow for different sizes
- Fixed invalid argument warning
- Added ImageOps cover method
- Catch struct.error from truncated EXIF when reading JPEG DPI
- Consider default image when selecting mode for PNG save_all
- Support BGR;15, BGR;16 and BGR;24 access, unpacking and putdata
- Added CMYK to RGB unpacker
- Improved flexibility of XMP parsing
- Support reading 8-bit YCbCr TIFF images
- Allow saving I;16B images as PNG
- Corrected drawing I;16 points and writing I;16 text
- Set blue channel to 128 for BC5S
- Increase flexibility when reading IPTC fields
- Set C palette to be empty by default
- Added gs_binary to control Ghostscript use on all platforms
- Read bounding box information from the trailer of EPS files if
  specified
- Added reading 8-bit color DDS images
- Added has_transparency_data
- Fixed bug when reading BC5S DDS images
- Prevent TIFF orientation from being applied more than once
- Use previous pixel alpha for QOI_OP_RGB
- Added BC5U reading
- Allow getpixel() to accept a list
- Allow GaussianBlur and BoxBlur to accept a sequence of x and y
  radii
- Expand JPEG buffer size when saving optimized or progressive
- Added session type check for Linux in ImageGrab.grabclipboard()
- Allow "loop=None" when saving GIF images
- Fixed transparency when saving P mode images to PDF
- Added saving LA images as PDFs
- Set SMaskInData to 1 for PDFs with alpha
- Changed Image mode property to be read-only by default
- Silence exceptions in _repr_jpeg_ and _repr_png_
- Do not use transparency when saving GIF if it has been removed
  when normalizing mode
- Fix missing symbols when libtiff depends on libjpeg

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-pillow_10.0.1.bb => python3-pillow_10.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pillow_10.0.1.bb => python3-pillow_10.1.0.bb} (96%)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.0.1.bb b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
similarity index 96%
rename from meta-python/recipes-devtools/python/python3-pillow_10.0.1.bb
rename to meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
index 055b41bfa..322c90eda 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=10.0.x;protocol=http
            file://0001-explicitly-set-compile-options.patch \
            file://run-ptest \
            "
-SRCREV ?= "82541b6dec8452cb612067fcebba1c5a1a2bfdc8"
+SRCREV ?= "da59ad000d1405eaecd557175e29083a87d19f7c"
 
 inherit setuptools3 ptest
 
-- 
2.39.2


