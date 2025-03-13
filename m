Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22770C282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 12:41:31 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.13488.1741869690467220724
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 05:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout02.t-online.de (Postfix) with SMTP id E8ABA37A
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 13:41:28 +0100 (CET)
Received: from [192.168.178.20] ([79.219.231.110]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tshsN-2NDlQm0; Thu, 13 Mar 2025 13:41:27 +0100
Date: Thu, 13 Mar 2025 13:04:58 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCHv2] libsdl3: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <AK92TS.Q739GCR1HSTF2@t-online.de>
In-Reply-To: <182C5B28D7D9F838.16826@lists.openembedded.org>
References: <182C5B28D7D9F838.16826@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-9cQ6mxjent0N7+9BR3B1"
X-TOI-EXPURGATEID: 150726::1741869687-257F859D-4B8B2EE5/0/0 CLEAN NORMAL
X-TOI-MSGID: ae0503cd-f891-4ad6-b1bb-c56735078cc8
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 12:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115969

--=-9cQ6mxjent0N7+9BR3B1
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: remove directfb from PACKAGECONFIG

On Thu, Mar 13 2025 at 13:03:40 +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-graphics/libsdl3/libsdl3_3.2.8.bb | 83 
> +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
> 
> diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb 
> b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
> new file mode 100644
> index 0000000000..9c4fa317a2
> --- /dev/null
> +++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
> @@ -0,0 +1,83 @@
> +SUMMARY = "Simple DirectMedia Layer"
> +DESCRIPTION = "Simple DirectMedia Layer is a cross-platform 
> multimedia \
> +library designed to provide low level access to audio, keyboard, 
> mouse, \
> +joystick, 3D hardware via OpenGL, and 2D video framebuffer."
> +HOMEPAGE = "http://www.libsdl.org <http://www.libsdl.org/>"
> +BUGTRACKER = "<http://bugzilla.libsdl.org/>"
> +
> +SECTION = "libs"
> +
> +LICENSE = "Zlib & BSD-2-Clause"
> +LIC_FILES_CHKSUM = "\
> +    file://LICENSE.txt;md5=cbf0e3161523f9a9315b6b915c5c4457 
> <file://license.txt;md5=cbf0e3161523f9a9315b6b915c5c4457/> \
> +    
> <file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077> \
> +    
> <file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f> 
> \
> +    
> <file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071> 
> \
> +"
> +
> +# arm-neon adds MIT license
> +LICENSE:append = " ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'arm-neon', '& MIT', 
> '', d)}"
> +LIC_FILES_CHKSUM:append = " ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'arm-neon', 
> '<file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24',> 
> '', d)}"
> +
> +PROVIDES = "virtual/libsdl3"
> +
> +SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz 
> <http://www.libsdl.org/release/SDL3-$%7BPV%7D.tar.gz>"
> +
> +S = "${WORKDIR}/SDL3-${PV}"
> +
> +SRC_URI[sha256sum] = 
> "13388fabb361de768ecdf2b65e52bb27d1054cae6ccb6942ba926e378e00db03"
> +
> +inherit cmake lib_package binconfig-disabled pkgconfig 
> upstream-version-is-even
> +
> +CVE_PRODUCT = "simple_directmedia_layer sdl"
> +
> +EXTRA_OECMAKE = " \
> +	-DSDL_OSS_DEFAULT=OFF \
> +	-DSDL_DISKAUDIO=OFF \
> +	-DSDL_DUMMYVIDEO=OFF \
> +	-DSDL_RPI=OFF \
> +	-DSDL_PTHREADS=ON \
> +	-DSDL_RPATH=OFF \
> +	-DSDL_SNDIO=OFF \
> +	-DSDL_X11_XCURSOR=OFF \
> +	-DSDL_X11_XDBE=OFF \
> +	-DSDL_X11_XFIXES=OFF \
> +	-DSDL_X11_XINPUT=OFF \
> +	-DSDL_X11_XRANDR=OFF \
> +	-DSDL_X11_XSCRNSAVER=OFF \
> +	-DSDL_X11_XSHAPE=OFF \
> +"
> +
> +# opengl packageconfig factored out to make it easy for distros
> +# and BSP layers to pick either (desktop) opengl, gles2, or no GL
> +PACKAGECONFIG_GL ?= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'opengl', d)}"
> +
> +PACKAGECONFIG:class-native = "x11 ${PACKAGECONFIG_GL}"
> +PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11', d)} 
> ${PACKAGECONFIG_GL}"
> +PACKAGECONFIG ??= " \
> +	${PACKAGECONFIG_GL} \
> +	${@bb.utils.filter <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 
> 'alsa pulseaudio pipewire x11 vulkan', d)} \
> +	${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'wayland', 'wayland 
> gles2', '', d)} \
> +	${@bb.utils.contains <mailto:${@bb.utils.contains>("TUNE_FEATURES", 
> "neon","arm-neon","",d)} \
> +"
> +PACKAGECONFIG[alsa]       = "-DSDL_ALSA=ON,-DSDL_ALSA=OFF,alsa-lib,"
> +PACKAGECONFIG[arm-neon]   = "-DSDL_ARMNEON=ON,-DSDL_ARMNEON=OFF"
> +PACKAGECONFIG[gles2]      = 
> "-DSDL_OPENGLES=ON,-DSDL_OPENGLES=OFF,virtual/libgles2"
> +PACKAGECONFIG[jack]       = "-DSDL_JACK=ON,-DSDL_JACK=OFF,jack"
> +PACKAGECONFIG[kmsdrm]     = "-DSDL_KMSDRM=ON,-DSDL_KMSDRM=OFF,libdrm 
> virtual/libgbm"
> +# The hidraw support doesn't catch Xbox, PS4 and Nintendo 
> controllers,
> +#  so we'll just use libusb when it's available.
> +PACKAGECONFIG[libusb] = 
> "-DSDL_HIDAPI_LIBUSB=ON,-DSDL_HIDAPI_LIBUSB=OFF,libusb1"
> +PACKAGECONFIG[libdecor] = 
> "-DSDL_WAYLAND_LIBDECOR=ON,-DSDL_WAYLAND_LIBDECOR=OFF,libdecor,libdecor"
> +PACKAGECONFIG[opengl]     = 
> "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/egl"
> +PACKAGECONFIG[pipewire] = 
> "-DSDL_PIPEWIRE_SHARED=ON,-DSDL_PIPEWIRE_SHARED=OFF,pipewire"
> +PACKAGECONFIG[pulseaudio] = 
> "-DSDL_PULSEAUDIO=ON,-DSDL_PULSEAUDIO=OFF,pulseaudio"
> +PACKAGECONFIG[vulkan]    = "-DSDL_VULKAN=ON 
> -DSDL_RENDER_VULKAN=ON,-DSDL_VULKAN=OFF -DSDL_RENDER_VULKAN=OFF"
> +PACKAGECONFIG[wayland]    = 
> "-DSDL_WAYLAND=ON,-DSDL_WAYLAND=OFF,wayland-native wayland 
> wayland-protocols libxkbcommon"
> +PACKAGECONFIG[x11]        = 
> "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext libxrandr 
> libxrender"
> +
> +CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
> +
> +FILES:${PN} += "${datadir}/licenses/SDL3/LICENSE.txt"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.48.1
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115967): 
> <https://lists.openembedded.org/g/openembedded-devel/message/115967>
> Mute This Topic: <https://lists.openembedded.org/mt/111678038/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-9cQ6mxjent0N7+9BR3B1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">v2: remove directfb from PACKAGECONFIG</div><div id="geary-quote" dir="auto"><br>On Thu, Mar 13 2025 at 13:03:40 +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-graphics/libsdl3/libsdl3_3.2.8.bb | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
new file mode 100644
index 0000000000..9c4fa317a2
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.8.bb
@@ -0,0 +1,83 @@
+SUMMARY = "Simple DirectMedia Layer"
+DESCRIPTION = "Simple DirectMedia Layer is a cross-platform multimedia \
+library designed to provide low level access to audio, keyboard, mouse, \
+joystick, 3D hardware via OpenGL, and 2D video framebuffer."
+HOMEPAGE = "<a href="http://www.libsdl.org">http://www.libsdl.org</a>"
+BUGTRACKER = "<a href="http://bugzilla.libsdl.org/">http://bugzilla.libsdl.org/</a>"
+
+SECTION = "libs"
+
+LICENSE = "Zlib &amp; BSD-2-Clause"
+LIC_FILES_CHKSUM = "\
+    <a href="file://LICENSE.txt;md5=cbf0e3161523f9a9315b6b915c5c4457">file://LICENSE.txt;md5=cbf0e3161523f9a9315b6b915c5c4457</a> \
+    <a href="file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077">file://src/hidapi/LICENSE.txt;md5=7c3949a631240cb6c31c50f3eb696077</a> \
+    <a href="file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f">file://src/hidapi/LICENSE-bsd.txt;md5=b5fa085ce0926bb50d0621620a82361f</a> \
+    <a href="file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071">file://src/video/yuv2rgb/LICENSE;md5=79f8f3418d91531e05f0fc94ca67e071</a> \
+"
+
+# arm-neon adds MIT license
+LICENSE:append = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'arm-neon', '&amp; MIT', '', d)}"
+LIC_FILES_CHKSUM:append = " <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'arm-neon', '<a href="file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24',">file://src/video/arm/pixman-arm-neon-asm.h;md5=9a9cc1e51abbf1da58f4d9528ec9d49b;beginline=1;endline=24',</a> '', d)}"
+
+PROVIDES = "virtual/libsdl3"
+
+SRC_URI = "<a href="http://www.libsdl.org/release/SDL3-${PV}.tar.gz">http://www.libsdl.org/release/SDL3-${PV}.tar.gz</a>"
+
+S = "${WORKDIR}/SDL3-${PV}"
+
+SRC_URI[sha256sum] = "13388fabb361de768ecdf2b65e52bb27d1054cae6ccb6942ba926e378e00db03"
+
+inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
+
+CVE_PRODUCT = "simple_directmedia_layer sdl"
+
+EXTRA_OECMAKE = " \
+	-DSDL_OSS_DEFAULT=OFF \
+	-DSDL_DISKAUDIO=OFF \
+	-DSDL_DUMMYVIDEO=OFF \
+	-DSDL_RPI=OFF \
+	-DSDL_PTHREADS=ON \
+	-DSDL_RPATH=OFF \
+	-DSDL_SNDIO=OFF \
+	-DSDL_X11_XCURSOR=OFF \
+	-DSDL_X11_XDBE=OFF \
+	-DSDL_X11_XFIXES=OFF \
+	-DSDL_X11_XINPUT=OFF \
+	-DSDL_X11_XRANDR=OFF \
+	-DSDL_X11_XSCRNSAVER=OFF \
+	-DSDL_X11_XSHAPE=OFF \
+"
+
+# opengl packageconfig factored out to make it easy for distros
+# and BSP layers to pick either (desktop) opengl, gles2, or no GL
+PACKAGECONFIG_GL ?= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'opengl', d)}"
+
+PACKAGECONFIG:class-native = "x11 ${PACKAGECONFIG_GL}"
+PACKAGECONFIG:class-nativesdk = "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'x11', d)} ${PACKAGECONFIG_GL}"
+PACKAGECONFIG ??= " \
+	${PACKAGECONFIG_GL} \
+	<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'alsa pulseaudio pipewire x11 vulkan', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
+	<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("TUNE_FEATURES", "neon","arm-neon","",d)} \
+"
+PACKAGECONFIG[alsa]       = "-DSDL_ALSA=ON,-DSDL_ALSA=OFF,alsa-lib,"
+PACKAGECONFIG[arm-neon]   = "-DSDL_ARMNEON=ON,-DSDL_ARMNEON=OFF"
+PACKAGECONFIG[gles2]      = "-DSDL_OPENGLES=ON,-DSDL_OPENGLES=OFF,virtual/libgles2"
+PACKAGECONFIG[jack]       = "-DSDL_JACK=ON,-DSDL_JACK=OFF,jack"
+PACKAGECONFIG[kmsdrm]     = "-DSDL_KMSDRM=ON,-DSDL_KMSDRM=OFF,libdrm virtual/libgbm"
+# The hidraw support doesn't catch Xbox, PS4 and Nintendo controllers,
+#  so we'll just use libusb when it's available.
+PACKAGECONFIG[libusb] = "-DSDL_HIDAPI_LIBUSB=ON,-DSDL_HIDAPI_LIBUSB=OFF,libusb1"
+PACKAGECONFIG[libdecor] = "-DSDL_WAYLAND_LIBDECOR=ON,-DSDL_WAYLAND_LIBDECOR=OFF,libdecor,libdecor"
+PACKAGECONFIG[opengl]     = "-DSDL_OPENGL=ON,-DSDL_OPENGL=OFF,virtual/egl"
+PACKAGECONFIG[pipewire] = "-DSDL_PIPEWIRE_SHARED=ON,-DSDL_PIPEWIRE_SHARED=OFF,pipewire"
+PACKAGECONFIG[pulseaudio] = "-DSDL_PULSEAUDIO=ON,-DSDL_PULSEAUDIO=OFF,pulseaudio"
+PACKAGECONFIG[vulkan]    = "-DSDL_VULKAN=ON -DSDL_RENDER_VULKAN=ON,-DSDL_VULKAN=OFF -DSDL_RENDER_VULKAN=OFF"
+PACKAGECONFIG[wayland]    = "-DSDL_WAYLAND=ON,-DSDL_WAYLAND=OFF,wayland-native wayland wayland-protocols libxkbcommon"
+PACKAGECONFIG[x11]        = "-DSDL_X11=ON,-DSDL_X11=OFF,virtual/libx11 libxext libxrandr libxrender"
+
+CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
+
+FILES:${PN} += "${datadir}/licenses/SDL3/LICENSE.txt"
+
+BBCLASSEXTEND = "native nativesdk"
<div>-- 
</div>2.48.1

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#115967): <a href="https://lists.openembedded.org/g/openembedded-devel/message/115967">https://lists.openembedded.org/g/openembedded-devel/message/115967</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/111678038/3618223">https://lists.openembedded.org/mt/111678038/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-9cQ6mxjent0N7+9BR3B1--


