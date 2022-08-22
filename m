Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 019CCC28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 05:18:23 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.14852.1661145497278470645
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 22:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gVAJIPV0;
 spf=pass (domain: gmail.com, ip: 209.85.128.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-333b049f231so263251627b3.1
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Aug 2022 22:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=i6uUzLRSntXdiR77GfDhPZqFmI1lmB/4/6CdX29+4NA=;
        b=gVAJIPV0aAOG9z5w6i0vrag722FqBkgsbZ9g1jrOJNYtftGV79u7cCkKRFZYSlsYEb
         mJ89SAeNrHRggqu/2KPDk7n9MhLhKoKuRblQcmjEq3hrDGoFuHhsIc/Q8LZmBdQHeqY9
         Oa+cgOfWJYJ7bPVnzUVbA7QVCGz3rPLmiAVZqInY0am4bGuKEe6RGVW7kV4QGJyQJpUa
         JJBx9ZJ+57XjaJ8p1tf1WxZmQNvZZVe8huKKD1PB6mCXCF0hoDhiA6qSHBgy5TO07OcW
         w18VIUER1rpSx3/Phgpw5do06Z4s3A2+mzJ9bRNCeHLc69SlSpknShzxFnMOmyrOp26O
         rYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=i6uUzLRSntXdiR77GfDhPZqFmI1lmB/4/6CdX29+4NA=;
        b=6aNn9gCs8+0V8gBu8L15nnzdjcc4FoPli6pFtrSBkPOjGBWh1Ti9fgeXF097TM9HeN
         Ql4p9ckN0pCVH2h/BRU+IoT05Cgd73Fgf+2J32bp/UGcCvhTYPrffCfLoylYSQ6Ct1Jm
         4bqvfRv8XST3T12TmVAh4lq5WqvmnYWLB4t49Hv7HFWW6+dA1OszNNWD/yg3evDaAVk5
         AzQhY97Way02qvEYKNyJBsAleRlCGBY2ZuE/I6INgDmUC88m45wCXRIl2M8JCMDvKLqR
         ub6Fah3Ow3ZgEQp3AZ9zKB7yIjEVClWAXF2LR5PR4wvWVbg0/M3UxDLnWMyegGlgn2nD
         dDBw==
X-Gm-Message-State: ACgBeo2hvmgfDrfmlDGE1Tm5jso7nqEnpaqZtowKkCq7jOR3+bPPdfHI
	1+8fah+sWvllaVjpKxMDrupD1RAaxSoMp91aG90=
X-Google-Smtp-Source: 
 AA6agR5RZxkT0zSAK1/TcrA4QPHxc2mGq8yYR94IGNKoRdJrkJszjPK25Yms0zPlMa5KXFg/kTYKAcbEmAQpl7C/Az8=
X-Received: by 2002:a0d:edc2:0:b0:338:957:a719 with SMTP id
 w185-20020a0dedc2000000b003380957a719mr14255015ywe.132.1661145496208; Sun, 21
 Aug 2022 22:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220821140240.123638-1-f_l_k@t-online.de>
In-Reply-To: <20220821140240.123638-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 Aug 2022 22:17:50 -0700
Message-ID: 
 <CAMKF1so_YYOK4KXdfJH=F6G7rOV9a8_9wRr5CkdDVCr6eOJDew@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCHv8] pipewire: update to v0.3.56
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 05:18:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98350

I still see a compile error on mips with latest version of this patch see

https://errors.yoctoproject.org/Errors/Details/669138/

On Sun, Aug 21, 2022 at 7:02 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> Add the configuration to make pipewire work as a drop-in replacement for pulseaudio-server.
>
> Add pipewire-media-session as a standalone recipe, since pipewire would fetch the code as a
> subproject at do_configure.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  .../pipewire/pipewire-media-session_0.4.1.bb  | 25 ++++++++++
>  ...01-avb-fix-compilation-on-big-endian.patch | 27 +++++++++++
>  .../0001-spa-fix-c90-header-include.patch     | 47 -------------------
>  ...{pipewire_0.3.50.bb => pipewire_0.3.56.bb} | 43 ++++++++++++-----
>  4 files changed, 84 insertions(+), 58 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>  create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
>  delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
>  rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb => pipewire_0.3.56.bb} (86%)
>
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> new file mode 100644
> index 000000000..9fdb60380
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> @@ -0,0 +1,25 @@
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
> +SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
> +
> +inherit meson pkgconfig
> +
> +FILES:${PN} += " \
> +       ${systemd_user_unitdir}/pipewire-media-session.service \
> +       ${datadir}/pipewire/media-session.d/* \
> +"
> +
> +RRECOMMENDS:${PN} += "pipewire"
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
> new file mode 100644
> index 000000000..48a1102dc
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
> @@ -0,0 +1,27 @@
> +From 1a5ec4452fa21592eaeeb823ad95a1db6eb60376 Mon Sep 17 00:00:00 2001
> +From: Wim Taymans <wtaymans@redhat.com>
> +Date: Tue, 19 Jul 2022 13:49:42 +0200
> +Subject: [PATCH 001/113] avb: fix compilation on big endian
> +
> +Patch-Status: Backport
> +
> +---
> + src/modules/module-avb/aaf.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/modules/module-avb/aaf.h b/src/modules/module-avb/aaf.h
> +index cb4871ca6..b444ce251 100644
> +--- a/src/modules/module-avb/aaf.h
> ++++ b/src/modules/module-avb/aaf.h
> +@@ -35,7 +35,7 @@ struct avb_packet_aaf {
> +       unsigned gv:1;
> +       unsigned tv:1;
> +
> +-      uint8_t seq_number;
> ++      uint8_t seq_num;
> +
> +       unsigned _r2:7;
> +       unsigned tu:1;
> +--
> +2.34.1
> +
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
> deleted file mode 100644
> index ad6448a10..000000000
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From d3ea3142e1a4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 2001
> -From: psykose <alice@ayaya.dev>
> -Date: Wed, 13 Apr 2022 21:57:49 +0000
> -Subject: [PATCH 001/154] spa: fix c90 header include
> -
> -placing declarations after code is invalid under ISO c90
> -
> -Fixes !1211
> -
> -Patch-Status: Backport
> ----
> - spa/include/spa/utils/string.h | 6 ++++--
> - 1 file changed, 4 insertions(+), 2 deletions(-)
> -
> -diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/string.h
> -index e80434537..43d19616c 100644
> ---- a/spa/include/spa/utils/string.h
> -+++ b/spa/include/spa/utils/string.h
> -@@ -276,10 +276,11 @@ static inline int spa_scnprintf(char *buffer, size_t size, const char *format, .
> - static inline float spa_strtof(const char *str, char **endptr)
> - {
> -       static locale_t locale = NULL;
> -+      locale_t prev;
> -       float v;
> -       if (SPA_UNLIKELY(locale == NULL))
> -               locale = newlocale(LC_ALL_MASK, "C", NULL);
> --      locale_t prev = uselocale(locale);
> -+      prev = uselocale(locale);
> -       v = strtof(str, endptr);
> -       uselocale(prev);
> -       return v;
> -@@ -319,10 +320,11 @@ static inline bool spa_atof(const char *str, float *val)
> - static inline double spa_strtod(const char *str, char **endptr)
> - {
> -       static locale_t locale = NULL;
> -+      locale_t prev;
> -       double v;
> -       if (SPA_UNLIKELY(locale == NULL))
> -               locale = newlocale(LC_ALL_MASK, "C", NULL);
> --      locale_t prev = uselocale(locale);
> -+      prev = uselocale(locale);
> -       v = strtod(str, endptr);
> -       uselocale(prev);
> -       return v;
> ---
> -2.25.1
> -
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> similarity index 86%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> index c176c6eeb..6c6d6a91a 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> @@ -13,10 +13,10 @@ LIC_FILES_CHKSUM = " \
>
>  DEPENDS = "dbus ncurses"
>
> -SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
> +SRCREV = "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
>  SRC_URI = " \
>         git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https \
> -       file://0001-spa-fix-c90-header-include.patch \
> +       file://0001-avb-fix-compilation-on-big-endian.patch \
>  "
>
>  S = "${WORKDIR}/git"
> @@ -62,7 +62,6 @@ EXTRA_OEMESON += " \
>      -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
>      -Dsystemd-system-unit-dir=${systemd_system_unitdir} \
>      -Dsystemd-user-unit-dir=${systemd_user_unitdir} \
> -    -Dvulkan=disabled \
>      -Dman=disabled \
>      -Dsession-managers='[]' \
>      -Dlv2=disabled \
> @@ -72,12 +71,27 @@ EXTRA_OEMESON += " \
>      -Dlegacy-rtkit=false \
>  "
>
> -PACKAGECONFIG:class-target ??= "\
> +# spa alsa plugin code uses typedef redefinition, which is officially a C11 feature.
> +# Pipewire builds with 'c_std=gnu99' by default. Recent versions of gcc don't issue this warning in gnu99
> +# mode but it looks like clang still does
> +CFLAGS:append = " -Wno-typedef-redefinition"
> +
> +# According to wireplumber documentation only one session manager should be installed at a time
> +# Possible options are media-session, which has fewer dependencies but is very simple,
> +# or wireplumber, which is more powerful.
> +PIPEWIRE_SESSION_MANAGER ??= "media-session"
> +
> +FFMPEG_AVAILABLE = "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'ffmpeg', '', d)}"
> +BLUETOOTH_AAC = "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'bluez-aac', '', d)}"
> +
> +PACKAGECONFIG:class-target ??= " \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer', 'gstreamer', '${FFMPEG_AVAILABLE}', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \
> -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez ${BLUETOOTH_AAC}', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
> +    ${PIPEWIRE_SESSION_MANAGER} \
> +    jack libusb pw-cat raop sndfile v4l2 udev volume \
>  "
>
>  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> @@ -96,6 +110,8 @@ PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
>  PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera"
>  PACKAGECONFIG[libcanberra] = "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
>  PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
> +PACKAGECONFIG[media-session] = ",,,pipewire-media-session"
> +PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio"
>  PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
>  PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
>  PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
> @@ -109,8 +125,12 @@ PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=enabled,-Dsyst
>  # currently lacks the feature of enabling user services.
>  PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
>  # pw-cat needs sndfile packageconfig to be enabled
> +PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
>  PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
> +PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
> +PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
>  PACKAGECONFIG[webrtc-echo-cancelling] = "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing"
> +PACKAGECONFIG[wireplumber] = ",,,wireplumber"
>
>  PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
>  PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends "
> @@ -227,10 +247,11 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
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
>  "
>
>  FILES:${PN}-dev += " \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98347): https://lists.openembedded.org/g/openembedded-devel/message/98347
> Mute This Topic: https://lists.openembedded.org/mt/93161862/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

