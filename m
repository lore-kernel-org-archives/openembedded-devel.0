Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A611C19F4E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 22:37:46 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web11.3198.1713998264382486259
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Apr 2024 15:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cYONs7AK;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5aa4204bacdso223487eaf.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 15:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713998263; x=1714603063; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QMXy92Z6pJBP76ux9rzfQ7YMvCEUAr3Svce5yrE6gU=;
        b=cYONs7AKHkOBSnLBRnYmsnACJnIgJXdxQvDdFWfVzBPfhQ2emRJ8w82muDckzChCs2
         Vv2rddjWfKXekgujQSfwXDJ06FPOfLKUHAZCGAAvO99Yg36kpzXATRJbnxZtkSQlbNcN
         9HKZmtLcGsyVyRqKHoRZb6LsggR78VqbAAdKEdBksvodc9w3Ka/EGKVDhgF69MYKzsRT
         8Xrk3th7QAs+IU5radZdyVGNmvibrwl1JmcSWzqpeqFrm+j3DueSozMpo57eRNMUlsES
         UDYi6w0yolHnCnom6t79Eoxhh3184jODpNUta6p6vDu6CnI5ZK/iZYzUnxDGCFib1N1H
         IDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713998263; x=1714603063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QMXy92Z6pJBP76ux9rzfQ7YMvCEUAr3Svce5yrE6gU=;
        b=hh4SAWxpenRpn+vVDxkM2pfB1UvCjkiqN19EEghcB3M3Dwp9y2MgKgLtC7FV3/UVkP
         FPWdoWIUf9WgWMaAARBzgr7qRunE2KBk00ooURnzJV+pYZsm3gDZslHKAiO/gnn0Nv2H
         9EioBU0ih7BYtGdJOGm7TMV9ftujR4M+2fAYHAi8fbqxsQUtYuBZucTGPGsNhyIwmqng
         hvugYQOFNfCniWQg7RBxzrbE85eq3Siu0Pb5S66MUuKlo5SHyNHXoU+l+GwRiqzPqrg2
         Md2nas7l31VBT+rcgQzRFfS3/Et+qzL9M77XDMTNDB1JRJvK3xO1DN92lTaHJUprG/WS
         U+7g==
X-Gm-Message-State: AOJu0YxqnZ+baimO3WoNOt0x7UMn276CJwc8Yh/e9wcXVk+Ro8sFaDvh
	CV7JpxFNeSVjH3sKyqHI5/ycGNEb2BiMELUYlx2j2XsaNWoHjNKHhUcA/YqKfMYpTxOSpd+kXt3
	7DdJHap4+03zi4Heo94v4dBYX2qxZKW9CTdA=
X-Google-Smtp-Source: AGHT+IGbAEEggkSa1Ur/jum7zpznEc8Lu4bKFIZRB9ayklKMES9TCZZpUKpUXYSzQDDZU5byoUDgXy02dx21sBUH2t8=
X-Received: by 2002:a05:6870:d1c1:b0:239:43b3:23a9 with SMTP id
 b1-20020a056870d1c100b0023943b323a9mr4342676oac.15.1713998263568; Wed, 24 Apr
 2024 15:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240424133310.3660-1-f_l_k@t-online.de>
In-Reply-To: <20240424133310.3660-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 25 Apr 2024 00:37:15 +0200
Message-ID: <CAMKF1spG7wOvoSBsUjDA4fn6BbRYZ7pSE04TeZEA4XjAtNMXbA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-control-center: update 46.0.1 -> 46.1
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Apr 2024 22:37:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110142

I can apply either v1 or v2, Can you rebase on top of master-next and
resend please.

On Wed, Apr 24, 2024 at 3:32=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> - add PACKAGECONFIGS for file-share and media-share
>
> 46.1
>
> * Accessibility
>  - Improve accessibility of "Typing" settings sliders
>
> * Display
>  - Fix crash when pressing Escape in the display settings
>
> * Network
>  - Add stable-ssid support for cloned-mac
>
> * Privacy
>  - Add build option to enable Location services
>  - Fix opening of Help pages while viewing Privacy settings
>
> * Sharing
>  - Auto hide Sharing panel when Rygel AND gnome-user-share are not availa=
ble
>
> * System
>  - Don't show auto-timezone setting when Location services unavailable
>  - Avoid unnecessary time-change requests
>  - Fix issue with sensitivity of "Add" and "Enroll" Enterprise Login butt=
ons
>  - Improve generated passwords capacity in Remote Desktop settings
>
> * Wacom
>  - Check for the right output connector name
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../0001-Add-meson-option-to-pass-sysroot.patch     | 13 +++++--------
>  ...enter_46.0.1.bb =3D> gnome-control-center_46.1.bb} |  9 ++++-----
>  2 files changed, 9 insertions(+), 13 deletions(-)
>  rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_46.0.1.bb =3D> gnome-control-center_46.1.bb} (87%)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-gno=
me/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-=
sysroot.patch
> index 4ae923f87..7d17817bc 100644
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
> +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
> @@ -1,4 +1,4 @@
> -From 1a48df2a8da44410bbd767c2420d363f6180c79a Mon Sep 17 00:00:00 2001
> +From 8e542784b8ca49c655df0f251a1a1dec724a522e Mon Sep 17 00:00:00 2001
>  From: Markus Volk <f_l_k@t-online.de>
>  Date: Mon, 18 Mar 2024 05:50:21 +0100
>  Subject: [PATCH] Add meson option to pass sysroot
> @@ -13,16 +13,16 @@ Upstream-Status: Inappropriate [OE specific]
>   3 files changed, 3 insertions(+), 2 deletions(-)
>
>  diff --git a/meson_options.txt b/meson_options.txt
> -index e53d6e3f3..8fae4c824 100644
> +index f415a7e..8966632 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -1,3 +1,4 @@
>  +option('oe_sysroot', type: 'string', value: '', description: 'Directory=
 for OE-sysroot')
>   option('deprecated-declarations', type: 'feature', value: 'disabled', d=
escription: 'build with deprecated declaration warnings')
>   option('documentation', type: 'boolean', value: false, description: 'bu=
ild documentation')
> - option('ibus', type: 'boolean', value: true, description: 'build with I=
Bus support')
> + option('location-services', type: 'feature', value: 'disabled', descrip=
tion: 'build with location services')
>  diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
> -index 6ced050f9..df1f80896 100644
> +index 6ced050..df1f808 100644
>  --- a/panels/background/meson.build
>  +++ b/panels/background/meson.build
>  @@ -24,7 +24,7 @@ common_sources +=3D gnome.mkenums_simple(
> @@ -35,7 +35,7 @@ index 6ced050f9..df1f80896 100644
>
>   common_sources +=3D gnome.mkenums(
>  diff --git a/panels/system/meson.build b/panels/system/meson.build
> -index 4fee82210..979332a0e 100644
> +index 4fee822..979332a 100644
>  --- a/panels/system/meson.build
>  +++ b/panels/system/meson.build
>  @@ -73,7 +73,7 @@ sources +=3D gnome.compile_resources(
> @@ -47,6 +47,3 @@ index 4fee82210..979332a0e 100644
>     'datetime/cc-datetime-page.h'
>   )
>
> ---
> -2.44.0
> -
> diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.0.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.1.bb
> similarity index 87%
> rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_46.0.1.bb
> rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_46.1.bb
> index de11239ed..87daec0c2 100644
> --- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.0.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
> @@ -37,16 +37,15 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings =
gettext upstream-version-is
>
>  REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
>
> -SRC_URI =3D "gitsm://gitlab.gnome.org/GNOME/gnome-control-center.git;pro=
tocol=3Dhttps;nobranch=3D1"
>  SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
> -
> -S =3D "${WORKDIR}/git"
> -SRCREV =3D "005f40dcfa464f113a1c95f97673bc5505fc15ad"
> +SRC_URI[archive.sha256sum] =3D "81792423019deda1d2a074c1ecf6a7e6ef3172c0=
9cbe6f4d7995a4b5dea28312"
>
>  PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
>  PACKAGECONFIG[cups] =3D ",,cups,cups"
>  PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
>  PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
> +PACKAGECONFIG[file-share] =3D ",,,gnome-user-share"
> +PACKAGECONFIG[media-share] =3D ",,,rygel-meta tumbler"
>
>  EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
>
> @@ -72,4 +71,4 @@ FILES:${PN} +=3D " \
>
>  FILES:${PN}-dev +=3D "${datadir}/gettext"
>
> -RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'gnome=
-user-share', '' , d)}"
> +RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110129): https://lists.openembedded.org/g/openembedde=
d-devel/message/110129
> Mute This Topic: https://lists.openembedded.org/mt/105709901/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

