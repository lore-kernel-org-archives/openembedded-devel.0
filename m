Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C7FAC3ABC3
	for <webhook@archiver.kernel.org>; Mon, 12 May 2025 10:06:44 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.45451.1747038766389455720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 May 2025 01:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hVEX6/tZ;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: sanakazi720@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2325c56ebdso2966317a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 01:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747038765; x=1747643565; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bS1404f7iSr4ChOBQrTsXXfFcskh+kA1Jv4PKO1jmUk=;
        b=hVEX6/tZu7wGvZ5zba/aFpNQdM4Gsw7LGifnK/Cd7DuOzONFBzsrieU995qsiWQV+4
         jhDEgbICXHs4hYNZinHgHm7lDDK3FYTfXIY8B0qjkQRfbiQtHPQ6OJEXNHBiK+iHZG0o
         CqmRU31C3Pbxiy0CrUxkwo2uz1jQ/ogwxVwv/zQTe6Ysx9cizfyGID6xM0oqS9RD4yCm
         Z7SQRinwtzaIUqGg49ICIg6QPiKQKfBMy5R4oU4uCNRH21ZUvAFzMJVpGJgx05XqnLdE
         BDLUSWFDddwP+UVXBWm+7LIvm6o/B8o4BXwUZzJjXEhPxrCvBoX59CSSKQaST3IwhOPy
         IrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038765; x=1747643565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bS1404f7iSr4ChOBQrTsXXfFcskh+kA1Jv4PKO1jmUk=;
        b=PtHIlDrjgsqUOJChC7ZwKEP3fRtMyIC7wJGuoLFbekRBafs8I8O6sFM0LpOvbRAwdw
         x/POqeTqPQyXIGlKzIq8S09t+YqTIuMzUu1vA/8+D0QxzziNAKNKt0ggjzvjm6YGe5nf
         +BQKNgXc2a84QE5fKlN6u7jbw6VWVTTXrFtjViMUzccBWfJ/AKl0GxD/gHXSwE+QBD3F
         c6nIGdbKwcNwiMRlHEaVcnUsP50K42o5OQgoMXX3E+py9ovrDU+pPjGBvSDIG+exZFmF
         nBBykabfnzZ3GPTLvmKHsRD02aZ9/TPEsEsDTQP2WcBsaJFPko7btveAJ+35BRfpS6Mw
         //Sw==
X-Gm-Message-State: AOJu0YxqvkAKsNV6rQF4PAauQsSZ+3d/Ju+PS7cd65Ihxc5mDCC7fhWs
	GIp/l4K82cBo14wa4h0nyuFXfi7OTYgicScgO6Lr70/sGUG6dg7kXwLqqg==
X-Gm-Gg: ASbGnctaUE8ZrJns1FASDoHW5vhIBnYi9E67ks/QFSbVrBVhW45vTcl1fRpcS/43oQc
	cACGJqChjSfJR3h6w2NDp/7DCGJyMb31SrWcM5cILWm98JoX4ksZVLO5IJyQrpjitKKGUb6pilm
	91JgeXPXBKcAp+8WVArebHtfrIfjhKnU+jqE5lkLIFn6UGp6xA27tahk8izHm4jNDkihz1BUWV8
	l2LN1Ud5dXweczIFxGathlBGCrR/YP2NSNrcEL8tl034p/PAqwLtmQh3tnFgHu1o/H7U7qGKPXO
	K6DxW0jPi8uIy3aqwR7bhy+UKsGWpb+FYeIrTQFOC62eqCTxrFiPBBv43WSAp7w5xrPV1EZmlbk
	53emSpw==
X-Google-Smtp-Source: AGHT+IGS4MptwnFxvUVhpqhEvvj9AnWe4O+Zg9sOaXypDsdnVLomkHBbiMIBYVgO70gKGU+55YqaVg==
X-Received: by 2002:a17:903:41d2:b0:220:c164:6ee1 with SMTP id d9443c01a7336-22fc8e994f4mr184368195ad.32.1747038765104;
        Mon, 12 May 2025 01:32:45 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c17:6966:7ec5:f0c0:94eb:abc7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82c0b82sm57180045ad.245.2025.05.12.01.32.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:32:44 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCH] imagemagick: Fix CVE vulnerablities
Date: Mon, 12 May 2025 14:02:11 +0530
Message-Id: <20250512083211.1571328-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 May 2025 10:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117389

Fix following CVEs for imagemagick:
CVE-2021-20311, CVE-2021-20312, CVE-2021-20313
CVE-2021-20309, CVE-2021-20310, CVE-2021-3610
CVE-2022-0284, CVE-2022-2719
fix-cipher-leak.patch fixes CVE-2021-20311, CVE-2021-20312, CVE-2021-20313

Ignore following CVES as current version is not affected by them:
CVE-2014-9826, CVE-2016-7538, CVE-2017-5506

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../imagemagick/files/CVE-2021-20309.patch    |  25 +++
 .../imagemagick/files/CVE-2021-20310.patch    |  31 +++
 .../imagemagick/files/CVE-2021-3610.patch     |  26 +++
 .../imagemagick/files/CVE-2022-0284.patch     |  34 ++++
 .../imagemagick/files/CVE-2022-2719.patch     | 136 +++++++++++++
 .../imagemagick/files/fix-cipher-leak.patch   | 178 ++++++++++++++++++
 .../imagemagick/imagemagick_7.0.10.bb         |  19 +-
 7 files changed, 448 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2021-20309.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2021-20310.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2021-3610.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-0284.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-2719.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2021-20309.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2021-20309.patch
new file mode 100644
index 0000000000..c5e9b71454
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2021-20309.patch
@@ -0,0 +1,25 @@
+From 94174beff065cb5683d09d79e992c3ebbdead311 Mon Sep 17 00:00:00 2001
+From: Cristy <mikayla-grace@urban-warrior.org>
+Date: Thu, 25 Feb 2021 19:34:39 -0500
+Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/3296
+
+CVE: CVE-2021-20309
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/94174beff065cb5683d09d79e992c3ebbdead311.patch]
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ MagickCore/visual-effects.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MagickCore/visual-effects.c b/MagickCore/visual-effects.c
+index 789660231b9..60a227951f9 100644
+--- a/MagickCore/visual-effects.c
++++ b/MagickCore/visual-effects.c
+@@ -3360,7 +3360,7 @@ MagickExport Image *WaveImage(const Image *image,const double amplitude,
+     }
+   for (i=0; i < (ssize_t) wave_image->columns; i++)
+     sine_map[i]=(float) fabs(amplitude)+amplitude*sin((double)
+-      ((2.0*MagickPI*i)/wave_length));
++      ((2.0*MagickPI*i)*PerceptibleReciprocal(wave_length)));
+   /*
+     Wave image.
+   */
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2021-20310.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2021-20310.patch
new file mode 100644
index 0000000000..f6ac425886
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2021-20310.patch
@@ -0,0 +1,31 @@
+From 75f6f5032690077cae3eaeda3c0165cc765eaeb5 Mon Sep 17 00:00:00 2001
+From: Cristy <mikayla-grace@urban-warrior.org>
+Date: Thu, 25 Feb 2021 19:31:37 -0500
+Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/3295
+
+CVE: CVE-2021-20310
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/75f6f5032690077cae3eaeda3c0165cc765eaeb5.patch]
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ MagickCore/colorspace.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c
+index e3b7df339f6..9c5ea11e300 100644
+--- a/MagickCore/colorspace.c
++++ b/MagickCore/colorspace.c
+@@ -329,11 +329,11 @@ static void inline ConvertXYZToJzazbz(const double X,const double Y,
+   L=0.41478972*Xp+0.579999*Yp+0.0146480*Zp;
+   M=(-0.2015100)*Xp+1.120649*Yp+0.0531008*Zp;
+   S=(-0.0166008)*Xp+0.264800*Yp+0.6684799*Zp;
+-  gamma=pow(L/white_luminance,Jzazbz_n);
++  gamma=pow(L*PerceptibleReciprocal(white_luminance),Jzazbz_n);
+   Lp=pow((Jzazbz_c1+Jzazbz_c2*gamma)/(1.0+Jzazbz_c3*gamma),Jzazbz_p);
+-  gamma=pow(M/white_luminance,Jzazbz_n);
++  gamma=pow(M*PerceptibleReciprocal(white_luminance),Jzazbz_n);
+   Mp=pow((Jzazbz_c1+Jzazbz_c2*gamma)/(1.0+Jzazbz_c3*gamma),Jzazbz_p);
+-  gamma=pow(S/white_luminance,Jzazbz_n);
++  gamma=pow(S*PerceptibleReciprocal(white_luminance),Jzazbz_n);
+   Sp=pow((Jzazbz_c1+Jzazbz_c2*gamma)/(1.0+Jzazbz_c3*gamma),Jzazbz_p);
+   Iz=0.5*Lp+0.5*Mp;
+   *az=3.52400*Lp-4.066708*Mp+0.542708*Sp+0.5;
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2021-3610.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2021-3610.patch
new file mode 100644
index 0000000000..ab42d506db
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2021-3610.patch
@@ -0,0 +1,26 @@
+From 930ff0d1a9bc42925a7856e9ea53f5fc9f318bf3 Mon Sep 17 00:00:00 2001
+From: Cristy <mikayla-grace@urban-warrior.org>
+Date: Thu, 27 May 2021 10:30:17 -0400
+Subject: [PATCH] eliminate heap buffer overflow vulnerability, thanks to
+ ZhangJiaxing (@r0fm1a) from Codesafe Team of Legendsec at Qi'anxin Group
+
+CVE: CVE-2021-3610
+Upstream-Status: https://github.com/ImageMagick/ImageMagick/commit/930ff0d1a9bc42925a7856e9ea53f5fc9f318bf3.patch]
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ coders/tiff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/coders/tiff.c b/coders/tiff.c
+index 277b9788be5..b88ce368ba5 100644
+--- a/coders/tiff.c
++++ b/coders/tiff.c
+@@ -1894,7 +1894,7 @@ static Image *ReadTIFFImage(const ImageInfo *image_info,
+         /*
+           Convert stripped TIFF image.
+         */
+-        extent=2*TIFFStripSize(tiff);
++        extent=4*TIFFStripSize(tiff);
+ #if defined(TIFF_VERSION_BIG)
+         extent+=image->columns*sizeof(uint64);
+ #else
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-0284.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2022-0284.patch
new file mode 100644
index 0000000000..2d1c0d7c8e
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-0284.patch
@@ -0,0 +1,34 @@
+From e50f19fd73c792ebe912df8ab83aa51a243a3da7 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Wed, 19 Jan 2022 16:26:12 -0500
+Subject: [PATCH] https://github.com/ImageMagick/ImageMagick/issues/4729
+
+CVE: CVE-2022-0284
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/e50f19fd73c792ebe912df8ab83aa51a243a3da7.patch]
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ coders/xpm.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/coders/xpm.c b/coders/xpm.c
+index 782ed732544..5f73df8bca4 100644
+--- a/coders/xpm.c
++++ b/coders/xpm.c
+@@ -773,7 +773,7 @@ static MagickBooleanType WritePICONImage(const ImageInfo *image_info,
+               break;
+             for (x=0; x < (ssize_t) picon->columns; x++)
+             {
+-              if (GetPixelAlpha(image,q) == (Quantum) TransparentAlpha)
++              if (GetPixelAlpha(picon,q) == (Quantum) TransparentAlpha)
+                 transparent=MagickTrue;
+               else
+                 SetPixelAlpha(picon,OpaqueAlpha,q);
+@@ -804,7 +804,7 @@ static MagickBooleanType WritePICONImage(const ImageInfo *image_info,
+           break;
+         for (x=0; x < (ssize_t) picon->columns; x++)
+         {
+-          if (GetPixelAlpha(image,q) == (Quantum) TransparentAlpha)
++          if (GetPixelAlpha(picon,q) == (Quantum) TransparentAlpha)
+             SetPixelIndex(picon,(Quantum) picon->colors,q);
+           q+=GetPixelChannels(picon);
+         }
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-2719.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2022-2719.patch
new file mode 100644
index 0000000000..c17eba9afa
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-2719.patch
@@ -0,0 +1,136 @@
+From 716496e6df0add89e9679d6da9c0afca814cfe49 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 3 Apr 2022 14:35:29 -0400
+Subject: [PATCH] do not attempt to write a null image list (thanks to Vinay
+ Rohila)
+
+CVE: CVE-2022-2719
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/716496e6df0add89e9679d6da9c0afca814cfe49.patch]
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ MagickWand/operation.c |  3 ++-
+ coders/tim2.c          | 30 ++++++++++++++----------------
+ 2 files changed, 16 insertions(+), 17 deletions(-)
+
+diff --git a/MagickWand/operation.c b/MagickWand/operation.c
+index 383dc7c8098..95596035367 100644
+--- a/MagickWand/operation.c
++++ b/MagickWand/operation.c
+@@ -4893,7 +4893,8 @@ WandPrivate void CLINoImageOperator(Magi
+       if (IfPlusOp)
+         write_images=CloneImageList(_images,_exception);
+       write_info=CloneImageInfo(_image_info);
+-      (void) WriteImages(write_info,write_images,arg1,_exception);
++      if (write_images != (Image *) NULL)
++        (void) WriteImages(write_info,write_images,arg1,_exception);      
+       write_info=DestroyImageInfo(write_info);
+       if (IfPlusOp)
+         write_images=DestroyImageList(write_images);
+diff --git a/coders/tim2.c b/coders/tim2.c
+index e55170d8205..110542e45ba 100644
+--- a/coders/tim2.c
++++ b/coders/tim2.c
+@@ -60,8 +60,7 @@
+ #include "MagickCore/static.h"
+ #include "MagickCore/string_.h"
+ #include "MagickCore/module.h"
+-
+-
++
+ /*
+  Typedef declarations
+ */
+@@ -123,8 +122,7 @@ typedef enum
+   RGB24=1,
+   RGBA16=2,
+ } TIM2ColorEncoding;
+-
+-
++
+ /*
+ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+ %                                                                             %
+@@ -142,7 +140,8 @@ typedef enum
+ %
+ %  The format of the ReadTIM2Image method is:
+ %
+-%      Image *ReadTIM2Image(const ImageInfo *image_info,ExceptionInfo *exception)
++%      Image *ReadTIM2Image(const ImageInfo *image_info,
++%        ExceptionInfo *exception)
+ %
+ %  A description of each parameter follows:
+ %
+@@ -600,13 +599,13 @@ static MagickBooleanType ReadTIM2ImageData(const ImageInfo *image_info,
+           image_info->filename);
+         break;
+     }
+-    if (csm==CSM1)
++    if (csm == CSM1)
+       {
+         PixelInfo
+           *oldColormap;
+ 
+-        oldColormap=(PixelInfo *) AcquireQuantumMemory((size_t)(image->colors)+1,
+-          sizeof(*image->colormap));
++        oldColormap=(PixelInfo *) AcquireQuantumMemory((size_t)(image->colors)+
++          1,sizeof(*image->colormap));
+         if (oldColormap == (PixelInfo *) NULL)
+           ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
+             image_info->filename);
+@@ -617,7 +616,8 @@ static MagickBooleanType ReadTIM2ImageData(const ImageInfo *image_info,
+   return(status);
+ }
+ 
+-static Image *ReadTIM2Image(const ImageInfo *image_info,ExceptionInfo *exception)
++static Image *ReadTIM2Image(const ImageInfo *image_info,
++  ExceptionInfo *exception)
+ {
+   Image
+     *image;
+@@ -626,6 +626,7 @@ static Image *ReadTIM2Image(const ImageInfo *image_info,ExceptionInfo *exception
+     status;
+ 
+   ssize_t
++    i,
+     str_read;
+ 
+   TIM2FileHeader
+@@ -685,7 +686,7 @@ static Image *ReadTIM2Image(const ImageInfo *image_info,ExceptionInfo *exception
+    */
+   if (file_header.image_count != 1)
+     ThrowReaderException(CoderError,"NumberOfImagesIsNotSupported");
+-  for (int i=0; i < file_header.image_count; ++i)
++  for (i=0; i < (ssize_t) file_header.image_count; i++)
+   {
+     char
+       clut_depth,
+@@ -780,8 +781,7 @@ static Image *ReadTIM2Image(const ImageInfo *image_info,ExceptionInfo *exception
+         break;
+       }
+     image=SyncNextImageInList(image);
+-    status=SetImageProgress(image,LoadImagesTag,image->scene-1,
+-      image->scene);
++    status=SetImageProgress(image,LoadImagesTag,image->scene-1,image->scene);
+     if (status == MagickFalse)
+       break;
+   }
+@@ -790,8 +790,7 @@ static Image *ReadTIM2Image(const ImageInfo *image_info,ExceptionInfo *exception
+     return(DestroyImageList(image));
+   return(GetFirstImageInList(image));
+ }
+-
+-
++
+ /*
+ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+ %                                                                             %
+@@ -825,8 +824,7 @@ ModuleExport size_t RegisterTIM2Image(void)
+   (void) RegisterMagickInfo(entry);
+   return(MagickImageCoderSignature);
+ }
+-
+-
++
+ /*
+ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+ %                                                                             %
diff --git a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
new file mode 100644
index 0000000000..a8985757f2
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
@@ -0,0 +1,178 @@
+From 70aa86f5d5d8aa605a918ed51f7574f433a18482 Mon Sep 17 00:00:00 2001
+From: Cristy <mikayla-grace@urban-warrior.org>
+Date: Thu, 25 Feb 2021 17:05:14 -0500
+Subject: [PATCH] possible divide by zero + clear buffers
+
+---
+ MagickCore/cipher.c     | 12 ++++++------
+ MagickCore/colorspace.c | 16 ++++++++--------
+ MagickCore/memory.c     | 22 ++++++++++++++++------
+ MagickCore/signature.c  |  2 +-
+ coders/thumbnail.c      |  3 ++-
+ 5 files changed, 41 insertions(+), 25 deletions(-)
+
+CVE: CVE-2021-20311
+CVE: CVE-2021-20312
+CVE: CVE-2021-20313
+
+Upstream-Status: Backport[https://github.com/ImageMagick/ImageMagick/commit/70aa86f5d5d8aa605a918ed51f7574f433a18482.patch]
+Comment: Refreshed patch based on the codebase
+
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+diff --git a/MagickCore/cipher.c b/MagickCore/cipher.c
+index 057b11c4720..91ad1d1d662 100644
+--- a/MagickCore/cipher.c
++++ b/MagickCore/cipher.c
+@@ -484,8 +484,8 @@ static void EncipherAESBlock(AESInfo *ae
+     Reset registers.
+   */
+   alpha=0;
+-  (void) memset(key,0,sizeof(key));
+-  (void) memset(text,0,sizeof(text));
++  (void) ResetMagickMemory(key,0,sizeof(key));
++  (void) ResetMagickMemory(text,0,sizeof(text));  
+ }
+ 
+
+ /*
+@@ -708,8 +708,8 @@ MagickExport MagickBooleanType PasskeyDe
+   */
+   quantum_info=DestroyQuantumInfo(quantum_info);
+   aes_info=DestroyAESInfo(aes_info);
+-  (void) memset(input_block,0,sizeof(input_block));
+-  (void) memset(output_block,0,sizeof(output_block));
++  (void) ResetMagickMemory(input_block,0,sizeof(input_block));
++  (void) ResetMagickMemory(output_block,0,sizeof(output_block));  
+   return(y == (ssize_t) image->rows ? MagickTrue : MagickFalse);
+ }
+ 
+
+@@ -925,8 +925,8 @@ MagickExport MagickBooleanType PasskeyEn
+   */
+   quantum_info=DestroyQuantumInfo(quantum_info);
+   aes_info=DestroyAESInfo(aes_info);
+-  (void) memset(input_block,0,sizeof(input_block));
+-  (void) memset(output_block,0,sizeof(output_block));
++  (void) ResetMagickMemory(input_block,0,sizeof(input_block));
++  (void) ResetMagickMemory(output_block,0,sizeof(output_block));
+   return(y == (ssize_t) image->rows ? MagickTrue : MagickFalse);
+ }
+ 
+
+diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c
+index 2ffc72f88fa..e3b7df339f6 100644
+--- a/MagickCore/colorspace.c
++++ b/MagickCore/colorspace.c
+@@ -940,15 +940,15 @@ static MagickBooleanType sRGBTransformImage(Image *image,
+       if (logmap == (Quantum *) NULL)
+         ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
+           image->filename);
+-      black=pow(10.0,(reference_black-reference_white)*(gamma/density)*0.002/
+-        film_gamma);
++      black=pow(10.0,(reference_black-reference_white)*(gamma/density)*0.002*
++        PerceptibleReciprocal(film_gamma));
+ #if defined(MAGICKCORE_OPENMP_SUPPORT)
+       #pragma omp parallel for schedule(static)
+ #endif
+       for (i=0; i <= (ssize_t) MaxMap; i++)
+         logmap[i]=ScaleMapToQuantum((double) (MaxMap*(reference_white+
+-          log10(black+(1.0*i/MaxMap)*(1.0-black))/((gamma/density)*0.002/
+-          film_gamma))/1024.0));
++          log10(black+(1.0*i/MaxMap)*(1.0-black))/((gamma/density)*0.002*
++          PerceptibleReciprocal(film_gamma)))/1024.0));
+       image_view=AcquireAuthenticCacheView(image,exception);
+ #if defined(MAGICKCORE_OPENMP_SUPPORT)
+       #pragma omp parallel for schedule(static) shared(status) \
+@@ -2502,14 +2502,14 @@ static MagickBooleanType TransformsRGBImage(Image *image,
+       if (logmap == (Quantum *) NULL)
+         ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
+           image->filename);
+-      black=pow(10.0,(reference_black-reference_white)*(gamma/density)*0.002/
+-        film_gamma);
++      black=pow(10.0,(reference_black-reference_white)*(gamma/density)*0.002*
++        PerceptibleReciprocal(film_gamma));
+       for (i=0; i <= (ssize_t) (reference_black*MaxMap/1024.0); i++)
+         logmap[i]=(Quantum) 0;
+       for ( ; i < (ssize_t) (reference_white*MaxMap/1024.0); i++)
+         logmap[i]=ClampToQuantum(QuantumRange/(1.0-black)*
+-          (pow(10.0,(1024.0*i/MaxMap-reference_white)*(gamma/density)*0.002/
+-          film_gamma)-black));
++          (pow(10.0,(1024.0*i/MaxMap-reference_white)*(gamma/density)*0.002*
++          PerceptibleReciprocal(film_gamma))-black));
+       for ( ; i <= (ssize_t) MaxMap; i++)
+         logmap[i]=QuantumRange;
+       if (image->storage_class == PseudoClass)
+diff --git a/MagickCore/memory.c b/MagickCore/memory.c
+index 2598044486a..01bc80d86c5 100644
+--- a/MagickCore/memory.c
++++ b/MagickCore/memory.c
+@@ -1269,26 +1269,36 @@ MagickExport MemoryInfo *RelinquishVirtualMemory(MemoryInfo *memory_info)
+ %                                                                             %
+ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
+ %
+-%  ResetMagickMemory() fills the first size bytes of the memory area pointed to
+-%  by memory with the constant byte c.
++%  ResetMagickMemory() fills the first size bytes of the memory area pointed to %  by memory with the constant byte c.  We use a volatile pointer when
++%  updating the byte string.  Most compilers will avoid optimizing away access
++%  to a volatile pointer, even if the pointer appears to be unused after the
++%  call.
+ %
+ %  The format of the ResetMagickMemory method is:
+ %
+-%      void *ResetMagickMemory(void *memory,int byte,const size_t size)
++%      void *ResetMagickMemory(void *memory,int c,const size_t size)
+ %
+ %  A description of each parameter follows:
+ %
+ %    o memory: a pointer to a memory allocation.
+ %
+-%    o byte: set the memory to this value.
++%    o c: set the memory to this value.
+ %
+ %    o size: size of the memory to reset.
+ %
+ */
+-MagickExport void *ResetMagickMemory(void *memory,int byte,const size_t size)
++MagickExport void *ResetMagickMemory(void *memory,int c,const size_t size)
+ {
++  volatile unsigned char
++    *p = memory;
++
++  size_t
++    n = size;
++
+   assert(memory != (void *) NULL);
+-  return(memset(memory,byte,size));
++  while (n-- != 0)
++  	*p++=(unsigned char) c;
++  return(memory);
+ }
+ 
+ /*
+diff --git a/MagickCore/signature.c b/MagickCore/signature.c
+index 2d9b0801523..1f79c91b11b 100644
+--- a/MagickCore/signature.c
++++ b/MagickCore/signature.c
+@@ -736,7 +736,7 @@ RestoreMSCWarning
+   T=0;
+   T1=0;
+   T2=0;
+-  (void) memset(W,0,sizeof(W));
++  (void) ResetMagickMemory(W,0,sizeof(W));
+ }
+ 
+ /*
+diff --git a/coders/thumbnail.c b/coders/thumbnail.c
+index 59d97380d9e..e92dd312011 100644
+--- a/coders/thumbnail.c
++++ b/coders/thumbnail.c
+@@ -199,7 +199,8 @@ static MagickBooleanType WriteTHUMBNAILImage(const ImageInfo *image_info,
+       break;
+     q++;
+   }
+-  if ((q+length) > (GetStringInfoDatum(profile)+GetStringInfoLength(profile)))
++  if ((q > (GetStringInfoDatum(profile)+GetStringInfoLength(profile))) ||
++      (length > (GetStringInfoDatum(profile)+GetStringInfoLength(profile)-q)))
+     ThrowWriterException(CoderError,"ImageDoesNotHaveAThumbnail");
+   thumbnail_image=BlobToImage(image_info,q,length,exception);
+   if (thumbnail_image == (Image *) NULL)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index b8167f5a72..6108dece27 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -11,11 +11,28 @@ DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
 PV .= "-62"
-SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https \
+    file://CVE-2021-20309.patch \
+    file://CVE-2021-20310.patch \
+    file://CVE-2021-3610.patch \
+    file://CVE-2022-0284.patch \
+    file://fix-cipher-leak.patch \
+    file://CVE-2022-2719.patch \
+"
+
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
 
 S = "${WORKDIR}/git"
 
+# current version is not affected by the CVE which affects versions at least earlier than 6.9.4-0
+CVE_CHECK_IGNORE += "CVE-2014-9826"
+
+# current version is not affected by the CVE which affects versions at least earlier than 6.9.4-0
+CVE_CHECK_IGNORE += "CVE-2016-7538"
+
+# current version is not affected by the CVE which affects versions at least earlier than 7.0.4-4
+CVE_CHECK_IGNORE += "CVE-2017-5506"
+
 inherit autotools pkgconfig update-alternatives
 
 # xml disabled because it's using xml2-config --prefix to determine prefix which returns just /usr with our libxml2
-- 
2.25.1


