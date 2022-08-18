Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F09AC32773
	for <webhook@archiver.kernel.org>; Thu, 18 Aug 2022 17:54:23 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web08.45428.1660845257433333102
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 10:54:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SqUmCy8n;
 spf=pass (domain: gmail.com, ip: 209.85.128.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-3378303138bso21454217b3.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Aug 2022 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=sqqjQRLik9x0NkhT/rjIfgVvDKQd1ZFJB/BeZ+wz2EE=;
        b=SqUmCy8nRHvYaLOSqeJaCAzleOrdm+WwaysyfRmlUfMi62VUShLwgIPxh/ma0iYhRO
         bsF/a/64iYVTMeEI7rQd/k/naxSU3GgbG7vhP64jd/y5lc1ehxWSDyvLasCEjJhlKGZT
         y8LDU39u8dcrCzOteGuc2ZsYMFY1RwH+o82EmR2hMPd/9yZlpGqCUPuHPqETZ8uAtPMJ
         sJtxgBOYuGDDYngMrpnl4fJYKzeJ6uvsmRCGmoNEAzHsSXKFIxRBjSntphfC/11s1neK
         DLBK6XuE4Vk6Rd02LiIApUVAgEgXhUaEZDALT6imyETEKcEpquGjX2UUJmD8gMtW/9VL
         oftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=sqqjQRLik9x0NkhT/rjIfgVvDKQd1ZFJB/BeZ+wz2EE=;
        b=kjs2R4ci2/Fio8nOPZCbHeCtKvzmy7yFWSmZC5Aq9SbUZZfiJ0NXtutPS/YZTnXEk7
         VxYSQqunL6FhbFSzLMkEvJ5SgM9F7DynueHgmOg7W41ZIHVid3weJu1NytDkGY4zyRfg
         osA3e/v/0W0aV4+B7WSRKbEI9xS75ilXpre3LhOhYVcpl5ggZD2p2X7QXpkMddI8pUsJ
         JSCWGupxps6QcRAKI2GUbFcd3FLTP71np7lZKvko1zimcuXPgsgz0U3smONfhGOVC/go
         eFwCvr0qyXCRItDQRDclpgfyDxpngz7ART6HKqETtvXd7XE4ua6FgRemkoAVigxIYdzW
         pa/w==
X-Gm-Message-State: ACgBeo0bgGMf0+5bQDqjl234gOh8b933fh5R0TZrro2ZcN9nbt2k+hd3
	jWnl0/tZRcvjdp4C0LF13DTcpgLopRYQdjeNBNCnZ8HcLpy7Ow==
X-Google-Smtp-Source: 
 AA6agR4nTwL/Im/JfTCx87/QPnx3fE8uHVtpLa8c2PrWR3CUHf+VkXczKI8QjVRQHiIRqa6aHZ7boNj7q4SeGXbWdSs=
X-Received: by 2002:a81:1b84:0:b0:335:f95d:f4de with SMTP id
 b126-20020a811b84000000b00335f95df4demr4143618ywb.422.1660845256430; Thu, 18
 Aug 2022 10:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220817194843.5200-1-f_l_k@t-online.de>
In-Reply-To: <20220817194843.5200-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Aug 2022 10:53:49 -0700
Message-ID: 
 <CAMKF1squzMiys8PALRz6JceDNx_UzxLGyOaMHfoKiOuQPt2=7g@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH] pipewire: update to v0.3.56
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Aug 2022 17:54:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98318

We have some issues with this w.r.t licenses

ERROR: Nothing PROVIDES 'fdk-aac' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
DEPENDS on or otherwise requires it)
fdk-aac was skipped: because it has a restricted license 'commercial'.
Which is not listed in LICENSE_FLAGS_ACCEPTED
ERROR: Nothing RPROVIDES 'pipewire-media-session-dev' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-media-session-dev'
NOTE: Runtime target 'pipewire-media-session-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pipewire-media-session-dev']
ERROR: Nothing RPROVIDES 'pipewire-media-session' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb,
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-media-session'
NOTE: Runtime target 'pipewire-media-session' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pipewire-media-session']
ERROR: Nothing RPROVIDES 'pipewire' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb,
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb,
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire'
NOTE: Runtime target 'pipewire' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pipewire']
ERROR: Nothing RPROVIDES 'wireplumber-scripts' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'wireplumber-scripts'
NOTE: Runtime target 'wireplumber-scripts' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['wireplumber-scripts']
ERROR: Nothing RPROVIDES 'wireplumber-dev' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'wireplumber-dev'
NOTE: Runtime target 'wireplumber-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['wireplumber-dev']
ERROR: Nothing RPROVIDES 'wireplumber-modules-meta' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'wireplumber-modules-meta'
NOTE: Runtime target 'wireplumber-modules-meta' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['wireplumber-modules-meta']
ERROR: Nothing RPROVIDES 'wireplumber' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.9.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'wireplumber'
NOTE: Runtime target 'wireplumber' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['wireplumber']
ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-pulse' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-modules-protocol-pulse'
NOTE: Runtime target 'pipewire-modules-protocol-pulse' is unbuildable,
removing...
Missing or unbuildable dependency chain was: ['pipewire-modules-protocol-pulse']
ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-meta' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-spa-plugins-meta'
NOTE: Runtime target 'pipewire-spa-plugins-meta' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pipewire-spa-plugins-meta']
ERROR: Nothing RPROVIDES 'pipewire-modules-protocol-native' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-modules-protocol-native'
NOTE: Runtime target 'pipewire-modules-protocol-native' is
unbuildable, removing...
Missing or unbuildable dependency chain was:
['pipewire-modules-protocol-native']
ERROR: Nothing RPROVIDES 'pipewire-spa-plugins-support' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-spa-plugins-support'
NOTE: Runtime target 'pipewire-spa-plugins-support' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pipewire-spa-plugins-support']
ERROR: Nothing RPROVIDES 'pipewire-modules-meta' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-modules-meta'
NOTE: Runtime target 'pipewire-modules-meta' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pipewire-modules-meta']
ERROR: Nothing RPROVIDES 'pipewire-dev' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-dev'
NOTE: Runtime target 'pipewire-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pipewire-dev']
ERROR: Nothing RPROVIDES 'pipewire-modules-client-node' (but
/mnt/b/yoe/master/sources/meta-openembedded/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'pipewire-modules-client-node'
NOTE: Runtime target 'pipewire-modules-client-node' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['pipewire-modules-client-node']

On Wed, Aug 17, 2022 at 12:48 PM Markus Volk <f_l_k@t-online.de> wrote:
>
> Add the configuration to make pipewire work as a drop-in replacement for pulseaudio-server.
>
> Add pipewire-media-session as a standalone recipe, since pipewire would fetch the code as a
> subproject at do_configure.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pipewire/pipewire-media-session_0.4.1.bb  | 22 +++++++++++++++
>  ...{pipewire_0.3.50.bb => pipewire_0.3.56.bb} | 27 ++++++++++++-------
>  2 files changed, 40 insertions(+), 9 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb => pipewire_0.3.56.bb} (93%)
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> new file mode 100644
> index 000000000..bec911fc5
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "PipeWire Media Session is an example session manager for PipeWire"
> +HOMEPAGE = "https://gitlab.freedesktop.org/pipewire/media-session"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a"
> +
> +DEPENDS = " \
> +       pipewire \
> +       alsa-lib \
> +       dbus \
> +"
> +
> +RDEPENDS:${PN} = "pipewire"
> +
> +SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
> +
> +inherit meson pkgconfig
> +
> +FILES:${PN} += "${libdir} ${datadir}"
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> similarity index 93%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> index c176c6eeb..7a913d5f9 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> @@ -13,10 +13,9 @@ LIC_FILES_CHKSUM = " \
>
>  DEPENDS = "dbus ncurses"
>
> -SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
> +SRCREV = "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
>  SRC_URI = " \
>         git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https \
> -       file://0001-spa-fix-c90-header-include.patch \
>  "
>
>  S = "${WORKDIR}/git"
> @@ -73,11 +72,12 @@ EXTRA_OEMESON += " \
>  "
>
>  PACKAGECONFIG:class-target ??= "\
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'gstreamer', 'ffmpeg', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \
> -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez bluez-aac', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa dbus vulkan pulseaudio', d)} \
> +    jack libusb pw-cat raop sndfile v4l2 udev volume \
>  "
>
>  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> @@ -96,6 +96,7 @@ PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
>  PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera"
>  PACKAGECONFIG[libcanberra] = "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
>  PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
> +PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio"
>  PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
>  PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
>  PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
> @@ -109,7 +110,10 @@ PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=enabled,-Dsyst
>  # currently lacks the feature of enabling user services.
>  PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
>  # pw-cat needs sndfile packageconfig to be enabled
> +PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
>  PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
> +PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
> +PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
>  PACKAGECONFIG[webrtc-echo-cancelling] = "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing"
>
>  PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
> @@ -227,10 +231,15 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
>  SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd-system-service', 'pipewire.service', '', d)}"
>  CONFFILES:${PN} += "${datadir}/pipewire/pipewire.conf"
>  FILES:${PN} = " \
> -    ${datadir}/pipewire/pipewire.conf \
> -    ${systemd_system_unitdir}/pipewire.* \
> -    ${systemd_user_unitdir}/pipewire.* \
> +    ${datadir}/pipewire \
> +    ${systemd_system_unitdir}/pipewire* \
> +    ${systemd_user_unitdir}/pipewire* \
>      ${bindir}/pipewire \
> +    ${bindir}/pipewire-avb \
> +"
> +
> +RRECOMMENDS:${PN} += " \
> +    ${PN}-media-session \
>  "
>
>  FILES:${PN}-dev += " \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98312): https://lists.openembedded.org/g/openembedded-devel/message/98312
> Mute This Topic: https://lists.openembedded.org/mt/93090043/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

