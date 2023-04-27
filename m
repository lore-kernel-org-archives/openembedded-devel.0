Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0CBC77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 08:22:51 +0000 (UTC)
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
 by mx.groups.io with SMTP id smtpd.web10.15383.1682583762966955172
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 01:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=rLWiUi1t;
 spf=pass (domain: gmail.com, ip: 209.85.161.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-541fb831026so2782000eaf.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682583762; x=1685175762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuCP5wXNmAg5CUpgrHLjUpXFLQ9BVQ3XBlo6uXlhccM=;
        b=rLWiUi1tiFNrrl92LXlCl7cYx6nSr1GnFozmCkT7nEP62BD1WCoQV3zVH6Ccy6GvY2
         +fwwGAxK9FS/oyZQYRcFskEpYxsaJixc/d6hjag7OoAQpErlehDCOcacDmX8tqt6LpTF
         Uh7arU9MeIZyXAiB11u9yC6NM4o81OPhBP1QkYcc8OOgpYshRwMHtuiwVJPQ/SlGfEoI
         9MuzjyHQZiaiwcenlYLPXuuzzKjxfVBFLHzCOYbWp3HpN1oFKdyrJ1ifikUV+DKj3ens
         khvhMPDX7Sz3zR2iU85d1ETwW4jhf9jPi1c+xKt8PwEV3fl5WUwWRBHOFyM6azct79Hg
         HgLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682583762; x=1685175762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tuCP5wXNmAg5CUpgrHLjUpXFLQ9BVQ3XBlo6uXlhccM=;
        b=Ml0TZKuNRGSi/OVAdfFODLftZR75DriONliBNj9zBgmjwChzOSuflIrOqClMgUW8oL
         UTayAfopB77g1+ZF2PmAo/mNQMTOLUyKcKenend/VZLcp0J7ay5m/1HAYwZL4Ji98MVt
         H7UrYlu65bZuyp8eQoPHIsfoKSslauQg08rCPyPmPRiPLoDrQHLYr0W+jXbtct1BLnvG
         zaXl1lJQXwNEZqKHE2LJyHFAPRykp5iGZ2FWJEsCPd04BDdWgsH7NP7viRB1yRDH6D1n
         mFmYp+3vfNSjW4bfbgcgHqb1i6+DbWGbh1yJlGv1HDejsZLh6GjPUisb8JmEbsinJtRZ
         rwQQ==
X-Gm-Message-State: AC+VfDxbjgnQ8fyHyu3XeuKF4MtuK34gfOHum6ii7Oi6/DldyPapXgpk
	Qkq0wCCZkDwYpUaxpiF1CjWFjRx9BCAcquIKfYI=
X-Google-Smtp-Source: ACHHUZ4+GcKcYpxc28JR3yIWz6+IlhO7fg7pxMjXN6bxOt9inHwPMDtT5lq5IwDU51/erawmCn3Nteouxrpx+VWojRE=
X-Received: by 2002:a4a:a3cb:0:b0:546:d032:a267 with SMTP id
 t11-20020a4aa3cb000000b00546d032a267mr583630ool.2.1682583761930; Thu, 27 Apr
 2023 01:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230426203453.3497409-1-rs@ti.com> <20230426203453.3497409-2-rs@ti.com>
In-Reply-To: <20230426203453.3497409-2-rs@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 01:22:16 -0700
Message-ID: <CAMKF1soDfEAhBYq91JVt9xhvQFr6yV2gsiOAcebCvX5wNio8iw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] glfw: add packageconfig and
 wayland dependencies
To: rs@ti.com
Cc: openembedded-devel@lists.openembedded.org, afd@ti.com, reatmon@ti.com, 
	denis@denix.org, akuster808@gmail.com, detheridge@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 08:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102206

fails layer check perhaps it has some cross layer deps

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2693

On Wed, Apr 26, 2023 at 1:35=E2=80=AFPM Randolph Sapp via
lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
>
> From: Randolph Sapp <rs@ti.com>
>
> GLFW has the ability to use a wayland backend. This patch adds a config
> for it and attempts to automatically resolve the most common collision
> since the wayland and x11 backends are mutually exclusive.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>  meta-oe/recipes-core/glfw/glfw_3.3.bb | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-core=
/glfw/glfw_3.3.bb
> index b31bba6b6b..29d7b5de42 100644
> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> @@ -20,7 +20,18 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLFW_BU=
ILD_DOCS=3DOFF"
>
>  CFLAGS +=3D "-fPIC"
>
> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcursor"
> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> +DEPENDS =3D "libpng libglu zlib"
> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> +
> +# upstream considers x11 and wayland backends mutually exclusive and wil=
l
> +# prioritize wayland if it is enabled
> +
> +PACKAGECONFIG ??=3D " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'x11',=
 d)} \
> +"
> +
> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland wayland-nat=
ive wayland-protocols extra-cmake-modules libxkbcommon"
> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
>
>  COMPATIBLE_HOST:libc-musl =3D "null"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#102202): https://lists.openembedded.org/g/openembedde=
d-devel/message/102202
> Mute This Topic: https://lists.openembedded.org/mt/98523628/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

