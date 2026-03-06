Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9409DFCB617
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 15:06:20 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.71239.1772809572758503859
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Mar 2026 07:06:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EX8sIx9H;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso745255e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 07:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772809571; x=1773414371; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+xeOfiHuwB+WAFaJXVwdgdKDMrHYOHWUXL3/VBIytfU=;
        b=EX8sIx9H8b0JLRqUdrpq49f5bGmj/7nJZ1DMxOpaOGGspwaWc9ZFRqRyfe9/1smr4f
         a1QF0g72WhA67BNiJ6CamZFprPTJT+xQlbSKUxqf7q+TeCwjlU/7fr7Gy1FYMuD9xnvR
         85lS8GC8uVNSJ+cfLRhyq6Ce+pXDko4cQ9O0SBnkLQe2PUqapj8Q4hLVv1nMO8iIueRm
         uqm/EmqIlN20KH5ygMYrU2iDil69bHoEprsilM7ZBQKuM9y+nYst9PoCGLx5ZepTiME6
         P+i/RBvN5oSUnuXOFZtLLlUi0pWKpDoY8e9laCBKor0tfd15lRGeSm0/5IOVis4qrBLu
         Apjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772809571; x=1773414371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+xeOfiHuwB+WAFaJXVwdgdKDMrHYOHWUXL3/VBIytfU=;
        b=qfp1bHosr+3jkCCYISGbNHFwpKYTupl2dqGEURbx3fifWQhPbIPNeDkBdNQe+aPSum
         JStbkky6YQdHUaj8cbd7vKgusEP6JRVGJNVwsQS/2c/EA2OU3FOSNAV3RwhCj6DkKFua
         PZPImtju/+TEzbTPsewQ5m45t9+qFeuXP715KM6VFxg1sjYRtMtwxN+NH+f782VrZxJh
         TQHG8AFoUDBcKpV7UXiQPdDS6m24Q6aCjC7TLoLbXFcuUVBWPYJmI0l9SqVY9Mh9MpVB
         fqqGpu30NXA46tVrWndP//+o8ghWVk9FFhhyJXbUsbIUy6ctaWdG7Qb1g4UKYusiiSMt
         wBzQ==
X-Gm-Message-State: AOJu0YzrbDm9GCyegGCfpMQN/sMRXnqyNkgwIGCPiHOmmvUpVWovGgDb
	6OLlma7E1s+c3M5Iyx8F60gN9/apmzkDDZ1nak5VD/23+P7DkRDedjD42ipwmA==
X-Gm-Gg: ATEYQzxG+PTaia5OKNUIF9mPgPktbGheURZTNMdparzo5oqYCmeRcGHrwZCMetZNmcN
	hFmKK5bmyWWlUUHTIFN19+afWnlXOoLRQygLuA0ypXwWU0AYrveWY3j3JhORQNuuKUaOudrPVgh
	eFqhvKq21zW1Hfyn18o/6b8tONkQa3yKMmPaHoHr6hnz9/q7TBTrfs5Qwdr+1TPnTfmLFtRW4qy
	EqLP/GF6oiX0hu21G6uO424wmML/ObMLYo54GjHSA1ZfelrDEn8DOi4QJeAH6VtEWiAk0aYvSg2
	qapO5XyTgWEqrm2VHlAxhZHyP/VWkCgcgo3shNdIsCJvUtY9Ekzkh0/Ri53IWkEaDioLdFwqIYP
	yioTxKGBfjpQyaZGmoKqnG0D20nnzM0w5FAceZm6nzu6cZMH5ophaz78CQErhtVFvqA0tVNTINR
	xl2KOdFUrkwFk20R4+X6xo
X-Received: by 2002:a05:600c:1e88:b0:47e:e952:86c9 with SMTP id 5b1f17b1804b1-485268bd528mr47655955e9.0.1772809570987;
        Fri, 06 Mar 2026 07:06:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681e3fsm38990205e9.6.2026.03.06.07.06.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:06:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 11/11] imagemagick: patch CVE-2026-25798
Date: Fri,  6 Mar 2026 16:06:02 +0100
Message-ID: <20260306150602.616834-11-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306150602.616834-1-skandigraun@gmail.com>
References: <20260306150602.616834-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Mar 2026 15:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124915

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-25798

Backport the patch that mentions the related Github advisory[1]
in its commit message.

[1]: https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p863-5fgm-rgq4

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2026-25798.patch          | 101 ++++++++++++++++++
 .../imagemagick/imagemagick_7.1.2-13.bb       |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
new file mode 100644
index 0000000000..73814f8e12
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2026-25798.patch
@@ -0,0 +1,101 @@
+From a16b3ba623e773a35af509809f40bfa099d2da0c Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 1 Feb 2026 14:56:14 -0500
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-p863-5fgm-rgq4
+
+CVE: CVE-2026-25798
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/16dd3158ce197c6f65e7798a7a5cc4538bb0303e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ MagickCore/cache.c | 37 +++++++++++++++++++++++++++++++++----
+ coders/sixel.c     |  4 ++--
+ 2 files changed, 35 insertions(+), 6 deletions(-)
+
+diff --git a/MagickCore/cache.c b/MagickCore/cache.c
+index 5f44791bd..d0c63cebe 100644
+--- a/MagickCore/cache.c
++++ b/MagickCore/cache.c
+@@ -3561,6 +3561,25 @@ static MagickBooleanType MaskPixelCacheNexus(Image *image,NexusInfo *nexus_info,
+ %
+ */
+ 
++static inline MagickBooleanType CacheOverflowSanityCheckGetSize(
++  const MagickSizeType count,const size_t quantum,MagickSizeType *const extent)
++{
++  MagickSizeType
++    length;
++
++  if ((count == 0) || (quantum == 0))
++    return(MagickTrue);
++  length=count*quantum;
++  if (quantum != (length/count))
++    {
++      errno=ENOMEM;
++      return(MagickTrue);
++    }
++  if (extent != NULL)
++    *extent=length;
++  return(MagickFalse);
++}
++
+ static MagickBooleanType OpenPixelCacheOnDisk(CacheInfo *cache_info,
+   const MapMode mode)
+ {
+@@ -3711,7 +3730,7 @@ static MagickBooleanType OpenPixelCache(Image *image,const MapMode mode,
+     status;
+ 
+   MagickSizeType
+-    length,
++    length = 0,
+     number_pixels;
+ 
+   size_t
+@@ -3789,12 +3808,22 @@ static MagickBooleanType OpenPixelCache(Image *image,const MapMode mode,
+   packet_size=MagickMax(cache_info->number_channels,1)*sizeof(Quantum);
+   if (image->metacontent_extent != 0)
+     packet_size+=cache_info->metacontent_extent;
+-  length=number_pixels*packet_size;
++  if (CacheOverflowSanityCheckGetSize(number_pixels,packet_size,&length) != MagickFalse)
++    {
++      cache_info->storage_class=UndefinedClass;
++      cache_info->length=0;
++      ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed",
++      image->filename);
++    }
+   columns=(size_t) (length/cache_info->rows/packet_size);
+   if ((cache_info->columns != columns) || ((ssize_t) cache_info->columns < 0) ||
+       ((ssize_t) cache_info->rows < 0))
+-    ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed",
+-      image->filename);
++    {
++      cache_info->storage_class=UndefinedClass;
++      cache_info->length=0;
++      ThrowBinaryException(ResourceLimitError,"PixelCacheAllocationFailed",
++        image->filename);
++    }
+   cache_info->length=length;
+   if (image->ping != MagickFalse)
+     {
+diff --git a/coders/sixel.c b/coders/sixel.c
+index a0ae4b8b7..e9d941300 100644
+--- a/coders/sixel.c
++++ b/coders/sixel.c
+@@ -545,7 +545,7 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+                       if (max_x < position_x)
+                           max_x = position_x;
+                       if (max_y < (position_y + i))
+-                          max_y = position_y + i;
++                          max_y = (int) (position_y + i);
+                     }
+                   sixel_vertical_mask <<= 1;
+                 }
+@@ -578,7 +578,7 @@ static MagickBooleanType sixel_decode(Image *image,unsigned char *p,
+                       if (max_x < (position_x+repeat_count-1))
+                         max_x = position_x+repeat_count-1;
+                       if (max_y < (position_y+i+n-1))
+-                        max_y = position_y+i+n-1;
++                        max_y = (int) (position_y+i+n-1);
+                       i+=(n-1);
+                       sixel_vertical_mask <<= (n-1);
+                     }
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
index 2f6c8079cf..f4cceac88d 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-13.bb
@@ -25,6 +25,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2026-25795.patch \
            file://CVE-2026-25796.patch \
            file://CVE-2026-25797.patch \
+           file://CVE-2026-25798.patch \
            "
 
 SRCREV = "dd991e286b96918917a3392d6dc3ffc0e6907a4e"

