Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC56C28B30
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:39:40 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.55818.1742225978097843368
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 08:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f3+vzOMg;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54943bb8006so4245112e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 08:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742225976; x=1742830776; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVRtNIbO+lORXTq4Uq/MW92vwd2KMkPeBGkz4x3OEIc=;
        b=f3+vzOMg97tl19L6RDuhlxiM6d/bLaW4zs8UmJgBPtCeF9fZZR9nbNPjR1XexxW0NI
         m+VSGQsTcxAAtgjBkHksRagusH6/GNYtvyGuMHGVeT/tr4RLotbEsuGrowana3yJ85D9
         fji/TrcSvb8LSnUBGV+Pn7vwPeDawSF5ILieTWAe84etpdrHaUNFdpp9lj9cIx60duhS
         9qSiLq3H3cvmOEo41v3IShw8vgHWWam9o9so98XHfHAEXZGSllEkZyO52oWuf+STzAX3
         kO0y2VDDjOVK0yN+9E+FrloKnW+tjTLYzKDsAq2l9gtfbhTWivwQvzfy1tEsZDHZGr91
         0Z4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742225976; x=1742830776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVRtNIbO+lORXTq4Uq/MW92vwd2KMkPeBGkz4x3OEIc=;
        b=RbqdHy3j3DDr9Yux9QiUUZeWyar/e+ZgTYaR4ZjyqFgD36sSW/ZX+V5+Dh+KM5+LxE
         Cz/j9sEF7X9YppQarnpDWmCvuCowTp00++AxzAR2ImGVLdunRDeU+0XR/5OYTGg7Qaqq
         213S5DLUI2yAJAF31KLYUnG25dj1mgf5XzQdfC0DDrkFR5ZcnY+0IKaIwSqUOeC/KiWY
         QVfVtCf62eA7ASGX8s+YMdMbH5rN9i8PlxYOaggpkYVpqGPltGQ+Pg6RyllwHWWf4p/m
         L5p+vJeEAGVu6we/HIuGS2JeJoq7pgafhtjrR9tJmbHjVcOaBGZTf9ThNP84Zd7jOYaV
         NWrg==
X-Gm-Message-State: AOJu0YwHZJsUyTHKlFeuZZQvfPENdJXYiSG0at8v3arPRwUeT+fMAyM0
	9HA9fgnjv01X0kMWL7VxX275/+iydpvqGRLWybMSuzCuJPEUWM6an7CwK9kAt06EOyuJLBqWcqz
	J0krtod/pnCMHyb4SveCNiXH+SMX0FCGD
X-Gm-Gg: ASbGncvnzKc3Y0Xp8KJ6aYXGNIxG7lLJ3sEQsr+osRXlDgAcLisWmgOmS7iIx9kC0jl
	bDpT6iBOvqvK3IWBYzuSfXAtCmDiJ6+SFWO2gJBWr9RDFJ/rVAKwnDZeob7DdduyuaNGn3i7kZV
	U618BupStkv3nMX0/DSdZMFmZipTV3QQEpIMQxXVs=
X-Google-Smtp-Source: AGHT+IHEYQHinCJE0KI1UrgrShNziFKNGudtbDyaZYwWEWcCgZBr6fZvZN4Sws+FgjoPz9C/LkqVGyTL4pKy1CdCJF0=
X-Received: by 2002:a05:6512:3f15:b0:545:e2e:8425 with SMTP id
 2adb3069b0e04-549c396f101mr7155619e87.39.1742225975954; Mon, 17 Mar 2025
 08:39:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250317125601.1354282-1-f_l_k@t-online.de>
In-Reply-To: <20250317125601.1354282-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 17 Mar 2025 16:39:24 +0100
X-Gm-Features: AQ5f1JplrJ5FtyrlnS93gZPH1SkdcQfO0JKS98FOJr7bLXypSjGUdj_BZW_cfhI
Message-ID: <CA+chaQe1c0Q-v5o425PLG3Yk6p4D-WnhSN+YKqrvytD0E+5zjw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libsdl3: add fallback to console-build
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:39:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116035

Acked-by: Martin Jansa <martin.jansa@gmail.com>

On Mon, Mar 17, 2025 at 1:55=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This fixes a configure error if neither wayland nor x11 are available:
>
> | CMake Error at cmake/macros.cmake:382 (message):
> |   SDL could not find X11 or Wayland development libraries on your syste=
m.
> |   This means SDL will not be able to create windows on a typical unix
> |   operating system.  Most likely, this is not wanted.
> |
> |   On Linux, install the packages listed at
> |   https://github.com/libsdl-org/SDL/blob/main/docs/README-linux.md#buil=
d-dependencies
> |
> |
> |   If you really don't need desktop windows, the documentation tells you=
 how
> |   to skip this check.
> |   https://github.com/libsdl-org/SDL/blob/main/docs/README-cmake.md#cmak=
e-fails-to-build-without-x11-or-wayland-supp
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb b/meta-oe/=
recipes-graphics/libsdl3/libsdl3_3.2.8.bb
> index 63a78907b0..86a0ae6b50 100644
> --- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
> @@ -55,9 +55,11 @@ PACKAGECONFIG ??=3D " \
>         ${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio pipewire x=
11 vulkan', d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2=
', '', d)} \
>         ${@bb.utils.contains("TUNE_FEATURES", "neon","arm-neon","",d)} \
> +       ${@bb.utils.contains_any("DISTRO_FEATURES", "x11 wayland","","con=
sole-build",d)} \
>  "
>  PACKAGECONFIG[alsa]       =3D "-DSDL_ALSA=3DON,-DSDL_ALSA=3DOFF,alsa-lib=
,"
>  PACKAGECONFIG[arm-neon]   =3D "-DSDL_ARMNEON=3DON,-DSDL_ARMNEON=3DOFF"
> +PACKAGECONFIG[console-build] =3D "-DSDL_UNIX_CONSOLE_BUILD=3DON"
>  PACKAGECONFIG[gles2]      =3D "-DSDL_OPENGLES=3DON,-DSDL_OPENGLES=3DOFF,=
virtual/libgles2"
>  PACKAGECONFIG[jack]       =3D "-DSDL_JACK=3DON,-DSDL_JACK=3DOFF,jack"
>  PACKAGECONFIG[kmsdrm]     =3D "-DSDL_KMSDRM=3DON,-DSDL_KMSDRM=3DOFF,libd=
rm virtual/libgbm"
> --
> 2.48.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116025): https://lists.openembedded.org/g/openembedde=
d-devel/message/116025
> Mute This Topic: https://lists.openembedded.org/mt/111748463/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

