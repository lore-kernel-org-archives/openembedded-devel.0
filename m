Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C492C83F1A
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 08:39:52 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3249.1752134188851675549
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 00:56:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T5opjJ25;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ef62066eso11779985ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752134188; x=1752738988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=K/aBjWxskXLL2muUcgNLdRSb6N42G+DCbuEEjN2sDFw=;
        b=T5opjJ25WJaZyPmrxWo/FhnZF6mfhseq2T2UYmJG03CphUh/9v+uRPaqFSkKFEiAy/
         MjElxSBvVHuJgYgyyLqRer3/pgvUYMMbExBAC23ls3dz0hy66j7WOuzShpvmaVHpxAVt
         tE6eNxUu/0ENWo6C9l2rI4qj5lxvDhITNufvqPG20FU/X/vLjtqZvcgxO8qwsNPeEudg
         glAjZ/kcwOVLJM9uvCYu45QS8CTu7XdO42xPgtmZ8KJZTvsv7soRJnFQVksiYvGO3cFA
         R45pYRKIQGIAoL13hgBr/BlvEaCnpmcsuMNBmj99M1PAvaxuvVH89o6o+SAwMum50DYE
         YizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752134188; x=1752738988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/aBjWxskXLL2muUcgNLdRSb6N42G+DCbuEEjN2sDFw=;
        b=hg7xu5lT4OaoBEnnODlUb9bKN2xGEa6wDOLhRiMEvE2lPT5vm8I63rebO8IRTdtcbw
         IyJvoo/F/MEIr62tZFqSTYSbxm3+ukFCYZWWKF9Qe6tlJwlyMBsQbnas7Tuyw61nujU6
         HKTIPOrVLMKIoi2RRe9O0fxJkEgwdVWyoMYogaTj+qZryy+k7Kxxbcvc9DuU/rgIuzTl
         kHu9qWrFAL1tRtn1+7WEsjcz5WFrhKI94UhJ3/NQN2tSSGUoti/u75NDYd6/YqVCOVzF
         tNioeysMuy+NXA2u7I03nfg1d53q6uHO9akdEFuWADKnEY9cYTD+x5gdEADSOPxPflwa
         Blyw==
X-Gm-Message-State: AOJu0Yz7RfXB7SKIMZZ+r0X1Ny0sRD+SEgVuBD8gOKLAjlUoqPYyCete
	CJlPu8lW5NsY+g5iC+PI6N+dVih5TA78/5e2PCR7jOgY88YXtwiGB90N7huRuQ==
X-Gm-Gg: ASbGncvIpvxSVr8CTA0QrxlVehvfbCaCeE3Mboe5haeEMIc/U/CR8xF5B+wKOZicz/O
	j+NP/1/L7hPIm6jDk6v94aMPqfXAmq8k6pm3+XGkOKu9eQOnrlTKXcsXeyM85v4BodPkp8Mtdui
	E5EEPGu9iRIiCBw7YaErJ6BsVz9IOdkt+7dZQmCiBIrT2mqkZna7pU5K/cxaqHXVr8+uAGqXflI
	T3uzuiyx6zcYaJ3kAjNMysX0opKUAJT3g3t+02XjvzhjS2QMpU4VDhB8xA+8kSgTPuEqKBRxcMa
	Y2LoGGaVy8YK1ApxQf6+LPujoumRZC4bQ0f6vyL2VY0R+RKPiYafzIRPFms6cp7A6hnizOyvxvt
	ewFF6
X-Google-Smtp-Source: AGHT+IGdqGiUocWA0eOg9WYwE3nNA2qARB2Sv70lRGt+JesTDe2YJbnRxBAH4EFCHYRJD0WVFC0+jA==
X-Received: by 2002:a17:903:17c4:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-23ddb2f2e17mr95764135ad.27.1752134187892;
        Thu, 10 Jul 2025 00:56:27 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c16:109b:a35:e988:994e:b545])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de427ec91sm12939655ad.35.2025.07.10.00.56.26
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:56:27 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCH] fix-cipher-leak.patch: Fix patch-fuzz
Date: Thu, 10 Jul 2025 13:26:05 +0530
Message-Id: <20250710075605.211077-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 08:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118399

Refresh fix-cipher-leak.patch to fix patch-fuzz issue.

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../imagemagick/files/fix-cipher-leak.patch   | 49 ++++++++++---------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
index a8985757f2..2e52a4f6f7 100644
--- a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
+++ b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
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


