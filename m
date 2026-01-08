Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331D0D185D0
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 10:54:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4009.1767869657182516929
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jan 2026 02:54:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLJRrIje;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso28596585e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 02:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869655; x=1768474455; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRzxKmn1A1QGuwPOx61H6Hdz6eIjpGaG9xG2UUuQhZs=;
        b=BLJRrIjeI6cBSA8wPGeWNMQtaLziSk0955yORUpcIiMdwe7EhPjENAdF2pVU8/IzuU
         N13f1bVo0PKWSe1V50x2tbXL1zo5VYs2wAH6prsrFxBGui9hsImmPYhgsGjVi4dAngLv
         jl5q3Hogd1IJ6u43EumkVWknVeIDuXAfeJdtUWGvUBWuX/ECPfu7BKRZZf5NJ1d8hjlr
         tuIFyaB8j8BgAJJIxkV3AA4xwBLsZUcMAwQ7VnSHLVERPmwsSZkDH8i4RIJr2jzDekVo
         n1vrInEWdxVN/ZS7kAAo73iM7aCuZamgsbPSffYg4vlPhzyhJUIiZs7T6G1v4iqSbhsm
         Yz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869655; x=1768474455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LRzxKmn1A1QGuwPOx61H6Hdz6eIjpGaG9xG2UUuQhZs=;
        b=pMNABj98MGXhyX89hEfnmSoNHdfVKckLap2J36jzaSALfrVXGm1iCt260OveeKJb30
         +4QAhRMwjMXGY6AkLqAYEkca/DLxkcwMnUZ1VdcJYP06wyB+ykI9dM8iLd22aeV6CjRy
         RTJD7d+TFb62uMEb01Khj7jjwc5WJl5rhgn/lHWnp2yUZ9yLjqxbNajyM6DNia1ILm17
         3ge/pEY7F6bR0nqfIoIU1or8TzYSg31X8aBYeeTX7D5W1XC29zWJ5hulnUL79GsIlz5e
         QMjsENdRsWX6MB7VDqzMJ7sTrdwu0ERS8rCIEGSRqYzrjsOx9b2gTsLHpx/StOFPOsmz
         5vTg==
X-Gm-Message-State: AOJu0YypSKUyUfIdNncOkYqgvAj2Z24ChdYUGa6o/TjrATw4HWrNjIup
	ne+eetA8p3CMacXamuP4z+k4jvHhVkStyMEtiUnhzHP6YBBq4+7eJqAjLLK91A==
X-Gm-Gg: AY/fxX6Wt12k3F43K8gxCrjKIoQ/7/fwBbbwXiE41h7bVDt1JBnzmTxdiCPvE+SQlCt
	/rB1imJxxGMHlQ8Cty0M6+4TbsrDsy9ykIZrwox5fyEsfijtXJ/9hFcEpQ8tAe2DufOzPh+hjhe
	otXU0mmkNbi4LvY5HynzaqzXwt6VVIoVwSIz4l6igZGa1V3u38U/tOirlUR4GlCIZmCrty/31i3
	15KLO1Kz/QfnDOoHN+cCvPZb2IylTGFUuLvGjkOalRuMAAmQFGA/z7qvgJk7ryI7OTyp5v0eXxG
	j7t0A2U32KmgdeCgh/sJJ9sd/s7Tg0pby+VOYO5N3F2Hj1kMq6+bCTyc9M19e6R/RPn8pZ5RvZi
	v2zeT4vnDji7J/UuByVkfxsw3DXWwvmWiured35scl8eP0ai5ep9Iiefv+XVWk+8Zf3mME7oSpr
	r2G0DTjFLv
X-Google-Smtp-Source: AGHT+IF9f5BKOaFThAAmgnbsC5bZQ5yfgrHcGKgpccXvVivXATHB3qZVSZLsOQUEEIRV7/FqIAQUJg==
X-Received: by 2002:a05:600c:1394:b0:47d:3ffa:5f03 with SMTP id 5b1f17b1804b1-47d84b3467emr73562905e9.21.1767869655515;
        Thu, 08 Jan 2026 02:54:15 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f68f69dsm148656615e9.1.2026.01.08.02.54.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 02:54:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 12/15] imagemagick: patch CVE-2025-57803
Date: Thu,  8 Jan 2026 11:53:14 +0100
Message-ID: <20260108105317.460246-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260108105317.460246-1-skandigraun@gmail.com>
References: <20260108105317.460246-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 10:54:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123266

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57803

Backport the patch that is mentioned in the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/CVE-2025-57803.patch          | 60 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1.bb          |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch
new file mode 100644
index 0000000000..0eaf3af163
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-57803.patch
@@ -0,0 +1,60 @@
+From 28b22daea4382d3599ea5a5369354d044c51b124 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 23 Aug 2025 09:18:40 -0400
+Subject: [PATCH] 
+ https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-mxvv-97wh-cfmm
+
+CVE: CVE-2025-57803
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/2c55221f4d38193adcb51056c14cf238fbcc35d7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/bmp.c | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/coders/bmp.c b/coders/bmp.c
+index e05659b22..5c75e7f23 100644
+--- a/coders/bmp.c
++++ b/coders/bmp.c
+@@ -516,6 +516,11 @@ static MagickBooleanType IsBMP(const unsigned char *magick,const size_t length)
+ %
+ */
+ 
++static inline MagickBooleanType BMPOverflowCheck(size_t x,size_t y)
++{
++  return((y != 0) && (x > 4294967295UL/y) ? MagickTrue : MagickFalse);
++}
++
+ static Image *ReadEmbedImage(const ImageInfo *image_info,Image *image,
+   const char *magick,ExceptionInfo *exception)
+ {
+@@ -609,6 +614,7 @@ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exception)
+   size_t
+     bit,
+     bytes_per_line,
++    extent,
+     length;
+ 
+   ssize_t
+@@ -1110,12 +1116,18 @@ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exception)
+       ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     if (bmp_info.compression == BI_RLE4)
+       bmp_info.bits_per_pixel<<=1;
+-    bytes_per_line=4*((image->columns*bmp_info.bits_per_pixel+31)/32);
+-    length=(size_t) bytes_per_line*image->rows;
++    extent=image->columns*bmp_info.bits_per_pixel;
++    bytes_per_line=4*((extent+31)/32);
++    if (BMPOverflowCheck(bytes_per_line,image->rows) != MagickFalse)
++      ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile");
++    length=bytes_per_line*image->rows;
+     if ((MagickSizeType) (length/256) > blob_size)
+       ThrowReaderException(CorruptImageError,"InsufficientImageDataInFile");
+-    pixel_info=AcquireVirtualMemory(image->rows,
+-      MagickMax(bytes_per_line,image->columns+1UL)*sizeof(*pixels));
++    extent=MagickMax(bytes_per_line,image->columns+1UL);
++    if ((BMPOverflowCheck(image->rows,extent) != MagickFalse) ||
++        (BMPOverflowCheck(extent,sizeof(*pixels)) != MagickFalse))
++      ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
++    pixel_info=AcquireVirtualMemory(image->rows,extent*sizeof(*pixels));
+     if (pixel_info == (MemoryInfo *) NULL)
+       ThrowReaderException(ResourceLimitError,"MemoryAllocationFailed");
+     pixels=(unsigned char *) GetVirtualMemoryBlob(pixel_info);
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
index b299f0d2b6..14a9d1eefa 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://CVE-2025-55154.patch \
            file://CVE-2025-55160.patch \
            file://CVE-2025-55212.patch \
+           file://CVE-2025-57803.patch \
            "
 SRCREV = "82572afc879b439cbf8c9c6f3a9ac7626adf98fb"
 

