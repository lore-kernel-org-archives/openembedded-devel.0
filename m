Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 721F4C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 18:06:10 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.102153.1701108363541687720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Nov 2023 10:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FdXp2162;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6d816bb0a61so1300222a34.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 10:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701108363; x=1701713163; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtwEzKg1CDF49Wl2X2ZYZ4wIlGoinzKKmPyeZaDcQVk=;
        b=FdXp2162mNa1wu7a1rLNZVKprwF5nv9ofeHANTUFA5PZlNIIc208Tsbrg8FD64Psda
         ycixdARHkCM+cHoBDX0FAQR56zSPecRGk7wuMx4efuXl2c3j6pO5iRj67q7lqDGYhn/B
         bA6WGQEV+3MlhUb6CblCoeZEDnbqffnaI1JvPEcx+DgMG5/xDujC64nX4DDHWKqs79Ul
         MiXS2FXj0kZ67RJWBlZPVdR4xRApIi3OqakBhM1oX0j19D7copBYH9wmpxGSakZ7fIzB
         wdgSt6CnxgIn7LrXvsPErYYviQSAb1tdPCxAyfEUlAJGXiEIhGFtn+3vonluxrBEVNR6
         +QbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701108363; x=1701713163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QtwEzKg1CDF49Wl2X2ZYZ4wIlGoinzKKmPyeZaDcQVk=;
        b=KHWyHvRuTgV2tuslHyqf1a917vN9GbpD7TkbndE7L6snU2Vn56HmugNTVFgLprukXK
         pwpY+wQ8mx9T+o4cziBqrGalfnCfLE8WUdAuN1l/G/RJv+kmedcDSOw3BNTHuJGcJ851
         RWoHdVM+dHrh3ELSR7dRTsY03v9za6kxgHzLCP9D2BfsQmZSyTHMBK026ZTSGL/8nfR3
         YPlk/Rd9KrBdlrf3dSvUhuc0+Ro0kuZ29WXyR4sFaExLoPcvBiJgjFivS0/2HOutkflG
         wpW0Wx52zIU9glxLH5zKeEJ8I0tklwGjp3RNNYG3BHFVwABVb1ApbjuNFZoYJDktKitx
         YtWw==
X-Gm-Message-State: AOJu0Yx6NdUB8McMgbwvVgp+U4Ei4Ko25YZA6OiSCycijIgp3wF9wCsh
	GyGY2ZiaWSd/dNMkefTY3I6xmAM6R2ykgxkcXf4=
X-Google-Smtp-Source: AGHT+IHLAT7p+p8GDhSJDMagxelC6EBvjodmvLjthN5EK621ORhCEEn7j6fe14gJpaUagSfCqycyefxxgkKOV6pDSFs=
X-Received: by 2002:a05:6871:5811:b0:1f9:3823:7695 with SMTP id
 oj17-20020a056871581100b001f938237695mr14439725oac.42.1701108362609; Mon, 27
 Nov 2023 10:06:02 -0800 (PST)
MIME-Version: 1.0
References: <20231127133808.1396531-1-alperyasinak1@gmail.com>
In-Reply-To: <20231127133808.1396531-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 27 Nov 2023 10:05:36 -0800
Message-ID: <CAMKF1spUpnuDK8BB=yWpTL3KZobFCe4XQZ=d-k3O9=A=WWgZ7w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] msgpack-c: upgrade 4.0.0 -> 6.0.0
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Nov 2023 18:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107061

tmate fails to build with this upgrade

https://errors.yoctoproject.org/Errors/Details/743897/

On Mon, Nov 27, 2023 at 5:38=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> =
wrote:
>
> - GTest should be OFF by default. -> https://github.com/msgpack/msgpack-c=
/issues/1066
>
> Changelog:
>
> - Remove C++ requirement if test is disabled (#1055)
> - Change CMake package name of C library to msgpack-c (#1053)
> - Unified all C package, library, cmake, tarball name become msgpack-c.
> - Add additional address sanitizer for CI. (#1023)
> - Change CMake package name of C library to msgpackc (#1044, #1049)
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../msgpack/{msgpack-c_4.0.0.bb =3D> msgpack-c_6.0.0.bb}      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/msgpack/{msgpack-c_4.0.0.bb =3D> msgpack=
-c_6.0.0.bb} (86%)
>
> diff --git a/meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb b/meta-o=
e/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> similarity index 86%
> rename from meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
> rename to meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> index c6a6ac467..40d997a52 100644
> --- a/meta-oe/recipes-devtools/msgpack/msgpack-c_4.0.0.bb
> +++ b/meta-oe/recipes-devtools/msgpack/msgpack-c_6.0.0.bb
> @@ -7,14 +7,14 @@ LIC_FILES_CHKSUM =3D "file://NOTICE;md5=3D7a858c0747236=
08e08614061dc044352 \
>                      file://LICENSE_1_0.txt;md5=3De4224ccaecb14d942c71d31=
bef20d78c \
>                     "
>
> -PV .=3D "+git${SRCPV}"
> -
>  SRC_URI =3D "git://github.com/msgpack/msgpack-c;branch=3Dc_master;protoc=
ol=3Dhttps \
>             "
> -SRCREV =3D "a9a48cea3a78ba661ee8096b5dab456361b0ff23"
> +SRCREV =3D "8160ede5e20fd3019a77eea46d9c72cf6163f802"
>
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake pkgconfig
>
> +EXTRA_OECMAKE +=3D "-DMSGPACK_BUILD_TESTS=3Doff"
> +
>  BBCLASSEXTEND +=3D "native nativesdk"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107059): https://lists.openembedded.org/g/openembedde=
d-devel/message/107059
> Mute This Topic: https://lists.openembedded.org/mt/102828614/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

