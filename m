Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F105C25B08
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 19:13:32 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web08.194.1661022808103795404
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Aug 2022 12:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout01.t-online.de (Postfix) with SMTP id AC42353C8
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Aug 2022 21:13:25 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.39.106]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oPTuL-1Y9LGK0; Sat, 20 Aug 2022 21:13:21 +0200
Date: Sat, 20 Aug 2022 21:13:15 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-multimedia][PATCHv7] pipewire: update to v0.3.56
To: openembedded-devel@lists.openembedded.org
Message-Id: <3EHXGR.UXP70SRLD0KW1@t-online.de>
In-Reply-To: <20220820191150.5699-1-f_l_k@t-online.de>
References: <20220820191150.5699-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-d1D4FfY+z3r8ffcAeNij"
X-TOI-EXPURGATEID: 150726::1661022801-01452C5E-2E11CC62/0/0 CLEAN NORMAL
X-TOI-MSGID: b331103e-0bcd-4fb5-a170-6c1ae1f279ed
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Aug 2022 19:13:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98341

--=-d1D4FfY+z3r8ffcAeNij
Content-Type: text/plain; charset=us-ascii; format=flowed

remove dbus from bb.utils.filter since its a hard dependency

Am Sa, 20. Aug 2022 um 21:11:50 +0200 schrieb Markus Volk 
<f_l_k@t-online.de>:
> Add the configuration to make pipewire work as a drop-in replacement 
> for pulseaudio-server.
> 
> Add pipewire-media-session as a standalone recipe, since pipewire 
> would fetch the code as a
> subproject at do_configure.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../pipewire/pipewire-media-session_0.4.1.bb  | 22 +++++++++
>  ...01-avb-fix-compilation-on-big-endian.patch | 27 +++++++++++
>  .../0001-spa-fix-c90-header-include.patch     | 47 
> -------------------
>  ...{pipewire_0.3.50.bb => pipewire_0.3.56.bb} | 43 ++++++++++++-----
>  4 files changed, 81 insertions(+), 58 deletions(-)
>  create mode 100644 
> meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
>  create mode 100644 
> meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
>  delete mode 100644 
> meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
>  rename 
> meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb => 
> pipewire_0.3.56.bb} (87%)
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> new file mode 100644
> index 000000000..5dd1eb160
> --- /dev/null
> +++ 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "PipeWire Media Session is an example session manager for 
> PipeWire"
> +HOMEPAGE = "<https://gitlab.freedesktop.org/pipewire/media-session>"
> +LICENSE = "MIT"
> +
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a" 
> <file://copying;md5=97be96ca4fab23e9657ffa590b931c1a/>
> +
> +DEPENDS = " \
> +	pipewire \
> +	alsa-lib \
> +	dbus \
> +"
> +
> +RRECOMMENDS:${PN} += "pipewire"
> +
> +SRC_URI = 
> "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
> +
> +inherit meson pkgconfig
> +
> +FILES:${PN} += "${libdir} ${datadir}"
> diff --git 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
> new file mode 100644
> index 000000000..48a1102dc
> --- /dev/null
> +++ 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
> @@ -0,0 +1,27 @@
> +From 1a5ec4452fa21592eaeeb823ad95a1db6eb60376 Mon Sep 17 00:00:00 
> 2001
> +From: Wim Taymans <wtaymans@redhat.com <mailto:wtaymans@redhat.com>>
> +Date: Tue, 19 Jul 2022 13:49:42 +0200
> +Subject: [PATCH 001/113] avb: fix compilation on big endian
> +
> +Patch-Status: Backport
> +
> +---
> + src/modules/module-avb/aaf.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/modules/module-avb/aaf.h 
> b/src/modules/module-avb/aaf.h
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
> +--
> +2.34.1
> +
> diff --git 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
> deleted file mode 100644
> index ad6448a10..000000000
> --- 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From d3ea3142e1a4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 
> 2001
> -From: psykose <alice@ayaya.dev <mailto:alice@ayaya.dev>>
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
> -diff --git a/spa/include/spa/utils/string.h 
> b/spa/include/spa/utils/string.h
> -index e80434537..43d19616c 100644
> ---- a/spa/include/spa/utils/string.h
> -+++ b/spa/include/spa/utils/string.h
> -@@ -276,10 +276,11 @@ static inline int spa_scnprintf(char *buffer, 
> size_t size, const char *format, .
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
> -@@ -319,10 +320,11 @@ static inline bool spa_atof(const char *str, 
> float *val)
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
> diff --git 
> a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb 
> b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> similarity index 87%
> rename from 
> meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> rename to 
> meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> index c176c6eeb..421c18fa0 100644
> --- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
> +++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
> @@ -6,6 +6,7 @@ AUTHOR      = "Wim Taymans <wtaymans@redhat.com>"
>  SECTION     = "multimedia"
> 
>  LICENSE = "MIT & LGPL-2.1-or-later & GPL-2.0-only"
> +LICENSE_FLAGS = "commercial"
>  LIC_FILES_CHKSUM = " \
>      file://LICENSE;md5=2158739e172e58dc9ab1bdd2d6ec9c72 
> <file://license;md5=2158739e172e58dc9ab1bdd2d6ec9c72/> \
>      file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a 
> <file://copying;md5=97be96ca4fab23e9657ffa590b931c1a/> \
> @@ -13,10 +14,10 @@ LIC_FILES_CHKSUM = " \
> 
>  DEPENDS = "dbus ncurses"
> 
> -SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
> +SRCREV = "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
>  SRC_URI = " \
>  
> 	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https 
> \
> -	file://0001-spa-fix-c90-header-include.patch 
> <file://0001-spa-fix-c90-header-include.patch/> \
> +	file://0001-avb-fix-compilation-on-big-endian.patch 
> <file://0001-avb-fix-compilation-on-big-endian.patch/> \
>  "
> 
>  S = "${WORKDIR}/git"
> @@ -62,7 +63,6 @@ EXTRA_OEMESON += " \
>      -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
>      -Dsystemd-system-unit-dir=${systemd_system_unitdir} \
>      -Dsystemd-user-unit-dir=${systemd_user_unitdir} \
> -    -Dvulkan=disabled \
>      -Dman=disabled \
>      -Dsession-managers='[]' \
>      -Dlv2=disabled \
> @@ -72,12 +72,26 @@ EXTRA_OEMESON += " \
>      -Dlegacy-rtkit=false \
>  "
> 
> -PACKAGECONFIG:class-target ??= "\
> +# spa alsa plugin code uses typedef redefinition, which is 
> officially a C11 feature.
> +# Pipewire builds with 'c_std=gnu99' by default. Recent versions of 
> gcc don't issue this warning in gnu99
> +# mode but it looks like clang still does
> +CFLAGS:append = " -Wno-typedef-redefinition"
> +
> +# According to wireplumber documentation only one session manager 
> should be installed at a time
> +# Possible options are media-session, which has fewer dependencies 
> but is very simple,
> +# or wireplumber, which is more powerful.
> +PIPEWIRE_SESSION_MANAGER ??= "media-session"
> +
> +BLUETOOTH_AAC = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('LICENSE_FLAGS_ACCEPTED', 'commercial', 
> 'bluez-aac', '', d)}"
> +
> +PACKAGECONFIG:class-target ??= " \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'gstreamer', 
> 'gstreamer', 'ffmpeg', d)} \
>      ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'zeroconf', 'avahi', 
> '', d)} \
> -    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'bluetooth', 
> 'bluez', '', d)} \
> -    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 'systemd 
> systemd-system-service', '', d)} \
> -    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'alsa', d)} \
> -    gstreamer jack libusb pw-cat raop sndfile v4l2 \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'bluetooth', 'bluez 
> ${BLUETOOTH_AAC}', '', d)} \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 'systemd 
> systemd-system-service systemd-user-service', '', d)} \
> +    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'alsa vulkan 
> pulseaudio', d)} \
> +    ${PIPEWIRE_SESSION_MANAGER} \
> +    jack libusb pw-cat raop sndfile v4l2 udev volume \
>  "
> 
>  # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
> @@ -96,6 +110,8 @@ PACKAGECONFIG[jack] = 
> "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
>  PACKAGECONFIG[libcamera] = 
> "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera"
>  PACKAGECONFIG[libcanberra] = 
> "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
>  PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
> +PACKAGECONFIG[media-session] = ",,,pipewire-media-session"
> +PACKAGECONFIG[pulseaudio] = 
> "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio"
>  PACKAGECONFIG[pipewire-alsa] = 
> "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
>  PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled 
> -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
>  PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
> @@ -109,8 +125,12 @@ PACKAGECONFIG[systemd-system-service] = 
> "-Dsystemd-system-service=enabled,-Dsyst
>  # currently lacks the feature of enabling user services.
>  PACKAGECONFIG[systemd-user-service] = 
> "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
>  # pw-cat needs sndfile packageconfig to be enabled
> +PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
>  PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
> +PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
> +PACKAGECONFIG[vulkan] = 
> "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
>  PACKAGECONFIG[webrtc-echo-cancelling] = 
> "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing"
> +PACKAGECONFIG[wireplumber] = ",,,wireplumber"
> 
>  PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
>  PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends "
> @@ -227,10 +247,11 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* 
> ^${PN}-modules.*"
>  SYSTEMD_SERVICE:${PN} = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 
> 'systemd-system-service', 'pipewire.service', '', d)}"
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


--=-d1D4FfY+z3r8ffcAeNij
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>remove dbus from&nbsp;bb.utils.filter since its a hard dependency</div></div><div id="geary-quote" dir="auto"><br>Am Sa, 20. Aug 2022 um 21:11:50 +0200 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Add the configuration to make pipewire work as a drop-in replacement for pulseaudio-server.

Add pipewire-media-session as a standalone recipe, since pipewire would fetch the code as a
subproject at do_configure.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../pipewire/pipewire-media-session_0.4.1.bb  | 22 +++++++++
 ...01-avb-fix-compilation-on-big-endian.patch | 27 +++++++++++
 .../0001-spa-fix-c90-header-include.patch     | 47 -------------------
 ...{pipewire_0.3.50.bb =&gt; pipewire_0.3.56.bb} | 43 ++++++++++++-----
 4 files changed, 81 insertions(+), 58 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_0.3.50.bb =&gt; pipewire_0.3.56.bb} (87%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
new file mode 100644
index 000000000..5dd1eb160
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_0.4.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "PipeWire Media Session is an example session manager for PipeWire"
+HOMEPAGE = "<a href="https://gitlab.freedesktop.org/pipewire/media-session">https://gitlab.freedesktop.org/pipewire/media-session</a>"
+LICENSE = "MIT"
+
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a" "="">file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a"</a>
+
+DEPENDS = " \
+	pipewire \
+	alsa-lib \
+	dbus \
+"
+
+RRECOMMENDS:${PN} += "pipewire"
+
+SRC_URI = "git://gitlab.freedesktop.org/pipewire/media-session.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+SRCREV = "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
+
+inherit meson pkgconfig
+
+FILES:${PN} += "${libdir} ${datadir}"
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
new file mode 100644
index 000000000..48a1102dc
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-avb-fix-compilation-on-big-endian.patch
@@ -0,0 +1,27 @@
+From 1a5ec4452fa21592eaeeb823ad95a1db6eb60376 Mon Sep 17 00:00:00 2001
+From: Wim Taymans &lt;<a href="mailto:wtaymans@redhat.com">wtaymans@redhat.com</a>&gt;
+Date: Tue, 19 Jul 2022 13:49:42 +0200
+Subject: [PATCH 001/113] avb: fix compilation on big endian
+
+Patch-Status: Backport
+
+---
+ src/modules/module-avb/aaf.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/modules/module-avb/aaf.h b/src/modules/module-avb/aaf.h
+index cb4871ca6..b444ce251 100644
+--- a/src/modules/module-avb/aaf.h
++++ b/src/modules/module-avb/aaf.h
+@@ -35,7 +35,7 @@ struct avb_packet_aaf {
+ 	unsigned gv:1;
+ 	unsigned tv:1;
+ 
+-	uint8_t seq_number;
++	uint8_t seq_num;
+ 
+ 	unsigned _r2:7;
+ 	unsigned tu:1;
+-- 
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch b/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
deleted file mode 100644
index ad6448a10..000000000
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire/0001-spa-fix-c90-header-include.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d3ea3142e1a4de206e616bc18f63a529e6b4986a Mon Sep 17 00:00:00 2001
-From: psykose &lt;<a href="mailto:alice@ayaya.dev">alice@ayaya.dev</a>&gt;
-Date: Wed, 13 Apr 2022 21:57:49 +0000
-Subject: [PATCH 001/154] spa: fix c90 header include
-
-placing declarations after code is invalid under ISO c90
-
-Fixes !1211
-
-Patch-Status: Backport
----
- spa/include/spa/utils/string.h | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/spa/include/spa/utils/string.h b/spa/include/spa/utils/string.h
-index e80434537..43d19616c 100644
---- a/spa/include/spa/utils/string.h
-+++ b/spa/include/spa/utils/string.h
-@@ -276,10 +276,11 @@ static inline int spa_scnprintf(char *buffer, size_t size, const char *format, .
- static inline float spa_strtof(const char *str, char **endptr)
- {
- 	static locale_t locale = NULL;
-+	locale_t prev;
- 	float v;
- 	if (SPA_UNLIKELY(locale == NULL))
- 		locale = newlocale(LC_ALL_MASK, "C", NULL);
--	locale_t prev = uselocale(locale);
-+	prev = uselocale(locale);
- 	v = strtof(str, endptr);
- 	uselocale(prev);
- 	return v;
-@@ -319,10 +320,11 @@ static inline bool spa_atof(const char *str, float *val)
- static inline double spa_strtod(const char *str, char **endptr)
- {
- 	static locale_t locale = NULL;
-+	locale_t prev;
- 	double v;
- 	if (SPA_UNLIKELY(locale == NULL))
- 		locale = newlocale(LC_ALL_MASK, "C", NULL);
--	locale_t prev = uselocale(locale);
-+	prev = uselocale(locale);
- 	v = strtod(str, endptr);
- 	uselocale(prev);
- 	return v;
--- 
-2.25.1
-
diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
similarity index 87%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
index c176c6eeb..421c18fa0 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.50.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_0.3.56.bb
@@ -6,6 +6,7 @@ AUTHOR      = "Wim Taymans &lt;wtaymans@redhat.com&gt;"
 SECTION     = "multimedia"
 
 LICENSE = "MIT &amp; LGPL-2.1-or-later &amp; GPL-2.0-only"
+LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = " \
     <a href="file://LICENSE;md5=2158739e172e58dc9ab1bdd2d6ec9c72">file://LICENSE;md5=2158739e172e58dc9ab1bdd2d6ec9c72</a> \
     <a href="file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a">file://COPYING;md5=97be96ca4fab23e9657ffa590b931c1a</a> \
@@ -13,10 +14,10 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus ncurses"
 
-SRCREV = "64cf5e80e6240284e6b757907b900507fe56f1b5"
+SRCREV = "f274e53d25ee8f483ac6fce9e516bb1830abe88b"
 SRC_URI = " \
 	git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=master;protocol=https \
-	<a href="file://0001-spa-fix-c90-header-include.patch">file://0001-spa-fix-c90-header-include.patch</a> \
+	<a href="file://0001-avb-fix-compilation-on-big-endian.patch">file://0001-avb-fix-compilation-on-big-endian.patch</a> \
 "
 
 S = "${WORKDIR}/git"
@@ -62,7 +63,6 @@ EXTRA_OEMESON += " \
     -Dudevrulesdir=${nonarch_base_libdir}/udev/rules.d/ \
     -Dsystemd-system-unit-dir=${systemd_system_unitdir} \
     -Dsystemd-user-unit-dir=${systemd_user_unitdir} \
-    -Dvulkan=disabled \
     -Dman=disabled \
     -Dsession-managers='[]' \
     -Dlv2=disabled \
@@ -72,12 +72,26 @@ EXTRA_OEMESON += " \
     -Dlegacy-rtkit=false \
 "
 
-PACKAGECONFIG:class-target ??= "\
+# spa alsa plugin code uses typedef redefinition, which is officially a C11 feature.
+# Pipewire builds with 'c_std=gnu99' by default. Recent versions of gcc don't issue this warning in gnu99
+# mode but it looks like clang still does
+CFLAGS:append = " -Wno-typedef-redefinition"
+
+# According to wireplumber documentation only one session manager should be installed at a time
+# Possible options are media-session, which has fewer dependencies but is very simple,
+# or wireplumber, which is more powerful.
+PIPEWIRE_SESSION_MANAGER ??= "media-session"
+
+BLUETOOTH_AAC = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('LICENSE_FLAGS_ACCEPTED', 'commercial', 'bluez-aac', '', d)}"
+
+PACKAGECONFIG:class-target ??= " \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'gstreamer', 'gstreamer', 'ffmpeg', d)} \
     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
-    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service', '', d)} \
-    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'alsa', d)} \
-    gstreamer jack libusb pw-cat raop sndfile v4l2 \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'bluetooth', 'bluez ${BLUETOOTH_AAC}', '', d)} \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'systemd systemd-system-service systemd-user-service', '', d)} \
+    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'alsa vulkan pulseaudio', d)} \
+    ${PIPEWIRE_SESSION_MANAGER} \
+    jack libusb pw-cat raop sndfile v4l2 udev volume \
 "
 
 # "jack" and "pipewire-jack" packageconfigs cannot be both enabled,
@@ -96,6 +110,8 @@ PACKAGECONFIG[jack] = "-Djack=enabled,-Djack=disabled,jack,,,pipewire-jack"
 PACKAGECONFIG[libcamera] = "-Dlibcamera=enabled,-Dlibcamera=disabled,libcamera"
 PACKAGECONFIG[libcanberra] = "-Dlibcanberra=enabled,-Dlibcanberra=disabled,libcanberra"
 PACKAGECONFIG[libusb] = "-Dlibusb=enabled,-Dlibusb=disabled,libusb"
+PACKAGECONFIG[media-session] = ",,,pipewire-media-session"
+PACKAGECONFIG[pulseaudio] = "-Dlibpulse=enabled,-Dlibpulse=disabled,pulseaudio"
 PACKAGECONFIG[pipewire-alsa] = "-Dpipewire-alsa=enabled,-Dpipewire-alsa=disabled,alsa-lib"
 PACKAGECONFIG[pipewire-jack] = "-Dpipewire-jack=enabled -Dlibjack-path=${libdir}/${PW_MODULE_SUBDIR}/jack,-Dpipewire-jack=disabled,jack,,,jack"
 PACKAGECONFIG[pw-cat] = "-Dpw-cat=enabled,-Dpw-cat=disabled"
@@ -109,8 +125,12 @@ PACKAGECONFIG[systemd-system-service] = "-Dsystemd-system-service=enabled,-Dsyst
 # currently lacks the feature of enabling user services.
 PACKAGECONFIG[systemd-user-service] = "-Dsystemd-user-service=enabled,-Dsystemd-user-service=disabled,systemd"
 # pw-cat needs sndfile packageconfig to be enabled
+PACKAGECONFIG[udev] = "-Dudev=enabled,-Dudev=disabled,udev"
 PACKAGECONFIG[v4l2] = "-Dv4l2=enabled,-Dv4l2=disabled,udev"
+PACKAGECONFIG[volume] = "-Dvolume=enabled,-Dvolume=disabled"
+PACKAGECONFIG[vulkan] = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-headers vulkan-loader"
 PACKAGECONFIG[webrtc-echo-cancelling] = "-Decho-cancel-webrtc=enabled,-Decho-cancel-webrtc=disabled,webrtc-audio-processing"
+PACKAGECONFIG[wireplumber] = ",,,wireplumber"
 
 PACKAGESPLITFUNCS:prepend = " split_dynamic_packages "
 PACKAGESPLITFUNCS:append = " set_dynamic_metapkg_rdepends "
@@ -227,10 +247,11 @@ PACKAGES_DYNAMIC = "^${PN}-spa-plugins.* ^${PN}-modules.*"
 SYSTEMD_SERVICE:${PN} = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'systemd-system-service', 'pipewire.service', '', d)}"
 CONFFILES:${PN} += "${datadir}/pipewire/pipewire.conf"
 FILES:${PN} = " \
-    ${datadir}/pipewire/pipewire.conf \
-    ${systemd_system_unitdir}/pipewire.* \
-    ${systemd_user_unitdir}/pipewire.* \
+    ${datadir}/pipewire \
+    ${systemd_system_unitdir}/pipewire* \
+    ${systemd_user_unitdir}/pipewire* \
     ${bindir}/pipewire \
+    ${bindir}/pipewire-avb \
 "
 
 FILES:${PN}-dev += " \
<div>-- 
</div>2.34.1

</div></blockquote></div>
--=-d1D4FfY+z3r8ffcAeNij--


