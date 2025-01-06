Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E53E77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 15:25:03 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.61906.1736177097312830724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 07:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I6wQzAAC;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2a8690dcb35so3868406fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 07:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736177096; x=1736781896; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pio4JFPDiRe/O6SVSnPFa55gXFAghjkJcuAP5pM6Syc=;
        b=I6wQzAACvnWt4efWwLgu+W8ZP2NIdrTG6njUBwnvA3W05IEMW7UbbklvR1wPx5x4iz
         kczQgEkYxDkJadOwkzzPIl9kIfTqyD7s3CKirzWnJU9F7IdzCaxK3RbQoBxE3+KpoW1F
         0pZB8ZrFNN7e2u9K/D87PDTGPOREZZrYPOzL8pU9p0XOVTshV4enUCvZMqf4nQKn2y2O
         NEzZaxxuHzX2AAiqlETTrcRtVcY9fq88Jzxfuoh7bNquLcX9ro1MJn5o6+AhauOVtLVw
         gyieQzRXoinvojeb1in5sIiX/q6hpUTzH64dTBsi+LimcSuqU+NbF3ccuoONL0+ykKEw
         ZP5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177096; x=1736781896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pio4JFPDiRe/O6SVSnPFa55gXFAghjkJcuAP5pM6Syc=;
        b=Yq3Z9O9hF81E+E2ycTb1Q6pfKhi3AHnFjoK3d023fUWyFn8ex1Emc5lEDo0iW98ESJ
         6lhtIwXcsYaQbL3pZ8ivGTHqdyoAJwqIjwwEAk+SWximnSe3pn57QBEyo9f8RaFmh5T4
         m0PMWNJY7T4FMGUCAtFLIwY7vQcEuUFq0INb27zJfSTzd7HG+Ext1C5VWZOh6WeKv2sJ
         /df26nkOlZ1WkzJGQue63NY+e8QDNlD2ttJBhbZNOCGmf15nFp+1QiZ3+pyHtMfGJKIm
         tk6EVaJCtm+bDxcyw1/BvbcBUZlXuFC+bTqYe6ol3wY+dkECnmdnsVMxEgjbwEXrZTUW
         e1cg==
X-Gm-Message-State: AOJu0YwZpQgkbUCHfPcG9xE5aSa/Zf8z52fHTjJ5ZAHgMKg287WDHTpF
	tOLBsufc2wypT9wQK7ga+UYvqakt+GjpM1rfvGfOSy8KVREjnVSqCbN+ejpF532XMGYOm79Ukf1
	3eguSgpYPiRn/J7VCntnKYE/ib5Q=
X-Gm-Gg: ASbGncsh1CNwWHsQYm3hgkHyOkXJiCqMxtPcYtHRLhcdH+kAXMGsuwNbqWN8Z7Ok/6M
	V+F9ss9c8XRveVHTvhwFCRIrXwiEOhPr3omXYW+3p1MeaX9ffTx5e
X-Google-Smtp-Source: AGHT+IH9FZl1YV+F4Z/4gBd+6+WgePtfOuZDpKuGN1dBmsDxZo3eBX3S7dRJZHJWonP18CS1MbM+9YCv9WUqfxPC+3Q=
X-Received: by 2002:a05:6870:3921:b0:297:241b:1471 with SMTP id
 586e51a60fabf-2a7fb4181d6mr32633739fac.41.1736177096357; Mon, 06 Jan 2025
 07:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20250105181653.364883-1-f_l_k@t-online.de>
In-Reply-To: <20250105181653.364883-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Jan 2025 07:24:30 -0800
Message-ID: <CAMKF1so=cPOWjf7GOHL2LhR0OD_3dC5Yute1gL5nWt9gyJ=C3Q@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] libheif: add recipe
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 15:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114665

it fails layer compat check see

https://valkyrie.yoctoproject.org/#/builders/81/builds/251/steps/11/logs/er=
rors

On Sun, Jan 5, 2025 at 10:17=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Image File Format)=
 file format decoder and encoder. There is partial support for ISO/IEC 2300=
8-12:2022 (2nd Edition) capabilities.
>
> HEIF and AVIF are new image file formats employing HEVC (H.265) or AV1 im=
age coding, respectively, for the best compression ratios currently possibl=
e.
>
> libheif makes use of libde265 for HEIF image decoding and x265 for encodi=
ng. For AVIF, libaom, dav1d, svt-av1, or rav1e are used as codecs.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../libheif/libheif_1.19.5.bb                 | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif_1.=
19.5.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb=
 b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> new file mode 100644
> index 0000000000..144d899f3f
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> @@ -0,0 +1,23 @@
> +SUMMARY =3D "libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Imag=
e File Format) file format decoder and encoder"
> +HOMEPAGE =3D "https://github.com/strukturag/libheif"
> +LICENSE =3D "LGPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df07b2bc152eaee52edbd338825f47=
4d4"
> +
> +SRC_URI =3D "git://github.com/strukturag/libheif.git;protocol=3Dhttps;br=
anch=3Dmaster"
> +
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "cd95b113d78d0696105a9e678cbd19487ee13d6c"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS +=3D "gdk-pixbuf openh264 x265 libde265 tiff zlib libpng"
> +
> +PACKAGECONFIG +=3D "dav1d jpeg jpeg2000 ${@bb.utils.contains('LICENSE_FL=
AGS_ACCEPTED', 'commercial', 'ffmpeg', '', d)}"
> +PACKAGECONFIG[aom] =3D "-DWITH_AOM_ENCODER=3DON -DWITH_AOM_DECODER=3DON,=
-DWITH_AOM_ENCODER=3DOFF -DWITH_AOM_DECODER=3DOFF,aom"
> +PACKAGECONFIG[dav1d] =3D "-DWITH_DAV1D=3DON, -DWITH_DAV1D=3DOFF,dav1d"
> +PACKAGECONFIG[svt-av1] =3D "-DWITH_SvtEnc=3DON,-DWITH_SvtEnc=3DOFF,svt-a=
v1"
> +PACKAGECONFIG[jpeg] =3D "-DWITH_JPEG_DECODER=3DON -DWITH_JPEG_ENCODER=3D=
ON,-DWITH_JPEG_ENCODER=3DOFF -DWITH_JPEG_DECODER=3DOFF,jpeg"
> +PACKAGECONFIG[ffmpeg] =3D "-DWITH_FFMPEG_DECODER=3DON,-DWITH_FFMPEG_DECO=
DER=3DOFF,ffmpeg"
> +PACKAGECONFIG[jpeg2000] =3D "-DWITH_OpenJPEG_ENCODER=3DON -DWITH_OpenJPE=
G_DECODER=3DON,-DWITH_OpenJPEG_ENCODER=3DOFF -DWITH_OpenJPEG_DECODER=3DOFF,=
openjpeg"
> +
> +FILES:${PN} +=3D "${libdir}/libheif ${datadir}/thumbnailers ${libdir}/gd=
k-pixbuf*"
> --
> 2.47.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#114630): https://lists.openembedded.org/g/openembedde=
d-devel/message/114630
> Mute This Topic: https://lists.openembedded.org/mt/110442845/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

