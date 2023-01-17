Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F2AC3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 09:05:53 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.192279.1673946347780358611
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 01:05:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ceQLvRpO;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-15bb8ec196aso19557644fac.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 01:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8vFpvg0mJ8R0Hjyf07xXHAlgjqYHU2rif5aFFV6MMqk=;
        b=ceQLvRpOE3BTiXcY13sPXn7DrLH5xMlL4rs1bz5Mw2R+/pqrAKE2LIiGxDdli5hoHZ
         XP8RcxJkav2qsW29XKYLk0RHZ4/jbAHPOgOZSdpbuipTJmP0P2WVE9AldkOssnIl5TBL
         Ue/4AsjHf9s3ApBcDN8w/oCBeP1MElhsKGe6n8gx72KINjh3tZHld9srfwM4QN+V/OO7
         2SnFWfkmfMA25191Dpxztn2VD/KbKWl1STXmp2cY8/QwLYbuuf3Ce89OBJodnoWJbFjK
         yjLsevvU2ylp8uHhTzPqNNV1iqsZoDp9vxmukIQm5wJrHfsv1BWE5eQtJva8x+7uSSjP
         cYOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8vFpvg0mJ8R0Hjyf07xXHAlgjqYHU2rif5aFFV6MMqk=;
        b=YSos0Xw12k3JzijoDqjUdtc/7RWoVXR/eoCtpqUlBLdpo2pm1AQlLFj4F/EsAgnW+9
         Qd34ietzLYCIH/0fhuc90KxpHyvpXrIXw0F3Px2n6LOhSB5j7EjrGjdcLriGawIZGYTq
         is48b+siXLcH3NoSeUT/lnkczQXNOIof3x3FYiR+20NnHpBgu4S3W/EF3H4Qxg/Cxklf
         iN6pGT6afBEqCcFZzaKGTQUDH+UHscOL7i+pB4A9WUDrPvYr7WFhv1pxvj9i8Iag+cG2
         BNzookT/88UGpiExcK4y9xAp4DBpzy5Vo4S8G5TDSNyjV1olcSipFrr1fG9fT+dFn8NE
         r+2A==
X-Gm-Message-State: AFqh2ko652g8ZuNVvFTRAczM8V335h2ghHAsOxOU/yYCM9m9KZUcyTka
	a3uEUYlz88IXrl9+1b4wBayDLzp4u9gkhblG5Qo=
X-Google-Smtp-Source: AMrXdXsUQwOeEhutw8vgQHsSiaPs+H6cB0o56Z48Du2DbJwnXfeFIeASDhbDJZYfI0MHq9EDNJFXKyAJoNHHxl8K2rw=
X-Received: by 2002:a05:6870:ebc3:b0:144:e1eb:419 with SMTP id
 cr3-20020a056870ebc300b00144e1eb0419mr207927oab.262.1673946346685; Tue, 17
 Jan 2023 01:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20230117080933.124496-1-f_l_k@t-online.de>
In-Reply-To: <20230117080933.124496-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jan 2023 01:05:20 -0800
Message-ID: <CAMKF1spB8qrMbDPfHoD13Yv80+VS98QqLG1GsnDjwC+1pwCZ-g@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-remote-desktop: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 09:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100635

On Tue, Jan 17, 2023 at 12:09 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Add a recipe for gnome-remote-desktop and a corresponding PACKAGECONFIG for
> gnome-control-center from where it can be enabled/disabled, if available.
>
> It is not enabled by default because it has a dependency on tpm2-tss and thus
> adds a layer dependency on meta-security/meta-tpm.

Adding dependency on recipes from meta-tpm still hampers parsing, Is
it possible to disable it via a packageconfig in this recipe  ?
if not then I think it might have to use dynamic-layers concept, so it
does not show up to bitbake unless meta-tpm is part of BBLAYERS

ERROR: Nothing PROVIDES 'tpm2-tss' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
DEPENDS on or otherwise requires it)
ERROR: Nothing RPROVIDES 'gnome-remote-desktop-dev' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'gnome-remote-desktop-dev'
NOTE: Runtime target 'gnome-remote-desktop-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['gnome-remote-desktop-dev']
ERROR: Nothing RPROVIDES 'gnome-remote-desktop' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
RDEPENDS on or otherwise requires it)


>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../gnome-control-center_43.2.bb              |  1 +
>  .../gnome-remote-desktop_43.3.bb              | 38 +++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
>
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
> index 830f3ec68..16a400c5c 100644
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.bb
> @@ -42,6 +42,7 @@ SRC_URI[archive.sha256sum] = "d7f256aba80a92c727b329fd01c8602da4b78f0fddaec93fcd
>  PACKAGECONFIG ??= "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
>  PACKAGECONFIG[ibus] = "-Dibus=true, -Dibus=false, ibus"
>  PACKAGECONFIG[wayland] = "-Dwayland=true, -Dwayland=false, wayland"
> +PACKAGECONFIG[remote-desktop] = ",,,gnome-remote-desktop"
>
>  EXTRA_OEMESON = " \
>      -Doe_sysroot=${STAGING_DIR_HOST} \
> diff --git a/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb b/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
> new file mode 100644
> index 000000000..5d1a85d5f
> --- /dev/null
> +++ b/meta-gnome/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_43.3.bb
> @@ -0,0 +1,38 @@
> +SUMMARY = "Remote desktop daemon for GNOME using pipewire."
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +GNOMEBASEBUILDCLASS = "meson"
> +
> +inherit gnomebase gettext gsettings features_check
> +
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +SRC_URI[archive.sha256sum] = "11d451d1fde44f1809ebf61aff4bea5f9ef4fdc02359a89647f6e9e7d45429ac"
> +
> +DEPENDS = " \
> +    asciidoc-native \
> +    libdrm \
> +    libepoxy \
> +    cairo \
> +    glib-2.0 \
> +    pipewire \
> +    libnotify \
> +    libsecret \
> +    nv-codec-headers \
> +    tpm2-tss \
> +"
> +
> +PACKAGECONFIG ??= " \
> +    vnc \
> +    rdp \
> +    ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'fdk_aac', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
> +"
> +
> +PACKAGECONFIG[vnc] = "-Dvnc=true,-Dvnc=false,libvncserver"
> +PACKAGECONFIG[rdp] = "-Drdp=true,-Drdp=false,freerdp fuse3 libxkbcommon"
> +PACKAGECONFIG[fdk_aac] = "-Dfdk_aac=true,-Dfdk_aac=false,fdk-aac"
> +PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> +
> +FILES:${PN} += "${systemd_user_unitdir}"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100634): https://lists.openembedded.org/g/openembedded-devel/message/100634
> Mute This Topic: https://lists.openembedded.org/mt/96326092/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

