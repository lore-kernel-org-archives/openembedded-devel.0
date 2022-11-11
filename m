Return-Path: <crg7475@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC231C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 11:01:22 +0000 (UTC)
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by mx.groups.io with SMTP id smtpd.web12.4222.1668164471797818708
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Nov 2022 03:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=Tayw0VIy;
 spf=pass (domain: mailbox.org, ip: 80.241.56.151, mailfrom: crg7475@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4N7wjs3CDWz9sQx
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 12:01:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1668164465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8wDFVpCW19989b3jFi6ncW4ufXaU3/n0hbVLGbyjwck=;
	b=Tayw0VIyXnZUPq/PhgsNib+l6bx97G3S7wUfB8tYhkF7sL9usuiAKfPsUyUBd/g1HlUTi2
	lVhMLaXrySVQdT6xJiHNAcs1U7AnkksVm66r4HMLLm5GqtGhzYd8v6RmFqS8yKm9162vxD
	ewuK6wrP4LwdcYru5ea19OBfp0a53j6wi/v+0dKY8/U0ME+Jy5tN7WcIoaPW+ovgMA04bq
	6GskopI77l9M0vsHn7cJReILyUs9/IIH6wcAHtpdnmeIAcKtpEY9+gzbA0QEaJzurUF6SY
	8jQKgFtz0SDRsU/Z/2pmEn/+1x2ISxlWnE7ZHQJ812cIZ5oswVwCBTReqrOyZg==
Message-ID: <8c1dd697-ddee-d297-fc92-fe59391ff7a3@mailbox.org>
Date: Fri, 11 Nov 2022 12:01:03 +0100
MIME-Version: 1.0
Subject: Re: [oe] [meta-multimedia][PATCHv12] pipewire: update to v0.3.56
To: openembedded-devel@lists.openembedded.org
References: <20220822171940.4736-1-f_l_k@t-online.de>
Content-Language: en-US
From: Carlos Rafael Giani <crg7475@mailbox.org>
In-Reply-To: <20220822171940.4736-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 8d38a5ee04e56ebed22
X-MBO-RS-META: kw5yp3am3g94fw94587hn4rqm3hixogy
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Nov 2022 11:01:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99555

Is there a reason for adding the wireplumber packageconfig?

Wireplumber already exists as a separate recipe. Also, media-session is 
deprecated and not supposed to be used anymore.

On 22.08.22 19:19, Markus Volk wrote:
> Add the configuration to make pipewire work as a drop-in replacement for pulseaudio-server.
>
> Add pipewire-media-session as a standalone recipe, since pipewire would fetch the code as a
> subproject at do_configure.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   .../pipewire/pipewire-media-session_0.4.1.bb  | 25 +++++++++
>   ...01-avb-fix-compilation-on-big-endian.patch | 53 +++++++++++++++++++
>   .../0001-spa-fix-c90-header-include.patch     | 47 ----------------
>   ...{pipewire_0.3.50.bb => pipewire_0.3.56.bb} | 53 ++++++++++++++-----
>   4 files changed, 117 insertions(+), 61 deletions(-)
>   create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>   create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
>   delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
>   rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb => pipewire_0.3.56.bb} (85%)
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
> +	pipewire \
> +	alsa-lib \
> +	dbus \
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
> +	${systemd_user_unitdir}/pipewire-media-session.service \
> +	${datadir}/pipewire/media-session.d/* \
> +"
> +
> +RRECOMMENDS:${PN} += "pipewire"
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
> new file mode 100644
> index 000000000..fc618b4a7
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
> @@ -0,0 +1,53 @@
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
> + 	unsigned gv:1;
> + 	unsigned tv:1;
> +
> +-	uint8_t seq_number;
> ++	uint8_t seq_num;
> +
> + 	unsigned _r2:7;
> + 	unsigned tu:1;
> +diff --git a/src/modules/module-avb/iec61883.h b/src/modules/module-avb/iec61883.h
> +index d3b3a7daa..6ca8724ad 100644
> +--- a/src/modules/module-avb/iec61883.h
> ++++ b/src/modules/module-avb/iec61883.h
> +@@ -37,7 +37,7 @@ struct avb_packet_iec61883 {
> + 	unsigned gv:1;
> + 	unsigned tv:1;
> +
> +-	uint8_t seq_number;
> ++	uint8_t seq_num;
> +
> + 	unsigned _r2:7;
> + 	unsigned tu:1;
> +diff --git a/spa/plugins/avb/avbtp/packets.h b/spa/plugins/avb/avbtp/packets.h
> +index 7047456bf..3d4a652ee 100644
> +--- a/spa/plugins/avb/avbtp/packets.h
> ++++ b/spa/plugins/avb/avbtp/packets.h
> +@@ -116,7 +116,7 @@ struct spa_avbtp_packet_aaf {
> + 	unsigned gv:1;
> + 	unsigned tv:1;
> +
> +-	uint8_t seq_number;
> ++	uint8_t seq_num;
> +
> + 	unsigned _r2:7;
> + 	unsigned tu:1;
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
> - 	static locale_t locale = NULL;
> -+	locale_t prev;
> - 	float v;
> - 	if (SPA_UNLIKELY(locale == NULL))
> - 		locale = newlocale(LC_ALL_MASK, "C", NULL);
> --	locale_t prev = uselocale(locale);
> -+	prev = uselocale(locale);
> - 	v = strtof(str, endptr);
> - 	uselocale(prev);
> - 	return v;
> -@@ -319,10 +320,11 @@ static inline bool spa_atof(const char *str, float *val)
> - static inline double spa_strtod(const char *str, char **endptr)
> - {
> - 	static locale_t locale = NULL;
> -+	locale_t prev;
> - 	double v;
> - 	if (SPA_UNLIKELY(locale == NULL))
> - 		locale = newlocale(LC_ALL_MASK, "C", NULL);
> --	locale_t prev = uselocale(locale);
> -+	prev = uselocale(locale);
> - 	v = strtod(str, endptr);
> - 	uselocale(prev);
> - 	return v;
> ---
> -2.25.1
> -
> diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> similarity index 85%
> rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> index c176c6eeb..6c88e99f9 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> @@ -13,10 +13,10 @@ LIC_FILES_CHKSUM = " \
>   
>   DEPENDS = "dbus ncurses"
>   
> -SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
> +SRCREV = "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
>   SRC_URI = " \
>   	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https \
> -	file://0001-spa-fix-c90-header-include.patch \
> +	file://0001-avb-fix-compilation-on-big-endian.patch \
>   "
>   
>   S = "${WORKDIR}/git"
> @@ -62,7 +62,6 @@ EXTRA_OEMESON += " \
>       -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
>       -Dsystemd-system-unit-dir=${systemd_system_unitdir} \
>       -Dsystemd-user-unit-dir=${systemd_user_unitdir} \
> -    -Dvulkan=disabled \
>       -Dman=disabled \
>       -Dsession-managers='[]' \
>       -Dlv2=disabled \
> @@ -72,12 +71,26 @@ EXTRA_OEMESON += " \
>       -Dlegacy-rtkit=false \
>   "
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
>       ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service', '', d)} \
> -    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa', d)} \
> -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez ${BLUETOOTH_AAC}', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
> +    ${PIPEWIRE_SESSION_MANAGER} \
> +    ${FFMPEG_AVAILABLE} gstreamer jack libusb pw-cat raop sndfile v4l2 udev volume \
>   "
>   
>   # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> @@ -85,17 +98,19 @@ PACKAGECONFIG:class-target ??= "\
>   # libjack.so* files, thus colliding with the libpack package. This
>   # is why these two are marked in their respective packageconfigs
>   # as being in conflict.
> -PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib udev"
> +PACKAGECONFIG[alsa] = "-Dalsa=enabled,-Dalsa=disabled,alsa-lib udev,,pipewire-alsa pipewire-alsa-card-profile"
>   PACKAGECONFIG[avahi] = "-Davahi=enabled,-Davahi=disabled,avahi"
>   PACKAGECONFIG[bluez] = "-Dbluez5=enabled,-Dbluez5=disabled,bluez5 sbc"
>   PACKAGECONFIG[bluez-aac] = "-Dbluez5-codec-aac=enabled,-Dbluez5-codec-aac=disabled,fdk-aac"
>   PACKAGECONFIG[docs] = "-Ddocs=enabled,-Ddocs=disabled,doxygen-native graphviz-native"
>   PACKAGECONFIG[ffmpeg] = "-Dffmpeg=enabled,-Dffmpeg=disabled,ffmpeg"
> -PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base"
> +PACKAGECONFIG[gstreamer] = "-Dgstreamer=enabled,-Dgstreamer=disabled,glib-2.0 gstreamer1.0 gstreamer1.0-plugins-base,,gstreamer1.0-pipewire"
>   PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
> -PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera"
> +PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera libdrm"
>   PACKAGECONFIG[libcanberra] = "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
>   PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
> +PACKAGECONFIG[media-session] = ",,,pipewire-media-session"
> +PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio,,pipewire-pulse"
>   PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
>   PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
>   PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
> @@ -109,8 +124,12 @@ PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=enabled,-Dsyst
>   # currently lacks the feature of enabling user services.
>   PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
>   # pw-cat needs sndfile packageconfig to be enabled
> +PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
>   PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
> +PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
> +PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
>   PACKAGECONFIG[webrtc-echo-cancelling] = "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing"
> +PACKAGECONFIG[wireplumber] = ",,,wireplumber"
>   
>   PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
>   PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends "
> @@ -227,10 +246,16 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
>   SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'systemd-system-service', 'pipewire.service', '', d)}"
>   CONFFILES:${PN} += "${datadir}/pipewire/pipewire.conf"
>   FILES:${PN} = " \
> -    ${datadir}/pipewire/pipewire.conf \
> -    ${systemd_system_unitdir}/pipewire.* \
> -    ${systemd_user_unitdir}/pipewire.* \
> +    ${datadir}/pipewire \
> +    ${systemd_system_unitdir}/pipewire* \
> +    ${systemd_user_unitdir}/pipewire* \
>       ${bindir}/pipewire \
> +    ${bindir}/pipewire-avb \
> +"
> +
> +RRECOMMENDS:${PN}:class-target += " \
> +	pipewire-modules-meta \
> +	pipewire-spa-plugins-meta \
>   "
>   
>   FILES:${PN}-dev += " \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98375): https://lists.openembedded.org/g/openembedded-devel/message/98375
> Mute This Topic: https://lists.openembedded.org/mt/93186419/3617253
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [crg7475@mailbox.org]
> -=-=-=-=-=-=-=-=-=-=-=-
>

