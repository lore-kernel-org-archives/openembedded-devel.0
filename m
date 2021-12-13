Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B223C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:09:40 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.13121.1639411779712110797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oLXmJUvW;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id i12so14779771qvh.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vqF0ha8tuYyQCDNspCgOc0X/6/Zi8AQyc6aUnmYa2sM=;
        b=oLXmJUvWlOyrL/YIj6kzlS8uJtqVgmA8BpLnJgvW2Mj1Yxh0kEQChViwu7qza+q3Hz
         Xk1o67g5VG0LfQetq6NUAhTosb9miWDLNFTJkaUng2106XNhtHrbyfbBlLWUNFF9xwtw
         IJfcfK9OihAOnIuMbgzx6hz2uPpJzMAmrrqGrhQlwfntt2Cp7pQG/pr5mVrMHj/fTPDO
         gKFjtj5O/iuZ7QdkaOmA3vc0fgSGGiyHPkxD7/WXY9rkZmvMerFXuW2e5RR+NsooTzlt
         EP/7/amhqaPD8boXRoaANMnUjwCphEDRSlsQRsGE2vN0zn/96F9j4iUDBgFOuuPYWqMZ
         hNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vqF0ha8tuYyQCDNspCgOc0X/6/Zi8AQyc6aUnmYa2sM=;
        b=yWNozDtnk1cT2mNThD51qfT6s0895I2PZVVfY17FA+Xh3ZRF9aK4MmFkHktaq89O6G
         bNVopV3cZu6Ai2FHvTyxmeTEUNIEWP5wRF7vtvfSu7DOIeQOS+XtkN+b0DubaKv0rMXO
         8z2Q4YTcMEdPRKsn0mzEK379Vc1IdO8Bxcu1yL0t0rCBGypdTZZtP+z9eE2gMNPPyZQ3
         kw+nPiJNua10BzFrraO6vD4YRBb8rgbwOCoYAyKpS3+WBnDJXbQo7VZtvT1rKbymZ1K5
         oHCvqzWi0YNx/U9gqPaZUumpnEcLAFiqWO2sOot0eHrsuuspIT1P5fOWhWzGkFvs1CJP
         jS5A==
X-Gm-Message-State: AOAM53301uxPicR3Pb/OX3uonUi2w9sl26xNrylX/Oh2HeJz+gO99+x/
	Y8Vap5hscRE50DdkINA8oFo+pYDEXjjyhetGJug=
X-Google-Smtp-Source: 
 ABdhPJx0u3kG8LI19Z3Z8DWq140kL8cAYByu8np4pmfqKHXD12Y3GHRVRMzY3dmyVVl5mEqxhY1S4x+SANHiT67LL9Y=
X-Received: by 2002:a05:6214:c83:: with SMTP id
 r3mr43370906qvr.110.1639411778663;
 Mon, 13 Dec 2021 08:09:38 -0800 (PST)
MIME-Version: 1.0
References: <20211212183612.3489223-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20211212183612.3489223-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Dec 2021 08:09:12 -0800
Message-ID: 
 <CAMKF1sqGtF4cQd8yRpR4r-QsLCG909cKa66+4bA95+dUfD4kJw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] gssdp: update to 1.4.0.1
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 16:09:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94334

I am seeing this failure

stdio: ERROR: Nothing PROVIDES 'gtk4' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Nothing PROVIDES 'gtk4' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
DEPENDS on or otherwise requires it). Close matches:
stdio: ERROR: Required build target 'meta-world-pkgdata' has no
buildable providers.
stdio: ERROR: Command . ./oe-init-build-env; yocto-check-layer-wrapper
../meta-openembedded failed with exit code 2, see errors above.
(1639376061.2: 1715.6)

see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1788

On Sun, Dec 12, 2021 at 10:36 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../recipes-connectivity/gupnp/gssdp_1.2.3.bb | 20 --------------
>  .../gupnp/gssdp_1.4.0.1.bb                    | 27 +++++++++++++++++++
>  2 files changed, 27 insertions(+), 20 deletions(-)
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
> index 000000000..43d2fcfa0
> --- /dev/null
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gssdp_1.4.0.1.bb
> @@ -0,0 +1,27 @@
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
> +    gtk4 \
> +"
> +
> +inherit meson pkgconfig gobject-introspection vala gtk-doc
> +
> +PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'sniffer', '', d)}"
> +PACKAGECONFIG[sniffer] = "-Dsniffer=true,-Dsniffer=false,gtk+3,"
> +
> +PACKAGES =+ "gssdp-tools"
> +
> +FILES:gssdp-tools = "${bindir}/gssdp* ${datadir}/gssdp/*.glade"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94306): https://lists.openembedded.org/g/openembedded-devel/message/94306
> Mute This Topic: https://lists.openembedded.org/mt/87681937/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

