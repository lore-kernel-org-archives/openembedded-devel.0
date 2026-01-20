Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15870D2ECFC
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 01:15:05 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50038.1768871697902904692
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 17:14:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hQI4yKIW;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-793ee375a23so13969977b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 17:14:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768871697; cv=none;
        d=google.com; s=arc-20240605;
        b=ZMR/jsYDzgumXAEgyXpqm4j+ifq90ZyHv2Ms+aF+R/TwqbJyy4Ar64uCV9UiEMBMi5
         YzYCpGX1u7QT4eeAa29CDo+KrvsLtRtvSDQ9tHDLqcc3LQKdkzjGPH3K8O64i2X87uAQ
         Wx2yhAm/E0nvFV2+EQ5RPqahYZIyseuFCXvG4UteJA+1DtzYEFPeLdbvA+U9Cvu0/Rki
         qe27n9j95nvVXA67p5TjyHOnJFXPhOMgbdctys+gNyBcT152RR5rEKDMMo11nZREDgiO
         rtUnG82GM3M3jMBPYIoc22Bi3U5QxgStjY6HCfz/JRZd6+aMN4QxY1nud8KGOhldtFow
         qICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9guqHVxfjGEQRTOFP+Lr6BBjhTWmh7p64/+fmOE5wT0=;
        fh=6hcUKr3duktBY3UgoTWb3oMgRC8h/CdRJUPQi4zxMzQ=;
        b=IJBYUvNojSIUX6Z86URXelRVk7zw13FP16TD3fZBPwUDOpZN3FArxBAQR2xirUDgS1
         eia2FgJvdm8kg7lYaqvPjr8vB5sdPV5pznOwTYO0FLI12xcx7/3FUR+cm08OCT8uaoEL
         yNjHDcFdCyB6pOshPksNzVnbT0CCrt5TsksF4/Wm8FnTs580j4QsZmN31Kl8AsMZaPWv
         7C6FDkc+B6NVXixmpN/gAGs3mVJ3vhKry25BwP/0UcU7Mo+B+Zv9v2nDWLlYFT8Ulfdw
         i2zUPRJg1fnH1hv3x1cBom/BG6LjXwk6QaEOjIFEnlgZfqv9Ga/aEc8Zeoc+07FQ4mzh
         rqhQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768871697; x=1769476497; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9guqHVxfjGEQRTOFP+Lr6BBjhTWmh7p64/+fmOE5wT0=;
        b=hQI4yKIWVRPzUWza1t+s/tgL61MNbvAIP6etwnXwrmpOXGWRaDS4ZQCPceztaU7R4T
         wW5wkFUpCY/0LHgIKU9+Gko1v6r8oCERJAGN16hqAOu8wnOQRqFkqqZnhacgh1dpGpJ9
         /pSlNf1muvRuJ7NPjvHCvpOCBU99DrdLiIQXPWX58+pZcqXKqhQ7KZaakzccdStzp1mY
         odaQ68f3BBJB6lgUU404CHilpOz2GBSA/LJh/i9oTAruaRGegelY+UrFTuULHPketGPJ
         Fo108RqeRHWnHLeh7mpUTbjQpSOpE5SLA2quG9gBWJMs6E+i8x8aaWqkSOr9AjRiKpwp
         eKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768871697; x=1769476497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9guqHVxfjGEQRTOFP+Lr6BBjhTWmh7p64/+fmOE5wT0=;
        b=wq0fZ0D6z90TulnvbXG6U5yde24CwxZAjKw4QEhqgaPmDXmeMeQBrWRs7icW4h4D50
         SZ+TBrG1d8s4PI97ov33NiH+2x90COIQWt4G3oqtgXa9BMLfNZ1fO4WPx0sQ3vYOrcmh
         RMvqiQt2mv1U9Ej110Th9UWO8S/NaHyeUXIY3nLPR3EYD1LDNfmif3EVmiPL42i+P1M1
         ZOHYsVw3GR8Nrbv3HsqWSG+mKzgvq0V/YElTDPxnVQl5hjv5IHxDiLeU3aGcD6GsNKvi
         dWoiuGuJPlKdmdRucnKBvO0ALPme9O3jalIpU5WAPGb/2vcImQRel2WjHrGJigDeiU/D
         NQ6Q==
X-Gm-Message-State: AOJu0Yzmt13yfsHg4CSUax3M3ecK69r83/J7Bg4qMelnKHhnAT1Nk8T5
	1Ie1c2c8Iy3eczjZQ7WBbw/7Tumpful7AaX9Aacvy8sg36HM20ZsDlOpj6A0jUVA0utF4guf+Ed
	aEbbqOlHXQZx/YT6eMbszDodtxWZ9JAA=
X-Gm-Gg: AZuq6aJgbBYsFAKMQX6F6bmL/nTY2Qd6sRFbOras5IZdSzNzkVpHVqEy+8G02lBACIn
	mum/V6h4PRaXFVDlTrNPCZHE6Q0qCOjyXtWDcwk1MsT7dGszN/Oxs2TUN5dpH5eHnI6300nby/h
	bHbbNv8AaQxPpFI96akmgSEsDxrDBT0qEVPHfhNfnwe5J9UCXQ6b2Qe1hlLaOv6ojEp+gzR7fTu
	N9Ryzl6SvY0naLnjCdQUAK3cAV3ea2HGk/TK9Xj3EPzZ5hrtnRzOiUvrsfRCKVEt4DfcLxd0CTt
	P2yIM1+lqnrlpCaoNM21Z5znWtBG7zqnC2wI2omHnLN3lTbvKr0h2xBdCyjFTWC8K2ktwXZRx8D
	LsVw7BVIpgRrS+Wu3hnqFyebnfWKCXkrOLfMnlnkK2WiFz30H3W29FQ==
X-Received: by 2002:a05:690c:dc3:b0:783:6f68:2a05 with SMTP id
 00721157ae682-793c5262618mr107841407b3.14.1768871696770; Mon, 19 Jan 2026
 17:14:56 -0800 (PST)
MIME-Version: 1.0
References: <20260119064555.9286-1-f_l_k@t-online.de>
In-Reply-To: <20260119064555.9286-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Jan 2026 17:14:30 -0800
X-Gm-Features: AZwV_Qjbz3D8AhJGJGNtObeHjKo4laiCWlExs2sSZsioM3mz0q9IMo1fsgU0meU
Message-ID: <CAMKF1sqRzNHpF06gL2jvG0R1UPZk6ehYytmAssmENJtmHeXzsA@mail.gmail.com>
Subject: Re: [meta-gnome][PATCHv2] gnome-settings-daemon: update 48.0 -> 49.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000023acc20648c78906"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 01:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123651

--00000000000023acc20648c78906
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 10:46=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:

> PACKAGECONFIG for wayland,nm have been removed upstream
> PACKAGECONFIG for x11,xwayland have been added upstream
>
> Add a patch to fix reproducibility in gnome-settings-daemon-src
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Translation updates
>
> Power:
> - Avoid xext dependency
>
> Xsettings:
> - Build only if X11 or Xwayland are enabled
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Translation updates
>
> Power:
> - Avoid polling light sensor if ambient light setting is disabled
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.rc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Translation updates
> - Update to GNOME Session changes
>
> Power:
> - Fix check for shell-managed brightness
> - Refactor light sensor enablement
>
> A11y-settings:
> - Manage Orca lifetime
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.beta
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Translation updates
> - Drop dependency on GTK4
> - Add xwayland/x11 build options
>
> Power:
> - Do not treat all notifications as critical
> - Let backlight auto-dimming in control of GNOME Shell
>
> Housekeeping:
> - Add new donation reminder notification
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.alpha.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> Keyboard:
> - Drop keyboard bell GSettings schema leftovers
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.alpha
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Translation updates
> - Update to GTK4
>
> Power:
> - Use new Mutter backlight D-Bus interface
>
> Wacom:
> - Drop support to update per-button OLED screens in Wacom
>   Intuos 4 model with descriptive actions. This tablet model
>     will still be functional, but the tiny screens besides the
>       pad buttons will remain blank.
>
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>       Version 48.1
>       =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>       - Translation updates
>       - Cleanups and fixes
>
>       Power:
>       - Ensure the backlight interface signal gets emitted on startup
>       - Avoid using uninitialized value when restoring brightness
>
>       Sharing:
>       - Fixes to shutdown of sharing services
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...um-types.c.in-fix-reproducibility-is.patch | 41 ++++++++++++++++++
>  ...um-types.c.in-fix-reproducibility-is.patch | 42 +++++++++++++++++++
>  ..._48.0.bb =3D> gnome-settings-daemon_49.1.bb} | 19 +++++----
>  3 files changed, 93 insertions(+), 9 deletions(-)
>  create mode 100644
> meta-gnome/recipes-gnome/gnome-settings-daemon/0001-gsd-smartcard-enum-ty=
pes.c.in-fix-reproducibility-is.patch
>  create mode 100644
> meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001=
-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
>  rename meta-gnome/recipes-gnome/gnome-settings-daemon/{
> gnome-settings-daemon_48.0.bb =3D> gnome-settings-daemon_49.1.bb} (67%)
>
> diff --git
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/0001-gsd-smartcard-enum-=
types.c.in-fix-reproducibility-is.patch
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/0001-gsd-smartcard-enum-=
types.c.in-fix-reproducibility-is.patch
> new file mode 100644
> index 0000000000..d8d9232c98
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/0001-gsd-smartcard-enum-=
types.c.in-fix-reproducibility-is.patch
> @@ -0,0 +1,41 @@
> +From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Thu, 15 Jan 2026 14:33:58 +0100
> +Subject: [PATCH] gsd-smartcard-enum-types.c.in:fix reproducibility issue
> +
>

It needs Upstream-Status
see
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5017895/raw_inlin=
e


> +---
> + plugins/smartcard/gsd-smartcard-enum-types.c.in | 4 ++--
> + plugins/smartcard/gsd-smartcard-enum-types.h.in | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/plugins/smartcard/gsd-smartcard-enum-types.c.in
> b/plugins/smartcard/gsd-smartcard-enum-types.c.in
> +index f281cf4e..0a970105 100644
> +--- a/plugins/smartcard/gsd-smartcard-enum-types.c.in
> ++++ b/plugins/smartcard/gsd-smartcard-enum-types.c.in
> +@@ -5,8 +5,8 @@
> + /*** END file-header ***/
> +
> + /*** BEGIN file-production ***/
> +-#include "@filename@"
> +-/* enumerations from "@filename@" */
> ++#include "@basename@"
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> +
> + /*** BEGIN value-header ***/
> +diff --git a/plugins/smartcard/gsd-smartcard-enum-types.h.in
> b/plugins/smartcard/gsd-smartcard-enum-types.h.in
> +index 79dcc3d8..3906ba4c 100644
> +--- a/plugins/smartcard/gsd-smartcard-enum-types.h.in
> ++++ b/plugins/smartcard/gsd-smartcard-enum-types.h.in
> +@@ -9,7 +9,7 @@ G_BEGIN_DECLS
> +
> + /*** BEGIN file-production ***/
> +
> +-/* enumerations from "@filename@" */
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> +
> + /*** BEGIN value-header ***/
> +--
> +2.52.0
> +
> diff --git
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/00=
01-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/00=
01-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
> new file mode 100644
> index 0000000000..e5429366e4
> --- /dev/null
> +++
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/00=
01-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch
> @@ -0,0 +1,42 @@
> +From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Thu, 15 Jan 2026 14:33:58 +0100
> +Subject: [PATCH] gsd-smartcard-enum-types.c.in:fix reproducibility issue
> +
> +Upstream-Status: Pending
> +---
> + plugins/smartcard/gsd-smartcard-enum-types.c.in | 4 ++--
> + plugins/smartcard/gsd-smartcard-enum-types.h.in | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/plugins/smartcard/gsd-smartcard-enum-types.c.in
> b/plugins/smartcard/gsd-smartcard-enum-types.c.in
> +index f281cf4e..0a970105 100644
> +--- a/plugins/smartcard/gsd-smartcard-enum-types.c.in
> ++++ b/plugins/smartcard/gsd-smartcard-enum-types.c.in
> +@@ -5,8 +5,8 @@
> + /*** END file-header ***/
> +
> + /*** BEGIN file-production ***/
> +-#include "@filename@"
> +-/* enumerations from "@filename@" */
> ++#include "@basename@"
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> +
> + /*** BEGIN value-header ***/
> +diff --git a/plugins/smartcard/gsd-smartcard-enum-types.h.in
> b/plugins/smartcard/gsd-smartcard-enum-types.h.in
> +index 79dcc3d8..3906ba4c 100644
> +--- a/plugins/smartcard/gsd-smartcard-enum-types.h.in
> ++++ b/plugins/smartcard/gsd-smartcard-enum-types.h.in
> +@@ -9,7 +9,7 @@ G_BEGIN_DECLS
> +
> + /*** BEGIN file-production ***/
> +
> +-/* enumerations from "@filename@" */
> ++/* enumerations from "@basename@" */
> + /*** END file-production ***/
> +
> + /*** BEGIN value-header ***/
> +--
> +2.52.0
> +
> diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/
> gnome-settings-daemon_48.0.bb
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/
> gnome-settings-daemon_49.1.bb
> similarity index 67%
> rename from meta-gnome/recipes-gnome/gnome-settings-daemon/
> gnome-settings-daemon_48.0.bb
> rename to meta-gnome/recipes-gnome/gnome-settings-daemon/
> gnome-settings-daemon_49.1.bb
> index 9a2948d432..2125bd91fe 100644
> --- a/meta-gnome/recipes-gnome/gnome-settings-daemon/
> gnome-settings-daemon_48.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/
> gnome-settings-daemon_49.1.bb
> @@ -17,33 +17,34 @@ DEPENDS =3D " \
>      libnotify \
>      upower \
>      libwacom \
> -    virtual/libx11 \
> +    networkmanager \
>  "
>
>  # all these are mandatory
>  REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd
> gobject-introspection-data"
>  GIR_MESON_OPTION =3D ""
>
> -SRC_URI[archive.sha256sum] =3D
> "f3da20ab4a2ba56fd3e97b991f2bc267973d5619bd58bfa516410aa036305e45"
> +SRC_URI +=3D
> "file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch"
> +SRC_URI[archive.sha256sum] =3D
> "2a9957fc4f91c3b9127b49484179bef485120d9c1c208e44d44e6a746e6cc1c1"
>
>  PACKAGECONFIG ??=3D " \
> -    cups nm \
> -    alsa gudev \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11 alsa', d)} \
> +    gudev \
>      smartcard \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
> +    xwayland \
> +    cups \
>  "
>  PACKAGECONFIG[alsa] =3D "-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib"
>  PACKAGECONFIG[cups] =3D "-Dcups=3Dtrue,-Dcups=3Dfalse,cups"
>  PACKAGECONFIG[gudev] =3D "-Dgudev=3Dtrue,-Dgudev=3Dfalse,libgudev"
> -PACKAGECONFIG[nm] =3D
> "-Dnetwork_manager=3Dtrue,-Dnetwork_manager=3Dfalse,networkmanager"
>  PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Dtrue,-Dsmartcard=3Dfalse,nss=
"
> -PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue,-Dwayland=3Dfalse,wayland"
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
> +PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dtrue"
> +PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue,-Dx11=3Dfalse,libx11 libxfixes"
>
>  def gnome_verdir(v):
>     return oe.utils.trim_version(v, 1)
>
> -PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
> -
>  FILES:${PN} +=3D " \
>      ${systemd_user_unitdir} \
>      ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so =
\
> --
> 2.52.0
>
>

--00000000000023acc20648c78906
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 18,=
 2026 at 10:46=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.=
de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">PACKAGECONFIG for wayland,nm have been removed upstrea=
m<br>
PACKAGECONFIG for x11,xwayland have been added upstream<br>
<br>
Add a patch to fix reproducibility in gnome-settings-daemon-src<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.1<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Translation updates<br>
<br>
Power:<br>
- Avoid xext dependency<br>
<br>
Xsettings:<br>
- Build only if X11 or Xwayland are enabled<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.0<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Translation updates<br>
<br>
Power:<br>
- Avoid polling light sensor if ambient light setting is disabled<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.rc<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Translation updates<br>
- Update to GNOME Session changes<br>
<br>
Power:<br>
- Fix check for shell-managed brightness<br>
- Refactor light sensor enablement<br>
<br>
A11y-settings:<br>
- Manage Orca lifetime<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.beta<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Translation updates<br>
- Drop dependency on GTK4<br>
- Add xwayland/x11 build options<br>
<br>
Power:<br>
- Do not treat all notifications as critical<br>
- Let backlight auto-dimming in control of GNOME Shell<br>
<br>
Housekeeping:<br>
- Add new donation reminder notification<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.alpha.1<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
Keyboard:<br>
- Drop keyboard bell GSettings schema leftovers<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Version 49.alpha<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- Translation updates<br>
- Update to GTK4<br>
<br>
Power:<br>
- Use new Mutter backlight D-Bus interface<br>
<br>
Wacom:<br>
- Drop support to update per-button OLED screens in Wacom<br>
=C2=A0 Intuos 4 model with descriptive actions. This tablet model<br>
=C2=A0 =C2=A0 will still be functional, but the tiny screens besides the<br=
>
=C2=A0 =C2=A0 =C2=A0 pad buttons will remain blank.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 =C2=A0 =C2=A0 Version 48.1<br>
=C2=A0 =C2=A0 =C2=A0 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
=C2=A0 =C2=A0 =C2=A0 - Translation updates<br>
=C2=A0 =C2=A0 =C2=A0 - Cleanups and fixes<br>
<br>
=C2=A0 =C2=A0 =C2=A0 Power:<br>
=C2=A0 =C2=A0 =C2=A0 - Ensure the backlight interface signal gets emitted o=
n startup<br>
=C2=A0 =C2=A0 =C2=A0 - Avoid using uninitialized value when restoring brigh=
tness<br>
<br>
=C2=A0 =C2=A0 =C2=A0 Sharing:<br>
=C2=A0 =C2=A0 =C2=A0 - Fixes to shutdown of sharing services<br>
<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
---<br>
=C2=A0...um-types.c.in-fix-reproducibility-is.patch | 41 ++++++++++++++++++=
<br>
=C2=A0...um-types.c.in-fix-reproducibility-is.patch | 42 ++++++++++++++++++=
+<br>
=C2=A0..._<a href=3D"http://48.0.bb" rel=3D"noreferrer" target=3D"_blank">4=
8.0.bb</a> =3D&gt; <a href=3D"http://gnome-settings-daemon_49.1.bb" rel=3D"=
noreferrer" target=3D"_blank">gnome-settings-daemon_49.1.bb</a>} | 19 +++++=
----<br>
=C2=A03 files changed, 93 insertions(+), 9 deletions(-)<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/000=
1-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch<br>
=C2=A0create mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/gno=
me-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-i=
s.patch<br>
=C2=A0rename meta-gnome/recipes-gnome/gnome-settings-daemon/{<a href=3D"htt=
p://gnome-settings-daemon_48.0.bb" rel=3D"noreferrer" target=3D"_blank">gno=
me-settings-daemon_48.0.bb</a> =3D&gt; <a href=3D"http://gnome-settings-dae=
mon_49.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-settings-daemon_49.=
1.bb</a>} (67%)<br>
<br>
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/0001-gsd-smartc=
ard-enum-types.c.in-fix-reproducibility-is.patch b/meta-gnome/recipes-gnome=
/gnome-settings-daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibili=
ty-is.patch<br>
new file mode 100644<br>
index 0000000000..d8d9232c98<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/0001-gsd-smartcard-enu=
m-types.c.in-fix-reproducibility-is.patch<br>
@@ -0,0 +1,41 @@<br>
+From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Thu, 15 Jan 2026 14:33:58 +0100<br>
+Subject: [PATCH] <a href=3D"http://gsd-smartcard-enum-types.c.in" target=
=3D"_blank">gsd-smartcard-enum-types.c.in</a>:fix reproducibility issue<br>
+<br></blockquote><div><br></div><div>It needs Upstream-Status</div><div>se=
e</div><div><a href=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2=
/logs/5017895/raw_inline">https://autobuilder.yoctoproject.org/valkyrie/api=
/v2/logs/5017895/raw_inline</a></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+---<br>
+ plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.c.in" rel=3D=
"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a> | 4 ++--<b=
r>
+ plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.h.in" rel=3D=
"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a> | 2 +-<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.=
c.in" rel=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a=
> b/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.c.in" rel=
=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a><br>
+index f281cf4e..0a970105 100644<br>
+--- a/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.c.in" r=
el=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a><br>
++++ b/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.c.in" r=
el=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a><br>
+@@ -5,8 +5,8 @@<br>
+ /*** END file-header ***/<br>
+ <br>
+ /*** BEGIN file-production ***/<br>
+-#include &quot;@filename@&quot;<br>
+-/* enumerations from &quot;@filename@&quot; */<br>
++#include &quot;@basename@&quot;<br>
++/* enumerations from &quot;@basename@&quot; */<br>
+ /*** END file-production ***/<br>
+ <br>
+ /*** BEGIN value-header ***/<br>
+diff --git a/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.=
h.in" rel=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a=
> b/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.h.in" rel=
=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a><br>
+index 79dcc3d8..3906ba4c 100644<br>
+--- a/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.h.in" r=
el=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a><br>
++++ b/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.h.in" r=
el=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a><br>
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS<br>
+ <br>
+ /*** BEGIN file-production ***/<br>
+ <br>
+-/* enumerations from &quot;@filename@&quot; */<br>
++/* enumerations from &quot;@basename@&quot; */<br>
+ /*** END file-production ***/<br>
+ <br>
+ /*** BEGIN value-header ***/<br>
+-- <br>
+2.52.0<br>
+<br>
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-=
daemon/0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch b/me=
ta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/0001-gsd=
-smartcard-enum-types.c.in-fix-reproducibility-is.patch<br>
new file mode 100644<br>
index 0000000000..e5429366e4<br>
--- /dev/null<br>
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon/=
0001-gsd-smartcard-enum-types.c.in-fix-reproducibility-is.patch<br>
@@ -0,0 +1,42 @@<br>
+From 49df2d7021a68d9fe13ff094e9f564323c7c8556 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Thu, 15 Jan 2026 14:33:58 +0100<br>
+Subject: [PATCH] <a href=3D"http://gsd-smartcard-enum-types.c.in" target=
=3D"_blank">gsd-smartcard-enum-types.c.in</a>:fix reproducibility issue<br>
+<br>
+Upstream-Status: Pending<br>
+---<br>
+ plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.c.in" rel=3D=
"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a> | 4 ++--<b=
r>
+ plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.h.in" rel=3D=
"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a> | 2 +-<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.=
c.in" rel=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a=
> b/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.c.in" rel=
=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a><br>
+index f281cf4e..0a970105 100644<br>
+--- a/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.c.in" r=
el=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a><br>
++++ b/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.c.in" r=
el=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.c.in</a><br>
+@@ -5,8 +5,8 @@<br>
+ /*** END file-header ***/<br>
+ <br>
+ /*** BEGIN file-production ***/<br>
+-#include &quot;@filename@&quot;<br>
+-/* enumerations from &quot;@filename@&quot; */<br>
++#include &quot;@basename@&quot;<br>
++/* enumerations from &quot;@basename@&quot; */<br>
+ /*** END file-production ***/<br>
+ <br>
+ /*** BEGIN value-header ***/<br>
+diff --git a/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.=
h.in" rel=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a=
> b/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.h.in" rel=
=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a><br>
+index 79dcc3d8..3906ba4c 100644<br>
+--- a/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.h.in" r=
el=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a><br>
++++ b/plugins/smartcard/<a href=3D"http://gsd-smartcard-enum-types.h.in" r=
el=3D"noreferrer" target=3D"_blank">gsd-smartcard-enum-types.h.in</a><br>
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS<br>
+ <br>
+ /*** BEGIN file-production ***/<br>
+ <br>
+-/* enumerations from &quot;@filename@&quot; */<br>
++/* enumerations from &quot;@basename@&quot; */<br>
+ /*** END file-production ***/<br>
+ <br>
+ /*** BEGIN value-header ***/<br>
+-- <br>
+2.52.0<br>
+<br>
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/<a href=3D"http=
://gnome-settings-daemon_48.0.bb" rel=3D"noreferrer" target=3D"_blank">gnom=
e-settings-daemon_48.0.bb</a> b/meta-gnome/recipes-gnome/gnome-settings-dae=
mon/<a href=3D"http://gnome-settings-daemon_49.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gnome-settings-daemon_49.1.bb</a><br>
similarity index 67%<br>
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/<a href=3D"http:=
//gnome-settings-daemon_48.0.bb" rel=3D"noreferrer" target=3D"_blank">gnome=
-settings-daemon_48.0.bb</a><br>
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/<a href=3D"http://=
gnome-settings-daemon_49.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-s=
ettings-daemon_49.1.bb</a><br>
index 9a2948d432..2125bd91fe 100644<br>
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/<a href=3D"http://gnom=
e-settings-daemon_48.0.bb" rel=3D"noreferrer" target=3D"_blank">gnome-setti=
ngs-daemon_48.0.bb</a><br>
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/<a href=3D"http://gnom=
e-settings-daemon_49.1.bb" rel=3D"noreferrer" target=3D"_blank">gnome-setti=
ngs-daemon_49.1.bb</a><br>
@@ -17,33 +17,34 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0libnotify \<br>
=C2=A0 =C2=A0 =C2=A0upower \<br>
=C2=A0 =C2=A0 =C2=A0libwacom \<br>
-=C2=A0 =C2=A0 virtual/libx11 \<br>
+=C2=A0 =C2=A0 networkmanager \<br>
=C2=A0&quot;<br>
<br>
=C2=A0# all these are mandatory<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;x11 polkit pulseaudio systemd gobj=
ect-introspection-data&quot;<br>
=C2=A0GIR_MESON_OPTION =3D &quot;&quot;<br>
<br>
-SRC_URI[archive.sha256sum] =3D &quot;f3da20ab4a2ba56fd3e97b991f2bc267973d5=
619bd58bfa516410aa036305e45&quot;<br>
+SRC_URI +=3D &quot;file://0001-gsd-smartcard-enum-types.c.in-fix-reproduci=
bility-is.patch&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;2a9957fc4f91c3b9127b49484179bef485120=
d9c1c208e44d44e6a746e6cc1c1&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot; \<br>
-=C2=A0 =C2=A0 cups nm \<br>
-=C2=A0 =C2=A0 alsa gudev \<br>
+=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;systemd x=
11 alsa&#39;, d)} \<br>
+=C2=A0 =C2=A0 gudev \<br>
=C2=A0 =C2=A0 =C2=A0smartcard \<br>
-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#39;wayland&#=
39;, d)} \<br>
+=C2=A0 =C2=A0 xwayland \<br>
+=C2=A0 =C2=A0 cups \<br>
=C2=A0&quot;<br>
=C2=A0PACKAGECONFIG[alsa] =3D &quot;-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib&q=
uot;<br>
=C2=A0PACKAGECONFIG[cups] =3D &quot;-Dcups=3Dtrue,-Dcups=3Dfalse,cups&quot;=
<br>
=C2=A0PACKAGECONFIG[gudev] =3D &quot;-Dgudev=3Dtrue,-Dgudev=3Dfalse,libgude=
v&quot;<br>
-PACKAGECONFIG[nm] =3D &quot;-Dnetwork_manager=3Dtrue,-Dnetwork_manager=3Df=
alse,networkmanager&quot;<br>
=C2=A0PACKAGECONFIG[smartcard] =3D &quot;-Dsmartcard=3Dtrue,-Dsmartcard=3Df=
alse,nss&quot;<br>
-PACKAGECONFIG[wayland] =3D &quot;-Dwayland=3Dtrue,-Dwayland=3Dfalse,waylan=
d&quot;<br>
+PACKAGECONFIG[systemd] =3D &quot;-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,system=
d&quot;<br>
+PACKAGECONFIG[xwayland] =3D &quot;-Dxwayland=3Dtrue,-Dxwayland=3Dtrue&quot=
;<br>
+PACKAGECONFIG[x11] =3D &quot;-Dx11=3Dtrue,-Dx11=3Dfalse,libx11 libxfixes&q=
uot;<br>
<br>
=C2=A0def gnome_verdir(v):<br>
=C2=A0 =C2=A0 return oe.utils.trim_version(v, 1)<br>
<br>
-PACKAGE_DEBUG_SPLIT_STYLE =3D &quot;debug-without-src&quot;<br>
-<br>
=C2=A0FILES:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_user_unitdir} \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/gnome-settings-daemon-${@gnome_verdir(&quot;$=
{PV}&quot;)}/libgsd.so \<br>
-- <br>
2.52.0<br>
<br>
</blockquote></div></div>

--00000000000023acc20648c78906--

