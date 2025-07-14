Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A188FC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:01:52 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.78775.1752501706297554407
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 07:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CStSQnS8;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-558f7fda97eso2690016e87.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 07:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752501704; x=1753106504; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR+fL+vCyoUVEOrwV2AyYa5LWvOA1uWVO/L9Jyc4vUw=;
        b=CStSQnS89zmIPw/auJ6Z5QfpcRoclxLevfl/8M7SIu6WxT1R/q494xBeIVRrN98qyp
         ORR1+PY+9UhAcmnNP9sUS2cnKA6bm36j6PAs33FnsOjf5nwJYFhfZZk/McSZkBxw9qbp
         ppueQdcAllv+YZUeQsPltySqmTKisbFD54giSfTAH+c6xAaKjDIF2Oc+d6ctp0ZewjEI
         9WvXEFVLECY0RS7OHjB+0LFwNBumUQxUyDKnxayQQuXH3KcauB5evH84SCBPKOKlPUdJ
         iI6PjMiZyHt4X+qn/V/qUzNSUdzGLsHNcVLOCZ67kYpN0MNyknSSTlT53zU/j6YCHqAb
         +Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501704; x=1753106504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jR+fL+vCyoUVEOrwV2AyYa5LWvOA1uWVO/L9Jyc4vUw=;
        b=RjX2tdTUlejAEdx6y8CMh41U/wabypYcdFfh02SiSWxOJ0ARsyz4U3V2SQFCvzGBc9
         lazB+ubw5lBJMr2BhK/sfZIXQXW6Bp490GzsSmdDq/OXndBwEYi1wdYyHz2y1+0/d5Y2
         /ogT6tM+Fk5/tcpWO+SYXJhTHFm/AjYwiidZWDeJIXn+dM/XgvuHT2Znnbr6REc24lRS
         6Wbg1PhF2aZwNB90tPU8l0McBdWKWoSXXAptE2cjXTdApzx+gnJ6o8JAxUKA7FtyD8Rb
         rUAF6dkLG+xPSGLfIeNDzCNpmzijJ8xfVcBC4vBjQq4mxKzF6FB/Lzkocn7O+Klekeh0
         4FLQ==
X-Gm-Message-State: AOJu0YyMrcqi9qLDRhs1sRBcSTjAiaE96frGxhIVPtqlAuV5v2MzktKr
	Ma2s6XpSwuPM3SkCbvkypkbRLHsdyTEGinqcCzwLx3NsMPjBBjV/Z0vsdnLHWDg+FNij+Q2xngb
	TgiVq9GsTorqEyUQHI1ynmFtVeXsl6Yg=
X-Gm-Gg: ASbGncs2ZQKPr8k9kidbsvIt0xxVZr+4YWZsNL+3vBYByncfiKGeDPB4uRJta3Wktkk
	SyVHCKYKR/xTFJF0KG28aTQF5edi0/zkthv0aI48cqux7mNxVdSxG1MBvIIZRZEFOOZqLikbh5l
	P7wdZdQ8QJUD0o0gUYoSD4QnKBMHmSs23nA1xKZxl2YH7nx8qSGibdC3eGIo56ke5LoJC4fCYWc
	s8zt5j/8a6FVQN5u3h0
X-Google-Smtp-Source: AGHT+IGoUaWFsvS5/QQKuyn9oFESFf5mSKm4+oZghTBjyBTtS5lVZA2kMb8ucEh7eYXv5Pa9w4JTpLVB9XzkUHvDMmk=
X-Received: by 2002:ac2:51d6:0:b0:553:663d:736c with SMTP id
 2adb3069b0e04-55a045ed2c2mr4849724e87.15.1752501703685; Mon, 14 Jul 2025
 07:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250714085727.160771-1-sanakazi720@gmail.com>
In-Reply-To: <20250714085727.160771-1-sanakazi720@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Jul 2025 16:01:31 +0200
X-Gm-Features: Ac12FXxU2bSOpwBzlRCy75UsJXL3cIqKuaKjCLqqCQpAnZ6-pbR1K8Y4u3D8Pjs
Message-ID: <CA+chaQeb6B84AiJxf5jH9UET=XRMJD9PE73gfU9NjaCJAsLV_A@mail.gmail.com>
Subject: Re: [oe] [kirkstone][PATCHv2] fix-cipher-leak.patch: Fix patch-fuzz
To: sanakazi720@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 14:01:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118537

Please follow the convention for commit messages and start with "recipe-nam=
e:".

On Mon, Jul 14, 2025 at 3:59=E2=80=AFPM Sana Kazi via lists.openembedded.or=
g
<sanakazi720=3Dgmail.com@lists.openembedded.org> wrote:
>
> Refresh fix-cipher-leak.patch to fix patch-fuzz issue.
>
> Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> ---
>  .../imagemagick/files/fix-cipher-leak.patch   | 51 ++++++++++---------
>  1 file changed, 26 insertions(+), 25 deletions(-)
>
> diff --git a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.pa=
tch b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
> index a8985757f2..28fbd9e9ea 100644
> --- a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
> +++ b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
> @@ -9,7 +9,7 @@ Subject: [PATCH] possible divide by zero + clear buffers
>   MagickCore/memory.c     | 22 ++++++++++++++++------
>   MagickCore/signature.c  |  2 +-
>   coders/thumbnail.c      |  3 ++-
> - 5 files changed, 41 insertions(+), 25 deletions(-)
> + 5 files changed, 33 insertions(+), 22 deletions(-)
>
>  CVE: CVE-2021-20311
>  CVE: CVE-2021-20312
> @@ -19,35 +19,34 @@ Upstream-Status: Backport[https://github.com/ImageMag=
ick/ImageMagick/commit/70aa
>  Comment: Refreshed patch based on the codebase
>
>  Signed-off-by: Sana Kazi Sana.Kazi@kpit.com
> +
>  diff --git a/MagickCore/cipher.c b/MagickCore/cipher.c
> -index 057b11c4720..91ad1d1d662 100644
> +index 908266457..4548f0d60 100644
>  --- a/MagickCore/cipher.c
>  +++ b/MagickCore/cipher.c
> -@@ -484,8 +484,8 @@ static void EncipherAESBlock(AESInfo *ae
> +@@ -482,8 +482,8 @@ static void EncipherAESBlock(AESInfo *aes_info,const=
 unsigned char *plaintext,
>       Reset registers.
>     */
>     alpha=3D0;
>  -  (void) memset(key,0,sizeof(key));
>  -  (void) memset(text,0,sizeof(text));
>  +  (void) ResetMagickMemory(key,0,sizeof(key));
> -+  (void) ResetMagickMemory(text,0,sizeof(text));
> ++  (void) ResetMagickMemory(text,0,sizeof(text));
>   }
> -
> -
> +
>   /*
> -@@ -708,8 +708,8 @@ MagickExport MagickBooleanType PasskeyDe
> +@@ -706,8 +706,8 @@ MagickExport MagickBooleanType PasskeyDecipherImage(=
Image *image,
>     */
>     quantum_info=3DDestroyQuantumInfo(quantum_info);
>     aes_info=3DDestroyAESInfo(aes_info);
>  -  (void) memset(input_block,0,sizeof(input_block));
>  -  (void) memset(output_block,0,sizeof(output_block));
>  +  (void) ResetMagickMemory(input_block,0,sizeof(input_block));
> -+  (void) ResetMagickMemory(output_block,0,sizeof(output_block));
> ++  (void) ResetMagickMemory(output_block,0,sizeof(output_block));
>     return(y =3D=3D (ssize_t) image->rows ? MagickTrue : MagickFalse);
>   }
> -
> -
> -@@ -925,8 +925,8 @@ MagickExport MagickBooleanType PasskeyEn
> +
> +@@ -923,8 +923,8 @@ MagickExport MagickBooleanType PasskeyEncipherImage(=
Image *image,
>     */
>     quantum_info=3DDestroyQuantumInfo(quantum_info);
>     aes_info=3DDestroyAESInfo(aes_info);
> @@ -57,13 +56,12 @@ index 057b11c4720..91ad1d1d662 100644
>  +  (void) ResetMagickMemory(output_block,0,sizeof(output_block));
>     return(y =3D=3D (ssize_t) image->rows ? MagickTrue : MagickFalse);
>   }
> -
> -
> +
>  diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c
> -index 2ffc72f88fa..e3b7df339f6 100644
> +index ac9f7e91b..b78b84b47 100644
>  --- a/MagickCore/colorspace.c
>  +++ b/MagickCore/colorspace.c
> -@@ -940,15 +940,15 @@ static MagickBooleanType sRGBTransformImage(Image =
*image,
> +@@ -850,15 +850,15 @@ static MagickBooleanType sRGBTransformImage(Image =
*image,
>         if (logmap =3D=3D (Quantum *) NULL)
>           ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed=
",
>             image->filename);
> @@ -83,7 +81,7 @@ index 2ffc72f88fa..e3b7df339f6 100644
>         image_view=3DAcquireAuthenticCacheView(image,exception);
>   #if defined(MAGICKCORE_OPENMP_SUPPORT)
>         #pragma omp parallel for schedule(static) shared(status) \
> -@@ -2502,14 +2502,14 @@ static MagickBooleanType TransformsRGBImage(Imag=
e *image,
> +@@ -2394,14 +2394,14 @@ static MagickBooleanType TransformsRGBImage(Imag=
e *image,
>         if (logmap =3D=3D (Quantum *) NULL)
>           ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed=
",
>             image->filename);
> @@ -103,10 +101,10 @@ index 2ffc72f88fa..e3b7df339f6 100644
>           logmap[i]=3DQuantumRange;
>         if (image->storage_class =3D=3D PseudoClass)
>  diff --git a/MagickCore/memory.c b/MagickCore/memory.c
> -index 2598044486a..01bc80d86c5 100644
> +index 060b05e71..5db57acc7 100644
>  --- a/MagickCore/memory.c
>  +++ b/MagickCore/memory.c
> -@@ -1269,26 +1269,36 @@ MagickExport MemoryInfo *RelinquishVirtualMemory=
(MemoryInfo *memory_info)
> +@@ -1230,26 +1230,36 @@ MagickExport MemoryInfo *RelinquishVirtualMemory=
(MemoryInfo *memory_info)
>   %                                                                      =
       %
>   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%=
%%%%%%%%
>   %
> @@ -144,13 +142,13 @@ index 2598044486a..01bc80d86c5 100644
>     assert(memory !=3D (void *) NULL);
>  -  return(memset(memory,byte,size));
>  +  while (n-- !=3D 0)
> -+      *p++=3D(unsigned char) c;
> -+  return(memory);
> ++       *p++=3D(unsigned char) c;
> ++  return(memory);
>   }
> -
> +
>   /*
>  diff --git a/MagickCore/signature.c b/MagickCore/signature.c
> -index 2d9b0801523..1f79c91b11b 100644
> +index f0f0e42e0..f21feda27 100644
>  --- a/MagickCore/signature.c
>  +++ b/MagickCore/signature.c
>  @@ -736,7 +736,7 @@ RestoreMSCWarning
> @@ -160,10 +158,10 @@ index 2d9b0801523..1f79c91b11b 100644
>  -  (void) memset(W,0,sizeof(W));
>  +  (void) ResetMagickMemory(W,0,sizeof(W));
>   }
> -
> +
>   /*
>  diff --git a/coders/thumbnail.c b/coders/thumbnail.c
> -index 59d97380d9e..e92dd312011 100644
> +index 1f7900aef..169bcfea8 100644
>  --- a/coders/thumbnail.c
>  +++ b/coders/thumbnail.c
>  @@ -199,7 +199,8 @@ static MagickBooleanType WriteTHUMBNAILImage(const I=
mageInfo *image_info,
> @@ -172,7 +170,10 @@ index 59d97380d9e..e92dd312011 100644
>     }
>  -  if ((q+length) > (GetStringInfoDatum(profile)+GetStringInfoLength(pro=
file)))
>  +  if ((q > (GetStringInfoDatum(profile)+GetStringInfoLength(profile))) =
||
> -+      (length > (GetStringInfoDatum(profile)+GetStringInfoLength(profil=
e)-q)))
> ++      (length > (GetStringInfoDatum(profile)+GetStringInfoLength(profil=
e)-q)))
>       ThrowWriterException(CoderError,"ImageDoesNotHaveAThumbnail");
>     thumbnail_image=3DBlobToImage(image_info,q,length,exception);
>     if (thumbnail_image =3D=3D (Image *) NULL)
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118534): https://lists.openembedded.org/g/openembedde=
d-devel/message/118534
> Mute This Topic: https://lists.openembedded.org/mt/114147644/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

