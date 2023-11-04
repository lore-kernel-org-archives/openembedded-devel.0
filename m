Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51B6C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 15:58:05 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.12135.1699113485008577378
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 08:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id CEB456947
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 16:58:02 +0100 (CET)
Received: from [192.168.178.62] ([84.163.35.165]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzJ29-1Y6am00; Sat, 4 Nov 2023 16:58:01 +0100
Date: Sat, 04 Nov 2023 16:58:24 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-multimedia][PATCHv2] openal-soft: Upgrade 1.20.1 ->
 1.23.1
To: openembedded-devel@lists.openembedded.org
Message-Id: <CDWL3S.0449NE6UN53Q@t-online.de>
In-Reply-To: <179476A6C0B9A837.26468@lists.openembedded.org>
References: <179476A6C0B9A837.26468@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3jS4ifsigxuTpIVhE/Uu"
X-TOI-EXPURGATEID: 150726::1699113481-4D288D65-B4ABDCA2/0/0 CLEAN NORMAL
X-TOI-MSGID: 866f672b-9feb-48ed-8f5f-f75e48687ebb
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 15:58:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106376

--=-3jS4ifsigxuTpIVhE/Uu
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 removes unneeded dependencies for examples

On Sat, Nov 4 2023 at 04:57:16 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../openal/openal-soft_1.20.1.bb              | 24 
> -------------------
>  .../openal/openal-soft_1.23.1.bb              | 23 ++++++++++++++++++
>  2 files changed, 23 insertions(+), 24 deletions(-)
>  delete mode 100644 
> meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
>  create mode 100644 
> meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
> 
> diff --git 
> a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb 
> b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
> deleted file mode 100644
> index ad7000572..000000000
> --- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -SUMMARY = "OpenAL is a cross-platform 3D audio API"
> -HOMEPAGE = "<http://kcat.strangesoft.net/openal.html>"
> -LICENSE = "GPL-2.0-only"
> -LIC_FILES_CHKSUM = 
> "file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e" 
> <file://copying;md5=0f159f19f9377e1895fbb477d5a7953e/>
> -
> -inherit cmake pkgconfig
> -
> -SRCREV = "f5e0eef34db3a3ab94b61a2f99f84f078ba947e7"
> -SRC_URI = 
> "git://github.com/kcat/openal-soft;branch=master;protocol=https \
> -           file://0001-Use-BUILD_CC-to-compile-native-tools.patch 
> <file://0001-use-build_cc-to-compile-native-tools.patch/> \
> -           file://0002-makehrtf-Disable-Wstringop-truncation.patch 
> <file://0002-makehrtf-disable-wstringop-truncation.patch/> \
> -           "
> -
> -S = "${WORKDIR}/git"
> -
> -PACKAGECONFIG ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
> -PACKAGECONFIG[alsa] = "-DALSA=TRUE, -DALSA=FALSE, alsa-lib"
> -PACKAGECONFIG[pulseaudio] = "-DPULSEAUDIO=TRUE, -DPULSEAUDIO=FALSE, 
> pulseaudio"
> -# currently doesn't work with libav-9
> -# PKG_CHECK_MODULES(FFMPEG libavcodec>=53.61.100 
> libavformat>=53.32.100 libavutil>=51.35.100)
> -# but alffmpeg.c:418:44: error: 'AV_CH_LAYOUT_MONO' undeclared 
> (first use in this function)
> -PACKAGECONFIG[examples] = "-DEXAMPLES=TRUE, -DEXAMPLES=FALSE, libav"
> -
> -FILES:${PN} += "${datadir}/openal"
> diff --git 
> a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb 
> b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
> new file mode 100644
> index 000000000..83745703f
> --- /dev/null
> +++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "OpenAL is a cross-platform 3D audio API"
> +HOMEPAGE = "<http://kcat.strangesoft.net/openal.html>"
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = 
> "file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e" 
> <file://copying;md5=0f159f19f9377e1895fbb477d5a7953e/>
> +
> +inherit cmake pkgconfig
> +
> +DEPENDS = "zlib libsndfile1"
> +
> +SRCREV = "d3875f333fb6abe2f39d82caca329414871ae53b"
> +SRC_URI = 
> "git://github.com/kcat/openal-soft.git;protocol=https;branch=master"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'alsa pipewire 
> pulseaudio', d)}"
> +PACKAGECONFIG[alsa] = 
> "-DALSOFT_BACKEND_ALSA=ON,-DALSOFT_BACKEND_ALSA=OFF,alsa-lib"
> +PACKAGECONFIG[oss] = 
> "-DALSOFT_BACKEND_OSS=ON,-DALSOFT_BACKEND_OSS=OFF"
> +PACKAGECONFIG[pulseaudio] = 
> "-DALSOFT_BACKEND_PULSEAUDIO=ON,-DALSOFT_BACKEND_PULSEAUDIO=OFF,pulseaudio"
> +PACKAGECONFIG[pipewire] = 
> "-DALSOFT_BACKEND_PIPEWIRE=ON,-DALSOFT_BACKEND_PIPEWIRE=OFF,pipewire"
> +PACKAGECONFIG[examples] = 
> "-DALSOFT_EXAMPLES=ON,-DALSOFT_EXAMPLES=OFF"
> +PACKAGECONFIG[sdl2] = 
> "-DALSOFT_BACKEND_SDL2=ON,-DALSOFT_BACKEND_SDL2=OFF,libsdl2 ffmpeg"
> +
> +FILES:${PN} += "${datadir}"
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106375): 
> <https://lists.openembedded.org/g/openembedded-devel/message/106375>
> Mute This Topic: <https://lists.openembedded.org/mt/102385826/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-3jS4ifsigxuTpIVhE/Uu
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 removes unneeded dependencies for examples</div></div><div id="geary-quote" dir="auto"><br>On Sat, Nov 4 2023 at 04:57:16 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../openal/openal-soft_1.20.1.bb              | 24 -------------------
 .../openal/openal-soft_1.23.1.bb              | 23 ++++++++++++++++++
 2 files changed, 23 insertions(+), 24 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb

diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
deleted file mode 100644
index ad7000572..000000000
--- a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.20.1.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "OpenAL is a cross-platform 3D audio API"
-HOMEPAGE = "<a href="http://kcat.strangesoft.net/openal.html">http://kcat.strangesoft.net/openal.html</a>"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e" "="">file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e"</a>
-
-inherit cmake pkgconfig
-
-SRCREV = "f5e0eef34db3a3ab94b61a2f99f84f078ba947e7"
-SRC_URI = "git://github.com/kcat/openal-soft;branch=master;protocol=https \
-           <a href="file://0001-Use-BUILD_CC-to-compile-native-tools.patch">file://0001-Use-BUILD_CC-to-compile-native-tools.patch</a> \
-           <a href="file://0002-makehrtf-Disable-Wstringop-truncation.patch">file://0002-makehrtf-Disable-Wstringop-truncation.patch</a> \
-           "
-
-S = "${WORKDIR}/git"
-
-PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'alsa pulseaudio', d)}"
-PACKAGECONFIG[alsa] = "-DALSA=TRUE, -DALSA=FALSE, alsa-lib"
-PACKAGECONFIG[pulseaudio] = "-DPULSEAUDIO=TRUE, -DPULSEAUDIO=FALSE, pulseaudio"
-# currently doesn't work with libav-9
-# PKG_CHECK_MODULES(FFMPEG libavcodec&gt;=53.61.100 libavformat&gt;=53.32.100 libavutil&gt;=51.35.100)
-# but alffmpeg.c:418:44: error: 'AV_CH_LAYOUT_MONO' undeclared (first use in this function)
-PACKAGECONFIG[examples] = "-DEXAMPLES=TRUE, -DEXAMPLES=FALSE, libav"
-
-FILES:${PN} += "${datadir}/openal"
diff --git a/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
new file mode 100644
index 000000000..83745703f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openal/openal-soft_1.23.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "OpenAL is a cross-platform 3D audio API"
+HOMEPAGE = "<a href="http://kcat.strangesoft.net/openal.html">http://kcat.strangesoft.net/openal.html</a>"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e" "="">file://COPYING;md5=0f159f19f9377e1895fbb477d5a7953e"</a>
+
+inherit cmake pkgconfig
+
+DEPENDS = "zlib libsndfile1"
+
+SRCREV = "d3875f333fb6abe2f39d82caca329414871ae53b"
+SRC_URI = "git://github.com/kcat/openal-soft.git;protocol=https;branch=master"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'alsa pipewire pulseaudio', d)}"
+PACKAGECONFIG[alsa] = "-DALSOFT_BACKEND_ALSA=ON,-DALSOFT_BACKEND_ALSA=OFF,alsa-lib"
+PACKAGECONFIG[oss] = "-DALSOFT_BACKEND_OSS=ON,-DALSOFT_BACKEND_OSS=OFF"
+PACKAGECONFIG[pulseaudio] = "-DALSOFT_BACKEND_PULSEAUDIO=ON,-DALSOFT_BACKEND_PULSEAUDIO=OFF,pulseaudio"
+PACKAGECONFIG[pipewire] = "-DALSOFT_BACKEND_PIPEWIRE=ON,-DALSOFT_BACKEND_PIPEWIRE=OFF,pipewire"
+PACKAGECONFIG[examples] = "-DALSOFT_EXAMPLES=ON,-DALSOFT_EXAMPLES=OFF"
+PACKAGECONFIG[sdl2] = "-DALSOFT_BACKEND_SDL2=ON,-DALSOFT_BACKEND_SDL2=OFF,libsdl2 ffmpeg"
+
+FILES:${PN} += "${datadir}"
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#106375): <a href="https://lists.openembedded.org/g/openembedded-devel/message/106375">https://lists.openembedded.org/g/openembedded-devel/message/106375</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102385826/3618223">https://lists.openembedded.org/mt/102385826/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-3jS4ifsigxuTpIVhE/Uu--


