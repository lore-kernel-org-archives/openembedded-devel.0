Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DDDC83F1A
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:38:22 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.78862.1752501901658133769
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 07:05:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aEyJsMgn;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: sanakazi720@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b27c1481bso2665905b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752501901; x=1753106701; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/FpexvJvvRHJVm+cKD0kL0s3B62qhHoDUFxOZUocP+4=;
        b=aEyJsMgndQ1e+x5MHZtnNmcTTBqQi8I/nwt+rGr3QIvUtIV3Y8unJ4RJflp7wjepV5
         P8Romu4VlShXEZQ1mi2vxdTM33Exe7ZM3P8S3LKUJGyiEXc+S9ofpOccNLd9ROutmiPw
         C/umtUmkEPJolrFRgm4eG9ZLxRPAk/yVUyZmyLYMGKKC8ecxObMnPEDXP60IfSB57ujz
         gtsvXCcWEyusAwvHYGbctI6SJFK9UcvWZK8RvzD1zrIxM9ZW32cfZNgD0kJubrK3Np8L
         FW86cWK6HQURHp5wsIWByKu46IAnbsXzwrbR48lkTP5nbtY1pOuDb54YehiFr4I5Umse
         U/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501901; x=1753106701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/FpexvJvvRHJVm+cKD0kL0s3B62qhHoDUFxOZUocP+4=;
        b=WgRDsk+XeGiPtqG6p/kVutyXHvM02uP/2ITEM8UDL/v8MZnarDDcjWQE4RDO6QQHaI
         6Ii7sI26RDex06hHFrfKH5T0F164nm+R+FVG/zykIfp9ddJW+zOOqwV7LHuNk16vwGMJ
         Heh+uJ6TnmhIQJF9/AVBDK2TzjPhwuXR85nMGcko2IovvZ/2O3Jh7Z/L1YCe7Z7s0iAq
         Th6/RroRm6UL5T+EnO+lkhs/92D+Ygbg63x5wwVZlluxdrnW8v50c/QeAq2IGOFZmvkb
         e5aXN3YORkGi/V+fhTT5S7Ilfai5Lo2cmzuVqpZ6wvGBR18vISaKtWTmij8qxuOZ5+9x
         jzIQ==
X-Gm-Message-State: AOJu0YyaScxQANrtpCxtGpGkceZnfFvEYNnZQ/4nv5kg5JmeCaJxg+Oy
	gppkllClXGx0VsbG2hYcB5XS5kz5nbou9wCQMo4pFYE89wV/J9hnfOVXbiglAA==
X-Gm-Gg: ASbGncvNWFZN02gosMXN0zYzLFMzJT8Ckojk/I5Mlhw5bD537TBdZKgSzZSGHDIphme
	9q/B4TqZL2FDeYbatAufP2GRSkzHpRUkk4qSxejp0UEUmY03aAxGG0q6MbAHS/ZpLCF49BPDVFz
	z313bM3GdrnCArFmHbsFBHyC1X22Gxz91l2V3BXw3zKtFKTSD4ZNozJGKRMiiiVhNEqvHJ4tPqq
	4ceSMecJhIFCtQnEDeTWJnEJ6nu6/ATKTwXBadjVAhacMZu6NCdUihjKNw6dYI1DBpxAQW/569R
	L18srnCYJl4MXX4U6dcVq0vojK2oxt3ML6IiE6VK1TCSFBWisUWg9Hxm2ed0mfTR5uapDCpTmml
	gFIjYrp3j8idRd/IOCL2aILxbDlGgT/elQNHfoOzX8A==
X-Google-Smtp-Source: AGHT+IE/LpWOQvtjYiBZ7NovPdTJA2aSbdoP2CcThGX59xobDkcifeWZMqyOP6/WACGbpD0+seNKHg==
X-Received: by 2002:a05:6a00:cc5:b0:748:fd94:e62a with SMTP id d2e1a72fcca58-74f1bfe4624mr17664058b3a.1.1752501900716;
        Mon, 14 Jul 2025 07:05:00 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c16:109b:9344:598d:802f:7ba5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f8b954sm10347773b3a.151.2025.07.14.07.04.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:05:00 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCHv3] imagemagick: Fix patch-fuzz for fix-cipher-leak.patch
Date: Mon, 14 Jul 2025 19:34:36 +0530
Message-Id: <20250714140436.478772-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 14:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118539

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


