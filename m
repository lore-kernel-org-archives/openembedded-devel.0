Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F2CC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 08:32:09 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.93366.1723624327252867049
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 01:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout04.t-online.de (Postfix) with SMTP id 8EB40AD3C
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 10:32:03 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.175.216]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1se9QH-2SWdvM0; Wed, 14 Aug 2024 10:32:01 +0200
Date: Wed, 14 Aug 2024 10:33:26 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [RFC][meta-oe][PATCH] cleanup after polkit fix
To: openembedded-devel@lists.openembedded.org
Message-Id: <Q397IS.PMEL4D9X4N1Y2@t-online.de>
In-Reply-To: <17EB8B10B243E788.10903@lists.openembedded.org>
References: <17EB8B10B243E788.10903@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-qIfzh6oRi0Y8oBYNAfef"
X-TOI-EXPURGATEID: 150726::1723624321-DAFFA85B-2CF8C4E6/0/0 CLEAN NORMAL
X-TOI-MSGID: 1edcff37-ab63-452d-b363-0f5f74c1c1c7
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 08:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111800

--=-qIfzh6oRi0Y8oBYNAfef
Content-Type: text/plain; charset=us-ascii; format=flowed

RFC because it requires a change to systemd that I recently proposed 
for oe-core

On Wed, Aug 14 2024 at 10:30:09 AM +02:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> This commit removes the need to fix polkit permissions:
> <https://git.openembedded.org/meta-openembedded/commit/?h=master-next&id=d5e90541f8e35916abc930b2da6de037b23d51a1>
> 
> That allows to do some cleanup
> ---
>  .../gnome-remote-desktop_46.2.bb                    | 12 +-----------
>  .../gnome-control-center_46.2.bb                    | 12 +-----------
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb        | 11 +----------
>  .../recipes-connectivity/blueman/blueman_2.4.3.bb   | 11 +----------
>  meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb           | 13 
> +------------
>  meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb  | 11 +----------
>  meta-oe/recipes-gnome/malcontent/malcontent.bb      | 11 +----------
>  meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb | 13 
> +------------
>  8 files changed, 8 insertions(+), 86 deletions(-)
> 
> diff --git 
> a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb 
> b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
> index 59ae9383d..a16a02aa7 100644
> --- 
> a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
> +++ 
> b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> 
>  GNOMEBASEBUILDCLASS = "meson"
> 
> -inherit gnomebase gettext gsettings features_check useradd
> +inherit gnomebase gettext gsettings features_check
> 
>  REQUIRED_DISTRO_FEATURES = "opengl polkit"
> 
> @@ -36,15 +36,5 @@ PACKAGECONFIG[vnc] = 
> "-Dvnc=true,-Dvnc=false,libvncserver"
>  PACKAGECONFIG[rdp] = "-Drdp=true,-Drdp=false,freerdp3 fuse3 
> libxkbcommon"
>  PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> 
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 polkitd"
> -
> -do_install:append() {
> -    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
> -        chmod 700 ${D}${datadir}/polkit-1/rules.d
> -        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> -    fi
> -}
> -
>  PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
>  FILES:${PN} += "${systemd_user_unitdir} ${systemd_system_unitdir} 
> ${datadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.2.bb 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.2.bb
> index 152e803b5..ae96caf94 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.2.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.2.bb
> @@ -33,7 +33,7 @@ DEPENDS = " \
>      upower \
>  "
> 
> -inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext 
> upstream-version-is-even bash-completion features_check useradd
> +inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext 
> upstream-version-is-even bash-completion features_check
> 
>  REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd x11"
> 
> @@ -52,16 +52,6 @@ EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
> 
>  export XDG_DATA_DIRS = "${STAGING_DATADIR}"
> 
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 polkitd"
> -
> -do_install:append() {
> -    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
> -        chmod 700 ${D}${datadir}/polkit-1/rules.d
> -        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> -    fi
> -}
> -
>  PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
> 
>  FILES:${PN} += " \
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb 
> b/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
> index 01cdb4eef..6549b1900 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "gvfs is a userspace virtual filesystem"
>  LICENSE = "LGPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e" 
> <file://copying;md5=05df38dd77c35ec8431f212410a3329e/>
> 
> -inherit gnomebase gsettings bash-completion gettext 
> upstream-version-is-even features_check useradd
> +inherit gnomebase gsettings bash-completion gettext 
> upstream-version-is-even features_check
> 
>  DEPENDS += "\
>      dbus \
> @@ -77,16 +77,7 @@ PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, 
> fuse3"
>  # libcdio-paranoia recipe doesn't exist yet
>  PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
> 
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 polkitd"
> -
>  do_install:append() {
> -    if ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'polkit', 'true', 
> 'false', d)}; then
> -        # Fix up permissions on polkit rules.d to work with rpm4 
> constraints
> -        chmod 700 ${D}${datadir}/polkit-1/rules.d
> -        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> -    fi
> -
>      # After rebuilds (not from scracth) it can happen that the 
> executables in
>      # libexec ar missing executable permission flag. Not sure but it 
> came up
>      # during transition to meson. Looked into build files and logs 
> but could
> diff --git 
> a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb 
> b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> index df2a226f0..766903519 100644
> --- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> +++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> 
>  DEPENDS = "gtk+3 glib-2.0 bluez5 python3-pygobject 
> python3-cython-native"
> 
> -inherit meson gettext systemd gsettings pkgconfig python3native 
> gtk-icon-cache useradd features_check
> +inherit meson gettext systemd gsettings pkgconfig python3native 
> gtk-icon-cache features_check
> 
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> 
> @@ -56,12 +56,3 @@ do_install:append() {
>                                                
> ${D}${bindir}/blueman-services \
>                                                
> ${D}${bindir}/blueman-tray
>  }
> -
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
> -
> -do_install:append() {
> -        # Fix up permissions on polkit rules.d to work with rpm4 
> constraints
> -        chmod 700 ${D}/${datadir}/polkit-1/rules.d
> -        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
> -}
> diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb 
> b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
> index d9059daa5..4e131f61f 100644
> --- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
> +++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
> @@ -14,7 +14,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>  # Machine-specific as we examine MACHINE_FEATURES to decide whether 
> to build the UEFI plugins
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> 
> -inherit meson vala gobject-introspection systemd bash-completion 
> pkgconfig gi-docgen ptest manpages useradd
> +inherit meson vala gobject-introspection systemd bash-completion 
> pkgconfig gi-docgen ptest manpages
> 
>  GIDOCGEN_MESON_OPTION = 'docs'
>  GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
> @@ -116,17 +116,6 @@ DISABLE_NON_X86:x86 = ""
>  DISABLE_NON_X86:x86-64 = ""
>  PACKAGECONFIG:remove = "${DISABLE_NON_X86}"
> 
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
> -
> -do_install:append() {
> -    if ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'polkit', 'true', 
> 'false', d)}; then
> -        #Fix up permissions on polkit rules.d to work with rpm4 
> constraints
> -        chmod 700 ${D}/${datadir}/polkit-1/rules.d
> -        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
> -    fi
> -}
> -
>  FILES:${PN} += "${libdir}/fwupd-plugins-* \
>                  ${libdir}/fwupd-${PV} \
>                  ${systemd_unitdir} \
> diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb 
> b/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
> index e4b130741..f8d211236 100644
> --- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
> +++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
> @@ -12,7 +12,7 @@ SRCREV = "b026910d1c18900e9daf07c429f7e901eb1c3f20"
> 
>  S = "${WORKDIR}/git"
> 
> -inherit meson pkgconfig gettext systemd gtk-doc 
> gobject-introspection python3native useradd mime features_check
> +inherit meson pkgconfig gettext systemd gtk-doc 
> gobject-introspection python3native mime features_check
> 
>  REQUIRED_DISTRO_FEATURES = "polkit"
> 
> @@ -76,12 +76,3 @@ EXTRA_OEMESON = " \
>  "
> 
>  FILES:${PN} += "${libdir} ${datadir}"
> -
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 polkitd"
> -
> -do_install:append() {
> -    chmod 0700 ${D}/${datadir}/polkit-1/rules.d
> -    chown polkitd ${D}/${datadir}/polkit-1/rules.d
> -    chgrp root ${D}/${datadir}/polkit-1/rules.d
> -}
> diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb 
> b/meta-oe/recipes-gnome/malcontent/malcontent.bb
> index c4bc50fa8..b30d85080 100644
> --- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
> +++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
> @@ -17,7 +17,7 @@ DEPENDS = " \
> 
>  GIR_MESON_OPTION = ""
> 
> -inherit  meson pkgconfig gobject-introspection gettext 
> features_check useradd
> +inherit  meson pkgconfig gobject-introspection gettext features_check
> 
>  REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
> 
> @@ -26,15 +26,6 @@ PACKAGECONFIG[ui] = ",,,malcontent-ui"
> 
>  EXTRA_OEMESON = "-Dui=disabled"
> 
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
> -
> -do_install:append() {
> -        # Fix up permissions on polkit rules.d to work with rpm4 
> constraints
> -        chmod 700 ${D}/${datadir}/polkit-1/rules.d
> -        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
> -}
> -
>  FILES:${PN} += " \
>  	${libdir}/security/pam_malcontent.so \
>  	${datadir}/accountsservice \
> diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb 
> b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
> index 9fcd1e6f1..5d247fb9c 100644
> --- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
> +++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=bdfdd4986a0853eb84eeba85f9d0c4d6"
> 
>  DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
> 
> -inherit meson pkgconfig gtk-doc gobject-introspection vala useradd
> +inherit meson pkgconfig gtk-doc gobject-introspection vala
> 
>  SRCREV = "8a24f60969d4c235d9918796c38a6a9c42e10131"
>  SRC_URI = 
> "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master 
> \
> @@ -36,17 +36,6 @@ EXTRA_OEMESON += " \
>      -Ddbus-sys-dir=${sysconfdir}/dbus-1/system.d \
>  "
> 
> -USERADD_PACKAGES = "${PN}"
> -USERADD_PARAM:${PN} = "--system --no-create-home --user-group 
> --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
> -
> -do_install:append() {
> -    if ${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'modem-gps', 'true', 
> 'false', d)}; then
> -        # Fix up permissions on polkit rules.d to work with rpm4 
> constraints
> -        chmod 700 ${D}/${datadir}/polkit-1/rules.d
> -        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
> -    fi
> -}
> -
>  FILES:${PN} += " \
>      ${datadir}/dbus-1/system-services \
>      ${datadir}/polkit-1/rules.d \
> --
> 2.45.2
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111799): 
> <https://lists.openembedded.org/g/openembedded-devel/message/111799>
> Mute This Topic: <https://lists.openembedded.org/mt/107891578/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-qIfzh6oRi0Y8oBYNAfef
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>RFC because it requires a change to systemd that I recently proposed for oe-core</div></div><div id="geary-quote" dir="auto"><br>On Wed, Aug 14 2024 at 10:30:09 AM +02:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This commit removes the need to fix polkit permissions:
<a href="https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=d5e90541f8e35916abc930b2da6de037b23d51a1">https://git.openembedded.org/meta-openembedded/commit/?h=master-next&amp;id=d5e90541f8e35916abc930b2da6de037b23d51a1</a>

That allows to do some cleanup
---
 .../gnome-remote-desktop_46.2.bb                    | 12 +-----------
 .../gnome-control-center_46.2.bb                    | 12 +-----------
 meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb        | 11 +----------
 .../recipes-connectivity/blueman/blueman_2.4.3.bb   | 11 +----------
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb           | 13 +------------
 meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb  | 11 +----------
 meta-oe/recipes-gnome/malcontent/malcontent.bb      | 11 +----------
 meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb | 13 +------------
 8 files changed, 8 insertions(+), 86 deletions(-)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
index 59ae9383d..a16a02aa7 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gettext gsettings features_check useradd
+inherit gnomebase gettext gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "opengl polkit"
 
@@ -36,15 +36,5 @@ PACKAGECONFIG[vnc] = "-Dvnc=true,-Dvnc=false,libvncserver"
 PACKAGECONFIG[rdp] = "-Drdp=true,-Drdp=false,freerdp3 fuse3 libxkbcommon"
 PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd"
-
-do_install:append() {
-    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
-        chmod 700 ${D}${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-    fi
-}
-
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 FILES:${PN} += "${systemd_user_unitdir} ${systemd_system_unitdir} ${datadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.2.bb
index 152e803b5..ae96caf94 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_46.2.bb
@@ -33,7 +33,7 @@ DEPENDS = " \
     upower \
 "
 
-inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-version-is-even bash-completion features_check useradd
+inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-version-is-even bash-completion features_check
 
 REQUIRED_DISTRO_FEATURES += "opengl polkit pulseaudio systemd x11"
 
@@ -52,16 +52,6 @@ EXTRA_OEMESON += "-Doe_sysroot=${STAGING_DIR_HOST}"
 
 export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd"
-
-do_install:append() {
-    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
-        chmod 700 ${D}${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-    fi
-}
-
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
 FILES:${PN} += " \
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
index 01cdb4eef..6549b1900 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "gvfs is a userspace virtual filesystem"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=05df38dd77c35ec8431f212410a3329e" "="">file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"</a>
 
-inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check useradd
+inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check
 
 DEPENDS += "\
     dbus \
@@ -77,16 +77,7 @@ PACKAGECONFIG[fuse] = "-Dfuse=true, -Dfuse=false, fuse3"
 # libcdio-paranoia recipe doesn't exist yet
 PACKAGECONFIG[cdda] = "-Dcdda=true, -Dcdda=false, libcdio-paranoia"
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd"
-
 do_install:append() {
-    if <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'polkit', 'true', 'false', d)}; then
-        # Fix up permissions on polkit rules.d to work with rpm4 constraints
-        chmod 700 ${D}${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-    fi
-
     # After rebuilds (not from scracth) it can happen that the executables in
     # libexec ar missing executable permission flag. Not sure but it came up
     # during transition to meson. Looked into build files and logs but could
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index df2a226f0..766903519 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-native"
 
-inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon-cache useradd features_check
+inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon-cache features_check
 
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
@@ -56,12 +56,3 @@ do_install:append() {
                                               ${D}${bindir}/blueman-services \
                                               ${D}${bindir}/blueman-tray
 }
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-        # Fix up permissions on polkit rules.d to work with rpm4 constraints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-}
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
index d9059daa5..4e131f61f 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
@@ -14,7 +14,7 @@ UPSTREAM_CHECK_REGEX = "(?P&lt;pver&gt;\d+(\.\d+)+)"
 # Machine-specific as we examine MACHINE_FEATURES to decide whether to build the UEFI plugins
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit meson vala gobject-introspection systemd bash-completion pkgconfig gi-docgen ptest manpages useradd
+inherit meson vala gobject-introspection systemd bash-completion pkgconfig gi-docgen ptest manpages
 
 GIDOCGEN_MESON_OPTION = 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG = 'enabled'
@@ -116,17 +116,6 @@ DISABLE_NON_X86:x86 = ""
 DISABLE_NON_X86:x86-64 = ""
 PACKAGECONFIG:remove = "${DISABLE_NON_X86}"
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-    if <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
-        #Fix up permissions on polkit rules.d to work with rpm4 constraints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-    fi
-}
-
 FILES:${PN} += "${libdir}/fwupd-plugins-* \
                 ${libdir}/fwupd-${PV} \
                 ${systemd_unitdir} \
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb b/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
index e4b130741..f8d211236 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
@@ -12,7 +12,7 @@ SRCREV = "b026910d1c18900e9daf07c429f7e901eb1c3f20"
 
 S = "${WORKDIR}/git"
 
-inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native useradd mime features_check
+inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection python3native mime features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
@@ -76,12 +76,3 @@ EXTRA_OEMESON = " \
 "
 
 FILES:${PN} += "${libdir} ${datadir}"
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd"
-
-do_install:append() {
-    chmod 0700 ${D}/${datadir}/polkit-1/rules.d
-    chown polkitd ${D}/${datadir}/polkit-1/rules.d
-    chgrp root ${D}/${datadir}/polkit-1/rules.d
-}
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb b/meta-oe/recipes-gnome/malcontent/malcontent.bb
index c4bc50fa8..b30d85080 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
@@ -17,7 +17,7 @@ DEPENDS = " \
 
 GIR_MESON_OPTION = ""
 
-inherit  meson pkgconfig gobject-introspection gettext features_check useradd
+inherit  meson pkgconfig gobject-introspection gettext features_check
 
 REQUIRED_DISTRO_FEATURES = "pam polkit gobject-introspection"
 
@@ -26,15 +26,6 @@ PACKAGECONFIG[ui] = ",,,malcontent-ui"
 
 EXTRA_OEMESON = "-Dui=disabled"
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-        # Fix up permissions on polkit rules.d to work with rpm4 constraints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-}
-
 FILES:${PN} += " \
 	${libdir}/security/pam_malcontent.so \
 	${datadir}/accountsservice \
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
index 9fcd1e6f1..5d247fb9c 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bdfdd4986a0853eb84eeba85f9d0c4d6"
 
 DEPENDS = "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
 
-inherit meson pkgconfig gtk-doc gobject-introspection vala useradd
+inherit meson pkgconfig gtk-doc gobject-introspection vala
 
 SRCREV = "8a24f60969d4c235d9918796c38a6a9c42e10131"
 SRC_URI = "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=https;branch=master \
@@ -36,17 +36,6 @@ EXTRA_OEMESON += " \
     -Ddbus-sys-dir=${sysconfdir}/dbus-1/system.d \
 "
 
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM:${PN} = "--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-    if <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'modem-gps', 'true', 'false', d)}; then
-        # Fix up permissions on polkit rules.d to work with rpm4 constraints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-    fi
-}
-
 FILES:${PN} += " \
     ${datadir}/dbus-1/system-services \
     ${datadir}/polkit-1/rules.d \
<div>-- 
</div>2.45.2

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#111799): <a href="https://lists.openembedded.org/g/openembedded-devel/message/111799">https://lists.openembedded.org/g/openembedded-devel/message/111799</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/107891578/3618223">https://lists.openembedded.org/mt/107891578/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-qIfzh6oRi0Y8oBYNAfef--


