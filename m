Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF41C77B7C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 14:08:26 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.20063.1751541687171000843
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 04:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EGj5+M1w;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: sanakazi720@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-749248d06faso7990059b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 04:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751541686; x=1752146486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fhwu9MsDI96/PCStdN7SLCgeF6qP8XIhmvW0kdJHmqc=;
        b=EGj5+M1wpd36JgdcyiUaHlw+/iWJ+2VEP1j1lPOKs6Y/IHXbHbaqkHnngviz5LP0fK
         47TifKKaaZPtHMk9u/xbuZdCypCw5jhkpN1w8fLGY8VmAJbDqwKOwxVH1qRVgQEZKgfO
         BLmSpurCSCEpZUT98ekV131TnAWQd4J+yw2nPvWyTlo6Wxw4nPkti9oO3J9kwQ0Epmtp
         VRFd1MCXMrZY6DRWo5gSXRrsAHeHkBk39iayL5CZw8qxKpf2t3EWuXqM+I0mCXHllWFd
         pLQnEOJtiOYr8Esfp04HBT0pXcn1SAXNHho2V6NIxfiFlv6C+t8pPV3/mTypLpl4AHaY
         9ckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751541686; x=1752146486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhwu9MsDI96/PCStdN7SLCgeF6qP8XIhmvW0kdJHmqc=;
        b=NXtOvGYdBAIaWy6EBPE7WoMViMTP21P9x7JORkcek008z00e27/y6VllLyHpQ1LKIg
         4A4Xc0pH+GrEY1LLRR5F8xHg9jlgNeSTk0qxghfV6hgSo9oN5LsUsXvYVCVTlBoMHZI/
         eiic2rTOkUl97hWGOpnAs4rziSg9DjlXV4q8rvvS6RmhD2/SzTxtvrDqKx8toDsCgHPA
         D4Wv7+30Kc2L94BKuqxBJiZDDZvTzDV6X6UELHTxmXC14KZkJPue9n0shK0iYurnlVfR
         7355TV3zdqc+QWB5R0a1jcy+2iCt+NeoThfFo+Iv4bvC0Xq+IT6n+TFMZXtXsiQ8UjVn
         7H9w==
X-Gm-Message-State: AOJu0Yyx4rKKCOzmF2/F1lmFxlQQJnVqvQwF/d7GRA8p1F4AmSgz6zcc
	BhGN/QCjZvjS/CpM1zYwcfUj6/d7rZua7Ver2zheXG/qi0jB4I3PBbJ9o2NUtQ==
X-Gm-Gg: ASbGnctMDfbua7c+cLlRWMl9srRubyxGfBfayv8l9fhvriQlzYPxPNY9FV4Ho9UJ3Cg
	T2jJPngPmbCHlbe/6soIVwxWdwU3HoKuJS0D7dmA8Vaf07kUgBVQIBcZPIVE3EVKDfy8uznTgsL
	dLzhdeIrxjauFb7CEeJk25HFYiqZ+8bFjX/nRvPoid2OLriEPcVHpMFUuwgs38CLZMgGfIDZedR
	XeeUqEZFvJekoWsI+hCwPUXLz3D4TVzs8SMmmhJoXDClhDSVsYU+DmtzEbHBh+1nCnUdEoSKq08
	8fk20odmxrp+Cap1O8ggNDjIl8A2agNxHCL5KM0g0Qk5GjcgYDp7ANW1Nqc1iR7M/8IiJ0XT6ja
	Xi0im
X-Google-Smtp-Source: AGHT+IHkRtKrCcDVNGRH5Jm7sMzy2CZqr00LMEfkJjOfvElmYMd52EyYkcE9g5mChI/VtMrDyx5rUA==
X-Received: by 2002:a05:6a21:38c:b0:1f5:8622:5ed5 with SMTP id adf61e73a8af0-222d7db6275mr11737116637.3.1751541685916;
        Thu, 03 Jul 2025 04:21:25 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c17:76d3:7f92:10d7:fb4:362b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e3008e2esm15139307a12.16.2025.07.03.04.21.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:21:25 -0700 (PDT)
From: "Sana Kazi" <sanakazi720@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone][PATCH 2/2] imagemagick: Fix CVE vulnerablities
Date: Thu,  3 Jul 2025 16:50:55 +0530
Message-Id: <20250703112055.119009-1-sanakazi720@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 14:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118223

Fix following CVEs for imagemagick:
CVE-2023-5341, CVE-2022-1114, CVE-2023-1289 and CVE-2023-34474

Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
---
 .../imagemagick/files/CVE-2022-1114.patch     |  44 +++++++
 .../imagemagick/files/CVE-2023-1289-1.patch   | 114 ++++++++++++++++++
 .../imagemagick/files/CVE-2023-1289.patch     |  21 ++++
 .../imagemagick/files/CVE-2023-34474.patch    |  35 ++++++
 .../imagemagick/files/CVE-2023-5341.patch     |  28 +++++
 .../imagemagick/imagemagick_7.0.10.bb         |   5 +
 6 files changed, 247 insertions(+)
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch

diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch
new file mode 100644
index 0000000000..0bdd67c30b
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch
@@ -0,0 +1,44 @@
+From 8043433ba9ce0c550e09f2b3b6a3f5f62d802e6d Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Tue, 15 Mar 2022 21:59:33 -0400
+Subject: [PATCH] Coders:
+ https://github.com/ImageMagick/ImageMagick/issues/4947
+
+CVE: CVE-2022-1114
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick6/commit/78f03b619d08d7c2e0fcaccab407e3ac93c2ee8f.patch]
+Comments: Refreshed the patch as per codebase
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ coders/dcm.c | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/coders/dcm.c b/coders/dcm.c
+index ce6cecbd68d..879d5694d2a 100644
+--- a/coders/dcm.c
++++ b/coders/dcm.c
+@@ -3239,18 +3239,17 @@ static Image *ReadDCMImage(const ImageIn
+           RelinquishMagickMemory(info_copy);
+         }
+ 
+-      /*
+-        If we're entering a sequence, push the current image parameters onto
+-        the stack, so we can restore them at the end of the sequence.
+-      */
+       if (strcmp(explicit_vr,"SQ") == 0)
+         {
+-          info_copy=(DCMInfo *) AcquireMagickMemory(sizeof(info));
+-          memcpy(info_copy,&info,sizeof(info));
+-          AppendValueToLinkedList(stack,info_copy);
++          /*
++            If we're entering a sequence, push the current image parameters
++            onto the stack, so we can restore them at the end of the sequence.
++          */
++          DCMInfo *clone_info = (DCMInfo *) AcquireMagickMemory(sizeof(info));
++          (void) memcpy(clone_info,&info,sizeof(info));
++          AppendValueToLinkedList(stack,clone_info);
+           sequence_depth++;
+         }
+-
+       datum=0;
+       if (quantum == 4)
+         {
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
new file mode 100644
index 0000000000..5f7cd8033f
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
@@ -0,0 +1,114 @@
+From 9d3dd9192f6710ec8e10f5edda9b7bf67caeb232 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Mon, 6 Mar 2023 14:14:36 -0500
+Subject: [PATCH] recursion detection framework
+
+CVE: CVE-2023-1289
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/9d3dd9192f6710ec8e10f5edda9b7bf67caeb232.patch]
+Comment: Hunk #2 and #3 for draw.c from orignal patch are excluded from this because
+these hunks remove the piece of code not present in imagemagick 7.0.10.
+Refreshed hunk2 of image.c, draw.h and draw.c
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ MagickCore/constitute.c | 12 ++++++++++++
+ MagickCore/draw.c       | 18 +++---------------
+ MagickCore/draw.h       |  3 +++
+ MagickCore/image.c      |  2 ++
+ MagickCore/image.h      |  3 +++
+ 5 files changed, 23 insertions(+), 15 deletions(-)
+
+diff --git a/MagickCore/constitute.c b/MagickCore/constitute.c
+index aa1a0c2682b..5c84602da87 100644
+--- a/MagickCore/constitute.c
++++ b/MagickCore/constitute.c
+@@ -130,6 +130,11 @@
+ %    o exception: return any errors or warnings in this structure.
+ %
+ */
++/*
++  Define declarations.
++*/
++#define MaxReadRecursionDepth  100
++
+ MagickExport Image *ConstituteImage(const size_t columns,const size_t rows,
+   const char *map,const StorageType storage,const void *pixels,
+   ExceptionInfo *exception)
+@@ -558,9 +558,16 @@ MagickExport Image *ReadImage(const Imag
+       if (GetMagickDecoderThreadSupport(magick_info) == MagickFalse)
+         LockSemaphoreInfo(magick_info->semaphore);
+       status=IsCoderAuthorized(read_info->magick,ReadPolicyRights,exception);
++      if (((ImageInfo *) image_info)->recursion_depth++ > MaxReadRecursionDepth)
++        {
++          (void) ThrowMagickException(exception,GetMagickModule(),CoderError,
++            "NumberOfImagesIsNotSupported","`%s'",read_info->magick);
++          status=MagickFalse;
++        }
+       image=(Image *) NULL;
+       if (status != MagickFalse)
+         image=decoder(read_info,exception);
++      ((ImageInfo *) image_info)->recursion_depth--;
+       if (GetMagickDecoderThreadSupport(magick_info) == MagickFalse)
+         UnlockSemaphoreInfo(magick_info->semaphore);
+     }
+diff --git a/MagickCore/draw.c b/MagickCore/draw.c
++index ff78d620afd..c875c07acc6 100644
++--- a/MagickCore/draw.c
+++++ b/MagickCore/draw.c
+@@ -5916,7 +5916,8 @@ MagickExport void GetDrawInfo(const Imag
+   (void) LogMagickEvent(TraceEvent,GetMagickModule(),"...");
+   assert(draw_info != (DrawInfo *) NULL);
+   (void) memset(draw_info,0,sizeof(*draw_info));
+-  clone_info=CloneImageInfo(image_info);
++  draw_info->image_info=image_info;
++  clone_info=CloneImageInfo(draw_info->image_info);
+   GetAffineMatrix(&draw_info->affine);
+   exception=AcquireExceptionInfo();
+   (void) QueryColorCompliance("#000F",AllCompliance,&draw_info->fill,
+diff --git a/MagickCore/draw.h b/MagickCore/draw.h
+index 38a52e20361..69257fc02a1 100644
+--- a/MagickCore/draw.h
++++ b/MagickCore/draw.h
+@@ -340,6 +340,9 @@ typedef struct _DrawInfo
+ 
+   char
+     *id;
++
++  const ImageInfo
++    *image_info;  
+ } DrawInfo;
+ 
+ typedef struct _PrimitiveInfo
+diff --git a/MagickCore/image.c b/MagickCore/image.c
+index 9bf47e6e01d..8289139bf6f 100644
+--- a/MagickCore/image.c
++++ b/MagickCore/image.c
+@@ -995,6 +995,7 @@ MagickExport ImageInfo *CloneImageInfo(c
+     MagickPathExtent);
+   clone_info->channel=image_info->channel;
+   (void) CloneImageOptions(clone_info,image_info);
++  clone_info->recursion_depth=image_info->recursion_depth;
+   clone_info->debug=IsEventLogging();
+   clone_info->signature=image_info->signature;
+   return(clone_info);
+@@ -1350,6 +1350,7 @@ MagickExport void GetImageInfo(ImageInfo
+   image_info->quality=UndefinedCompressionQuality;
+   image_info->antialias=MagickTrue;
+   image_info->dither=MagickTrue;
++  image_info->depth=0;
+   synchronize=GetEnvironmentValue("MAGICK_SYNCHRONIZE");
+   if (synchronize != (const char *) NULL)
+     {
+diff --git a/MagickCore/image.h b/MagickCore/image.h
+index b9d870a9271..df6bf9bd103 100644
+--- a/MagickCore/image.h
++++ b/MagickCore/image.h
+@@ -492,6 +492,9 @@ struct _ImageInfo
+ 
+   PixelInfo
+     matte_color;        /* matte (frame) color */
++
++  size_t
++    recursion_depth;  /* recursion detection */
+ };
+ 
+ extern MagickExport ChannelType
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch
new file mode 100644
index 0000000000..944754fb3d
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch
@@ -0,0 +1,21 @@
+From c5b23cbf2119540725e6dc81f4deb25798ead6a4 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Mon, 6 Mar 2023 15:26:32 -0500
+Subject: [PATCH] erecursion detection
+CVE: CVE-2023-1289
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/c5b23cbf2119540725e6dc81f4deb25798ead6a4]
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ MagickCore/draw.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+--- a/MagickCore/draw.c	2025-05-12 13:34:26.689655000 +0530
++++ b/MagickCore/draw.c	2025-05-12 13:45:30.136300211 +0530
+@@ -5526,6 +5526,7 @@ MagickExport MagickBooleanType DrawPrimi
+       if (primitive_info->text == (char *) NULL)
+         break;
+       clone_info=AcquireImageInfo();
++      clone_info->recursion_depth=draw_info->image_info->recursion_depth;      
+       composite_images=(Image *) NULL;
+       if (LocaleNCompare(primitive_info->text,"data:",5) == 0)
+         composite_images=ReadInlineImage(clone_info,primitive_info->text,
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
new file mode 100644
index 0000000000..e7b7783f47
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
@@ -0,0 +1,35 @@
+From 1061db7f80fdc9ef572ac60b55f408f7bab6e1b0 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Mon, 15 May 2023 14:22:11 -0400
+Subject: [PATCH] carefully crafted image files (TIM2, JPEG) no longer overflow
+ buffer nor use heap after free (thanks to Juzhi Lu, Zhen Zhou, Likang Luo of
+ NSFOCUS Security Team)
+
+CVE: CVE-2023-34474
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/1061db7f80fdc9ef572ac60b55f408f7bab6e1b0.patch]
+Comment: Remove hunk from MagickCore/profile.c. as it fixes as the vulnerable function
+ImageMagick's ReplaceXmpValue() that introduces CVE-2023-34475 is not present in 7.0.10 version
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ MagickCore/profile.c | 5 +++--
+ coders/tim2.c        | 4 +++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/coders/tim2.c b/coders/tim2.c
+index 0445985dcc0..d30afaf05d6 100644
+--- a/coders/tim2.c
++++ b/coders/tim2.c
+@@ -517,10 +517,12 @@ static MagickBooleanType ReadTIM2ImageData(const ImageInfo *image_info,
+     /*
+       * ### Read CLUT Data ###
+       */
+-    clut_data=(unsigned char *) AcquireQuantumMemory(1,header->clut_size);
++    clut_data=(unsigned char *) AcquireQuantumMemory(2,
++      MagickMax(header->clut_size,image->colors));
+     if (clut_data == (unsigned char *) NULL)
+       ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
+         image_info->filename);
++    (void) memset(clut_data,0,2*MagickMax(header->clut_size,image->colors));
+     count=ReadBlob(image,header->clut_size,clut_data);
+     if (count != (ssize_t) (header->clut_size))
+       {
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch b/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch
new file mode 100644
index 0000000000..e26dd61fba
--- /dev/null
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch
@@ -0,0 +1,28 @@
+From aa673b2e4defc7cad5bec16c4fc8324f71e531f1 Mon Sep 17 00:00:00 2001
+From: Cristy <urban-warrior@imagemagick.org>
+Date: Sun, 24 Sep 2023 07:28:19 -0400
+Subject: [PATCH] check for BMP file size, poc provided by Hardik Shah of
+ Vehere (Dawn Treaders team)
+
+CVE: CVE-2023-5341
+Upstream-Status: Backport [https://github.com/ImageMagick/ImageMagick/commit/aa673b2e4defc7cad5bec16c4fc8324f71e531f1.patch]
+Comment: Refresh hunk as per codebase
+Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
+---
+ coders/bmp.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/coders/bmp.c b/coders/bmp.c
+index 94ec6628fdf..7e36d4f481b 100644
+--- a/coders/bmp.c
++++ b/coders/bmp.c
+@@ -625,6 +625,9 @@ static Image *ReadBMPImage(const ImageIn
+     if (image->debug != MagickFalse)
+       (void) LogMagickEvent(CoderEvent,GetMagickModule(),"  BMP size: %u",
+         bmp_info.size);
++    if ((bmp_info.file_size != 0) &&
++        ((MagickSizeType) bmp_info.file_size > GetBlobSize(image)))
++      ThrowReaderException(CorruptImageError,"ImproperImageHeader");
+     profile_data=0;
+     profile_size=0;
+     if (bmp_info.size == 12)
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
index 6108dece27..ce5489bb3e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
@@ -18,6 +18,11 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
     file://CVE-2022-0284.patch \
     file://fix-cipher-leak.patch \
     file://CVE-2022-2719.patch \
+    file://CVE-2022-1114.patch \
+    file://CVE-2023-1289-1.patch \
+    file://CVE-2023-1289.patch \
+    file://CVE-2023-34474.patch \
+    file://CVE-2023-5341.patch \
 "
 
 SRCREV = "35b4991eb0939a327f3489988c366e21068b0178"
-- 
2.25.1


