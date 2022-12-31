Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D00DCC4167B
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 17:11:42 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.46061.1672506699850202795
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 09:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GiMZcpKr;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-14fb7fdb977so21298289fac.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 09:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NyLlMbmUpb1xszSE9uVREW+SVLbOqiSsz39VTaOMCo=;
        b=GiMZcpKrle7MNexZwmuvNbkAUoakRij00NXJCNzfoQRcRTEprftOuAA+IZUm7ht8eb
         zleOzM2bkNlnjXRKVfPX1ISQEqZJxhcmJhSQXLsL9Xw4wWJqwo2+LwERHmif25RQfNSF
         HmONqMGaggPmhV0TNI9LxhTlVWUSIfvjV+QH0Is0QfPrizH83BeYm9BVEzHJk+4o7DGY
         FWfrWrjXX+HFagjj/0b5ivb0iUmnXwwYFM2/BVZOJGxpjT4FTRWugsNoqMLE99xJDqZi
         USLHFC3uJfxON2I9B8/BvZTDzV/nzpXLqXMiUyoEhKHatHocmsPaARw+XAEh2bekzzkh
         Yx2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NyLlMbmUpb1xszSE9uVREW+SVLbOqiSsz39VTaOMCo=;
        b=rMI8pHuutMYLL3Af/0+vQc/HuI5fhL1wBa+4A1RbDH5O6lJDm9xtnt2gWmOqDj469J
         SlQ1RJ/zOXOXxqqBO77RhYurZwF8iyXEnZgcsTUbcMvFJPK0pZoMKwFn/HixuysTS8O/
         oQyO0AuawnoERETo8iXe6Cs2pQ1Oh6VsebcPt6TcxBWzs3w7ahJfxxBzXluD8q4OYL9z
         yQoZPxlv+uETDIrD/+Kd77nux1N66+eYd/GI7y44ms2YWkJ+womtKglJPLPeEGbfvGzS
         mcL1HHC5DqEuigWjehCUmG501oM6esbiv0aJWzejkZjgZv1a6NZildY47kWrin5B1mcS
         MFOg==
X-Gm-Message-State: AFqh2kp31jHto5cApgdYHYc+uy2Um7mw6BcawcUs8O22qESdgUlgbs73
	vwfDwQpNAOoWy/xahjZv2AafLC3OvkDtjT4vNgI=
X-Google-Smtp-Source: AMrXdXu+1HjBfzyPUcyWkyNRl3rRchCrUw8kCnTq1I8LeD65LvA7+X2ETZRAJZLcWiuzoAir68Z+7lUtzBe5x8ZLcLA=
X-Received: by 2002:a05:6870:ee14:b0:14c:733d:3b1 with SMTP id
 ga20-20020a056870ee1400b0014c733d03b1mr1931818oab.55.1672506698873; Sat, 31
 Dec 2022 09:11:38 -0800 (PST)
MIME-Version: 1.0
References: <20221229152946.236288-1-f_l_k@t-online.de>
In-Reply-To: <20221229152946.236288-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 31 Dec 2022 09:11:11 -0800
Message-ID: <CAMKF1sooHYX3m1uBz-SFf-P36cBbRPqA07g=WD1YbUghJFkFTw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-control-center: update 42.0 -> 43.2
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 17:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100321

I am seeing gnome-online-accounts failing on x86/musl, I wonder if its rela=
ted.

https://errors.yoctoproject.org/Errors/Details/686008/

On Thu, Dec 29, 2022 at 7:29 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...001-Add-meson-option-to-pass-sysroot.patch | 45 -----------------
>  ...r_42.0.bb =3D> gnome-control-center_43.2.bb} | 48 ++++++++++---------
>  2 files changed, 25 insertions(+), 68 deletions(-)
>  delete mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-c=
ontrol-center/0001-Add-meson-option-to-pass-sysroot.patch
>  rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_42.0.bb =3D> gnome-control-center_43.2.bb} (68%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-gno=
me/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-=
sysroot.patch
> deleted file mode 100644
> index 768ba5439..000000000
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From ba8aebe1259ae3f7f5a4827e5a47bb95c568b218 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Tue, 21 May 2019 16:07:46 +0200
> -Subject: [PATCH] Add meson option to pass sysroot
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -We need to pass this to meson to help it finding gdesktop-enums.h:
> -
> -| panels/background/meson.build:38:0: ERROR: File /usr/include/gsettings=
-desktop-schemas/gdesktop-enums.h does not exist.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ----
> - meson_options.txt             | 1 +
> - panels/background/meson.build | 2 +-
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson_options.txt b/meson_options.txt
> -index dbca723..af0f871 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -1,3 +1,4 @@
> -+option('oe_sysroot', type: 'string', value: '', description: 'Directory=
 for OE-sysroot')
> - option('documentation', type: 'boolean', value: false, description: 'bu=
ild documentation')
> - option('ibus', type: 'boolean', value: true, description: 'build with I=
Bus support')
> - option('privileged_group', type: 'string', value: 'wheel', description:=
 'name of group that has elevated permissions')
> -diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
> -index 3634c47..459ccfe 100644
> ---- a/panels/background/meson.build
> -+++ b/panels/background/meson.build
> -@@ -25,7 +25,7 @@ common_sources =3D []
> -
> - enums =3D 'gdesktop-enums-types'
> - enums_header =3D files(
> --  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gs=
ettings-desktop-schemas/gdesktop-enums.h',
> -+  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variab=
le('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> -   'cc-background-item.h'
> - )
> -
> ---
> -2.34.1
> -
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_42.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-contro=
l-center_43.2.bb
> similarity index 68%
> rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_42.0.bb
> rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_43.2.bb
> index 6fe999a19..70c58118a 100644
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
42.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
43.2.bb
> @@ -4,46 +4,48 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
>
>  GNOMEBASEBUILDCLASS =3D "meson"
> -
> -inherit gnomebase gsettings gettext vala upstream-version-is-even bash-c=
ompletion features_check
> +GTKIC_VERSION =3D "4"
>
>  DEPENDS =3D " \
> -    gdk-pixbuf-native \
> -    colord-gtk \
> -    udisks2 \
> -    upower \
> -    polkit \
> -    pulseaudio \
>      accountsservice \
> -    samba \
> -    gsettings-desktop-schemas \
> -    gnome-settings-daemon \
> +    colord-gtk \
> +    gcr3 \
> +    gdk-pixbuf \
> +    glib-2.0 \
> +    gnome-bluetooth \
>      gnome-desktop \
>      gnome-online-accounts \
> -    libnma \
> -    gnome-bluetooth \
> -    grilo \
> +    gnome-settings-daemon \
> +    gsettings-desktop-schemas \
> +    gtk4 \
> +    libadwaita \
> +    libepoxy \
>      libgtop \
> -    gsound \
> +    libgudev \
> +    libnma \
>      libpwquality \
> -    libadwaita \
> +    libxml2 \
> +    polkit \
> +    pulseaudio \
> +    samba \
> +    udisks2 \
> +    upower \
>  "
>
> -REQUIRED_DISTRO_FEATURES +=3D "polkit pulseaudio systemd x11"
> +inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-ve=
rsion-is-even bash-completion features_check useradd
> +
> +REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
>
> -SRC_URI[archive.sha256sum] =3D "0732efa7c4171ce0a0ed4106580b4ce35a57b101=
52c0ea36d239134913777eda"
> -SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
> +SRC_URI[archive.sha256sum] =3D "d7f256aba80a92c727b329fd01c8602da4b78f0f=
ddaec93fcd91096964700563"
>
>  PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
>  PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
>  PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
>
> -EXTRA_OEMESON =3D " \
> -    -Doe_sysroot=3D${STAGING_DIR_HOST} \
> -"
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
>
>  do_install:append() {
> -       # If polkit is setup fixup permissions and ownership
>      if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
>          chmod 700 ${D}${datadir}/polkit-1/rules.d
>          chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100302): https://lists.openembedded.org/g/openembedde=
d-devel/message/100302
> Mute This Topic: https://lists.openembedded.org/mt/95938178/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

