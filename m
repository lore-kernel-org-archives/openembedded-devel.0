Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FCB6E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 17:44:30 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.26964.1736271861882598147
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 09:44:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TWmatot2;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29f7c3bcf45so8119559fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 09:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736271861; x=1736876661; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OmvfVWArrZW3d2NlxlGlXCyz5v1t+g2HreeQ9kuCDE=;
        b=TWmatot28w129OhDWs1zX8488J5mO9YtSk/L7mShuI0/dcrQSXSA7U+UKO15zNnLUL
         L+hxSsLXwn0hLWyxpnUjggElhQPYyWqs/5+EfBQ1ZatvtUT6ca6WJHxqpYC6G1XNdCOq
         Q7sp/ZBj4J1JwzuOLDU/Uez7dq6KzAfea7CinDv6JXohA79dS2SOTxtGjbiRJMcUo9Wg
         57+haf70AoSJCIg0o4UsORWfXqDoJumsOCEoB8QFe80rfBUQgu4U2dq1achTiUhD+655
         x8ngLzAvWfYid3UuhUfupUwdDtnpNSreV98IIsEDJiVm1eum/g1YME4nouaUDm0hYjao
         hCWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271861; x=1736876661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1OmvfVWArrZW3d2NlxlGlXCyz5v1t+g2HreeQ9kuCDE=;
        b=flaj0NP8xRt6fczz3szXsQvprShjUxgLeZY7bo6lo+QeBaMO2UL6Bj1WF/eeAAM6r5
         ugPCaCRzmySXuJC3aEgf1KKvn/gR1+E95X1/t8891zt9lD9FodEtq/fSJhFbfIlUi8Sc
         AXcNIXHTcwmPDPfaYi4iFCYCtFgHvIu9rPHIV21lIm+lDEIiLIWZaiynK8oiXBN1lEJ4
         Iplu/nA6g3IsjBzaQ47ZrqDCSB/5F3FpprZLunR2GTQRPGVD972/zxZ/aXrpg0r97QY8
         eJq2EN5opGIwgFHNNBXIAqUwQsUlnWHAbHGlNHHFQHfMc+OVNSv4JJglVOa2vCSlFz0e
         BNpA==
X-Gm-Message-State: AOJu0YwOAIZaabGkKQj9fQ6JYcvjOVHAhyJza+EvTKuzVslk3rXAzK4B
	nAd/kOr+YbdOaq21KJfti0S7uBpWjalzTTUuA5LC6xU1JbvGQqgYZJOc/tc8IZbRsYrbJhCtNme
	FfudTPCK4MyiKVcJdXB4SY7TPXVELYTkA
X-Gm-Gg: ASbGnctLMcHyuiY0MJ+BO9fenlWBasozk29yiYMQJBhMCGxz0YH3FTW7iv0izepNjdG
	y9Eqx0yNROB8dFrehI6rt/vIJdIp9+DAairiK
X-Google-Smtp-Source: AGHT+IEluNo0aJ7hKoxLiVw+B3SWItd4dMXT0cdJ/oYASKKSzCndW65coEUnamh+7dksWO/g/ks5HdI9B8y3G5m4beM=
X-Received: by 2002:a05:6870:8a20:b0:254:bd24:de83 with SMTP id
 586e51a60fabf-2a7fb0dcc07mr30039296fac.12.1736271861068; Tue, 07 Jan 2025
 09:44:21 -0800 (PST)
MIME-Version: 1.0
References: <20250107163644.2845120-1-f_l_k@t-online.de>
In-Reply-To: <20250107163644.2845120-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jan 2025 09:43:55 -0800
X-Gm-Features: AbW1kvZd-YE_J1_LAOWdx6u_VyYu5DxpaK8udNFFHOUuND_DZSO5QswbI3L6oV8
Message-ID: <CAMKF1sqw4Y9ZdvZUzMtF+=zm8SpZxUGa4KiRvD3-VjvwDEV=AA@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCHv4] libheif: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 17:44:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114720

since its depending upon openh264 and openh264 does not support all arches =
see
meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb

You might want to limit the architecture set to what openh264 supports.

On Tue, Jan 7, 2025 at 8:36=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
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
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libheif/libheif_1.19.5.bb                 | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif_1.=
19.5.bb
>
> diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb=
 b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> new file mode 100644
> index 0000000000..952851d4c1
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
> @@ -0,0 +1,24 @@
> +SUMMARY =3D "libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Imag=
e File Format) file format decoder and encoder"
> +HOMEPAGE =3D "https://github.com/strukturag/libheif"
> +LICENSE =3D "LGPL-3.0-only"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df07b2bc152eaee52edbd338825f47=
4d4"
> +LICENSE_FLAGS =3D "commercial"
> +
> +SRC_URI =3D "git://github.com/strukturag/libheif.git;protocol=3Dhttps;br=
anch=3Dmaster"
> +
> +S =3D "${WORKDIR}/git"
> +SRCREV =3D "cd95b113d78d0696105a9e678cbd19487ee13d6c"
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS +=3D "gdk-pixbuf openh264 x265 libde265 tiff zlib libpng libwebp=
"
> +
> +PACKAGECONFIG +=3D "dav1d jpeg jpeg2000 ffmpeg aom"
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

