Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B140C4332F
	for <webhook@archiver.kernel.org>; Fri, 23 Dec 2022 18:12:20 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.78871.1671819137257504763
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Dec 2022 10:12:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A5BYjxKv;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id u204so4706562oib.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 10:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8krVMGSO57i8keD3t2xv+oMwXBLDiHgrgoUFk9u3NdI=;
        b=A5BYjxKvMQGbaz6hszHq5O8wievMal/4/6vlNoRwCoEVOicNXE/qosJdx2LYFowwrm
         l/MEdELJG0mqTNnbbN2TOtl62qPgud7AoY5ZIJBrD/BN5BbJFxZ2eoFTljL/huWA/l0t
         hgEQYsAKFmNBteBPjCYFsT+rMR+n9Z6MnQqtVSqdQCn5KHg3OZmi2ftfkdGv8P3fA3+Y
         +17z5vduARXCsBOrG3Ql++sfAt/168EMDLBC+mgG53Aig4QLj1rkXI3yeKPaHMn0pKo3
         tY0+X+4jrtwVBMASLDf7izebt8ofInZelfRlElcBx2lZ8/xVu6T9fy+avTVdg8htA7eb
         h/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8krVMGSO57i8keD3t2xv+oMwXBLDiHgrgoUFk9u3NdI=;
        b=NRpAt9x5LpT7QESzdvJ71vZ7qzVOjTdftzz4EeaPybKKBRGzLm9cGv2XO/VN61k/AV
         PgZm0be02rPdX+GocEEwyRDkSbFb4Llo/EF7E5mDD+Aagv6v/WrWUBRWw8fkMsYQlBhk
         Ea4qwvnv9ZcLPq3VZDzAzACOvf0O7c1S8YAcJboS7KDBvF1Mje+bPeDPOJnOQJBfVDso
         hxl534mjCOXP2rYlpz+dqMO3E0M1Ejqs0doVqQt/hFqx60K/L1s8gYpJswXyAiWgFFVx
         P2yZezI4G2pS94KeIzLQ6Kxsos/k5mO2g104ODHrO/Eq9kLOQ8BwSdG7bHSjQSj7e2Xy
         TCxw==
X-Gm-Message-State: AFqh2kpHbFVB+MDLHGivFFu3gz8irxhXhIXh7Et2GREN7ZLaESD0b06+
	Q4ydUeOFduVpW9zrwPSuon50k1n+plSxa+vsbBk=
X-Google-Smtp-Source: AMrXdXvWtzbO2WHguAhOUooecv++HsITzKQsybMGMzuOrjqJkYNNjouCdcVHrA4GZd16cuSgXKZuL5RsRxjPRIWWzns=
X-Received: by 2002:aca:3855:0:b0:35c:53a9:5513 with SMTP id
 f82-20020aca3855000000b0035c53a95513mr433321oia.262.1671819136249; Fri, 23
 Dec 2022 10:12:16 -0800 (PST)
MIME-Version: 1.0
References: <20221223031104.13517-1-f_l_k@t-online.de> <20221223031104.13517-2-f_l_k@t-online.de>
In-Reply-To: <20221223031104.13517-2-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Dec 2022 10:11:50 -0800
Message-ID: <CAMKF1spuGssCTbYU9wcUKH_iNTvLoWUip+s0F4ava5sO1tgo8g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCHv2 2/3] appstream: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Dec 2022 18:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100201

appstream  fails to configure here qemux86-64/glibc

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2265/steps/14/logs/stdio


On Thu, Dec 22, 2022 at 7:11 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../appstream/0001-fix-crosscompile.patch     | 43 +++++++++++++++++++
>  .../appstream/appstream_0.15.5.bb             | 33 ++++++++++++++
>  2 files changed, 76 insertions(+)
>  create mode 100644 meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
>  create mode 100644 meta-oe/recipes-support/appstream/appstream_0.15.5.bb
>
> diff --git a/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
> new file mode 100644
> index 000000000..3cf039259
> --- /dev/null
> +++ b/meta-oe/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
> @@ -0,0 +1,43 @@
> +From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 12 Dec 2022 15:42:42 +0100
> +Subject: [PATCH] fix crosscompile
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + data/meson.build  | 2 +-
> + meson.build       | 2 +-
> + tools/meson.build | 9 +++++++++
> + 3 files changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/data/meson.build b/data/meson.build
> +index aea0cb25..1a085fc9 100644
> +--- a/data/meson.build
> ++++ b/data/meson.build
> +@@ -14,7 +14,7 @@ install_data('its/metainfo.loc',
> + metainfo_with_relinfo = custom_target('gen-output',
> +     input : ['../NEWS', 'org.freedesktop.appstream.cli.metainfo.xml'],
> +     output : ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainfo.xml'],
> +-    command : [ascli_exe, 'news-to-metainfo', '--limit=6', '@INPUT0@', '@INPUT1@', '@OUTPUT@']
> ++    command : ['/usr/bin/appstreamcli', 'news-to-metainfo', '--limit=6', '@INPUT0@', '@INPUT1@', '@OUTPUT@']
> + )
> +
> + metainfo_i18n = i18n.itstool_join(
> +diff --git a/meson.build b/meson.build
> +index fd0e3373..2f273ada 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -124,7 +124,7 @@ if get_option ('gir')
> +     dependency('gobject-introspection-1.0', version: '>=1.56')
> + endif
> +
> +-stemmer_inc_dirs = include_directories(['/usr/include'])
> ++stemmer_inc_dirs = include_directories([''])
> + if get_option('stemming')
> +     stemmer_lib = cc.find_library('stemmer', required: true)
> +     if not cc.has_header('libstemmer.h')
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/appstream/appstream_0.15.5.bb b/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
> new file mode 100644
> index 000000000..f9f04526f
> --- /dev/null
> +++ b/meta-oe/recipes-support/appstream/appstream_0.15.5.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "AppStream is a collaborative effort for making machine-readable software metadata easily available."
> +HOMEPAGE = "https://github.com/ximion/appstream"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
> +
> +DEPENDS = " \
> +    curl-native \
> +    curl \
> +    docbook-xml-dtd4-native \
> +    gperf-native \
> +    glib-2.0 \
> +    libyaml \
> +    libstemmer \
> +    libxml2 \
> +    libxmlb \
> +    libxslt-native \
> +    itstool-native \
> +    docbook-xsl-stylesheets-native \
> +    python3-pygments-native \
> +"
> +
> +inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
> +
> +GIR_MESON_OPTION = ""
> +SRC_URI = " \
> +    https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
> +    file://0001-fix-crosscompile.patch \
> +"
> +
> +SRC_URI[sha256sum] = "cb15ed62cc2729683879a2dbf98c0a3267ea2b4d57bba6bc55e70a25500e04c2"
> +S = "${WORKDIR}/AppStream-${PV}"
> +
> +FILES:${PN} += "${datadir}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100194): https://lists.openembedded.org/g/openembedded-devel/message/100194
> Mute This Topic: https://lists.openembedded.org/mt/95838953/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

