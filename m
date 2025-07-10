Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61045C83F1D
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 11:35:23 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.5699.1752144754956913897
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 03:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DKxNvQpB;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: sanakazi720@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-236377f00a1so8182905ad.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 03:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752144754; x=1752749554; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sJn5uLA0t8bCD58oBvHli9a6cdBK5CWyvTBvIyr5kSk=;
        b=DKxNvQpBsDAPHwAT2n7xqcFNCIWI+SbyLano02BADEKnR0UzkmPq6NUOAsAc6CJId6
         NZxJEZbbq8iwfqzZlWainwSCtqhTmG0IXoUe6tYH870pcE2dCAvfMlhCtnNXnvE1Jg7J
         NNYFcBBDDXTlsSN1/u2ymNeB19PC0xwAdtf5Q2QKyCQwt5Ito++YoMku7gIvLtpAk+Xy
         01dGl1sSRuK8Bc8Ih3QjR4/7YrPnPaDPFmKkplmaH/lq6ySeho9Dh8vtvrvY39hjUZAn
         Buo0+WvvV5P7ihUKrRHAr9FoQP4b2aZXyT/pB2iURt+XxbwVT8r54WN1fU3dFg9YN0GK
         dHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752144754; x=1752749554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJn5uLA0t8bCD58oBvHli9a6cdBK5CWyvTBvIyr5kSk=;
        b=AqlEuYmWAjg7A4wvd1K+a1eDdvCiP/ODMSeYTkVLsSGGrl15mOEQt8L8KcP9Z9d6+j
         Cam2i6CD/jE9dpCxoROAbMG/UFxItWA/o68DAjJ+RlKqEnE6wTo427+wlWVhEq+2OJVI
         KhwFnSXsjv5Q5zfol2S9laWPilIQEzf+W1lGM5GSffQTxIRTuGf3mSJ38VuH8bxRrLGn
         i7Wnp1dzjSCZMHo0O2L+8cCnB75LLWXEpZKE9+dZYR8lIFU6zlF04jwHzF27BNJlh5vK
         zJCUh1ooBLWONnWJbvyYDVxDyf3YnS7AVzemiGlLl/fRKxW8y0QbfMg7p0PzczXv6OOq
         qsJg==
X-Gm-Message-State: AOJu0YylTuxKXcbHAQLKpd9lF7kW9idG4jDylOZy5um6Ta+3d85Kr2RF
	0Ecx1ceCmUT/4s5ZqFT9wGrx1/rnxAxwpW8M70PZ+sWW1HPczSjvGPqZGwIuaJQjWvHmXXzUAHG
	SFEtdT2oB1Y9Jso1inP0uCUe2CrgQuYIulA==
X-Gm-Gg: ASbGncvGbJSV805Zzuzc9bqXEqVS2603+EK/RLeKH03SLEchyc1+l5Ny3RQegeyPoL1
	rk7mN6TBF2VBmOH+VoSmc/SY2cY2Nrn7jsZxt7kSy/dW7BUUcCdT0vgIaAoKzVcMQoDjaCnroBi
	wLfRFKtb9yCuqi/1NrWSfvoytHfb3DtAnfq/knjTYqQuMvmVLhfzH2JniXou7qR3El3HbxSvNP6
	Ni8yotQP6Hp2W0=
X-Google-Smtp-Source: AGHT+IEt2WJKxrGJnMdIAF2vZQQ4ejtR4p0JgFo3FudmBnTCgQaW1T9RSGeK29bxLhzztYODsRqC16lYvudYRpZ/b6c=
X-Received: by 2002:a17:903:18d:b0:234:986c:66bf with SMTP id
 d9443c01a7336-23ddb1a04d8mr80587625ad.11.1752144753824; Thu, 10 Jul 2025
 03:52:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250703112055.119009-1-sanakazi720@gmail.com>
In-Reply-To: <20250703112055.119009-1-sanakazi720@gmail.com>
From: "Sana Kazi" <sanakazi720@gmail.com>
Date: Thu, 10 Jul 2025 16:22:20 +0530
X-Gm-Features: Ac12FXx1gy7AcBDXnPWnBJ4bEjbIPuxNn5Rniu89rtN0riH_HiZ20pRbFRtqFMM
Message-ID: <CAP0RjeRF+4fGmNbUmbkfVwsVhx5qWskPO4P=-LHsZMA1HF1Hqw@mail.gmail.com>
Subject: Re: [kirkstone][PATCH 2/2] imagemagick: Fix CVE vulnerablities
To: openembedded-devel@lists.openembedded.org
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a5969f063990fd95"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 11:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118411

--000000000000a5969f063990fd95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Could you please tell when this patch will be integrated?

Regards,
Sana Kazi

On Thu, 3 Jul 2025, 4:51=E2=80=AFpm Sana Kazi, <sanakazi720@gmail.com> wrot=
e:

> Fix following CVEs for imagemagick:
> CVE-2023-5341, CVE-2022-1114, CVE-2023-1289 and CVE-2023-34474
>
> Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> ---
>  .../imagemagick/files/CVE-2022-1114.patch     |  44 +++++++
>  .../imagemagick/files/CVE-2023-1289-1.patch   | 114 ++++++++++++++++++
>  .../imagemagick/files/CVE-2023-1289.patch     |  21 ++++
>  .../imagemagick/files/CVE-2023-34474.patch    |  35 ++++++
>  .../imagemagick/files/CVE-2023-5341.patch     |  28 +++++
>  .../imagemagick/imagemagick_7.0.10.bb         |   5 +
>  6 files changed, 247 insertions(+)
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
>  create mode 100644
> meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch
>
> diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patc=
h
> b/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch
> new file mode 100644
> index 0000000000..0bdd67c30b
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch
> @@ -0,0 +1,44 @@
> +From 8043433ba9ce0c550e09f2b3b6a3f5f62d802e6d Mon Sep 17 00:00:00 2001
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Tue, 15 Mar 2022 21:59:33 -0400
> +Subject: [PATCH] Coders:
> + https://github.com/ImageMagick/ImageMagick/issues/4947
> +
> +CVE: CVE-2022-1114
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick6/commit/78f03b619d08d7c2e0fcac=
cab407e3ac93c2ee8f.patch
> ]
> +Comments: Refreshed the patch as per codebase
> +Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
> +---
> + coders/dcm.c | 18 +++++++++---------
> + 1 file changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/coders/dcm.c b/coders/dcm.c
> +index ce6cecbd68d..879d5694d2a 100644
> +--- a/coders/dcm.c
> ++++ b/coders/dcm.c
> +@@ -3239,18 +3239,17 @@ static Image *ReadDCMImage(const ImageIn
> +           RelinquishMagickMemory(info_copy);
> +         }
> +
> +-      /*
> +-        If we're entering a sequence, push the current image parameters
> onto
> +-        the stack, so we can restore them at the end of the sequence.
> +-      */
> +       if (strcmp(explicit_vr,"SQ") =3D=3D 0)
> +         {
> +-          info_copy=3D(DCMInfo *) AcquireMagickMemory(sizeof(info));
> +-          memcpy(info_copy,&info,sizeof(info));
> +-          AppendValueToLinkedList(stack,info_copy);
> ++          /*
> ++            If we're entering a sequence, push the current image
> parameters
> ++            onto the stack, so we can restore them at the end of the
> sequence.
> ++          */
> ++          DCMInfo *clone_info =3D (DCMInfo *)
> AcquireMagickMemory(sizeof(info));
> ++          (void) memcpy(clone_info,&info,sizeof(info));
> ++          AppendValueToLinkedList(stack,clone_info);
> +           sequence_depth++;
> +         }
> +-
> +       datum=3D0;
> +       if (quantum =3D=3D 4)
> +         {
> diff --git
> a/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
> b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
> new file mode 100644
> index 0000000000..5f7cd8033f
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch
> @@ -0,0 +1,114 @@
> +From 9d3dd9192f6710ec8e10f5edda9b7bf67caeb232 Mon Sep 17 00:00:00 2001
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Mon, 6 Mar 2023 14:14:36 -0500
> +Subject: [PATCH] recursion detection framework
> +
> +CVE: CVE-2023-1289
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/9d3dd9192f6710ec8e10f5e=
dda9b7bf67caeb232.patch
> ]
> +Comment: Hunk #2 and #3 for draw.c from orignal patch are excluded from
> this because
> +these hunks remove the piece of code not present in imagemagick 7.0.10.
> +Refreshed hunk2 of image.c, draw.h and draw.c
> +Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
> +---
> + MagickCore/constitute.c | 12 ++++++++++++
> + MagickCore/draw.c       | 18 +++---------------
> + MagickCore/draw.h       |  3 +++
> + MagickCore/image.c      |  2 ++
> + MagickCore/image.h      |  3 +++
> + 5 files changed, 23 insertions(+), 15 deletions(-)
> +
> +diff --git a/MagickCore/constitute.c b/MagickCore/constitute.c
> +index aa1a0c2682b..5c84602da87 100644
> +--- a/MagickCore/constitute.c
> ++++ b/MagickCore/constitute.c
> +@@ -130,6 +130,11 @@
> + %    o exception: return any errors or warnings in this structure.
> + %
> + */
> ++/*
> ++  Define declarations.
> ++*/
> ++#define MaxReadRecursionDepth  100
> ++
> + MagickExport Image *ConstituteImage(const size_t columns,const size_t
> rows,
> +   const char *map,const StorageType storage,const void *pixels,
> +   ExceptionInfo *exception)
> +@@ -558,9 +558,16 @@ MagickExport Image *ReadImage(const Imag
> +       if (GetMagickDecoderThreadSupport(magick_info) =3D=3D MagickFalse=
)
> +         LockSemaphoreInfo(magick_info->semaphore);
> +
>  status=3DIsCoderAuthorized(read_info->magick,ReadPolicyRights,exception)=
;
> ++      if (((ImageInfo *) image_info)->recursion_depth++ >
> MaxReadRecursionDepth)
> ++        {
> ++          (void)
> ThrowMagickException(exception,GetMagickModule(),CoderError,
> ++            "NumberOfImagesIsNotSupported","`%s'",read_info->magick);
> ++          status=3DMagickFalse;
> ++        }
> +       image=3D(Image *) NULL;
> +       if (status !=3D MagickFalse)
> +         image=3Ddecoder(read_info,exception);
> ++      ((ImageInfo *) image_info)->recursion_depth--;
> +       if (GetMagickDecoderThreadSupport(magick_info) =3D=3D MagickFalse=
)
> +         UnlockSemaphoreInfo(magick_info->semaphore);
> +     }
> +diff --git a/MagickCore/draw.c b/MagickCore/draw.c
> ++index ff78d620afd..c875c07acc6 100644
> ++--- a/MagickCore/draw.c
> +++++ b/MagickCore/draw.c
> +@@ -5916,7 +5916,8 @@ MagickExport void GetDrawInfo(const Imag
> +   (void) LogMagickEvent(TraceEvent,GetMagickModule(),"...");
> +   assert(draw_info !=3D (DrawInfo *) NULL);
> +   (void) memset(draw_info,0,sizeof(*draw_info));
> +-  clone_info=3DCloneImageInfo(image_info);
> ++  draw_info->image_info=3Dimage_info;
> ++  clone_info=3DCloneImageInfo(draw_info->image_info);
> +   GetAffineMatrix(&draw_info->affine);
> +   exception=3DAcquireExceptionInfo();
> +   (void) QueryColorCompliance("#000F",AllCompliance,&draw_info->fill,
> +diff --git a/MagickCore/draw.h b/MagickCore/draw.h
> +index 38a52e20361..69257fc02a1 100644
> +--- a/MagickCore/draw.h
> ++++ b/MagickCore/draw.h
> +@@ -340,6 +340,9 @@ typedef struct _DrawInfo
> +
> +   char
> +     *id;
> ++
> ++  const ImageInfo
> ++    *image_info;
> + } DrawInfo;
> +
> + typedef struct _PrimitiveInfo
> +diff --git a/MagickCore/image.c b/MagickCore/image.c
> +index 9bf47e6e01d..8289139bf6f 100644
> +--- a/MagickCore/image.c
> ++++ b/MagickCore/image.c
> +@@ -995,6 +995,7 @@ MagickExport ImageInfo *CloneImageInfo(c
> +     MagickPathExtent);
> +   clone_info->channel=3Dimage_info->channel;
> +   (void) CloneImageOptions(clone_info,image_info);
> ++  clone_info->recursion_depth=3Dimage_info->recursion_depth;
> +   clone_info->debug=3DIsEventLogging();
> +   clone_info->signature=3Dimage_info->signature;
> +   return(clone_info);
> +@@ -1350,6 +1350,7 @@ MagickExport void GetImageInfo(ImageInfo
> +   image_info->quality=3DUndefinedCompressionQuality;
> +   image_info->antialias=3DMagickTrue;
> +   image_info->dither=3DMagickTrue;
> ++  image_info->depth=3D0;
> +   synchronize=3DGetEnvironmentValue("MAGICK_SYNCHRONIZE");
> +   if (synchronize !=3D (const char *) NULL)
> +     {
> +diff --git a/MagickCore/image.h b/MagickCore/image.h
> +index b9d870a9271..df6bf9bd103 100644
> +--- a/MagickCore/image.h
> ++++ b/MagickCore/image.h
> +@@ -492,6 +492,9 @@ struct _ImageInfo
> +
> +   PixelInfo
> +     matte_color;        /* matte (frame) color */
> ++
> ++  size_t
> ++    recursion_depth;  /* recursion detection */
> + };
> +
> + extern MagickExport ChannelType
> diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patc=
h
> b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch
> new file mode 100644
> index 0000000000..944754fb3d
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch
> @@ -0,0 +1,21 @@
> +From c5b23cbf2119540725e6dc81f4deb25798ead6a4 Mon Sep 17 00:00:00 2001
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Mon, 6 Mar 2023 15:26:32 -0500
> +Subject: [PATCH] erecursion detection
> +CVE: CVE-2023-1289
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/c5b23cbf2119540725e6dc8=
1f4deb25798ead6a4
> ]
> +Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
> +---
> + MagickCore/draw.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +--- a/MagickCore/draw.c        2025-05-12 13:34:26.689655000 +0530
> ++++ b/MagickCore/draw.c        2025-05-12 13:45:30.136300211 +0530
> +@@ -5526,6 +5526,7 @@ MagickExport MagickBooleanType DrawPrimi
> +       if (primitive_info->text =3D=3D (char *) NULL)
> +         break;
> +       clone_info=3DAcquireImageInfo();
> ++
> clone_info->recursion_depth=3Ddraw_info->image_info->recursion_depth;
> +       composite_images=3D(Image *) NULL;
> +       if (LocaleNCompare(primitive_info->text,"data:",5) =3D=3D 0)
> +         composite_images=3DReadInlineImage(clone_info,primitive_info->t=
ext,
> diff --git
> a/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
> b/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
> new file mode 100644
> index 0000000000..e7b7783f47
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch
> @@ -0,0 +1,35 @@
> +From 1061db7f80fdc9ef572ac60b55f408f7bab6e1b0 Mon Sep 17 00:00:00 2001
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Mon, 15 May 2023 14:22:11 -0400
> +Subject: [PATCH] carefully crafted image files (TIM2, JPEG) no longer
> overflow
> + buffer nor use heap after free (thanks to Juzhi Lu, Zhen Zhou, Likang
> Luo of
> + NSFOCUS Security Team)
> +
> +CVE: CVE-2023-34474
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/1061db7f80fdc9ef572ac60=
b55f408f7bab6e1b0.patch
> ]
> +Comment: Remove hunk from MagickCore/profile.c. as it fixes as the
> vulnerable function
> +ImageMagick's ReplaceXmpValue() that introduces CVE-2023-34475 is not
> present in 7.0.10 version
> +Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
> +---
> + MagickCore/profile.c | 5 +++--
> + coders/tim2.c        | 4 +++-
> + 2 files changed, 6 insertions(+), 3 deletions(-)
> +
> +diff --git a/coders/tim2.c b/coders/tim2.c
> +index 0445985dcc0..d30afaf05d6 100644
> +--- a/coders/tim2.c
> ++++ b/coders/tim2.c
> +@@ -517,10 +517,12 @@ static MagickBooleanType ReadTIM2ImageData(const
> ImageInfo *image_info,
> +     /*
> +       * ### Read CLUT Data ###
> +       */
> +-    clut_data=3D(unsigned char *)
> AcquireQuantumMemory(1,header->clut_size);
> ++    clut_data=3D(unsigned char *) AcquireQuantumMemory(2,
> ++      MagickMax(header->clut_size,image->colors));
> +     if (clut_data =3D=3D (unsigned char *) NULL)
> +       ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed",
> +         image_info->filename);
> ++    (void)
> memset(clut_data,0,2*MagickMax(header->clut_size,image->colors));
> +     count=3DReadBlob(image,header->clut_size,clut_data);
> +     if (count !=3D (ssize_t) (header->clut_size))
> +       {
> diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patc=
h
> b/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch
> new file mode 100644
> index 0000000000..e26dd61fba
> --- /dev/null
> +++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch
> @@ -0,0 +1,28 @@
> +From aa673b2e4defc7cad5bec16c4fc8324f71e531f1 Mon Sep 17 00:00:00 2001
> +From: Cristy <urban-warrior@imagemagick.org>
> +Date: Sun, 24 Sep 2023 07:28:19 -0400
> +Subject: [PATCH] check for BMP file size, poc provided by Hardik Shah of
> + Vehere (Dawn Treaders team)
> +
> +CVE: CVE-2023-5341
> +Upstream-Status: Backport [
> https://github.com/ImageMagick/ImageMagick/commit/aa673b2e4defc7cad5bec16=
c4fc8324f71e531f1.patch
> ]
> +Comment: Refresh hunk as per codebase
> +Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
> +---
> + coders/bmp.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/coders/bmp.c b/coders/bmp.c
> +index 94ec6628fdf..7e36d4f481b 100644
> +--- a/coders/bmp.c
> ++++ b/coders/bmp.c
> +@@ -625,6 +625,9 @@ static Image *ReadBMPImage(const ImageIn
> +     if (image->debug !=3D MagickFalse)
> +       (void) LogMagickEvent(CoderEvent,GetMagickModule(),"  BMP size:
> %u",
> +         bmp_info.size);
> ++    if ((bmp_info.file_size !=3D 0) &&
> ++        ((MagickSizeType) bmp_info.file_size > GetBlobSize(image)))
> ++      ThrowReaderException(CorruptImageError,"ImproperImageHeader");
> +     profile_data=3D0;
> +     profile_size=3D0;
> +     if (bmp_info.size =3D=3D 12)
> diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> index 6108dece27..ce5489bb3e 100644
> --- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> +++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.10.bb
> @@ -18,6 +18,11 @@ SRC_URI =3D "git://
> github.com/ImageMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhtt
>      file://CVE-2022-0284.patch \
>      file://fix-cipher-leak.patch \
>      file://CVE-2022-2719.patch \
> +    file://CVE-2022-1114.patch \
> +    file://CVE-2023-1289-1.patch \
> +    file://CVE-2023-1289.patch \
> +    file://CVE-2023-34474.patch \
> +    file://CVE-2023-5341.patch \
>  "
>
>  SRCREV =3D "35b4991eb0939a327f3489988c366e21068b0178"
> --
> 2.25.1
>
>

--000000000000a5969f063990fd95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto"><br><div dir=3D"auto">Could you plea=
se tell when this patch will be integrated?</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Regards,</div><div dir=3D"auto">Sana Kazi</div></div></=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, 3 Jul 2025, 4:51=E2=80=AFpm Sana Kazi, &lt;<a h=
ref=3D"mailto:sanakazi720@gmail.com">sanakazi720@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Fix following CVEs for imagemagick:<=
br>
CVE-2023-5341, CVE-2022-1114, CVE-2023-1289 and CVE-2023-34474<br>
<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:sanakazi720@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">sanakazi720@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../imagemagick/files/CVE-2022-1114.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
44 +++++++<br>
=C2=A0.../imagemagick/files/CVE-2023-1289-1.patch=C2=A0 =C2=A0| 114 +++++++=
+++++++++++<br>
=C2=A0.../imagemagick/files/CVE-2023-1289.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
21 ++++<br>
=C2=A0.../imagemagick/files/CVE-2023-34474.patch=C2=A0 =C2=A0 |=C2=A0 35 ++=
++++<br>
=C2=A0.../imagemagick/files/CVE-2023-5341.patch=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
28 +++++<br>
=C2=A0.../imagemagick/<a href=3D"http://imagemagick_7.0.10.bb" rel=3D"noref=
errer noreferrer" target=3D"_blank">imagemagick_7.0.10.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
=C2=A06 files changed, 247 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2022=
-1114.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2023=
-1289-1.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2023=
-1289.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2023=
-34474.patch<br>
=C2=A0create mode 100644 meta-oe/recipes-support/imagemagick/files/CVE-2023=
-5341.patch<br>
<br>
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch =
b/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch<br>
new file mode 100644<br>
index 0000000000..0bdd67c30b<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2022-1114.patch<br>
@@ -0,0 +1,44 @@<br>
+From 8043433ba9ce0c550e09f2b3b6a3f5f62d802e6d Mon Sep 17 00:00:00 2001<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Tue, 15 Mar 2022 21:59:33 -0400<br>
+Subject: [PATCH] Coders:<br>
+ <a href=3D"https://github.com/ImageMagick/ImageMagick/issues/4947" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://github.com/ImageMagick/Im=
ageMagick/issues/4947</a><br>
+<br>
+CVE: CVE-2022-1114<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick6/commit/78f03b619d08d7c2e0fcaccab407e3ac93c2ee8f.patch" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMag=
ick6/commit/78f03b619d08d7c2e0fcaccab407e3ac93c2ee8f.patch</a>]<br>
+Comments: Refreshed the patch as per codebase<br>
+Signed-off-by: Sana Kazi <a href=3D"mailto:Sana.Kazi@kpit.com" target=3D"_=
blank" rel=3D"noreferrer">Sana.Kazi@kpit.com</a><br>
+---<br>
+ coders/dcm.c | 18 +++++++++---------<br>
+ 1 file changed, 9 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/coders/dcm.c b/coders/dcm.c<br>
+index ce6cecbd68d..879d5694d2a 100644<br>
+--- a/coders/dcm.c<br>
++++ b/coders/dcm.c<br>
+@@ -3239,18 +3239,17 @@ static Image *ReadDCMImage(const ImageIn<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RelinquishMagickMemory(info_copy)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 /*<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 If we&#39;re entering a sequence, push the cu=
rrent image parameters onto<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 the stack, so we can restore them at the end =
of the sequence.<br>
+-=C2=A0 =C2=A0 =C2=A0 */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (strcmp(explicit_vr,&quot;SQ&quot;) =3D=3D 0=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info_copy=3D(DCMInfo *) AcquireMagickM=
emory(sizeof(info));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memcpy(info_copy,&amp;info,sizeof(info=
));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AppendValueToLinkedList(stack,info_cop=
y);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 If we&#39;re entering a sequenc=
e, push the current image parameters<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 onto the stack, so we can resto=
re them at the end of the sequence.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DCMInfo *clone_info =3D (DCMInfo *) Ac=
quireMagickMemory(sizeof(info));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) memcpy(clone_info,&amp;info,siz=
eof(info));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AppendValueToLinkedList(stack,clone_in=
fo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sequence_depth++;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0datum=3D0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (quantum =3D=3D 4)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patc=
h b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch<br>
new file mode 100644<br>
index 0000000000..5f7cd8033f<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289-1.patch<br>
@@ -0,0 +1,114 @@<br>
+From 9d3dd9192f6710ec8e10f5edda9b7bf67caeb232 Mon Sep 17 00:00:00 2001<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Mon, 6 Mar 2023 14:14:36 -0500<br>
+Subject: [PATCH] recursion detection framework<br>
+<br>
+CVE: CVE-2023-1289<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/9d3dd9192f6710ec8e10f5edda9b7bf67caeb232.patch" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagi=
ck/commit/9d3dd9192f6710ec8e10f5edda9b7bf67caeb232.patch</a>]<br>
+Comment: Hunk #2 and #3 for draw.c from orignal patch are excluded from th=
is because<br>
+these hunks remove the piece of code not present in imagemagick 7.0.10.<br=
>
+Refreshed hunk2 of image.c, draw.h and draw.c<br>
+Signed-off-by: Sana Kazi <a href=3D"mailto:Sana.Kazi@kpit.com" target=3D"_=
blank" rel=3D"noreferrer">Sana.Kazi@kpit.com</a><br>
+---<br>
+ MagickCore/constitute.c | 12 ++++++++++++<br>
+ MagickCore/draw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 +++---------------<br>
+ MagickCore/draw.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
+ MagickCore/image.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 ++<br>
+ MagickCore/image.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +++<br>
+ 5 files changed, 23 insertions(+), 15 deletions(-)<br>
+<br>
+diff --git a/MagickCore/constitute.c b/MagickCore/constitute.c<br>
+index aa1a0c2682b..5c84602da87 100644<br>
+--- a/MagickCore/constitute.c<br>
++++ b/MagickCore/constitute.c<br>
+@@ -130,6 +130,11 @@<br>
+ %=C2=A0 =C2=A0 o exception: return any errors or warnings in this structu=
re.<br>
+ %<br>
+ */<br>
++/*<br>
++=C2=A0 Define declarations.<br>
++*/<br>
++#define MaxReadRecursionDepth=C2=A0 100<br>
++<br>
+ MagickExport Image *ConstituteImage(const size_t columns,const size_t row=
s,<br>
+=C2=A0 =C2=A0const char *map,const StorageType storage,const void *pixels,=
<br>
+=C2=A0 =C2=A0ExceptionInfo *exception)<br>
+@@ -558,9 +558,16 @@ MagickExport Image *ReadImage(const Imag<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (GetMagickDecoderThreadSupport(magick_info) =
=3D=3D MagickFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LockSemaphoreInfo(magick_info-&gt;semaph=
ore);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status=3DIsCoderAuthorized(read_info-&gt;magick=
,ReadPolicyRights,exception);<br>
++=C2=A0 =C2=A0 =C2=A0 if (((ImageInfo *) image_info)-&gt;recursion_depth++=
 &gt; MaxReadRecursionDepth)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void) ThrowMagickException(exception,=
GetMagickModule(),CoderError,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;NumberOfImagesIsNotSuppor=
ted&quot;,&quot;`%s&#39;&quot;,read_info-&gt;magick);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3DMagickFalse;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0image=3D(Image *) NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (status !=3D MagickFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image=3Ddecoder(read_info,exception);<br=
>
++=C2=A0 =C2=A0 =C2=A0 ((ImageInfo *) image_info)-&gt;recursion_depth--;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (GetMagickDecoderThreadSupport(magick_info) =
=3D=3D MagickFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0UnlockSemaphoreInfo(magick_info-&gt;sema=
phore);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/MagickCore/draw.c b/MagickCore/draw.c<br>
++index ff78d620afd..c875c07acc6 100644<br>
++--- a/MagickCore/draw.c<br>
+++++ b/MagickCore/draw.c<br>
+@@ -5916,7 +5916,8 @@ MagickExport void GetDrawInfo(const Imag<br>
+=C2=A0 =C2=A0(void) LogMagickEvent(TraceEvent,GetMagickModule(),&quot;...&=
quot;);<br>
+=C2=A0 =C2=A0assert(draw_info !=3D (DrawInfo *) NULL);<br>
+=C2=A0 =C2=A0(void) memset(draw_info,0,sizeof(*draw_info));<br>
+-=C2=A0 clone_info=3DCloneImageInfo(image_info);<br>
++=C2=A0 draw_info-&gt;image_info=3Dimage_info;<br>
++=C2=A0 clone_info=3DCloneImageInfo(draw_info-&gt;image_info);<br>
+=C2=A0 =C2=A0GetAffineMatrix(&amp;draw_info-&gt;affine);<br>
+=C2=A0 =C2=A0exception=3DAcquireExceptionInfo();<br>
+=C2=A0 =C2=A0(void) QueryColorCompliance(&quot;#000F&quot;,AllCompliance,&=
amp;draw_info-&gt;fill,<br>
+diff --git a/MagickCore/draw.h b/MagickCore/draw.h<br>
+index 38a52e20361..69257fc02a1 100644<br>
+--- a/MagickCore/draw.h<br>
++++ b/MagickCore/draw.h<br>
+@@ -340,6 +340,9 @@ typedef struct _DrawInfo<br>
+ <br>
+=C2=A0 =C2=A0char<br>
+=C2=A0 =C2=A0 =C2=A0*id;<br>
++<br>
++=C2=A0 const ImageInfo<br>
++=C2=A0 =C2=A0 *image_info;=C2=A0 <br>
+ } DrawInfo;<br>
+ <br>
+ typedef struct _PrimitiveInfo<br>
+diff --git a/MagickCore/image.c b/MagickCore/image.c<br>
+index 9bf47e6e01d..8289139bf6f 100644<br>
+--- a/MagickCore/image.c<br>
++++ b/MagickCore/image.c<br>
+@@ -995,6 +995,7 @@ MagickExport ImageInfo *CloneImageInfo(c<br>
+=C2=A0 =C2=A0 =C2=A0MagickPathExtent);<br>
+=C2=A0 =C2=A0clone_info-&gt;channel=3Dimage_info-&gt;channel;<br>
+=C2=A0 =C2=A0(void) CloneImageOptions(clone_info,image_info);<br>
++=C2=A0 clone_info-&gt;recursion_depth=3Dimage_info-&gt;recursion_depth;<b=
r>
+=C2=A0 =C2=A0clone_info-&gt;debug=3DIsEventLogging();<br>
+=C2=A0 =C2=A0clone_info-&gt;signature=3Dimage_info-&gt;signature;<br>
+=C2=A0 =C2=A0return(clone_info);<br>
+@@ -1350,6 +1350,7 @@ MagickExport void GetImageInfo(ImageInfo<br>
+=C2=A0 =C2=A0image_info-&gt;quality=3DUndefinedCompressionQuality;<br>
+=C2=A0 =C2=A0image_info-&gt;antialias=3DMagickTrue;<br>
+=C2=A0 =C2=A0image_info-&gt;dither=3DMagickTrue;<br>
++=C2=A0 image_info-&gt;depth=3D0;<br>
+=C2=A0 =C2=A0synchronize=3DGetEnvironmentValue(&quot;MAGICK_SYNCHRONIZE&qu=
ot;);<br>
+=C2=A0 =C2=A0if (synchronize !=3D (const char *) NULL)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+diff --git a/MagickCore/image.h b/MagickCore/image.h<br>
+index b9d870a9271..df6bf9bd103 100644<br>
+--- a/MagickCore/image.h<br>
++++ b/MagickCore/image.h<br>
+@@ -492,6 +492,9 @@ struct _ImageInfo<br>
+ <br>
+=C2=A0 =C2=A0PixelInfo<br>
+=C2=A0 =C2=A0 =C2=A0matte_color;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* matte (fram=
e) color */<br>
++<br>
++=C2=A0 size_t<br>
++=C2=A0 =C2=A0 recursion_depth;=C2=A0 /* recursion detection */<br>
+ };<br>
+ <br>
+ extern MagickExport ChannelType<br>
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch =
b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch<br>
new file mode 100644<br>
index 0000000000..944754fb3d<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-1289.patch<br>
@@ -0,0 +1,21 @@<br>
+From c5b23cbf2119540725e6dc81f4deb25798ead6a4 Mon Sep 17 00:00:00 2001<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Mon, 6 Mar 2023 15:26:32 -0500<br>
+Subject: [PATCH] erecursion detection<br>
+CVE: CVE-2023-1289<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/c5b23cbf2119540725e6dc81f4deb25798ead6a4" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagick/com=
mit/c5b23cbf2119540725e6dc81f4deb25798ead6a4</a>]<br>
+Signed-off-by: Sana Kazi <a href=3D"mailto:Sana.Kazi@kpit.com" target=3D"_=
blank" rel=3D"noreferrer">Sana.Kazi@kpit.com</a><br>
+---<br>
+ MagickCore/draw.c | 3 ++-<br>
+ 1 file changed, 2 insertions(+), 1 deletion(-)<br>
+<br>
+--- a/MagickCore/draw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2025-05-12 13:34:26.689=
655000 +0530<br>
++++ b/MagickCore/draw.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 2025-05-12 13:45:30.136=
300211 +0530<br>
+@@ -5526,6 +5526,7 @@ MagickExport MagickBooleanType DrawPrimi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (primitive_info-&gt;text =3D=3D (char *) NUL=
L)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clone_info=3DAcquireImageInfo();<br>
++=C2=A0 =C2=A0 =C2=A0 clone_info-&gt;recursion_depth=3Ddraw_info-&gt;image=
_info-&gt;recursion_depth;=C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0composite_images=3D(Image *) NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (LocaleNCompare(primitive_info-&gt;text,&quo=
t;data:&quot;,5) =3D=3D 0)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0composite_images=3DReadInlineImage(clone=
_info,primitive_info-&gt;text,<br>
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch=
 b/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch<br>
new file mode 100644<br>
index 0000000000..e7b7783f47<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-34474.patch<br>
@@ -0,0 +1,35 @@<br>
+From 1061db7f80fdc9ef572ac60b55f408f7bab6e1b0 Mon Sep 17 00:00:00 2001<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Mon, 15 May 2023 14:22:11 -0400<br>
+Subject: [PATCH] carefully crafted image files (TIM2, JPEG) no longer over=
flow<br>
+ buffer nor use heap after free (thanks to Juzhi Lu, Zhen Zhou, Likang Luo=
 of<br>
+ NSFOCUS Security Team)<br>
+<br>
+CVE: CVE-2023-34474<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/1061db7f80fdc9ef572ac60b55f408f7bab6e1b0.patch" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagi=
ck/commit/1061db7f80fdc9ef572ac60b55f408f7bab6e1b0.patch</a>]<br>
+Comment: Remove hunk from MagickCore/profile.c. as it fixes as the vulnera=
ble function<br>
+ImageMagick&#39;s ReplaceXmpValue() that introduces CVE-2023-34475 is not =
present in 7.0.10 version<br>
+Signed-off-by: Sana Kazi <a href=3D"mailto:Sana.Kazi@kpit.com" target=3D"_=
blank" rel=3D"noreferrer">Sana.Kazi@kpit.com</a><br>
+---<br>
+ MagickCore/profile.c | 5 +++--<br>
+ coders/tim2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 +++-<br>
+ 2 files changed, 6 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/coders/tim2.c b/coders/tim2.c<br>
+index 0445985dcc0..d30afaf05d6 100644<br>
+--- a/coders/tim2.c<br>
++++ b/coders/tim2.c<br>
+@@ -517,10 +517,12 @@ static MagickBooleanType ReadTIM2ImageData(const Ima=
geInfo *image_info,<br>
+=C2=A0 =C2=A0 =C2=A0/*<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0* ### Read CLUT Data ###<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-=C2=A0 =C2=A0 clut_data=3D(unsigned char *) AcquireQuantumMemory(1,header=
-&gt;clut_size);<br>
++=C2=A0 =C2=A0 clut_data=3D(unsigned char *) AcquireQuantumMemory(2,<br>
++=C2=A0 =C2=A0 =C2=A0 MagickMax(header-&gt;clut_size,image-&gt;colors));<b=
r>
+=C2=A0 =C2=A0 =C2=A0if (clut_data =3D=3D (unsigned char *) NULL)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ThrowBinaryException(ResourceLimitError,&quot;M=
emoryAllocationFailed&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0image_info-&gt;filename);<br>
++=C2=A0 =C2=A0 (void) memset(clut_data,0,2*MagickMax(header-&gt;clut_size,=
image-&gt;colors));<br>
+=C2=A0 =C2=A0 =C2=A0count=3DReadBlob(image,header-&gt;clut_size,clut_data)=
;<br>
+=C2=A0 =C2=A0 =C2=A0if (count !=3D (ssize_t) (header-&gt;clut_size))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
diff --git a/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch =
b/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch<br>
new file mode 100644<br>
index 0000000000..e26dd61fba<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/imagemagick/files/CVE-2023-5341.patch<br>
@@ -0,0 +1,28 @@<br>
+From aa673b2e4defc7cad5bec16c4fc8324f71e531f1 Mon Sep 17 00:00:00 2001<br>
+From: Cristy &lt;<a href=3D"mailto:urban-warrior@imagemagick.org" target=
=3D"_blank" rel=3D"noreferrer">urban-warrior@imagemagick.org</a>&gt;<br>
+Date: Sun, 24 Sep 2023 07:28:19 -0400<br>
+Subject: [PATCH] check for BMP file size, poc provided by Hardik Shah of<b=
r>
+ Vehere (Dawn Treaders team)<br>
+<br>
+CVE: CVE-2023-5341<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/ImageMagick/Image=
Magick/commit/aa673b2e4defc7cad5bec16c4fc8324f71e531f1.patch" rel=3D"norefe=
rrer noreferrer" target=3D"_blank">https://github.com/ImageMagick/ImageMagi=
ck/commit/aa673b2e4defc7cad5bec16c4fc8324f71e531f1.patch</a>]<br>
+Comment: Refresh hunk as per codebase<br>
+Signed-off-by: Sana Kazi <a href=3D"mailto:Sana.Kazi@kpit.com" target=3D"_=
blank" rel=3D"noreferrer">Sana.Kazi@kpit.com</a><br>
+---<br>
+ coders/bmp.c | 3 +++<br>
+ 1 file changed, 3 insertions(+)<br>
+<br>
+diff --git a/coders/bmp.c b/coders/bmp.c<br>
+index 94ec6628fdf..7e36d4f481b 100644<br>
+--- a/coders/bmp.c<br>
++++ b/coders/bmp.c<br>
+@@ -625,6 +625,9 @@ static Image *ReadBMPImage(const ImageIn<br>
+=C2=A0 =C2=A0 =C2=A0if (image-&gt;debug !=3D MagickFalse)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(void) LogMagickEvent(CoderEvent,GetMagickModul=
e(),&quot;=C2=A0 BMP size: %u&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bmp_info.size);<br>
++=C2=A0 =C2=A0 if ((bmp_info.file_size !=3D 0) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 ((MagickSizeType) bmp_info.file_size &gt; Get=
BlobSize(image)))<br>
++=C2=A0 =C2=A0 =C2=A0 ThrowReaderException(CorruptImageError,&quot;Imprope=
rImageHeader&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0profile_data=3D0;<br>
+=C2=A0 =C2=A0 =C2=A0profile_size=3D0;<br>
+=C2=A0 =C2=A0 =C2=A0if (bmp_info.size =3D=3D 12)<br>
diff --git a/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemag=
ick_7.0.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imagemagick_=
7.0.10.bb</a> b/meta-oe/recipes-support/imagemagick/<a href=3D"http://image=
magick_7.0.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imagemagi=
ck_7.0.10.bb</a><br>
index 6108dece27..ce5489bb3e 100644<br>
--- a/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagick_7.0=
.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imagemagick_7.0.10.=
bb</a><br>
+++ b/meta-oe/recipes-support/imagemagick/<a href=3D"http://imagemagick_7.0=
.10.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">imagemagick_7.0.10.=
bb</a><br>
@@ -18,6 +18,11 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/Ima=
geMagick/ImageMagick.git;branch=3Dmain;protocol=3Dhtt" rel=3D"noreferrer no=
referrer" target=3D"_blank">github.com/ImageMagick/ImageMagick.git;branch=
=3Dmain;protocol=3Dhtt</a><br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-0284.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://fix-cipher-leak.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://CVE-2022-2719.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2022-1114.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-1289-1.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-1289.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-34474.patch \<br>
+=C2=A0 =C2=A0 file://CVE-2023-5341.patch \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRCREV =3D &quot;35b4991eb0939a327f3489988c366e21068b0178&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000a5969f063990fd95--

