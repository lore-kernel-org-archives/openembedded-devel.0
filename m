Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DE6C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 19:21:04 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web09.15750.1639423262952675463
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 11:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EJ9YdCdw;
 spf=pass (domain: gmail.com, ip: 209.85.160.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id t34so16270783qtc.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 11:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ifYOIJ6Y+FGFOn2WQfWzqbCK3PmjBETGk595Nhifz1w=;
        b=EJ9YdCdw/mY4IxHTJhUA1jJ8Wn3mtOjmEGH+QaknNmUEZVqCib1Cy3f8FQ89DHMsDQ
         ohQOr3RVQXQT1tK7XVbEyfIe9bgSS/TffLzrZOuADIsV9sv+ZWC2m6lQ6xY40PDf+IKR
         CIZ5QI8fKh+f4SnHnLt4liyphGGsCX3h/k0pHDsOA/ldwZnu0ewTexAaPme6GCCOXA5k
         68S/noXGYi5cEVyPDys12aqAHbQ+ijee2or3U1xASdIGPGor0mdcyXWQE29RS1JCUpkE
         Er1JQZ2wYYZz9Zr+Zu13vDlVnm7AP/9Qqnd1rbOyXpmigCKiQUMtcJhb7bkrT7tP3uYK
         /6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ifYOIJ6Y+FGFOn2WQfWzqbCK3PmjBETGk595Nhifz1w=;
        b=LGTfIuOuebd3OkE3I0zFNNburRedOrpccPDhdCsi5OLAhAjKDqCWmKtqUSQ4nB7WLy
         1PofCejiAHOvMbjbMyiTcdaRaAk80BYToSvaM8vV+u7img3oCOKdewQKQmICHYUZCafF
         HRrvdMFQh11ZW17pVgHbNQM3r3kCAuwXqz/VVsrKOyWSoGv5GA7Z8/KZsXwe8uE7fk/I
         DRJEvIDvLbVU0oNGAzOd37CZwOcon2IaDIS0e8rpyQFBDhsTMROxxAmjO2JsYuF7HeHl
         ZrCbRoHzxJkiZagNOjFyzAK08xSK0Gb9UGCnkVo6Z7857Drm3vruC/IYaayl51NruRq7
         loPw==
X-Gm-Message-State: AOAM53105T0YkXzZkOVG02dRkQ7GMzzFQBkXJz4ADjyJBO9d+eF4CbVu
	CiPvZjvsNyPkK5DRyviwgwG3V/KT8MaOXd66CKU=
X-Google-Smtp-Source: 
 ABdhPJxN2JQRicNeetFOFC9UnzZhcDVDFll4AXWrRIq+/JzLPJkKsvLwwch0Fux/A+Ngni3rPQRfx+WvaEvjmxPgjKg=
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr300221qtw.185.1639423261819;
 Mon, 13 Dec 2021 11:21:01 -0800 (PST)
MIME-Version: 1.0
References: <20211213165028.707874-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211213165028.707874-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Dec 2021 11:20:35 -0800
Message-ID: 
 <CAMKF1sqLoSFXQ6ix9Sodo3B97R-gwysAcOmjUzPwZZTrQ1UsaQ@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH v2] gssdp: update to 1.4.0.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 19:21:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94344

On Mon, Dec 13, 2021 at 8:50 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../recipes-connectivity/gupnp/gssdp_1.2.3.bb | 20 --------------
>  .../gupnp/gssdp_1.4.0.1.bb                    | 26 +++++++++++++++++++
>  2 files changed, 26 insertions(+), 20 deletions(-)
>  delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
>  create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
>
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> deleted file mode 100644
> index 8f27ae292..000000000
> --- a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.2.3.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -SUMMARY = "Resource discovery and announcement over SSDP"
> -DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP (Simpe Service Discovery Protocol)."
> -LICENSE = "LGPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
> -DEPENDS = "glib-2.0 libsoup-2.4"
> -
> -SRC_URI = "${GNOME_MIRROR}/${BPN}/1.2/${BPN}-${PV}.tar.xz"
> -SRC_URI[md5sum] = "ef3295a965c06ce0f683522391fbb910"
> -SRC_URI[sha256sum] = "a263dcb6730e3b3dc4bbbff80cf3fab4cd364021981d419db6dd5a8e148aa7e8"
> -
> -GTKDOC_MESON_OPTION = 'gtk_doc'
> -
> -inherit meson pkgconfig gobject-introspection vala gtk-doc
> -
> -PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"
> -PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
> -
> -PACKAGES =+ "gssdp-tools"
> -
> -FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> new file mode 100644
> index 000000000..056ea83aa
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "Resource discovery and announcement over SSDP"
> +DESCRIPTION = "GSSDP implements resource discovery and announcement over SSDP \
> +               (Simpe Service Discovery Protocol)."
> +HOMEPAGE = "https://gitlab.gnome.org/GNOME/gssdp/"
> +BUGTRACKER = "https://gitlab.gnome.org/GNOME/gssdp/-/issues"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +SRC_URI = "${GNOME_MIRROR}/${BPN}/1.4/${BPN}-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "8676849d57fb822b8728856dbadebf3867f89ee47a0ec47a20045d011f431582"
> +
> +GTKDOC_MESON_OPTION = 'gtk_doc'
> +
> +DEPENDS = " \
> +    glib-2.0 \
> +    libsoup-2.4 \
> +"
> +
> +inherit meson pkgconfig gobject-introspection vala gtk-doc
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"

enabling should not only check for x11 in DISTRO_FEATURES but also
check for meta-gnome being
in layer mix. A question is that does this new version has hard
dependency on gtk4? or can it still
work with gtk3+

> +PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+4,"

typo here, it should be gtk4

> +
> +PACKAGES =+ "gssdp-tools"
> +
> +FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
> --
> 2.25.1
>

