Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE3EE63C8C
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 17:00:11 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16507.1769533205228003782
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 09:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id 30900DEDD;
	Tue, 27 Jan 2026 17:59:42 +0100 (CET)
Received: from [192.168.178.36] ([79.219.235.64]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vkmPf-3LORxQ0; Tue, 27 Jan 2026 17:59:35 +0100
Date: Tue, 27 Jan 2026 17:59:30 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] mutter: fix build without x11 in
 DISTRO_FEATURES
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <6J8J9T.2DTOLPWTKIKN@t-online.de>
In-Reply-To: <188EA4FDAF37B017.3302988@lists.openembedded.org>
References: <188EA4FDAF37B017.3302988@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-iuvLhT9HvrobW4YXNPsd"
X-TOI-EXPURGATEID: 150726::1769533175-C37D7C6F-492750B3/0/0 CLEAN NORMAL
X-TOI-MSGID: d55c61a0-d901-415e-b429-11e5abd65d25
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 17:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123956

--=-iuvLhT9HvrobW4YXNPsd
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: fix dependency names xwayland packageconfig

On Tue, Jan 27 2026 at 17:58:13 +01:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> Signed-off-by: Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>>
> ---
>  .../recipes-gnome/mutter/mutter_48.7.bb       | 33 
> +++++++++++--------
>  1 file changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb 
> b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
> index 0dbdb4b31a..7305930a06 100644
> --- a/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
> +++ b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
> @@ -3,8 +3,6 @@ LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> 
>  DEPENDS = " \
> -    wayland-native \
> -    virtual/libx11 \
>      colord \
>      graphene \
>      gtk4 \
> @@ -15,14 +13,15 @@ DEPENDS = " \
>      json-glib \
>      libdisplay-info \
>      libei \
> -    libxcvt-native \
> -    libxtst \
> -    libxkbfile \
>      python3-argcomplete-native \
>      python3-docutils-native \
> -    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'xinerama', 
> '', d)} \
> -    xwayland \
> -"
> +    virtual/egl \
> +    virtual/libgles2 \
> +    wayland \
> +    wayland-native \
> +    wayland-protocols \
> +    libxcvt-native \
> +    "
> 
> 
>  inherit gnomebase gsettings gobject-introspection gettext 
> features_check
> @@ -30,8 +29,8 @@ inherit gnomebase gsettings gobject-introspection 
> gettext features_check
>  SRC_URI += "file://0001-Dont-use-system-sysprof-dbus-folder.patch" 
> <file://0001-dont-use-system-sysprof-dbus-folder.patch/>
>  SRC_URI[archive.sha256sum] = 
> "ec102aa3cbb0e39001206627aca3055314555f70609de5e6c2b7efcd1fa90f20"
> 
> -# x11 is still manadatory - see meson.build
> -REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"
> +REQUIRED_DISTRO_FEATURES = "wayland polkit"
> +ANY_OF_DISTRO_FEATURES = "opengl vulkan"
> 
>  # systemd can be replaced by libelogind (not available atow - make 
> systemd
>  # mandatory distro feature)
> @@ -41,27 +40,33 @@ REQUIRED_DISTRO_FEATURES += "systemd"
>  # profiler requires sysprof 3.34 which is not willing to build atow
>  PACKAGECONFIG ??= " \
>      native-backend \
> -    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl x11', 
> 'opengl glx', '', d)} \
> -    startup-notification \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'x11', 'x11 opengl 
> glx sm xwayland startup-notification', '', d)} \
> +    ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'systemd', 'logind 
> udev', '', d)} \
>      gnome-desktop \
> +    egl \
>  "
> 
>  EXTRA_OEMESON += " \
>      -Dtests=disabled \
> -    -Dxwayland_path=${bindir}/Xwayland \
>  "
> 
>  # combi-config - see meson_options.txt for more details
>  PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, 
> -Dnative_backend=false -Dudev=false, libdrm virtual/libgbm libinput 
> ${LOGIND} virtual/egl virtual/libgles2 udev"
> -PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false, 
> virtual/libgl"
>  PACKAGECONFIG[glx] = "-Dglx=true, -Dglx=false"
> +PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false,virtual/libgl"
> +PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,virtual/egl"
>  PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, 
> libwacom"
>  # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
>  PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, 
> -Dremote_desktop=false, pipewire"
>  PACKAGECONFIG[gnome-desktop] = "-Dlibgnome_desktop=true, 
> -Dlibgnome_desktop=false, gnome-desktop gnome-settings-daemon"
> +PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
> +PACKAGECONFIG[udev] = "-Dudev=true, -Dudev=false"
> +PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
>  PACKAGECONFIG[sound-player] = "-Dsound_player=true, 
> -Dsound_player=false, libcanberra"
>  PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
>  PACKAGECONFIG[startup-notification] = "-Dstartup_notification=true, 
> -Dstartup_notification=false, startup-notification, 
> startup-notification"
> +PACKAGECONFIG[x11] = "-Dx11=true, -Dx11=false, virtual/libx11"
> +PACKAGECONFIG[xwayland] = "-Dxwayland=true, -Dxwayland=false, libxcb 
> libxi xcomposite libxcursor xdamage xext libxfixes xkeyboard-config 
> virtual/libx11 xinerama xau"
> 
>  MUTTER_API_NAME = "mutter-16"
> 
> --
> 2.52.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123955): 
> <https://lists.openembedded.org/g/openembedded-devel/message/123955>
> Mute This Topic: <https://lists.openembedded.org/mt/117492034/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-iuvLhT9HvrobW4YXNPsd
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: fix dependency names xwayland packageconfig</div></div><div id="geary-quote" dir="auto"><br>On Tue, Jan 27 2026 at 17:58:13 +01:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
---
 .../recipes-gnome/mutter/mutter_48.7.bb       | 33 +++++++++++--------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
index 0dbdb4b31a..7305930a06 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
@@ -3,8 +3,6 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
 
 DEPENDS = " \
-    wayland-native \
-    virtual/libx11 \
     colord \
     graphene \
     gtk4 \
@@ -15,14 +13,15 @@ DEPENDS = " \
     json-glib \
     libdisplay-info \
     libei \
-    libxcvt-native \
-    libxtst \
-    libxkbfile \
     python3-argcomplete-native \
     python3-docutils-native \
-    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'xinerama', '', d)} \
-    xwayland \
-"
+    virtual/egl \
+    virtual/libgles2 \
+    wayland \
+    wayland-native \
+    wayland-protocols \
+    libxcvt-native \
+    "
 
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
@@ -30,8 +29,8 @@ inherit gnomebase gsettings gobject-introspection gettext features_check
 SRC_URI += "<a href="file://0001-Dont-use-system-sysprof-dbus-folder.patch" "="">file://0001-Dont-use-system-sysprof-dbus-folder.patch"</a>
 SRC_URI[archive.sha256sum] = "ec102aa3cbb0e39001206627aca3055314555f70609de5e6c2b7efcd1fa90f20"
 
-# x11 is still manadatory - see meson.build
-REQUIRED_DISTRO_FEATURES = "wayland x11 polkit"
+REQUIRED_DISTRO_FEATURES = "wayland polkit"
+ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 # systemd can be replaced by libelogind (not available atow - make systemd
 # mandatory distro feature)
@@ -41,27 +40,33 @@ REQUIRED_DISTRO_FEATURES += "systemd"
 # profiler requires sysprof 3.34 which is not willing to build atow
 PACKAGECONFIG ??= " \
     native-backend \
-    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'opengl x11', 'opengl glx', '', d)} \
-    startup-notification \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'x11', 'x11 opengl glx sm xwayland startup-notification', '', d)} \
+    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'systemd', 'logind udev', '', d)} \
     gnome-desktop \
+    egl \
 "
 
 EXTRA_OEMESON += " \
     -Dtests=disabled \
-    -Dxwayland_path=${bindir}/Xwayland \
 "
 
 # combi-config - see meson_options.txt for more details
 PACKAGECONFIG[native-backend] = "-Dnative_backend=true -Dudev=true, -Dnative_backend=false -Dudev=false, libdrm virtual/libgbm libinput ${LOGIND} virtual/egl virtual/libgles2 udev"
-PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false, virtual/libgl"
 PACKAGECONFIG[glx] = "-Dglx=true, -Dglx=false"
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false,virtual/libgl"
+PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,virtual/egl"
 PACKAGECONFIG[libwacom] = "-Dlibwacom=true, -Dlibwacom=false, libwacom"
 # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] = "-Dremote_desktop=true, -Dremote_desktop=false, pipewire"
 PACKAGECONFIG[gnome-desktop] = "-Dlibgnome_desktop=true, -Dlibgnome_desktop=false, gnome-desktop gnome-settings-daemon"
+PACKAGECONFIG[sm] = "-Dsm=true, -Dsm=false, libsm"
+PACKAGECONFIG[udev] = "-Dudev=true, -Dudev=false"
+PACKAGECONFIG[logind] = "-Dlogind=true, -Dlogind=false, systemd"
 PACKAGECONFIG[sound-player] = "-Dsound_player=true, -Dsound_player=false, libcanberra"
 PACKAGECONFIG[profiler] = "-Dprofiler=true,-Dprofiler=false,sysprof"
 PACKAGECONFIG[startup-notification] = "-Dstartup_notification=true, -Dstartup_notification=false, startup-notification, startup-notification"
+PACKAGECONFIG[x11] = "-Dx11=true, -Dx11=false, virtual/libx11"
+PACKAGECONFIG[xwayland] = "-Dxwayland=true, -Dxwayland=false, libxcb libxi xcomposite libxcursor xdamage xext libxfixes xkeyboard-config virtual/libx11 xinerama xau"
 
 MUTTER_API_NAME = "mutter-16"
 
<div>-- 
</div>2.52.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#123955): <a href="https://lists.openembedded.org/g/openembedded-devel/message/123955">https://lists.openembedded.org/g/openembedded-devel/message/123955</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/117492034/3618223">https://lists.openembedded.org/mt/117492034/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-iuvLhT9HvrobW4YXNPsd--


