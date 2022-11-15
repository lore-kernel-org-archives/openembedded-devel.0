Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 316D3C433FE
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 21:03:37 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web08.6681.1668546207319859045
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Nov 2022 13:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gAVCVenD;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id b124so16233307oia.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Nov 2022 13:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1nsiG6pxXwFtreopQqLq8tG6WCUsbbVwWX+KdtUsP0=;
        b=gAVCVenDH5GDwgK9Nnx5VxuH5vn2VIZT01h58UDPdpSj7nIYsVuKgY4RVzyr+Fk//O
         KfNsKkdRdWcSiraDg+rctS9OD3mhqOuN6I539rjv7xXGv1xsSZC7kD8TEN0GuQQKc0Qz
         l9jKtrf1k8dRmUNbIKLIuAEWRH89Rlj2Kbe73hhxdODAJsv2+TEmYpeFtoQfudlCKRUM
         1idz3vjw8Lx38tbgYT8g3I8KDJ2gXNe3WP0qrQSXhRkCJqqgz8KxPsGOjk3LF8uadsUz
         8seaYjTZAtwrpnIIrrfc2UDcuMj5/rY4BYRAK+MpmhLgONv3V/R9NO0WwEnYS0iHpMNe
         iE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1nsiG6pxXwFtreopQqLq8tG6WCUsbbVwWX+KdtUsP0=;
        b=Bjd/ZZ25MNTF58tg1jk7teDkVZ3Qa7QKXhRrXWZr2MAmIqgBPFBjtxqF9CMjqvOSND
         ZtxUiQ18qxuULBREG4G44DQqgFoVR85zGddelVVX/wcJuipRpS23pc9karfoib+i7t+u
         A/ccLbb9txZoODRpsJ2puNtFl0FHoFg4GIkrmQkJt0FzmicsItYdLqF5j0yVgj20TA0x
         LG1tw9y+Duv+OsFCMGAOEO7td71bZdCsoioP9KGOJzTZ6Aeum7+VJVaxdD8oL2/d7yFR
         97GBEsXIUR60Anwa0H6j0sMh5tsLA9z3gVJffmdTBnq3ER8ccK9po3H4+czlV9zYu8Up
         296g==
X-Gm-Message-State: ANoB5pmOtpv97MExMso1LU1pouxI+BjyqToj5kW6m2MrcG6GEQ5o4FEl
	xx0awIpXxgDhsZpytC3ZKUV27laMCcLuF0Oro3U=
X-Google-Smtp-Source: AA0mqf5h8gUTAoSJJcbrLEZABoMyWfUUfJ6XTga9p/0p9Fk8ocjACQU+MFIIOSA9E47JbO7jhY9KcvPpEwUbGgjuOOA=
X-Received: by 2002:a54:4491:0:b0:359:d852:616d with SMTP id
 v17-20020a544491000000b00359d852616dmr116762oiv.55.1668546206452; Tue, 15 Nov
 2022 13:03:26 -0800 (PST)
MIME-Version: 1.0
References: <20221115094410.22736-1-peron.clem@gmail.com>
In-Reply-To: <20221115094410.22736-1-peron.clem@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Nov 2022 13:03:00 -0800
Message-ID: <CAMKF1spy2D7ceKAPOSODVck=6Ph-92N-dtzRVF_6xL-D1LKtaA@mail.gmail.com>
Subject: Re: [PATCH] navigation: bump proj to 9.1.0 library
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Nov 2022 21:03:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99592

seeing build failures
https://errors.yoctoproject.org/Errors/Details/677151/
https://errors.yoctoproject.org/Errors/Details/677156/

i think the cmake downloading under the nose in do_configure needs to
be addressed.

On Tue, Nov 15, 2022 at 1:44 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> Proj has moved to CMake build system.
>
> Update the recipe and make more PACKAGECONFIG available following
> the ./contrib/oe-stylize.py output.
>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> ---
>  .../proj/{proj_8.2.1.bb =3D> proj_9.1.0.bb}      | 18 ++++++++----------
>  1 file changed, 8 insertions(+), 10 deletions(-)
>  rename meta-oe/recipes-navigation/proj/{proj_8.2.1.bb =3D> proj_9.1.0.bb=
} (50%)
>
> diff --git a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb b/meta-oe/reci=
pes-navigation/proj/proj_9.1.0.bb
> similarity index 50%
> rename from meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> rename to meta-oe/recipes-navigation/proj/proj_9.1.0.bb
> index 0c1104926..bc3523ec8 100644
> --- a/meta-oe/recipes-navigation/proj/proj_8.2.1.bb
> +++ b/meta-oe/recipes-navigation/proj/proj_9.1.0.bb
> @@ -1,22 +1,20 @@
>  SUMMARY =3D "PROJ.4 - Cartographic Projections library"
>  HOMEPAGE =3D "http://trac.osgeo.org/proj/"
>  SECTION =3D "libs"
> -
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df27445198ba1500f508fce2b183ce=
0ff"
> +DEPENDS =3D "sqlite3 sqlite3-native"
>
>  SRC_URI =3D "http://download.osgeo.org/${BPN}/${BP}.tar.gz"
> +SRC_URI[sha256sum] =3D "81b2239b94cad0886222cde4f53cb49d34905aad2a131724=
4a0c30a553db2315"
>
> -SRC_URI[sha256sum] =3D "76ed3d0c3a348a6693dfae535e5658bbfd47f71cb7ff7eb9=
6d9f12f7e068b1cf"
> -
> -DEPENDS =3D "sqlite3 sqlite3-native tiff"
> -
> -inherit autotools pkgconfig lib_package
> -
> -PACKAGECONFIG ?=3D "curl"
> -
> -PACKAGECONFIG[curl] =3D ",--without-curl,curl"
> +inherit cmake lib_package
>
>  FILES:${PN} +=3D "${datadir}/proj"
>
>  BBCLASSEXTEND =3D "native"
> +
> +PACKAGECONFIG ?=3D "curl"
> +PACKAGECONFIG[apps] =3D "-DBUILD_APPS=3DON, -DBUILD_APPS=3DOFF"
> +PACKAGECONFIG[curl] =3D "-DENABLE_CURL=3DON,-DENABLE_CURL=3DOFF,curl"
> +PACKAGECONFIG[tiff] =3D "-DENABLE_TIFF=3DON,-DENABLE_TIFF=3DOFF,tiff"
> --
> 2.34.1
>

