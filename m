Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14039C4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 19:46:08 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web11.1782.1670701567084295586
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 11:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VAWdUgGo;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id l8-20020a056830054800b006705fd35eceso4911912otb.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 11:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=htMDJq2OSDgacSViDCvKwznhDj5HrZOzcPL+jgNL3+4=;
        b=VAWdUgGoy6kgeuKCys3KIiaxwYmZdY3pptb2uihYCu/Amkvy0t4WK/M1Pv0ZGP8Lf7
         LFP02yaMYJv012+MJi19LEhSSbsVrNGsl+0rIyPtKt6X4a13ewUqzcAav4yb0iyHb+FB
         jbbL27aZf+8BwZSbmFJoFtJzphFoKSf0HxD8T+wgx2W9ZnN/H2V5aZCp2gdi9cPUUCLi
         pU9GKs01K+QbgqKMzxGeASxv3tNmYRenBgZX4m49ZQBMPMNOmK8mA7xfbmLXBLYIO2kW
         0ARyTSTIWaxyMvkh8X3XFNbFLmi3uIo2+s8VwpDVnICh7DhyJ377oPA7LOjCrDsEnWmI
         l0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=htMDJq2OSDgacSViDCvKwznhDj5HrZOzcPL+jgNL3+4=;
        b=ialK2S0bqbrN6oM/I0fET/NQVCPXn3vDZ6fQXqA9A9V5TF+PCA77s7mM9k4CC/kF7L
         QDCML0qkjptif+ZXtPDxXNIayrcjXvQMZGX6a7lUdXYs0KSUtNEgfPc6fH7h2gmztr5S
         fKUGg/kFbKmmDLeEk4ggfIlKctPUghNMJvcEktJagKocbnZWmCU9zNy+PUBuS6lp3fSi
         QyAdHlyLT+/7BY4AZtoXtvhoghWW1dJfRePD+/mK0x6hE/vy8sA51Erap6f5MzeXY22R
         N0OsKadx6rVMwIH9wNHZ6STaM1If2YSRsMqlK/+il5aV37Tsb0Gou//vt2vBeQprJW6N
         zHbg==
X-Gm-Message-State: ANoB5pkgH3PhlMFiSszcPf/UtfxyZ/N2Qnivu0P7mf6mSUBAgn2Xs92J
	5V4rUGx4gY38/7Te/KBasYoeJ6tFRoaT+jZAm8w=
X-Google-Smtp-Source: AA0mqf5UaHRHTZA5qtSVhAPQyOwkzC2XPeYVzbP4tMbuSOi+VCbdMca60eUGL3B8Dv+fn1g0JK/nTtR5vPNBBE48BHs=
X-Received: by 2002:a9d:6a44:0:b0:66c:fb5b:1d67 with SMTP id
 h4-20020a9d6a44000000b0066cfb5b1d67mr48761308otn.111.1670701566230; Sat, 10
 Dec 2022 11:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20221210052137.303984-1-f_l_k@t-online.de> <20221210052137.303984-5-f_l_k@t-online.de>
In-Reply-To: <20221210052137.303984-5-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 Dec 2022 11:45:40 -0800
Message-ID: <CAMKF1sqATSxv4uihUDPtVQNaviVuaJytEw2ACyA0zdm7PAzGCQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 5/6] gtksourceview5: update 5.4.2 -> 5.6.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 19:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100029

On Fri, Dec 9, 2022 at 9:22 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...urceview5_5.4.2.bb => gtksourceview5_5.6.1.bb} | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>  rename meta-gnome/recipes-gnome/gtksourceview/{gtksourceview5_5.4.2.bb => gtksourceview5_5.6.1.bb} (65%)
>
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
> similarity index 65%
> rename from meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
> rename to meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
> index 297f79fe2..a35a8df7d 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.4.2.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.6.1.bb
> @@ -5,13 +5,14 @@ LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>
>  DEPENDS = " \
> +    fribidi \
>      glib-2.0-native \
>      gnome-common-native \
> -    intltool-native \
> -    gtk+3 \
> +    fontconfig \
>      gtk4 \
>      libxml2 \
>      libpcre2 \
> +    pango \
>  "
>
>  PNAME = "gtksourceview"
> @@ -22,14 +23,16 @@ GNOMEBASEBUILDCLASS = "meson"
>
>  inherit gnomebase lib_package gettext features_check gtk-doc gtk-icon-cache gobject-introspection vala
>
> -ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> -REQUIRED_DISTRO_FEATURES = "opengl"
> +REQUIRED_DISTRO_FEATURES = "opengl gtk"
>

this will need few more recipes to be enabled only
if gtk is in distro feature. Please test a parse step for
world  build with meta-gnome without gtk in distro features

ERROR: Nothing PROVIDES 'gtksourceview5' (but
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_42.2.bb,
/home/pokybuild/yocto-worker/meta-oe/build/meta-openembedded/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_43.1.bb
DEPENDS on or otherwise requires it)
gtksourceview5 was skipped: missing required distro feature 'gtk' (not
in DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'gnome-calculator', 'gtksourceview5']



> -SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.4/${PNAME}-${PV}.tar.xz"
> -SRC_URI[sha256sum] = "ad140e07eb841910de483c092bd4885abd29baadd6e95fa22d93ed2df0b79de7"
> +SRC_URI = "https://download.gnome.org/sources/gtksourceview/5.6/${PNAME}-${PV}.tar.xz"
> +SRC_URI[sha256sum] = "659d9cc9d034a114f07e7e134ee80d77dec0497cb1516ae5369119c2fcb9da16"
>
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
>  GTKDOC_MESON_OPTION = "gtk_doc"
>
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)}"
> +PACKAGECONFIG[vulkan] = ",,vulkan-loader vulkan-headers"
> +
>  FILES:${PN} += "${datadir}/gtksourceview-5"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100016): https://lists.openembedded.org/g/openembedded-devel/message/100016
> Mute This Topic: https://lists.openembedded.org/mt/95577353/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

