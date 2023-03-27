Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F5C4C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 04:59:37 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.27952.1679893170052843368
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 21:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EclAKC5O;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id bm2so5425528oib.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Mar 2023 21:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679893169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6on9XcS17pJvjTeQZ2HqPKBMm1yRa5NdGHDL+JThSz4=;
        b=EclAKC5OYvcjfynOzm5yd41u9PHoencr/1RJtbZAYJy3m64diwwoSb2hf9jKFlP/1r
         9w2etvZbSsees9ES7MZiZQu1y+vVrd/t/ELX5prkLFb97jSKIE7zBJ8uyxaalOnGh432
         RS2NoKmv3WDRJTB0fCIajZ1Fu7ofmvHowMUh1Whmw+i/pc8/5bMXBhZAhfABI93m+FEV
         p7XZcTsNkO4PIuQoYKvnPKnoKNr9zTBzoRhhakj8XYbdpIs/b0kFe+nwyxmFbD8juWQG
         WqXIU/1zq3nEvCSqrqQktxe33OyA/FxYfLNjgmBQjn4WBBN1jroGzE6Yr3IoluHgNHEx
         kL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679893169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6on9XcS17pJvjTeQZ2HqPKBMm1yRa5NdGHDL+JThSz4=;
        b=1iWYSjNr8LBDfnxNhRsZOqx0WqzAeGBaiOfyab1rN722rUUbnJfi1G+7ru7M2FoJh1
         F7pN5rAawsWVZrkp72A3R21TLCHGHbNaqdsy/glMx5gQCiutBLsMh2l5uT+QUDm2Hqqi
         f5q2tsYeOuyekgAIB83hFssMUIxETxWXEoXhSKg555gNbDEhQGWsehnpUyWL49yQlz3L
         ZppHISjk79F6oXgleN2xkY0cQTWebpvPIu+JcPjs6HGu1HaiUQXUjs8uBtTT9xKFaWd+
         jpedDy2XiGm5qQVkxXFoicPfUYboTxvklYBBWvRvlhY/fKHNBNLg34RkRkDISbERRCRN
         4n8A==
X-Gm-Message-State: AO0yUKXNpXY71rsjKbrP8MlbREH9JEucB7qJ2M485Ug0iFkd4eqSEodp
	WqldYZ0+5qbbpuD4VOiqqgdgcy8FAcBn6LA1ZBw=
X-Google-Smtp-Source: AK7set+QgSZl0ainLQU1JVcWAtgZuXxyS8w6sgq8xZ5JIcyjbvXonH/3vU+Jjx7D6v1etFkn8Y7rBbheXbjQKuAIPvs=
X-Received: by 2002:a54:4685:0:b0:386:cb70:3828 with SMTP id
 k5-20020a544685000000b00386cb703828mr2790030oic.4.1679893169215; Sun, 26 Mar
 2023 21:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230325080256.923752-1-f_l_k@t-online.de> <20230325080256.923752-4-f_l_k@t-online.de>
In-Reply-To: <20230325080256.923752-4-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 26 Mar 2023 21:59:03 -0700
Message-ID: <CAMKF1sq-Htok=oYiDU6xJjoXze5yY9akJVXzMaGOwFi_dpGd=g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 04/32] evolution-data-server: update
 3.46.3 -> 3.48.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 04:59:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101771

It fails to build

| -- Checking for module 'webkit2gtk-4.1>=3D2.34.0'
| --   No package 'webkit2gtk-4.1' found
| CMake Error at cmake/modules/PkgConfigEx.cmake:32 (message):
|   Necessary libraries not found or not enough version.  If you want to
|   disable WebKitGTK gtk3 for built-in OAuth2 authentications, please use
|   -DENABLE_OAUTH2_WEBKITGTK=3DOFF argument to cmake command.
| Call Stack (most recent call first):
|   CMakeLists.txt:418 (pkg_check_modules_for_option)
|

On Sat, Mar 25, 2023 at 1:03=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../evolution-data-server/evolution-data-server.bb            | 3 +--
>  .../evolution-data-server/evolution-data-server.inc           | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data=
-server.bb
> index a27115267..d6f6d7c23 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
> @@ -37,8 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=
=3D${STAGING_BINDIR}/g-ir-scan
>  PACKAGECONFIG ?=3D "oauth"
>
>  PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
> -# ENABLE_OAUTH2_WEBKITGTK4 would require webkit to be built with gtk4
> -PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_OAU=
TH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk json-glib"
> +PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON,-DENABLE_OA=
UTH2_WEBKITGTK4=3DOFF,webkitgtk json-glib"
>  PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
>  PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
>  # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
> diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc
> index 2b74b2e60..9db5e9011 100644
> --- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
> +++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
> @@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
>
>  inherit gnomebase upstream-version-is-even
>
> -SRC_URI[archive.sha256sum] =3D "0938e2279e5cfbc2204766ca9d3fea570911699b=
07c10cbe01aca62a7e8b2bee"
> -PV =3D "3.46.3"
> +SRC_URI[archive.sha256sum] =3D "0f25f73331edf53909be40f412b2a86939270327=
517616303f322de157083c35"
> +PV =3D "3.48.0"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101717): https://lists.openembedded.org/g/openembedde=
d-devel/message/101717
> Mute This Topic: https://lists.openembedded.org/mt/97840027/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

