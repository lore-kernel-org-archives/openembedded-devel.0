Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587DDC27C43
	for <webhook@archiver.kernel.org>; Thu, 30 May 2024 15:10:47 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.11734.1717081841863657045
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 May 2024 08:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FYxKAoSu;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d1c051a9e7so64024b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717081841; x=1717686641; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RJufnmivuY90hiUH31uFbYXffjH7pGyukiVejHyiDII=;
        b=FYxKAoSu3CN2zzF/xRIPi6zI2mUacLV6MhlrAzMMP5ZcYxSJ9GSvoHdVhUS+SbJ7zJ
         ia5pchrBm9mpVytRNtK77IhluyEdNFtkOrAgel+65AlAmWro21j0lIKhpJaGfsKDcsZf
         13r0XdRQfsEZKQPRWMEnbBeEQ9F+XD0b59MiLuq8mjdhtaZ8Ae0Qc09qBTF8Bs0ZrQEM
         lHZlQEMbyazhaAwBrfpGQkIM7TVbeFQkbqLvTBqQhHk1vhBFB+0B5h45BQTq6bWYxaLN
         eNkk6MfHXUPym/oGZdEVI3crwlpj2+rvlFqrYClaOCLzuO/8ZFRwf8Xoln9S8G8eJf7g
         EH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081841; x=1717686641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJufnmivuY90hiUH31uFbYXffjH7pGyukiVejHyiDII=;
        b=lIbQBxBm+DQP8mxdRqHD5OxIWprF/rtu9hnNrXDxUTRhezISLHRDGvks9bfnbCGpWw
         IQ+SwHO2xnth6Y5UA8J4ORGVE4CeZpb9CvixUGnK0Z4DFHrUj47IynGTA3Yf4mkEjK4L
         vPiKcrezXP+3wbFyK2eJ5CKztHATYYyKhp32ObZ/WZ3XgbYKi3kkeR5cVoWLZi4nR/qa
         nuHKJ7ImVzfgx6mUWaediCQ0nIttfIyeuAZEZTOFCLWJIcdTP9Q8sUkR/rF14XA0tJAU
         vGA3+AYRCJQ1zelrjfFX4AFuCmU+jB6IeqJjGppzI4Rl2dtJZEp3quXb0ZSWDPDAiwQK
         f+KA==
X-Gm-Message-State: AOJu0YzzxHBrKK9BxOyBvv2NjMjyabT/IeRLVitX95W/zFhF2ZHBhIin
	cYJAC5U1qdhziG/EfXe+VTJ+TZjvZ2iehKS0D2SXfPQ5JIZ18MssPiSicKVgQVZj9tWfFpqE4Hl
	Xkbcz6i9FX78oDMqDU4ZdfSqB1u4=
X-Google-Smtp-Source: AGHT+IFyyvYhZQ2PhAT0Bo7zu27AYA4mfV+f3ybMC3JU6N/gwm6kOGzKu7/nNikWWDeYocl0LLv36+25vNFJC9Zzx5A=
X-Received: by 2002:a05:6808:1983:b0:3c9:6a5b:51cf with SMTP id
 5614622812f47-3d1dcc9c174mr2765474b6e.9.1717081841025; Thu, 30 May 2024
 08:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240529090223.1816443-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20240529090223.1816443-1-dmitry.baryshkov@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 May 2024 08:10:14 -0700
Message-ID: <CAMKF1sp=+ALCxj1fdNHQgj8eFrexnY8R=EmLp3GVGyvk0+gNTA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cabextract: add utility to extract Microsft
 cabinet files
To: dbaryshkov@gmail.com
Cc: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 May 2024 15:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110628

fails to build.
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3893/step=
s/14/logs/stdio

On Wed, May 29, 2024 at 2:02=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> WoA firmware, fonts and some other useful files are being distributed as
> a Microsoft cabinet files. Add recipes for the cabextract utility, which
> is used to extract such files.
>
> Cabextract can either use a bundled source tree for libmspack library or
> an externally provided library. Package the library separately in order
> to be able to share it with the meta-security layer.
>
> Cc: Armin Kuster <akuster808@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../cabextract/cabextract_1.11.bb              | 18 ++++++++++++++++++
>  .../cabextract/libmspack_0.11alpha.bb          | 16 ++++++++++++++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta-oe/recipes-support/cabextract/cabextract_1.11.bb
>  create mode 100644 meta-oe/recipes-support/cabextract/libmspack_0.11alph=
a.bb
>
> diff --git a/meta-oe/recipes-support/cabextract/cabextract_1.11.bb b/meta=
-oe/recipes-support/cabextract/cabextract_1.11.bb
> new file mode 100644
> index 000000000000..4d035eeee4b0
> --- /dev/null
> +++ b/meta-oe/recipes-support/cabextract/cabextract_1.11.bb
> @@ -0,0 +1,18 @@
> +SUMMARY =3D "Software for extracting Microsoft cabinet files"
> +DESCRIPTION =3D "tool for extracting Microsoft cabinet files"
> +HOMEPAGE =3D "http://www.cabextract.org.uk/"
> +SECTION =3D "console/utils"
> +
> +LICENSE =3D "GPL-3.0-or-later"
> +LIC_FILES_CHKSUM =3D "file://src/cabextract.c;beginline=3D4;endline=3D11=
;md5=3Db0a10c6d3843f262114e7ecf91fc7e78"
> +
> +SRC_URI =3D "https://www.cabextract.org.uk/cabextract-${PV}.tar.gz"
> +SRC_URI[sha256sum] =3D "b5546db1155e4c718ff3d4b278573604f30dd64c3c5bfd46=
57cd089b823a3ac6"
> +
> +DEPENDS =3D "libmspack"
> +
> +EXTRA_OECONF =3D "--with-external-libmspack"
> +
> +inherit autotools pkgconfig
> +
> +BBCLASSEXTEND +=3D "native nativesdk"
> diff --git a/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb b/=
meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
> new file mode 100644
> index 000000000000..169a5f271be9
> --- /dev/null
> +++ b/meta-oe/recipes-support/cabextract/libmspack_0.11alpha.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "A library for Microsoft compression formats"
> +DESCRIPTION =3D "The library provides compressors and decompressors,\
> +archivers and dearchivers for Microsoft compression formats: CAB, CHM, W=
IM,\
> +LIT, HLP, KWAJ and SZDD."
> +HOMEPAGE =3D "http://www.cabextract.org.uk/libmspack/"
> +SECTION =3D "lib"
> +LICENSE =3D "LGPL-2.1-only"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D7fbc338309ac38fefcd64b04b=
b903e34"
> +
> +SRC_URI =3D "https://www.cabextract.org.uk/libmspack/libmspack-${PV}.tar=
.gz"
> +SRC_URI[sha256sum] =3D "70dd1fb2f0aecc36791b71a1e1840e62173079eadaa08119=
2d1c323a0eeea21b"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND +=3D "native nativesdk"
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110609): https://lists.openembedded.org/g/openembedde=
d-devel/message/110609
> Mute This Topic: https://lists.openembedded.org/mt/106365503/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

