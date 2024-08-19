Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F97C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 17:52:49 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.216810.1724089965126826684
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 10:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=COLMyzvm;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-27032e6dbf2so1327843fac.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 10:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724089964; x=1724694764; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97K1PoLMJl/PCLiUt076SsD6ihkvbWFQRKGUnuRvp4I=;
        b=COLMyzvmE6NFRJojHDh7fM/mUVX00M7g2sZFydPGdVfAybrGaHFYsboYDWIvZ4amcn
         5ysy+nVygwUwqDM+onAaBzlM3+sTyE8Dm4lCKk157rimKwYeAeOlkF0xUI974wL93GU4
         6+WrmHjirpmsbe+0TshijAW+uFGnM/Fzbfd6Ebfi6WWzvTNgaW73JFM54ryXub6ILn4g
         QFMt0K4E/rk3V6Pm3FVyliozZgifRTP9Me6iFwEZthKUYm06BKX2T24cJZ3UaB8ZM8D9
         n/+YI91Enj0UgXodus/hnZjeJ2WciBpvqsZkroU8gObyQrqhU2XpWPpAz/9AtdLrQ5zn
         9ZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724089964; x=1724694764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97K1PoLMJl/PCLiUt076SsD6ihkvbWFQRKGUnuRvp4I=;
        b=FlddHAMcDebJ62CXpkvgu8RKodlbP7jXwVWhstcjlQkwSKceMnpUJy/il16pacF3//
         3iaKbuCRpBtGIUxvqPnOcAOQpKHqiyOiFy1jYqLCBQ+Q57JJrVDOD42S991TtLy4QgTe
         FCIvNEi13ZkCGbuRBR5+XQ7PuK8ohOaWzN3QNEPoJjf0LEbOjbOg5WTFPl80eab14j5L
         xBn0TwloqfTELH9b86XPiacI/cUPlZq9L5x4AAtF8/YjjevGbAwbLq7kflnWAc/ODqAH
         jgauo2TYxIPBg3vZ5gdID3S40ODqWwTD5gIc73sVxFMv0BRN6pStPsVyTfYQyH8fqQ8Z
         WBMA==
X-Gm-Message-State: AOJu0YxPmU0/sPcByWdnqQa+eJXPNrtfWs/uCg+zUW9At/x5sG1g+dRO
	He84RAuNVFsVr3HDScK+j9AECufY5H8o4uv47Ks2S2JmONcCHKvTWZWEgGWtMl6NOlT4MYz85If
	sa/jCvpIgY3TGvlcea0n6eo8Ilsmw8A==
X-Google-Smtp-Source: AGHT+IFA1pKYg525H1743hz1ouc57En9c6EGDPWjdGgdDbdwDu82Urzi+x+UILtVf8nXmbuv2eBU94xu49C+niJtbhw=
X-Received: by 2002:a05:6870:f14f:b0:270:49f8:b01 with SMTP id
 586e51a60fabf-27049f83b36mr6197466fac.25.1724089964216; Mon, 19 Aug 2024
 10:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240819115442.3212142-1-martin.jansa@gmail.com>
In-Reply-To: <20240819115442.3212142-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Aug 2024 10:52:17 -0700
Message-ID: <CAMKF1sr5ihLNqDyC0xxf=10yrPDVzahGzrT7bkYk2Ce62v5+wQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] blueman: fix installation paths
To: martin.jansa@gmail.com
Cc: openembedded-devel@lists.openembedded.org, alperyasinak1@gmail.com, 
	f_l_k@t-online.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 17:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111856

On Mon, Aug 19, 2024 at 4:54=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> * pass systemdsystemunitdir and systemduserunitdir to set correct directo=
ries
>   instead of using libdir from:
>   meson.build:systemd_base_path =3D join_paths(libdir, 'systemd')
>   which is wrong e.g. with multilib where libdir might be /usr/lib64 inst=
ead of
>   usr/lib used in ${nonarch_base_libdir} which is used by systemd_* varia=
bles:
>
>   export systemd_system_unitdir=3D"/usr/lib/systemd/system"
>   export systemd_user_unitdir=3D"/usr/lib/systemd/user"
>
>   fixes:
>   ERROR: Didn't find service unit 'blueman-mechanism.service', specified =
in SYSTEMD_SERVICE:blueman.
>
> * inherit python3targetconfig to install into right python site-packages
>   without this it installs into
>   /usr/lib/python3.12/site-packages/
>   instead of /usr/lib64/python3.12/site-packages set in PYTHON_SITEPACKAG=
ES_DIR
>   variable used in FILES, causing
>   blueman: 295 installed and not shipped files. [installed-vs-shipped]
>
>   # $PYTHON_SITEPACKAGES_DIR
>   #   set oe-core/meta/classes-recipe/python3-dir.bbclass:11
>   #     "${libdir}/${PYTHON_DIR}/site-packages"
>   PYTHON_SITEPACKAGES_DIR=3D"/usr/lib64/python3.12/site-packages"
>

This is a more comprehensive fix thanks for doing it.

> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  .../recipes-connectivity/blueman/blueman_2.4.3.bb        | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> index c2bb4d24c6..42e20cc9ed 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
>
>  DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-nati=
ve"
>
> -inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache useradd features_check
> +inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache useradd features_check python3targetconfig
>
>  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>
> @@ -13,7 +13,10 @@ SRC_URI =3D "git://github.com/blueman-project/blueman.=
git;protocol=3Dhttps;branch=3D2-
>  S =3D "${WORKDIR}/git"
>  SRCREV =3D "7bcf919ad6ac0ee9a8c66b18b0ca98af877d4c8f"
>
> -EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse"
> +EXTRA_OEMESON =3D "-Druntime_deps_check=3Dfalse \
> +    -Dsystemdsystemunitdir=3D${systemd_system_unitdir} \
> +    -Dsystemduserunitdir=3D${systemd_user_unitdir} \
> +"
>
>  SYSTEMD_SERVICE:${PN} =3D "${BPN}-mechanism.service"
>  SYSTEMD_AUTO_ENABLE:${PN} =3D "disable"
> @@ -40,8 +43,8 @@ PACKAGECONFIG[polkit] =3D "-Dpolicykit=3Dtrue,-Dpolicyk=
it=3Dfalse"
>  FILES:${PN} +=3D " \
>      ${datadir} \
>      ${systemd_user_unitdir} \
> +    ${systemd_system_unitdir} \
>      ${PYTHON_SITEPACKAGES_DIR} \
> -    ${prefix}${systemd_system_unitdir} \
>  "
>
>  # In code, path to python is a variable that is replaced with path to na=
tive version of it
> --
> 2.46.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111849): https://lists.openembedded.org/g/openembedde=
d-devel/message/111849
> Mute This Topic: https://lists.openembedded.org/mt/107978850/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

