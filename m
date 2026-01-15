Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E3CD3CCBD
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 07:39:01 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30750.1768462731110915495
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 23:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout04.t-online.de (Postfix) with SMTP id B38A28B9
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 08:38:47 +0100 (CET)
Received: from [192.168.178.36] ([84.163.47.171]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgHwM-06ovDc0; Thu, 15 Jan 2026 08:38:46 +0100
Date: Thu, 15 Jan 2026 08:38:41 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-xfce][PATCHv2] libxfce4windowing: switch to meson
 buildsystem
To: openembedded-devel@lists.openembedded.org
Message-Id: <HKAW8T.MIPK267SG6P93@t-online.de>
In-Reply-To: <188AD7691A76D839.2595076@lists.openembedded.org>
References: <188AD7691A76D839.2595076@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Nnwlnwz5IYKkUYKvlH5/"
X-TOI-EXPURGATEID: 150726::1768462726-A37FD939-A5FD5FE0/0/0 CLEAN NORMAL
X-TOI-MSGID: 3d2420c7-9677-4474-9d56-73fd6c2dca84
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 07:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123492

--=-Nnwlnwz5IYKkUYKvlH5/
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: fix dependencies

On Thu, Jan 15 2026 at 08:37:20 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Motivation for this is to get vapi files created which are required to
> e.g. build the budgie desktop
> 
> -Add PACKAGECONFIG for x11 and build depending on DISTRO_FEATURES
> -Build vala by default
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  .../libxfce4windowing_4.20.4.bb               | 20 
> ++++++++-----------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git 
> a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb 
> b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
> index 5791d48895..bd292a6530 100644
> --- 
> a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
> +++ 
> b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
> @@ -4,22 +4,18 @@ SECTION = "x11/libs"
>  LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da" 
> <file://copying;md5=435ed639f84d4585d93824e7da3d85da/>
> 
> -DEPENDS = "xfce4-dev-tools-native libdisplay-info libwnck3"
> +DEPENDS = "xfce4-dev-tools-native glib-2.0 gtk+3"
> 
> +XFCEBASEBUILDCLASS = "meson"
>  SRC_URI[sha256sum] = 
> "db467f9ac4bac8f1c4e82667902841fc0957af835c29603d6659a57440b6f8cb"
> 
> -inherit features_check gobject-introspection gtk-doc xfce
> +inherit features_check gobject-introspection gtk-doc xfce vala 
> gettext
> 
>  # Currently, X11 is fully supported. Wayland is partially supported
> -REQUIRED_DISTRO_FEATURES = "x11"
> +ANY_OF_DISTRO_FEATURES = "wayland x11"
> 
> -PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland', d)}"
> -PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, 
> wayland-native"
> +PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland x11', d)}"
> +PACKAGECONFIG[x11] = "-Dx11=enabled, -Dx11=disabled, libx11 
> libdisplay-info libwnck3 xrandr"
> +PACKAGECONFIG[wayland] = "-Dwayland=enabled, -Dwayland=disabled, 
> wayland wayland-native wayland-protocols"
> 
> -EXTRA_OECONF = "--enable-x11 \
> -                
> WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner \
> -                "
> -
> -do_compile:prepend() {
> -    export GIR_EXTRA_LIBS_PATH=${B}/libxfce4windowing/.libs
> -}
> +GTKDOC_MESON_OPTION = "gtk-doc"
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123491): 
> <https://lists.openembedded.org/g/openembedded-devel/message/123491>
> Mute This Topic: <https://lists.openembedded.org/mt/117275862/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-Nnwlnwz5IYKkUYKvlH5/
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: fix dependencies</div></div><div id="geary-quote" dir="auto"><br>On Thu, Jan 15 2026 at 08:37:20 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Motivation for this is to get vapi files created which are required to
e.g. build the budgie desktop

-Add PACKAGECONFIG for x11 and build depending on DISTRO_FEATURES
-Build vala by default

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 .../libxfce4windowing_4.20.4.bb               | 20 ++++++++-----------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
index 5791d48895..bd292a6530 100644
--- a/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
+++ b/meta-xfce/recipes-xfce/libxfce4windowing/libxfce4windowing_4.20.4.bb
@@ -4,22 +4,18 @@ SECTION = "x11/libs"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=435ed639f84d4585d93824e7da3d85da" "="">file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"</a>
 
-DEPENDS = "xfce4-dev-tools-native libdisplay-info libwnck3"
+DEPENDS = "xfce4-dev-tools-native glib-2.0 gtk+3"
 
+XFCEBASEBUILDCLASS = "meson"
 SRC_URI[sha256sum] = "db467f9ac4bac8f1c4e82667902841fc0957af835c29603d6659a57440b6f8cb"
 
-inherit features_check gobject-introspection gtk-doc xfce
+inherit features_check gobject-introspection gtk-doc xfce vala gettext
 
 # Currently, X11 is fully supported. Wayland is partially supported
-REQUIRED_DISTRO_FEATURES = "x11"
+ANY_OF_DISTRO_FEATURES = "wayland x11"
 
-PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'wayland', d)}"
-PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native"
+PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'wayland x11', d)}"
+PACKAGECONFIG[x11] = "-Dx11=enabled, -Dx11=disabled, libx11 libdisplay-info libwnck3 xrandr"
+PACKAGECONFIG[wayland] = "-Dwayland=enabled, -Dwayland=disabled, wayland wayland-native wayland-protocols"
 
-EXTRA_OECONF = "--enable-x11 \
-                WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner \
-                "
-
-do_compile:prepend() {
-    export GIR_EXTRA_LIBS_PATH=${B}/libxfce4windowing/.libs
-}
+GTKDOC_MESON_OPTION = "gtk-doc"
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#123491): <a href="https://lists.openembedded.org/g/openembedded-devel/message/123491">https://lists.openembedded.org/g/openembedded-devel/message/123491</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117275862/3618223">https://lists.openembedded.org/mt/117275862/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-Nnwlnwz5IYKkUYKvlH5/--


