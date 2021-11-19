Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E5BC433EF
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 21:09:19 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.100.1637356158766511317
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:09:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dsYPRmsb;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id m25so10683236qtq.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Nov 2021 13:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qhHZUejvGwQB7zptaDQ4yv8YxQhCPQ6Rmj3nbShVhuU=;
        b=dsYPRmsbtssk3ivSKYJ5LqI39KxGNByNKgGl6nwk2wXcvpjVdnmIgjc7KwZHMGZjNB
         n5hISpD/8Zw/0CIu2WDTHHZOnw/1eIwVp8yVr+zzRe+oXqa/ClgPlt9s0kHVQc9vfFyU
         +kyFJyxBQ1S/Vv/x1X2RCNElUxNUUafPzJceTxACSj0LGb69vEH2wLIvpjr7xhONwsOM
         ZiETbvqYNime8DdENcPaFgSb2sW+usCNTnq8M8woWfJssQKZy42Ikb27K1A3F6i82tvv
         +UyiE/vSDJHlSnc9U8aFWvcofyvwU+YbwrMvfcJkdWyK931vGix8WmTBdO3r6vOgAQF0
         fNTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qhHZUejvGwQB7zptaDQ4yv8YxQhCPQ6Rmj3nbShVhuU=;
        b=kR/2vdbUoS8HU/XBJAtO5MPUbbmN6zvD0zavKD+R+wHrfYKcn0kXfYYyJS93ZRwH4S
         MB4Pb4Nr0ciWu78y0kTes5YQX2SDoVjrWvs3r4z6jbRv2vhmAi5XGeXsq7VK/l1vb2AE
         a1ZrQjb+J2ZOKQDNd/mzr6eXzdIIa/7ObaZM8O6tzu2beyBuNmSg9RBMcXvwE2bdLFi1
         oIYl92m/WPpQBQWEzRm/mfKjoBEFVAOg78IOi10laRhgoGkZeddxHFv6fvCpA/TlszVW
         qFx12UVGe+KSM79icP+lfTh7amvBwKYzOeFMf5A3yXhOyWumHI80t0/+OUTzAHXMARlL
         Au0g==
X-Gm-Message-State: AOAM532xHO/mE/4i+Z5+48+VtjkqC4razfR+AoJe9VcCLgqX8LegMKEr
	dPvp8y+uIyPypVQdDFWRS88en0cUXZQ06o4/3Oo=
X-Google-Smtp-Source: 
 ABdhPJyY1F8codMDpWJFgpEiNiMcLhtuYY91/28P7RQtETldb+hDbCSeN7RBt1i8D3f4zO6X54dXyKL2d0MR9zKQXNk=
X-Received: by 2002:ac8:4e41:: with SMTP id e1mr9519094qtw.116.1637356157791;
 Fri, 19 Nov 2021 13:09:17 -0800 (PST)
MIME-Version: 1.0
References: <20211119210515.131769-1-marex@denx.de>
In-Reply-To: <20211119210515.131769-1-marex@denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Nov 2021 13:08:51 -0800
Message-ID: 
 <CAMKF1squfEBbt6G-UzaW-k2dUDMiUJ-U0d1E+ZdtTMPV=3waeQ@mail.gmail.com>
Subject: Re: [oe] [meta-games][PATCH] neverball: Add neverball
To: Marek Vasut <marex@denx.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Marko Lindqvist <cazfi74@gmail.com>, Heiko Schocher <hs@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Nov 2021 21:09:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94068

On Fri, Nov 19, 2021 at 1:05 PM Marek Vasut <marex@denx.de> wrote:
>
> This is an interactive game with a rolling ball, useful for
> testing whether point sprites work correctly in GPU drivers.
>
> The user should install both neverball neverball-data packages.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
>  recipes-games/neverball/neverball-data_git.bb | 16 ++++++++++++
>  recipes-games/neverball/neverball.inc         | 26 +++++++++++++++++++
>  recipes-games/neverball/neverball_git.bb      | 16 ++++++++++++
>  3 files changed, 58 insertions(+)
>  create mode 100644 recipes-games/neverball/neverball-data_git.bb
>  create mode 100644 recipes-games/neverball/neverball.inc
>  create mode 100644 recipes-games/neverball/neverball_git.bb
>
> diff --git a/recipes-games/neverball/neverball-data_git.bb b/recipes-games/neverball/neverball-data_git.bb
> new file mode 100644
> index 0000000..c09a5ee
> --- /dev/null
> +++ b/recipes-games/neverball/neverball-data_git.bb
> @@ -0,0 +1,16 @@
> +require neverball.inc
> +
> +inherit allarch
> +
> +DEPENDS:append = " jpeg-native libpng-native libsdl2-native"
> +
> +do_compile() {
> +       oe_runmake CC="${BUILD_CC}" CFLAGS="${BUILD_CFLAGS} -I${STAGING_INCDIR_NATIVE}/SDL2/" LDFLAGS="${BUILD_LDFLAGS} -lpng" mapc sols
> +}
> +
> +do_install() {
> +       install -d -m 755 ${D}${datadir}/neverball
> +       cp -r ${B}/data ${D}${datadir}/neverball/
> +}
> +
> +FILES:${PN}:append = " ${datadir}/neverball"
> diff --git a/recipes-games/neverball/neverball.inc b/recipes-games/neverball/neverball.inc
> new file mode 100644
> index 0000000..1ef2ec4
> --- /dev/null
> +++ b/recipes-games/neverball/neverball.inc
> @@ -0,0 +1,26 @@
> +SUMMARY = "Tilt the floor to roll a ball through an obstacle course before time runs out. Neverball is part puzzle game, part action game, and entirely a test of skill."
> +SECTION = "graphics"
> +HOMEPAGE = "https://neverball.org/"
> +
> +LICENSE = "GPLv2+"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=200ddba3b50e856bfb681a2b13dfb523"
> +
> +SRC_URI = "git://github.com/Neverball/neverball.git;protocol=https"
> +SRCREV = "bb6a99b14b1f81d071efd54cc0effdc517704b95"
> +PV = "1.6.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig
> +
> +EXTRA_OEMAKE:append = " \
> +       ENABLE_FETCH=0 \
> +       ENABLE_OPENGLES=1 \
> +       DATADIR=/usr/share/neverball/data \
> +       LOCALEDIR=/usr/share/neverball/locale \
> +       "
> +
> +do_configure:append() {
> +       sed -i "s@sdl2-config@pkg-config sdl2@" ${S}/Makefile
> +       sed -i "s@libpng-config@pkg-config libpng@" ${S}/Makefile
> +}
> diff --git a/recipes-games/neverball/neverball_git.bb b/recipes-games/neverball/neverball_git.bb
> new file mode 100644
> index 0000000..18e02bd
> --- /dev/null
> +++ b/recipes-games/neverball/neverball_git.bb
> @@ -0,0 +1,16 @@
> +require neverball.inc
> +
> +DEPENDS:append = " gettext-native virtual/libgles1 virtual/libintl libvorbis jpeg libpng libsdl2 libsdl2-ttf"
> +
> +do_compile() {
> +       oe_runmake neverball neverputt locales desktops
> +}
> +
> +do_install() {
> +       install -d -m 755 ${D}${bindir}
> +       install -m 755 ${B}/neverball ${D}/${bindir}/
> +       install -m 755 ${B}/neverputt ${D}/${bindir}/
> +
> +       install -d -m 755 ${D}${datadir}/neverball
> +       cp -r ${B}/locale ${D}${datadir}/neverball/

perhap use

cp -R --no-dereference --preserve=mode,links

here

> +}
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94067): https://lists.openembedded.org/g/openembedded-devel/message/94067
> Mute This Topic: https://lists.openembedded.org/mt/87178399/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

