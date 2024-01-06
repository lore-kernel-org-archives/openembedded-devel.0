Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F13C46CD2
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 19:47:46 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.1216.1704570457263384303
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Jan 2024 11:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout08.t-online.de (Postfix) with SMTP id B0BE410739
	for <openembedded-devel@lists.openembedded.org>; Sat,  6 Jan 2024 20:47:34 +0100 (CET)
Received: from [192.168.178.67] ([84.154.174.51]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rMCdp-3nmKxs0; Sat, 6 Jan 2024 20:47:33 +0100
Date: Sat, 06 Jan 2024 20:47:27 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libplacebo: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <3ZUU6S.4D2P6KFZ7X3W2@t-online.de>
In-Reply-To: <17A7D9AEDE09B8A6.11644@lists.openembedded.org>
References: <17A7D9AEDE09B8A6.11644@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-KFXU7e2vMhqdBIFymeqZ"
X-TOI-EXPURGATEID: 150726::1704570453-BFFFC917-10CCF816/0/0 CLEAN NORMAL
X-TOI-MSGID: 3a14f22b-7156-4959-9101-1e707001ae48
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 06 Jan 2024 19:47:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108065

--=-KFXU7e2vMhqdBIFymeqZ
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 drops the patches that are not needed anymore

On Sat, Jan 6 2024 at 08:45:11 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> libplacebo is a required build dependency for mpv-0.37
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../mplayer/libplacebo_git.bb                 | 24 
> +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 
> meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb 
> b/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
> new file mode 100644
> index 000000000..337ccd23b
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "The core rendering algorithms and ideas of mpv rewritten 
> as an independent library."
> +SECTION = "multimedia"
> +HOMEPAGE = "<https://opensourcelibs.com/lib/libplacebo>"
> +
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da" 
> <file://license;md5=435ed639f84d4585d93824e7da3d85da/>
> +
> +SRC_URI = 
> "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v6.338"
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "2805a0d01c029084ab36bf5d0e3c8742012a0b27"
> +PV = "6.338.1"
> +
> +inherit meson pkgconfig
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'vulkan opengl', d)}"
> +
> +PACKAGECONFIG[vulkan] =  
> "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader vulkan-headers 
> shaderc spirv-shader-generator python3-mako-native 
> python3-jinja2-native glad-native"
> +PACKAGECONFIG[opengl] = 
> "-Dopengl=enabled,-Dopengl=disabled,glad,glad"
> +PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
> +PACKAGECONFIG[demos] = "-Ddemos=true,-Ddemos=false,ffmpeg libsdl2 
> libsdl2-image"
> +
> +EXTRA_OEMESON = 
> "-Dvulkan-registry=${STAGING_DATADIR}/vulkan/registry/vk.xml"
> +
> --
> 2.43.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108064): 
> <https://lists.openembedded.org/g/openembedded-devel/message/108064>
> Mute This Topic: <https://lists.openembedded.org/mt/103566960/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-KFXU7e2vMhqdBIFymeqZ
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 drops the patches that are not needed anymore</div></div><div id="geary-quote" dir="auto"><br>On Sat, Jan 6 2024 at 08:45:11 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">libplacebo is a required build dependency for mpv-0.37

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../mplayer/libplacebo_git.bb                 | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
new file mode 100644
index 000000000..337ccd23b
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_git.bb
@@ -0,0 +1,24 @@
+SUMMARY = "The core rendering algorithms and ideas of mpv rewritten as an independent library."
+SECTION = "multimedia"
+HOMEPAGE = "<a href="https://opensourcelibs.com/lib/libplacebo">https://opensourcelibs.com/lib/libplacebo</a>"
+
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da" "="">file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"</a>
+
+SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v6.338"
+
+S = "${WORKDIR}/git"
+SRCREV = "2805a0d01c029084ab36bf5d0e3c8742012a0b27"
+PV = "6.338.1"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'vulkan opengl', d)}"
+
+PACKAGECONFIG[vulkan] =  "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader vulkan-headers shaderc spirv-shader-generator python3-mako-native python3-jinja2-native glad-native"
+PACKAGECONFIG[opengl] = "-Dopengl=enabled,-Dopengl=disabled,glad,glad"
+PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
+PACKAGECONFIG[demos] = "-Ddemos=true,-Ddemos=false,ffmpeg libsdl2 libsdl2-image"
+
+EXTRA_OEMESON = "-Dvulkan-registry=${STAGING_DATADIR}/vulkan/registry/vk.xml"
+
<div>-- 
</div>2.43.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#108064): <a href="https://lists.openembedded.org/g/openembedded-devel/message/108064">https://lists.openembedded.org/g/openembedded-devel/message/108064</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/103566960/3618223">https://lists.openembedded.org/mt/103566960/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-KFXU7e2vMhqdBIFymeqZ--


