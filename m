Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2B5CA9EBE
	for <webhook@archiver.kernel.org>; Sat, 10 Oct 2026 07:52:54 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5368.1791618772525572502
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Oct 2026 00:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=YpeetPKs;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id 9E1BDE341
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 09:52:50 +0200 (CEST)
Received: from [192.168.178.36] ([79.219.229.158]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xFRsv-0Z4Yl60; Sat, 10 Oct 2026 09:52:49 +0200
Date: Sat, 10 Oct 2026 09:52:43 +0200
From: "Markus Volk" <f_l_k@t-online.de>
Subject: Re: [oe] [blacksail][meta-gnome][PATCH 4/4] Revert "mutter: upgrade
 50.4 -> 51.0"
To: openembedded-devel@lists.openembedded.org
Message-Id: <VVLOMT.L25LERTE464W2@t-online>
In-Reply-To: <18DD1BA7D38FF4E7.3352370@lists.openembedded.org>
References: <20261010075022.1738748-1-f_l_k@t-online.de>
	<18DD1BA7D38FF4E7.3352370@lists.openembedded.org>
X-Mailer: net.donnybeelo.Convey/50.2-1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-3+8nTPVk2/npwd20D+dz"
X-TOI-EXPURGATEID: 150726::1791618769-CF7FDBB0-9255FF11/0/0 CLEAN NORMAL
X-TOI-MSGID: d4720442-fca0-4ee3-ba6d-391f1acd2fba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791618770; i=f_l_k@t-online.de;
	bh=iiWNIg7NTqyMCTyGy/pTxgCDlFA+68t3bk6bIn63JIk=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=YpeetPKsdkDoy9+O2HY+nCrxsNfFQ0gE349+jr/2+QO/yGbXr1dTgwJah7eDdPFIO
	 +Y5GVsDAvVxLPy3iGgbQ40IkSxIQfjzEHF3HovqaU7LnkjlNNsSwt5QkaooJE18qmt
	 P1zkk990FOaGAPxq1TYlHzRQ5KBauLq9xiYufksUP8ueLczOhMk96DpfX7pFh/p1VZ
	 eDvuIEFRL9Rub3kbsvhrZIWEWBIdBRGC3QJuPJYZJ3rIF58lb6DcxfYSp0IF/sB3op
	 UZjPsK6ydxKe9iWp53UlTp9nEap2uElWiHU9GHyzyQBixkto4srGzpWF1IgYLOaJSO
	 9QUsp2HK9kRUw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Oct 2026 07:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130719

--=-3+8nTPVk2/npwd20D+dz
Content-Type: text/plain; charset=us-ascii; format=flowed

These three GNOME updates need to be reverted in meta-gnome so that 
GNOME can be compiled with oe-core 'blacksail'

On Sat, Oct 10 2026 at 09:50:22 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> This reverts commit 6f735ce8ac29f1e57dc463bac8c34f3c439a7fb7.
> 
> mutter 51.0 needs gsettings-desktop-schemas >= 51.rc, but oe-core
> blacksail has 50.1. Tested by building gnome-image against oe-core
> blacksail.
> 
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> ---
>  .../mutter/{mutter_51.0.bb => mutter_50.4.bb}   | 17 
> +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>  rename meta-gnome/recipes-gnome/mutter/{mutter_51.0.bb => 
> mutter_50.4.bb} (85%)
> 
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb 
> b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
> similarity index 85%
> rename from meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
> rename to meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
> index 6604865f67..f9b3e9d5e5 100644
> --- a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
> +++ b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
> @@ -17,17 +17,12 @@ DEPENDS = " \
>      libdisplay-info \
>      libdrm \
>      libei \
> -    libgudev \
> -    libinput \
> -    libxcvt-native \
>      libxkbcommon \
>      pango \
>      pixman \
>      python3-argcomplete-native \
>      python3-docutils-native \
> -    udev \
>      virtual/egl \
> -    virtual/libgbm \
>      virtual/libgles2 \
>      wayland \
>      wayland-native \
> @@ -37,7 +32,7 @@ DEPENDS = " \
>  inherit gnomebase gsettings gobject-introspection gettext 
> features_check
> 
>  SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch" 
> <file://0001-dont-use-system-sysprof-dbus-folder.patch/>
> -SRC_URI[archive.sha256sum] = 
> "5d28f3ae225692428fcafb96500d673f34328b698b86960c9c1460d0b1d983b3"
> +SRC_URI[archive.sha256sum] = 
> "273d33c875abcb4b6cbea3f4ec045d18155fbc510c3521fc7e47926371310988"
> 
>  REQUIRED_DISTRO_FEATURES = "wayland polkit"
>  ANY_OF_DISTRO_FEATURES = "opengl vulkan"
> @@ -45,10 +40,10 @@ ANY_OF_DISTRO_FEATURES = "opengl vulkan"
>  # systemd can be replaced by libelogind (not available atow - make 
> systemd
>  # mandatory distro feature)
>  LOGIND ?= "systemd"
> -DEPENDS += "${LOGIND}"
>  REQUIRED_DISTRO_FEATURES += "systemd"
> 
>  PACKAGECONFIG ??= " \
> +    native-backend \
>      egl \
>      gles2 \
>      ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'opengl', '', 
> d)} \
> @@ -56,11 +51,17 @@ PACKAGECONFIG ??= " \
>      bash-completion \
>      gnome-desktop \
>      ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'xwayland', 
> '', d)} \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 'logind 
> udev', '', d)} \
>  "
> 
> +PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, 
> -Dnative_backend=false -Dudev=false, libdrm virtual/libgbm libinput 
> ${LOGIND} virtual/egl virtual/libgles2 udev libxcvt-native"
>  PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false, 
> virtual/libgl"
>  PACKAGECONFIG[gles2] = "-Dgles2=true, -Dgles2=false, 
> virtual/libgles2"
>  PACKAGECONFIG[egl] = "-Degl=true, -Degl=false, virtual/egl"
> +PACKAGECONFIG[egl-device] = "-Degl_device=true, -Degl_device=false"
> +PACKAGECONFIG[wayland-eglstream] = "-Dwayland_eglstream=true, 
> -Dwayland_eglstream=false, wayland-eglstream-protocols"
> +PACKAGECONFIG[udev] = "-Dudev=true, -Dudev=false, udev"
> +PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
>  PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, 
> libwacom"
>  PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, 
> -Dremote_desktop=false, pipewire"
>  PACKAGECONFIG[gnome-desktop] = "-Dlibgnome_desktop=true, 
> -Dlibgnome_desktop=false, gnome-desktop gnome-settings-daemon"
> @@ -87,7 +88,7 @@ EXTRA_OEMESON += " \
>      -Dverbose=true \
>  "
> 
> -MUTTER_API_NAME = "mutter-${@oe.utils.trim 
> <mailto:mutter-${@oe.utils.trim>_version('${PV}', 1)}"
> +MUTTER_API_NAME = "mutter-18"
> 
>  do_install:prepend() {
>      sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130717): 
> <https://lists.openembedded.org/g/openembedded-devel/message/130717>
> Mute This Topic: <https://lists.openembedded.org/mt/121684077/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-3+8nTPVk2/npwd20D+dz
Content-Type: text/html; charset=us-ascii

<div id="convey-body" dir="auto"><div>These three GNOME updates need to be reverted in meta-gnome so that GNOME can be compiled with oe-core 'blacksail'</div></div><div id="convey-quote" dir="auto"><br>On Sat, Oct 10 2026 at 09:50:22 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This reverts commit 6f735ce8ac29f1e57dc463bac8c34f3c439a7fb7.

mutter 51.0 needs gsettings-desktop-schemas &gt;= 51.rc, but oe-core
blacksail has 50.1. Tested by building gnome-image against oe-core
blacksail.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
---
 .../mutter/{mutter_51.0.bb =&gt; mutter_50.4.bb}   | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_51.0.bb =&gt; mutter_50.4.bb} (85%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
similarity index 85%
rename from meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
index 6604865f67..f9b3e9d5e5 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_51.0.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_50.4.bb
@@ -17,17 +17,12 @@ DEPENDS = " \
     libdisplay-info \
     libdrm \
     libei \
-    libgudev \
-    libinput \
-    libxcvt-native \
     libxkbcommon \
     pango \
     pixman \
     python3-argcomplete-native \
     python3-docutils-native \
-    udev \
     virtual/egl \
-    virtual/libgbm \
     virtual/libgles2 \
     wayland \
     wayland-native \
@@ -37,7 +32,7 @@ DEPENDS = " \
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
 SRC_URI += "<a href="file://0001-Dont-use-system-sysprof-dbus-folder.patch" "="">file://0001-Dont-use-system-sysprof-dbus-folder.patch"</a>
-SRC_URI[archive.sha256sum] = "5d28f3ae225692428fcafb96500d673f34328b698b86960c9c1460d0b1d983b3"
+SRC_URI[archive.sha256sum] = "273d33c875abcb4b6cbea3f4ec045d18155fbc510c3521fc7e47926371310988"
 
 REQUIRED_DISTRO_FEATURES = "wayland polkit"
 ANY_OF_DISTRO_FEATURES = "opengl vulkan"
@@ -45,10 +40,10 @@ ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 # systemd can be replaced by libelogind (not available atow - make systemd
 # mandatory distro feature)
 LOGIND ?= "systemd"
-DEPENDS += "${LOGIND}"
 REQUIRED_DISTRO_FEATURES += "systemd"
 
 PACKAGECONFIG ??= " \
+    native-backend \
     egl \
     gles2 \
     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'opengl', '', d)} \
@@ -56,11 +51,17 @@ PACKAGECONFIG ??= " \
     bash-completion \
     gnome-desktop \
     <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'logind udev', '', d)} \
 "
 
+PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, -Dnative_backend=false -Dudev=false, libdrm virtual/libgbm libinput ${LOGIND} virtual/egl virtual/libgles2 udev libxcvt-native"
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false, virtual/libgl"
 PACKAGECONFIG[gles2] = "-Dgles2=true, -Dgles2=false, virtual/libgles2"
 PACKAGECONFIG[egl] = "-Degl=true, -Degl=false, virtual/egl"
+PACKAGECONFIG[egl-device] = "-Degl_device=true, -Degl_device=false"
+PACKAGECONFIG[wayland-eglstream] = "-Dwayland_eglstream=true, -Dwayland_eglstream=false, wayland-eglstream-protocols"
+PACKAGECONFIG[udev] = "-Dudev=true, -Dudev=false, udev"
+PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
 PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire"
 PACKAGECONFIG[gnome-desktop] = "-Dlibgnome_desktop=true, -Dlibgnome_desktop=false, gnome-desktop gnome-settings-daemon"
@@ -87,7 +88,7 @@ EXTRA_OEMESON += " \
     -Dverbose=true \
 "
 
-MUTTER_API_NAME = "<a href="mailto:mutter-${@oe.utils.trim">mutter-${@oe.utils.trim</a>_version('${PV}', 1)}"
+MUTTER_API_NAME = "mutter-18"
 
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/cogl/cogl/cogl-enum-types.c
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#130717): <a href="https://lists.openembedded.org/g/openembedded-devel/message/130717">https://lists.openembedded.org/g/openembedded-devel/message/130717</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/121684077/3618223">https://lists.openembedded.org/mt/121684077/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-3+8nTPVk2/npwd20D+dz--


