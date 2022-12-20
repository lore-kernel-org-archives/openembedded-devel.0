Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F611C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 06:57:51 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web10.44811.1671519464598572172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 22:57:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QO0y/OpX;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-1442977d77dso14409111fac.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 22:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4+xJZXL5P73AEDheU1DQEZ5UcmJbN4seYPr8PQouODE=;
        b=QO0y/OpXzJxgM7JF5HAGaiAyEUfwdDptBkG+yoJ0k4Uaeqv3q+JsBVkNE6mnIIXymx
         v8kzMSxUm/latzChKlVn6eFpX+KuEOMzUfjaOw7ZuOvhhvQjzJtzc70nNb6uNSS6+0j5
         bpIkAsqUAHSlxzTRTDVeyltwfbJTEZvKWr0JEwwp6gzkXFNGqAohEPutpYqh+Gmc72iJ
         1uWoyzXrEG4aL+9AxWlAvMj8W1z19sNnZJxEoBwSEzUvNL+KUifufXhIdh4VCEiFZ501
         6mFL51Q2FF0hGz6/CeJWHY0YJbBeo7dG+w4+ZGbsnNALZK42URGJ+PvahMn4sNwSgN7h
         q2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4+xJZXL5P73AEDheU1DQEZ5UcmJbN4seYPr8PQouODE=;
        b=I1w+fCtCmEmrHoX1NIrNg3MSVnMigPfmue16Zfq8lIz+ApXvptZ4ASEormTYlszM8e
         MF6AjqWy8V2r1GnXfosfnP0hKfAuZbfIa/bxsnpUeF+dONz/Kjide6zynQDOy8zbcTdy
         1D+FKKJNQPgxKSMqWtIB/3/dRrNmTOMmsCV/R84MOdnRF35sxXxMm597qhgemfjOKLY7
         +Y5MZc1c5te8JI8+w94JRG8DlDx25TXTpOwvCNl4b89HBLQ5sQ1Ypmv8jgXZzFIy4MRd
         C3WxPgkxM929ZLryMN14d6ShUZXaxy/jYi5gnRCYhOSV1Lm/faj0aayqXj/VoX6qAhX0
         Nw+g==
X-Gm-Message-State: ANoB5pmzRYrNeQ9YYAN1p86u00bGc+NQaB4eFpm7nJ1enWeonsWJJcch
	zSryx7aVHZBli4eP/pNuId3AkUm401vArtpFklU=
X-Google-Smtp-Source: AMrXdXsmVyXrWWwEaxgMDZjoIZdz+CChYv+IDPPZOLsHY5tDDG7mXKkmeKmSjw9zYIV0WvZeqeqhsi5qQquFivGXYSo=
X-Received: by 2002:a05:6870:9f09:b0:144:e1eb:419 with SMTP id
 xl9-20020a0568709f0900b00144e1eb0419mr1528516oab.262.1671519463578; Mon, 19
 Dec 2022 22:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20221219131041.452949-1-f_l_k@t-online.de> <20221219131041.452949-5-f_l_k@t-online.de>
In-Reply-To: <20221219131041.452949-5-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2022 22:57:17 -0800
Message-ID: <CAMKF1sp9N2VHygKfpE0ybEspjd27X8LJbGg+i1+y_AEn6f2Lfw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 05/10] xdg-desktop-portal-wlr: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 06:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100123

this depends on pipewire, which is in meta-multimedia, I wonder if
this recipe should be in meta-multimedia as well.

On Mon, Dec 19, 2022 at 5:11 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../xdg-desktop-portal-wlr_0.6.0.bb           | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0.6.0.bb
>
> diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0.6.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0.6.0.bb
> new file mode 100644
> index 000000000..07650a139
> --- /dev/null
> +++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal-wlr_0.6.0.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "A xdg-desktop-portal backend for gnome."
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/xdg-desktop-portal-gnome"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e316e9609dd7672b87ff25b46b2cf3e1"
> +
> +DEPENDS = " \
> +    wayland \
> +    wayland-native \
> +    wayland-protocols \
> +    libdrm \
> +    libinih \
> +    pipewire \
> +    virtual/libgbm \
> +"
> +
> +inherit meson pkgconfig
> +
> +SRC_URI = "git://github.com/emersion/xdg-desktop-portal-wlr.git;protocol=https;nobranch=1"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "0a8bfa14607022a080f8b6eabc4757d1918d3cd9"
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +
> +PACKAGECONFIG[man-pages] = "-Dman-pages=enabled,-Dman-pages=disabled,scdoc-native"
> +PACKAGECONFIG[systemd] = "-Dsystemd=enabled,-Dsystemd=disabled"
> +
> +FILES:${PN} += "${systemd_user_unitdir} ${datadir}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100098): https://lists.openembedded.org/g/openembedded-devel/message/100098
> Mute This Topic: https://lists.openembedded.org/mt/95764267/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

