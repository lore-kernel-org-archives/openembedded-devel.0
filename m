Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
	[209.85.222.175])
	by mail.openembedded.org (Postfix) with ESMTP id 55A9E7F82F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 18:57:23 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id d13so4046454qko.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Nov 2019 10:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=41bIDjL8FyA4LhOu2ZeAkDBXlWLp1HnHw4tncqcPCKE=;
	b=FoHOCnCAxaiR82UiVne1vvBMiKOdrJCPuQ+LbQVF+77umlh/uWDAmWtHL2awnYYmNg
	pjk0Br2pnL+zzNX+QIt0xTmHELF2+Tig2GDVjxDdZ9yyoij9Uiqivev/lXXub/jDGm/u
	daoYmccstslrDsCNky4ARcGPoki4KyghXdw09JbAsHk3Ch8Km5yGgyMhcgifOAPvW0NG
	ABwQ3bol6SfygNuY+Z7zoKMXOTp4Bv3gp72APwQJVkoSWuQ0GPW1beSmVo9EYdFvU6PC
	P0EQ4UHDzC9B3EI21jtWXbIcmV0d4hNMV/v4eNJqHXbN+6kuCLlRYD8Pku0KX2iX3h+W
	7amg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=41bIDjL8FyA4LhOu2ZeAkDBXlWLp1HnHw4tncqcPCKE=;
	b=iDF//cxiJleDnZxTu4txrWaF+od9Dzk/KqM4ouJoFmWhyGOVYjYNfMMHxKQhmVIniK
	08Ad1rVL8lSOOglYNSR+z4FMvYQ5FGXtA9nIIwbYXOV8pPuNvDblekwKfFx2yKjDlqvC
	F4yf5wq14GtdPARby5KzFDEFv64qld9x6O8zu+ORCekIqMAn3q2qogmjzy+vVxaUuqhc
	7ZKOt2c5rj3779YyrIFji6HzMKYjPTSfh+RAxT9AfjIP8xox2goQXM9OiUqZjCI4aNMA
	7X1moBeQDYKtwdSjQG8qvLM+JdBfTUlLBJXN86mznagGziFdkRtoeApqiA4AZH4QYrFN
	HF5w==
X-Gm-Message-State: APjAAAXuM45yUZ7Ii5PaJHap3/udHRHxOSymMQy1x0fxSu9HDZcxmYhv
	F0UgQvAu2CoNkkZFnWOIvzD3dczMsVJmEJYE+fR5EgOp
X-Google-Smtp-Source: APXvYqzoj1C6UWE0lF3+wECZXGpmcK+24BO84SHHuWfqIickA69iqZtKd9PcR944pUfRmDe1esLaH0439QH36Vb8nKc=
X-Received: by 2002:a37:8805:: with SMTP id k5mr936733qkd.212.1574362640151;
	Thu, 21 Nov 2019 10:57:20 -0800 (PST)
MIME-Version: 1.0
References: <1574309975-26547-1-git-send-email-denis@denix.org>
In-Reply-To: <1574309975-26547-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2019 10:56:53 -0800
Message-ID: <CAMKF1soTMRpf6kSGZb0uo-WO5tgk7QouSaTGDjktEzYMc86xug@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] recipes: rename distro_features_check to features_check
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 Nov 2019 18:57:23 -0000
Content-Type: text/plain; charset="UTF-8"

staged in master-next, it needed few mechanical changes but take a
look if all is ok in patch on master-next

On Wed, Nov 20, 2019 at 8:20 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> From: Denys Dmytriyenko <denys@ti.com>
>
> Avoid warning due to the class rename in OE-Core.
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb         | 2 +-
>  meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb               | 2 +-
>  meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb                      | 2 +-
>  .../network-manager-applet/network-manager-applet_1.8.24.bb           | 2 +-
>  meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb                 | 2 +-
>  meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb                 | 2 +-
>  meta-gnome/recipes-gnome/evince/evince_3.28.2.bb                      | 2 +-
>  meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                        | 2 +-
>  meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb       | 4 ++--
>  meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb        | 2 +-
>  meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb           | 2 +-
>  .../recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb | 2 +-
>  meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb       | 2 +-
>  meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb      | 2 +-
>  meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb        | 2 +-
>  meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb               | 2 +-
>  meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb             | 2 +-
>  meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb                    | 2 +-
>  meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb       | 2 +-
>  meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb                   | 2 +-
>  meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb                    | 2 +-
>  meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb               | 2 +-
>  meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb                  | 2 +-
>  meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb                  | 2 +-
>  meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb                      | 2 +-
>  meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb             | 2 +-
>  meta-gnome/recipes-support/keybinder/keybinder_3.0.bb                 | 2 +-
>  meta-gnome/recipes-support/libuser/libuser_0.62.bb                    | 2 +-
>  meta-gnome/recipes-support/onboard/onboard_1.4.1.bb                   | 2 +-
>  meta-gnome/recipes-support/usermode/usermode_1.113.bb                 | 2 +-
>  meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb      | 2 +-
>  meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb                   | 2 +-
>  meta-networking/recipes-connectivity/samba/samba_4.10.10.bb           | 2 +-
>  meta-networking/recipes-connectivity/ufw/ufw_0.33.bb                  | 2 +-
>  .../recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb  | 2 +-
>  meta-networking/recipes-extended/dlm/dlm_4.0.9.bb                     | 2 +-
>  meta-networking/recipes-protocols/dante/dante_1.4.1.bb                | 2 +-
>  meta-networking/recipes-support/libldb/libldb_1.5.6.bb                | 2 +-
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb                      | 2 +-
>  meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb                   | 2 +-
>  meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb           | 2 +-
>  meta-oe/recipes-core/dbus/dbus-broker_21.bb                           | 2 +-
>  meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb                  | 2 +-
>  meta-oe/recipes-devtools/geany/geany_1.36.bb                          | 2 +-
>  meta-oe/recipes-devtools/glade/glade_3.22.1.bb                        | 2 +-
>  meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb                            | 2 +-
>  meta-oe/recipes-extended/boinc/boinc-client_7.12.bb                   | 2 +-
>  meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb                     | 2 +-
>  meta-oe/recipes-extended/icewm/icewm_1.5.5.bb                         | 2 +-
>  meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb                     | 2 +-
>  meta-oe/recipes-extended/libreport/libreport_2.10.0.bb                | 2 +-
>  meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb                     | 2 +-
>  meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb                        | 2 +-
>  meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb                | 2 +-
>  meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb                  | 2 +-
>  meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb                 | 2 +-
>  meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb             | 2 +-
>  meta-oe/recipes-extended/polkit/polkit-group-rule.inc                 | 2 +-
>  meta-oe/recipes-extended/polkit/polkit_0.116.bb                       | 2 +-
>  meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb               | 2 +-
>  meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb                             | 2 +-
>  meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb      | 2 +-
>  meta-oe/recipes-gnome/gtk+/gtk+.inc                                   | 2 +-
>  meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb                           | 2 +-
>  meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb                            | 2 +-
>  meta-oe/recipes-gnome/vte9/vte9.inc                                   | 2 +-
>  meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb              | 2 +-
>  meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb                   | 2 +-
>  meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb                       | 2 +-
>  meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb                           | 2 +-
>  meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb                          | 2 +-
>  meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb                          | 2 +-
>  meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb                      | 2 +-
>  meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb                   | 2 +-
>  meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb                   | 2 +-
>  meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb                 | 2 +-
>  meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb                           | 2 +-
>  meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb                     | 2 +-
>  meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb                     | 2 +-
>  meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb                      | 2 +-
>  meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb                   | 2 +-
>  meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb                   | 2 +-
>  meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb     | 2 +-
>  meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb                        | 2 +-
>  meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb                      | 2 +-
>  meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb               | 2 +-
>  meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb           | 2 +-
>  meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc               | 2 +-
>  meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb         | 2 +-
>  meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb     | 2 +-
>  meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb         | 2 +-
>  meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb  | 2 +-
>  meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb            | 2 +-
>  .../xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb                | 2 +-
>  meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb     | 2 +-
>  meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb          | 2 +-
>  meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb            | 2 +-
>  meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb               | 2 +-
>  meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb            | 2 +-
>  meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb        | 2 +-
>  meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb                      | 2 +-
>  meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb              | 2 +-
>  meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb                       | 2 +-
>  meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb                         | 2 +-
>  meta-oe/recipes-navigation/orrery/orrery_2.7.bb                       | 2 +-
>  meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb                   | 2 +-
>  meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb           | 2 +-
>  meta-oe/recipes-support/colord/colord.bb                              | 2 +-
>  meta-oe/recipes-support/fltk/fltk.bb                                  | 2 +-
>  meta-oe/recipes-support/links/links-x11_2.16.bb                       | 2 +-
>  meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb                    | 2 +-
>  meta-oe/recipes-support/remmina/remmina_1.3.6.bb                      | 2 +-
>  meta-oe/recipes-support/synergy/synergy_git.bb                        | 2 +-
>  meta-oe/recipes-support/toscoterm/toscoterm_git.bb                    | 2 +-
>  meta-oe/recipes-support/udisks/udisks2_git.bb                         | 2 +-
>  meta-oe/recipes-support/uim/uim_1.8.8.bb                              | 2 +-
>  meta-oe/recipes-support/upower/upower_0.99.11.bb                      | 2 +-
>  meta-oe/recipes-support/utouch/utouch-mtview_git.bb                   | 2 +-
>  meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb                   | 2 +-
>  meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb                           | 2 +-
>  meta-python/recipes-devtools/python/pamela_0.3.0.bb                   | 2 +-
>  meta-python/recipes-devtools/python/python-pam_1.8.2.bb               | 2 +-
>  meta-python/recipes-devtools/python/python-systemd.inc                | 2 +-
>  meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb         | 2 +-
>  meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb          | 2 +-
>  meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb    | 2 +-
>  .../recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb        | 2 +-
>  meta-xfce/classes/thunar-plugin.bbclass                               | 2 +-
>  meta-xfce/classes/xfce-app.bbclass                                    | 2 +-
>  meta-xfce/classes/xfce-panel-plugin.bbclass                           | 2 +-
>  meta-xfce/recipes-apps/menulibre/menulibre_2.2.1.bb                   | 2 +-
>  meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb                     | 2 +-
>  meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb                 | 2 +-
>  .../xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb             | 2 +-
>  .../recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb   | 2 +-
>  meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb                  | 2 +-
>  meta-xfce/recipes-core/images/core-image-minimal-xfce.bb              | 2 +-
>  meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb                      | 2 +-
>  meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb             | 2 +-
>  meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb               | 2 +-
>  .../recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb | 2 +-
>  meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb | 2 +-
>  meta-xfce/recipes-xfce/exo/exo_0.12.8.bb                              | 2 +-
>  meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb                         | 2 +-
>  meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb       | 2 +-
>  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb                | 2 +-
>  meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb        | 2 +-
>  meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb    | 2 +-
>  meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb           | 2 +-
>  meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb                         | 2 +-
>  meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb      | 2 +-
>  meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb              | 2 +-
>  .../recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb     | 2 +-
>  meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb          | 2 +-
>  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb        | 2 +-
>  meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb                  | 2 +-
>  meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb                          | 2 +-
>  157 files changed, 158 insertions(+), 158 deletions(-)
>
> diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> index c72936c..ddb2cc8 100644
> --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> @@ -12,7 +12,7 @@ DEPENDS = "fuse samba"
>  DEPENDS_append_libc-musl = " libexecinfo"
>
>  # samba depends on libpam
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  inherit autotools gitpkgv pkgconfig
> diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb
> index c1ed626..30224c2 100644
> --- a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb
> +++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.3.bb
> @@ -17,7 +17,7 @@ PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
>  PACKAGECONFIG[bzip2] = "--enable-libbz2,--disable-libbz2,bzip2,"
>  PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline,"
>
> -inherit autotools-brokensep pkgconfig distro_features_check
> +inherit autotools-brokensep pkgconfig features_check
>
>  do_configure_prepend () {
>      touch NEWS
> diff --git a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
> index bf5178c..6b2688f 100644
> --- a/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
> +++ b/meta-gnome/recipes-apps/pinpoint/pinpoint_git.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
>
>  DEPENDS = "glib-2.0 gdk-pixbuf cogl-1.0 clutter-1.0 clutter-gst-3.0 librsvg"
>
> -inherit autotools gettext pkgconfig distro_features_check
> +inherit autotools gettext pkgconfig features_check
>
>  # cogl requires opengl
>  REQUIRED_DISTRO_FEATURES = "opengl"
> diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb
> index 90390e1..0853407 100644
> --- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb
> +++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.24.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>  DEPENDS = "gtk+3 libnotify libsecret networkmanager iso-codes nss"
>
>  GNOMEBASEBUILDCLASS = "meson"
> -inherit distro_features_check gnomebase gsettings gtk-doc gtk-icon-cache gobject-introspection gettext
> +inherit features_check gnomebase gsettings gtk-doc gtk-icon-cache gobject-introspection gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb b/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
> index de143b9..aff994a 100644
> --- a/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
> +++ b/meta-gnome/recipes-extended/gparted/gparted_0.33.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://gparted.org/index.php"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
> -inherit distro_features_check autotools pkgconfig gtk-icon-cache
> +inherit features_check autotools pkgconfig gtk-icon-cache
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
> index 6ef8e8a..69c23d5 100644
> --- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
> +++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.43.bb
> @@ -14,7 +14,7 @@ SRC_URI = " \
>  SRC_URI[md5sum] = "26eed0b5b4af5c7e13c551eceaeab832"
>  SRC_URI[sha256sum] = "ecffc17c62b41e196b72340192a90c4223329df041f135e74c0990860595f828"
>
> -inherit distro_features_check pkgconfig gettext
> +inherit features_check pkgconfig gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> index f45180e..46c9079 100644
> --- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> +++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
>  SECTION = "x11/office"
>  DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
>
> -inherit gnomebase pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
> +inherit gnomebase pkgconfig gtk-icon-cache gsettings gobject-introspection features_check systemd
>
>  SRC_URI = " \
>      ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
> diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> index 6e07208..8a7f2a4 100644
> --- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> +++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
> @@ -9,7 +9,7 @@ DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 glib-2.0-native gtk+ \
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
> -inherit distro_features_check gnomebase gconf gettext python3native
> +inherit features_check gnomebase gconf gettext python3native
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb
> index 0e3cf5b..a2f7359 100644
> --- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.34.1.bb
> @@ -8,7 +8,7 @@ BPN = "gnome-desktop"
>
>  GNOMEBASEBUILDCLASS = "meson"
>
> -inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspection distro_features_check
> +inherit gnomebase itstool pkgconfig upstream-version-is-even gobject-introspection features_check
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
> @@ -24,7 +24,7 @@ SRC_URI += " \
>
>  DEPENDS += "gsettings-desktop-schemas virtual/libx11 gtk+3 startup-notification xkeyboard-config iso-codes udev"
>
> -inherit distro_features_check gtk-doc
> +inherit features_check gtk-doc
>  REQUIRED_DISTRO_FEATURES += "x11"
>
>  GTKDOC_MESON_OPTION = "gtk_doc"
> diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
> index 8dc11c8..a84c218 100644
> --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
> +++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.28.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
>  "
>
> -inherit distro_features_check gnomebase remove-libtool gettext upstream-version-is-even
> +inherit features_check gnomebase remove-libtool gettext upstream-version-is-even
>
>  DEPENDS = " \
>      intltool-native \
> diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
> index b6d212a..3f441d9 100644
> --- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus3_3.32.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>
>  DEPENDS = "python libxml2 popt gtk+3 gnome-common-native"
>
> -inherit distro_features_check gnomebase gettext pkgconfig gobject-introspection upstream-version-is-even
> +inherit features_check gnomebase gettext pkgconfig gobject-introspection upstream-version-is-even
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
> index a9cbf22..a3583d1 100644
> --- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.1.bb
> @@ -14,7 +14,7 @@ DEPENDS = " \
>
>  GNOMEBASEBUILDCLASS = "meson"
>
> -inherit gnomebase gnome-help itstool gtk-icon-cache distro_features_check gettext upstream-version-is-even
> +inherit gnomebase gnome-help itstool gtk-icon-cache features_check gettext upstream-version-is-even
>
>  REQUIRED_DISTRO_FEATURES = "x11 polkit"
>
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
> index 012f8e3..cb1adc4 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
> @@ -10,7 +10,7 @@ PNAME = "gtksourceview"
>
>  S = "${WORKDIR}/${PNAME}-${PV}"
>
> -inherit gnomebase lib_package gettext distro_features_check
> +inherit gnomebase lib_package gettext features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
> index f788493..13f81b4 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview3_3.24.11.bb
> @@ -10,7 +10,7 @@ PNAME = "gtksourceview"
>
>  S = "${WORKDIR}/${PNAME}-${PV}"
>
> -inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection upstream-version-is-even
> +inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspection upstream-version-is-even
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb
> index 63bbb25..bb49550 100644
> --- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb
> +++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview4_4.4.0.bb
> @@ -12,7 +12,7 @@ S = "${WORKDIR}/${PNAME}-${PV}"
>
>  GNOMEBASEBUILDCLASS = "meson"
>
> -inherit gnomebase lib_package gettext distro_features_check gtk-doc gobject-introspection vala
> +inherit gnomebase lib_package gettext features_check gtk-doc gobject-introspection vala
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
> index d9f6431..d3b3bde 100644
> --- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
> +++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
> @@ -6,7 +6,7 @@ SECTION = "x11/gnome/libs"
>
>  DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
>
> -inherit distro_features_check gnomebase gobject-introspection gettext
> +inherit features_check gnomebase gobject-introspection gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
> index a7c8a6f..a990bfc 100644
> --- a/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
> +++ b/meta-gnome/recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb
> @@ -5,7 +5,7 @@ LICENSE = "LGPL-2.0+"
>  LIC_FILES_CHKSUM = "file://tap.c;beginline=1;endline=20;md5=71756eeb144e9eeb177c69aa672b1635"
>  PR = "r4"
>
> -inherit distro_features_check autotools pkgconfig
> +inherit features_check autotools pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
> index b594198..f0c9cdb 100644
> --- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
> +++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.40.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>  inherit gnomebase lib_package gtk-doc gobject-introspection gettext upstream-version-is-even
>
>  # depends on libxau
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  SRC_URI[archive.md5sum] = "c6d67325cd97b2208b41e07e6cc7b947"
> diff --git a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
> index 7f52c42..a087452 100644
> --- a/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
> +++ b/meta-gnome/recipes-gnome/libtimezonemap/libtimezonemap_0.4.6.bb
> @@ -12,7 +12,7 @@ DEPENDS = "gtk+3 gdk-pixbuf libsoup-2.4 json-glib gnome-common-native"
>
>  B = "${S}"
>
> -inherit distro_features_check autotools pkgconfig gobject-introspection
> +inherit features_check autotools pkgconfig gobject-introspection
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb
> index e4829ea..d88161a 100644
> --- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb
> @@ -15,7 +15,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
>  GIR_MESON_ENABLE_FLAG = 'enabled'
>  GIR_MESON_DISABLE_FLAG = 'disabled'
>
> -inherit gnomebase gobject-introspection gtk-doc gettext distro_features_check
> +inherit gnomebase gobject-introspection gtk-doc gettext features_check
>
>  SRC_URI[archive.md5sum] = "89dbe5a1843fd3745b8b64b34a2ef55d"
>  SRC_URI[archive.sha256sum] = "9595835cf28d0fc6af5526a18f77f2fcf3ca8c09e36741bb33915b6e69b8e3ca"
> diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
> index f50b9ce..9eb041c 100644
> --- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
> +++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
> @@ -8,7 +8,7 @@ DEPENDS = "intltool-native gnome-common-native gtk+ gdk-pixbuf-native libxres"
>  PACKAGECONFIG ??= "startup-notification"
>  PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
>
> -inherit gnomebase gobject-introspection distro_features_check
> +inherit gnomebase gobject-introspection features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
> diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
> index 501a449..3cef0d2 100644
> --- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
> +++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6e29c688d912da12b66b73e32b03d812"
>
>  DEPENDS = "xkbcomp gtk+ iso-codes libxi libxml2"
>
> -inherit autotools pkgconfig gettext gobject-introspection distro_features_check
> +inherit autotools pkgconfig gettext gobject-introspection features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
> index ef6ea79..8f15c57 100644
> --- a/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.32.0.bb
> @@ -10,7 +10,7 @@ DEPENDS = "gsettings-desktop-schemas startup-notification \
>             gnome-doc-utils gdk-pixbuf-native \
>             gtk+3 glib-2.0 libcanberra libgtop intltool-native"
>
> -inherit autotools gettext gnomebase distro_features_check
> +inherit autotools gettext gnomebase features_check
>  # depends on startup-notification which depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
> index bdb2f3c..ce55a99 100644
> --- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
> +++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=36cf660aea2b8beffba7945f44a7e748 \
>                      file://COPYING.EXTENSIONS;md5=7579d6678402a1868631bf82c93ff0d4 \
>                      file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
>
> -inherit distro_features_check autotools pkgconfig gobject-introspection
> +inherit features_check autotools pkgconfig gobject-introspection
>
>  MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
>  SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/nautilus/${MAJ_VER}/nautilus-${PV}.tar.xz \
> diff --git a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
> index 0384a5c..c6883ae 100644
> --- a/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/zenity/zenity_3.32.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2+"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>
> -inherit gnomebase itstool gnome-help distro_features_check gettext
> +inherit gnomebase itstool gnome-help features_check gettext
>
>  DEPENDS = " \
>      yelp-tools-native \
> diff --git a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
> index c960b99c..8f6cd04 100644
> --- a/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
> +++ b/meta-gnome/recipes-support/colord-gtk/colord-gtk_0.2.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://www.freedesktop.org/software/colord/"
>  LICENSE = "LGPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=e6a600fd5e1d9cbde2d983680233ad02"
>
> -inherit meson gobject-introspection gettext gtk-doc distro_features_check
> +inherit meson gobject-introspection gettext gtk-doc features_check
>
>  DEPENDS = " \
>      gtk+3 \
> diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> index 0a0a3e6..d567d00 100644
> --- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> +++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
> @@ -18,7 +18,7 @@ SRC_URI = "git://github.com/engla/keybinder.git;branch=keybinder-3.0 \
>
>  RDEPENDS_${PN} = "gtk+"
>
> -inherit distro_features_check autotools gtk-doc gobject-introspection
> +inherit features_check autotools gtk-doc gobject-introspection
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>  do_configure_prepend() {
> diff --git a/meta-gnome/recipes-support/libuser/libuser_0.62.bb b/meta-gnome/recipes-support/libuser/libuser_0.62.bb
> index 74053e4..2c580f8 100644
> --- a/meta-gnome/recipes-support/libuser/libuser_0.62.bb
> +++ b/meta-gnome/recipes-support/libuser/libuser_0.62.bb
> @@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "a58ff4fabb01a25043b142185a33eeea961109dd60d4b40b6a9df4fa3c
>
>  DEPENDS = "popt libpam glib-2.0 python3"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  inherit autotools gettext python3native python3-dir pkgconfig gtk-doc
> diff --git a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> index 4e49bec..03fd051 100644
> --- a/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> +++ b/meta-gnome/recipes-support/onboard/onboard_1.4.1.bb
> @@ -10,7 +10,7 @@ SRC_URI = "https://launchpad.net/onboard/1.4/${PV}/+download/${BPN}-${PV}.tar.gz
>  SRC_URI[md5sum] = "1a2fbe82e934f5b37841d17ff51e80e8"
>  SRC_URI[sha256sum] = "01cae1ac5b1ef1ab985bd2d2d79ded6fc99ee04b1535cc1bb191e43a231a3865"
>
> -inherit distro_features_check setuptools3 pkgconfig gtk-icon-cache gsettings
> +inherit features_check setuptools3 pkgconfig gtk-icon-cache gsettings
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-gnome/recipes-support/usermode/usermode_1.113.bb b/meta-gnome/recipes-support/usermode/usermode_1.113.bb
> index 0527836..a94440c 100644
> --- a/meta-gnome/recipes-support/usermode/usermode_1.113.bb
> +++ b/meta-gnome/recipes-support/usermode/usermode_1.113.bb
> @@ -22,7 +22,7 @@ SRC_URI[sha256sum] = "99fbfd248b411ed0e7c44d1957b0ecde699b5a968a4db5d37228e82e7b
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
> -inherit distro_features_check autotools gettext pkgconfig
> +inherit features_check autotools gettext pkgconfig
>
>  EXTRA_OEMAKE += "INSTALL='install -p'"
>
> diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
> index 3ddb818..7a6b872 100644
> --- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
> +++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.13.bb
> @@ -8,6 +8,6 @@ RRECOMMENDS_${PN} = "adwaita-icon-theme"
>  SRC_URI = "http://download.gnome.org/sources/${BPN}/0.8/${BPN}-${PV}.tar.xz"
>  SRC_URI[md5sum] = "212d85ebce89b32468b59e1164050d40"
>  SRC_URI[sha256sum] = "aa3decb9d532c0e2e505adc592f431fd81c0231ded2981129e87da13712479ed"
> -inherit distro_features_check autotools pkgconfig gettext
> +inherit features_check autotools pkgconfig gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
> index 8ea09b9..fa7174d 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.8.bb
> @@ -24,7 +24,7 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
>  SRC_URI[md5sum] = "744442ec0c145453ea1d257914c8072e"
>  SRC_URI[sha256sum] = "e0149ef4a20a19b9ecd87309c2d27787ee3f47dfd47c6639644bc1f6fd95bdf6"
>
> -inherit autotools gettext pkgconfig distro_features_check
> +inherit autotools gettext pkgconfig features_check
>
>  ARM_INSTRUCTION_SET = "arm"
>  export BUILDCC = "${BUILD_CC}"
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
> index e002a9d..1ad5d55 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.10.10.bb
> @@ -45,7 +45,7 @@ RDEPENDS_${PN}_remove = "perl"
>
>  DEPENDS += "readline virtual/libiconv zlib popt libtalloc libtdb libtevent libldb libbsd libaio libpam libtasn1 jansson"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  DEPENDS_append_libc-musl = " libtirpc"
> diff --git a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> index 19cfe46..6ff103c 100644
> --- a/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> +++ b/meta-networking/recipes-connectivity/ufw/ufw_0.33.bb
> @@ -20,7 +20,7 @@ SRC_URI = " \
>  SRC_URI[md5sum] = "3747b453d76709e5a99da209fc0bb5f5"
>  SRC_URI[sha256sum] = "5f85a8084ad3539b547bec097286948233188c971f498890316dec170bdd1da8"
>
> -inherit setuptools distro_features_check
> +inherit setuptools features_check
>
>  RDEPENDS_${PN} = " \
>                    iptables \
> diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
> index 8523ae8..6b73506 100644
> --- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
> +++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
> @@ -7,7 +7,7 @@ AUTHOR = "Clayton Craft and others"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
>
> -inherit distro_features_check systemd
> +inherit features_check systemd
>
>  RDEPENDS_${PN} = "python3-pygobject python3-dbus"
>  REQUIRED_DISTRO_FEATURES = "systemd"
> diff --git a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
> index 876462d..d8b9daf 100644
> --- a/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
> +++ b/meta-networking/recipes-extended/dlm/dlm_4.0.9.bb
> @@ -23,7 +23,7 @@ S = "${WORKDIR}/dlm-dlm-${PV}"
>
>  DEPENDS = "corosync systemd"
>
> -inherit pkgconfig systemd distro_features_check
> +inherit pkgconfig systemd features_check
>
>  PACKAGECONFIG ??= ""
>
> diff --git a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
> index ffdab22..cfe71dd 100644
> --- a/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
> +++ b/meta-networking/recipes-protocols/dante/dante_1.4.1.bb
> @@ -25,7 +25,7 @@ EXTRA_OECONF += "--without-gssapi --sbindir=${bindir}"
>
>  DEPENDS += "flex-native bison-native libpam"
>
> -inherit autotools-brokensep distro_features_check
> +inherit autotools-brokensep features_check
>
>  REQUIRED_DISTRO_FEATURES = "pam"
>
> diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> index 99eb6f9..6fb691e 100644
> --- a/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> +++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
> @@ -36,7 +36,7 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
>  SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
>  SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
>
> -inherit waf-samba distro_features_check
> +inherit waf-samba features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  S = "${WORKDIR}/ldb-${PV}"
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> index 6054176..d590b05 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -19,7 +19,7 @@ SRCREV = "c17fd14505f30d9e4dbad276f7aa956fd21a637b"
>
>  S = "${WORKDIR}/git"
>
> -inherit waf pkgconfig distro_features_check
> +inherit waf pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES += "opengl"
>
> diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
> index e26a6ff..982514f 100644
> --- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
> +++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.9.bb
> @@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "881d7d6a90b2428479288d64233151448f8990ab4958e0ecaca7eeb3c9
>  S = "${WORKDIR}/hostapd-${PV}"
>  B = "${WORKDIR}/hostapd-${PV}/hostapd"
>
> -inherit update-rc.d systemd pkgconfig distro_features_check
> +inherit update-rc.d systemd pkgconfig features_check
>
>  CONFLICT_DISTRO_FEATURES = "openssl-no-weak-ciphers"
>
> diff --git a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> index c201c86..8763709 100644
> --- a/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> +++ b/meta-oe/recipes-connectivity/obex/obex-data-server_0.4.6.bb
> @@ -10,7 +10,7 @@ SRC_URI = "http://tadas.dailyda.com/software/obex-data-server-${PV}.tar.gz \
>  SRC_URI[md5sum] = "961ca5db6fe9c97024e133cc6203cc4d"
>  SRC_URI[sha256sum] = "b399465ddbd6d0217abedd9411d9d74a820effa0a6a142adc448268d3920094f"
>
> -inherit distro_features_check autotools-brokensep pkgconfig
> +inherit features_check autotools-brokensep pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
> index d639abb..98c50c4 100644
> --- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
> +++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
> @@ -14,7 +14,7 @@ SRC_URI += " file://0004-launcher-fix-build-with-musl-libc.patch"
>  SRC_URI[md5sum] = "a17886a92ab1e0bc2e4b1a274339e388"
>  SRC_URI[sha256sum] = "6fff9a831a514659e2c7d704e76867ce31ebcf43e8d7a62e080c6656f64cd39e"
>
> -inherit meson pkgconfig systemd distro_features_check
> +inherit meson pkgconfig systemd features_check
>
>  DEPENDS = "expat systemd"
>  DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
> diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
> index f768998..c43d23b 100644
> --- a/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
> +++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.36.bb
> @@ -24,7 +24,7 @@ DEPENDS = " \
>      libgit2 \
>  "
>
> -inherit distro_features_check autotools pkgconfig gtk-icon-cache
> +inherit features_check autotools pkgconfig gtk-icon-cache
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-devtools/geany/geany_1.36.bb b/meta-oe/recipes-devtools/geany/geany_1.36.bb
> index 193c198..0d29b13 100644
> --- a/meta-oe/recipes-devtools/geany/geany_1.36.bb
> +++ b/meta-oe/recipes-devtools/geany/geany_1.36.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
>
>  DEPENDS = "gtk+3 libxml-parser-perl-native python3-docutils-native intltool-native"
>
> -inherit distro_features_check autotools pkgconfig perlnative pythonnative gettext
> +inherit features_check autotools pkgconfig perlnative pythonnative gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.1.bb b/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
> index bd4b586..cdd7057 100644
> --- a/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
> +++ b/meta-oe/recipes-devtools/glade/glade_3.22.1.bb
> @@ -9,7 +9,7 @@ DEPENDS = "gtk+ gtk+3 glib-2.0 libxml2 intltool-native \
>  "
>
>
> -inherit distro_features_check autotools pkgconfig gnomebase gobject-introspection
> +inherit features_check autotools pkgconfig gnomebase gobject-introspection
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> index 459ae82..3d77670 100644
> --- a/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> +++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.9.bb
> @@ -35,7 +35,7 @@ S = "${WORKDIR}/${BPN}${PV}/unix"
>  VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
>
>  LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
> -inherit autotools distro_features_check
> +inherit autotools features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.12.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.12.bb
> index e505bb4..d472d32 100644
> --- a/meta-oe/recipes-extended/boinc/boinc-client_7.12.bb
> +++ b/meta-oe/recipes-extended/boinc/boinc-client_7.12.bb
> @@ -37,7 +37,7 @@ SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
>             file://gtk-configure.patch \
>  "
>
> -inherit gettext autotools pkgconfig distro_features_check systemd
> +inherit gettext autotools pkgconfig features_check systemd
>
>  REQUIRED_DISTRO_FEATURES += "opengl"
>
> diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
> index f9fd8ae..898627b 100644
> --- a/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
> +++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
> @@ -7,7 +7,7 @@ LICENSE = "gnuplot"
>  LIC_FILES_CHKSUM = "file://Copyright;md5=243a186fc2fd3b992125d60d5b1bab8f"
>  DEPENDS = "${BPN}-native virtual/libx11 gd readline"
>
> -inherit autotools distro_features_check
> +inherit autotools features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb b/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
> index 63fca1d..fe6de00 100644
> --- a/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
> +++ b/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
> @@ -8,7 +8,7 @@ SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}
>  SRC_URI[md5sum] = "6eba94a7935a0531d2c14eeb1426aeef"
>  SRC_URI[sha256sum] = "f1c1344b20a9e8635143f70ee27930b55f813c15ca61f84d77584d311b6ac027"
>
> -inherit autotools pkgconfig gettext perlnative distro_features_check qemu
> +inherit autotools pkgconfig gettext perlnative features_check qemu
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
> diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
> index 7e4c330..8a2886b 100644
> --- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
> +++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
> @@ -26,6 +26,6 @@ file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  EXTRA_OECONF = " --disable-static --disable-rebuilds --enable-compile-warnings=minimum"
>  DEPENDS += "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native gnome-common-native"
>
> -inherit distro_features_check autotools pkgconfig gettext
> +inherit features_check autotools pkgconfig gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb b/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
> index e50226e..4276c49 100644
> --- a/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
> +++ b/meta-oe/recipes-extended/libreport/libreport_2.10.0.bb
> @@ -23,7 +23,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
>
>  S = "${WORKDIR}/git"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
>  inherit gettext autotools python3native pkgconfig
> diff --git a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
> index 2c31a21..401c2c4 100644
> --- a/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
> +++ b/meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb
> @@ -12,7 +12,7 @@ DEPENDS = "freetype libpng jpeg expat gtk+"
>
>  BBCLASSEXTEND = "native"
>
> -inherit distro_features_check autotools pkgconfig
> +inherit features_check autotools pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
> index 33142d6..41a79da 100644
> --- a/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
> +++ b/meta-oe/recipes-extended/mozjs/mozjs_60.5.2.bb
> @@ -31,7 +31,7 @@ SRC_URI[sha256sum] = "f51039c997415fd0f13f8e01966b4a8ff80cbf90deb8b14c18827104a3
>
>  inherit autotools pkgconfig perlnative pythonnative
>
> -inherit distro_features_check
> +inherit features_check
>  CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
>
>  DEPENDS += "nspr zlib python-six-native python-pytoml-native \
> diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
> index 16a83a4..9d5a230 100644
> --- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
> +++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.11.bb
> @@ -12,7 +12,7 @@ SECTION = "Applications/System"
>
>  DEPENDS = "curl libxml2 openssl libpam"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  SRCREV = "d8eba6cb6682b59d84ca1da67a523520b879ade6"
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> index 95d879d..9838e75 100644
> --- a/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds_11.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>
>  DEPENDS = "libpam openssl db"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  SRCREV = "e2145df09469bf84878e4729b4ecd814efb797d1"
> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
> index 2fdadcb..6864cc3 100644
> --- a/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ldapdb_1.3.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=41ab94182d94be9bb35e2a8b933f1e7d"
>
>  DEPENDS = "libpam openldap"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  SRCREV = "84d7b260f1ae6857ae36e014c9a5968e8aa1cbe8"
> diff --git a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
> index ac7fa4b..41b4d0d 100644
> --- a/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
> +++ b/meta-oe/recipes-extended/pam/pam-ssh-agent-auth_0.10.3.bb
> @@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "3c53d358d6eaed1b211239df017c27c6f9970995d14102ae67bae16d4f
>
>  DEPENDS += "libpam openssl"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  # This gets us ssh-agent, which we are almost certain to want.
> diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> index 8ced8ab..e38e344 100644
> --- a/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> +++ b/meta-oe/recipes-extended/polkit/polkit-group-rule.inc
> @@ -1,7 +1,7 @@
>  # polkit must prepare polkitd group
>  DEPENDS += "polkit"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "polkit"
>
>  inherit useradd
> diff --git a/meta-oe/recipes-extended/polkit/polkit_0.116.bb b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> index 8754383..ad1973b 100644
> --- a/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> +++ b/meta-oe/recipes-extended/polkit/polkit_0.116.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
>
>  DEPENDS = "expat glib-2.0 intltool-native mozjs"
>
> -inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection distro_features_check
> +inherit autotools gtk-doc pkgconfig useradd systemd gobject-introspection features_check
>
>  REQUIRED_DISTRO_FEATURES = "polkit"
>
> diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> index 91c5002..a527f77 100644
> --- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> +++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
> @@ -11,7 +11,7 @@ LICENSE = "EPL-1.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f300afd598546add034364cd0a533261"
>  DEPENDS = "curl libpam openssl sblim-sfc-common unzip-native"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  SRC_URI = "http://downloads.sourceforge.net/sblim/${BP}.tar.bz2 \
> diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
> index e587e2a..0e09c3a 100644
> --- a/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
> +++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1 \
>
>  DEPENDS = "atk glibmm"
>
> -inherit distro_features_check gnomebase autotools pkgconfig
> +inherit features_check gnomebase autotools pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
> index 53eb32b..2fa754e 100644
> --- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
> +++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
>  # Upstream renamed this package to gnome-themes-extra at some point
>  BPN = "gnome-themes-extra"
>
> -inherit gnomebase gettext gtk-icon-cache upstream-version-is-even distro_features_check
> +inherit gnomebase gettext gtk-icon-cache upstream-version-is-even features_check
>
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>
> diff --git a/meta-oe/recipes-gnome/gtk+/gtk+.inc b/meta-oe/recipes-gnome/gtk+/gtk+.inc
> index d6d14a7..ccbcfc8 100644
> --- a/meta-oe/recipes-gnome/gtk+/gtk+.inc
> +++ b/meta-oe/recipes-gnome/gtk+/gtk+.inc
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
>
>  SECTION = "libs"
>
> -inherit distro_features_check
> +inherit features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>
>  # This picks stable releases in the 2.x series (but not 2.90 onwards,
> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb
> index 4ded679..adc38d8 100644
> --- a/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb
> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm3_3.24.2.bb
> @@ -10,7 +10,7 @@ DEPENDS = "atkmm pangomm glibmm gtk+3 cairomm"
>
>  BPN = "gtkmm"
>
> -inherit gnomebase distro_features_check
> +inherit gnomebase features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
> index b780d09..bb17944 100644
> --- a/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
> +++ b/meta-oe/recipes-gnome/gtk+/gtkmm_2.24.5.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
>
>  DEPENDS = "atkmm pangomm glibmm gtk+ cairomm"
>
> -inherit gnomebase distro_features_check
> +inherit gnomebase features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-gnome/vte9/vte9.inc b/meta-oe/recipes-gnome/vte9/vte9.inc
> index d860d44..14d1940 100644
> --- a/meta-oe/recipes-gnome/vte9/vte9.inc
> +++ b/meta-oe/recipes-gnome/vte9/vte9.inc
> @@ -8,7 +8,7 @@ RDEPENDS_libvte = "vte-termcap"
>  GNOMEBN = "vte"
>  S = "${WORKDIR}/vte-${PV}"
>
> -inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject-introspection
> +inherit gnomebase gtk-doc features_check upstream-version-is-even gobject-introspection
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>
>  EXTRA_OECONF = "--disable-python"
> diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
> index 25c2ce8..99c108d 100644
> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
>  DEPENDS = "glib-2.0 pango giflib tiff libxml2 jpeg python libtool uthash gettext-native"
>  DEPENDS_append_class-target = " libxi"
>
> -inherit autotools pkgconfig pythonnative distro_features_check gettext gtk-icon-cache mime
> +inherit autotools pkgconfig pythonnative features_check gettext gtk-icon-cache mime
>
>  REQUIRED_DISTRO_FEATURES_append_class-target = " x11"
>
> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> index d54fafc..3b540bb 100644
> --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
> @@ -7,7 +7,7 @@ SRC_URI = "https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${P
>  SRC_URI[md5sum] = "90c3ca4dd9d51cf32276bc5344ec9754"
>  SRC_URI[sha256sum] = "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2"
>
> -inherit cmake distro_features_check
> +inherit cmake features_check
>
>  # depends on virtual/libx11, virtual/libgl
>  REQUIRED_DISTRO_FEATURES = "x11 opengl"
> diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
> index 343c983..65f7274 100644
> --- a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
> +++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://sourceforge.net/projects/ftgl/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=527a83e92c7bf363025380eec05df6e4"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl x11"
>
> diff --git a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb
> index e1c3158..b3cb01a 100644
> --- a/meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb
> +++ b/meta-oe/recipes-graphics/fvwm/fvwm_2.6.8.bb
> @@ -42,7 +42,7 @@ SRCREV = "dc6a396bfe5cd6c53eb1df103c3af505d0899f90"
>
>  S = "${WORKDIR}/git"
>
> -inherit autotools gettext update-alternatives pkgconfig pythonnative perlnative distro_features_check
> +inherit autotools gettext update-alternatives pkgconfig pythonnative perlnative features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb b/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
> index 0053c0c..0db0f79 100644
> --- a/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
> +++ b/meta-oe/recipes-graphics/gegl/gegl_0.3.18.bb
> @@ -5,7 +5,7 @@ DEPENDS = "babl librsvg glib-2.0 gtk+ pango cairo expat zlib libpng jpeg virtual
>
>  EXTRA_OECONF = "--disable-docs"
>
> -inherit distro_features_check gnomebase vala gobject-introspection
> +inherit features_check gnomebase vala gobject-introspection
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
> index 1d64910..0245345 100644
> --- a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
> +++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
> @@ -25,7 +25,7 @@ DEPENDS = " \
>  "
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
>
> -inherit distro_features_check gnomebase gtk-icon-cache gtk-doc
> +inherit features_check gnomebase gtk-icon-cache gtk-doc
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
> index 4094513..6fe2582 100644
> --- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
> +++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
> @@ -16,7 +16,7 @@ DEPENDS = "gtk+"
>
>  S = "${WORKDIR}/${BPN}"
>
> -inherit distro_features_check autotools binconfig pkgconfig gettext
> +inherit features_check autotools binconfig pkgconfig gettext
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb
> index 1644e38..cd3b662 100644
> --- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb
> +++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.102.bb
> @@ -15,7 +15,7 @@ DEPENDS = "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
>  RDEPENDS_${PN} = "tk-lib"
>
>  # depends on gtk+ which has this restriction
> -inherit distro_features_check
> +inherit features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>
>  EXTRA_OECONF = "--with-tcl=${STAGING_BINDIR_CROSS} --with-tk=${STAGING_BINDIR_CROSS} --with-tirpc"
> diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> index 5d33185..999d53d 100644
> --- a/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> +++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.3.bb
> @@ -14,7 +14,7 @@ SRC_URI = "http://download.savannah.nongnu.org/releases/xforms/xforms-${PV}.tar.
>  SRC_URI[md5sum] = "235720a758a8b8d9e6e452dc67190e9b"
>  SRC_URI[sha256sum] = "7989b39598c769820ad451ad91e5cb0de29946940c8240aac94ca8238c2def61"
>
> -inherit autotools distro_features_check
> +inherit autotools features_check
>
>  REQUIRED_DISTRO_FEATURES = "opengl x11"
>
> diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb
> index 4601593..6224ad3 100644
> --- a/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb
> +++ b/meta-oe/recipes-graphics/libsdl/libsdl2-ttf_2.0.14.bb
> @@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62f
>
>  S = "${WORKDIR}/SDL2_ttf-${PV}"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  # links to libGL.so
>  REQUIRED_DISTRO_FEATURES += "x11 opengl"
> diff --git a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
> index 701266b..db4767b 100644
> --- a/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm_0.5.3.bb
> @@ -22,7 +22,7 @@ DEPENDS_append_libc-musl = " libexecinfo"
>  # combine oe-core way with angstrom DISTRO_TYPE
>  DISTRO_TYPE ?= "${@bb.utils.contains("IMAGE_FEATURES", "debug-tweaks", "debug", "",d)}"
>
> -inherit autotools pkgconfig gettext systemd distro_features_check
> +inherit autotools pkgconfig gettext systemd features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
> index 08d7f5b..ac2634d 100644
> --- a/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
> +++ b/meta-oe/recipes-graphics/numlockx/numlockx_1.2.bb
> @@ -10,7 +10,7 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/numlockx/numlockx-${PV}.tar.g
>  SRC_URI[md5sum] = "be9109370447eae23f6f3f8527bb1a67"
>  SRC_URI[sha256sum] = "e468eb9121c94c9089dc6a287eeb347e900ce04a14be37da29d7696cbce772e4"
>
> -inherit autotools distro_features_check
> +inherit autotools features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
> index 9af3798..33f34e4 100644
> --- a/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
> +++ b/meta-oe/recipes-graphics/openbox/openbox_3.6.1.bb
> @@ -12,7 +12,7 @@ SRC_URI = " \
>  SRC_URI[md5sum] = "b72794996c6a3ad94634727b95f9d204"
>  SRC_URI[sha256sum] = "8b4ac0760018c77c0044fab06a4f0c510ba87eae934d9983b10878483bde7ef7"
>
> -inherit autotools gettext update-alternatives pkgconfig distro_features_check
> +inherit autotools gettext update-alternatives pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb
> index 8a85db4..35e71ab 100644
> --- a/meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb
> +++ b/meta-oe/recipes-graphics/pango/pangomm_2.42.0.bb
> @@ -12,7 +12,7 @@ SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${
>  SRC_URI[md5sum] = "6cffedf2225c4e72645a7d757fb5b832"
>  SRC_URI[sha256sum] = "ca6da067ff93a6445780c0b4b226eb84f484ab104b8391fb744a45cbc7edbf56"
>
> -inherit distro_features_check autotools pkgconfig
> +inherit features_check autotools pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> index 684a204..784f6fb 100644
> --- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> +++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.4.bb
> @@ -14,7 +14,7 @@ DEPENDS += "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms vim-native"
>
>  RDEPENDS_${PN} = "libxcb xcb-util-keysyms"
>
> -inherit cmake python3native distro_features_check
> +inherit cmake python3native features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11 opengl"
>
> diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb
> index f3dc899..d0ee2a5 100644
> --- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb
> +++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.9.0.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
>
>  S = "${WORKDIR}/git"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  inherit autotools cmake
> diff --git a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb
> index a566bc1..7e22038 100644
> --- a/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb
> +++ b/meta-oe/recipes-graphics/unclutter-xfixes/unclutter-xfixes_1.5.bb
> @@ -9,7 +9,7 @@ SRC_URI = "git://github.com/Airblader/unclutter-xfixes.git \
>             file://0001-build-use-autotools.patch"
>  SRCREV = "10fd337bb77e4e93c3380f630a0555372778a948"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb b/meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb
> index d96b501..240949f 100644
> --- a/meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb
> +++ b/meta-oe/recipes-graphics/vdpau/libvdpau_1.3.bb
> @@ -10,7 +10,7 @@ SRC_URI = "git://anongit.freedesktop.org/vdpau/libvdpau"
>
>  S = "${WORKDIR}/git"
>
> -inherit distro_features_check meson
> +inherit features_check meson
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> index e4a0321..d0c9f77 100644
> --- a/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> +++ b/meta-oe/recipes-graphics/x11vnc/x11vnc_0.9.16.bb
> @@ -23,7 +23,7 @@ DEPENDS = "\
>         zlib \
>  "
>
> -inherit pkgconfig autotools distro_features_check
> +inherit pkgconfig autotools features_check
>
>  ANY_OF_DISTRO_FEATURES = "x11 fbdev"
>
> diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
> index 3f4bfaa..936d71b 100644
> --- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
> +++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.7.bb
> @@ -7,7 +7,7 @@ SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.b
>  SRC_URI[md5sum] = "25cc7ca1ce5dcbb61c2b471c55e686b5"
>  SRC_URI[sha256sum] = "35b6f844b24f1776e9006c880a745728800764dbe3b327a128772b4610d8eb3d"
>
> -inherit distro_features_check autotools pkgconfig
> +inherit features_check autotools pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
> index b68e994..aeae071 100644
> --- a/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
> +++ b/meta-oe/recipes-graphics/xdotool/xdotool_1.20100416.2809.bb
> @@ -7,7 +7,7 @@ DEPENDS = "virtual/libx11 libxtst"
>
>  PR = "r1"
>
> -inherit distro_features_check pkgconfig
> +inherit features_check pkgconfig
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
> index cb6b5ac..958fecc 100644
> --- a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
> +++ b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
> @@ -7,6 +7,6 @@ XORG_PN = "${BPN}"
>  SRC_URI = "${XORG_MIRROR}/individual/data/${BP}.tar.bz2"
>  S = "${WORKDIR}/${XORG_PN}-${PV}"
>
> -inherit distro_features_check autotools pkgconfig
> +inherit features_check autotools pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
> index 971de73..4042150 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-ati_19.0.1.bb
> @@ -9,7 +9,7 @@ DESCRIPTION = "Open-source X.org graphics driver for ATI Radeon graphics"
>  DEPENDS += "virtual/libx11 libxvmc drm \
>              virtual/libgl xorgproto libpciaccess"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES += "opengl"
>
>  SRC_URI[md5sum] = "47eccf71823206ade9629cba69de7ef6"
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb
> index 3966867..5c9061a 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.16.bb
> @@ -10,7 +10,7 @@ DEPENDS += "virtual/libx11 libxvmc drm xorgproto \
>              virtual/libgl libpciaccess"
>  RDEPENDS_${PN} += "xserver-xorg-module-exa"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES += "opengl"
>
>  COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
> diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
> index 29229bb..d7dd109 100644
> --- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
> +++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
> @@ -10,7 +10,7 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
>  RDEPENDS_${PN} = "encodings font-util"
>  RDEPENDS_${PN}_class-native = "font-util-native"
>
> -inherit distro_features_check
> +inherit features_check
>  # depends on bdftopcf-native -> virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
> index 898850b..5c00b4b 100644
> --- a/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
> +++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-utopia-100dpi_1.0.4.bb
> @@ -10,7 +10,7 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
>  RDEPENDS_${PN} = "encodings font-util"
>  RDEPENDS_${PN}_class-native = "font-util-native"
>
> -inherit distro_features_check
> +inherit features_check
>  # depends on bdftopcf-native -> virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
> index 4976e52..f9bdaf3 100644
> --- a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
> +++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
> @@ -10,7 +10,7 @@ DEPENDS += "util-macros-native font-util-native bdftopcf-native font-util"
>  RDEPENDS_${PN} = "encodings font-util"
>  RDEPENDS_${PN}_class-native = "font-util-native"
>
> -inherit distro_features_check
> +inherit features_check
>  # depends on bdftopcf-native -> virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
> index 6e0b33c..872ef4d 100644
> --- a/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
> +++ b/meta-oe/recipes-graphics/xorg-font/font-bh-lucidatypewriter-100dpi_1.0.3.bb
> @@ -10,7 +10,7 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
>  RDEPENDS_${PN} = "encodings font-util"
>  RDEPENDS_${PN}_class-native = "font-util-native"
>
> -inherit distro_features_check
> +inherit features_check
>  # depends on bdftopcf-native -> virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
> index e8cfb61..a4ae91a 100644
> --- a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
> +++ b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
> @@ -10,7 +10,7 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native"
>  RDEPENDS_${PN} = "encodings font-util"
>  RDEPENDS_${PN}_class-native = "font-util-native"
>
> -inherit distro_features_check
> +inherit features_check
>  # depends on bdftopcf-native -> virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
> index d425ce5..ee8cb36 100644
> --- a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
> +++ b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8b32ccac3ad25e75e68478deb7780265"
>  DEPENDS = "util-macros-native font-util-native bdftopcf-native"
>  RDEPENDS_${PN} = "encodings font-util"
>
> -inherit distro_features_check
> +inherit features_check
>  # depends on bdftopcf-native -> virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
> index e4cd90a..355fb52 100644
> --- a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
> +++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=200c507f595ee97008c7c5c3e94ab9a8"
>  DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
>  RDEPENDS_${PN} = "encodings font-util"
>
> -inherit distro_features_check
> +inherit features_check
>  # depends on bdftopcf-native -> virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
> index ae97040..06778b3 100644
> --- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
> +++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Xorg 100 DPI font set"
>  LICENSE = "MIT"
>
> -inherit packagegroup distro_features_check
> +inherit packagegroup features_check
>  # rdepends on font recipes with this restriction
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> index 62f0056..b8c1881 100644
> --- a/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> +++ b/meta-oe/recipes-graphics/xscreensaver/xscreensaver_5.39.bb
> @@ -17,7 +17,7 @@ DEPENDS = "intltool-native libx11 libxext libxt libxft glib-2.0-native bc-native
>  # These are only needed as part of the stopgap screensaver implementation:
>  RDEPENDS_${PN} += "liberation-fonts"
>
> -inherit systemd perlnative pkgconfig gettext autotools-brokensep distro_features_check
> +inherit systemd perlnative pkgconfig gettext autotools-brokensep features_check
>
>  EXTRA_OECONF += "--with-x-app-defaults=${datadir}/X11/app-defaults"
>
> diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> index a5ed21d..2c09a48 100644
> --- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> +++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  PR = "r9"
>
>  # we are using a gpe-style Makefile
> -inherit distro_features_check gpe
> +inherit features_check gpe
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> index d334956..1ba9f0f 100644
> --- a/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> +++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.26.0.bb
> @@ -24,7 +24,7 @@ SRC_URI[waf.sha256sum] = "01bf2beab2106d1558800c8709bc2c8e496d3da4a2ca343fe091f2
>
>  S = "${WORKDIR}/git"
>
> -inherit waf pkgconfig pythonnative distro_features_check
> +inherit waf pkgconfig pythonnative features_check
>
>  LUA ?= "lua"
>  LUA_mips64  = ""
> diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
> index 3588ce7..51d7e2a 100644
> --- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
> +++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_4.0.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>  # mind when doing version upgrades).
>  DEPENDS = "intltool-native glib-2.0-native gtkmm3 libcanberra pulseaudio"
>
> -inherit autotools distro_features_check
> +inherit autotools features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> index 526659e..b6aafde 100644
> --- a/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> +++ b/meta-oe/recipes-multimedia/xpext/xpext_1.0-5.bb
> @@ -9,7 +9,7 @@ SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/${BPN}/${BPN}_${
>             file://auxdir.patch;striplevel=0"
>  S = "${WORKDIR}/xpext-1.0"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
> index c7a068d..c611da4 100644
> --- a/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
> +++ b/meta-oe/recipes-multimedia/xsp/xsp_1.0.0-8.bb
> @@ -7,7 +7,7 @@ SRC_URI = "http://repository.maemo.org/pool/maemo/ossw/source/x/xsp/${BPN}_${PV}
>             file://xsp-fix-pc.patch"
>  S = "${WORKDIR}/Xsp"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> index 010f65f..589fc5f 100644
> --- a/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> +++ b/meta-oe/recipes-navigation/orrery/orrery_2.7.bb
> @@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://orrery.c;endline=25;md5=d792bdf2b591972da175aecc38d88cfe"
>  DEPENDS = "gtk+"
>
> -inherit distro_features_check autotools-brokensep pkgconfig
> +inherit features_check autotools-brokensep pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb b/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
> index ed90352..504ac15 100644
> --- a/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
> +++ b/meta-oe/recipes-security/passwdqc/passwdqc_1.3.1.bb
> @@ -21,7 +21,7 @@ SECTION = "System Environment/Base"
>
>  DEPENDS += "libpam"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  LICENSE = "BSD-1-Clause"
> diff --git a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> index 30d41a1..9362a5c 100644
> --- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> +++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
>      file://COPYING.GPL;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
>  "
>
> -inherit autotools pkgconfig python3native lib_package distro_features_check
> +inherit autotools pkgconfig python3native lib_package features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-support/colord/colord.bb
> index aa5d1d1..df86708 100644
> --- a/meta-oe/recipes-support/colord/colord.bb
> +++ b/meta-oe/recipes-support/colord/colord.bb
> @@ -1,6 +1,6 @@
>  require ${BPN}.inc
>
> -inherit meson gobject-introspection gsettings gettext bash-completion systemd distro_features_check useradd
> +inherit meson gobject-introspection gsettings gettext bash-completion systemd features_check useradd
>
>  # polkit and gobject-introspection are mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES = "polkit gobject-introspection-data"
> diff --git a/meta-oe/recipes-support/fltk/fltk.bb b/meta-oe/recipes-support/fltk/fltk.bb
> index ec9e04b..7ad4ac7 100644
> --- a/meta-oe/recipes-support/fltk/fltk.bb
> +++ b/meta-oe/recipes-support/fltk/fltk.bb
> @@ -2,7 +2,7 @@ require ${BPN}.inc
>
>  DEPENDS = "alsa-lib zlib jpeg libpng libxext libxft"
>
> -inherit distro_features_check binconfig lib_package gtk-icon-cache mime
> +inherit features_check binconfig lib_package gtk-icon-cache mime
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  SRC_URI += "file://0003-CMake-build-Force-shared-libs-with-unsuffixed-names.patch"
> diff --git a/meta-oe/recipes-support/links/links-x11_2.16.bb b/meta-oe/recipes-support/links/links-x11_2.16.bb
> index f55a6fc..90fa200 100644
> --- a/meta-oe/recipes-support/links/links-x11_2.16.bb
> +++ b/meta-oe/recipes-support/links/links-x11_2.16.bb
> @@ -25,7 +25,7 @@ require links.inc
>  DEPENDS += "virtual/libx11"
>  RCONFLICTS_${PN} = "links"
>
> -inherit distro_features_check
> +inherit features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
> index 5a21cd3..04133c1 100644
> --- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
> +++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.2.bb
> @@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "f4b59eef4a94b1d29dbe0c106dd00cdc630e47f18619fc754e5afbf572
>
>  FILES_${PN} = "${libdir}/pidgin/*"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
> diff --git a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> index 82b803a..14fbc94 100644
> --- a/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> +++ b/meta-oe/recipes-support/remmina/remmina_1.3.6.bb
> @@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "fbed745438bb0c21467b60cbd67c8148a9289b5ebc7482d06db443bea5
>
>  S = "${WORKDIR}/Remmina-v${PV}"
>
> -inherit cmake distro_features_check
> +inherit cmake features_check
>
>  # depends on avahi-ui with this restriction
>  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
> index f5518bd..dba89d1 100644
> --- a/meta-oe/recipes-support/synergy/synergy_git.bb
> +++ b/meta-oe/recipes-support/synergy/synergy_git.bb
> @@ -17,7 +17,7 @@ PV = "1.10.1+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> -inherit cmake distro_features_check
> +inherit cmake features_check
>
>  EXTRA_OECMAKE += "-DSYNERGY_BUILD_LEGACY_GUI=OFF"
>
> diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> index 879b67b..aba485e 100644
> --- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> +++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> @@ -11,7 +11,7 @@ SRC_URI = "git://github.com/OSSystems/toscoterm.git"
>
>  S = "${WORKDIR}/git"
>
> -inherit distro_features_check gitpkgv pkgconfig
> +inherit features_check gitpkgv pkgconfig
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-support/udisks/udisks2_git.bb b/meta-oe/recipes-support/udisks/udisks2_git.bb
> index 9c9e5e5..f0aad95 100644
> --- a/meta-oe/recipes-support/udisks/udisks2_git.bb
> +++ b/meta-oe/recipes-support/udisks/udisks2_git.bb
> @@ -26,7 +26,7 @@ S = "${WORKDIR}/git"
>
>  CVE_PRODUCT = "udisks"
>
> -inherit autotools systemd gtk-doc gobject-introspection gettext distro_features_check
> +inherit autotools systemd gtk-doc gobject-introspection gettext features_check
>
>  REQUIRED_DISTRO_FEATURES = "polkit"
>
> diff --git a/meta-oe/recipes-support/uim/uim_1.8.8.bb b/meta-oe/recipes-support/uim/uim_1.8.8.bb
> index 8948ebf..c1136cd 100644
> --- a/meta-oe/recipes-support/uim/uim_1.8.8.bb
> +++ b/meta-oe/recipes-support/uim/uim_1.8.8.bb
> @@ -25,7 +25,7 @@ LEAD_SONAME = "libuim.so.1"
>  COMPATIBLE_HOST_riscv64 = "null"
>  COMPATIBLE_HOST_riscv32 = "null"
>
> -inherit distro_features_check autotools pkgconfig gettext qemu gtk-immodules-cache
> +inherit features_check autotools pkgconfig gettext qemu gtk-immodules-cache
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-support/upower/upower_0.99.11.bb b/meta-oe/recipes-support/upower/upower_0.99.11.bb
> index c4cc627..6408417 100644
> --- a/meta-oe/recipes-support/upower/upower_0.99.11.bb
> +++ b/meta-oe/recipes-support/upower/upower_0.99.11.bb
> @@ -10,7 +10,7 @@ SRC_URI = " \
>  SRC_URI[md5sum] = "abe6acb617f11f2e8dbd9846fcf86e24"
>  SRC_URI[sha256sum] = "64b5ffbfccd5bdb15d925777979a4dbee1a957f9eaeb158dc76175267eddbdef"
>
> -inherit autotools pkgconfig gettext gobject-introspection systemd distro_features_check
> +inherit autotools pkgconfig gettext gobject-introspection systemd features_check
>
>  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>  PACKAGECONFIG[idevice] = "--with-idevice,--without-idevice,libimobiledevice libplist"
> diff --git a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> index 8cb180d..5f07bf2 100644
> --- a/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> +++ b/meta-oe/recipes-support/utouch/utouch-mtview_git.bb
> @@ -5,7 +5,7 @@ HOMEPAGE = "http://bitmath.org/code/mtview/"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4c61b8950dc1aab4d2aa7c2ae6b1cfb3"
>
> -inherit autotools pkgconfig distro_features_check
> +inherit autotools pkgconfig features_check
>  # depends on virtual/libx11
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> index 0bdafdf..481e730 100644
> --- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> +++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.2.5.bb
> @@ -7,7 +7,7 @@ inherit autotools pkgconfig
>
>  DEPENDS = "virtual/libx11 xserver-xorg xrdp nasm-native"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "x11 pam"
>
>  SRC_URI = "git://github.com/neutrinolabs/xorgxrdp.git"
> diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
> index 75caf8d..deda0fd 100644
> --- a/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
> +++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.11.bb
> @@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=72cfbe4e7bd33a0a1de9630c91195c21 \
>  "
>
> -inherit distro_features_check autotools pkgconfig useradd systemd
> +inherit features_check autotools pkgconfig useradd systemd
>
>  DEPENDS = "openssl virtual/libx11 libxfixes libxrandr libpam nasm-native"
>
> diff --git a/meta-python/recipes-devtools/python/pamela_0.3.0.bb b/meta-python/recipes-devtools/python/pamela_0.3.0.bb
> index 8071fcb..030c22f 100644
> --- a/meta-python/recipes-devtools/python/pamela_0.3.0.bb
> +++ b/meta-python/recipes-devtools/python/pamela_0.3.0.bb
> @@ -11,5 +11,5 @@ inherit pypi setuptools
>
>  RDEPENDS_${PN} = "libpam"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
> diff --git a/meta-python/recipes-devtools/python/python-pam_1.8.2.bb b/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
> index 60a3b43..bac3496 100644
> --- a/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
> +++ b/meta-python/recipes-devtools/python/python-pam_1.8.2.bb
> @@ -11,5 +11,5 @@ inherit pypi setuptools
>
>  RDEPENDS_${PN} = "libpam"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
> diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
> index f01165c..b14f825 100644
> --- a/meta-python/recipes-devtools/python/python-systemd.inc
> +++ b/meta-python/recipes-devtools/python/python-systemd.inc
> @@ -7,7 +7,7 @@ PYPI_PACKAGE = "systemd-python"
>  DEPENDS += "systemd (<=234)"
>  RDEPENDS_${PN} += "systemd ${PYTHON_PN}-syslog ${PYTHON_PN}-logging"
>  REQUIRED_DISTRO_FEATURES = "systemd"
> -inherit pypi distro_features_check
> +inherit pypi features_check
>
>  SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
>  SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
> diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> index c60d40e..4f52ac7 100644
> --- a/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> +++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.32.1.bb
> @@ -12,7 +12,7 @@ SRCREV = "dc4565208fca00da06b972915a080ad3c63f640d"
>  S = "${WORKDIR}/git"
>
>  # Same restriction as gtk+
> -inherit distro_features_check
> +inherit features_check
>  ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
>
>  inherit pkgconfig autotools python3native
> diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
> index 89d718d..02a5c8f 100644
> --- a/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
> @@ -8,6 +8,6 @@ SRC_URI[sha256sum] = "b1fc072c87e3766711f64caf86fd633dca393e20c8a0a37a5058dd70a2
>  DEPENDS = "systemd"
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
> -inherit pypi setuptools3 distro_features_check
> +inherit pypi setuptools3 features_check
>
>  BBCLASSEXTEND = "native"
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
> index fe9d27a..2b5b253 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivet_3.1.4.bb
> @@ -25,7 +25,7 @@ SRC_URI = "git://github.com/rhinstaller/blivet;branch=3.1-release \
>
>  UPSTREAM_CHECK_GITTAGREGEX = "blivet-(?P<pver>\d+(\.\d+)+)$"
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
>  inherit setuptools3 python3native
> diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
> index b7e2493..92402be 100644
> --- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
> +++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.1.10.bb
> @@ -13,7 +13,7 @@ SRC_URI = "git://github.com/rhinstaller/blivet-gui;branch=master \
>             file://0001-Fix-return-type-of-BlivetUtils.get_disks-1658893.patch \
>  "
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "x11 systemd"
>
>  inherit setuptools3 python3native
> diff --git a/meta-xfce/classes/thunar-plugin.bbclass b/meta-xfce/classes/thunar-plugin.bbclass
> index 76b0e72..854d96b 100644
> --- a/meta-xfce/classes/thunar-plugin.bbclass
> +++ b/meta-xfce/classes/thunar-plugin.bbclass
> @@ -1,4 +1,4 @@
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/classes/xfce-app.bbclass b/meta-xfce/classes/xfce-app.bbclass
> index 1c31c2f..d1b07d7 100644
> --- a/meta-xfce/classes/xfce-app.bbclass
> +++ b/meta-xfce/classes/xfce-app.bbclass
> @@ -1,4 +1,4 @@
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/classes/xfce-panel-plugin.bbclass b/meta-xfce/classes/xfce-panel-plugin.bbclass
> index f34ee07..594d40d 100644
> --- a/meta-xfce/classes/xfce-panel-plugin.bbclass
> +++ b/meta-xfce/classes/xfce-panel-plugin.bbclass
> @@ -1,4 +1,4 @@
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.1.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.1.bb
> index 8196e6c..f1d9c04 100644
> --- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.1.bb
> +++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.1.bb
> @@ -9,7 +9,7 @@ DEPENDS = " \
>      intltool-native \
>  "
>
> -inherit distutils3 gtk-icon-cache distro_features_check
> +inherit distutils3 gtk-icon-cache features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
> index 7445cd7..d699047 100644
> --- a/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
> +++ b/meta-xfce/recipes-apps/xarchiver/xarchiver_git.bb
> @@ -12,7 +12,7 @@ SRCREV = "9ab958a4023b62b43972c55a3143ff0722bd88a6"
>  PV = "0.5.4.14"
>  S = "${WORKDIR}/git"
>
> -inherit gettext pkgconfig autotools gtk-icon-cache distro_features_check
> +inherit gettext pkgconfig autotools gtk-icon-cache features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> index 3a396c0..2ef81f2 100644
> --- a/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> +++ b/meta-xfce/recipes-apps/xfce-polkit/xfce-polkit_0.3.bb
> @@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=758b03f872a88c99fc36d50c5932091c"
>
>  DEPENDS = "libxfce4ui polkit"
>
> -inherit xfce-app distro_features_check
> +inherit xfce-app features_check
>  REQUIRED_DISTRO_FEATURES = "polkit"
>
>  SRC_URI = " \
> diff --git a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> index 4d128ac..2dd3f01 100644
> --- a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> +++ b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
> @@ -13,7 +13,7 @@ SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
>
>  S = "${WORKDIR}/git"
>
> -inherit gettext meson distro_features_check
> +inherit gettext meson features_check
>
>  REQUIRED_DISTRO_FEATURES = "systemd x11"
>
> diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb
> index 5fa2a7b..467e095 100644
> --- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb
> +++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.8.bb
> @@ -3,7 +3,7 @@ SECTION = "x11/application"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
> -inherit python3native gettext distro_features_check
> +inherit python3native gettext features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> index 68dbc69..2f5d820 100644
> --- a/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> +++ b/meta-xfce/recipes-bindings/vala/xfce4-vala_4.10.3.bb
> @@ -3,7 +3,7 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=243b725d71bb5df4a1e5920b344b86ad"
>  DEPENDS = "libxfce4util garcon xfconf libxfce4ui xfce4-panel exo vala xfce4-dev-tools-native"
>
> -inherit xfce pkgconfig distro_features_check
> +inherit xfce pkgconfig features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> index 21930ba..8009acd 100644
> --- a/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> +++ b/meta-xfce/recipes-core/images/core-image-minimal-xfce.bb
> @@ -6,7 +6,7 @@ IMAGE_INSTALL = "packagegroup-core-boot \
>      kernel-modules \
>  "
>
> -inherit distro_features_check
> +inherit features_check
>  REQUIRED_DISTRO_FEATURES = "x11"
>
>  IMAGE_LINGUAS ?= " "
> diff --git a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb b/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
> index c3da3e9..24d0d90 100644
> --- a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
> +++ b/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
>                      file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
>  DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
>
> -inherit distro_features_check autotools pkgconfig pythonnative gtk-icon-cache
> +inherit features_check autotools pkgconfig pythonnative gtk-icon-cache
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
> index 5c94cb6..c8f495e 100644
> --- a/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
> +++ b/meta-xfce/recipes-extended/imsettings/imsettings_1.8.1.bb
> @@ -10,7 +10,7 @@ SECTION = "Applications/System"
>  LICENSE = "LGPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
> -inherit autotools gtk-doc gobject-introspection gettext distro_features_check
> +inherit autotools gtk-doc gobject-introspection gettext features_check
>
>  DEPENDS = "gtk+3 libnotify"
>
> diff --git a/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> index a6475ce..a6d335a 100644
> --- a/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> +++ b/meta-xfce/recipes-extended/libunique/libunique_1.1.6.bb
> @@ -25,7 +25,7 @@ LICENSE = "LGPLv2.1"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
>
>
> -inherit autotools pkgconfig gobject-introspection distro_features_check gtk-doc
> +inherit autotools pkgconfig gobject-introspection features_check gtk-doc
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb
> index 8b8f5f2..fc380c1 100644
> --- a/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb
> +++ b/meta-xfce/recipes-panel-plugins/pulseaudio/xfce4-pulseaudio-plugin_0.4.2.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Pulseaudio mixer for the xfce panel"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=f5eac6bb0d6ec0dc655e417781d4015f"
>
> -inherit xfce-panel-plugin distro_features_check
> +inherit xfce-panel-plugin features_check
>
>  REQUIRED_DISTRO_FEATURES = "pulseaudio x11"
>
> diff --git a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
> index 994c652..d850636 100644
> --- a/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
> +++ b/meta-xfce/recipes-thunar-plugins/shares/thunar-shares-plugin_0.3.0.bb
> @@ -2,7 +2,7 @@ SUMMARY = "Quickly share a folder using Samba from Thunar"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
> -inherit thunar-plugin distro_features_check
> +inherit thunar-plugin features_check
>  REQUIRED_DISTRO_FEATURES = "pam"
>
>  SRC_URI[md5sum] = "a1773168c0b3c7c0f253a339f02e5ae2"
> diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
> index fdd50d4..bc96a39 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  DEPENDS = "gtk+3 libxfce4ui virtual/libx11 liburi-perl-native cairo"
>  DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native intltool-native"
>
> -inherit xfce pythonnative perlnative gtk-doc distro_features_check
> +inherit xfce pythonnative perlnative gtk-doc features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>  REQUIRED_DISTRO_FEATURES_class-native = ""
> diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb
> index 62c7890..75997de 100644
> --- a/meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb
> +++ b/meta-xfce/recipes-xfce/garcon/garcon_0.6.4.bb
> @@ -4,7 +4,7 @@ LICENSE = "LGPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
>  DEPENDS = "xfce4-dev-tools-native libxfce4ui intltool-native"
>
> -inherit xfce gtk-doc distro_features_check
> +inherit xfce gtk-doc features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
> index 805e893..0dd4a4c 100644
> --- a/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
> +++ b/meta-xfce/recipes-xfce/gtk-xfce-engine/gtk-xfce-engine_3.2.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  DEPENDS = "gtk+ xfce4-dev-tools-native"
>
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> index 6b26200..053eb20 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
>  DEPENDS = "intltool-native perl-native gtk+ gtk+3 libice libsm libxfce4util xfce4-dev-tools xfconf virtual/libx11"
>
> -inherit xfce gtk-doc gobject-introspection distro_features_check
> +inherit xfce gtk-doc gobject-introspection features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> index daee73e..412c6ae 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
> @@ -2,7 +2,7 @@ SUMMARY = "All packages required for a base installation of XFCE"
>  SECTION = "x11/wm"
>  PR = "r5"
>
> -inherit packagegroup distro_features_check
> +inherit packagegroup features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> index 527f81f..42f20c9 100644
> --- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> +++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
> @@ -3,7 +3,7 @@ SECTION = "x11/wm"
>
>  PR = "r10"
>
> -inherit packagegroup distro_features_check
> +inherit packagegroup features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb
> index fff7c03..d499e22 100644
> --- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb
> +++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.5.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  DEPENDS = "exo libnotify libgudev"
>
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb
> index ff020d0..bc996c1 100644
> --- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb
> +++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.9.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  DEPENDS = "exo gdk-pixbuf libxfce4ui libsm startup-notification libnotify xfce4-panel udev"
>
> -inherit xfce gobject-introspection distro_features_check
> +inherit xfce gobject-introspection features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb
> index 2d6b7a5..e4f35b0 100644
> --- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.14.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  DEPENDS = "glib-2.0 gtk+3 libxfce4util libxfce4ui garcon xfconf"
>
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
> index a1b571e..cc3f323 100644
> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=26a8bd75d8f8498bdbbe64a27791d4ee"
>  DEPENDS = "garcon exo gtk+3 cairo virtual/libx11 libxml2 libwnck3 vala-native"
>
> -inherit xfce gtk-doc gobject-introspection distro_features_check remove-libtool
> +inherit xfce gtk-doc gobject-introspection features_check remove-libtool
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb
> index 284a29b..295e2e4 100644
> --- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.6.5.bb
> @@ -5,7 +5,7 @@ SECTION = "x11"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
>
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb
> index 6b4cafd..37560c2 100644
> --- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.14.0.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
>
>  DEPENDS = "libwnck3 libsm libxfce4ui virtual/libx11"
>
> -inherit xfce update-alternatives distro_features_check
> +inherit xfce update-alternatives features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
> index a24928c..d326f92 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.14.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  DEPENDS = "exo exo-native garcon libxi virtual/libx11 xrandr libxcursor libxklavier upower"
>
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb
> index ec4f00f..fe9f40b 100644
> --- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb
> +++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.14.1.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>  DEPENDS = "libxfce4ui libwnck thunar garcon exo"
>
> -inherit xfce distro_features_check
> +inherit xfce features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb
> index 77b45a7..b77e619 100644
> --- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb
> +++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.14.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
>  DEPENDS = "virtual/libx11 libxfce4ui libwnck3 libxinerama exo-native"
>
> -inherit xfce update-alternatives distro_features_check
> +inherit xfce update-alternatives features_check
>
>  REQUIRED_DISTRO_FEATURES = "x11"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

