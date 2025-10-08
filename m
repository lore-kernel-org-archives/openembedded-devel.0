Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918F5CCD18B
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:59:29 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.2626.1759957163595622258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dX9tWHWQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso42960966b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 13:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759957162; x=1760561962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vbef4fcnHgQ7HkeCp7wT3l9llGhtcDZ1ulPVrmTAFI8=;
        b=dX9tWHWQkmC4N5C+ZYsoYI+9eEIOqD6UfgC+fs5eZb2jwsaj1i0JvpTnbLsqeurdhU
         bHIs6rbtCBkc9sTV/M4kowFllQP8/MYCS/zwhAG19rz2VSjQu/Ki8q6VeEbPDEfCPrfz
         l64Cwmcdi2FwPU/aKCokKEroIpvNRZ2CRVdVN/evEPlF96qvqHVc6Zbu/W/WSdvOetEN
         7z2/XXeqHsZxJP6Qox8NLVZ0Wn+5eOQ1ksprF52Uc8syDIkvlePfTSEQjZ6hOtX8i5KE
         Yf5TMFbwI8/QSIPGqgwRhQo+WqaNke+tk+PcdIahGo3eHEijDhjsTWpcq8wXaK8NaYoS
         hiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759957162; x=1760561962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vbef4fcnHgQ7HkeCp7wT3l9llGhtcDZ1ulPVrmTAFI8=;
        b=w6/f8Zsw2PuxwB5Wje9yaXi2d5TInzGuviFF8XpDOrgwhNgAYfkn4gz60+yTBOVb6L
         JAX6mN9cplL27Oux3BoXNCQdslskEKGuNkLTXdobi2QznZgUoH9oTvHCzGq1g7qnyv3f
         Ar7wCnzTJyDRlr5n/pM/mDALncJbK3zgtn0lMBK9Db8mHx3TUMxr0Jc6Gt5ODgQkfXa+
         ct1LMEILXNVa/LG8nnFs6b0tgw7LjKJ/vhghrHmP0PQ2CXYc5AJQLaW1sqQf1aqVL2av
         6u6WLEK7hfdQO7lCDDkU9dYen1IhJKYlILrswRXKGVNqu++sWn4ORQpmzZBxKphp0Jpt
         ohEA==
X-Gm-Message-State: AOJu0Yx1oCembXiFKeSo1FwphUL+Mqm1U4jMA2JZuZdUHQGGdRBiwhcH
	xlYf5pBPotsontAMk5aFORZZ8QGyW9exJW4ZZY/AI5FYX4cgwpe7uhTXko8RtM0E
X-Gm-Gg: ASbGncvysHs+0C8qDymYPvVcSYKPV11mvOutNqTe0Lf1cTK9i6MY0Lmy7Z/K9wjqz4C
	38A7e7sLnalrDr36wEAWBJ3DCqcalJJS0O0LW0Zg1w0KbxrktkXuaDZP+yCslokzP0OQArDsAZo
	N8O0yBtYOwtwzNhv2XqSvD59j5uS2SpC0plgtgwHnGAALyqbCczojZS3yV0LF9hbGYULJaTVlq9
	VO6Ag7Utbtn4/tj+Q01AJZB2XLroEvEzCSiDYWk/eGgDAIvxhtxQb7lSth6FBrI90XdOu0rYb8x
	KN7bc3iFF0xHOfGkAOpga2zyekPpR/EUJd7tCt8800ojqbaMBZFjflj1ls5Cf9WUFfCadLyWlqV
	+kseD7SCy9dXBea2aPMjhWI+gx/uRwra3Bj0MsPURFCqW
X-Google-Smtp-Source: AGHT+IFEL/VXe7OR2h8aZidiBFIFQqXs2L6FqBUUdq1gxTCqCcygRSlT+bhmrZ0dn5vGniTtXVjAAw==
X-Received: by 2002:a17:906:6a28:b0:b3e:8252:cd54 with SMTP id a640c23a62f3a-b50ac2cf465mr597729966b.32.1759957161817;
        Wed, 08 Oct 2025 13:59:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1740511166b.86.2025.10.08.13.59.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 13:59:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 10/11] imagemagick: patch CVE-2025-57803
Date: Wed,  8 Oct 2025 22:59:13 +0200
Message-ID: <20251008205914.598660-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008205914.598660-1-skandigraun@gmail.com>
References: <20251008205914.598660-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 20:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120393

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57803

Pick the commit mentioned in the details.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../imagemagick/0001-CVE-2025-57803.patch     | 61 +++++++++++++++++++
 .../imagemagick/imagemagick_7.1.1-43.bb       |  1 +
 2 files changed, 62 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57803.patch

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57803.patch b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57803.patch
new file mode 100644
index 0000000000..dae3e91fe0
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/imagemagick/0001-CVE-2025-57803.patch
@@ -0,0 +1,61 @@
+From 6880d5335086451a88fe31fd3109d2cb7c1d5545 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sat, 23 Aug 2025 09:18:40 -0400
+Subject: [PATCH] CVE-2025-57803
+
+https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-mxvv-97wh-cfmm
+
+CVE: CVE-2025-57803
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/2c55221f4d38193adcb51056c14cf238fbcc35d7]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ coders/bmp.c | 20 ++++++++++++++++----
+ 1 file changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/coders/bmp.c b/coders/bmp.c
+index d4f58b8ea..8f318e2dc 100644
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
+@@ -1109,12 +1115,18 @@ static Image *ReadBMPImage(const ImageInfo *image_info,ExceptionInfo *exception)
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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
index eed07642d9..8f6e816060 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.1-43.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://0001-CVE-2025-55154.patch \
            file://0001-CVE-2025-55160.patch \
            file://0001-CVE-2025-55212.patch \
+           file://0001-CVE-2025-57803.patch \
            "
 SRCREV = "a2d96f40e707ba54b57e7d98c3277d3ea6611ace"
 

