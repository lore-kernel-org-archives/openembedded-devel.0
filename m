Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B653C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 18:08:04 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.2194.1712081274640831753
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 11:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HSGPmMIu;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-34100f4f9a2so3744291f8f.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 11:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712081273; x=1712686073; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PeakYXwe8FemwZCFN+2lr4/kFaXd7F/XQetqNENDVs=;
        b=HSGPmMIubLrlsNP+O+0kZqN2/RhPWz2WD+3yejlXHe3DBDtvd3x355G6ea9fyDjTNa
         xGjDVBZLtAgNE8q9UAbZp37KFcTiX1A734ZaPyI5kQDxfURBrOZ0H0380Wz/OxvGdS06
         0qyQ0lb929kEjmbA6fLKZZmr2fnjsPvU1vIuK0r4xPKIs/9nbGpHnkJ+h0jscQiNtcqy
         OhJ2al074T34wlIdJTEL/HxdlEvY69BqYogzBNH5rQGSxxIjtd7ifuXLXTlv7BCZYP9P
         /egw48vOGY/J7fXXEBQePmRJmiNugMPmdeOTFrRc3jpvtRWTt72OIFDb/zvVKYRLSl+8
         2FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712081273; x=1712686073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3PeakYXwe8FemwZCFN+2lr4/kFaXd7F/XQetqNENDVs=;
        b=qoj2touQQMkYun4/OzeYAXJWKs+B/vkcEV7jHSkVS13PSNaXR9zhXs7uq6P3JtQTGu
         e4BgWm3CdGoHFjhDBhThomF0NIHWCq/xezU3z3Nu+3aaELQTlqsD+oiVINFO55EoOqJt
         d2u+2rddKUNQD9/UJBT9riNwCM6rJR4XOi+xAeWVxcyNyqvfUzTVgCs2ijIqqkmVcqPD
         hkCGkWqQ9EY/8uUzCbpCHmKE9QK4Rgci6uJSp13XeKcd6mkqxyNqZIHBiRzg9taNQUAn
         LJcjLZKJ5b2SoUmxVxzNSni/mbGUyCUfI02tRcIZnkrFX9geJ58uFR7sqwagd7qFfQT5
         ucsA==
X-Gm-Message-State: AOJu0YwEnzCr3RKgxQpG3hYQVmRfmAKiFMpMuU8iL4Xdcd69OFv8p66U
	QN1mrpZaligue7rpFVP+qz5vy6OXelPpXlLi2Xt0//HwWPnFsBuS5eLL2N7MLaHPuuhG33Ckdm7
	gxjJJfdf7Jlekt0CxKhbhy1RQFkc=
X-Google-Smtp-Source: AGHT+IFxK/dcJNAs5bRYg7RM8HzTguWhBZMvvVK+jQxT3Mg95bBfM3CflFN1cvlt5xNhyGl4tciad3p2tcll6z4n7cU=
X-Received: by 2002:adf:ee4c:0:b0:343:8455:58d6 with SMTP id
 w12-20020adfee4c000000b00343845558d6mr385231wro.26.1712081272666; Tue, 02 Apr
 2024 11:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240318171204.30153-1-f_l_k@t-online.de>
In-Reply-To: <20240318171204.30153-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 2 Apr 2024 20:07:33 +0200
Message-ID: <CA+chaQeLAEKSWHxy72ufUTMXf-amUmLEsmJFjjwfc6Bb9e11DQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH 1/2] gnome-control-center: update 45.3 -> 46.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 18:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109786

Please restore
Upstream-Status: Inappropriate [OE specific]

in the meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0=
001-Add-meson-option-to-pass-sysroot.patch

On Mon, Mar 18, 2024 at 6:11=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...001-Add-meson-option-to-pass-sysroot.patch | 51 ++++++++-----------
>  ...r_45.3.bb =3D> gnome-control-center_46.0.bb} |  2 +-
>  2 files changed, 23 insertions(+), 30 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_45.3.bb =3D> gnome-control-center_46.0.bb} (95%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-gno=
me/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-=
sysroot.patch
> index 7cd7c0469..a2c237c18 100644
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
> +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
> @@ -1,57 +1,50 @@
> -From ba8aebe1259ae3f7f5a4827e5a47bb95c568b218 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> -Date: Tue, 21 May 2019 16:07:46 +0200
> +From 1a48df2a8da44410bbd767c2420d363f6180c79a Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 18 Mar 2024 05:50:21 +0100
>  Subject: [PATCH] Add meson option to pass sysroot
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
>
> -We need to pass this to meson to help it finding gdesktop-enums.h:
> -
> -| panels/background/meson.build:38:0: ERROR: File /usr/include/gsettings=
-desktop-schemas/gdesktop-enums.h does not exist.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
>  ---
>   meson_options.txt             | 1 +
>   panels/background/meson.build | 2 +-
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> + panels/system/meson.build     | 2 +-
> + 3 files changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/meson_options.txt b/meson_options.txt
> -index 8ee7b6e0e..7e6adc668 100644
> +index e53d6e3f3..8fae4c824 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -1,3 +1,4 @@
>  +option('oe_sysroot', type: 'string', value: '', description: 'Directory=
 for OE-sysroot')
> + option('deprecated-declarations', type: 'feature', value: 'disabled', d=
escription: 'build with deprecated declaration warnings')
>   option('documentation', type: 'boolean', value: false, description: 'bu=
ild documentation')
>   option('ibus', type: 'boolean', value: true, description: 'build with I=
Bus support')
> - option('privileged_group', type: 'string', value: 'wheel', description:=
 'name of group that has elevated permissions')
>  diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
> -index 9bf543538..97f1e0117 100644
> +index 6ced050f9..df1f80896 100644
>  --- a/panels/background/meson.build
>  +++ b/panels/background/meson.build
> -@@ -19,7 +19,7 @@ common_sources =3D []
> +@@ -24,7 +24,7 @@ common_sources +=3D gnome.mkenums_simple(
>
>   enums =3D 'gdesktop-enums-types'
>   enums_header =3D files(
> --  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h',
> -+  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> -   'cc-background-item.h'
> +-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h'
> ++  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h'
>   )
>
> -diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
> -index 8cb3b63f0..8c5a45e7c 100644
> ---- a/panels/datetime/meson.build
> -+++ b/panels/datetime/meson.build
> -@@ -37,7 +37,7 @@ sources =3D files(
> + common_sources +=3D gnome.mkenums(
> +diff --git a/panels/system/meson.build b/panels/system/meson.build
> +index 4fee82210..979332a0e 100644
> +--- a/panels/system/meson.build
> ++++ b/panels/system/meson.build
> +@@ -73,7 +73,7 @@ sources +=3D gnome.compile_resources(
> + )
>
> - enums =3D 'gdesktop-enums-types'
>   enums_header =3D files(
>  -  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/g=
settings-desktop-schemas/gdesktop-enums.h',
>  +  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconf=
ig: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> -   'cc-datetime-panel.h'
> +   'datetime/cc-datetime-page.h'
>   )
>
>  --
> -2.34.1
> +2.44.0
> +
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-contro=
l-center_46.0.bb
> similarity index 95%
> rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_45.3.bb
> rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_46.0.bb
> index 96fe9c9ff..53643c680 100644
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.3.bb
> +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.bb
> @@ -38,7 +38,7 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
>  REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
>
>  SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
> -SRC_URI[archive.sha256sum] =3D "b1e949c4e86c0624ec6a6ed0df09c9fae2b22983=
c1dca60ed86aec8ef0b24004"
> +SRC_URI[archive.sha256sum] =3D "25f67de05897868b2e97eaa0ecc986a408af08d4=
985c8a9da44f0d7bd8fea7a4"
>
>  PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
>  PACKAGECONFIG[cups] =3D ",,cups,cups"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109407): https://lists.openembedded.org/g/openembedde=
d-devel/message/109407
> Mute This Topic: https://lists.openembedded.org/mt/105007539/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [m=
artin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

