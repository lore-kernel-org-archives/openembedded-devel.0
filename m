Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1D9C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 11:23:24 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.25158.1699615396317595201
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 03:23:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id B3C3A57E96
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 12:23:14 +0100 (CET)
Received: from [192.168.178.62] ([84.163.32.113]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1PbV-11mFHs0; Fri, 10 Nov 2023 12:23:13 +0100
Date: Fri, 10 Nov 2023 12:23:40 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][RFC][PATCH] drop GNOMEBASEBUILDCLASS = "meson"
To: openembedded-devel@lists.openembedded.org
Message-Id: <GNNW3S.I6FOC93I1FPO2@t-online.de>
In-Reply-To: <17963F04DC0433D0.7380@lists.openembedded.org>
References: <17963F04DC0433D0.7380@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-nIMrCWUPZ+7dLf1Lp/cT"
X-TOI-EXPURGATEID: 150726::1699615393-FAFFA850-740D3BB9/0/0 CLEAN NORMAL
X-TOI-MSGID: 609983be-d6b8-4b1f-bb6d-41ad5a9334bf
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 11:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106538

--=-nIMrCWUPZ+7dLf1Lp/cT
Content-Type: text/plain; charset=us-ascii; format=flowed

This patch requires changes to the oe-core and is therefore marked as 
RFC. It is sent to illustrate the impact on meta-oe. I will resend it 
when the requested changes to oe-core are accepted.

On Fri, Nov 10 2023 at 12:20:14 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> It is set to meson by default
> ---
>  meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb           | 1 -
>  meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb        | 1 -
>  meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb         | 1 -
>  .../network-manager-applet/network-manager-applet_1.34.0.bb     | 1 -
>  meta-gnome/recipes-gimp/babl/babl_0.1.106.bb                    | 1 -
>  meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb                     | 1 -
>  meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb           | 1 -
>  meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb                  | 1 -
>  meta-gnome/recipes-gnome/eog/eog_45.1.bb                        | 1 -
>  meta-gnome/recipes-gnome/evince/evince_45.0.bb                  | 1 -
>  .../evolution-data-server/evolution-data-server.inc             | 1 +
>  meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb        | 1 -
>  meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb                      | 1 -
>  meta-gnome/recipes-gnome/gedit/gedit_46.1.bb                    | 1 -
>  meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb    | 1 -
>  meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb                | 1 -
>  meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb                    | 1 -
>  meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb                      | 1 -
>  meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb     | 1 -
>  .../recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb   | 1 -
>  .../recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb    | 1 -
>  .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb       | 1 -
>  .../recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb   | 1 -
>  meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb  | 1 -
>  .../recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb     | 1 -
>  .../gnome-control-center/gnome-control-center_45.1.bb           | 1 -
>  meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb    | 1 -
>  .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb | 1 -
>  .../recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb   | 1 -
>  .../gnome-online-accounts/gnome-online-accounts_3.48.0.bb       | 1 -
>  meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb      | 1 -
>  .../recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb     | 1 -
>  meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb    | 1 -
>  .../gnome-settings-daemon/gnome-settings-daemon_45.0.bb         | 1 -
>  .../recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb    | 1 -
>  meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb        | 1 -
>  meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb  | 1 -
>  .../gnome-system-monitor/gnome-system-monitor_45.0.1.bb         | 1 -
>  .../recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb       | 1 -
>  .../recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb   | 1 -
>  meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb      | 1 -
>  meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb          | 1 -
>  meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb                  | 1 -
>  meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb                 | 1 -
>  meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb                | 1 -
>  meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb  | 1 -
>  meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb | 1 -
>  meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb                    | 1 -
>  meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb            | 1 -
>  meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb      | 1 -
>  meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb               | 1 -
>  meta-gnome/recipes-gnome/mutter/mutter_45.1.bb                  | 1 -
>  meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb              | 1 -
>  meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                     | 1 -
>  meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb              | 1 -
>  meta-gnome/recipes-gnome/tecla/tecla_45.0.bb                    | 1 -
>  meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb        | 1 -
>  meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb               | 1 -
>  meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb                | 1 -
>  meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb                | 1 -
>  .../libcloudproviders/libcloudproviders_0.3.4.bb                | 1 -
>  .../xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb         | 1 -
>  meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb      | 1 -
>  .../recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb        | 1 -
>  .../networkmanager/networkmanager_1.44.0.bb                     | 1 -
>  meta-networking/recipes-support/spice/phodav_3.0.bb             | 1 -
>  .../recipes-connectivity/modemmanager/modemmanager_1.22.0.bb    | 1 -
>  meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb             | 1 -
>  meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb                  | 1 -
>  meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb               | 1 -
>  meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb                | 2 
> +-
>  meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb                  | 1 -
>  meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb                       | 1 -
>  meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb                        | 1 -
>  meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb       | 1 +
>  meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb                     | 1 -
>  meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb                 | 1 -
>  meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb           | 1 -
>  meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb                | 1 -
>  meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb           | 1 -
>  meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb                | 1 -
>  81 files changed, 3 insertions(+), 79 deletions(-)
> 
> diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb 
> b/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
> index c94a9590f..5b9717f46 100644
> --- a/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
> +++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
> @@ -7,7 +7,6 @@ DEPENDS = " \
>      libgee \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  EXTRA_OEMESON += "-Dtests=false -Db_lto=false "
> 
>  CFLAGS:append:toolchain-clang = " 
> -Wno-error=implicit-function-declaration"
> diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb 
> b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
> index 8737b6d7e..3bfe38f08 100644
> --- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
> +++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
> @@ -12,7 +12,6 @@ DEPENDS = " \
>      zlib \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
>  GIR_MESON_OPTION = ""
>  VALA_MESON_OPTION = "with-vala"
> diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb 
> b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> index bff9a3360..997a5a71b 100644
> --- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> +++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
> @@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> 
>  DEPENDS = "glib-2.0 gtk+3 gtk4 networkmanager"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gobject-introspection gtk-doc gettext vala 
> features_check
> 
>  REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains 
> <mailto:${@bb.utils.contains>('PACKAGECONFIG','gcr','x11','',d)} 
> opengl"
> diff --git 
> a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb 
> b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
> index 5ce1b9b14..312d759db 100644
> --- 
> a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
> +++ 
> b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
> @@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> 
>  DEPENDS = "gtk+3 libnma libnotify libsecret libgudev networkmanager 
> iso-codes nss"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit features_check gnomebase gsettings gtk-icon-cache gettext 
> pkgconfig
> 
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb 
> b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
> index 5d656adb0..efda79fae 100644
> --- a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
> +++ b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
> @@ -2,7 +2,6 @@ SUMMARY = "Babl is a dynamic, any to any, pixel 
> format conversion library"
>  LICENSE = "LGPL-3.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6" 
> <file://copying;md5=6a6a8e020838b23406c81b19c1d46df6/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  GIR_MESON_OPTION = "enable-gir"
>  VALA_MESON_OPTION = "enable-vapi"
> diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb 
> b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
> index e123e1244..af2945da1 100644
> --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
> +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
> @@ -17,7 +17,6 @@ DEPENDS:append:toolchain-clang  = " openmp"
>  DEPENDS:remove:toolchain-clang:riscv32  = "openmp"
>  DEPENDS:remove:toolchain-clang:powerpc  = "openmp"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  VALA_MESON_OPTION = ""
> 
>  inherit features_check gnomebase gobject-introspection vala
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb 
> b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
> index 31226ef44..32a69a070 100644
> --- a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
> +++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
> @@ -2,7 +2,6 @@ SUMMARY = "Configuration editor for dconf"
>  LICENSE = "GPL-3.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464" 
> <file://copying;md5=1ebbd3e34237af26da5dc08a4e440464/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
>      dconf \
> diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb 
> b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
> index 6641be86e..c5c45a026 100644
> --- a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
> +++ b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
> @@ -7,7 +7,6 @@ SRC_URI[archive.sha256sum] = 
> "cf7f22a4c9200421d8d3325c5c1b8b93a36843650c9f95d645
> 
>  DEPENDS = "dbus glib-2.0 intltool-native"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase bash-completion vala
> 
> diff --git a/meta-gnome/recipes-gnome/eog/eog_45.1.bb 
> b/meta-gnome/recipes-gnome/eog/eog_45.1.bb
> index 41bd5d882..41ed940c0 100644
> --- a/meta-gnome/recipes-gnome/eog/eog_45.1.bb
> +++ b/meta-gnome/recipes-gnome/eog/eog_45.1.bb
> @@ -15,7 +15,6 @@ DEPENDS = " \
>      lcms \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase pkgconfig gsettings gobject-introspection gettext 
> mime-xdg features_check gtk-icon-cache
> 
> diff --git a/meta-gnome/recipes-gnome/evince/evince_45.0.bb 
> b/meta-gnome/recipes-gnome/evince/evince_45.0.bb
> index d97a8a0cf..e2c6b3b82 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_45.0.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_45.0.bb
> @@ -25,7 +25,6 @@ DEPENDS = " \
>      zlib \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase itstool gnome-help pkgconfig gsettings 
> gobject-introspection gettext mime-xdg gi-docgen features_check 
> gtk-icon-cache
> 
> diff --git 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
> index 195b8cb85..2f3bf6198 100644
> --- 
> a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
> +++ 
> b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
>                      
> <file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1> 
> \
>                      
> file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543" 
> <file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543>
> 
> +GNOMEBASEBUILDCLASS = "autotools"
>  inherit gnomebase upstream-version-is-even
> 
>  SRC_URI[archive.sha256sum] = 
> "91f4ffc38a1b8d2fe8939834449ac541c0bff4a39b444edc2a9529344a28e98a"
> diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb 
> b/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
> index f9b6841d6..ce2b6d95b 100644
> --- a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
> +++ b/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
> @@ -2,7 +2,6 @@ SUMMARY = "An archive manager utility for the  GNOME 
> Environment"
>  LICENSE="GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552" 
> <file://copying;md5=59530bdf33659b29e73d4adb9f9f6552/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
>      desktop-file-utils-native \
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb 
> b/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
> index 311d28325..d95ea9013 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
> @@ -17,7 +17,6 @@ DEPENDS = " \
>  REQUIRED_DISTRO_FEATURES = "x11 systemd pam polkit 
> gobject-introspection-data"
>  GIR_MESON_OPTION = ""
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gsettings pkgconfig gobject-introspection gettext 
> systemd useradd itstool gnome-help features_check
>  SRC_URI = 
> "https://download.gnome.org/sources/gdm/${@oe.utils.trim_version("${PV 
> <https://download.gnome.org/sources/gdm/$%7B@oe.utils.trim_version(>}", 
> 1)}/gdm-${PV}.tar.xz"
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb 
> b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> index 0014b512a..c0221b9a7 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
> @@ -3,7 +3,6 @@ SECTION = "x11/gnome"
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=75859989545e37968a99b631ef42722e" 
> <file://copying;md5=75859989545e37968a99b631ef42722e/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
>      appstream-glib-native \
> diff --git 
> a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb 
> b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
> index 42659d0f6..a1495d615 100644
> --- a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
> +++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
> @@ -3,7 +3,6 @@ SUMMARY = "A convenience library for the geocoding"
>  LICENSE = "LGPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605" 
> <file://copying.lib;md5=55ca817ccb7d5b5b66355690e9abc605/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GIR_MESON_OPTION = "enable-introspection"
>  GTKDOC_MESON_OPTION = "enable-gtk-doc"
> 
> diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb 
> b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
> index 19d31f428..8fd658310 100644
> --- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
> +++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
> @@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
> 
>  DEPENDS = "exiv2 python3-pygobject-native"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
> 
>  inherit gnomebase gobject-introspection gtk-doc python3native vala
> diff --git a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb 
> b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
> index 08e50409e..0192fc714 100644
> --- a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
> +++ b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
> @@ -2,7 +2,6 @@ SUMMARY = "GHex - a hex editor for GNOME"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
>      glib-2.0-native \
> diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb 
> b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
> index e91fa1bc6..67efdabd7 100644
> --- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
> +++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
> @@ -2,7 +2,6 @@ SUMMARY = "Javascript bindings for GNOME"
>  LICENSE = "MIT & LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=8dcea832f6acf45d856abfeb2d51ec48" 
> <file://copying;md5=8dcea832f6acf45d856abfeb2d51ec48/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = "mozjs-115 cairo"
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb 
> b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
> index 29aeef1ad..8d602eee4 100644
> --- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
> +++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
> @@ -7,7 +7,6 @@ DEPENDS = " \
>      libarchive \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
>  GTKDOC_MESON_OPTION = "gtk_doc"
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb 
> b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
> index 534f9a4c2..704a0b645 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
> @@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b52fb0a6df395efb7047cb6fc56bfd7e"
> 
>  SECTION = "x11/gnome"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gettext allarch
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb 
> b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
> index e2a885b1f..2a9726312 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
> @@ -11,7 +11,6 @@ DEPENDS = "udev gtk+3 libnotify libcanberra bluez5"
>  GNOMEBN = "gnome-bluetooth"
>  S = "${WORKDIR}/${GNOMEBN}-${PV}"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
> 
>  inherit features_check gnomebase gtk-icon-cache gtk-doc 
> gobject-introspection upstream-version-is-even
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb 
> b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
> index 7cce14dba..1385e4203 100644
> --- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
> +++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
> @@ -18,7 +18,6 @@ DEPENDS = " \
>      libadwaita \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
>  GTKIC_VERSION = "4"
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb 
> b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
> index 3482f76a5..30f532c63 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
> @@ -20,7 +20,6 @@ GIR_MESON_ENABLE_FLAG = 'false'
>  GIR_MESON_DISABLE_FLAG = 'true'
>  VALA_MESON_OPTION = ''
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKIC_VERSION = '4'
> 
>  inherit gnomebase gobject-introspection gnome-help vala 
> gtk-icon-cache gettext features_check
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb 
> b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
> index 1f63c8aeb..bcc19fbed 100644
> --- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
> @@ -17,7 +17,6 @@ DEPENDS = " \
>      geocode-glib \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKIC_VERSION = '4'
>  inherit gnomebase gsettings gtk-icon-cache gettext features_check 
> upstream-version-is-even mime-xdg
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb 
> b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
> index 6aa28fc00..474512daa 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
> @@ -13,7 +13,6 @@ CXXFLAGS += 
> "-D_LIBCPP_ENABLE_CXX17_REMOVED_AUTO_PTR"
>  inherit gnomebase itstool gettext gnome-help features_check meson 
> gtk-icon-cache mime-xdg
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.1.bb 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.1.bb
> index 34e054f99..123c0b89f 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.1.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.1.bb
> @@ -3,7 +3,6 @@ DESCRIPTION = "GNOME Settings is GNOME's main 
> interface for configuration of var
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=75859989545e37968a99b631ef42722e" 
> <file://copying;md5=75859989545e37968a99b631ef42722e/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKIC_VERSION = "4"
> 
>  DEPENDS = " \
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb 
> b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
> index 03411c88d..19bae74ce 100644
> --- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2 
> <file://copying.lib;md5=5f30f0716dfdd0d91eb439ebec522ec2/> \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase itstool pkgconfig upstream-version-is-even 
> gobject-introspection features_check gtk-doc
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb 
> b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb
> index 7cae5dbcc..4f3738cfb 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb
> @@ -16,7 +16,6 @@ DEPENDS = " \
>      xz \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gsettings gtk-icon-cache gettext features_check 
> mime-xdg
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb 
> b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
> index 2b24e54fe..629bc7186 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
> @@ -10,7 +10,6 @@ DEPENDS = " \
>      libadwaita \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb 
> b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> index cd14b4850..47b234e23 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
> @@ -2,7 +2,6 @@ SUMMARY = "GNOME Online Accounts - Single sign-on 
> framework for GNOME"
>  LICENSE = "LGPL-2.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=34c88b124db5fb2762c1676be7dadd36" 
> <file://copying;md5=34c88b124db5fb2762c1676be7dadd36/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gsettings gobject-introspection gtk-icon-cache 
> vala features_check
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb 
> b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
> index 066a50e52..4b05e52ca 100644
> --- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
> @@ -24,7 +24,6 @@ DEPENDS = " \
> 
>  RDEPENDS:${PN} = "tracker-miners"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gettext gnome-help features_check
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb 
> b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
> index fa7e161e9..7377b4f31 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> 
>  SECTION = "x11/gnome"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit features_check gnomebase gettext upstream-version-is-even 
> pkgconfig
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb 
> b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
> index ec5b47b97..c5e27af58 100644
> --- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
> @@ -16,7 +16,6 @@ DEPENDS = " \
>      json-glib \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gettext gsettings upstream-version-is-even 
> features_check
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_45.0.bb 
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_45.0.bb
> index 16b7f2367..90df8bbd0 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_45.0.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_45.0.bb
> @@ -2,7 +2,6 @@ SUMMARY = "Window navigation construction toolkit"
>  LICENSE = "LGPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552" 
> <file://copying;md5=59530bdf33659b29e73d4adb9f9f6552/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gsettings gobject-introspection gettext 
> features_check upstream-version-is-even
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb 
> b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
> index 126e5ef3f..fc3e20486 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
> @@ -2,7 +2,6 @@ SUMMARY = "GNOME Shell Extensions"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101" 
> <file://copying;md5=4cb3a392cbf81a9e685ec13b88c4c101/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gettext gsettings features_check
> 
> diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb 
> b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
> index 472c3bdb8..d35437cb5 100644
> --- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
> @@ -2,7 +2,6 @@ SUMMARY = "GNOME Shell is the graphical shell of the 
> GNOME desktop environment"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
>      libxml2-native \
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb 
> b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
> index d5ed29c8a..f363a2bbe 100644
> --- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
> @@ -2,7 +2,6 @@ SUMMARY = "GNOME Software allows users to easily 
> find, discover and install apps
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION ?= "gtk_doc"
> 
>  inherit gnomebase gsettings itstool gnome-help gtk-icon-cache 
> gtk-doc mime mime-xdg gettext upstream-version-is-even features_check
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_45.0.1.bb 
> b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_45.0.1.bb
> index c8130d27e..b90bbb8e5 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_45.0.1.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_45.0.1.bb
> @@ -13,7 +13,6 @@ DEPENDS = " \
>      libhandy \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gsettings gnome-help itstool gtk-icon-cache 
> features_check gettext
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb 
> b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
> index 13b440dfe..8f91f7cca 100644
> --- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.GFDL;md5=a22d0be1ce2284b67950a4d1673dd1b0 
> <file://copying.gfdl;md5=a22d0be1ce2284b67950a4d1673dd1b0/> \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit pkgconfig meson gsettings gnome-help gettext itstool 
> upstream-version-is-even
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb 
> b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
> index c1e8f3a99..2d310bd05 100644
> --- 
> a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
> +++ 
> b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
> @@ -2,7 +2,6 @@ SUMMARY = "A simple text editor"
>  LICENSE = "GPL-3.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a" 
> <file://copying;md5=8f0e2cd40e05189ec81232da84bd6e1a/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
>      desktop-file-utils-native \
> diff --git 
> a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb 
> b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
> index ffdf2c9d3..a8d6a2ad6 100644
> --- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = " \
> 
>  DEPENDS = "libhandy"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gtk-icon-cache gobject-introspection features_check
> 
> diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb 
> b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
> index 91cbe82ea..40603993f 100644
> --- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
> +++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
> @@ -11,7 +11,6 @@ DEPENDS = " \
>      liboauth \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gnome-help vala
> 
> diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb 
> b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
> index e86f75f0c..14e1ca9fe 100644
> --- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
> +++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
> @@ -7,7 +7,6 @@ DEPENDS = " \
>      glib-2.0 \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gobject-introspection gtk-doc gettext vala
> 
> diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb 
> b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
> index d01067eb1..6a50c22c7 100644
> --- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
> +++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
> @@ -7,7 +7,6 @@ DEPENDS = " \
>      libcanberra \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  VALA_MESON_OPTION = "enable_vala"
> 
> diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb 
> b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
> index 92152aca6..4296f6fbc 100644
> --- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
> +++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
> @@ -2,7 +2,6 @@ SUMMARY = "Image viewer and browser"
>  LICENSE="GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552" 
> <file://copying;md5=59530bdf33659b29e73d4adb9f9f6552/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  REQUIRED_DISTRO_FEATURES = "polkit gobject-introspection-data"
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb 
> b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
> index 979da792f..b10a317fa 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
> @@ -10,7 +10,6 @@ PNAME = "gtksourceview"
> 
>  S = "${WORKDIR}/${PNAME}-${PV}"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase lib_package gettext features_check gtk-doc 
> gobject-introspection vala
> 
> diff --git 
> a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb 
> b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
> index 33830c6a2..f43fe2cf5 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
> @@ -19,7 +19,6 @@ PNAME = "gtksourceview"
> 
>  S = "${WORKDIR}/${PNAME}-${PV}"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase lib_package gettext features_check gi-docgen 
> gtk-icon-cache gobject-introspection vala
> 
> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb 
> b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
> index 61c8fadfd..627b499fe 100644
> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
> @@ -2,7 +2,6 @@ DESCRIPTION = "gvfs is a userspace virtual filesystem"
>  LICENSE = "LGPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e" 
> <file://copying;md5=05df38dd77c35ec8431f212410a3329e/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gsettings bash-completion gettext 
> upstream-version-is-even features_check useradd
> 
>  DEPENDS += "\
> diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb 
> b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
> index 126ef712d..15e3d889f 100644
> --- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
> +++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
> @@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
>  DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth 
> gcr3 json-glib"
> 
>  GTKDOC_MESON_OPTION = "gtk_doc"
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase pkgconfig gettext gtk-doc vala 
> gobject-introspection manpages features_check
> 
> diff --git 
> a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb 
> b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
> index 06353efab..c30edd15c 100644
> --- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
> +++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
> @@ -3,7 +3,6 @@ SUMMARY = "A library to access weather information 
> from online services"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GNOMEBN = "libgweather"
>  S = "${WORKDIR}/${GNOMEBN}-${PV}"
> 
> diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb 
> b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
> index 5b4de3290..c7f798911 100644
> --- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
> +++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
> @@ -10,7 +10,6 @@ DEPENDS = "cairo glib-2.0 gtk+3"
>  PACKAGECONFIG ??= "${@bb.utils.filter 
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG[x11] = 
> "-Dstartup_notification=enabled,-Dstartup_notification=disabled,startup-notification 
> libxres"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb 
> b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
> index 541991ba8..60347aa49 100644
> --- a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
> +++ b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
> @@ -22,7 +22,6 @@ DEPENDS = " \
>      xwayland \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gsettings gobject-introspection gettext 
> features_check
> 
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb 
> b/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
> index 4853c0ce3..9c0d154ec 100644
> --- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
> @@ -4,7 +4,6 @@ SECTION = "x11/gnome"
>  LICENSE="GPL-3.0-only"
>  LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504" 
> <file://license;md5=d32239bcb673463ab874e80d47fae504/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
>      appstream-glib-native \
> diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb 
> b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> index e46cbfc69..738b07e8c 100644
> --- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> +++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
> @@ -3,7 +3,6 @@ HOMEPAGE = "https://wiki.gnome.org/Projects/Librest"
>  LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1" 
> <file://copying;md5=2d5025d4aa3495befef8f17206a5b0a1/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  DEPENDS = " \
>      glib-2.0 \
> diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb 
> b/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
> index c9d32c394..3523bad3e 100644
> --- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
> +++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
> @@ -4,7 +4,6 @@ LICENSE = "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 
> <file://copying;md5=d32239bcb673463ab874e80d47fae504/> \
>                      
> file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607" 
> <file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gnome-help gettext systemd 
> upstream-version-is-even gsettings mime mime-xdg
> 
>  DEPENDS += " \
> diff --git a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb 
> b/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
> index c047e29b7..197db17e9 100644
> --- a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
> +++ b/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
> @@ -10,7 +10,6 @@ DEPENDS = " \
>  "
> 
>  REQUIRED_DISTRO_FEATURES = "wayland"
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase pkgconfig  features_check
> 
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb 
> b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
> index 426082bd5..2be6beacb 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
> +++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
> @@ -12,7 +12,6 @@ DEPENDS = " \
>      zlib \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gsettings gobject-introspection vala 
> bash-completion features_check
> 
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb 
> b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
> index d2eb392a0..e7f0beb02 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
> +++ b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
> @@ -18,7 +18,6 @@ DEPENDS = " \
>      libstemmer \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gettext gnomebase gsettings gobject-introspection vala 
> gtk-doc  bash-completion python3native
> 
> diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb 
> b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
> index 28ba39288..e45ba5481 100644
> --- a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
> +++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a 
> <file://copying.gpl;md5=eb723b61539feef013de476e68b5c50a/> \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase itstool
> 
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb 
> b/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
> index a152e6405..92b9f6655 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
> @@ -3,7 +3,6 @@ SECTION = "x11/gnome"
>  LICENSE = "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" 
> <file://copying;md5=4fbd65380cdd255951079008b364516c/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase pkgconfig itstool gtk-icon-cache features_check 
> gettext
> 
> diff --git 
> a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb 
> b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
> index 21fe4d119..1c03f41c2 100644
> --- 
> a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
> +++ 
> b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
> @@ -2,7 +2,6 @@ SUMMARY = "libcloudproviders is a DBus API that 
> allows cloud storage sync client
>  LICENSE="LGPL-3.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02" 
> <file://license;md5=e6a600fd5e1d9cbde2d983680233ad02/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  VALA_MESON_OPTION ?= 'vapigen'
> 
>  DEPENDS = "glib-2.0"
> diff --git 
> a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb 
> b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb
> index 91469934d..6cf706a92 100644
> --- 
> a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb
> +++ 
> b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb
> @@ -17,7 +17,6 @@ DEPENDS = " \
> 
>  RDEPENDS:${PN} = "xdg-desktop-portal xdg-desktop-portal-gtk"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase pkgconfig gsettings features_check
> 
>  REQUIRED_DISTRO_FEATURES = "polkit"
> diff --git 
> a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb 
> b/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
> index 8bc8767d8..a5df37637 100644
> --- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
> +++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
> @@ -22,7 +22,6 @@ REQUIRED_DISTRO_FEATURES = 
> "gobject-introspection-data"
> 
>  SRC_URI[archive.sha256sum] = 
> "736d8adbe8615f6cbc8fcfff9845dc985fd10e16629da236b4b52dbedf0a348b"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
> 
> diff --git 
> a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb 
> b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
> index 90dc6ab49..376dd15d1 100644
> --- 
> a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
> +++ 
> b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
> 
>  DEPENDS = "glib-2.0 gdk-pixbuf"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase gobject-introspection vala features_check
> 
> diff --git 
> a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb 
> b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
> index 8d1c877ba..d213ef650 100644
> --- 
> a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
> +++ 
> b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
> @@ -22,7 +22,6 @@ DEPENDS = " \
>  "
>  DEPENDS:append:class-target = " bash-completion"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gettext update-rc.d systemd gobject-introspection 
> gtk-doc update-alternatives upstream-version-is-even
> 
>  SRC_URI = " \
> diff --git a/meta-networking/recipes-support/spice/phodav_3.0.bb 
> b/meta-networking/recipes-support/spice/phodav_3.0.bb
> index 990e01702..08c65eb25 100644
> --- a/meta-networking/recipes-support/spice/phodav_3.0.bb
> +++ b/meta-networking/recipes-support/spice/phodav_3.0.bb
> @@ -7,7 +7,6 @@ DEPENDS = " \
>      libsoup \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = 'gtk_doc'
>  GTKDOC_MESON_ENABLE_FLAG = 'enabled'
>  GTKDOC_MESON_DISABLE_FLAG = 'disabled'
> diff --git 
> a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb 
> b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> index af1b98cad..6b4336eb8 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c 
> <file://copying.lib;md5=4fbd65380cdd255951079008b364516c/> \
>  "
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase gettext systemd gobject-introspection 
> bash-completion
> 
>  DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb 
> b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
> index 7cac69ece..f40a8144d 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
> 
>  DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GNOMEBN = "glibmm"
>  inherit gnomebase
> 
> diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb 
> b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
> index a6dc8ff20..c78dd55ca 100644
> --- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
> +++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
> 
>  DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase
> 
> diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb 
> b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
> index 1ffdcfd04..56f7b5af6 100644
> --- a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
> +++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
> @@ -2,7 +2,6 @@ SUMMARY = "Common GNOME build files for C++ bindings"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=751419260aa954499f7abaabaa882bbe" 
> <file://copying;md5=751419260aa954499f7abaabaa882bbe/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase
> 
> diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb 
> b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> index f7b54b9b0..0ed6e8235 100644
> --- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> +++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
> @@ -8,7 +8,7 @@ BBCLASSEXTEND = "native"
>  LICENSE = "LGPL-2.1-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24" 
> <file://copying;md5=fbc093901857fcd118f065f900982c24/>
> 
> -PE = "1"
> +GNOMEBASEBUILDCLASS = "autotools"
>  inherit gnomebase vala gobject-introspection
> 
>  do_configure:prepend() {
> diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb 
> b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
> index a152ff2d2..fa47cbd48 100644
> --- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
> +++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> 
>  DEPENDS = "atk glibmm-2.68"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GNOMEBN = "atkmm"
> 
>  inherit gnomebase features_check
> diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb 
> b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
> index f6cb0a1e1..bc637470f 100644
> --- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
> +++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
> @@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
> 
>  DEPENDS = "atk glibmm"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase features_check
> 
> diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb 
> b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
> index a5bb868bb..b3438b4e6 100644
> --- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
> +++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
> @@ -15,7 +15,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
> 
>  CFLAGS += "-D_GNU_SOURCE"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
>  VALA_MESON_OPTION ?= ''
> 
> diff --git 
> a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb 
> b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
> index ceebe5ebd..944747021 100644
> --- a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
> +++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
> @@ -6,6 +6,7 @@ LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" 
> <file://copying;md5=b234ee4d69f5fce4486a80fdaf4a4263/>
> 
>  SECTION = "x11/gnome"
> +GNOMEBASEBUILDCLASS = "autotools"
>  inherit gnomebase allarch
> 
>  SRC_URI[archive.md5sum] = "933258d9c23e218eb6eec9cc1951b053"
> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb 
> b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
> index 28d2bb138..cac6474e7 100644
> --- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
> @@ -10,7 +10,6 @@ DEPENDS = "glib-2.0-native atkmm pangomm glibmm 
> gtk+3 cairomm gdk-pixbuf-native"
> 
>  BPN = "gtkmm"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase features_check
> 
> diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb 
> b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> index 992060342..016981f04 100644
> --- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> +++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
> @@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
> 
>  DEPENDS = "gtk+3"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GTKDOC_MESON_OPTION = "gtk_doc"
> 
>  inherit gnomebase gobject-introspection gi-docgen gtk-icon-cache 
> features_check
> diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb 
> b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
> index b18e1614e..a6872ef0c 100644
> --- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
> +++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
> @@ -3,7 +3,6 @@ SUMMARY = "C++ bindings for Cairo graphics library"
>  LICENSE = "LGPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9" 
> <file://copying;md5=c46bda00ffbb0ba1dac22f8d087f54d9/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase
> 
>  DEPENDS += "boost cairo libsigc++-3"
> diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb 
> b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
> index 8123509f4..54a2b07ca 100644
> --- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
> +++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
> @@ -3,7 +3,6 @@ SUMMARY = "C++ bindings for Cairo graphics library"
>  LICENSE = "LGPL-2.0-only"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9" 
> <file://copying;md5=c46bda00ffbb0ba1dac22f8d087f54d9/>
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  inherit gnomebase
> 
>  DEPENDS += "boost cairo libsigc++-2.0"
> diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb 
> b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
> index b4079f783..86787a6b7 100644
> --- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
> +++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
> 
>  DEPENDS = "mm-common cairomm-1.16 glibmm-2.68 pango"
> 
> -GNOMEBASEBUILDCLASS = "meson"
>  GNOMEBN = "pangomm"
>  inherit gnomebase features_check
> 
> diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb 
> b/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
> index 42074c14a..da822f324 100644
> --- a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
> +++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
> 
>  DEPENDS = "mm-common cairomm glibmm pango"
> 
> -GNOMEBASEBUILDCLASS = "meson"
> 
>  inherit gnomebase features_check
> 
> --
> 2.42.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106537): 
> <https://lists.openembedded.org/g/openembedded-devel/message/106537>
> Mute This Topic: <https://lists.openembedded.org/mt/102504672/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org 
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-devel/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-nIMrCWUPZ+7dLf1Lp/cT
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>This patch requires changes to the oe-core and is therefore marked as RFC. It is sent to illustrate the impact on meta-oe. I will resend it when the requested changes to oe-core are accepted.</div></div><div id="geary-quote" dir="auto"><br>On Fri, Nov 10 2023 at 12:20:14 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">It is set to meson by default
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb           | 1 -
 meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb        | 1 -
 meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb         | 1 -
 .../network-manager-applet/network-manager-applet_1.34.0.bb     | 1 -
 meta-gnome/recipes-gimp/babl/babl_0.1.106.bb                    | 1 -
 meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb                     | 1 -
 meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb           | 1 -
 meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb                  | 1 -
 meta-gnome/recipes-gnome/eog/eog_45.1.bb                        | 1 -
 meta-gnome/recipes-gnome/evince/evince_45.0.bb                  | 1 -
 .../evolution-data-server/evolution-data-server.inc             | 1 +
 meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb        | 1 -
 meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb                      | 1 -
 meta-gnome/recipes-gnome/gedit/gedit_46.1.bb                    | 1 -
 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb    | 1 -
 meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb                | 1 -
 meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb                    | 1 -
 meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb                      | 1 -
 meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb     | 1 -
 .../recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb   | 1 -
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb    | 1 -
 .../recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb       | 1 -
 .../recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb   | 1 -
 meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb  | 1 -
 .../recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb     | 1 -
 .../gnome-control-center/gnome-control-center_45.1.bb           | 1 -
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb    | 1 -
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb | 1 -
 .../recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb   | 1 -
 .../gnome-online-accounts/gnome-online-accounts_3.48.0.bb       | 1 -
 meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb      | 1 -
 .../recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb     | 1 -
 meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb    | 1 -
 .../gnome-settings-daemon/gnome-settings-daemon_45.0.bb         | 1 -
 .../recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb    | 1 -
 meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb        | 1 -
 meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb  | 1 -
 .../gnome-system-monitor/gnome-system-monitor_45.0.1.bb         | 1 -
 .../recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb       | 1 -
 .../recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb   | 1 -
 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb      | 1 -
 meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb          | 1 -
 meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb                  | 1 -
 meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb                 | 1 -
 meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb                | 1 -
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb  | 1 -
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb | 1 -
 meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb                    | 1 -
 meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb            | 1 -
 meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb      | 1 -
 meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb               | 1 -
 meta-gnome/recipes-gnome/mutter/mutter_45.1.bb                  | 1 -
 meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb              | 1 -
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb                     | 1 -
 meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb              | 1 -
 meta-gnome/recipes-gnome/tecla/tecla_45.0.bb                    | 1 -
 meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb        | 1 -
 meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb               | 1 -
 meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb                | 1 -
 meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb                | 1 -
 .../libcloudproviders/libcloudproviders_0.3.4.bb                | 1 -
 .../xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb         | 1 -
 meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb      | 1 -
 .../recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb        | 1 -
 .../networkmanager/networkmanager_1.44.0.bb                     | 1 -
 meta-networking/recipes-support/spice/phodav_3.0.bb             | 1 -
 .../recipes-connectivity/modemmanager/modemmanager_1.22.0.bb    | 1 -
 meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb             | 1 -
 meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb                  | 1 -
 meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb               | 1 -
 meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb                | 2 +-
 meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb                  | 1 -
 meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb                       | 1 -
 meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb                        | 1 -
 meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb       | 1 +
 meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb                     | 1 -
 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb                 | 1 -
 meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb           | 1 -
 meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb                | 1 -
 meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb           | 1 -
 meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb                | 1 -
 81 files changed, 3 insertions(+), 79 deletions(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
index c94a9590f..5b9717f46 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.6.bb
@@ -7,7 +7,6 @@ DEPENDS = " \
     libgee \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 EXTRA_OEMESON += "-Dtests=false -Db_lto=false "
 
 CFLAGS:append:toolchain-clang = " -Wno-error=implicit-function-declaration"
diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
index 8737b6d7e..3bfe38f08 100644
--- a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
@@ -12,7 +12,6 @@ DEPENDS = " \
     zlib \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 GIR_MESON_OPTION = ""
 VALA_MESON_OPTION = "with-vala"
diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
index bff9a3360..997a5a71b 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.10.6.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "glib-2.0 gtk+3 gtk4 networkmanager"
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 
 REQUIRED_DISTRO_FEATURES = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG','gcr','x11','',d)} opengl"
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
index 5ce1b9b14..312d759db 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.34.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "gtk+3 libnma libnotify libsecret libgudev networkmanager iso-codes nss"
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit features_check gnomebase gsettings gtk-icon-cache gettext pkgconfig
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
index 5d656adb0..efda79fae 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.106.bb
@@ -2,7 +2,6 @@ SUMMARY = "Babl is a dynamic, any to any, pixel format conversion library"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6" "="">file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 GIR_MESON_OPTION = "enable-gir"
 VALA_MESON_OPTION = "enable-vapi"
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
index e123e1244..af2945da1 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.46.bb
@@ -17,7 +17,6 @@ DEPENDS:append:toolchain-clang  = " openmp"
 DEPENDS:remove:toolchain-clang:riscv32  = "openmp"
 DEPENDS:remove:toolchain-clang:powerpc  = "openmp"
 
-GNOMEBASEBUILDCLASS = "meson"
 VALA_MESON_OPTION = ""
 
 inherit features_check gnomebase gobject-introspection vala 
diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
index 31226ef44..32a69a070 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_45.0.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "Configuration editor for dconf"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464" "="">file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
     dconf \
diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
index 6641be86e..c5c45a026 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.40.0.bb
@@ -7,7 +7,6 @@ SRC_URI[archive.sha256sum] = "cf7f22a4c9200421d8d3325c5c1b8b93a36843650c9f95d645
 
 DEPENDS = "dbus glib-2.0 intltool-native"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase bash-completion vala
 
diff --git a/meta-gnome/recipes-gnome/eog/eog_45.1.bb b/meta-gnome/recipes-gnome/eog/eog_45.1.bb
index 41bd5d882..41ed940c0 100644
--- a/meta-gnome/recipes-gnome/eog/eog_45.1.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_45.1.bb
@@ -15,7 +15,6 @@ DEPENDS = " \
     lcms \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime-xdg features_check gtk-icon-cache
 
diff --git a/meta-gnome/recipes-gnome/evince/evince_45.0.bb b/meta-gnome/recipes-gnome/evince/evince_45.0.bb
index d97a8a0cf..e2c6b3b82 100644
--- a/meta-gnome/recipes-gnome/evince/evince_45.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_45.0.bb
@@ -25,7 +25,6 @@ DEPENDS = " \
     zlib \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection gettext mime-xdg gi-docgen features_check gtk-icon-cache
 
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
index 195b8cb85..2f3bf6198 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server.inc
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6a6e689d19255cf0557f3fe7d7068212 \
                     <a href="file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1">file://src/camel/camel.h;endline=24;md5=342fc5e9357254bc30c24e43ae47d9a1</a> \
                     <a href="file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543" "="">file://src/libedataserver/e-data-server-util.h;endline=20;md5=8f21a9c80ea82a4fb80b5f959f672543"</a>
 
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase upstream-version-is-even
 
 SRC_URI[archive.sha256sum] = "91f4ffc38a1b8d2fe8939834449ac541c0bff4a39b444edc2a9529344a28e98a"
diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
index f9b6841d6..ce2b6d95b 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "An archive manager utility for the  GNOME Environment"
 LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552" "="">file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
     desktop-file-utils-native \
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb b/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
index 311d28325..d95ea9013 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_45.0.1.bb
@@ -17,7 +17,6 @@ DEPENDS = " \
 REQUIRED_DISTRO_FEATURES = "x11 systemd pam polkit gobject-introspection-data"
 GIR_MESON_OPTION = ""
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext systemd useradd itstool gnome-help features_check
 SRC_URI = "<a href="https://download.gnome.org/sources/gdm/${@oe.utils.trim_version(" ${pv"="">https://download.gnome.org/sources/gdm/${@oe.utils.trim_version("${PV</a>}", 1)}/gdm-${PV}.tar.xz"
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
index 0014b512a..c0221b9a7 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_46.1.bb
@@ -3,7 +3,6 @@ SECTION = "x11/gnome"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=75859989545e37968a99b631ef42722e" "="">file://COPYING;md5=75859989545e37968a99b631ef42722e"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
     appstream-glib-native \
diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
index 42659d0f6..a1495d615 100644
--- a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
+++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
@@ -3,7 +3,6 @@ SUMMARY = "A convenience library for the geocoding"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605" "="">file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_OPTION = "enable-introspection"
 GTKDOC_MESON_OPTION = "enable-gtk-doc"
 
diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
index 19d31f428..8fd658310 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.14.2.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "exiv2 python3-pygobject-native"
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc python3native vala
diff --git a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
index 08e50409e..0192fc714 100644
--- a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
+++ b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
@@ -2,7 +2,6 @@ SUMMARY = "GHex - a hex editor for GNOME"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
     glib-2.0-native \
diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
index e91fa1bc6..67efdabd7 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "Javascript bindings for GNOME"
 LICENSE = "MIT &amp; LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=8dcea832f6acf45d856abfeb2d51ec48" "="">file://COPYING;md5=8dcea832f6acf45d856abfeb2d51ec48"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = "mozjs-115 cairo"
 
diff --git a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
index 29aeef1ad..8d602eee4 100644
--- a/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-autoar/gnome-autoar_0.4.4.bb
@@ -7,7 +7,6 @@ DEPENDS = " \
     libarchive \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 GTKDOC_MESON_OPTION = "gtk_doc"
diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
index 534f9a4c2..704a0b645 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_45.0.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b52fb0a6df395efb7047cb6fc56bfd7e"
 
 SECTION = "x11/gnome"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gettext allarch
 
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
index e2a885b1f..2a9726312 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth3_3.34.5.bb
@@ -11,7 +11,6 @@ DEPENDS = "udev gtk+3 libnotify libcanberra bluez5"
 GNOMEBN = "gnome-bluetooth"
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit features_check gnomebase gtk-icon-cache gtk-doc gobject-introspection upstream-version-is-even
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
index 7cce14dba..1385e4203 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_42.6.bb
@@ -18,7 +18,6 @@ DEPENDS = " \
     libadwaita \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 GTKIC_VERSION = "4"
 
diff --git a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
index 3482f76a5..30f532c63 100644
--- a/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-calculator/gnome-calculator_45.0.2.bb
@@ -20,7 +20,6 @@ GIR_MESON_ENABLE_FLAG = 'false'
 GIR_MESON_DISABLE_FLAG = 'true'
 VALA_MESON_OPTION = ''
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKIC_VERSION = '4'
 
 inherit gnomebase gobject-introspection gnome-help vala gtk-icon-cache gettext features_check
diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
index 1f63c8aeb..bcc19fbed 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_45.1.bb
@@ -17,7 +17,6 @@ DEPENDS = " \
     geocode-glib \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKIC_VERSION = '4'
 inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
 
diff --git a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
index 6aa28fc00..474512daa 100644
--- a/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-commander/gnome-commander_1.16.1.bb
@@ -13,7 +13,6 @@ CXXFLAGS += "-D_LIBCPP_ENABLE_CXX17_REMOVED_AUTO_PTR"
 inherit gnomebase itstool gettext gnome-help features_check meson gtk-icon-cache mime-xdg
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
-GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.1.bb
index 34e054f99..123c0b89f 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.1.bb
@@ -3,7 +3,6 @@ DESCRIPTION = "GNOME Settings is GNOME's main interface for configuration of var
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=75859989545e37968a99b631ef42722e" "="">file://COPYING;md5=75859989545e37968a99b631ef42722e"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKIC_VERSION = "4"
 
 DEPENDS = " \
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
index 03411c88d..19bae74ce 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_44.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = " \
     <a href="file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2">file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2</a> \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspection features_check gtk-doc
 
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb
index 7cae5dbcc..4f3738cfb 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_45.0.bb
@@ -16,7 +16,6 @@ DEPENDS = " \
     xz \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gtk-icon-cache gettext features_check mime-xdg
 
diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
index 2b24e54fe..629bc7186 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_45.0.bb
@@ -10,7 +10,6 @@ DEPENDS = " \
     libadwaita \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
diff --git a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
index cd14b4850..47b234e23 100644
--- a/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-online-accounts/gnome-online-accounts_3.48.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "GNOME Online Accounts - Single sign-on framework for GNOME"
 LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=34c88b124db5fb2762c1676be7dadd36" "="">file://COPYING;md5=34c88b124db5fb2762c1676be7dadd36"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gtk-icon-cache vala features_check
 
diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
index 066a50e52..4b05e52ca 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_44.0.bb
@@ -24,7 +24,6 @@ DEPENDS = " \
 
 RDEPENDS:${PN} = "tracker-miners"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gettext gnome-help features_check
 
diff --git a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
index fa7e161e9..7377b4f31 100644
--- a/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-screenshot/gnome-screenshot_41.0.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SECTION = "x11/gnome"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit features_check gnomebase gettext upstream-version-is-even pkgconfig
 
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
index ec5b47b97..c5e27af58 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_45.0.bb
@@ -16,7 +16,6 @@ DEPENDS = " \
     json-glib \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gettext gsettings upstream-version-is-even features_check
 
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_45.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_45.0.bb
index 16b7f2367..90df8bbd0 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_45.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_45.0.bb
@@ -2,7 +2,6 @@ SUMMARY = "Window navigation construction toolkit"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552" "="">file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check upstream-version-is-even
 
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
index 126e5ef3f..fc3e20486 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell-extensions_44.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "GNOME Shell Extensions"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101" "="">file://COPYING;md5=4cb3a392cbf81a9e685ec13b88c4c101"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gettext gsettings features_check
 
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
index 472c3bdb8..d35437cb5 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_45.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "GNOME Shell is the graphical shell of the GNOME desktop environment"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
     libxml2-native \
diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
index d5ed29c8a..f363a2bbe 100644
--- a/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_45.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "GNOME Software allows users to easily find, discover and install apps
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION ?= "gtk_doc"
 
 inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc mime mime-xdg gettext upstream-version-is-even features_check
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_45.0.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_45.0.1.bb
index c8130d27e..b90bbb8e5 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_45.0.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_45.0.1.bb
@@ -13,7 +13,6 @@ DEPENDS = " \
     libhandy \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gnome-help itstool gtk-icon-cache features_check gettext
 
diff --git a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
index 13b440dfe..8f91f7cca 100644
--- a/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-terminal/gnome-terminal_3.48.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = " \
     <a href="file://COPYING.GFDL;md5=a22d0be1ce2284b67950a4d1673dd1b0">file://COPYING.GFDL;md5=a22d0be1ce2284b67950a4d1673dd1b0</a> \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit pkgconfig meson gsettings gnome-help gettext itstool upstream-version-is-even
 
diff --git a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
index c1e8f3a99..2d310bd05 100644
--- a/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-text-editor/gnome-text-editor_45.1.bb
@@ -2,7 +2,6 @@ SUMMARY = "A simple text editor"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a" "="">file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
     desktop-file-utils-native \
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
index ffdf2c9d3..a8d6a2ad6 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libhandy"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gtk-icon-cache gobject-introspection features_check
 
diff --git a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
index 91cbe82ea..40603993f 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo-plugins_0.3.16.bb
@@ -11,7 +11,6 @@ DEPENDS = " \
     liboauth \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gnome-help vala
 
diff --git a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
index e86f75f0c..14e1ca9fe 100644
--- a/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
+++ b/meta-gnome/recipes-gnome/grilo/grilo_0.3.16.bb
@@ -7,7 +7,6 @@ DEPENDS = " \
     glib-2.0 \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection gtk-doc gettext vala
 
diff --git a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
index d01067eb1..6a50c22c7 100644
--- a/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
+++ b/meta-gnome/recipes-gnome/gsound/gsound_1.0.3.bb
@@ -7,7 +7,6 @@ DEPENDS = " \
     libcanberra \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 VALA_MESON_OPTION = "enable_vala"
 
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
index 92152aca6..4296f6fbc 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_3.12.2.bb
@@ -2,7 +2,6 @@ SUMMARY = "Image viewer and browser"
 LICENSE="GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552" "="">file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 REQUIRED_DISTRO_FEATURES = "polkit gobject-introspection-data"
 
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
index 979da792f..b10a317fa 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.8.2.bb
@@ -10,7 +10,6 @@ PNAME = "gtksourceview"
 
 S = "${WORKDIR}/${PNAME}-${PV}"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspection vala
 
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
index 33830c6a2..f43fe2cf5 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview5_5.10.0.bb
@@ -19,7 +19,6 @@ PNAME = "gtksourceview"
 
 S = "${WORKDIR}/${PNAME}-${PV}"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase lib_package gettext features_check gi-docgen gtk-icon-cache gobject-introspection vala
 
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
index 61c8fadfd..627b499fe 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.52.1.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "gvfs is a userspace virtual filesystem"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=05df38dd77c35ec8431f212410a3329e" "="">file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gsettings bash-completion gettext upstream-version-is-even features_check useradd
 
 DEPENDS += "\
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
index 126ef712d..15e3d889f 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.18.1.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
 DEPENDS = "libxml2 glib-2.0 libsoup-2.4 intltool-native liboauth gcr3 json-glib"
 
 GTKDOC_MESON_OPTION = "gtk_doc"
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase pkgconfig gettext gtk-doc vala gobject-introspection manpages features_check
 
diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
index 06353efab..c30edd15c 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather4_4.4.0.bb
@@ -3,7 +3,6 @@ SUMMARY = "A library to access weather information from online services"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 GNOMEBN = "libgweather"
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
index 5b4de3290..c7f798911 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
@@ -10,7 +10,6 @@ DEPENDS = "cairo glib-2.0 gtk+3"
 PACKAGECONFIG ??= "<a href="mailto:${@bb.utils.filter">${@bb.utils.filter</a>('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[x11] = "-Dstartup_notification=enabled,-Dstartup_notification=disabled,startup-notification libxres"
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
diff --git a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
index 541991ba8..60347aa49 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_45.1.bb
@@ -22,7 +22,6 @@ DEPENDS = " \
     xwayland \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext features_check
 
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
index 4853c0ce3..9c0d154ec 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_45.1.bb
@@ -4,7 +4,6 @@ SECTION = "x11/gnome"
 LICENSE="GPL-3.0-only"
 LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=d32239bcb673463ab874e80d47fae504" "="">file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
     appstream-glib-native \
diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
index e46cbfc69..738b07e8c 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://wiki.gnome.org/Projects/Librest"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1" "="">file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 DEPENDS = " \
     glib-2.0 \
diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
index c9d32c394..3523bad3e 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.44.0.bb
@@ -4,7 +4,6 @@ LICENSE = "GPL-3.0-or-later"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=d32239bcb673463ab874e80d47fae504">file://COPYING;md5=d32239bcb673463ab874e80d47fae504</a> \
                     <a href="file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607" "="">file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gnome-help gettext systemd upstream-version-is-even gsettings mime mime-xdg
 
 DEPENDS += " \
diff --git a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb b/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
index c047e29b7..197db17e9 100644
--- a/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
+++ b/meta-gnome/recipes-gnome/tecla/tecla_45.0.bb
@@ -10,7 +10,6 @@ DEPENDS = " \
 "
 
 REQUIRED_DISTRO_FEATURES = "wayland"
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase pkgconfig  features_check
 
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
index 426082bd5..2be6beacb 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.2.bb
@@ -12,7 +12,6 @@ DEPENDS = " \
     zlib \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala bash-completion features_check
 
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
index d2eb392a0..e7f0beb02 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
@@ -18,7 +18,6 @@ DEPENDS = " \
     libstemmer \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gettext gnomebase gsettings gobject-introspection vala gtk-doc  bash-completion python3native
 
diff --git a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
index 28ba39288..e45ba5481 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-tools_42.1.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = " \
     <a href="file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a">file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a</a> \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase itstool
 
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
index a152e6405..92b9f6655 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_3.44.2.bb
@@ -3,7 +3,6 @@ SECTION = "x11/gnome"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=4fbd65380cdd255951079008b364516c" "="">file://COPYING;md5=4fbd65380cdd255951079008b364516c"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase pkgconfig itstool gtk-icon-cache features_check gettext
 
diff --git a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
index 21fe4d119..1c03f41c2 100644
--- a/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
+++ b/meta-gnome/recipes-support/libcloudproviders/libcloudproviders_0.3.4.bb
@@ -2,7 +2,6 @@ SUMMARY = "libcloudproviders is a DBus API that allows cloud storage sync client
 LICENSE="LGPL-3.0-or-later"
 LIC_FILES_CHKSUM = "<a href="file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02" "="">file://LICENSE;md5=e6a600fd5e1d9cbde2d983680233ad02"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 VALA_MESON_OPTION ?= 'vapigen'
 
 DEPENDS = "glib-2.0"
diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb
index 91469934d..6cf706a92 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gnome_45.0.bb
@@ -17,7 +17,6 @@ DEPENDS = " \
 
 RDEPENDS:${PN} = "xdg-desktop-portal xdg-desktop-portal-gtk"
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase pkgconfig gsettings features_check
 
 REQUIRED_DISTRO_FEATURES = "polkit"
diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
index 8bc8767d8..a5df37637 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.40.4.bb
@@ -22,7 +22,6 @@ REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
 SRC_URI[archive.sha256sum] = "736d8adbe8615f6cbc8fcfff9845dc985fd10e16629da236b4b52dbedf0a348b"
 
-GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_ENABLE_FLAG = 'enabled'
 GIR_MESON_DISABLE_FLAG = 'disabled'
 
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
index 90dc6ab49..376dd15d1 100644
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.6.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gobject-introspection vala features_check
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index 8d1c877ba..d213ef650 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -22,7 +22,6 @@ DEPENDS = " \
 "
 DEPENDS:append:class-target = " bash-completion"
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext update-rc.d systemd gobject-introspection gtk-doc update-alternatives upstream-version-is-even
 
 SRC_URI = " \
diff --git a/meta-networking/recipes-support/spice/phodav_3.0.bb b/meta-networking/recipes-support/spice/phodav_3.0.bb
index 990e01702..08c65eb25 100644
--- a/meta-networking/recipes-support/spice/phodav_3.0.bb
+++ b/meta-networking/recipes-support/spice/phodav_3.0.bb
@@ -7,7 +7,6 @@ DEPENDS = " \
     libsoup \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = 'gtk_doc'
 GTKDOC_MESON_ENABLE_FLAG = 'enabled'
 GTKDOC_MESON_DISABLE_FLAG = 'disabled'
diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
index af1b98cad..6b4336eb8 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = " \
     <a href="file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c">file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c</a> \
 "
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext systemd gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
index 7cac69ece..f40a8144d 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.78.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
 
 DEPENDS = "mm-common glib-2.0 libsigc++-3 glib-2.0-native"
 
-GNOMEBASEBUILDCLASS = "meson"
 GNOMEBN = "glibmm"
 inherit gnomebase
 
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
index a6dc8ff20..c78dd55ca 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm_2.66.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=42dfffebc56fec7527aac53b7a89d1d8 \
 
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0 glib-2.0-native"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase
 
diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
index 1ffdcfd04..56f7b5af6 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.4.bb
@@ -2,7 +2,6 @@ SUMMARY = "Common GNOME build files for C++ bindings"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=751419260aa954499f7abaabaa882bbe" "="">file://COPYING;md5=751419260aa954499f7abaabaa882bbe"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase
 
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
index f7b54b9b0..0ed6e8235 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.20.6.bb
@@ -8,7 +8,7 @@ BBCLASSEXTEND = "native"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=fbc093901857fcd118f065f900982c24" "="">file://COPYING;md5=fbc093901857fcd118f065f900982c24"</a>
 
-PE = "1"
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase vala gobject-introspection
 
 do_configure:prepend() {
diff --git a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
index a152ff2d2..fa47cbd48 100644
--- a/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm-2.36_2.36.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 DEPENDS = "atk glibmm-2.68"
 
-GNOMEBASEBUILDCLASS = "meson"
 GNOMEBN = "atkmm"
 
 inherit gnomebase features_check
diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
index f6cb0a1e1..bc637470f 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.2.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 DEPENDS = "atk glibmm"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase features_check
 
diff --git a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
index a5bb868bb..b3438b4e6 100644
--- a/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
+++ b/meta-oe/recipes-gnome/gcr/gcr3_3.41.1.bb
@@ -15,7 +15,6 @@ CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
 
 CFLAGS += "-D_GNU_SOURCE"
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 VALA_MESON_OPTION ?= ''
 
diff --git a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
index ceebe5ebd..944747021 100644
--- a/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
+++ b/meta-oe/recipes-gnome/gnome-common/gnome-common_3.18.0.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263" "="">file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"</a>
 
 SECTION = "x11/gnome"
+GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase allarch
 
 SRC_URI[archive.md5sum] = "933258d9c23e218eb6eec9cc1951b053"
diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
index 28d2bb138..cac6474e7 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.7.bb
@@ -10,7 +10,6 @@ DEPENDS = "glib-2.0-native atkmm pangomm glibmm gtk+3 cairomm gdk-pixbuf-native"
 
 BPN = "gtkmm"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase features_check
 
diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
index 992060342..016981f04 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4b54a1fd55a448865a0b32d41598759d"
 
 DEPENDS = "gtk+3"
 
-GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gi-docgen gtk-icon-cache features_check
diff --git a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
index b18e1614e..a6872ef0c 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm-1.16_1.18.0.bb
@@ -3,7 +3,6 @@ SUMMARY = "C++ bindings for Cairo graphics library"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9" "="">file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase
 
 DEPENDS += "boost cairo libsigc++-3"
diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
index 8123509f4..54a2b07ca 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.3.bb
@@ -3,7 +3,6 @@ SUMMARY = "C++ bindings for Cairo graphics library"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "<a href="file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9" "="">file://COPYING;md5=c46bda00ffbb0ba1dac22f8d087f54d9"</a>
 
-GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase
 
 DEPENDS += "boost cairo libsigc++-2.0"
diff --git a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
index b4079f783..86787a6b7 100644
--- a/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm-2.48_2.50.1.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 DEPENDS = "mm-common cairomm-1.16 glibmm-2.68 pango"
 
-GNOMEBASEBUILDCLASS = "meson"
 GNOMEBN = "pangomm"
 inherit gnomebase features_check
 
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
index 42074c14a..da822f324 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.46.2.bb
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
 
 DEPENDS = "mm-common cairomm glibmm pango"
 
-GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase features_check
 
<div>-- 
</div>2.42.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#106537): <a href="https://lists.openembedded.org/g/openembedded-devel/message/106537">https://lists.openembedded.org/g/openembedded-devel/message/106537</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/102504672/3618223">https://lists.openembedded.org/mt/102504672/3618223</a>
Group Owner: <a href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-nIMrCWUPZ+7dLf1Lp/cT--


