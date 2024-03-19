Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA992C54E60
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 09:29:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.10806.1710840570520974275
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Mar 2024 02:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout10.t-online.de (Postfix) with SMTP id 9E52438E25
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 10:29:28 +0100 (CET)
Received: from [192.168.178.67] ([79.219.227.144]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rmVmf-2aSJN20; Tue, 19 Mar 2024 10:29:26 +0100
Date: Tue, 19 Mar 2024 10:29:49 +0100
From: f_l_k@t-online.de
Subject: Re: [oe] [meta-gnome][PATCHv2] freerdp3: add recipe
To: openembedded-devel@lists.openembedded.org
Message-Id: <P19LAS.XNJ0HDKLN7IM@t-online.de>
In-Reply-To: <17BE205582F63951.29196@lists.openembedded.org>
References: <17BE205582F63951.29196@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-XloNjwgMfAef1UyrSoLG"
X-TOI-EXPURGATEID: 150726::1710840566-05983954-C955EBE4/0/0 CLEAN NORMAL
X-TOI-MSGID: 623d1884-6fc0-4cef-a135-b222f13294d2
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 09:29:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109477

--=-XloNjwgMfAef1UyrSoLG
Content-Type: text/plain; charset=us-ascii; format=flowed

v2 removes fuse3 as a hard dependency. ffmpeg is still needed in any 
case because of swscale

On Tue, Mar 19 2024 at 10:27:58 AM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> freerdp3 is required to build gnome-remote-desktop-46.0
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-support/freerdp/freerdp3_3.4.0.bb | 59 
> +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
> 
> diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb 
> b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
> new file mode 100644
> index 000000000..f04be56c6
> --- /dev/null
> +++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
> @@ -0,0 +1,59 @@
> +DESCRIPTION = "FreeRDP RDP client & server library"
> +HOMEPAGE = "http://www.freerdp.com <http://www.freerdp.com/>"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57" 
> <file://license;md5=3b83ef96387f14655fc854ddc3c6bd57/>
> +
> +DEPENDS = "openssl ffmpeg libusb1 uriparser cairo icu pkcs11-helper 
> zlib jpeg"
> +
> +inherit pkgconfig cmake
> +
> +SRCREV = "708f3764897e06297469a7b0507b3c9ecc041ad7"
> +SRC_URI = 
> "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ??= " \
> +    ${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'pam pulseaudio 
> wayland x11', d)} \
> +    gstreamer cups pcsc \
> +"
> +
> +EXTRA_OECMAKE = " \
> +    -DRDTK_FORCE_STATIC_BUILD=ON \
> +    -DUWAC_FORCE_STATIC_BUILD=ON \
> +    -DWITH_ADD=ON \
> +    -DWITH_BINARY_VERSIONING=ON \
> +    -DWITH_CHANNELS=ON \
> +    -DWITH_CLIENT_CHANNELS=ON \
> +    -DWITH_JPEG=ON \
> +    -DWITH_PKCS11=ON \
> +    -DWITH_SERVER_CHANNELS=ON \
> +    -DWITH_SERVER=ON \
> +    -DPKG_CONFIG_RELOCATABLE=OFF \
> +    -DWITH_ALSA=OFF \
> +    -DWITH_CLIENT_SDL=OFF \
> +    -DWITH_SAMPLE=OFF \
> + "
> +
> +X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv 
> libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
> +PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON 
> -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON 
> -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON 
> -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
> +PACKAGECONFIG[wayland] = 
> "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native 
> libxkbcommon"
> +PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
> +PACKAGECONFIG[pulseaudio] = 
> "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
> +PACKAGECONFIG[gstreamer] = 
> "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0 
> gstreamer1.0-plugins-base"
> +PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
> +PACKAGECONFIG[fuse] = "-DWITH_FUSE=ON,-DWITH_FUSE=OFF,fuse3,fuse3"
> +PACKAGECONFIG[pcsc] = "-DWITH_PCSC=ON,-DWITH_PCSC=OFF,pcsc-lite"
> +PACKAGECONFIG[manpages] = "-DWITH_MANPAGES=ON,-DWITH_MANPAGES=OFF, 
> libxslt-native docbook-xsl-stylesheets-native"
> +PACKAGECONFIG[ffmpeg] = "-DWITH_DSP_FFMPEG=ON -DWITH_FFMPEG=ON, 
> -DWITH_DSP_FFMPEG=OFF -DWITH_FFMPEG=OFF"
> +PACKAGECONFIG[openh264] = 
> "-DWITH_OPENH264=ON,-DWITH_OPENH264=OFF,openh264"
> +PACKAGECONFIG[opencl] = 
> "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-icd-loader"
> +PACKAGECONFIG[lame] = "-DWITH_LAME=ON,-DWITH_LAME=OFF,lame"
> +PACKAGECONFIG[faad] = "-DWITH_FAAD=ON,-DWITH_FAAD=OFF,faad2"
> +PACKAGECONFIG[faac] = "-DWITH_FAAD=ON,-DWITH_FAAD=OFF,faac"
> +
> +do_configure:append() {
> +    sed -i -e 's|${WORKDIR}||g' ${B}/include/freerdp/buildflags.h
> +    sed -i -e 's|${WORKDIR}||g' ${B}/winpr/include/winpr/buildflags.h
> +}
> +
> +FILES:${PN} += "${datadir}"
> --
> 2.44.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109476): 
> <https://lists.openembedded.org/g/openembedded-devel/message/109476>
> Mute This Topic: <https://lists.openembedded.org/mt/105020833/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-XloNjwgMfAef1UyrSoLG
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2 removes fuse3 as a hard dependency. ffmpeg is still needed in any case because of swscale</div></div><div id="geary-quote" dir="auto"><br>On Tue, Mar 19 2024 at 10:27:58 AM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">freerdp3 is required to build gnome-remote-desktop-46.0

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../recipes-support/freerdp/freerdp3_3.4.0.bb | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
new file mode 100644
index 000000000..f04be56c6
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -0,0 +1,59 @@
+DESCRIPTION = "FreeRDP RDP client &amp; server library"
+HOMEPAGE = "<a href="http://www.freerdp.com">http://www.freerdp.com</a>"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57" "="">file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"</a>
+
+DEPENDS = "openssl ffmpeg libusb1 uriparser cairo icu pkcs11-helper zlib jpeg"
+
+inherit pkgconfig cmake
+
+SRCREV = "708f3764897e06297469a7b0507b3c9ecc041ad7"
+SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https"
+
+S = "${WORKDIR}/git"
+
+PACKAGECONFIG ??= " \
+    <a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'pam pulseaudio wayland x11', d)} \
+    gstreamer cups pcsc \
+"
+
+EXTRA_OECMAKE = " \
+    -DRDTK_FORCE_STATIC_BUILD=ON \
+    -DUWAC_FORCE_STATIC_BUILD=ON \
+    -DWITH_ADD=ON \
+    -DWITH_BINARY_VERSIONING=ON \
+    -DWITH_CHANNELS=ON \
+    -DWITH_CLIENT_CHANNELS=ON \
+    -DWITH_JPEG=ON \
+    -DWITH_PKCS11=ON \
+    -DWITH_SERVER_CHANNELS=ON \
+    -DWITH_SERVER=ON \
+    -DPKG_CONFIG_RELOCATABLE=OFF \
+    -DWITH_ALSA=OFF \
+    -DWITH_CLIENT_SDL=OFF \
+    -DWITH_SAMPLE=OFF \
+ "
+
+X11_DEPS = "virtual/libx11 libxinerama libxext libxcursor libxv libxi libxrender libxfixes libxdamage libxrandr libxkbfile"
+PACKAGECONFIG[x11] = "-DWITH_X11=ON -DWITH_XINERAMA=ON -DWITH_XEXT=ON -DWITH_XCURSOR=ON -DWITH_XV=ON -DWITH_XI=ON -DWITH_XRENDER=ON -DWITH_XFIXES=ON -DWITH_XDAMAGE=ON -DWITH_XRANDR=ON -DWITH_XKBFILE=ON,-DWITH_X11=OFF,${X11_DEPS}"
+PACKAGECONFIG[wayland] = "-DWITH_WAYLAND=ON,-DWITH_WAYLAND=OFF,wayland wayland-native libxkbcommon"
+PACKAGECONFIG[pam] = "-DWITH_PAM=ON,-DWITH_PAM=OFF,libpam"
+PACKAGECONFIG[pulseaudio] = "-DWITH_PULSEAUDIO=ON,-DWITH_PULSEAUDIO=OFF,pulseaudio"
+PACKAGECONFIG[gstreamer] = "-DWITH_GSTREAMER_1_0=ON,-DWITH_GSTREAMER_1_0=OFF,gstreamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[cups] = "-DWITH_CUPS=ON,-DWITH_CUPS=OFF,cups"
+PACKAGECONFIG[fuse] = "-DWITH_FUSE=ON,-DWITH_FUSE=OFF,fuse3,fuse3"
+PACKAGECONFIG[pcsc] = "-DWITH_PCSC=ON,-DWITH_PCSC=OFF,pcsc-lite"
+PACKAGECONFIG[manpages] = "-DWITH_MANPAGES=ON,-DWITH_MANPAGES=OFF, libxslt-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[ffmpeg] = "-DWITH_DSP_FFMPEG=ON -DWITH_FFMPEG=ON, -DWITH_DSP_FFMPEG=OFF -DWITH_FFMPEG=OFF"
+PACKAGECONFIG[openh264] = "-DWITH_OPENH264=ON,-DWITH_OPENH264=OFF,openh264"
+PACKAGECONFIG[opencl] = "-DWITH_OPENCL=ON,-DWITH_OPENCL=OFF,opencl-icd-loader"
+PACKAGECONFIG[lame] = "-DWITH_LAME=ON,-DWITH_LAME=OFF,lame"
+PACKAGECONFIG[faad] = "-DWITH_FAAD=ON,-DWITH_FAAD=OFF,faad2"
+PACKAGECONFIG[faac] = "-DWITH_FAAD=ON,-DWITH_FAAD=OFF,faac"
+
+do_configure:append() {
+    sed -i -e 's|${WORKDIR}||g' ${B}/include/freerdp/buildflags.h
+    sed -i -e 's|${WORKDIR}||g' ${B}/winpr/include/winpr/buildflags.h
+}
+
+FILES:${PN} += "${datadir}"
<div>-- 
</div>2.44.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#109476): <a href="https://lists.openembedded.org/g/openembedded-devel/message/109476">https://lists.openembedded.org/g/openembedded-devel/message/109476</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/105020833/3618223">https://lists.openembedded.org/mt/105020833/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-XloNjwgMfAef1UyrSoLG--


