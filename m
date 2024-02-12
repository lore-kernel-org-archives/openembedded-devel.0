Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CD0C4829D
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 22:38:36 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.728.1707777514654477615
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 14:38:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NIiWBJ6+;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2046b2cd2d3so3022518fac.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 14:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707777514; x=1708382314; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c81MNb2tyiuZs8rdxYmelp8E/lz+E+RIe2kKq3JZkSQ=;
        b=NIiWBJ6+mqDKITSgTmeVc98NjANhiH8O95lqyNQjgMjJsysBocsU20WJzwb7KSO5j4
         l5ynDVsacrWGZbZaMm4S3VDSdzSNruF4SUKrZXjo04i37AAWNUUbaJO7arKlQq/gJMxX
         dxGn4KcaIf9e3nGP+iqTbluE/jEYGKQNEPWfD/f/ov82+ZpkOnb93LpxXF+wPvUBQB1i
         SUhe42MEA4WXzP6T9lle2YZmGb0y28jI/WUorAEPBV9R0P+HGUcX2iH2WSZVizfvZDs3
         a34o3RalhidwgQvOP5+vOp8OJJoQDx7QeyDdhmK5KlcLeomEzCrMfy9u+hG7Ob9YDVe1
         FL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707777514; x=1708382314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c81MNb2tyiuZs8rdxYmelp8E/lz+E+RIe2kKq3JZkSQ=;
        b=qMqIDc705eu+VdV8ewLZAlwbdg0MrQFFiKiXQfRkG+zwTUOz8Pqz5mEDBRhdaJmKhL
         d4/INWkzzn6knxV1ybvDvVra/41n0rEOBQlpZqJjY18y6QmQEKDPgF2l9Zdy99j5Dj3L
         C0QzFY8wFfg4V/5s4kyYAs9BYwtx7/vwpx2mLK8DnsgpLFYoax1WacZRWtlenYLVGOoq
         X7WDKbyXJwYIpCbuoL9K6HDKqlS+TLS4tTbENfoLxGXURP2lgby3UZp6y/glnF+4lk29
         X2Fpc8S24STbZqY3Drwh42Cu/+JrXbdDkJZeTpXu2AdK8iWNdbgFhWPB+NnWCc9QkIth
         HDHQ==
X-Gm-Message-State: AOJu0YykJbqGBaKZZM2RVIv8QDZEAYZbCoksVh71reg3tEHNZXlWs4XM
	FwXei7H8hNn1e2cCtiakGRThByqW1rMAf7iW8fnzZ4EKupWlE9mhjmCW1wnFOnOXIWw/TE6G11T
	RP1w4gPvXfWQOxdoWP8lieyTXXGoTU+Jt+VtHfg==
X-Google-Smtp-Source: AGHT+IFlm8WVCETInCV0WQFWW3IdELMu8MHEiOh7nG5Ztb2DnWAjc3Yd7l1Ranb8T132KDZcw0dMkU7c1KYdGW5q7jk=
X-Received: by 2002:a05:6870:a102:b0:218:50a9:8df3 with SMTP id
 m2-20020a056870a10200b0021850a98df3mr10820659oae.12.1707777513833; Mon, 12
 Feb 2024 14:38:33 -0800 (PST)
MIME-Version: 1.0
References: <20240212171958.35956-1-f_l_k@t-online.de>
In-Reply-To: <20240212171958.35956-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Feb 2024 14:38:07 -0800
Message-ID: <CAMKF1spjAN=CW1x0WgS5ueUqDaffR6JQ2CKm9n8FJ1kKBGmW5Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] libnfs: update 5.0.2 -> 5.0.3
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 22:38:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108718

This fails with newer gcc-14 and clang-18

https://errors.yoctoproject.org/Errors/Details/752904/

On Mon, Feb 12, 2024 at 9:20=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...s.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch | 12 ++++++------
>  .../libnfs/{libnfs_5.0.2.bb =3D> libnfs_5.0.3.bb}      |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  rename meta-oe/recipes-connectivity/libnfs/{libnfs_5.0.2.bb =3D> libnfs_=
5.0.3.bb} (90%)
>
> diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.t=
xt-respect-CMAKE_INSTALL_LIBDIR-for-mult.patch b/meta-oe/recipes-connectivi=
ty/libnfs/libnfs/0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.=
patch
> index 55595104a..978f38d01 100644
> --- a/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-resp=
ect-CMAKE_INSTALL_LIBDIR-for-mult.patch
> +++ b/meta-oe/recipes-connectivity/libnfs/libnfs/0001-CMakeLists.txt-resp=
ect-CMAKE_INSTALL_LIBDIR-for-mult.patch
> @@ -29,19 +29,19 @@ Upstream-Status: Pending
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
>  diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index 4fb0fe7..8e5a0e4 100644
> +index 5be774d..6b4fd25 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -6,11 +6,11 @@ project(libnfs
> -
> - set(SOVERSION 11.1.0 CACHE STRING "" FORCE)
> +@@ -7,11 +7,11 @@ project(libnfs
> + set(SOVERSION 11.2.0 CACHE STRING "" FORCE)
>
> + set(INSTALL_BIN_DIR "${CMAKE_INSTALL_PREFIX}/bin" CACHE PATH "Installat=
ion directory for binaries")
>  -set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/lib" CACHE PATH "Installat=
ion directory for libraries")
>  +set(INSTALL_LIB_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}" C=
ACHE PATH "Installation directory for libraries")
>   set(INSTALL_INC_DIR "${CMAKE_INSTALL_PREFIX}/include" CACHE PATH "Insta=
llation directory for headers")
>   set(INSTALL_MAN_DIR "${CMAKE_INSTALL_PREFIX}/share/man" CACHE PATH "Ins=
tallation directory for manual pages")
> --set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" CACHE=
 PATH "Installation directory for pkgconfig (.pc) files")
> --set(INSTALL_CMAKE_DIR "${CMAKE_INSTALL_PREFIX}/lib/cmake/libnfs" CACHE =
PATH "Installation directory for cmake (.cmake) files")
> +-set(INSTALL_PKGCONFIG_DIR "${INSTALL_LIB_DIR}/pkgconfig" CACHE PATH "In=
stallation directory for pkgconfig (.pc) files")
> +-set(INSTALL_CMAKE_DIR "${INSTALL_LIB_DIR}/cmake/libnfs" CACHE PATH "Ins=
tallation directory for cmake (.cmake) files")
>  +set(INSTALL_PKGCONFIG_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBD=
IR}/pkgconfig" CACHE PATH "Installation directory for pkgconfig (.pc) files=
")
>  +set(INSTALL_CMAKE_DIR "${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/=
cmake/libnfs" CACHE PATH "Installation directory for cmake (.cmake) files")
>
> diff --git a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb b/meta-o=
e/recipes-connectivity/libnfs/libnfs_5.0.3.bb
> similarity index 90%
> rename from meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
> rename to meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
> index afec2753c..068c827f7 100644
> --- a/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.2.bb
> +++ b/meta-oe/recipes-connectivity/libnfs/libnfs_5.0.3.bb
> @@ -7,7 +7,7 @@ SRC_URI =3D " \
>         git://github.com/sahlberg/libnfs.git;protocol=3Dhttps;branch=3Dma=
ster \
>         file://0001-CMakeLists.txt-respect-CMAKE_INSTALL_LIBDIR-for-mult.=
patch \
>  "
> -SRCREV =3D "40348f45d6beb8a8f50b6b63414a98fc1a061b7d"
> +SRCREV =3D "4379837536d9eac537810dc7b13071136049b22a"
>  S =3D "${WORKDIR}/git"
>
>  inherit cmake
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108715): https://lists.openembedded.org/g/openembedde=
d-devel/message/108715
> Mute This Topic: https://lists.openembedded.org/mt/104315753/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

