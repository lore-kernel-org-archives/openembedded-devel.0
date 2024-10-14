Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3A7CF259D
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 05:57:42 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.48110.1728885454886143048
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 22:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fQwfT8+A;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5e98a16ea68so1866443eaf.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 22:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728885454; x=1729490254; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DW4kBCPmsHPzbsiiyk/HGctbv0PPx1bo0H/3xHCU55U=;
        b=fQwfT8+Ag7V3ReDBnt2B8No5na4WYeBMXcLMnX537PFIjVZbV8kAXRfv1swETkRgP3
         dXVV1oQcxJtNVQFfqT/v/672M1ElwMI9aehTm6wjjAj3DSfJckhjWKwyEiMyRnLA290/
         zXyOgt8dI63f0FQQt9Az0chmMiB/RvMDjFD+XP2ZnoTFd3Qi7w3/XMFDT9lMdMQoOkHp
         gJLz88ZHtPq8VJaNiS+HOBEH0hGPdhK1mceAd4kLVRs1N7lR29fGARNTf3XnIKnvPGQa
         e9rBPSzzFyrbPKmEw/z9hl0mAWjfJdrZ7ouV0BEony7bG8THk27WEEYtJRCaZpgUtMAy
         4x7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728885454; x=1729490254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DW4kBCPmsHPzbsiiyk/HGctbv0PPx1bo0H/3xHCU55U=;
        b=N+nO36fS9LClM2sJatUGE3Pd9s0lESQioJ5BfSXTPpJEmHHuXXzzHsuxAB104UYJ29
         eVRZba9QJNyYgVPGK4Vdo6ySbL3vOQ+w9+AztoN96NSjIN2JOM8yVlrSQQ9cWt7h2TTr
         UhyxxbLK4O5M5uc5CCmj8F06FVrJOKsMZHKi8jQX3hDP8bepxsMf9jKgOTDhsqCqLqSD
         FFssvNgEgBbesrqXa1Z6wVOCCuy9yRZIOldv75iqS2DPR63nNCm4KwvxqCdhEnO82Doi
         fWeP893Fwhab8h8JcwS30fmsnkfWdoXdjwHmlnhDhZb15ukQK8O/xDcGpWgBZJKnXbaD
         KJ/w==
X-Gm-Message-State: AOJu0Yz60uNdFUYC2+VYJyDM08u1XeRDfxqh06bJsX/mI5b20XW0M3ye
	07w4EzKB4bzNGaVjX0bJZhrqk6m350fv8nnsBxX+qY879G2xpGIHzSK2I6+S7uXuOgL8HuDXGZG
	gCeHxevr7mOsOfgf68NkTyZz2sew=
X-Google-Smtp-Source: AGHT+IGmSk+eQp0BptlZQ4QpPia2VWQf9FmCjp+BY5fx5XaibSV7AxbrWuSiAXM8wOyck6detapr5ElT20s6+rSnPSA=
X-Received: by 2002:a05:6820:1c9d:b0:5e1:e65d:5148 with SMTP id
 006d021491bc7-5eb1a1b9d7dmr3313864eaf.6.1728885453964; Sun, 13 Oct 2024
 22:57:33 -0700 (PDT)
MIME-Version: 1.0
References: <20241013203459.47304-1-f_l_k@t-online.de> <20241013203459.47304-2-f_l_k@t-online.de>
In-Reply-To: <20241013203459.47304-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 13 Oct 2024 22:57:07 -0700
Message-ID: <CAMKF1sq6tB33wMYaagLTeV+7Nv+g15X4L8VmZR3waq8VK8qaLw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] libplacebo: dont use gitsm
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 05:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112846

I think we can not shun using submods for fetching the needed modules.
It ends up with build time errors since it can not find fastfloat now,
and errors out with clang

https://errors.yoctoproject.org/Errors/Details/809534/

On Sun, Oct 13, 2024 at 1:41=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - Add PACKAGECONFIGs to allow build according to DISTRO_FEATURES
> - Add path to vulkan-registry
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../mplayer/libplacebo_7.349.0.bb             | 25 +++++++++----------
>  1 file changed, 12 insertions(+), 13 deletions(-)
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/m=
eta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
> index b68e67a8c..26e946370 100644
> --- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
> @@ -1,22 +1,21 @@
>  SUMMARY =3D"Reusable library for GPU-accelerated video/image rendering p=
rimitives"
>  LICENSE =3D "Apache-2.0 & BSD-3-Clause & BSL-1.0 & MIT"
> -LIC_FILES_CHKSUM =3D "file://3rdparty/Vulkan-Headers/LICENSE.txt;md5=3D3=
b83ef96387f14655fc854ddc3c6bd57 \
> -                    file://3rdparty/fast_float/LICENSE-APACHE;md5=3D81db=
248e90379bcfc0582b578b009bc3 \
> -                    file://3rdparty/fast_float/LICENSE-BOOST;md5=3D2c7a3=
fa82e66676005cd4ee2608fd7d2 \
> -                    file://3rdparty/fast_float/LICENSE-MIT;md5=3D32b11d5=
0c7d9788d4270f6a83f3e68eb \
> -                    file://3rdparty/glad/LICENSE;md5=3Dae570f26774ac096c=
ff8f992091a223c \
> -                    file://3rdparty/jinja/LICENSE.rst;md5=3D5dc88300786f=
1c214c1e9827a5229462 \
> -                    file://3rdparty/jinja/docs/license.rst;md5=3D5f4c795=
946979fabc2361be4c70d0a9f \
> -                    file://3rdparty/markupsafe/LICENSE.rst;md5=3Dffeffa5=
9c90c9c4a033c7574f8f3fb75 \
> -                    file://3rdparty/markupsafe/docs/license.rst;md5=3D5f=
4c795946979fabc2361be4c70d0a9f \
> -                    file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d85d=
a \
> -                    file://demos/3rdparty/nuklear/src/LICENSE;md5=3D6052=
431ae6cd4f0082276c54996e7770 \
> -                    file://demos/LICENSE;md5=3D65d3616852dbf7b1a6d4b53b0=
0626032"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D435ed639f84d4585d93824e7da3d8=
5da"
>
> -SRC_URI =3D "gitsm://github.com/haasn/libplacebo;protocol=3Dhttps;branch=
=3Dmaster"
> +SRC_URI =3D "git://code.videolan.org/videolan/libplacebo.git;protocol=3D=
https;branch=3Dv7.349"
>
>  SRCREV =3D "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
>
>  inherit meson pkgconfig
>
>  S =3D "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan openg=
l', d)}"
> +
> +PACKAGECONFIG[vulkan] =3D  "-Dvulkan=3Denabled,-Dvulkan=3Ddisabled,vulka=
n-loader vulkan-headers shaderc spirv-shader-generator python3-mako-native =
python3-jinja2-native glad-native"
> +PACKAGECONFIG[glslang] =3D "-Dglslang=3Denabled,-Dglslang=3Ddisabled,gls=
lang"
> +PACKAGECONFIG[opengl] =3D "-Dopengl=3Denabled,-Dopengl=3Ddisabled,glad,g=
lad"
> +PACKAGECONFIG[lcms] =3D "-Dlcms=3Denabled,-Dlcms=3Ddisabled,lcms"
> +PACKAGECONFIG[demos] =3D "-Ddemos=3Dtrue,-Ddemos=3Dfalse,ffmpeg libsdl2 =
libsdl2-image"
> +
> +EXTRA_OEMESON =3D "-Dvulkan-registry=3D${STAGING_DATADIR}/vulkan/registr=
y/vk.xml"
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112842): https://lists.openembedded.org/g/openembedde=
d-devel/message/112842
> Mute This Topic: https://lists.openembedded.org/mt/108989872/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

