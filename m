Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1E1CD71DE8
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:17:16 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id k6so200757717wre.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Apr 2017 02:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JhkydSf4WvAoaaDIHF4mzdvGzs44Eyhbd+EhPR1WkaU=;
	b=EUY6Pc6eytMYcGL+ksV1IU7cR63HYuaWg79vkU3e7aOFRIFXpc9+OEqeQIQ2DI+633
	Hu24KMrmJqjNhJ+jnb26azq8Pz8UTyHfVyDxI4QZRjI6Dnqdij8JOiIHpFrfbkTq+jWb
	eKk3S0BaRpfoib7Hu8NWjm4/xri6QOT4/JDaR0qlwmZ3LVWvU/B/GFjahuoI0x6cErij
	lm1bj2l8r4wrTqlRJK+uKGKeHuVrucz4rKLZbnU7LVTM0xB5t+SfMGmMvsAG8avEcO+n
	6UdOOccM5YDqHnSmUW+1c/wIU2NqprdDAxC64DTvIe58L6viHvj+ZzoE7geE7WCJIiCk
	OVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JhkydSf4WvAoaaDIHF4mzdvGzs44Eyhbd+EhPR1WkaU=;
	b=H+fT8A+IOQqp0e2tivZ0Yr0UED+KUvMN3vCStpHFEqw1W8WxYX+ASyTy4tsZdA6X0A
	iGIpITdduOEENwelI6xgneEQHBIsPWXg+6t8dd8A3KaDIcwuscjg5N43ZkTWEubdWB4k
	Xzp9ypSyzedSQ1JCWD7a5yt4x6H3zC6HM7uyupAhEbjStsSj42TdfYaW5plkLOOnh3kz
	0j6vsJcMVhnOP81XtEhcfcrRe+j8ajQMsGeYEukStecl69W6sGQJXwN59HHkQmD9121+
	s8ZrPqPXAS1gIDa+AlvSttQzvgLEyfHT+yIBpZre/Mxo1oyAg4VGXRyWcn7ZiB4gRrMY
	r6YA==
X-Gm-Message-State: AFeK/H2/f8quQBWQjvSP21sxVQuLN3DDV2dEHzg4H3QgU0486idqEOoj
	ehA6H5MAnhfIBQ==
X-Received: by 10.28.40.198 with SMTP id o189mr13811566wmo.108.1491297034418; 
	Tue, 04 Apr 2017 02:10:34 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o196sm17654006wmg.12.2017.04.04.02.10.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Apr 2017 02:10:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Apr 2017 11:10:30 +0200
Message-Id: <20170404091031.29052-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [meta-oe][PATCH 1/2] recipes: add removal date to PNBLACKLIST messages
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
X-List-Received-Date: Tue, 04 Apr 2017 09:17:17 -0000

* based on discussion in pndeprecated thread:
  https://patchwork.openembedded.org/patch/137573/
  update the messages to warn possible users that the
  recipe will be removed before the end of the next development
  cycle (before Yocto 2.4 is released).
* updated with:
  sed -i 's/^\(PNBLACKLIST.*".*\)"/\1 - the recipe will be removed on 2017-09-01 unless the issue is fixed"/g' `git grep PNBLACKLIST | sed 's/:.*//g' | sort -u | xargs`
* if it isn't fixed by this date, it's fair game to be removed
  whenever someone gets around to i

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-edbus_1.7.0.bb    |  2 +-
 .../recipes-devtools/python/python-efl_1.15.0.bb     |  2 +-
 meta-efl/recipes-devtools/python/python-efl_git.bb   |  2 +-
 meta-efl/recipes-efl/e17/cpu_svn.bb                  |  2 +-
 meta-efl/recipes-efl/e17/diskio_svn.bb               |  2 +-
 meta-efl/recipes-efl/e17/e-tasks_git.bb              |  2 +-
 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb   |  6 +++---
 .../e17/e-wm-theme-illume-efenniht_svn.bb            |  4 ++--
 meta-efl/recipes-efl/e17/e-wm_0.18.8.bb              |  2 +-
 meta-efl/recipes-efl/e17/e-wm_0.19.10.bb             |  2 +-
 meta-efl/recipes-efl/e17/e-wm_git.bb                 |  2 +-
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb          |  2 +-
 meta-efl/recipes-efl/e17/elbow_git.bb                |  2 +-
 meta-efl/recipes-efl/e17/elfe_git.bb                 |  2 +-
 meta-efl/recipes-efl/e17/elmdentica_svn.bb           |  2 +-
 meta-efl/recipes-efl/e17/emprint_svn.bb              |  2 +-
 meta-efl/recipes-efl/e17/enjoy_git.bb                |  2 +-
 meta-efl/recipes-efl/e17/ephoto_svn.bb               |  2 +-
 meta-efl/recipes-efl/e17/exalt-client_svn.bb         |  2 +-
 meta-efl/recipes-efl/e17/exalt_svn.bb                |  2 +-
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb   |  6 +++---
 meta-efl/recipes-efl/e17/exquisite_svn.bb            |  2 +-
 meta-efl/recipes-efl/e17/flame_svn.bb                |  2 +-
 meta-efl/recipes-efl/e17/forecasts_svn.bb            |  2 +-
 meta-efl/recipes-efl/e17/news_svn.bb                 |  2 +-
 meta-efl/recipes-efl/e17/places_svn.bb               |  2 +-
 meta-efl/recipes-efl/e17/rage_svn.bb                 |  2 +-
 meta-efl/recipes-efl/e17/rain_svn.bb                 |  2 +-
 meta-efl/recipes-efl/e17/screenshot_svn.bb           |  2 +-
 meta-efl/recipes-efl/e17/terminology_0.9.1.bb        |  2 +-
 meta-efl/recipes-efl/e17/uptime_svn.bb               |  2 +-
 meta-efl/recipes-efl/efl/azy_svn.bb                  |  2 +-
 meta-efl/recipes-efl/efl/edbus_1.7.9.bb              |  8 ++++----
 meta-efl/recipes-efl/efl/efl.inc                     |  4 ++--
 .../recipes-efl/efl/elementary-theme-efenniht_svn.bb |  6 +++---
 meta-efl/recipes-efl/efl/elementary_1.15.1.bb        |  2 +-
 .../efl/emotion-generic-players_1.15.0.bb            |  6 +++---
 meta-efl/recipes-efl/efl/engrave_svn.bb              |  2 +-
 meta-efl/recipes-efl/efl/entrance_svn.bb             |  2 +-
 meta-efl/recipes-efl/efl/epdf_svn.bb                 |  8 ++++----
 .../recipes-efl/efl/evas-generic-loaders_1.15.0.bb   |  6 +++---
 meta-efl/recipes-efl/efl/expedite_1.7.9.bb           | 20 ++++++++++----------
 meta-efl/recipes-efl/efl/expedite_git.bb             | 20 ++++++++++----------
 meta-efl/recipes-efl/efl/libeflvala_svn.bb           |  2 +-
 meta-efl/recipes-efl/efl/libeweather_svn.bb          |  2 +-
 .../packagegroups/packagegroup-efl-sdk.bb            |  2 +-
 .../packagegroup-efl-standalone-sdk-target.bb        |  2 +-
 .../packagegroups/packagegroup-x11-illume.bb         |  6 +++---
 meta-efl/recipes-efl/webkit/webkit-efl.inc           |  2 +-
 meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb   |  2 +-
 .../recipes-filesystems/logfsprogs/logfsprogs_git.bb |  2 +-
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb     |  2 +-
 .../unionfs-fuse/unionfs-fuse_0.26.bb                |  2 +-
 meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb |  2 +-
 .../recipes-utils/xfsdump/xfsdump_3.1.4.bb           |  2 +-
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb      |  4 ++--
 meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb   |  2 +-
 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb  |  2 +-
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb             |  2 +-
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb     |  2 +-
 .../recipes-gnome/devilspie/devilspie2_0.33.bb       |  2 +-
 .../recipes-gnome/gcalctool/gcalctool_5.32.0.bb      |  2 +-
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb           |  2 +-
 .../gnome-backgrounds/gnome-backgrounds_2.32.0.bb    |  2 +-
 .../gnome-control-center_2.32.1.bb                   |  2 +-
 .../gnome-desktop/gnome-desktop_2.32.1.bb            |  2 +-
 .../gnome-disk-utility/gnome-disk-utility_2.32.0.bb  |  2 +-
 .../gnome-keyring/gnome-keyring_2.32.1.bb            |  2 +-
 .../recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb  |  2 +-
 .../recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb  |  4 ++--
 .../recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb  |  2 +-
 .../gnome-power-manager_2.32.0.bb                    |  2 +-
 .../gnome-session/gnome-session_2.32.1.bb            |  2 +-
 .../gnome-settings-daemon_2.32.1.bb                  |  4 ++--
 .../gnome-system-monitor_2.28.2.bb                   |  2 +-
 .../recipes-gnome/gnome/gnome-terminal_2.30.2.bb     |  2 +-
 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb |  2 +-
 .../recipes-gnome/gnome/libgnomeprint_2.18.8.bb      |  2 +-
 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb |  2 +-
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb     |  2 +-
 .../recipes-gnome/gweather/libgweather3_3.0.2.bb     |  2 +-
 .../recipes-gnome/gweather/libgweather_2.30.3.bb     |  2 +-
 .../recipes-gnome/libgnome/libgnomekbd_2.32.0.bb     |  2 +-
 meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb |  2 +-
 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb |  2 +-
 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb     |  2 +-
 meta-gnome/recipes-gnome/pimlico/contacts_git.bb     |  2 +-
 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb       |  2 +-
 meta-gnome/recipes-gnome/pimlico/tasks_git.bb        |  2 +-
 .../system-tools/system-tools-backends_2.10.2.bb     |  2 +-
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb      |  2 +-
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb     |  2 +-
 .../recipes-support/florence/florence_0.5.4.bb       |  2 +-
 meta-gnome/recipes-support/goffice/goffice_0.10.1.bb |  2 +-
 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb |  2 +-
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb   |  2 +-
 .../libgpewidget/libgpewidget_0.117.bb               |  2 +-
 meta-gpe/recipes-graphics/minilite/minilite_0.50.bb  |  2 +-
 .../recipes-support/fbreader/fbreader_0.12.10.bb     |  2 +-
 meta-gpe/recipes-support/fbreader/fbreader_git.bb    |  2 +-
 .../recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb    |  2 +-
 .../recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb |  2 +-
 .../recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb           |  2 +-
 .../recipes-dvb/tvheadend/tvheadend_git.bb           |  2 +-
 .../kodi/kodi-addon-pvr-hts_git.bb                   |  2 +-
 .../recipes-mediacenter/kodi/kodi-platform_git.bb    |  2 +-
 .../recipes-mediacenter/kodi/kodi-startup.bb         |  4 ++--
 meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb  |  2 +-
 .../recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb         |  2 +-
 .../recipes-multimedia/coriander/coriander_2.0.2.bb  |  2 +-
 .../dleyna/renderer-service-upnp_0.3.0.bb            |  2 +-
 .../gstreamer-0.10/gst-ffmpeg_0.10.13.bb             |  2 +-
 .../recipes-multimedia/gstreamer/gst123_0.3.1.bb     |  2 +-
 meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb  |  2 +-
 .../recipes-kernel/netmap/netmap-modules_git.bb      |  2 +-
 meta-networking/recipes-kernel/netmap/netmap_git.bb  |  2 +-
 .../recipes-protocols/accel-ppp/accel-ppp_git.bb     |  2 +-
 .../lksctp-tools/lksctp-tools_1.0.17.bb              |  2 +-
 meta-networking/recipes-support/nis/ypbind-mt_2.2.bb |  2 +-
 .../phoronix-test-suite/phoronix-test-suite_6.6.1.bb |  2 +-
 meta-oe/recipes-benchmark/pmbw/pmbw_git.bb           |  2 +-
 .../recipes-connectivity/bluez/bluez-hcidump_2.5.bb  |  2 +-
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb   |  2 +-
 .../bluez/gst-plugin-bluetooth_4.101.bb              |  2 +-
 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb |  2 +-
 .../networkmanager/networkmanager-openvpn_1.2.6.bb   |  2 +-
 meta-oe/recipes-connectivity/soft66/soft66_git.bb    |  2 +-
 .../telepathy/libtelepathy_0.3.3.bb                  |  2 +-
 .../telepathy/telepathy-mission-control_5.16.1.bb    |  2 +-
 meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb   |  2 +-
 .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb   |  2 +-
 .../zeroc-ice/zeroc-ice_3.5.1.bb                     |  2 +-
 meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb   |  2 +-
 meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb       |  2 +-
 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb     |  2 +-
 .../packagegroups/packagegroup-cli-tools.bb          |  4 ++--
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb        |  2 +-
 meta-oe/recipes-devtools/dt/dt_18.32.bb              |  2 +-
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb    |  2 +-
 .../recipes-devtools/packagekit/packagekit_0.5.6.bb  |  2 +-
 meta-oe/recipes-devtools/php/php_5.6.26.bb           |  2 +-
 meta-oe/recipes-devtools/php/php_7.1.0.bb            |  2 +-
 .../vala-dbus-binding-tool_0.4.0.bb                  |  2 +-
 .../vala-dbus-binding-tool_git.bb                    |  2 +-
 .../openlmi/openlmi-networking_0.3.1.bb              |  2 +-
 .../openlmi/openlmi-providers_0.6.0.bb               |  2 +-
 .../openlmi/openlmi-storage_0.8.1.bb                 |  2 +-
 .../recipes-extended/subsurface/subsurface_git.bb    |  2 +-
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb     |  2 +-
 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb       |  2 +-
 .../recipes-graphics/clutter/clutter-box2d_git.bb    |  2 +-
 meta-oe/recipes-graphics/fbida/fbida_2.10.bb         |  2 +-
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb          |  2 +-
 meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb   |  2 +-
 meta-oe/recipes-graphics/slim/slim_1.3.2.bb          |  2 +-
 .../terminus-font/terminus-font_4.38.bb              |  2 +-
 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb |  2 +-
 meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb  |  2 +-
 .../xorg-driver/xf86-input-mtev_git.bb               |  2 +-
 .../xorg-driver/xf86-video-geode_2.11.16.bb          |  2 +-
 .../xorg-driver/xf86-video-glamo_git.bb              |  2 +-
 .../xorg-driver/xf86-video-nouveau_1.0.12.bb         |  2 +-
 .../recipes-graphics/xorg-font/xorg-fonts-100dpi.bb  | 10 +++++-----
 meta-oe/recipes-kernel/crash/crash_7.1.5.bb          |  2 +-
 meta-oe/recipes-kernel/ktap/ktap-module_git.bb       |  2 +-
 meta-oe/recipes-kernel/ktap/ktap_git.bb              |  2 +-
 .../recipes-multimedia/minidlna/minidlna_1.1.5.bb    |  2 +-
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb   |  2 +-
 .../foxtrotgps/foxtrotgps_1.1.1.bb                   |  2 +-
 meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb       |  2 +-
 meta-oe/recipes-navigation/gypsy/gypsy.inc           |  2 +-
 meta-oe/recipes-navigation/navit/navit.inc           |  2 +-
 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb  |  2 +-
 .../claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb  |  2 +-
 .../claws-mail/claws-plugin-mailmbox_1.15.bb         |  2 +-
 .../claws-mail/claws-plugin-rssyl_0.34.bb            |  2 +-
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb    |  2 +-
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb   |  2 +-
 meta-oe/recipes-support/emacs/emacs_23.4.bb          |  2 +-
 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb |  6 +++---
 meta-oe/recipes-support/fftw/benchfft_3.1.bb         |  2 +-
 meta-oe/recipes-support/flite/flite-alsa_1.3.bb      |  2 +-
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb       |  2 +-
 .../recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb |  2 +-
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb    |  2 +-
 meta-oe/recipes-support/ode/ode_0.13.bb              |  4 ++--
 .../recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb |  2 +-
 meta-oe/recipes-support/opencv/opencv-samples_2.4.bb |  2 +-
 meta-oe/recipes-support/opencv/opencv_2.4.bb         |  2 +-
 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb |  2 +-
 meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb  |  2 +-
 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb   |  2 +-
 meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb   |  2 +-
 .../recipes-support/psqlodbc/psqlodbc_09.05.0300.bb  |  2 +-
 .../system-setup-keyboard_0.8.8.bb                   |  2 +-
 .../vala-terminal/vala-terminal_git.bb               |  2 +-
 .../vboxguestdrivers/vboxguestdrivers_4.3.36.bb      |  2 +-
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb         |  2 +-
 meta-ruby/recipes-devtools/ruby/bundler_git.bb       |  2 +-
 meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb    |  2 +-
 .../recipes-art/cursor-themes/openzone_1.2.3.bb      |  2 +-
 201 files changed, 251 insertions(+), 251 deletions(-)

diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
index ce7de8305..bfacf897f 100644
--- a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
+++ b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
@@ -5,4 +5,4 @@ PR = "r1"
 SRC_URI[md5sum] = "40b479444bb06147429a276127981890"
 SRC_URI[sha256sum] = "78e5ca334ee25185748660b4e612f984f4d3bced018f062278701429868f117b"
 
-PNBLACKLIST[python-edbus] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130600/"
+PNBLACKLIST[python-edbus] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130600/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
index 5018d9bbc..e9a79b252 100644
--- a/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
+++ b/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
@@ -3,4 +3,4 @@ require ${BPN}.inc
 SRC_URI[md5sum] = "f7c5d557336ea9df69bcca09c420711a"
 SRC_URI[sha256sum] = "11e607b465cb66dafe05c66e02d61e09335b370fe9fd2a74d88282b3ee597bcc"
 
-PNBLACKLIST[python-efl] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[python-efl] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-devtools/python/python-efl_git.bb b/meta-efl/recipes-devtools/python/python-efl_git.bb
index 4bff50fe4..292b9eb87 100644
--- a/meta-efl/recipes-devtools/python/python-efl_git.bb
+++ b/meta-efl/recipes-devtools/python/python-efl_git.bb
@@ -8,4 +8,4 @@ SRC_URI = "git://git.enlightenment.org/bindings/python/${BPN}.git;branch=python-
 
 S = "${WORKDIR}/git"
 
-PNBLACKLIST[python-efl] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[python-efl] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/cpu_svn.bb b/meta-efl/recipes-efl/e17/cpu_svn.bb
index 15d1eb427..3ffb9889f 100644
--- a/meta-efl/recipes-efl/e17/cpu_svn.bb
+++ b/meta-efl/recipes-efl/e17/cpu_svn.bb
@@ -9,4 +9,4 @@ require e-module.inc
 
 SRC_URI += "file://configure.patch"
 
-PNBLACKLIST[cpu] ?= "Depends on blacklisted e-wm"
+PNBLACKLIST[cpu] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/diskio_svn.bb b/meta-efl/recipes-efl/e17/diskio_svn.bb
index a26186e44..4f778d6e1 100644
--- a/meta-efl/recipes-efl/e17/diskio_svn.bb
+++ b/meta-efl/recipes-efl/e17/diskio_svn.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
 PV = "0.0.1+svnr${SRCPV}"
 PR = "${INC_PR}.0"
 
-PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first."
+PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first. - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 require e-module.inc
diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb b/meta-efl/recipes-efl/e17/e-tasks_git.bb
index 540df5f63..7eab6d0f0 100644
--- a/meta-efl/recipes-efl/e17/e-tasks_git.bb
+++ b/meta-efl/recipes-efl/e17/e-tasks_git.bb
@@ -31,4 +31,4 @@ do_install_append() {
 
 FILES_${PN} += "/usr/share/e-tasks/* /usr/share/applications/* /usr/share/pixmaps/*"
 
-PNBLACKLIST[e-tasks] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[e-tasks] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
index f75f9ead5..9e6e9f24e 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
@@ -30,8 +30,8 @@ do_install() {
 
 FILES_${PN} = "${datadir}/enlightenment/data/themes/"
 
-PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm"
+PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm-theme-b-and-w"
+PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm-theme-b-and-w - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm-theme-b-and-w-dev"
+PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm-theme-b-and-w-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
index 6032f2035..521213475 100644
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
@@ -34,6 +34,6 @@ do_install() {
 
 FILES_${PN} = "${datadir}/enlightenment/data/themes/"
 
-PNBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted e-wm"
+PNBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted e-wm-theme-illume-efenniht"
+PNBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted e-wm-theme-illume-efenniht - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
index 819d1b040..ac18b59bb 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
@@ -14,4 +14,4 @@ SRC_URI = "\
 SRC_URI[md5sum] = "79c9f524e1d0510061c62c4b038a8ece"
 SRC_URI[sha256sum] = "14c9bde4334d2f8b0776c6113d02b923ab159eea1cbf7013489e4f3bf37a51bb"
 
-PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
index 62408b836..aa6a7b8d7 100644
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
@@ -18,4 +18,4 @@ SRC_URI = "\
 SRC_URI[md5sum] = "9063617760329445ada8635270a4e627"
 SRC_URI[sha256sum] = "484d305bcf403303b18c46a3a498445b93689cd325010ae8d0601551926469d8"
 
-PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm_git.bb b/meta-efl/recipes-efl/e17/e-wm_git.bb
index 95572fab2..0f25fd592 100644
--- a/meta-efl/recipes-efl/e17/e-wm_git.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_git.bb
@@ -13,4 +13,4 @@ S = "${WORKDIR}/git"
 
 SRCREV = "4545d4a70031e0b2565b8d83d5f756bff1a584d0"
 
-PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
index 8746f09b8..6d3efda51 100644
--- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
+++ b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
@@ -15,4 +15,4 @@ S = "${WORKDIR}/${SRCNAME}"
 
 FILES_${PN} += "${datadir}"
 
-PNBLACKLIST[edje-viewer] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[edje-viewer] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/elbow_git.bb b/meta-efl/recipes-efl/e17/elbow_git.bb
index 06ed2c959..d2a853989 100644
--- a/meta-efl/recipes-efl/e17/elbow_git.bb
+++ b/meta-efl/recipes-efl/e17/elbow_git.bb
@@ -23,4 +23,4 @@ S = "${WORKDIR}/git"
 
 FILES_${PN} += "${datadir}/themes"
 
-PNBLACKLIST[elbow] ?= "Depends on blacklisted webkit-efl"
+PNBLACKLIST[elbow] ?= "Depends on blacklisted webkit-efl - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/elfe_git.bb b/meta-efl/recipes-efl/e17/elfe_git.bb
index bdec107a9..e9f7f9e89 100644
--- a/meta-efl/recipes-efl/e17/elfe_git.bb
+++ b/meta-efl/recipes-efl/e17/elfe_git.bb
@@ -14,4 +14,4 @@ SRCREV = "1ec0e7713c3ca901014811ff78277d9e2aaac981"
 
 DEPENDS += "elementary"
 
-PNBLACKLIST[elfe] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[elfe] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
index 56a74c5a7..b17121721 100644
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
@@ -20,4 +20,4 @@ RDEPENDS_${PN} = "${PN}-themes"
 
 SRC_URI += "file://configure.patch"
 
-PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy"
+PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/emprint_svn.bb b/meta-efl/recipes-efl/e17/emprint_svn.bb
index e4c9816fd..115dc7cf5 100644
--- a/meta-efl/recipes-efl/e17/emprint_svn.bb
+++ b/meta-efl/recipes-efl/e17/emprint_svn.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/${SRCNAME}"
 
 FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
 
-PNBLACKLIST[emprint] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/apps/emprint.git/"
+PNBLACKLIST[emprint] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/apps/emprint.git/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/enjoy_git.bb b/meta-efl/recipes-efl/e17/enjoy_git.bb
index cab1bd493..716d73ed1 100644
--- a/meta-efl/recipes-efl/e17/enjoy_git.bb
+++ b/meta-efl/recipes-efl/e17/enjoy_git.bb
@@ -47,4 +47,4 @@ pkg_postinst_${PN} () {
     echo "enjoy:    Use test-lms -P to see available formats that can be scanned"
 }
 
-PNBLACKLIST[enjoy] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[enjoy] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
index c7b2d7c1f..f86ffe16f 100644
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ b/meta-efl/recipes-efl/e17/ephoto_svn.bb
@@ -18,4 +18,4 @@ B = "${S}"
 
 SRC_URI += "file://configure.patch"
 
-PNBLACKLIST[ephoto] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[ephoto] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
index f29473605..cb78a2e3a 100644
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
@@ -23,4 +23,4 @@ FILES_${PN}-dev += "${libdir}/enlightenment/modules/*/*/*.la"
 FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug"
 
 SRC_URI += "file://configure.patch"
-PNBLACKLIST[exalt-client] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[exalt-client] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
index e52c98786..9e63f1bc2 100644
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ b/meta-efl/recipes-efl/e17/exalt_svn.bb
@@ -33,4 +33,4 @@ do_install_append() {
 FILES_${PN} += "${datadir}/dbus-1"
 
 
-PNBLACKLIST[exalt] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[exalt] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
index f9eb4ad68..c9063bc44 100644
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
@@ -34,8 +34,8 @@ do_install() {
 CONFFILES_${PN} = "${sysconfdir}/exquisite/config-illume"
 FILES_${PN} = "${sysconfdir}/exquisite ${datadir}/exquisite/data/themes"
 
-PNBLACKLIST[exquisite-theme-illume] ?= "Depends on blacklisted edje-native"
+PNBLACKLIST[exquisite-theme-illume] ?= "Depends on blacklisted edje-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[exquisite-theme-illume] ?= "Runtime depends on blacklisted exquisite-theme-illume"
+PNBLACKLIST[exquisite-theme-illume] ?= "Runtime depends on blacklisted exquisite-theme-illume - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[exquisite-theme-illume] ?= "Runtime depends on blacklisted exquisite-theme-illume-dev"
+PNBLACKLIST[exquisite-theme-illume] ?= "Runtime depends on blacklisted exquisite-theme-illume-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
index 1b1c659d3..826cd444e 100644
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ b/meta-efl/recipes-efl/e17/exquisite_svn.bb
@@ -40,4 +40,4 @@ INITSCRIPT_PARAMS = "start 01 S . stop 20 0 1 6 ."
 
 FILES_${PN} += "/mnt/.splash/"
 
-PNBLACKLIST[exquisite] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130619/"
+PNBLACKLIST[exquisite] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130619/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/flame_svn.bb b/meta-efl/recipes-efl/e17/flame_svn.bb
index 026c63c1b..6583d2724 100644
--- a/meta-efl/recipes-efl/e17/flame_svn.bb
+++ b/meta-efl/recipes-efl/e17/flame_svn.bb
@@ -14,4 +14,4 @@ do_configure_prepend() {
 
 SRC_URI += "file://configure.patch"
 
-PNBLACKLIST[flame] ?= "Depends on blacklisted e-wm"
+PNBLACKLIST[flame] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/forecasts_svn.bb b/meta-efl/recipes-efl/e17/forecasts_svn.bb
index d9191792a..495f314fc 100644
--- a/meta-efl/recipes-efl/e17/forecasts_svn.bb
+++ b/meta-efl/recipes-efl/e17/forecasts_svn.bb
@@ -9,4 +9,4 @@ require e-module.inc
 
 SRC_URI += "file://configure.patch"
 
-PNBLACKLIST[forecasts] ?= "Depends on blacklisted e-wm"
+PNBLACKLIST[forecasts] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/news_svn.bb b/meta-efl/recipes-efl/e17/news_svn.bb
index 3b652a694..4349e0445 100644
--- a/meta-efl/recipes-efl/e17/news_svn.bb
+++ b/meta-efl/recipes-efl/e17/news_svn.bb
@@ -11,4 +11,4 @@ do_configure_prepend() {
     sed -i -e s:\ po::g Makefile.am
 }
 
-PNBLACKLIST[news] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/enlightenment/modules/news.git/"
+PNBLACKLIST[news] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/enlightenment/modules/news.git/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
index 915baf6fb..b184f84c3 100644
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ b/meta-efl/recipes-efl/e17/places_svn.bb
@@ -15,4 +15,4 @@ RRECOMMENDS_${PN} += "eject"
 
 SRC_URI += "file://configure.patch"
 
-PNBLACKLIST[places] ?= "Depends on blacklisted e-wm"
+PNBLACKLIST[places] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/e17/rage_svn.bb
index a65aa9eb6..0a90fe3cd 100644
--- a/meta-efl/recipes-efl/e17/rage_svn.bb
+++ b/meta-efl/recipes-efl/e17/rage_svn.bb
@@ -12,4 +12,4 @@ inherit e
 SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
 S = "${WORKDIR}/${SRCNAME}"
 
-PNBLACKLIST[rage] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from  http://git.enlightenment.org/apps/rage.git/"
+PNBLACKLIST[rage] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from  http://git.enlightenment.org/apps/rage.git/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
index 6d14eef49..14aa2ed38 100644
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ b/meta-efl/recipes-efl/e17/rain_svn.bb
@@ -15,4 +15,4 @@ do_configure_prepend() {
 
 SRC_URI += "file://configure.patch"
 
-PNBLACKLIST[rain] ?= "Depends on blacklisted e-wm"
+PNBLACKLIST[rain] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/screenshot_svn.bb
index 6dec194d6..233f7777f 100644
--- a/meta-efl/recipes-efl/e17/screenshot_svn.bb
+++ b/meta-efl/recipes-efl/e17/screenshot_svn.bb
@@ -13,4 +13,4 @@ do_configure_prepend() {
     sed -i -e 's:AC_MSG_ERROR(emprint not found):echo foo:g' ${S}/configure.ac
 }
 
-PNBLACKLIST[screenshot] ?= "depends on blacklisted emprint"
+PNBLACKLIST[screenshot] ?= "depends on blacklisted emprint - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.9.1.bb b/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
index 37ebe0b22..77dd223fd 100644
--- a/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
+++ b/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
@@ -7,4 +7,4 @@ SRC_URI = "\
 SRC_URI[md5sum] = "c7ce2e8ebc5f311d3d3f59ecfdf18f61"
 SRC_URI[sha256sum] = "7fb864a14202490e9181c5f254a7e772019216a3aa75c3952d0f12cd32113896"
 
-PNBLACKLIST[terminology] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[terminology] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/uptime_svn.bb b/meta-efl/recipes-efl/e17/uptime_svn.bb
index 15d387842..60d48a2ca 100644
--- a/meta-efl/recipes-efl/e17/uptime_svn.bb
+++ b/meta-efl/recipes-efl/e17/uptime_svn.bb
@@ -9,4 +9,4 @@ require e-module.inc
 
 SRC_URI += "file://configure.patch"
 
-PNBLACKLIST[uptime] ?= "Depends on blacklisted e-wm"
+PNBLACKLIST[uptime] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
index dec247516..d3bc200f5 100644
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ b/meta-efl/recipes-efl/efl/azy_svn.bb
@@ -34,4 +34,4 @@ S = "${WORKDIR}/${SRCNAME}"
 # sysroots/qemuarm/usr/include/c++/5.2.0/bits/basic_string.h:4780:5: error: reference to 'basic_string' is ambiguous
 #     basic_string<_CharT, _Traits, _Alloc>
 #     ^
-PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5"
+PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.9.bb b/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
index 1fb716449..a8033ac59 100644
--- a/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
@@ -7,10 +7,10 @@ SRC_URI = "\
 SRC_URI[md5sum] = "8f72da14e5664aad8c45eeeca0e3ff5f"
 SRC_URI[sha256sum] = "c328c4cf1424629cb67c83689ccc1f95967abcb4c03dffd437e93b799ff151c1"
 
-PNBLACKLIST[edbus] ?= "Depends on blacklisted ecore"
+PNBLACKLIST[edbus] ?= "Depends on blacklisted ecore - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[edbus] ?= "Depends on blacklisted eina"
+PNBLACKLIST[edbus] ?= "Depends on blacklisted eina - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[edbus] ?= "Runtime depends on blacklisted edbus"
+PNBLACKLIST[edbus] ?= "Runtime depends on blacklisted edbus - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[edbus] ?= "Runtime depends on blacklisted edbus-dev"
+PNBLACKLIST[edbus] ?= "Runtime depends on blacklisted edbus-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
index 48fd45888..4cd21bfd0 100644
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -286,5 +286,5 @@ FILES_${PN}-dev += " \
     ${bindir}/eldbus-codegen \
 "
 
-PNBLACKLIST[efl] ?= "Depends on broken efl-native"
-PNBLACKLIST[efl-native] ?= "Broken: fails to build with http://errors.yoctoproject.org/Errors/Details/138240/"
+PNBLACKLIST[efl] ?= "Depends on broken efl-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+PNBLACKLIST[efl-native] ?= "Broken: fails to build with http://errors.yoctoproject.org/Errors/Details/138240/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
index 36ba9b43b..783d12304 100644
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
@@ -37,8 +37,8 @@ do_install() {
 
 FILES_${PN} = "${datadir}/elementary/themes/"
 
-PNBLACKLIST[elementary-theme-efenniht] ?= "Depends on blacklisted edje-native"
+PNBLACKLIST[elementary-theme-efenniht] ?= "Depends on blacklisted edje-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[elementary-theme-efenniht] ?= "Runtime depends on blacklisted elementary-theme-efenniht"
+PNBLACKLIST[elementary-theme-efenniht] ?= "Runtime depends on blacklisted elementary-theme-efenniht - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[elementary-theme-efenniht] ?= "Runtime depends on blacklisted elementary-theme-efenniht-dev"
+PNBLACKLIST[elementary-theme-efenniht] ?= "Runtime depends on blacklisted elementary-theme-efenniht-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.15.1.bb b/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
index 894abc524..40dd8ad27 100644
--- a/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
+++ b/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
@@ -15,4 +15,4 @@ SRC_URI[sha256sum] = "ae5540c2103fcdc69fd7469277ce25a8a00a0f701fc2c20771dc010840
 # which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
 B = "${S}"
 
-PNBLACKLIST[elementary] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130584/"
+PNBLACKLIST[elementary] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130584/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
index 10faf0789..ffdd26982 100644
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
+++ b/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
@@ -7,8 +7,8 @@ SRC_URI = "\
 SRC_URI[md5sum] = "68627c1aabf5b7fe084299adcc0b73c1"
 SRC_URI[sha256sum] = "10bad633480a691585b0ba470c573b14da0a010008d9d59d0792cea8c621d423"
 
-PNBLACKLIST[emotion-generic-players] ?= "Depends on blacklisted emotion"
+PNBLACKLIST[emotion-generic-players] ?= "Depends on blacklisted emotion - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[emotion-generic-players] ?= "Runtime depends on blacklisted emotion-generic-players"
+PNBLACKLIST[emotion-generic-players] ?= "Runtime depends on blacklisted emotion-generic-players - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[emotion-generic-players] ?= "Runtime depends on blacklisted emotion-generic-players-dev"
+PNBLACKLIST[emotion-generic-players] ?= "Runtime depends on blacklisted emotion-generic-players-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
index f34be98e0..f950938c9 100644
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ b/meta-efl/recipes-efl/efl/engrave_svn.bb
@@ -12,4 +12,4 @@ S = "${WORKDIR}/${SRCNAME}"
 
 # engrave.l:5:35: fatal error: libengrave_la-engrave.h: No such file or directory
 # http://errors.yoctoproject.org/Errors/Details/56597/
-PNBLACKLIST[engrave] ?= "BROKEN: fails to build with latest oe-core"
+PNBLACKLIST[engrave] ?= "BROKEN: fails to build with latest oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
index 2888dc8dc..b1e580dbe 100644
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ b/meta-efl/recipes-efl/efl/entrance_svn.bb
@@ -11,7 +11,7 @@ SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
 "
 S = "${WORKDIR}/${SRCNAME}"
 
-PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first."
+PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first. - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[consolekit] = "--enable-consolekit,--disable-consolekit,consolekit"
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
index b91bd5b3b..d664bad78 100644
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ b/meta-efl/recipes-efl/efl/epdf_svn.bb
@@ -26,10 +26,10 @@ EXTRA_OECONF = "\
 # Some upgrade path tweaking, as in evas
 AUTO_LIBNAME_PKGS = ""
 
-PNBLACKLIST[epdf] ?= "Depends on blacklisted ecore"
+PNBLACKLIST[epdf] ?= "Depends on blacklisted ecore - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[epdf] ?= "Depends on blacklisted evas"
+PNBLACKLIST[epdf] ?= "Depends on blacklisted evas - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[epdf] ?= "Runtime depends on blacklisted epdf-dev"
+PNBLACKLIST[epdf] ?= "Runtime depends on blacklisted epdf-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[epdf] ?= "Runtime depends on blacklisted epdf"
+PNBLACKLIST[epdf] ?= "Runtime depends on blacklisted epdf - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
index 1e2ec7fdb..ecdbcee1f 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
@@ -7,8 +7,8 @@ SRC_URI = "\
 SRC_URI[md5sum] = "3ca8443b8cbf177845595c5e02fbc49c"
 SRC_URI[sha256sum] = "caa22c9ba1ae9629c16a3fe809ea927f60b8f0d80cdb7f145159b997b9ae2bcd"
 
-PNBLACKLIST[evas-generic-loaders] ?= "Depends on blacklisted eina"
+PNBLACKLIST[evas-generic-loaders] ?= "Depends on blacklisted eina - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[evas-generic-loaders] ?= "Runtime depends on blacklisted evas-generic-loaders"
+PNBLACKLIST[evas-generic-loaders] ?= "Runtime depends on blacklisted evas-generic-loaders - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[evas-generic-loaders] ?= "Runtime depends on blacklisted evas-generic-loaders-dev"
+PNBLACKLIST[evas-generic-loaders] ?= "Runtime depends on blacklisted evas-generic-loaders-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
index d5594f27c..832cd00a5 100644
--- a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
+++ b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
@@ -7,22 +7,22 @@ SRC_URI = "\
 SRC_URI[md5sum] = "954fe8e40fec6a561190ff0fb75b6bdd"
 SRC_URI[sha256sum] = "a05be096c911e0d66d4bdc497ebb935a04ad23696de9084aed9959b5172a593e"
 
-PNBLACKLIST[expedite] ?= "Depends on blacklisted eet"
+PNBLACKLIST[expedite] ?= "Depends on blacklisted eet - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Depends on blacklisted evas"
+PNBLACKLIST[expedite] ?= "Depends on blacklisted evas - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-loader-png"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-loader-png - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-themes"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-themes - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-gl-x11"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-gl-x11 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-generic"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-generic - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-dev"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-x11"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-x11 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-fb"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-fb - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/expedite_git.bb b/meta-efl/recipes-efl/efl/expedite_git.bb
index b8b3b4b16..65c2d4a49 100644
--- a/meta-efl/recipes-efl/efl/expedite_git.bb
+++ b/meta-efl/recipes-efl/efl/expedite_git.bb
@@ -10,22 +10,22 @@ SRC_URI = "\
 "
 S = "${WORKDIR}/${SRCNAME}"
 
-PNBLACKLIST[expedite] ?= "Depends on blacklisted eet"
+PNBLACKLIST[expedite] ?= "Depends on blacklisted eet - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Depends on blacklisted evas"
+PNBLACKLIST[expedite] ?= "Depends on blacklisted evas - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-loader-png"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-loader-png - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-generic"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-generic - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-fb"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-fb - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-x11"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-x11 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-gl-x11"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-gl-x11 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-dev"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-themes"
+PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-themes - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
index 87ea66b3d..eaf4893f7 100644
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
@@ -20,4 +20,4 @@ S = "${WORKDIR}/${SRCNAME}"
 PACKAGES =+ "${PN}-examples"
 FILES_${PN}-examples = "${datadir}/libeflvala ${bindir}/*"
 
-PNBLACKLIST[libeflvala] ?= "Depends on blacklisted elementary"
+PNBLACKLIST[libeflvala] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/libeweather_svn.bb b/meta-efl/recipes-efl/efl/libeweather_svn.bb
index a2f4d5799..53988b0d1 100644
--- a/meta-efl/recipes-efl/efl/libeweather_svn.bb
+++ b/meta-efl/recipes-efl/efl/libeweather_svn.bb
@@ -45,4 +45,4 @@ RRECOMMENDS_${PN} = "\
     ${PN}-plugins \
 "
 
-PNBLACKLIST[libeweather] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130649/"
+PNBLACKLIST[libeweather] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130649/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
index 8c42dbd08..ee4e2c414 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
@@ -16,4 +16,4 @@ RDEPENDS_${PN} = "\
     ${SDK-EFL} \
     ${SDK-EXTRAS}"
 
-PNBLACKLIST[packagegroup-efl-sdk] ?= "Runtime depends on blacklisted elementary-dev"
+PNBLACKLIST[packagegroup-efl-sdk] ?= "Runtime depends on blacklisted elementary-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
index 8aed43a2e..2d9dde649 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
@@ -16,4 +16,4 @@ RDEPENDS_${PN} = "\
     ${SDK-EFL} \
     ${SDK-EXTRAS}"
 
-PNBLACKLIST[packagegroup-efl-standalone-sdk-target] ?= "Runtime depends on blacklisted elementary-dev"
+PNBLACKLIST[packagegroup-efl-standalone-sdk-target] ?= "Runtime depends on blacklisted elementary-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
index 2519da099..95ebcabf3 100644
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
+++ b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
@@ -23,8 +23,8 @@ RDEPENDS_${PN} = "\
     ${ECONFIG} \
 "
 
-PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm"
+PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm-config-mobile"
+PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm-config-mobile - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm-theme-default"
+PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm-theme-default - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl.inc b/meta-efl/recipes-efl/webkit/webkit-efl.inc
index c6ef97612..f49f2ee02 100644
--- a/meta-efl/recipes-efl/webkit/webkit-efl.inc
+++ b/meta-efl/recipes-efl/webkit/webkit-efl.inc
@@ -66,4 +66,4 @@ FILES_${PN}launcher-dbg = "${bindir}/.debug/EWebLauncher"
 FILES_${PN}-inspector += "${datadir}/ewebkit2-1/inspector"
 
 # http://errors.yoctoproject.org/Errors/Details/40659/
-PNBLACKLIST[webkit-efl] ?= "Old and unmaintaned fork with many security issues"
+PNBLACKLIST[webkit-efl] ?= "Old and unmaintaned fork with many security issues - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
index 2b5722b47..040e006ab 100644
--- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
+++ b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
@@ -12,7 +12,7 @@ S = "${WORKDIR}/${PN}"
 
 inherit autotools
 
-PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13"
+PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 # | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/main.edc:126. invalid state name: 'none'. "default" state must always be first.
 # | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/itinerary.edc:84. invalid state name: 'none'. "default" state must always be first.
 # | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/text.edc:1129. invalid state name: 'none'. "default" state must always be first.
diff --git a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
index 7a00e0c21..764866708 100644
--- a/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
+++ b/meta-filesystems/recipes-filesystems/logfsprogs/logfsprogs_git.bb
@@ -26,4 +26,4 @@ do_install () {
 BBCLASSEXTEND = "native nativesdk"
 
 # logfsprogs-git: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/logfsprogs/git-r0/packages-split/logfsprogs/usr/bin/mklogfs' [ldflags]
-PNBLACKLIST[logfsprogs] ?= "Doesn't have proper PV, doesn't respect LDFLAGS"
+PNBLACKLIST[logfsprogs] ?= "Doesn't have proper PV, doesn't respect LDFLAGS - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
index b4bac6b95..6995ad3f5 100644
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
@@ -25,4 +25,4 @@ PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no
 
 S = "${WORKDIR}/git"
 
-PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132827/"
+PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
index 18b9d6f36..25204293a 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_0.26.bb
@@ -16,4 +16,4 @@ do_install() {
 
 RDEPENDS_${PN} += "bash"
 
-PNBLACKLIST[unionfs-fuse] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130648/"
+PNBLACKLIST[unionfs-fuse] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130648/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb b/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
index 0242a7023..632f79d46 100644
--- a/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
+++ b/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
@@ -30,4 +30,4 @@ do_install () {
     oe_runmake install install-dev PKG_DEVLIB_DIR=${libdir}
 }
 
-PNBLACKLIST[dmapi] ?= "Depends on broken xfsprogs"
+PNBLACKLIST[dmapi] ?= "Depends on broken xfsprogs - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
index fe5aef158..d5ad0b0b2 100644
--- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
+++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
@@ -35,4 +35,4 @@ do_install () {
     oe_runmake install-dev
 }
 
-PNBLACKLIST[xfsdump] ?= "Depends on broken xfsprogs"
+PNBLACKLIST[xfsdump] ?= "Depends on broken xfsprogs - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index 682c6fa26..3f5a5b124 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -21,6 +21,6 @@ do_configure_prepend() {
     sed -i -e "s: help : :g" ${S}/Makefile.am
 }
 
-PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer"
+PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop"
+PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb b/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
index d40f51db3..5e11a95de 100644
--- a/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
+++ b/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
@@ -20,6 +20,6 @@ SRC_URI = "http://www.emma-soft.com/projects/${BPN}/chrome/site/releases/${BP}.t
 SRC_URI[md5sum] = "e50285b01612169b2594fea375f53ae4"
 SRC_URI[sha256sum] = "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d6b846a8de0f2f8f0"
 
-PNBLACKLIST[epdfview] ?= "BROKEN: images are not displayed anymore"
+PNBLACKLIST[epdfview] ?= "BROKEN: images are not displayed anymore - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 # There will be no further development / upstream is gone [1]
 # [1] https://bugzilla.redhat.com/show_bug.cgi?id=906121
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
index ddc10aa0a..f6d737c81 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
@@ -15,4 +15,4 @@ EXTRA_OECONF = "--disable-gconf --with-gio --with-alsa --enable-keystore"
 
 inherit gettext pkgconfig autotools gconf
 
-PNBLACKLIST[gmtk] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130661/"
+PNBLACKLIST[gmtk] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130661/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
index ef460f13d..629b830dd 100644
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer"
+PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 PR = "r2"
 
 DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
diff --git a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
index 8a21112dd..c419d0f44 100644
--- a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
@@ -22,4 +22,4 @@ do_install() {
 }
 
 # http://errors.yoctoproject.org/Errors/Details/35132/
-PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size of array '_GStaticAssertCompileTimeAssertion_2' is negative"
+PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size of array '_GStaticAssertCompileTimeAssertion_2' is negative - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
index ab0ed4fb5..48dd489f8 100644
--- a/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
+++ b/meta-gnome/recipes-gnome/devilspie/devilspie2_0.33.bb
@@ -29,4 +29,4 @@ do_install() {
     install -m 644 ${WORKDIR}/devilspie2.desktop ${D}/${sysconfdir}/xdg/autostart
 }
 
-PNBLACKLIST[devilspie2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130666/"
+PNBLACKLIST[devilspie2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130666/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
index 7e684c840..6028f2d1a 100644
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
+++ b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
@@ -17,4 +17,4 @@ do_configure_prepend() {
     sed -i -e "s: help: :g" ${S}/Makefile.am
 }
 
-PNBLACKLIST[gcalctool] ?= "broken at least since April 2013 http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also replaced by gnome calculator"
+PNBLACKLIST[gcalctool] ?= "broken at least since April 2013 http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also replaced by gnome calculator - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 9266f97a2..64785ca1c 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -105,4 +105,4 @@ pkg_postrm_${PN} () {
     sed -i /gdm/d ${sysconfdir}/X11/default-display-manager || true
 }
 
-PNBLACKLIST[gdm] ?= "Depends on broken gnome-panel"
+PNBLACKLIST[gdm] ?= "Depends on broken gnome-panel - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
index eeddcb769..235b02a2f 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
@@ -18,4 +18,4 @@ GNOME_COMPRESS_TYPE="bz2"
 FILES_${PN} += "${datadir}/gnome-background-properties"
 
 
-PNBLACKLIST[gnome-backgrounds] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130647/"
+PNBLACKLIST[gnome-backgrounds] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130647/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index 391d0dd97..201783e91 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -32,4 +32,4 @@ FILES_${PN}-dbg += "${libdir}/window-manager-settings/.debug"
 FILES_${PN}-dev += "${libdir}/window-manager-settings/*.la"
 FILES_${PN}-staticdev += "${libdir}/window-manager-settings/*.a"
 
-PNBLACKLIST[gnome-control-center] ?= "Depends on broken gnome-menus"
+PNBLACKLIST[gnome-control-center] ?= "Depends on broken gnome-menus - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index c94b659a7..f1dafad2e 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -25,4 +25,4 @@ PACKAGES =+ "libgnome-desktop"
 FILES_libgnome-desktop = "${libdir}/lib*${SOLIBS} ${datadir}/libgnome-desktop/pnp.ids"
 FILES_${PN} += "${datadir}/gnome-about"
 
-PNBLACKLIST[gnome-desktop] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130595/"
+PNBLACKLIST[gnome-desktop] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130595/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 78b678856..55a589c3f 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -42,4 +42,4 @@ FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
 FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug"
 
-PNBLACKLIST[gnome-disk-utility] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132824/"
+PNBLACKLIST[gnome-disk-utility] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132824/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 100d32ef2..4ac75cbef 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -42,4 +42,4 @@ FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
                     ${libdir}/${BPN}/devel/.debug/ \
                     ${base_libdir}/security/.debug/"
 
-PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from oe-core"
+PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index 2f55141a8..d1c9e4d8f 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -27,4 +27,4 @@ FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
                     ${PYTHON_SITEPACKAGES_DIR}/.debug"
 
 # http://errors.yoctoproject.org/Errors/Details/81001/
-PNBLACKLIST[gnome-menus] ?= "BROKEN: fails to build because of python + conflicts with gnome-menu3"
+PNBLACKLIST[gnome-menus] ?= "BROKEN: fails to build because of python + conflicts with gnome-menu3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
index 138d985fe..d1cfab8fb 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"
 BPN = "gnome-panel"
 PR = "r1"
 
-PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather"
+PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 # conflicts with gnome-panel, because they provide the same package
 # http://patches.openembedded.org/patch/43105/
@@ -48,4 +48,4 @@ FILES_${PN} =+ "${datadir}/gnome* \
                 ${libdir}/bonobo \
 "
 
-PNBLACKLIST[gnome-panel3] ?= "Depends on broken gnome-menus"
+PNBLACKLIST[gnome-panel3] ?= "Depends on broken gnome-menus - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
index 2e36063f2..7cb8b9ddf 100644
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
@@ -45,4 +45,4 @@ FILES_${PN} =+ "${datadir}/gnome* \
                 ${libdir}/bonobo \
 "
 
-PNBLACKLIST[gnome-panel] ?= "Depends on broken libgweather"
+PNBLACKLIST[gnome-panel] ?= "Depends on broken libgweather - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index 87bd722bb..ec2110785 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -51,4 +51,4 @@ FILES_${PN}-doc += "${datadir}/omf \
 "
 
 # gnome-power-manager-2.32.0/src/gpm-manager.c:488:18: error: too many arguments to function 'notify_notification_new'
-PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not compatible with current libnotify"
+PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not compatible with current libnotify - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index 94e0a6329..c49f2d3fb 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -29,4 +29,4 @@ FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${datadir}/gnome ${libdir}
 FILES_${PN}-dbg += "${libexecdir}/gnome-session/helpers/.debug"
 
 # http://errors.yoctoproject.org/Errors/Details/68621/
-PNBLACKLIST[gnome-session] ?= "BROKEN: fails to build with gcc-6"
+PNBLACKLIST[gnome-session] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index a3af09c3d..c1db6d3b4 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -41,6 +41,6 @@ FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gnome-settings-daemon-2.0/*.a"
 
 
-PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted libgnomekbd"
+PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted libgnomekbd - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted gnome-desktop"
+PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index 745ed00c7..4b397bf83 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -32,4 +32,4 @@ FILES_${PN} += "${datadir}/icons \
 FILES_${PN}-doc += "${datadir}/omf \
                     ${datadir}/gnome/help "
 
-PNBLACKLIST[gnome-system-monitor] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131635/"
+PNBLACKLIST[gnome-system-monitor] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131635/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
index 18e74dae6..6b3bf7654 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
@@ -19,4 +19,4 @@ GNOME_COMPRESS_TYPE="bz2"
 RRECOMMENDS_${PN} += "gnome-common-schemas"
 
 # http://errors.yoctoproject.org/Errors/Details/68636/
-PNBLACKLIST[gnome-terminal] ?= "BROKEN: fails to build with gcc-6"
+PNBLACKLIST[gnome-terminal] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
index 53cdf69f7..3480712b5 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
@@ -22,4 +22,4 @@ SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b"
 SRC_URI[archive.sha256sum] = "e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29"
 GNOME_COMPRESS_TYPE="bz2"
 
-PNBLACKLIST[libgnomecups] ?= "Depends on blacklisted libgnomeui"
+PNBLACKLIST[libgnomecups] ?= "Depends on blacklisted libgnomeui - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
index ff14616d2..a462a4b9e 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
@@ -25,4 +25,4 @@ FILES_${PN}-staticdev += "\
     ${libdir}/${PN}/${PV}/modules/*/*.a \
 "
 
-PNBLACKLIST[libgnomeprint] ?= "Depends on broken libgnomecups"
+PNBLACKLIST[libgnomeprint] ?= "Depends on broken libgnomecups - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
index 5d1d251b1..49d0fe9d4 100644
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
@@ -46,4 +46,4 @@ python populate_packages_prepend () {
         prepend=True)
 }
 
-PNBLACKLIST[gnumeric] ?= "Depends on broken libgnomeprint"
+PNBLACKLIST[gnumeric] ?= "Depends on broken libgnomeprint - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 1702ccb01..62d3df98e 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -32,4 +32,4 @@ FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
 FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
 
 
-PNBLACKLIST[gthumb] ?= "Depends on blacklisted gstreamer"
+PNBLACKLIST[gthumb] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
index 6e1997f77..6920f0aa2 100644
--- a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
+++ b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SECTION = "x11/gnome/libs"
 DEPENDS = "libxml2 gconf libsoup-2.4 gtk+3"
 
-PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather"
+PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 # e.g. sysroots/qemux86-64/usr/share/libgweather/locations.dtd
 #      sysroots/qemux86-64/usr/share/libgweather/Locations.zh_TW.xml
 
diff --git a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
index 71fe545fc..8b69f1fe7 100644
--- a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
@@ -21,4 +21,4 @@ PACKAGES =+ "${PN}-locationdata"
 FILES_${PN}-locationdata = "${datadir}/libgweather/Locations*"
 
 # http://errors.yoctoproject.org/Errors/Details/68608/
-PNBLACKLIST[libgweather] ?= "BROKEN: fails to build with gcc-6"
+PNBLACKLIST[libgweather] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index 77356272d..852d8e1ff 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -17,4 +17,4 @@ do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
-PNBLACKLIST[libgnomekbd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130608/"
+PNBLACKLIST[libgnomekbd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130608/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
index 4655c8332..5580f93a5 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
@@ -51,4 +51,4 @@ glib-compile-schemas ${datadir}/glib-2.0/schemas
 
 # 3.2.1-r4/nautilus-3.2.1/eel/eel-gnome-extensions.c:34:50: fatal error: libgnome-desktop/gnome-desktop-utils.h: No such file or directory
 # 3.2.1-r4/nautilus-3.2.1/eel/eel-editable-label.c:3105:55: error: 'GTK_STOCK_CUT' undeclared (first use in this function)
-PNBLACKLIST[nautilus3] ?= "BROKEN: fails to build, maybe missing dependency on gnome-desktop-utils.h provider"
+PNBLACKLIST[nautilus3] ?= "BROKEN: fails to build, maybe missing dependency on gnome-desktop-utils.h provider - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index 9a57d2c05..caf7f57b1 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -40,4 +40,4 @@ FILES_${PN} += "${datadir}/icons"
 PRIVATE_LIBS = "libnautilus-extension.so.1"
 
 
-PNBLACKLIST[nautilus] ?= "Depends on blacklisted gnome-desktop"
+PNBLACKLIST[nautilus] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
index 0d5b4149c..516cf93e4 100644
--- a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
+++ b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
@@ -17,4 +17,4 @@ do_configure_prepend () {
     sed -i 's/^        $(MAKE) dist distdir=/\t$(MAKE) dist distdir/' Makefile.am
 }
 
-PNBLACKLIST[contacts] ?= "Fails to fetch, pimlico-project.org is gone http://errors.yoctoproject.org/Errors/Details/132854/"
+PNBLACKLIST[contacts] ?= "Fails to fetch, pimlico-project.org is gone http://errors.yoctoproject.org/Errors/Details/132854/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
index 0fd465126..b46e9d9db 100644
--- a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
@@ -16,4 +16,4 @@ SRC_URI =+ "git://git.gnome.org/${BPN} \
 
 S = "${WORKDIR}/git"
 
-PNBLACKLIST[contacts] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132826/"
+PNBLACKLIST[contacts] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132826/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb b/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
index 47b098045..42c20c47e 100644
--- a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
+++ b/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
@@ -13,4 +13,4 @@ SRC_URI[sha256sum] = "1a7fdc5f95a2193a1a25fdb13f071867fb7e42245ce19ccee4bcccb69e
 PR = "r3"
 
 # tasks-0.19/libkoto/koto-utils.c:81:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-PNBLACKLIST[tasks] ?= "Fails to build with gcc-6"
+PNBLACKLIST[tasks] ?= "Fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb b/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
index 32d2ac62e..b71f1dc5b 100644
--- a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
+++ b/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
@@ -9,4 +9,4 @@ PR = "r3"
 S = "${WORKDIR}/git"
 
 # ../../git/libkoto/koto-utils.c:81:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-PNBLACKLIST[tasks] ?= "Fails to build with gcc-6"
+PNBLACKLIST[tasks] ?= "Fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb b/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
index 745b55805..862c0ea30 100644
--- a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
+++ b/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
@@ -51,4 +51,4 @@ FILES_${PN} += " ${datadir}/system-tools-backends-2.0/files"
 FILES_${PN} += " ${datadir}/system-tools-backends-2.0/scripts"
 FILES_${PN} += " ${datadir}/polkit*"
 
-PNBLACKLIST[system-tools-backends] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
+PNBLACKLIST[system-tools-backends] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index 89b63e9c5..e8f831408 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -32,4 +32,4 @@ SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
 GNOME_COMPRESS_TYPE="bz2"
 
-PNBLACKLIST[gnome-themes] ?= "Depends on blacklisted gtk-engines"
+PNBLACKLIST[gnome-themes] ?= "Depends on blacklisted gtk-engines - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
index 4e01c5c93..bd9f7a0ab 100644
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 PR = "r2"
 
-PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S"
+PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
 
diff --git a/meta-gnome/recipes-support/florence/florence_0.5.4.bb b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
index 72b68987c..efc553294 100644
--- a/meta-gnome/recipes-support/florence/florence_0.5.4.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.5.4.bb
@@ -19,4 +19,4 @@ inherit gettext autotools gconf pkgconfig
 
 EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet --without-xrecord"
 
-PNBLACKLIST[florence] ?= "Depends on blacklisted gstreamer"
+PNBLACKLIST[florence] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
index ab20460f1..6a2080d4c 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
@@ -48,4 +48,4 @@ python populate_packages_prepend () {
 }
 
 # | ../../goffice-0.10.1/goffice/math/go-complex.c:75:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-PNBLACKLIST[goffice] ?= "BROKEN: fails to build with gcc-6"
+PNBLACKLIST[goffice] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
index 7025280b8..eb36a120f 100644
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
@@ -85,4 +85,4 @@ SRC_URI[md5sum] = "f3a871beeebf86fd752863ebd22af9ac"
 SRC_URI[sha256sum] = "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d616d9969314bc7f1"
 
 # http://errors.yoctoproject.org/Errors/Details/81007/
-PNBLACKLIST[tracker] ?= "BROKEN: fails to build with new binutils-2.27"
+PNBLACKLIST[tracker] ?= "BROKEN: fails to build with new binutils-2.27 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
index de722a9d1..db50e38e3 100644
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
+++ b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
@@ -21,4 +21,4 @@ SRC_URI += "file://0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.pat
 
 RREPLACES_${PN} = "gpe-screenshot"
 
-PNBLACKLIST[gpe-scap] ?= "Depends on blacklisted libgpewidget"
+PNBLACKLIST[gpe-scap] ?= "Depends on blacklisted libgpewidget - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
index 28fc1e314..31e247eb1 100644
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
@@ -22,4 +22,4 @@ LDFLAGS += " -L${STAGING_LIBDIR}"
 
 PACKAGES =+ "${PN}-bin"
 
-PNBLACKLIST[libgpewidget] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130594/"
+PNBLACKLIST[libgpewidget] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130594/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
index 830ea07ce..8e064fdc6 100644
--- a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
+++ b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
@@ -15,4 +15,4 @@ SRC_URI[sha256sum] = "2b299425203246090a4949e034f1d0efb3ff99cd1591d0e16c57370a53
 
 export CVSBUILD="no"
 
-PNBLACKLIST[minilite] ?= "Depends on blacklisted libgpewidget"
+PNBLACKLIST[minilite] ?= "Depends on blacklisted libgpewidget - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
index 6f14af569..2dbcef402 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
@@ -43,4 +43,4 @@ do_install() {
 SRC_URI[md5sum] = "da9ec4721efdb0ec0aaa182bff16ad82"
 SRC_URI[sha256sum] = "328aec454db80e225aa0b5c31adef74bf62a14357482947e87e9731686b3c624"
 
-PNBLACKLIST[fbreader] ?= "Depends on blacklisted libgpewidget"
+PNBLACKLIST[fbreader] ?= "Depends on blacklisted libgpewidget - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_git.bb b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
index 1ed65849a..b3e7946b5 100644
--- a/meta-gpe/recipes-support/fbreader/fbreader_git.bb
+++ b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
@@ -42,4 +42,4 @@ do_install() {
 }
 
 # http://errors.yoctoproject.org/Errors/Details/68618/
-PNBLACKLIST[fbreader] ?= "BROKEN: fails to build with gcc-6"
+PNBLACKLIST[fbreader] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
index 97680bf39..440e8262d 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb
@@ -13,4 +13,4 @@ inherit autotools pkgconfig gtk-doc gobject-introspection
 
 EXTRA_OECONF = "--disable-python"
 
-PNBLACKLIST[gupnp-igd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130645/"
+PNBLACKLIST[gupnp-igd] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130645/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
index d42e3ff9c..ba7f8257f 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.8.10.bb
@@ -11,4 +11,4 @@ SRC_URI[sha256sum] = "592c53289ff1cd70e676405c56ca87b28d2da37a385d34a3bb9b944ba9
 
 inherit autotools pkgconfig
 
-PNBLACKLIST[gupnp-tools] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130670/"
+PNBLACKLIST[gupnp-tools] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130670/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
index 29e739675..4a7ed9a6e 100644
--- a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
+++ b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
@@ -133,4 +133,4 @@ RDEPENDS_dvb-apps =+ "libdvbapi libdvbcfg libdvbsec libdvben50221 libucsi"
 RDEPENDS_dvb-femon =+ "libdvbapi"
 RDEPENDS_dvbnet =+ "libdvbapi"
 
-PNBLACKLIST[dvb-apps] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130603/"
+PNBLACKLIST[dvb-apps] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130603/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
index 06dbce324..3b73549d2 100644
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
@@ -40,4 +40,4 @@ FILES_${PN} += "${datadir}/${BPN}"
 
 RDEPENDS_${PN} += "libdvben50221 libucsi libdvbapi"
 
-PNBLACKLIST[tvheadend] ?= "Depends on blacklisted dvb-apps"
+PNBLACKLIST[tvheadend] ?= "Depends on blacklisted dvb-apps - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
index adff73bb9..7cafebfa2 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
@@ -54,4 +54,4 @@ INSANE_SKIP_${PN} = "dev-so"
 FILES_${PN} += "${datadir}/kodi"
 FILES_${PN}-dbg += "${datadir}/kodi/addons/*/.debug/"
 
-PNBLACKLIST[kodi-addon-pvr-hts] ?= "Depends on blacklisted kodi"
+PNBLACKLIST[kodi-addon-pvr-hts] ?= "Depends on blacklisted kodi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
index ea739c2d2..0b554ef6a 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
@@ -36,4 +36,4 @@ do_compile_prepend() {
 RPROVIDES_${PN} += "libkodiplatform"
 FILES_${PN}-dev += "${libdir}/*platform"
 
-PNBLACKLIST[kodi-platform] ?= "Depends on blacklisted kodi"
+PNBLACKLIST[kodi-platform] ?= "Depends on blacklisted kodi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
index 49e0b4dc8..47e8f38e9 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
@@ -19,6 +19,6 @@ SYSTEMD_SERVICE_${PN} = "kodi.service"
 
 RDEPENDS_${PN} += "xinit kodi"
 
-PNBLACKLIST[kodi-startup] ?= "Runtime depends on blacklisted kodi"
+PNBLACKLIST[kodi-startup] ?= "Runtime depends on blacklisted kodi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[kodi-startup] ?= "Runtime depends on blacklisted kodi-startup-dev"
+PNBLACKLIST[kodi-startup] ?= "Runtime depends on blacklisted kodi-startup-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
index e3a117e7a..d6e19617d 100644
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
+++ b/meta-multimedia/recipes-mediacenter/kodi/kodi_17.bb
@@ -193,4 +193,4 @@ RPROVIDES_${PN} += "xbmc"
 TOOLCHAIN = "gcc"
 
 
-PNBLACKLIST[kodi] ?= "Depends on blacklisted libsdl-mixer"
+PNBLACKLIST[kodi] ?= "Depends on blacklisted libsdl-mixer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
index fe44ccf24..8a142645c 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
@@ -54,4 +54,4 @@ do_install() {
 # | src/common/../../lib/boost/utf8_codecvt_facet/utf8_codecvt_facet.cpp:174:5: error: 'int mtx::utf8_codecvt_facet::do_length' is not a static data member of 'struct mtx::utf8_codecvt_facet'
 # |      BOOST_CODECVT_DO_LENGTH_CONST std::mbstate_t &,
 # |      ^
-PNBLACKLIST[mkvtoolnix] ?= "BROKEN: Failx to build with gcc-5"
+PNBLACKLIST[mkvtoolnix] ?= "BROKEN: Failx to build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
index a9f52cadb..1ddd9aab6 100755
--- a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
+++ b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394 libxv tiff"
 
-PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay'"
+PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay' - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/coriander-2/${PV}/${BP}.tar.gz \
            file://cross-compile.patch \
diff --git a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
index 68d59faca..4d06d2c68 100644
--- a/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/dleyna/renderer-service-upnp_0.3.0.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://src/renderer-service-upnp.c;beginline=1;endline=21;md5=c25c3082684eb4ca87474b7528c6dc15"
 
-PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S})"
+PNBLACKLIST[renderer-service-upnp] ?= "BROKEN: doesn't build with B!=S (trying to install rendererconsole.py from ${B} instead of ${S}) - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 DEPENDS = "dbus glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4"
 
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
index 891b10ca4..ca19fd69b 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
@@ -100,4 +100,4 @@ FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
 
 # http://errors.yoctoproject.org/Errors/Details/40736/
-PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3"
+PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
index 47f1d9f7b..9fe1bc6b6 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
@@ -14,4 +14,4 @@ SRC_URI[sha256sum] = "89d1de025eca0466c125dcd6a11b64341bdf98ee4c03c3e5a12321d77c
 
 inherit autotools
 
-PNBLACKLIST[gst123] ?= "gst123 is still "sometimes" using wrong sysroot"
+PNBLACKLIST[gst123] ?= "gst123 is still "sometimes" using wrong sysroot - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
index 126878f77..2da29d9cb 100644
--- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
+++ b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
@@ -16,7 +16,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "41c9b070aae8ed403fc8c2aac7ab157c"
 SRC_URI[sha256sum] = "aa46e7f8736b88c1d752cf606b3990041221ce91d014e955c6b02eb2167db015"
 
-PNBLACKLIST[dnrd] ?= "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were installed but not shipped in any package:"
+PNBLACKLIST[dnrd] ?= "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were installed but not shipped in any package: - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SYSTEMD_SERVICE_${PN} = "dnrd.service"
 SYSTEMD_AUTO_ENABLE = "disable"
diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 82b9b059d..192ece0e9 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -89,4 +89,4 @@ do_install () {
 }
 
 # http://errors.yoctoproject.org/Errors/Details/83335/
-PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default kernel version 4.8"
+PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default kernel version 4.8 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
index 667e7ccb9..2d8509c74 100644
--- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
@@ -34,4 +34,4 @@ RDEPENDS_${PN} = "kernel-module-netmap"
 RRECOMMENDS_${PN} = "kernel-module-netmap"
 
 # http://errors.yoctoproject.org/Errors/Details/69733/
-PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails, either it should be disabled or there should be dependency on kernel like in netmap-modules"
+PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails, either it should be disabled or there should be dependency on kernel like in netmap-modules - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
index 22b7cfe92..0a86504c7 100644
--- a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
+++ b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
@@ -42,4 +42,4 @@ do_install_prepend() {
 }
 
 # http://errors.yoctoproject.org/Errors/Details/81003/
-PNBLACKLIST[accel-ppp] ?= "BROKEN: fails to build with new binutils-2.27"
+PNBLACKLIST[accel-ppp] ?= "BROKEN: fails to build with new binutils-2.27 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
index 11c43ff0f..9281e1665 100644
--- a/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
+++ b/meta-networking/recipes-support/lksctp-tools/lksctp-tools_1.0.17.bb
@@ -21,7 +21,7 @@ SRC_URI[sha256sum] = "1aeb204cdb2befc94d9eb3037d1609c9d1d2cd5379d6dd2c0a8ca9b105
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.0/ld: error: symbol sctp_connectx has undefined version
 #| collect2: error: ld returned 1 exit status
 #| make[4]: *** [libsctp.la] Error 1
-PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)}"
+PNBLACKLIST[lksctp-tools] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "BROKEN: fails to link against sctp_connectx symbol", '', d)} - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 S = "${WORKDIR}/${BP}"
 
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
index 5e0056738..0b7e5046b 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
@@ -18,7 +18,7 @@ HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
 DEPENDS = "yp-tools ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PROVIDES += "ypbind"
 
-PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools"
+PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
            file://ypbind.init \
diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
index bdd444a4f..b3217790d 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_6.6.1.bb
@@ -35,4 +35,4 @@ FILES_${PN} += " \
     ${systemd_unitdir}/* \
 "
 
-PNBLACKLIST[phoronix-test-suite] ?= "Runtime depends on blacklisted php-cli"
+PNBLACKLIST[phoronix-test-suite] ?= "Runtime depends on blacklisted php-cli - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb b/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
index 9cdaa96de..8113da76d 100644
--- a/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
+++ b/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
@@ -27,4 +27,4 @@ FILES_${PN}-stats2gnuplot = "${bindir}/stats2gnuplot"
 
 RRECOMMENDS_${PN} = "${PN}-stats2gnuplot"
 
-PNBLACKLIST[pmbw] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130568/"
+PNBLACKLIST[pmbw] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130568/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
index 3a15d64cc..8a08f01a0 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez-hcidump_2.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
 PR = "r1"
 
-PNBLACKLIST[bluez-hcidump] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[bluez-hcidump] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz \
            file://obsolete_automake_macros.patch \
diff --git a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
index d6d16c00f..20fba0015 100644
--- a/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
+++ b/meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb
@@ -1,6 +1,6 @@
 require bluez4.inc
 
-PNBLACKLIST[bluez4] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[bluez4] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 PR = "r11"
 
diff --git a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
index 822aec4dc..747a335ad 100644
--- a/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
+++ b/meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb
@@ -1,7 +1,7 @@
 require bluez4.inc
 require recipes-multimedia/gstreamer/gst-plugins-package.inc
 
-PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[gst-plugin-bluetooth] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 PR = "r1"
 
diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
index b22f820d5..b6098d84a 100644
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
@@ -33,4 +33,4 @@ FILES_libgnokii = "${libdir}/libgnokii.so.*"
 SRC_URI[md5sum] = "d9627f4a1152d3ea7806df4532850d5f"
 SRC_URI[sha256sum] = "8f5a083b05c1a66a3402ca5cd80084e14c2c0632c991bb53b03c78e9adb02501"
 
-PNBLACKLIST[gnokii] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130662/"
+PNBLACKLIST[gnokii] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130662/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
index e2b28dd9d..726032352 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager-openvpn_1.2.6.bb
@@ -34,4 +34,4 @@ RDEPENDS_${PN} = " \
     openvpn \
 "
 
-PNBLACKLIST[networkmanager-openvpn] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130667/"
+PNBLACKLIST[networkmanager-openvpn] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130667/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/soft66/soft66_git.bb b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
index b6495267c..816f58350 100644
--- a/meta-oe/recipes-connectivity/soft66/soft66_git.bb
+++ b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv3 & LGPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 "
 
-PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi"
+PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 DEPENDS = "libftdi"
 
diff --git a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
index 9fb69a1b5..783bd5d73 100644
--- a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
@@ -23,4 +23,4 @@ inherit autotools pkgconfig pythonnative
 FILES_${PN} += "${datadir}/telepathy \
     ${datadir}/dbus-1"
 
-PNBLACKLIST[libtelepathy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130609/"
+PNBLACKLIST[libtelepathy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130609/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
index 09841a4d7..6a4d5d006 100644
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
+++ b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
@@ -50,4 +50,4 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-PNBLACKLIST[telepathy-mission-control] ?= "Depends on blacklisted libtelepathy"
+PNBLACKLIST[telepathy-mission-control] ?= "Depends on blacklisted libtelepathy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
index 65617fa3b..80e72bd8b 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvdial_1.61.bb
@@ -29,4 +29,4 @@ do_install() {
     oe_runmake prefix=${D}/usr PPPDIR=${D}/etc/ppp/peers install
 }
 
-PNBLACKLIST[wvdial] ?= "Depends on broken wvstreams"
+PNBLACKLIST[wvdial] ?= "Depends on broken wvstreams - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 8d864484a..fe79dc1ad 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -48,4 +48,4 @@ FILES_${PN}-valgrind = "${libdir}/valgrind/wvstreams.supp"
 RDEPENDS_${PN} += "perl"
 
 # http://errors.yoctoproject.org/Errors/Details/68614/
-PNBLACKLIST[wvstreams] ?= "BROKEN: fails to build with gcc-6"
+PNBLACKLIST[wvstreams] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
index 2b6f56ed4..7c833b0eb 100644
--- a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
+++ b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "989e51194c6adadbd156da3288e37bad847b93b3b876502e83033b7049
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note: virtual int Db::set_bt_compare(int (*)(Db*, const Dbt*, const Dbt*, size_t*)) <near match>
 #| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note:   no known conversion for argument 1 from 'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, const __db_dbt*)}' to 'int (*)(Db*, const Dbt*, const Dbt*, size_t*) {aka int (*)(Db*, const Dbt*, const Dbt*, long unsigned int*)}'
 #| make[3]: *** [MapDb.o] Error 1
-PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version"
+PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 S = "${WORKDIR}/Ice-${PV}"
 
diff --git a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
index da94138d2..a953ebc28 100644
--- a/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
+++ b/meta-oe/recipes-core/dbus/dbus-daemon-proxy_git.bb
@@ -21,4 +21,4 @@ do_install() {
 }
 
 
-PNBLACKLIST[dbus-daemon-proxy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130613/"
+PNBLACKLIST[dbus-daemon-proxy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130613/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
index 3a62c3d85..4412716a6 100644
--- a/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
+++ b/meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb
@@ -28,4 +28,4 @@ FILES_${PN}-tools = "${bindir}"
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[libdbus-c++] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130644/"
+PNBLACKLIST[libdbus-c++] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130644/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
index 37b3c1870..0a787e3ea 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
@@ -27,4 +27,4 @@ SRC_URI[md5sum] = "706171d8d520b1ca1576ac73f2ceb4f3"
 SRC_URI[sha256sum] = "0a359efa3e9496c33234b3e9c89306a09bb4da9d33de43c261f1d8447e6ebea2"
 
 # http://errors.yoctoproject.org/Errors/Details/35143/
-PNBLACKLIST[fakeroot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so"
+PNBLACKLIST[fakeroot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
index 1bb56ea30..697f9bfa5 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
@@ -44,6 +44,6 @@ RRECOMMENDS_${PN}-debug = "\
     ltrace \
 "
 
-PNBLACKLIST[packagegroup-cli-tools] ?= "Runtime depends on blacklisted dbus-daemon-proxy"
+PNBLACKLIST[packagegroup-cli-tools] ?= "Runtime depends on blacklisted dbus-daemon-proxy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[packagegroup-cli-tools] ?= "Runtime depends on blacklisted packagegroup-cli-tools"
+PNBLACKLIST[packagegroup-cli-tools] ?= "Runtime depends on blacklisted packagegroup-cli-tools - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 6940d2da4..c6d78905d 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -8,7 +8,7 @@ PR = "r5"
 # Nodejs-native for node-waf, nodejs4-native for the headers
 DEPENDS = "libxml2 nodejs-native nodejs4-native"
 
-PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3"
+PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 inherit systemd
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
diff --git a/meta-oe/recipes-devtools/dt/dt_18.32.bb b/meta-oe/recipes-devtools/dt/dt_18.32.bb
index 8c1e3dfb6..0234f765a 100644
--- a/meta-oe/recipes-devtools/dt/dt_18.32.bb
+++ b/meta-oe/recipes-devtools/dt/dt_18.32.bb
@@ -46,4 +46,4 @@ do_install() {
 
 RDEPENDS_${PN} += "tcsh"
 
-PNBLACKLIST[dt] ?= "Rdepends on blacklisted tcsh"
+PNBLACKLIST[dt] ?= "Rdepends on blacklisted tcsh - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
index 62117b136..b13bd7bcc 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
@@ -94,4 +94,4 @@ do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 do_make_scripts[deptask] = "do_populate_sysroot"
 
 # http://errors.yoctoproject.org/Errors/Details/56327/
-PNBLACKLIST[ltp-ddt] ?= "BROKEN: fails since last autotools.bbclass changes"
+PNBLACKLIST[ltp-ddt] ?= "BROKEN: fails since last autotools.bbclass changes - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
index 3633f299d..1b60c470d 100644
--- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
+++ b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
@@ -62,4 +62,4 @@ FILES_${PN}-dev += "${libdir}/packagekit-backend/*.la ${libdir}/gtk-2.0/*/*.la"
 FILES_${PN}-staticdev += "${libdir}/packagekit-backend/*.a ${libdir}/gtk-2.0/*/*.a"
 
 # PackageKit-0.5.6/backends/opkg/pk-backend-opkg.c:31:26: fatal error: libopkg/opkg.h: No such file or directory
-PNBLACKLIST[packagekit] ?= "BROKEN: depends on old deprecated libopkg which is currently disabled and will be removed soon"
+PNBLACKLIST[packagekit] ?= "BROKEN: depends on old deprecated libopkg which is currently disabled and will be removed soon - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/php/php_5.6.26.bb b/meta-oe/recipes-devtools/php/php_5.6.26.bb
index c5698f806..30a71f628 100644
--- a/meta-oe/recipes-devtools/php/php_5.6.26.bb
+++ b/meta-oe/recipes-devtools/php/php_5.6.26.bb
@@ -8,4 +8,4 @@ SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
 SRC_URI[md5sum] = "cb424b705cfb715fc04f499f8a8cf52e"
 SRC_URI[sha256sum] = "d47aab8083a4284b905777e1b45dd7735adc53be827b29f896684750ac8b6236"
 
-PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131630/"
+PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131630/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-devtools/php/php_7.1.0.bb
index ee8155c48..99075d04e 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.0.bb
@@ -13,4 +13,4 @@ PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
 
 FILES_${PN}-fpm += "${sysconfdir}/php-fpm.d/www.conf.default"
 
-PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130601/"
+PNBLACKLIST[php] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130601/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
index 2b90d1eae..19e3dceca 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
@@ -3,4 +3,4 @@ require vala-dbus-binding-tool.inc
 SRC_URI[md5sum] = "59eab7abf38f35355d3786803bd2441f"
 SRC_URI[sha256sum] = "1e37ab2e6238eaef9f573560ea7379e6955570f7c9503083e50c4c185c1956df"
 
-PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131628/"
+PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131628/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
index bcc6c981a..32f34550d 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
@@ -17,4 +17,4 @@ SRC_URI = "git://github.com/freesmartphone/vala-dbus-binding-tool.git;protocol=h
 "
 S = "${WORKDIR}/git"
 
-PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130581/"
+PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130581/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
index a7ce508ea..081bd3bc0 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
@@ -29,4 +29,4 @@ do_configure_prepend() {
 FILES_${PN} =+ "${libdir}/cmpi/libcmpiLMI_Networking.so ${prefix}/libexec*"
 FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug*"
 
-PNBLACKLIST[openlmi-networking] ?= "Depends on blacklisted openlmi-providers"
+PNBLACKLIST[openlmi-networking] ?= "Depends on blacklisted openlmi-providers - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
index d4f8c46e7..2eda65320 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
@@ -53,4 +53,4 @@ FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug*"
 
 RDEPENDS_${PN} = "python"
 
-PNBLACKLIST[openlmi-providers] ?= "Depends on blacklisted lmsensors"
+PNBLACKLIST[openlmi-providers] ?= "Depends on blacklisted lmsensors - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
index 5facde6d7..f99b77ca4 100644
--- a/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
+++ b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
@@ -31,4 +31,4 @@ do_install_append() {
 
 FILES_${PN} =+ "${sysconfdir}/openlmi/storage/storage.conf ${datadir}/${BPN}/*"
 
-PNBLACKLIST[openlmi-storage] ?= "Depends on blacklisted pywbem"
+PNBLACKLIST[openlmi-storage] ?= "Depends on blacklisted pywbem - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
index 22b9d2fd7..90adaf487 100644
--- a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
+++ b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libdivecomputer gtk+ libxml2 glib-2.0 gconf"
 
-PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer"
+PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 inherit gtk-icon-cache cmake
 
diff --git a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
index 926eff77d..34b7aa64a 100644
--- a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
+++ b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
@@ -16,4 +16,4 @@ DEPENDS = "gtk+"
 inherit autotools pkgconfig gobject-introspection
 
 # | ./.libs/libgtkextra-x11-3.0.so: error: undefined reference to 'roundint'
-PNBLACKLIST[gtkextra] ?= "BROKEN: Fails to build with gcc-5"
+PNBLACKLIST[gtkextra] ?= "BROKEN: Fails to build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
index 86265bb86..021b077de 100644
--- a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
@@ -38,4 +38,4 @@ inherit pkgconfig autotools
 
 EXTRA_OECONF = " --disable-accessibility"
 
-PNBLACKLIST[gtkhtml2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130633/"
+PNBLACKLIST[gtkhtml2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130633/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
index 194d1046f..d73e2f15e 100644
--- a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
+++ b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6
 # 0.12.1+gitAUTOINC+de5452e56b-r1/git/clutter-box2d/clutter-box2d.h:226:47:
 #  fatal error: clutter-box2d/clutter-box2d-child.h: No such file or directory
 # |  #include <clutter-box2d/clutter-box2d-child.h>
-PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S"
+PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
 PV = "0.12.1+git${SRCPV}"
diff --git a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
index e0f8128ed..2322476c7 100644
--- a/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
+++ b/meta-oe/recipes-graphics/fbida/fbida_2.10.bb
@@ -65,4 +65,4 @@ do_install() {
 
 RDEPENDS_${PN} = "ttf-dejavu-sans-mono bash"
 
-PNBLACKLIST[fbida] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/"
+PNBLACKLIST[fbida] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130677/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
index 90ac70216..7d1a3aaa8 100644
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://www.autistici.org/dezperado/fim/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fa01bff138cc98a62b8840a157951c88"
 
-PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex)"
+PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex) - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 # flex with provide /usr/include/FlexLexer.h
 DEPENDS = "flex-native bison-native flex"
diff --git a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
index e96edd23b..2ba1ebbb7 100644
--- a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
+++ b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
@@ -5,4 +5,4 @@ PR = "r2"
 SRC_URI[md5sum] = "33c079a253270ec8bfb9508e4bb30754"
 SRC_URI[sha256sum] = "8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e"
 
-PNBLACKLIST[libsexy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130607/"
+PNBLACKLIST[libsexy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
index 71359e012..2fbdcab46 100644
--- a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
+++ b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
@@ -79,4 +79,4 @@ systemctl disable slim.service
 sed -i /slim/d $D${sysconfdir}/X11/default-display-manager || true
 }
 
-PNBLACKLIST[slim] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
+PNBLACKLIST[slim] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
index b4b16416b..4c8399d7d 100644
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
@@ -44,4 +44,4 @@ FILES_${PN}-consolefonts = "${datadir}/consolefonts"
 FILES_${PN}-consoletrans = "${datadir}/consoletrans"
 FILES_${PN}-pcf = "${datadir}/fonts/terminus"
 
-PNBLACKLIST[terminus-font] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130638/"
+PNBLACKLIST[terminus-font] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130638/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
index ea7c75016..2af669770 100755
--- a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
+++ b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
@@ -32,4 +32,4 @@ do_install_append() {
 FILES_${PN} += "${bindir}/wfits ${libdir}/weston/*.so"
 FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/weston/.debug ${prefix}/src"
 
-PNBLACKLIST[wayland-fits] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130632/"
+PNBLACKLIST[wayland-fits] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130632/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
index db902d9f0..f92d88366 100644
--- a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
@@ -14,4 +14,4 @@ BBCLASSEXTEND = "native"
 SRC_URI[md5sum] = "eb5473acaef15a5db9b50df29c6a7f90"
 SRC_URI[sha256sum] = "f648e2b0cf16aa29856de998e2c7204be39dc1f8daeda9464d32288e0b580fc1"
 
-PNBLACKLIST[xstdcmap] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130660/"
+PNBLACKLIST[xstdcmap] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130660/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
index 547ec86c1..5f2adec1a 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
 
 DEPENDS += "pixman"
 
-PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call)"
+PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call) - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "git://gitorious.org/xorg/xf86-input-mtev.git file://fix-it.patch"
 SRCREV = "1eb469166ffc095c5801475f057f911f97a6e641"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
index d26759861..e543413ad 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
@@ -13,4 +13,4 @@ COMPATIBLE_HOST = "i.86.*-linux"
 RDEPENDS_${PN} += "xserver-xorg-module-exa"
 
 # 2_2.11.16-r21.0/xf86-video-geode-2.11.16/src/gx_driver.c:376:20: error: implicit declaration of function 'xf86MapVidMem' [-Werror=implicit-function-declaration]
-PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build"
+PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
index 97d80c22f..5818d0cc9 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
@@ -22,4 +22,4 @@ SRCREV = "cb9ed17035a79e49dde26a1e7e2bc5f10fd8144b"
 
 EXTRA_OECONF = " --disable-kms "
 
-PNBLACKLIST[xf86-video-glamo] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130629/"
+PNBLACKLIST[xf86-video-glamo] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130629/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
index 436c92cc4..444189a89 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-nouveau_1.0.12.bb
@@ -16,4 +16,4 @@ SRC_URI[md5sum] = "dc79910c7b9e32321cefc7af250c7765"
 SRC_URI[sha256sum] = "0ea057ad7fc31caba2d4e46c7e418fe2b3c762b04fb8d382f53383397fd8391e"
 
 
-PNBLACKLIST[xf86-video-nouveau] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130657/"
+PNBLACKLIST[xf86-video-nouveau] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130657/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
index 0e1164dd1..fcf68262c 100644
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -13,12 +13,12 @@ RDEPENDS_${PN} = "\
     font-bitstream-100dpi \
 "
 
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-100dpi"
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted xorg-fonts-100dpi"
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted xorg-fonts-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-100dpi"
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-utopia-100dpi"
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-utopia-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-lucidatypewriter-100dpi"
+PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-lucidatypewriter-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
index 3ea5820be..fbd89c316 100644
--- a/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
+++ b/meta-oe/recipes-kernel/crash/crash_7.1.5.bb
@@ -112,4 +112,4 @@ RDEPENDS_${PN}_class-cross = ""
 # jenkins  15161  100 12.5 10389596 10321284 ?   R    11:40  28:17 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/x86_64-linux/usr/libexec/arm-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.9.2/cc1 -quiet -I . -I . -I ./common -I ./config -I ./../include/opcode -I ./../opcodes/.. -I ./../readline/.. -I ../bfd -I ./../bfd -I ./../include -I ../libdecnumber -I ./../libdecnumber -I ./gnulib/import -I build-gnulib/import -isysroot /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemuarm -MMD eval.d -MF .deps/eval.Tpo -MP -MT eval.o -D LOCALEDIR="/usr/local/share/locale" -D CRASH_MERGE -D HAVE_CONFIG_H -D TUI=1 eval.c -quiet -dumpbase eval.c -march=armv5te -mthumb -mthumb-interwork -mtls-dialect=gnu -auxbase-strip eval.o -g -O2 -Wall -Wpointer-arith -Wformat-nonliteral -Wno-pointer-sign -Wno-unused -Wunused-value -Wunused-function -Wno-switch -Wno-char-subscripts -Wmissing-prototypes -Wdeclaration-after-statement -Wempty-body -feliminate-unused-debug-types -o -
 ARM_INSTRUCTION_SET = "arm"
 
-PNBLACKLIST[crash] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130678/"
+PNBLACKLIST[crash] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130678/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_git.bb b/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
index cb913271f..1119d4c90 100644
--- a/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
@@ -7,7 +7,7 @@ SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
 inherit module
 
 # See https://github.com/ktap/ktap/issues/80
-PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel"
+PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 # Only build the module
 MAKE_TARGETS = "mod"
diff --git a/meta-oe/recipes-kernel/ktap/ktap_git.bb b/meta-oe/recipes-kernel/ktap/ktap_git.bb
index 248e7bdd6..a947b7fcc 100644
--- a/meta-oe/recipes-kernel/ktap/ktap_git.bb
+++ b/meta-oe/recipes-kernel/ktap/ktap_git.bb
@@ -5,7 +5,7 @@ require ktap.inc
 SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
 DEPENDS = "ktap-module"
 
-PNBLACKLIST[ktap] ?= "Depends on blacklisted kernel-module-ktapvm"
+PNBLACKLIST[ktap] ?= "Depends on blacklisted kernel-module-ktapvm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 # Only build the userspace app
 EXTRA_OEMAKE += "ktap"
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
index 9892e35a4..81d700a7b 100644
--- a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
+++ b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
@@ -3,4 +3,4 @@ require ${BPN}.inc
 SRCREV = "v1_1_5"
 LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
 
-PNBLACKLIST[minidlna] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130630/"
+PNBLACKLIST[minidlna] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130630/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
index 330dfd3e7..1a4ae27e6 100644
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
@@ -156,4 +156,4 @@ do_install() {
 }
 
 # http://errors.yoctoproject.org/Errors/Details/40734/
-PNBLACKLIST[mplayer2] ?= "Not compatible with currently used ffmpeg 3"
+PNBLACKLIST[mplayer2] ?= "Not compatible with currently used ffmpeg 3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
index d91cbcbbb..ba56b8860 100644
--- a/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
+++ b/meta-oe/recipes-navigation/foxtrotgps/foxtrotgps_1.1.1.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "curl gtk+ libglade sqlite3 libexif gpsd bluez4 intltool-native"
 
-PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[foxtrotgps] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "http://www.foxtrotgps.org/releases/${BP}.tar.gz"
 SRC_URI[md5sum] = "6777d448ee9d3ba195f9d26ea90e3163"
diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
index 012806a69..4e821be5a 100644
--- a/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
+++ b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
@@ -111,4 +111,4 @@ FILES_${PN} += "${libdir}/gdalplugins"
 # | gdalserver.c:124:21: error: storage size of 'sHints' isn't known
 # |      struct addrinfo sHints;
 # |                      ^
-PNBLACKLIST[gdal] ?= "BROKEN: fails to build with gcc-5"
+PNBLACKLIST[gdal] ?= "BROKEN: fails to build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-navigation/gypsy/gypsy.inc b/meta-oe/recipes-navigation/gypsy/gypsy.inc
index 9efd35637..55bf536dc 100644
--- a/meta-oe/recipes-navigation/gypsy/gypsy.inc
+++ b/meta-oe/recipes-navigation/gypsy/gypsy.inc
@@ -8,7 +8,7 @@ LICENSE = "GPLv2.0 & LGPLv2.1"
 SECTION = "console/network"
 DEPENDS = "glib-2.0 dbus bluez4 dbus-glib libxslt-native libxslt"
 
-PNBLACKLIST[gypsy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[gypsy] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 inherit autotools pkgconfig gtk-doc
 PACKAGES += "libgypsy"
diff --git a/meta-oe/recipes-navigation/navit/navit.inc b/meta-oe/recipes-navigation/navit/navit.inc
index 1c0bfdaae..41e4a595b 100644
--- a/meta-oe/recipes-navigation/navit/navit.inc
+++ b/meta-oe/recipes-navigation/navit/navit.inc
@@ -15,7 +15,7 @@ PE = "1"
 INC_PR = "r11"
 
 # Depends on gypsy
-PNBLACKLIST[navit] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[navit] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 inherit autotools gettext pkgconfig
 
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
index 938af2ef7..534ba3b14 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
@@ -4,7 +4,7 @@ DEPENDS = "gtk+ libetpan openssl aspell curl libgcrypt"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e059bde2972c1790af786f3e86bac22e"
 
-PNBLACKLIST[claws-mail] ?= "depends on blacklisted libetpan"
+PNBLACKLIST[claws-mail] ?= "depends on blacklisted libetpan - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 inherit autotools pkgconfig gettext
 
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
index c25257344..29b41be93 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
@@ -4,7 +4,7 @@ DEPENDS = "claws-mail gtkhtml2 curl"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=977f04a8048c04684e521c06e2844a94"
 
-PNBLACKLIST[claws-plugin-gtkhtml2-viewer] ?= "depends on blacklisted claws-mail"
+PNBLACKLIST[claws-plugin-gtkhtml2-viewer] ?= "depends on blacklisted claws-mail - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 PR = "r1"
 
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
index b1321775a..986b5d40d 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
@@ -4,7 +4,7 @@ DEPENDS = "claws-mail"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PNBLACKLIST[claws-plugin-mailmbox] ?= "depends on blacklisted claws-mail"
+PNBLACKLIST[claws-plugin-mailmbox] ?= "depends on blacklisted claws-mail - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/mailmbox-${PV}.tar.gz"
 SRC_URI[md5sum] = "7f72c68e6e1a8768f1247f455fd20b62"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
index 7da460c4d..eec9a2d70 100644
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
+++ b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
@@ -4,7 +4,7 @@ DEPENDS = "claws-mail libxml2 curl glib-2.0 gtk+"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0c2348e0a084e573f0220f5e45d8097e"
 
-PNBLACKLIST[claws-plugin-rssyl] ?= "depends on blacklisted claws-mail"
+PNBLACKLIST[claws-plugin-rssyl] ?= "depends on blacklisted claws-mail - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/rssyl-${PV}.tar.gz \
            file://configure.patch"
diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
index 4e4fe6884..978d777ea 100644
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
@@ -30,4 +30,4 @@ do_configure_prepend() {
 inherit autotools pkgconfig
 
 
-PNBLACKLIST[sylpheed] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130651/"
+PNBLACKLIST[sylpheed] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130651/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
index 3ef179295..c8c54a413 100644
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://garr.dl.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3
 SRC_URI[md5sum] = "5928822d855c5cf7ac29655e3e0b8c23"
 SRC_URI[sha256sum] = "0707b5ec9916fbde9e44eb8d18037c8d8f75dfd6aeef51aba5487e189eef2032"
 
-PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S"
+PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 inherit autotools
 
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
index a32482883..3388ff01e 100644
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ b/meta-oe/recipes-support/emacs/emacs_23.4.bb
@@ -2,7 +2,7 @@ require emacs.inc
 
 PR = "r4"
 
-PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped"
+PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
            file://use-qemu.patch \
diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
index 2fdb12cc5..14ce57aaf 100644
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
@@ -29,6 +29,6 @@ FILES_${PN}-dbg += "${libdir}/*/.debug"
 SRC_URI[md5sum] = "e1f540cf3ebab06c3d7db1f46b44ac88"
 SRC_URI[sha256sum] = "3ae59aa61a8071c9fad111e5fd606aabc27961eb4192f8729987a27dae6b3974"
 
-PNBLACKLIST[farsight2] ?= "Depends on blacklisted gstreamer"
-PNBLACKLIST[farsight2] ?= "Depends on blacklisted libnice"
-PNBLACKLIST[farsight2] ?= "Depends on blacklisted gst-plugins-base"
+PNBLACKLIST[farsight2] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+PNBLACKLIST[farsight2] ?= "Depends on blacklisted libnice - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+PNBLACKLIST[farsight2] ?= "Depends on blacklisted gst-plugins-base - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
index 3e06a5a4b..49cc270fe 100644
--- a/meta-oe/recipes-support/fftw/benchfft_3.1.bb
+++ b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
@@ -18,4 +18,4 @@ do_compile_prepend() {
 SRC_URI[md5sum] = "9356e5e9dcb3f1481977009720a2ccf8"
 SRC_URI[sha256sum] = "1b4a5b5e48ad5e61a21586b7b59d5c0a88691a981e73e2c6dc5868197461791b"
 
-PNBLACKLIST[benchfft] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them"
+PNBLACKLIST[benchfft] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
index ca9a99eeb..0883c1ad4 100644
--- a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
+++ b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
@@ -18,4 +18,4 @@ SRC_URI[sha256sum] = "922225f7001e57a0fbace8833b0a48790a68f6c7b491f2d47c78ad537a
 # flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]
 # flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
 # flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]
-PNBLACKLIST[flite-alsa] ?= "OLD: wasn't updated in over 6 years, only navit was RSUGGESTing it and doesn't respect LDFLAGS"
+PNBLACKLIST[flite-alsa] ?= "OLD: wasn't updated in over 6 years, only navit was RSUGGESTing it and doesn't respect LDFLAGS - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
index f1276f936..3dc22c590 100644
--- a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
+++ b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
@@ -9,7 +9,7 @@ DEPENDS = "gnutls"
 PR = "r1"
 
 # http://errors.yoctoproject.org/Errors/Details/25825/
-PNBLACKLIST[iksemel] ?= "Not compatible with gnutls version 3.4 currently in oe-core"
+PNBLACKLIST[iksemel] ?= "Not compatible with gnutls version 3.4 currently in oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "http://iksemel.googlecode.com/files/${BP}.tar.gz;name=archive \
            file://r25.diff"
diff --git a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb b/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
index ec869c414..8d2c5054a 100644
--- a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
+++ b/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
@@ -5,4 +5,4 @@ SRC_URI[md5sum] = "4de79b323162a5a7652b65b608eca6cd"
 SRC_URI[sha256sum] = "4ab9944398ce769c0deeb64d2f73555c67bc25ccd2ade1ccf552226c7b2acf72"
 
 # libdbi-drivers-0.8.3-1/drivers/mysql/dbd_mysql.c:232:5: error: conflicting types for 'dbd_goto_row'
-PNBLACKLIST[libdbi-drivers] ?= "BROKEN: fails to build with gcc-5"
+PNBLACKLIST[libdbi-drivers] ?= "BROKEN: fails to build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
index 1091bb079..5cadf16ce 100644
--- a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
+++ b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f18ebe7e452708c26f83954f81062ba7"
 PR = "r1"
 
 # http://errors.yoctoproject.org/Errors/Details/25823/
-PNBLACKLIST[libetpan] ?= "Not compatible with gnutls version 3.4 currently in oe-core"
+PNBLACKLIST[libetpan] ?= "Not compatible with gnutls version 3.4 currently in oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libetpan/libetpan-${PV}.tar.gz \
            file://libetpan-autoreconf.patch \
diff --git a/meta-oe/recipes-support/ode/ode_0.13.bb b/meta-oe/recipes-support/ode/ode_0.13.bb
index 5d47a6696..c90c81954 100644
--- a/meta-oe/recipes-support/ode/ode_0.13.bb
+++ b/meta-oe/recipes-support/ode/ode_0.13.bb
@@ -27,5 +27,5 @@ PACKAGECONFIG ?= ""
 # series of AC_TRY_RUN which won't work for cross-compilation and configure fails
 PACKAGECONFIG[double-precision] = "--enable-double-precision,--disable-double-precision"
 
-PNBLACKLIST[ode] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130599/"
-PNBLACKLIST[ode] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130620/"
+PNBLACKLIST[ode] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130599/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
+PNBLACKLIST[ode] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130620/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
index c32668b31..d3f2e789b 100644
--- a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
+++ b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
@@ -18,4 +18,4 @@ SRC_URI[sha256sum] = "2b142b1027fb0a62c41347600e01a53fa274dad15445a7da48083c830c
 inherit autotools
 
 # http://errors.yoctoproject.org/Errors/Details/68667/
-PNBLACKLIST[open-vcdiff] ?= "BROKEN: fails to build with gcc-6"
+PNBLACKLIST[open-vcdiff] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
index b8e3a2d20..107184be4 100644
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
@@ -38,4 +38,4 @@ do_install() {
 FILES_${PN}-dev += "${datadir}/opencv/samples/*.c* ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*"
 FILES_${PN} += "${bindir} ${datadir}/opencv"
 
-PNBLACKLIST[opencv-samples] ?= "Depends on blacklisted opencv"
+PNBLACKLIST[opencv-samples] ?= "Depends on blacklisted opencv - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index de2f0529e..d17c640ac 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -103,4 +103,4 @@ do_install_append() {
 }
 
 # http://errors.yoctoproject.org/Errors/Details/40660/
-PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3"
+PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
index 2baeda025..35c39cbe8 100644
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
 
 PR = "r3"
 
-PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S"
+PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "http://motif.ics.com/sites/default/files/openmotif-2.3.3.tar.gz \
            file://configure.patch;patch=1"
diff --git a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
index ebf65c7cc..90650f05f 100644
--- a/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
+++ b/meta-oe/recipes-support/opensync/libsyncml_0.5.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fad9b3332be894bab9bc501572864b29"
 DEPENDS = "libxml2 glib-2.0 libsoup-2.4 openobex wbxml2"
 
 # Depends on openobex
-PNBLACKLIST[libsyncml] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)}"
+PNBLACKLIST[libsyncml] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5 conflicts with bluez4 and bluez5 is selected in DISTRO_FEATURES', '', d)} - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libsyncml/libsyncml-${PV}.tar.gz"
 SRC_URI[md5sum] = "84879ed7cb94618530fbcb801a1a4f95"
diff --git a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
index 542627db5..e9142385b 100644
--- a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
+++ b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
@@ -112,4 +112,4 @@ FILES_${PN}-dev = " \
 "
 
 # http://errors.yoctoproject.org/Errors/Details/68630/
-PNBLACKLIST[openwbem] ?= "BROKEN: fails to build with gcc-6"
+PNBLACKLIST[openwbem] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
index b884b5a0d..47cdc7242 100644
--- a/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
+++ b/meta-oe/recipes-support/pidgin/pidgin-otr_4.0.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=92fe174bad6da3763f6e9e9eaff6df24"
 DEPENDS = "libgcrypt libotr pidgin intltool-native"
 
-PNBLACKLIST[pidgin-otr] ?= "depends on blacklisted pidgin"
+PNBLACKLIST[pidgin-otr] ?= "depends on blacklisted pidgin - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 SRC_URI = "http://www.cypherpunks.ca/otr/${BP}.tar.gz \
            file://ignore_extra-portability_warnings.patch \
diff --git a/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb b/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
index ef01be590..97326a20e 100644
--- a/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
+++ b/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
@@ -13,4 +13,4 @@ SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "4c6e0b22187d7bb1c998ffac89e50f6b"
 SRC_URI[sha256sum] = "9521f328bf28aaaf5c8488dc89792b614f9d6271742c0baf9bb41c97537764a8"
 
-PNBLACKLIST[psqlodbc] ?= "Depends on blacklisted postgresql"
+PNBLACKLIST[psqlodbc] ?= "Depends on blacklisted postgresql - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
index 95ee67d51..0bd7af734 100644
--- a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
+++ b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
@@ -30,4 +30,4 @@ do_install() {
 
 FILES_${PN} += "${systemd_unitdir}/system/${BPN}.service"
 
-PNBLACKLIST[system-setup-keyboard] ?= "Depends on blacklisted system-config-keyboard-native"
+PNBLACKLIST[system-setup-keyboard] ?= "Depends on blacklisted system-config-keyboard-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
index ef0cfaf00..1219cb8ed 100644
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
@@ -8,7 +8,7 @@ PV = "1.3+gitr${SRCPV}"
 PE = "1"
 PR = "r1"
 
-PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory"
+PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory - the recipe will be removed on 2017-09-01 unless the issue is fixed"
 
 inherit autotools perlnative vala
 
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
index 0c08d97f8..c7bae1c08 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
@@ -69,4 +69,4 @@ FILES_${PN} = "${base_sbindir}"
 KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
 
 # http://errors.yoctoproject.org/Errors/Details/83333/
-PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default kernel version 4.8"
+PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default kernel version 4.8 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
index f7d8cfd8a..408c700bb 100644
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
@@ -36,4 +36,4 @@ FILES_${PN}-dbg += "${libdir}/xchat/plugins/.debug"
 SRC_URI[md5sum] = "6775c44f38e84d06c06c336b32c4a452"
 SRC_URI[sha256sum] = "0d6d69437b5e1e45f3e66270fe369344943de8a1190e498fafa5296315a27db0"
 
-PNBLACKLIST[xchat] ?= "Depends on blacklisted libsexy"
+PNBLACKLIST[xchat] ?= "Depends on blacklisted libsexy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
index f2d8f3ce7..df89520b6 100644
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
@@ -30,4 +30,4 @@ RDEPENDS_${PN} = "git"
 
 BBCLASSEXTEND = "native"
 
-PNBLACKLIST[bundler] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130640/"
+PNBLACKLIST[bundler] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130640/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb b/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
index cc5bf0d24..651745fb8 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_2.5.1.bb
@@ -32,4 +32,4 @@ do_install() {
 FILES_${PN} += "${libdir}/php5/extensions/*/*.so"
 FILES_${PN}-dbg += "${libdir}/php5/extensions/*/.debug"
 
-PNBLACKLIST[xdebug] ?= "Depends on blacklisted php"
+PNBLACKLIST[xdebug] ?= "Depends on blacklisted php - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
index bf4b0d8c6..802b5d480 100644
--- a/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
+++ b/meta-xfce/recipes-art/cursor-themes/openzone_1.2.3.bb
@@ -28,4 +28,4 @@ python populate_packages_prepend () {
 PACKAGES_DYNAMIC += "^openzone-.*"
 ALLOW_EMPTY_${PN} = "1"
 
-PNBLACKLIST[openzone] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130682/"
+PNBLACKLIST[openzone] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130682/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.12.2


