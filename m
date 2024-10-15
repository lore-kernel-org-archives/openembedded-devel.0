Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D464D1815E
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 00:36:57 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.2103.1728952610863880314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 17:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 475FB2D410;
	Tue, 15 Oct 2024 02:36:49 +0200 (CEST)
Received: from [192.168.178.67] ([79.219.230.111]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t0VYJ-4PVt4K0; Tue, 15 Oct 2024 02:36:43 +0200
Date: Tue, 15 Oct 2024 02:38:46 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2 2/2] libplacebo: dont use gitsm
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <MGGDLS.DG417TWA6BZ1@t-online.de>
In-Reply-To: <17FE791DE787812C.27606@lists.openembedded.org>
References: <20241015003627.1014058-1-f_l_k@t-online.de>
	<17FE791DE787812C.27606@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-G3OiNTjogOzr3eQC+qnv"
X-TOI-EXPURGATEID: 150726::1728952603-C77FC5E0-F7DDF5B3/0/0 CLEAN NORMAL
X-TOI-MSGID: 69107e9a-574c-46a2-b904-4408daa5333e
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 00:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112915

--=-G3OiNTjogOzr3eQC+qnv
Content-Type: text/plain; charset=us-ascii; format=flowed

I have successfully built this for Clang

On Tue, Oct 15 2024 at 02:36:27 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> - Add PACKAGECONFIGs to allow build according to DISTRO_FEATURES
> - Add path to vulkan-registry
> - Add fastfloat dependency for clang
> - Build with lcms by default, because mpv warns about missing 
> littlecms2
>   support
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../mplayer/libplacebo_7.349.0.bb             | 28 
> +++++++++----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb 
> b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
> index b68e67a8c..f0f18f2e4 100644
> --- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
> @@ -1,22 +1,22 @@
>  SUMMARY ="Reusable library for GPU-accelerated video/image rendering 
> primitives"
> -LICENSE = "Apache-2.0 & BSD-3-Clause & BSL-1.0 & MIT"
> -LIC_FILES_CHKSUM = 
> "<file://3rdparty/Vulkan-Headers/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57> 
> \
> -                    
> <file://3rdparty/fast_float/LICENSE-APACHE;md5=81db248e90379bcfc0582b578b009bc3> 
> \
> -                    
> <file://3rdparty/fast_float/LICENSE-BOOST;md5=2c7a3fa82e66676005cd4ee2608fd7d2> 
> \
> -                    
> <file://3rdparty/fast_float/LICENSE-MIT;md5=32b11d50c7d9788d4270f6a83f3e68eb> 
> \
> -                    
> <file://3rdparty/glad/LICENSE;md5=ae570f26774ac096cff8f992091a223c> \
> -                    
> <file://3rdparty/jinja/LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462> 
> \
> -                    
> <file://3rdparty/jinja/docs/license.rst;md5=5f4c795946979fabc2361be4c70d0a9f> 
> \
> -                    
> <file://3rdparty/markupsafe/LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75> 
> \
> -                    
> <file://3rdparty/markupsafe/docs/license.rst;md5=5f4c795946979fabc2361be4c70d0a9f> 
> \
> -                    
> file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da 
> <file://license;md5=435ed639f84d4585d93824e7da3d85da/> \
> -                    
> <file://demos/3rdparty/nuklear/src/LICENSE;md5=6052431ae6cd4f0082276c54996e7770> 
> \
> -                    
> file://demos/LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032" 
> <file://demos/LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032>
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da" 
> <file://license;md5=435ed639f84d4585d93824e7da3d85da/>
> 
> -SRC_URI = 
> "gitsm://github.com/haasn/libplacebo;protocol=https;branch=master"
> +DEPENDS += "fastfloat"
> 
> +SRC_URI = 
> "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.349"
>  SRCREV = "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
> 
>  inherit meson pkgconfig
> 
>  S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'vulkan opengl', d)} 
> lcms"
> +
> +PACKAGECONFIG[vulkan] =  
> "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader vulkan-headers 
> shaderc spirv-shader-generator python3-mako-native 
> python3-jinja2-native glad-native"
> +PACKAGECONFIG[glslang] = 
> "-Dglslang=enabled,-Dglslang=disabled,glslang"
> +PACKAGECONFIG[opengl] = 
> "-Dopengl=enabled,-Dopengl=disabled,glad,glad"
> +PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
> +PACKAGECONFIG[demos] = "-Ddemos=true,-Ddemos=false,ffmpeg libsdl2 
> libsdl2-image"
> +
> +EXTRA_OEMESON = 
> "-Dvulkan-registry=${STAGING_DATADIR}/vulkan/registry/vk.xml"
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#112914): 
> <https://lists.openembedded.org/g/openembedded-devel/message/112914>
> Mute This Topic: <https://lists.openembedded.org/mt/109014269/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-G3OiNTjogOzr3eQC+qnv
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">I have successfully built this for Clang</div><div id="geary-quote" dir="auto"><br>On Tue, Oct 15 2024 at 02:36:27 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">- Add PACKAGECONFIGs to allow build according to DISTRO_FEATURES
- Add path to vulkan-registry
- Add fastfloat dependency for clang
- Build with lcms by default, because mpv warns about missing littlecms2
  support

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../mplayer/libplacebo_7.349.0.bb             | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
index b68e67a8c..f0f18f2e4 100644
--- a/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/libplacebo_7.349.0.bb
@@ -1,22 +1,22 @@
 SUMMARY ="Reusable library for GPU-accelerated video/image rendering primitives"
-LICENSE = "Apache-2.0 &amp; BSD-3-Clause &amp; BSL-1.0 &amp; MIT"
-LIC_FILES_CHKSUM = "<a href="file://3rdparty/Vulkan-Headers/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57">file://3rdparty/Vulkan-Headers/LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57</a> \
-                    <a href="file://3rdparty/fast_float/LICENSE-APACHE;md5=81db248e90379bcfc0582b578b009bc3">file://3rdparty/fast_float/LICENSE-APACHE;md5=81db248e90379bcfc0582b578b009bc3</a> \
-                    <a href="file://3rdparty/fast_float/LICENSE-BOOST;md5=2c7a3fa82e66676005cd4ee2608fd7d2">file://3rdparty/fast_float/LICENSE-BOOST;md5=2c7a3fa82e66676005cd4ee2608fd7d2</a> \
-                    <a href="file://3rdparty/fast_float/LICENSE-MIT;md5=32b11d50c7d9788d4270f6a83f3e68eb">file://3rdparty/fast_float/LICENSE-MIT;md5=32b11d50c7d9788d4270f6a83f3e68eb</a> \
-                    <a href="file://3rdparty/glad/LICENSE;md5=ae570f26774ac096cff8f992091a223c">file://3rdparty/glad/LICENSE;md5=ae570f26774ac096cff8f992091a223c</a> \
-                    <a href="file://3rdparty/jinja/LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462">file://3rdparty/jinja/LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462</a> \
-                    <a href="file://3rdparty/jinja/docs/license.rst;md5=5f4c795946979fabc2361be4c70d0a9f">file://3rdparty/jinja/docs/license.rst;md5=5f4c795946979fabc2361be4c70d0a9f</a> \
-                    <a href="file://3rdparty/markupsafe/LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75">file://3rdparty/markupsafe/LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75</a> \
-                    <a href="file://3rdparty/markupsafe/docs/license.rst;md5=5f4c795946979fabc2361be4c70d0a9f">file://3rdparty/markupsafe/docs/license.rst;md5=5f4c795946979fabc2361be4c70d0a9f</a> \
-                    <a href="file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da">file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da</a> \
-                    <a href="file://demos/3rdparty/nuklear/src/LICENSE;md5=6052431ae6cd4f0082276c54996e7770">file://demos/3rdparty/nuklear/src/LICENSE;md5=6052431ae6cd4f0082276c54996e7770</a> \
-                    <a href="file://demos/LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032" "="">file://demos/LICENSE;md5=65d3616852dbf7b1a6d4b53b00626032"</a>
+LICENSE = "LGPL-2.1-only"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da" "="">file://LICENSE;md5=435ed639f84d4585d93824e7da3d85da"</a>
 
-SRC_URI = "gitsm://github.com/haasn/libplacebo;protocol=https;branch=master"
+DEPENDS += "fastfloat"
 
+SRC_URI = "git://code.videolan.org/videolan/libplacebo.git;protocol=https;branch=v7.349"
 SRCREV = "1fd3c7bde7b943fe8985c893310b5269a09b46c5"
 
 inherit meson pkgconfig
 
 S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'vulkan opengl', d)} lcms"
+
+PACKAGECONFIG[vulkan] =  "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader vulkan-headers shaderc spirv-shader-generator python3-mako-native python3-jinja2-native glad-native"
+PACKAGECONFIG[glslang] = "-Dglslang=enabled,-Dglslang=disabled,glslang"
+PACKAGECONFIG[opengl] = "-Dopengl=enabled,-Dopengl=disabled,glad,glad"
+PACKAGECONFIG[lcms] = "-Dlcms=enabled,-Dlcms=disabled,lcms"
+PACKAGECONFIG[demos] = "-Ddemos=true,-Ddemos=false,ffmpeg libsdl2 libsdl2-image"
+
+EXTRA_OEMESON = "-Dvulkan-registry=${STAGING_DATADIR}/vulkan/registry/vk.xml"
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#112914): <a href="https://lists.openembedded.org/g/openembedded-devel/message/112914">https://lists.openembedded.org/g/openembedded-devel/message/112914</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/109014269/3618223">https://lists.openembedded.org/mt/109014269/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-G3OiNTjogOzr3eQC+qnv--


