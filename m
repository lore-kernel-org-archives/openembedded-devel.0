Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F707C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 21:05:48 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
 by mx.groups.io with SMTP id smtpd.web10.34202.1671483939580806170
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 13:05:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EU9oOsBC;
 spf=pass (domain: gmail.com, ip: 209.85.160.45, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-12c8312131fso13138023fac.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cem6oTlFpclu5kQGJderqya5NmX71B10BNWkOSjdoCU=;
        b=EU9oOsBC1G+DDbMVbFNrLdxcmmET6tRuIo54cXmE0tWiqzddm/S0faWs1T54IurSXh
         ViiHOiWVsOFiYwV3GNr5tWwDcxF6gWiXNXmWv+yUnHQxNhVh7XqRlGH285Ddn453m0UQ
         KDLKQmWQifmBcAqEALpDTPRJTJgOHL7jjqonOiHKvhgxjzWUVadHKS2Gt1IEmGUsLEQr
         2+jNHdBDxpAnL8e81oNFRf4ITTUP6okwmtUI1XdTzhvBDuZDsmi1kvDYDoKK8ctYGVds
         PuVjExmwyuWJVqDFx7c+tLFiEYfyFGApSjBqVe1cX0pfhKqi9iuWLQaWKKA6OnOSZJHk
         2uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cem6oTlFpclu5kQGJderqya5NmX71B10BNWkOSjdoCU=;
        b=rmMx6/oQ8GDesx6hHwrkrC3JvIvvCyitjCSxK+JYwQ/ahDXaG4bfLXWwaKBEEaF0bY
         l1WUEcPIe4/YPGlOU5MFZgYeIDoo37SPt0b0loa5PJ3t86QuIaDZH58D/bip6EN0x7ob
         /FoV3niU4k8NJvksTQ/NYyXI6tanGqTLF8245oFuH+pcaRi4TxUiE2+bYZz7cyQvkuOA
         2c6HkYVX0QmC4K6tTLpcjjyQaAdHMTGNK0kX8dFrUtZ14HCFimlIr3IuA5vTYAy7coaY
         WlMvH29FhMBSTiwWC/v91lLVxif+kr0JDFYzbNJfHPfAFzZYik31bEcuCqAGFwk5gNb5
         HFTQ==
X-Gm-Message-State: AFqh2krJ2goO0CEjy83qSRyDN28cBMN41A4bmZIJeE12+VaiAJpeG3XX
	GZau901b6zXA4XRFxxBf+Zq0aQWvKmJLEe95HVI=
X-Google-Smtp-Source: AMrXdXsji1h4n8qntwl3RPNW5QXfUsDcI+WcuusUF1BmxlFqFo/u7rXacV7Ud0lrGMokyAAiP7g7ihNPQ+MdhqbYjHw=
X-Received: by 2002:a05:6870:98b1:b0:13b:1e05:a73d with SMTP id
 eg49-20020a05687098b100b0013b1e05a73dmr1153292oab.55.1671483938693; Mon, 19
 Dec 2022 13:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20221219131041.452949-1-f_l_k@t-online.de> <20221219131041.452949-4-f_l_k@t-online.de>
In-Reply-To: <20221219131041.452949-4-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2022 13:05:12 -0800
Message-ID: <CAMKF1sr3FkcE9YbniwX3jfejNGmJP4keabbCspN4StUxBeM69A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 04/10] appstream: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 21:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100117

On Mon, Dec 19, 2022 at 5:11 AM Markus Volk <f_l_k@t-online.de> wrote:
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
> index 000000000..6018754c9
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

libstemmer is in meta-gnome. Please move this recipe to meta-gnome as
well or move libstemmer to meta-oe

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
> +       https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz \
> +       file://0001-fix-crosscompile.patch \
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
> View/Reply Online (#100099): https://lists.openembedded.org/g/openembedded-devel/message/100099
> Mute This Topic: https://lists.openembedded.org/mt/95764270/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

