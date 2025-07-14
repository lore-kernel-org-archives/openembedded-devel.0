Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B58C83F21
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 13:59:22 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.73884.1752483458412538081
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 01:57:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BYMczd4x;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23508d30142so41625685ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 01:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752483457; x=1753088257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FpexvJvvRHJVm+cKD0kL0s3B62qhHoDUFxOZUocP+4=;
        b=BYMczd4xfHEopfoxjLE/Tg5t2I4iOMNI9VqZ2dlVM0ZuejJ5eM3OxtPhJgiPifVjtE
         0wwsE7DHszDfVxkOuwlLNgHxPWc5zJYcuHGZB5Irh8UgFjVx4wzdOeM3QTc6witRgm23
         EhYz+evhKyZYYA8Oie29sKHmZqEyQFFSnC9kE6UG2nDrIbFiFd/sMJxp8THfJH2K3SQi
         ajylc/YVIaGDVFWBoqPzpSWuEbyW+F71nThL1cFKhr/ZPnu6/tcmUAKgtJTbEpeuWp6G
         s+r9vtR0IR3O3YT/eQeNWgfRzhBIlZtUb2JO60J/WYWgzJj+EfdNv1Rkz1ERBvm47yjn
         P21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752483457; x=1753088257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FpexvJvvRHJVm+cKD0kL0s3B62qhHoDUFxOZUocP+4=;
        b=wRjqPC7bdn/tLVxYcr21H48Lr+oB6cjlsRfYdnIeEhMEerSSQFpZcIoHhc0zG8a8kH
         kx7rPGoociHA1oY7l+5gkKueMfJMnYRje812OYAF15LuluU7nD9T8ihrr0FkbnuXurDF
         Ctg2X0QtXsJc6mGNW/8Qh1HX9t4/gBYU2DOI8pCP2BNMCC9vq9G9tXdjbsdHbApUIMre
         D67KVZu3yIJ3cP+SpsxJBInxXP2+BHkIZC5qM6n7CRtYBC1Ienx3MldMOdENO/u8/ZQn
         ozt2VXTTGp0KqpMG7Wi05OD02RHy4R2Pm2AWssYrgRWxYLoReVXJcxr0Mhp8Z7++fQ9B
         EqqA==
X-Gm-Message-State: AOJu0Yw6oy9swAnZinbgDhLowo0exj70nMAba19draVz0yMYp0iMNhk1
	exAUnPe3UdGh6mI5DgHp8A3n8woSZaUPcE9/KNjOhY94hkZWWso63vhLJIOmVQ==
X-Gm-Gg: ASbGncuDKkRdmb0/dlFUnLy8GLy1arZpVLFPWBNsmy/+kTk8KyXvbLzH170HOoJZlD0
	hf2q2V9+aLDlOGvMM1nhPS0wGyprxRpgnotqB5i8gapVN65Iwd7U6bvVSmrB5ddDjaq51I1jK9a
	W2VPiUx462WBO8qVwMraTL/lpI89DpL6HxJsKMCYmAVRrk1BcOJ+tdiVIf+pYymEkANBpqcLkgf
	nU9AN5ZD+l8LOXnvIlkU9aA81uYu0Qyi8bqY3ap7obViC8Gnc3O7+LeOYWpNI4dotvmY9Cu623N
	9uyZNA5IYcLdnGhekmXfgWYInRsjAvutp3IyGkIrIIwB5i5lLkjD7lmKiDLAurZ2ltCeA2zmOgm
	cSv2C+Y6uRn4tiJeMs+t1XBNqpUjbLKlYkPoS9A2Iow==
X-Google-Smtp-Source: AGHT+IFXAxcU2RQ3irDIP8cavPJ0CN3+4AOcGOHkJ1a+nPZ1LzGmBsD6+aHsRADXNdmUxLxDJ9w/XQ==
X-Received: by 2002:a17:90b:5387:b0:311:ff18:b84b with SMTP id 98e67ed59e1d1-31c4ccf09b8mr16701740a91.25.1752483457142;
        Mon, 14 Jul 2025 01:57:37 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c16:109b:9344:598d:802f:7ba5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3003f96dsm12773254a91.2.2025.07.14.01.57.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 01:57:36 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCHv2] fix-cipher-leak.patch: Fix patch-fuzz
Date: Mon, 14 Jul 2025 14:27:27 +0530
Message-Id: <20250714085727.160771-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 13:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118534

Refresh fix-cipher-leak.patch to fix patch-fuzz issue.

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../imagemagick/files/fix-cipher-leak.patch   | 51 ++++++++++---------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
index a8985757f2..28fbd9e9ea 100644
--- a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
+++ b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
@@ -9,7 +9,7 @@ Subject: [PATCH] possible divide by zero + clear buffers
  MagickCore/memory.c     | 22 ++++++++++++++++------
  MagickCore/signature.c  |  2 +-
  coders/thumbnail.c      |  3 ++-
- 5 files changed, 41 insertions(+), 25 deletions(-)
+ 5 files changed, 33 insertions(+), 22 deletions(-)
 
 CVE: CVE-2021-20311
 CVE: CVE-2021-20312
@@ -19,35 +19,34 @@ Upstream-Status: Backport[https://github.com/ImageMagick/ImageMagick/commit/70aa
 Comment: Refreshed patch based on the codebase
 
 Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+
 diff --git a/MagickCore/cipher.c b/MagickCore/cipher.c
-index 057b11c4720..91ad1d1d662 100644
+index 908266457..4548f0d60 100644
 --- a/MagickCore/cipher.c
 +++ b/MagickCore/cipher.c
-@@ -484,8 +484,8 @@ static void EncipherAESBlock(AESInfo *ae
+@@ -482,8 +482,8 @@ static void EncipherAESBlock(AESInfo *aes_info,const unsigned char *plaintext,
      Reset registers.
    */
    alpha=0;
 -  (void) memset(key,0,sizeof(key));
 -  (void) memset(text,0,sizeof(text));
 +  (void) ResetMagickMemory(key,0,sizeof(key));
-+  (void) ResetMagickMemory(text,0,sizeof(text));  
++  (void) ResetMagickMemory(text,0,sizeof(text));
  }
- 
-
+ 
  /*
-@@ -708,8 +708,8 @@ MagickExport MagickBooleanType PasskeyDe
+@@ -706,8 +706,8 @@ MagickExport MagickBooleanType PasskeyDecipherImage(Image *image,
    */
    quantum_info=DestroyQuantumInfo(quantum_info);
    aes_info=DestroyAESInfo(aes_info);
 -  (void) memset(input_block,0,sizeof(input_block));
 -  (void) memset(output_block,0,sizeof(output_block));
 +  (void) ResetMagickMemory(input_block,0,sizeof(input_block));
-+  (void) ResetMagickMemory(output_block,0,sizeof(output_block));  
++  (void) ResetMagickMemory(output_block,0,sizeof(output_block));
    return(y == (ssize_t) image->rows ? MagickTrue : MagickFalse);
  }
- 
-
-@@ -925,8 +925,8 @@ MagickExport MagickBooleanType PasskeyEn
+ 
+@@ -923,8 +923,8 @@ MagickExport MagickBooleanType PasskeyEncipherImage(Image *image,
    */
    quantum_info=DestroyQuantumInfo(quantum_info);
    aes_info=DestroyAESInfo(aes_info);
@@ -57,13 +56,12 @@ index 057b11c4720..91ad1d1d662 100644
 +  (void) ResetMagickMemory(output_block,0,sizeof(output_block));
    return(y == (ssize_t) image->rows ? MagickTrue : MagickFalse);
  }
- 
-
+ 
 diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c
-index 2ffc72f88fa..e3b7df339f6 100644
+index ac9f7e91b..b78b84b47 100644
 --- a/MagickCore/colorspace.c
 +++ b/MagickCore/colorspace.c
-@@ -940,15 +940,15 @@ static MagickBooleanType sRGBTransformImage(Image *image,
+@@ -850,15 +850,15 @@ static MagickBooleanType sRGBTransformImage(Image *image,
        if (logmap == (Quantum *) NULL)
          ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
            image->filename);
@@ -83,7 +81,7 @@ index 2ffc72f88fa..e3b7df339f6 100644
        image_view=AcquireAuthenticCacheView(image,exception);
  #if defined(MAGICKCORE_OPENMP_SUPPORT)
        #pragma omp parallel for schedule(static) shared(status) \
-@@ -2502,14 +2502,14 @@ static MagickBooleanType TransformsRGBImage(Image *image,
+@@ -2394,14 +2394,14 @@ static MagickBooleanType TransformsRGBImage(Image *image,
        if (logmap == (Quantum *) NULL)
          ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
            image->filename);
@@ -103,10 +101,10 @@ index 2ffc72f88fa..e3b7df339f6 100644
          logmap[i]=QuantumRange;
        if (image->storage_class == PseudoClass)
 diff --git a/MagickCore/memory.c b/MagickCore/memory.c
-index 2598044486a..01bc80d86c5 100644
+index 060b05e71..5db57acc7 100644
 --- a/MagickCore/memory.c
 +++ b/MagickCore/memory.c
-@@ -1269,26 +1269,36 @@ MagickExport MemoryInfo *RelinquishVirtualMemory(MemoryInfo *memory_info)
+@@ -1230,26 +1230,36 @@ MagickExport MemoryInfo *RelinquishVirtualMemory(MemoryInfo *memory_info)
  %                                                                             %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %
@@ -144,13 +142,13 @@ index 2598044486a..01bc80d86c5 100644
    assert(memory != (void *) NULL);
 -  return(memset(memory,byte,size));
 +  while (n-- != 0)
-+  	*p++=(unsigned char) c;
-+  return(memory);
++       *p++=(unsigned char) c;
++  return(memory);  
  }
- 
+ 
  /*
 diff --git a/MagickCore/signature.c b/MagickCore/signature.c
-index 2d9b0801523..1f79c91b11b 100644
+index f0f0e42e0..f21feda27 100644
 --- a/MagickCore/signature.c
 +++ b/MagickCore/signature.c
 @@ -736,7 +736,7 @@ RestoreMSCWarning
@@ -160,10 +158,10 @@ index 2d9b0801523..1f79c91b11b 100644
 -  (void) memset(W,0,sizeof(W));
 +  (void) ResetMagickMemory(W,0,sizeof(W));
  }
- 
+ 
  /*
 diff --git a/coders/thumbnail.c b/coders/thumbnail.c
-index 59d97380d9e..e92dd312011 100644
+index 1f7900aef..169bcfea8 100644
 --- a/coders/thumbnail.c
 +++ b/coders/thumbnail.c
 @@ -199,7 +199,8 @@ static MagickBooleanType WriteTHUMBNAILImage(const ImageInfo *image_info,
@@ -172,7 +170,10 @@ index 59d97380d9e..e92dd312011 100644
    }
 -  if ((q+length) > (GetStringInfoDatum(profile)+GetStringInfoLength(profile)))
 +  if ((q > (GetStringInfoDatum(profile)+GetStringInfoLength(profile))) ||
-+      (length > (GetStringInfoDatum(profile)+GetStringInfoLength(profile)-q)))
++      (length > (GetStringInfoDatum(profile)+GetStringInfoLength(profile)-q)))  
      ThrowWriterException(CoderError,"ImageDoesNotHaveAThumbnail");
    thumbnail_image=BlobToImage(image_info,q,length,exception);
    if (thumbnail_image == (Image *) NULL)
+-- 
+2.25.1
+
-- 
2.25.1


