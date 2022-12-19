Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046EBC4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 19:25:48 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.31541.1671477943388382420
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 11:25:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cPObi+Bo;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-143ffc8c2b2so12800736fac.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 11:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ikJb88SnqlxjQ0NXSEWLFpwcAhTgGmZaUc80l0IOYVg=;
        b=cPObi+BoQHEdpuxYo0qayZjJVqmBWnezNuQusjkcczRVaE2x8N6yLgTx8kHot5q+TY
         kASiWo7KheoQAtvwkT+NsFlazSMdlTRs7AA7g1ZFTUs1bmqvQoTF5BrQI2lxxOLTy3gL
         vHs5IRsuhcFBalPhjcc+xaH2g/bdHxeiIlFTExtXB4YIgiHuKG7pPWgbj/U7MwbuSHM7
         5NnNQhx6nP9gSNz0mZu+pW+dO0OLQmRHi3WJY29OBIC0goD13k6Lx0GowTL41ttc4F16
         FHvnRDtc6BUE192XkBkRbqaB8x3ZVElouFmBxKdd5PwMUnZ4BbvjHAVotI6RWzYclDOF
         BFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ikJb88SnqlxjQ0NXSEWLFpwcAhTgGmZaUc80l0IOYVg=;
        b=Hob9sm4sGhFR+7hclEwfGeSNlNRQD8rpR9T74xDT3uBnvRzw0j5JkfJ3QVO+NF6qhR
         9gZJQV1AF1JbkEY4dqc8R5mkPEVjpskx7BxotTUCmtzfnXcuXwjKC/XSKq4oZvs9FdFp
         8AF/UTC7AUUEPAWvprRCdPKGKk1M7aI/cT3u0nbCA82k3e/ZQNnI/wXly9CM3Egc0y/x
         +yh5Lvf3z8/s1Uble97RttCo4nMUmtoTfdZDVoCcBzIhNZ/ExJMFqDhDGPPDp7EudVWg
         mxvUNOk+a9ec8JMk0KHusuAuiknkfbxGKR8ylTC6/13A4pV5VTYFUAMaBZC8VgUXmiBf
         MW4g==
X-Gm-Message-State: ANoB5plU0nI766yMuOZzJebWgUOqMUOj/MZu5EHjFC7lteOKgjSBumlZ
	PY7Ujbl0xaw+exvnY/PYRr2uS+B1i4NxIlyI3CKXoZj4llQ=
X-Google-Smtp-Source: AMrXdXsUinYlXnpgy4XRFVwy6whionkjUS09Uu94UAYT9+Ztq0Q2At1nv2I5sP6HqhNTtpvoOhUwYxBMBVX9C5S0rSA=
X-Received: by 2002:a05:6870:9f09:b0:144:e1eb:419 with SMTP id
 xl9-20020a0568709f0900b00144e1eb0419mr1385437oab.262.1671477942337; Mon, 19
 Dec 2022 11:25:42 -0800 (PST)
MIME-Version: 1.0
References: <20221219131041.452949-1-f_l_k@t-online.de> <20221219131041.452949-6-f_l_k@t-online.de>
In-Reply-To: <20221219131041.452949-6-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2022 11:25:16 -0800
Message-ID: <CAMKF1sq4hns=rdZSKpXFocsXOGOaN9MShn151gsrbi8ZfLE58w@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 06/10] xdg-desktop-portal: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 19:25:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100109

I am seeing this issue

10:01:37 ERROR: Nothing PROVIDES 'python3-dbusmock-native' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
DEPENDS on or otherwise requires it). Close matches:
10:01:37   python3-dbus-native
10:01:37   python3-dbussy-native
10:01:37   python3-pysocks-native
10:01:38 ERROR: Nothing PROVIDES 'bubblewrap-native' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
DEPENDS on or otherwise requires it). Close matches:
10:01:38   babl-native
10:01:38 ERROR: Nothing PROVIDES 'flatpak' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
DEPENDS on or otherwise requires it)
10:01:38 flatpak was skipped: missing required distro feature 'polkit'
(not in DISTRO_FEATURES)
10:01:39 ERROR: Nothing RPROVIDES 'xdg-desktop-portal-dev' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
RDEPENDS on or otherwise requires it)
10:01:39 No eligible RPROVIDERs exist for 'xdg-desktop-portal-dev'
10:01:39 NOTE: Runtime target 'xdg-desktop-portal-dev' is unbuildable,
removing...
10:01:39 Missing or unbuildable dependency chain was: ['xdg-desktop-portal-dev']
10:01:39 ERROR: Nothing RPROVIDES 'bubblewrap' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
RDEPENDS on or otherwise requires it)
10:01:39 NOTE: Runtime target 'bubblewrap' is unbuildable, removing...
10:01:39 Missing or unbuildable dependency chain was: ['bubblewrap']
10:01:39 ERROR: Nothing RPROVIDES 'xdg-desktop-portal' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
RDEPENDS on or otherwise requires it)
10:01:39 No eligible RPROVIDERs exist for 'xdg-desktop-portal'
10:01:39 NOTE: Runtime target 'xdg-desktop-portal' is unbuildable, removing...
10:01:39 Missing or unbuildable dependency chain was: ['xdg-desktop-portal']
10:01:40 ERROR: Nothing RPROVIDES 'xdg-desktop-portal-gnome-dev' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
RDEPENDS on or otherwise requires it)
10:01:40 No eligible RPROVIDERs exist for 'xdg-desktop-portal-gnome-dev'
10:01:40 NOTE: Runtime target 'xdg-desktop-portal-gnome-dev' is
unbuildable, removing...
10:01:40 Missing or unbuildable dependency chain was:
['xdg-desktop-portal-gnome-dev']
10:01:40 ERROR: Nothing RPROVIDES 'xdg-desktop-portal-gnome' (but
/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-openembedded/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_43.1.bb
RDEPENDS on or otherwise requires it)
10:01:40 No eligible RPROVIDERs exist for 'xdg-desktop-portal-gnome'
10:01:40 NOTE: Runtime target 'xdg-desktop-portal-gnome' is
unbuildable, removing...
10:01:40 Missing or unbuildable dependency chain was:
['xdg-desktop-portal-gnome']

On Mon, Dec 19, 2022 at 5:12 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...p-portal-pc-in-add-pc_sysrootdir-dir.patch | 25 ++++++++++++
>  .../xdg-desktop-portal_1.16.0.bb              | 40 +++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
>  create mode 100644 meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
>
> diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
> new file mode 100644
> index 000000000..4b80c6e9f
> --- /dev/null
> +++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal/0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch
> @@ -0,0 +1,25 @@
> +From 7727dbfef4dd7ced3958ae9ada59a8899976b12d Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 12 Dec 2022 18:40:31 +0100
> +Subject: [PATCH] xdg-desktop-portal.pc.in: add pc_sysrootdir dir
> +
> +---
> + xdg-desktop-portal.pc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/xdg-desktop-portal.pc.in b/xdg-desktop-portal.pc.in
> +index 585c0c8..15b5817 100644
> +--- a/xdg-desktop-portal.pc.in
> ++++ b/xdg-desktop-portal.pc.in
> +@@ -2,7 +2,7 @@ prefix=@prefix@
> + datarootdir=@datarootdir@
> + datadir=@datadir@
> +
> +-interfaces_dir=${datadir}/dbus-1/interfaces/
> ++interfaces_dir=${pc_sysrootdir}${datadir}/dbus-1/interfaces
> +
> + Name: xdg-desktop-portal
> + Description: Desktop integration portal
> +--
> +2.34.1
> +
> diff --git a/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
> new file mode 100644
> index 000000000..d026f3b61
> --- /dev/null
> +++ b/meta-oe/recipes-support/xdg-desktop-portal/xdg-desktop-portal_1.16.0.bb
> @@ -0,0 +1,40 @@
> +SUMMARY = "A portal frontend service for Flatpak and possibly other desktop containment frameworks."
> +HOMEPAGE = "https://github.com/flatpak/xdg-desktop-portal"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = " \
> +    json-glib \
> +    glib-2.0 \
> +    libportal \
> +    geoclue \
> +    pipewire \
> +    dbus-native \
> +    fuse3 \
> +    bubblewrap-native \
> +    xmlto-native \
> +    flatpak \
> +    python3-dbus-native \
> +    python3-dbusmock-native \
> +"
> +
> +PORTAL_BACKENDS ?= " \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'xdg-desktop-portal-wlr', '', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'gtk', 'xdg-desktop-portal-gnome', '', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'gtk+3', 'xdg-desktop-portal-gnome', '', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'gtk4', 'xdg-desktop-portal-gnome', '', d)} \
> +"
> +
> +RDEPENDS:${PN} = "bubblewrap ${PORTAL_BACKENDS}"
> +
> +inherit meson pkgconfig python3native
> +
> +SRC_URI = " \
> +       git://github.com/flatpak/xdg-desktop-portal.git;protocol=https;branch=main \
> +       file://0001-xdg-desktop-portal-pc-in-add-pc_sysrootdir-dir.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "88af6c8ca4106fcf70925355350a669848e9fd5a"
> +
> +FILES:${PN} += "${libdir}/systemd ${datadir}/dbus-1"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100104): https://lists.openembedded.org/g/openembedded-devel/message/100104
> Mute This Topic: https://lists.openembedded.org/mt/95764279/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

