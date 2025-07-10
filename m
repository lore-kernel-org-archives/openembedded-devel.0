Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62521C83F20
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 11:35:23 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.5789.1752144860895837803
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Jul 2025 03:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ND35edoO;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: sanakazi720@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so860148a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 03:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752144860; x=1752749660; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ozxJXAJ+KQ5TRi5UDiaStW237cMN65OcVK8nvJEqkWs=;
        b=ND35edoOTf4MjkwrBr2rD1+V/2Wktef8BSVfZbAm/Xxz1HjhAuJsb76jdEFuo7Zl+a
         a7jpS0r4nBCpKChRMdnxiNoIbwJf2spTMowjHWi74hzmaOLEktLyPF2744JQZWobiu9F
         IQNguXqN/iKql6Fd+MciAd9369jYP8ut1c039+VLNUr9yQAO8vMkDjbuHZHHoiQKvBmZ
         3mwKGLyDaytp/3X8ffOSa79xXWNy5I+I098oeXubJfuTRbzgkTDu3O24wm01o3LAmRXj
         bpHujgWLw8cPM+a1RKdY+RBpWTCfkIasTvTxrsMV1n95WoiNt0wiRIWA2k/GRhNuGuQ8
         DS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752144860; x=1752749660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ozxJXAJ+KQ5TRi5UDiaStW237cMN65OcVK8nvJEqkWs=;
        b=F6Zs+EU5iKYQ4H3wR2AIaLD/el83ZSocu6tHfMVaTXqcO57wcAm+HMOSCvBy5tGv/b
         c0+MSHNt2CrS/ikMEXVf+EDuhG4qv84n1OTDFUrt4+QdsEn8TRjyvcxePohuuM3jnXAr
         +3IooO7gW+Icy27vIlPMHBzNaaPJZIX7JZ9zWSVq8nLkO7u4NNvERjUpJLEpsQyGRzGP
         xyXuq8WnHch13eiI/lT0OS3BlpSnUC6qizGps2nMx/KYikv30XzZHd3EAi5IE48Sag49
         lYYT66GHNDkBKHsDK+o+M6yQOTYGfwNM0SY7jXpMHSfZyY4nkt59NhOxwRMBJbKJ3jO9
         Vn1w==
X-Gm-Message-State: AOJu0YyskSKvmpxo7JLNEMtmUC1ac/ZBeXUj7sy++O5lRzBdUmmzirxG
	/oelDKeHZ0sEP1YqlAuipvN2N57y6eOfnQ300UVv9pYCwzHNCOhSM7kRJvpk+3LKnYZgS/Alh2w
	Dbt+ECXQ9IH9iXIP68+CDeQb0u4wG6fEcUw==
X-Gm-Gg: ASbGncvLUVYROZPpw1NcUFYO1e7HF9vrH4b6tYbEVUdaKcdfBTu/yb7pOCL9cCI35GT
	0VzToSH0OBXK1geENFDXZiq43Njkn1vVKvvYvdHVEIssQ1xOtACc3WpuLHcW9u7otfY6Y34uXs1
	6ePxfBynqfxCmiRcfqBK7x1AKoRx80kbatd68FPVlhV1i+pkhi5WKAn5/w8QFWLhHBp9ST87shW
	44QJJeQd/0UJ20=
X-Google-Smtp-Source: AGHT+IEEUm3Hgt/wqZg9v9Ulq4mSz+bXuJyDciG9d/LaDP6UaGyXTJ2w5mZ5mWZ7KI5DuJDWcT/FMr6fDfirOVJLNYs=
X-Received: by 2002:a17:90b:2745:b0:311:2f5:6b1 with SMTP id
 98e67ed59e1d1-31c3c2d48ccmr4824908a91.22.1752144859955; Thu, 10 Jul 2025
 03:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250710075605.211077-1-sanakazi720@gmail.com>
In-Reply-To: <20250710075605.211077-1-sanakazi720@gmail.com>
From: "Sana Kazi" <sanakazi720@gmail.com>
Date: Thu, 10 Jul 2025 16:24:07 +0530
X-Gm-Features: Ac12FXwuf9Ag4exPjqkILxK967_utHUMz_DwVEMx6rQCW_2P8Dg9EViNJNUf1Mw
Message-ID: <CAP0RjeTkQb+Y58TSNpg_+sbDVdHzgt_Tz51h-_4ZTbyYSnVu6w@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] fix-cipher-leak.patch: Fix patch-fuzz
To: openembedded-devel@lists.openembedded.org
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f906690639910385"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Jul 2025 11:35:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118412

--000000000000f906690639910385
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Could you please integrate the patch-fuzz fix for imagemagick from the
previous mail.

Regards,
Sana Kazi

On Thu, 10 Jul 2025, 1:26=E2=80=AFpm Sana Kazi, <sanakazi720@gmail.com> wro=
te:

> Refresh fix-cipher-leak.patch to fix patch-fuzz issue.
>
> Signed-off-by: Sana Kazi <sanakazi720@gmail.com>
> ---
>  .../imagemagick/files/fix-cipher-leak.patch   | 49 ++++++++++---------
>  1 file changed, 25 insertions(+), 24 deletions(-)
>
> diff --git
> a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
> b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
> index a8985757f2..2e52a4f6f7 100644
> --- a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
> +++ b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch
> @@ -19,35 +19,34 @@ Upstream-Status: Backport[
> https://github.com/ImageMagick/ImageMagick/commit/70aa
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
> +@@ -482,8 +482,8 @@ static void EncipherAESBlock(AESInfo *aes_info,const
> unsigned char *plaintext,
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
> +@@ -706,8 +706,8 @@ MagickExport MagickBooleanType
> PasskeyDecipherImage(Image *image,
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
> +@@ -923,8 +923,8 @@ MagickExport MagickBooleanType
> PasskeyEncipherImage(Image *image,
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
> -@@ -940,15 +940,15 @@ static MagickBooleanType sRGBTransformImage(Image
> *image,
> +@@ -850,15 +850,15 @@ static MagickBooleanType sRGBTransformImage(Image
> *image,
>         if (logmap =3D=3D (Quantum *) NULL)
>           ThrowBinaryException(ResourceLimitError,"MemoryAllocationFailed=
",
>             image->filename);
> @@ -83,7 +81,7 @@ index 2ffc72f88fa..e3b7df339f6 100644
>         image_view=3DAcquireAuthenticCacheView(image,exception);
>   #if defined(MAGICKCORE_OPENMP_SUPPORT)
>         #pragma omp parallel for schedule(static) shared(status) \
> -@@ -2502,14 +2502,14 @@ static MagickBooleanType TransformsRGBImage(Imag=
e
> *image,
> +@@ -2394,14 +2394,14 @@ static MagickBooleanType TransformsRGBImage(Imag=
e
> *image,
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
> -@@ -1269,26 +1269,36 @@ MagickExport MemoryInfo
> *RelinquishVirtualMemory(MemoryInfo *memory_info)
> +@@ -1230,26 +1230,36 @@ MagickExport MemoryInfo
> *RelinquishVirtualMemory(MemoryInfo *memory_info)
>   %
>      %
>
> %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%=
%%%%%%
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
>  @@ -199,7 +199,8 @@ static MagickBooleanType WriteTHUMBNAILImage(const
> ImageInfo *image_info,
> @@ -172,7 +170,10 @@ index 59d97380d9e..e92dd312011 100644
>     }
>  -  if ((q+length) >
> (GetStringInfoDatum(profile)+GetStringInfoLength(profile)))
>  +  if ((q > (GetStringInfoDatum(profile)+GetStringInfoLength(profile))) =
||
> -+      (length >
> (GetStringInfoDatum(profile)+GetStringInfoLength(profile)-q)))
> ++      (length >
> (GetStringInfoDatum(profile)+GetStringInfoLength(profile)-q)))
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

--000000000000f906690639910385
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"auto">Co=
uld you please integrate the patch-fuzz fix for imagemagick from the previo=
us mail.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards,</div><=
div dir=3D"auto">Sana Kazi</div></div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 10 Jul 2025, =
1:26=E2=80=AFpm Sana Kazi, &lt;<a href=3D"mailto:sanakazi720@gmail.com">san=
akazi720@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">R=
efresh fix-cipher-leak.patch to fix patch-fuzz issue.<br>
<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:sanakazi720@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">sanakazi720@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../imagemagick/files/fix-cipher-leak.patch=C2=A0 =C2=A0| 49 ++++++++=
++---------<br>
=C2=A01 file changed, 25 insertions(+), 24 deletions(-)<br>
<br>
diff --git a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patc=
h b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch<br>
index a8985757f2..2e52a4f6f7 100644<br>
--- a/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch<br>
+++ b/meta-oe/recipes-support/imagemagick/files/fix-cipher-leak.patch<br>
@@ -19,35 +19,34 @@ Upstream-Status: Backport[<a href=3D"https://github.com=
/ImageMagick/ImageMagick/commit/70aa" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://github.com/ImageMagick/ImageMagick/commit/70aa</a><br>
=C2=A0Comment: Refreshed patch based on the codebase<br>
<br>
=C2=A0Signed-off-by: Sana Kazi <a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank" rel=3D"noreferrer">Sana.Kazi@kpit.com</a><br>
+<br>
=C2=A0diff --git a/MagickCore/cipher.c b/MagickCore/cipher.c<br>
-index 057b11c4720..91ad1d1d662 100644<br>
+index 908266457..4548f0d60 100644<br>
=C2=A0--- a/MagickCore/cipher.c<br>
=C2=A0+++ b/MagickCore/cipher.c<br>
-@@ -484,8 +484,8 @@ static void EncipherAESBlock(AESInfo *ae<br>
+@@ -482,8 +482,8 @@ static void EncipherAESBlock(AESInfo *aes_info,const u=
nsigned char *plaintext,<br>
=C2=A0 =C2=A0 =C2=A0 Reset registers.<br>
=C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 alpha=3D0;<br>
=C2=A0-=C2=A0 (void) memset(key,0,sizeof(key));<br>
=C2=A0-=C2=A0 (void) memset(text,0,sizeof(text));<br>
=C2=A0+=C2=A0 (void) ResetMagickMemory(key,0,sizeof(key));<br>
-+=C2=A0 (void) ResetMagickMemory(text,0,sizeof(text));=C2=A0 <br>
++=C2=A0 (void) ResetMagickMemory(text,0,sizeof(text));<br>
=C2=A0 }<br>
- <br>
-<br>
+ <br>
=C2=A0 /*<br>
-@@ -708,8 +708,8 @@ MagickExport MagickBooleanType PasskeyDe<br>
+@@ -706,8 +706,8 @@ MagickExport MagickBooleanType PasskeyDecipherImage(Im=
age *image,<br>
=C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 quantum_info=3DDestroyQuantumInfo(quantum_info);<br>
=C2=A0 =C2=A0 aes_info=3DDestroyAESInfo(aes_info);<br>
=C2=A0-=C2=A0 (void) memset(input_block,0,sizeof(input_block));<br>
=C2=A0-=C2=A0 (void) memset(output_block,0,sizeof(output_block));<br>
=C2=A0+=C2=A0 (void) ResetMagickMemory(input_block,0,sizeof(input_block));<=
br>
-+=C2=A0 (void) ResetMagickMemory(output_block,0,sizeof(output_block));=C2=
=A0 <br>
++=C2=A0 (void) ResetMagickMemory(output_block,0,sizeof(output_block));<br>
=C2=A0 =C2=A0 return(y =3D=3D (ssize_t) image-&gt;rows ? MagickTrue : Magic=
kFalse);<br>
=C2=A0 }<br>
- <br>
-<br>
-@@ -925,8 +925,8 @@ MagickExport MagickBooleanType PasskeyEn<br>
+ <br>
+@@ -923,8 +923,8 @@ MagickExport MagickBooleanType PasskeyEncipherImage(Im=
age *image,<br>
=C2=A0 =C2=A0 */<br>
=C2=A0 =C2=A0 quantum_info=3DDestroyQuantumInfo(quantum_info);<br>
=C2=A0 =C2=A0 aes_info=3DDestroyAESInfo(aes_info);<br>
@@ -57,13 +56,12 @@ index 057b11c4720..91ad1d1d662 100644<br>
=C2=A0+=C2=A0 (void) ResetMagickMemory(output_block,0,sizeof(output_block))=
;<br>
=C2=A0 =C2=A0 return(y =3D=3D (ssize_t) image-&gt;rows ? MagickTrue : Magic=
kFalse);<br>
=C2=A0 }<br>
- <br>
-<br>
+ <br>
=C2=A0diff --git a/MagickCore/colorspace.c b/MagickCore/colorspace.c<br>
-index 2ffc72f88fa..e3b7df339f6 100644<br>
+index ac9f7e91b..b78b84b47 100644<br>
=C2=A0--- a/MagickCore/colorspace.c<br>
=C2=A0+++ b/MagickCore/colorspace.c<br>
-@@ -940,15 +940,15 @@ static MagickBooleanType sRGBTransformImage(Image *i=
mage,<br>
+@@ -850,15 +850,15 @@ static MagickBooleanType sRGBTransformImage(Image *i=
mage,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (logmap =3D=3D (Quantum *) NULL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ThrowBinaryException(ResourceLimitError,=
&quot;MemoryAllocationFailed&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
@@ -83,7 +81,7 @@ index 2ffc72f88fa..e3b7df339f6 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 image_view=3DAcquireAuthenticCacheView(image,ex=
ception);<br>
=C2=A0 #if defined(MAGICKCORE_OPENMP_SUPPORT)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 #pragma omp parallel for schedule(static) share=
d(status) \<br>
-@@ -2502,14 +2502,14 @@ static MagickBooleanType TransformsRGBImage(Image =
*image,<br>
+@@ -2394,14 +2394,14 @@ static MagickBooleanType TransformsRGBImage(Image =
*image,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (logmap =3D=3D (Quantum *) NULL)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ThrowBinaryException(ResourceLimitError,=
&quot;MemoryAllocationFailed&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image-&gt;filename);<br>
@@ -103,10 +101,10 @@ index 2ffc72f88fa..e3b7df339f6 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 logmap[i]=3DQuantumRange;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (image-&gt;storage_class =3D=3D PseudoClass)=
<br>
=C2=A0diff --git a/MagickCore/memory.c b/MagickCore/memory.c<br>
-index 2598044486a..01bc80d86c5 100644<br>
+index 060b05e71..5db57acc7 100644<br>
=C2=A0--- a/MagickCore/memory.c<br>
=C2=A0+++ b/MagickCore/memory.c<br>
-@@ -1269,26 +1269,36 @@ MagickExport MemoryInfo *RelinquishVirtualMemory(M=
emoryInfo *memory_info)<br>
+@@ -1230,26 +1230,36 @@ MagickExport MemoryInfo *RelinquishVirtualMemory(M=
emoryInfo *memory_info)<br>
=C2=A0 %=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0%<br>
=C2=A0 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%=
%%%%%%%%%%%<br>
=C2=A0 %<br>
@@ -144,13 +142,13 @@ index 2598044486a..01bc80d86c5 100644<br>
=C2=A0 =C2=A0 assert(memory !=3D (void *) NULL);<br>
=C2=A0-=C2=A0 return(memset(memory,byte,size));<br>
=C2=A0+=C2=A0 while (n-- !=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 *p++=3D(unsigned char) c;<br>
-+=C2=A0 return(memory);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*p++=3D(unsigned char) c;<br>
++=C2=A0 return(memory);=C2=A0 <br>
=C2=A0 }<br>
- <br>
+ <br>
=C2=A0 /*<br>
=C2=A0diff --git a/MagickCore/signature.c b/MagickCore/signature.c<br>
-index 2d9b0801523..1f79c91b11b 100644<br>
+index f0f0e42e0..f21feda27 100644<br>
=C2=A0--- a/MagickCore/signature.c<br>
=C2=A0+++ b/MagickCore/signature.c<br>
=C2=A0@@ -736,7 +736,7 @@ RestoreMSCWarning<br>
@@ -160,10 +158,10 @@ index 2d9b0801523..1f79c91b11b 100644<br>
=C2=A0-=C2=A0 (void) memset(W,0,sizeof(W));<br>
=C2=A0+=C2=A0 (void) ResetMagickMemory(W,0,sizeof(W));<br>
=C2=A0 }<br>
- <br>
+ <br>
=C2=A0 /*<br>
=C2=A0diff --git a/coders/thumbnail.c b/coders/thumbnail.c<br>
-index 59d97380d9e..e92dd312011 100644<br>
+index 1f7900aef..169bcfea8 100644<br>
=C2=A0--- a/coders/thumbnail.c<br>
=C2=A0+++ b/coders/thumbnail.c<br>
=C2=A0@@ -199,7 +199,8 @@ static MagickBooleanType WriteTHUMBNAILImage(cons=
t ImageInfo *image_info,<br>
@@ -172,7 +170,10 @@ index 59d97380d9e..e92dd312011 100644<br>
=C2=A0 =C2=A0 }<br>
=C2=A0-=C2=A0 if ((q+length) &gt; (GetStringInfoDatum(profile)+GetStringInf=
oLength(profile)))<br>
=C2=A0+=C2=A0 if ((q &gt; (GetStringInfoDatum(profile)+GetStringInfoLength(=
profile))) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 (length &gt; (GetStringInfoDatum(profile)+GetStringI=
nfoLength(profile)-q)))<br>
++=C2=A0 =C2=A0 =C2=A0 (length &gt; (GetStringInfoDatum(profile)+GetStringI=
nfoLength(profile)-q)))=C2=A0 <br>
=C2=A0 =C2=A0 =C2=A0 ThrowWriterException(CoderError,&quot;ImageDoesNotHave=
AThumbnail&quot;);<br>
=C2=A0 =C2=A0 thumbnail_image=3DBlobToImage(image_info,q,length,exception);=
<br>
=C2=A0 =C2=A0 if (thumbnail_image =3D=3D (Image *) NULL)<br>
+-- <br>
+2.25.1<br>
+<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--000000000000f906690639910385--

