Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id C04AB719B1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:17:09 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id 30so18067585wrk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=DE0ByPLJcFBTm1zkmIq1Z8syMBWJHxUaUPcpLk35uKM=;
	b=O9HnFVNPXfqDvD9v7SLVKzgekXWg6WMpem1ZVC+/emCmqmYbtONlb8afbbri3qhk1j
	nvvplJXJxe62Xeuf5Ows3ajKTK9STN0c3/BFsZYhoQIMXVKeaECcBxW+gOR3BDpKkFl4
	AuJj2Mec8PPlEAv51aqnQlnsRh26dlJAe47TUMxyXKNt9vKJRpvWw6gKcUG6dP4YNILp
	rmhX0LhbF85YZU0GJYLXPbgOdj86h8x3YXkDMXsboR313dn9U6IBrM+tNSgQSa7Tcc9u
	TxWc0+LoT7GQ2hVMkKUUG/f1NmbXUzIeLrZg8A5MCN28moP+D1Fjdet2jHR18DqpVoE4
	cimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DE0ByPLJcFBTm1zkmIq1Z8syMBWJHxUaUPcpLk35uKM=;
	b=OtSM9caC++uLaszV++neb/xY1stpbEmytWkWtWsOxe4Shqp5L2owOnw6K4rT/Yvezh
	IffzVJUB7jx2yLkj+II1V23zTyUwbBJwz/pKn5jMbB9cf/FCxwaxfBVHkJSS3kXjDvR+
	HafntN9ZegG1gagQn9t6ZuN96xTlW6iUYCFMtIxQ1DS+vK4BzmFWqq/zFoJ+RnPV5R5n
	IEPEiTgXQ8qRBHSEKWTP0Zgm8tWilJVLxuasr8Nuy8tyXwIDZophuxuTyoDpqp/DrTg9
	yxdh0VstD78d4eOcfG1wuK6IaRV6C73k/BJti+T9XlueDFIikcWhQxiSQSOsToech6EL
	KPsw==
X-Gm-Message-State: AHYfb5gKWZpCNlNIXOyjAUXrs0lFnsLZO0xL7OZ/YlGcNezR+Oh9oghS
	cZCTJWwPHYCFMNFQ
X-Received: by 10.28.214.134 with SMTP id n128mr6407630wmg.16.1503299828600;
	Mon, 21 Aug 2017 00:17:08 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	t135sm7671860wmt.26.2017.08.21.00.17.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Aug 2017 00:17:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Aug 2017 09:18:47 +0200
Message-Id: <20170821071847.12732-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.0
Subject: [meta-oe][PATCH] recipes: remove blacklisted recipes
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
X-List-Received-Date: Mon, 21 Aug 2017 07:17:10 -0000

* as PNBLACKLIST message says, these recipes are blacklisted for long
  time and nobody showed any interest to fix them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-devtools/python/python-edbus_1.7.0.bb  |   8 -
 .../recipes-devtools/python/python-efl_1.15.0.bb   |   6 -
 meta-efl/recipes-devtools/python/python-efl_git.bb |  11 -
 meta-efl/recipes-efl/e17/cpu_svn.bb                |  12 -
 meta-efl/recipes-efl/e17/diskio_svn.bb             |  10 -
 meta-efl/recipes-efl/e17/e-tasks_git.bb            |  34 ---
 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb |  37 ---
 .../e17/e-wm-theme-illume-efenniht_svn.bb          |  39 ---
 meta-efl/recipes-efl/e17/e-wm_0.18.8.bb            |  17 --
 meta-efl/recipes-efl/e17/e-wm_0.19.10.bb           |  21 --
 meta-efl/recipes-efl/e17/e-wm_git.bb               |  16 --
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb        |  18 --
 meta-efl/recipes-efl/e17/elbow_git.bb              |  26 --
 meta-efl/recipes-efl/e17/elfe_git.bb               |  17 --
 meta-efl/recipes-efl/e17/elmdentica_svn.bb         |  23 --
 meta-efl/recipes-efl/e17/emprint_svn.bb            |  14 -
 meta-efl/recipes-efl/e17/enjoy_git.bb              |  50 ----
 meta-efl/recipes-efl/e17/ephoto_svn.bb             |  21 --
 meta-efl/recipes-efl/e17/exalt-client_svn.bb       |  26 --
 meta-efl/recipes-efl/e17/exalt_svn.bb              |  36 ---
 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb |  41 ---
 meta-efl/recipes-efl/e17/exquisite_svn.bb          |  43 ---
 meta-efl/recipes-efl/e17/flame_svn.bb              |  17 --
 meta-efl/recipes-efl/e17/forecasts_svn.bb          |  12 -
 meta-efl/recipes-efl/e17/news_svn.bb               |  14 -
 meta-efl/recipes-efl/e17/places_svn.bb             |  18 --
 meta-efl/recipes-efl/e17/rage_svn.bb               |  15 --
 meta-efl/recipes-efl/e17/rain_svn.bb               |  18 --
 meta-efl/recipes-efl/e17/screenshot_svn.bb         |  16 --
 meta-efl/recipes-efl/e17/terminology_0.9.1.bb      |  10 -
 meta-efl/recipes-efl/e17/uptime_svn.bb             |  12 -
 meta-efl/recipes-efl/efl/azy_svn.bb                |  37 ---
 meta-efl/recipes-efl/efl/edbus_1.7.9.bb            |  16 --
 meta-efl/recipes-efl/efl/efl.inc                   | 290 ---------------------
 ...igure.ac-Don-t-check-for-Xprint-extension.patch |  27 --
 .../efl/efl/0001-evas_3d-Add-Eet.h-includes.patch  |  51 ----
 meta-efl/recipes-efl/efl/efl_1.15.1.bb             |  29 ---
 .../efl/elementary-theme-efenniht_svn.bb           |  44 ----
 meta-efl/recipes-efl/efl/elementary_1.15.1.bb      |  18 --
 .../efl/emotion-generic-players_1.15.0.bb          |  14 -
 meta-efl/recipes-efl/efl/engrave_svn.bb            |  15 --
 meta-efl/recipes-efl/efl/entrance_svn.bb           |  43 ---
 meta-efl/recipes-efl/efl/epdf_svn.bb               |  35 ---
 .../recipes-efl/efl/evas-generic-loaders_1.15.0.bb |  14 -
 meta-efl/recipes-efl/efl/expedite_1.7.9.bb         |  28 --
 meta-efl/recipes-efl/efl/expedite_git.bb           |  31 ---
 meta-efl/recipes-efl/efl/libeflvala_svn.bb         |  23 --
 meta-efl/recipes-efl/efl/libeweather_svn.bb        |  48 ----
 .../packagegroups/packagegroup-efl-sdk.bb          |  19 --
 .../packagegroup-efl-standalone-sdk-target.bb      |  19 --
 .../packagegroups/packagegroup-x11-illume.bb       |  30 ---
 meta-efl/recipes-efl/webkit/webkit-efl.inc         |  69 -----
 ...on.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch |  46 ----
 ...rs.cmake-Add-Wno-error-deprecated-declara.patch |  45 ----
 .../0003-FEBlendNEON.h-fix-missing-semicolon.patch |  35 ---
 ...ld-with-EFL-1.12-https-bugs.webkit.org-sh.patch | 146 -----------
 .../0005-Fix-the-build-with-cmake-3.patch          | 104 --------
 ...sEfl.cmake-Fix-build-with-newer-CMake-3.4.patch |  30 ---
 meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb   |  12 -
 meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb |  19 --
 .../recipes-filesystems/smbnetfs/smbnetfs_git.bb   |  28 --
 .../recipes-utils/dmapi/dmapi_2.2.12.bb            |  33 ---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb    |  26 --
 meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb |  25 --
 .../recipes-apps/gnome-mplayer/gmtk_1.0.5.bb       |  18 --
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |  32 ---
 .../gtk-theme-torturer/gtk-theme-torturer_git.bb   |  25 --
 .../recipes-gnome/gcalctool/gcalctool_5.32.0.bb    |  20 --
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         | 108 --------
 .../gnome-backgrounds/gnome-backgrounds_2.32.0.bb  |  21 --
 .../gnome-control-center_2.32.1.bb                 |  35 ---
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |  28 --
 .../gnome-disk-utility_2.32.0.bb                   |  45 ----
 .../gnome-keyring/gnome-keyring_2.32.1.bb          |  45 ----
 .../gnome-menus/gnome-menus_2.30.5.bb              |  30 ---
 .../gnome-panel/gnome-panel3_3.0.2.bb              |  51 ----
 .../gnome-panel/gnome-panel_2.32.1.bb              |  48 ----
 .../gnome-power-manager_2.32.0.bb                  |  54 ----
 .../gnome-session/gnome-session_2.32.1.bb          |  32 ---
 .../gnome-settings-daemon_2.32.1.bb                |  43 ---
 .../gnome-system-monitor_2.28.2.bb                 |  35 ---
 .../recipes-gnome/gnome/gnome-terminal_2.30.2.bb   |  22 --
 .../recipes-gnome/gnome/libgnomecups_0.2.3.bb      |  25 --
 .../recipes-gnome/gnome/libgnomeprint_2.18.8.bb    |  28 --
 .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |  49 ----
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |  35 ---
 .../recipes-gnome/gweather/libgweather3_3.0.2.bb   |  28 --
 .../recipes-gnome/gweather/libgweather_2.30.3.bb   |  24 --
 .../recipes-gnome/nautilus/nautilus3_3.2.1.bb      |  54 ----
 .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |  43 ---
 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb   |  20 --
 meta-gnome/recipes-gnome/pimlico/contacts_git.bb   |  19 --
 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb     |  16 --
 meta-gnome/recipes-gnome/pimlico/tasks_git.bb      |  12 -
 .../system-tools/system-tools-backends_2.10.2.bb   |  54 ----
 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb   |  21 --
 .../recipes-support/goffice/goffice_0.10.1.bb      |  51 ----
 .../recipes-support/tracker/tracker_0.14.2.bb      |  88 -------
 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb |  24 --
 .../libgpewidget/libgpewidget_0.117.bb             |  25 --
 .../recipes-graphics/minilite/minilite_0.50.bb     |  18 --
 .../recipes-support/fbreader/fbreader_0.12.10.bb   |  46 ----
 meta-gpe/recipes-support/fbreader/fbreader_git.bb  |  45 ----
 .../recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb         | 136 ----------
 .../recipes-dvb/tvheadend/tvheadend_git.bb         |  43 ---
 .../kodi/kodi-addon-pvr-hts_git.bb                 |  57 ----
 .../recipes-mediacenter/kodi/kodi-platform_git.bb  |  39 ---
 .../recipes-mediacenter/kodi/kodi-startup.bb       |  24 --
 .../recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb       |  57 ----
 .../coriander/coriander_2.0.2.bb                   |  17 --
 .../gstreamer-0.10/gst-ffmpeg_0.10.13.bb           | 103 --------
 .../recipes-multimedia/gstreamer/gst123_0.3.1.bb   |  17 --
 .../recipes-daemons/dnrd/dnrd_2.20.3.bb            |  41 ---
 .../recipes-kernel/netmap/netmap-modules_git.bb    |  92 -------
 .../recipes-kernel/netmap/netmap_git.bb            |  37 ---
 .../recipes-protocols/accel-ppp/accel-ppp_git.bb   |  45 ----
 .../recipes-support/nis/ypbind-mt_2.2.bb           |  53 ----
 meta-oe/recipes-benchmark/pmbw/pmbw_git.bb         |  30 ---
 .../recipes-connectivity/gnokii/gnokii_0.6.31.bb   |  36 ---
 meta-oe/recipes-connectivity/soft66/soft66_git.bb  |  20 --
 .../telepathy/libtelepathy_0.3.3.bb                |  26 --
 .../telepathy/telepathy-mission-control_5.16.1.bb  |  53 ----
 .../zeroc-ice/zeroc-ice_3.5.1.bb                   |  87 -------
 .../fakeroot/fakeroot-native_1.18.4.bb             |  15 --
 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb   |  30 ---
 .../packagegroups/packagegroup-cli-tools.bb        |  49 ----
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb      | 118 ---------
 meta-oe/recipes-devtools/dt/dt_18.32.bb            |  49 ----
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb  |  97 -------
 .../packagekit/packagekit_0.5.6.bb                 |  65 -----
 .../vala-dbus-binding-tool_0.4.0.bb                |   6 -
 .../vala-dbus-binding-tool_git.bb                  |  20 --
 .../openlmi/openlmi-networking_0.3.1.bb            |  32 ---
 .../openlmi/openlmi-providers_0.6.0.bb             |  56 ----
 .../openlmi/openlmi-storage_0.8.1.bb               |  34 ---
 .../recipes-extended/subsurface/subsurface_git.bb  |  21 --
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb   |  19 --
 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb     |  41 ---
 .../recipes-graphics/clutter/clutter-box2d_git.bb  |  19 --
 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb        |  52 ----
 meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb |   8 -
 meta-oe/recipes-graphics/slim/slim_1.3.2.bb        |  82 ------
 .../terminus-font/terminus-font_4.38.bb            |  47 ----
 .../recipes-graphics/wayland/wayland-fits_git.bb   |  35 ---
 .../xorg-driver/xf86-input-mtev_git.bb             |  22 --
 .../xorg-driver/xf86-video-geode_2.11.16.bb        |  16 --
 .../xorg-driver/xf86-video-glamo_git.bb            |  25 --
 .../xorg-font/xorg-fonts-100dpi.bb                 |  24 --
 meta-oe/recipes-kernel/ktap/ktap-module_git.bb     |  22 --
 meta-oe/recipes-kernel/ktap/ktap_git.bb            |  19 --
 .../recipes-multimedia/minidlna/minidlna_1.1.5.bb  |   6 -
 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 159 -----------
 meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb     | 114 --------
 .../recipes-sato/claws-mail/claws-mail_3.9.0.bb    |  56 ----
 .../claws-plugin-gtkhtml2-viewer_0.31.bb           |  24 --
 .../claws-mail/claws-plugin-mailmbox_1.15.bb       |  20 --
 .../claws-mail/claws-plugin-rssyl_0.34.bb          |  20 --
 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb  |  33 ---
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb |  42 ---
 meta-oe/recipes-support/emacs/emacs_23.4.bb        |  12 -
 .../recipes-support/farsight/farsight2_0.0.22.bb   |  34 ---
 meta-oe/recipes-support/fftw/benchfft_3.1.bb       |  21 --
 meta-oe/recipes-support/flite/flite-alsa_1.3.bb    |  21 --
 meta-oe/recipes-support/iksemel/iksemel_1.4.bb     |  19 --
 .../libdbi/libdbi-drivers_0.8.3-1.bb               |   8 -
 meta-oe/recipes-support/libetpan/libetpan_0.57.bb  |  30 ---
 meta-oe/recipes-support/ode/ode_0.13.bb            |  31 ---
 .../open-vcdiff/open-vcdiff_0.8.4.bb               |  21 --
 .../recipes-support/opencv/opencv-samples_2.4.bb   |  41 ---
 meta-oe/recipes-support/opencv/opencv_2.4.bb       | 106 --------
 .../recipes-support/openmotif/openmotif_2.3.3.bb   |  48 ----
 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb | 115 --------
 .../psqlodbc/psqlodbc_09.05.0300.bb                |  16 --
 .../system-setup-keyboard_0.8.8.bb                 |  33 ---
 .../vala-terminal/vala-terminal_git.bb             |  20 --
 .../vboxguestdrivers/vboxguestdrivers_4.3.36.bb    |  72 -----
 meta-oe/recipes-support/xchat/xchat_2.8.8.bb       |  39 ---
 meta-ruby/recipes-devtools/ruby/bundler_git.bb     |  33 ---
 178 files changed, 6754 deletions(-)
 delete mode 100644 meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
 delete mode 100644 meta-efl/recipes-devtools/python/python-efl_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/cpu_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/diskio_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/e-tasks_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
 delete mode 100644 meta-efl/recipes-efl/e17/e-wm_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/edje-viewer_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/elbow_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/elfe_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/elmdentica_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/emprint_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/enjoy_git.bb
 delete mode 100644 meta-efl/recipes-efl/e17/ephoto_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/exalt-client_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/exalt_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
 delete mode 100644 meta-efl/recipes-efl/e17/exquisite_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/flame_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/forecasts_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/news_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/places_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/rage_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/rain_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/screenshot_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/terminology_0.9.1.bb
 delete mode 100644 meta-efl/recipes-efl/e17/uptime_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/azy_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efl.inc
 delete mode 100644 meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
 delete mode 100644 meta-efl/recipes-efl/efl/efl/0001-evas_3d-Add-Eet.h-includes.patch
 delete mode 100644 meta-efl/recipes-efl/efl/efl_1.15.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/elementary_1.15.1.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/engrave_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/entrance_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/epdf_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/expedite_git.bb
 delete mode 100644 meta-efl/recipes-efl/efl/libeflvala_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/libeweather_svn.bb
 delete mode 100644 meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
 delete mode 100644 meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
 delete mode 100644 meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl.inc
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0001-OptionsCommon.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0002-WebKitHelpers.cmake-Add-Wno-error-deprecated-declara.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0003-FEBlendNEON.h-fix-missing-semicolon.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0004-Fix-the-build-with-EFL-1.12-https-bugs.webkit.org-sh.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0005-Fix-the-build-with-cmake-3.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl/0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch
 delete mode 100644 meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
 delete mode 100644 meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
 delete mode 100644 meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
 delete mode 100644 meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
 delete mode 100644 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
 delete mode 100644 meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
 delete mode 100644 meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
 delete mode 100644 meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
 delete mode 100644 meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
 delete mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
 delete mode 100644 meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/contacts_git.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
 delete mode 100644 meta-gnome/recipes-gnome/pimlico/tasks_git.bb
 delete mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
 delete mode 100644 meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
 delete mode 100644 meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
 delete mode 100644 meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
 delete mode 100644 meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
 delete mode 100644 meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
 delete mode 100644 meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
 delete mode 100644 meta-gpe/recipes-support/fbreader/fbreader_git.bb
 delete mode 100644 meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
 delete mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
 delete mode 100644 meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
 delete mode 100644 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
 delete mode 100755 meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
 delete mode 100644 meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
 delete mode 100644 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
 delete mode 100644 meta-networking/recipes-kernel/netmap/netmap_git.bb
 delete mode 100644 meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
 delete mode 100644 meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
 delete mode 100644 meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
 delete mode 100644 meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
 delete mode 100644 meta-oe/recipes-connectivity/soft66/soft66_git.bb
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
 delete mode 100644 meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
 delete mode 100644 meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
 delete mode 100644 meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
 delete mode 100644 meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
 delete mode 100644 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
 delete mode 100644 meta-oe/recipes-devtools/dt/dt_18.32.bb
 delete mode 100644 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
 delete mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
 delete mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
 delete mode 100644 meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
 delete mode 100644 meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
 delete mode 100644 meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
 delete mode 100644 meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
 delete mode 100644 meta-oe/recipes-extended/subsurface/subsurface_git.bb
 delete mode 100644 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
 delete mode 100644 meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
 delete mode 100644 meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
 delete mode 100644 meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
 delete mode 100644 meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
 delete mode 100644 meta-oe/recipes-graphics/slim/slim_1.3.2.bb
 delete mode 100644 meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
 delete mode 100755 meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
 delete mode 100644 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
 delete mode 100644 meta-oe/recipes-kernel/ktap/ktap-module_git.bb
 delete mode 100644 meta-oe/recipes-kernel/ktap/ktap_git.bb
 delete mode 100644 meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
 delete mode 100644 meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
 delete mode 100644 meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
 delete mode 100644 meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
 delete mode 100644 meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
 delete mode 100644 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
 delete mode 100644 meta-oe/recipes-support/emacs/emacs_23.4.bb
 delete mode 100644 meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
 delete mode 100644 meta-oe/recipes-support/fftw/benchfft_3.1.bb
 delete mode 100644 meta-oe/recipes-support/flite/flite-alsa_1.3.bb
 delete mode 100644 meta-oe/recipes-support/iksemel/iksemel_1.4.bb
 delete mode 100644 meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
 delete mode 100644 meta-oe/recipes-support/libetpan/libetpan_0.57.bb
 delete mode 100644 meta-oe/recipes-support/ode/ode_0.13.bb
 delete mode 100644 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
 delete mode 100644 meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
 delete mode 100644 meta-oe/recipes-support/opencv/opencv_2.4.bb
 delete mode 100644 meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
 delete mode 100644 meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
 delete mode 100644 meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
 delete mode 100644 meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
 delete mode 100644 meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
 delete mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
 delete mode 100644 meta-oe/recipes-support/xchat/xchat_2.8.8.bb
 delete mode 100644 meta-ruby/recipes-devtools/ruby/bundler_git.bb

diff --git a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb b/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
deleted file mode 100644
index bfacf897f..000000000
--- a/meta-efl/recipes-devtools/python/python-edbus_1.7.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${BPN}.inc
-
-PR = "r1"
-
-SRC_URI[md5sum] = "40b479444bb06147429a276127981890"
-SRC_URI[sha256sum] = "78e5ca334ee25185748660b4e612f984f4d3bced018f062278701429868f117b"
-
-PNBLACKLIST[python-edbus] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130600/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb b/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
deleted file mode 100644
index e9a79b252..000000000
--- a/meta-efl/recipes-devtools/python/python-efl_1.15.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[md5sum] = "f7c5d557336ea9df69bcca09c420711a"
-SRC_URI[sha256sum] = "11e607b465cb66dafe05c66e02d61e09335b370fe9fd2a74d88282b3ee597bcc"
-
-PNBLACKLIST[python-efl] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-devtools/python/python-efl_git.bb b/meta-efl/recipes-devtools/python/python-efl_git.bb
deleted file mode 100644
index 292b9eb87..000000000
--- a/meta-efl/recipes-devtools/python/python-efl_git.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "71ed20ebf662a7b72e60913df94ce6933236bf09"
-PV = "1.12.0+git${SRCPV}"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://git.enlightenment.org/bindings/python/${BPN}.git;branch=python-efl-1.12"
-
-S = "${WORKDIR}/git"
-
-PNBLACKLIST[python-efl] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/cpu_svn.bb b/meta-efl/recipes-efl/e17/cpu_svn.bb
deleted file mode 100644
index 3ffb9889f..000000000
--- a/meta-efl/recipes-efl/e17/cpu_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
-                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
-
-PV = "0.0.1+svnr${SRCREV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-SRC_URI += "file://configure.patch"
-
-PNBLACKLIST[cpu] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/diskio_svn.bb b/meta-efl/recipes-efl/e17/diskio_svn.bb
deleted file mode 100644
index 4f778d6e1..000000000
--- a/meta-efl/recipes-efl/e17/diskio_svn.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
-                    file://COPYING-PLAIN;md5=68be76d8126face2fbbecdf1bcbe2b10"
-
-PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-PNBLACKLIST[diskio] ?= "broken: switch to https://git.enlightenment.org/enlightenment/modules/diskio.git/ and fix 0.0.1+svnr82070-r0.0/E-MODULES-EXTRA/diskio/e-module-diskio.edc:58. invalid state name: 'off'. "default" state must always be first. - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-require e-module.inc
diff --git a/meta-efl/recipes-efl/e17/e-tasks_git.bb b/meta-efl/recipes-efl/e17/e-tasks_git.bb
deleted file mode 100644
index 7eab6d0f0..000000000
--- a/meta-efl/recipes-efl/e17/e-tasks_git.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "e-tasks is a todo program for Openmoko phones"
-HOMEPAGE = "http://code.google.com/p/e-tasks/"
-AUTHOR = "cchandel"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-SECTION = "e/apps"
-DEPENDS = "elementary eina eldbus sqlite3"
-
-inherit autotools
-
-SRCREV = "890f5ee37d1a5fd1ceb2495950d15151d4cf756b"
-PV = "0.0.2+gitr${SRCPV}"
-
-SRC_URI = "git://github.com/shr-project/e-tasks.git"
-SRC_URI += "file://0001-dbus-stuff-Convert-to-eldbus.patch"
-
-S = "${WORKDIR}/git"
-
-do_install_append() {
-    install -d "${D}/${datadir}/pixmaps"
-    install -m 0644 "${S}/resources/e-tasks.png" "${D}/${datadir}/pixmaps"
-    install -d "${D}/${datadir}/applications"
-    install -m 0644 "${S}/resources/e-tasks.desktop" "${D}/${datadir}/applications"
-    install -d  "${D}/${datadir}/e-tasks"
-    for ico in "${S}/resources/"*.png; do
-        if [ "$(basename $ico)" != "e-tasks.png" ]; then
-            install -m 0644 $ico "${D}/${datadir}/e-tasks"
-        fi
-    done
-}
-
-FILES_${PN} += "/usr/share/e-tasks/* /usr/share/applications/* /usr/share/pixmaps/*"
-
-PNBLACKLIST[e-tasks] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
deleted file mode 100644
index 9e6e9f24e..000000000
--- a/meta-efl/recipes-efl/e17/e-wm-theme-b-and-w_svn.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "b-and-w theme was default E17 theme before alpha3 and some people still prefers it."
-SECTION = "e/utils"
-DEPENDS = "edje-native"
-RDEPENDS_${PN} = "e-wm"
-LICENSE = "MIT & BSD"
-# upstream was asked to include license infor in THEME dir
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
-
-inherit allarch
-
-SRCREV = "${EFL_SRCREV}"
-PV = "0.0+svnr${SRCPV}"
-
-inherit e-base
-
-SRCNAME = "b_and_w"
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http"
-S = "${WORKDIR}/${SRCNAME}/e"
-
-do_compile() {
-    # unfortunately hardcoded edje_cc in Makefile
-    sed -i "s#\tedje_cc#\t${STAGING_BINDIR_NATIVE}/edje_cc#g" Makefile
-    make
-}
-
-do_install() {
-    install -d ${D}${datadir}/enlightenment/data/themes/
-    install -m 0644 ${S}/b_and_w.edj ${D}${datadir}/enlightenment/data/themes/
-}
-
-FILES_${PN} = "${datadir}/enlightenment/data/themes/"
-
-PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm-theme-b-and-w - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[e-wm-theme-b-and-w] ?= "Runtime depends on blacklisted e-wm-theme-b-and-w-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb b/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
deleted file mode 100644
index 521213475..000000000
--- a/meta-efl/recipes-efl/e17/e-wm-theme-illume-efenniht_svn.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-DESCRIPTION = "efenniht illume theme - Efenniht was devised to be clean \
-and neutral. Its name (which means equinox) comes from the chromatic duality \
-that was decided at the very beginning, with a dark theme (black and orange) \
-and a bright one (white and blue) to be developed so that more people feel \
-comfortable using it. Efenniht uses few animations, discrete contrasts between \
-shades of gray and fine lines (colored) that outline the selected elements."
-SECTION = "e/utils"
-HOMEPAGE = "http://trac.enlightenment.org/e/wiki/Themes#Efenniht"
-DEPENDS = "edje-native"
-RDEPENDS_${PN} = "e-wm"
-RSUGGESTS_${PN} = "elementary-theme-efenniht"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
-
-SRCREV = "${EFL_SRCREV}"
-PV = "0.0+svnr${SRCPV}"
-
-inherit e-base allarch
-
-SRCNAME = "efenniht"
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http \
-           file://LICENSE \
-"
-S = "${WORKDIR}/${SRCNAME}"
-
-do_compile() {
-    ${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/images ${S}/efenniht.edc -o ${S}/efenniht.edj
-}
-
-do_install() {
-    install -d ${D}${datadir}/enlightenment/data/themes/
-    install -m 0644 ${S}/efenniht.edj ${D}${datadir}/enlightenment/data/themes/
-}
-
-FILES_${PN} = "${datadir}/enlightenment/data/themes/"
-
-PNBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[e-wm-theme-illume-efenniht] ?= "Runtime depends on blacklisted e-wm-theme-illume-efenniht - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb b/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
deleted file mode 100644
index ac18b59bb..000000000
--- a/meta-efl/recipes-efl/e17/e-wm_0.18.8.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require ${BPN}.inc
-
-SRCNAME = "enlightenment"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-SRC_URI = "\
-    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://enlightenment_start.oe \
-    file://applications.menu \
-    file://0001-Fix-incorrect-message-type.patch \
-"
-
-SRC_URI[md5sum] = "79c9f524e1d0510061c62c4b038a8ece"
-SRC_URI[sha256sum] = "14c9bde4334d2f8b0776c6113d02b923ab159eea1cbf7013489e4f3bf37a51bb"
-
-PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb b/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
deleted file mode 100644
index aa6a7b8d7..000000000
--- a/meta-efl/recipes-efl/e17/e-wm_0.19.10.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require ${BPN}.inc
-
-SRCNAME = "enlightenment"
-
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-# couple of modules needed for illume2 (mobile) profile were removed in
-# http://git.enlightenment.org/core/enlightenment.git/commit/src/modules/Makefile.mk?id=1be76d599ca27f820b58b8186c5f73d9844c67ca
-# and replacements aren't included yet, if you want to use e-wm on device with small screen, better stay with 0.18 release
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "\
-    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://enlightenment_start.oe \
-    file://applications.menu \
-"
-
-SRC_URI[md5sum] = "9063617760329445ada8635270a4e627"
-SRC_URI[sha256sum] = "484d305bcf403303b18c46a3a498445b93689cd325010ae8d0601551926469d8"
-
-PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/e-wm_git.bb b/meta-efl/recipes-efl/e17/e-wm_git.bb
deleted file mode 100644
index 0f25fd592..000000000
--- a/meta-efl/recipes-efl/e17/e-wm_git.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require ${BPN}.inc
-
-PV = "0.19.4+git${SRCPV}"
-DEFAULT_PREFERENCE = "-2"
-
-SRC_URI = " \
-    git://git.enlightenment.org/core/enlightenment.git;branch=enlightenment-0.19 \
-    file://0001-configure.ac-add-foreign.patch \
-    file://enlightenment_start.oe \
-    file://applications.menu \
-"
-S = "${WORKDIR}/git"
-
-SRCREV = "4545d4a70031e0b2565b8d83d5f756bff1a584d0"
-
-PNBLACKLIST[e-wm] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb b/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
deleted file mode 100644
index 6d3efda51..000000000
--- a/meta-efl/recipes-efl/e17/edje-viewer_svn.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Edje_Viewer is just that"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
-                    file://COPYING-PLAIN;md5=e01359041001e8bf24c09acca556e792"
-
-DEPENDS = "elementary"
-PV = "0.0.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-
-SRCNAME = "edje_viewer"
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-FILES_${PN} += "${datadir}"
-
-PNBLACKLIST[edje-viewer] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/elbow_git.bb b/meta-efl/recipes-efl/e17/elbow_git.bb
deleted file mode 100644
index d2a853989..000000000
--- a/meta-efl/recipes-efl/e17/elbow_git.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "EFL based browser"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje eina elementary webkit-efl sqlite3"
-
-PV = "0.0.1+gitr${SRCPV}"
-SRCREV = "b41fd0bc9514ff61bb2a50d957efe4155fa3e6a8"
-
-# webkit-efl isn't available for < armv7a
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_x86 = "(.*)"
-COMPATIBLE_MACHINE_x86-64 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-inherit e gettext cmake
-
-EXTRA_OECMAKE = "-DDATA_INSTALL_DIR=${datadir}"
-
-SRC_URI = " \
-    git://github.com/bunhere/elbow.git;protocol=https \
-"
-S = "${WORKDIR}/git"
-
-FILES_${PN} += "${datadir}/themes"
-
-PNBLACKLIST[elbow] ?= "Depends on blacklisted webkit-efl - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/elfe_git.bb b/meta-efl/recipes-efl/e17/elfe_git.bb
deleted file mode 100644
index e9f7f9e89..000000000
--- a/meta-efl/recipes-efl/e17/elfe_git.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-PV = "0.0.1+gitr${SRCPV}"
-PE = "1"
-
-require e-module.inc
-
-SRC_URI = " \
-    git://git.enlightenment.org/enlightenment/modules/${BPN}.git \
-"
-S = "${WORKDIR}/git"
-
-SRCREV = "1ec0e7713c3ca901014811ff78277d9e2aaac981"
-
-DEPENDS += "elementary"
-
-PNBLACKLIST[elfe] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/elmdentica_svn.bb b/meta-efl/recipes-efl/e17/elmdentica_svn.bb
deleted file mode 100644
index b17121721..000000000
--- a/meta-efl/recipes-efl/e17/elmdentica_svn.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "A indenti.ca client for E"
-DEPENDS = "glib-2.0 gconf curl elementary sqlite3-native azy"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SECTION = "e/apps"
-HOMEPAGE = "http://elmdentica.googlecode.com"
-AUTHOR = "seabra"
-
-inherit e gettext
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
-
-PV = "0.9.9+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-RDEPENDS_${PN} = "${PN}-themes"
-
-SRC_URI += "file://configure.patch"
-
-PNBLACKLIST[elmdentica] ?= "OLD and depends on broken azy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/emprint_svn.bb b/meta-efl/recipes-efl/e17/emprint_svn.bb
deleted file mode 100644
index 115dc7cf5..000000000
--- a/meta-efl/recipes-efl/e17/emprint_svn.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-DESCRIPTION = "Emprint is a utility for taking screenshots of the entire screen, a specific window, or a specific region."
-LICENSE = "MIT & BSD"
-DEPENDS = "imlib2 virtual/libx11 ecore evas edje eina"
-PV = "0.0.1+svnr${SRCPV}"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-FILES_${PN}-dbg += "${libdir}/${PN}/modules/.debug"
-
-PNBLACKLIST[emprint] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/apps/emprint.git/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/enjoy_git.bb b/meta-efl/recipes-efl/e17/enjoy_git.bb
deleted file mode 100644
index 716d73ed1..000000000
--- a/meta-efl/recipes-efl/e17/enjoy_git.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "Enjoy music player"
-LICENSE = "LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
-DEPENDS = "evas ecore edje elementary emotion lightmediascanner eldbus gst-plugins-good"
-
-SRCREV = "aa8fec69e885eec048a849c2b34059ec58404e02"
-PV = "0.1.0+gitr${SRCPV}"
-
-#1st needed for all formats
-#2nd needed for mp3 playback
-#3d needed for ogg playback
-#4th needed for flac playback
-#5th needed binary to create db
-RDEPENDS_${PN} += "\
-       gst-plugins-base-typefindfunctions gst-plugins-base-playbin gst-plugins-base-volume gst-plugins-base-decodebin2 gst-plugins-good-autodetect \
-       gst-plugins-base-ogg gst-plugins-base-ivorbisdec \
-       gst-plugins-good-flac \
-       lightmediascanner-test \
-"
-
-inherit e gettext
-SRC_URI = " \
-    git://git.enlightenment.org/apps/enjoy.git \
-    file://0001-always-use-position-as-percent-and-define-a-1-second.patch \
-    file://configure.patch \
-"
-S = "${WORKDIR}/git"
-
-FILES_${PN} += "${datadir}/icons/"
-
-EXTRA_OECONF = "\
-    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-"
-
-PACKAGECONFIG[mad] = ",,gst-plugins-ugly,gst-plugins-ugly-mad"
-PACKAGECONFIG[id3demux] = ",,,gst-plugins-good-id3demux"
-
-do_configure_prepend() {
-    autopoint || touch config.rpath
-}
-
-pkg_postinst_${PN} () {
-    echo "enjoy:    SCAN and LIBRARY MANAGER are not implemeted yet!"
-    echo "enjoy:    Meanwhile please run:"
-    echo "enjoy:    test-lms -m mono -p id3 -i 5000 -s /path/to/your/music/dir /home/root/.config/enjoy/media.db"
-    echo "enjoy:"
-    echo "enjoy:    Use test-lms -P to see available formats that can be scanned"
-}
-
-PNBLACKLIST[enjoy] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/ephoto_svn.bb b/meta-efl/recipes-efl/e17/ephoto_svn.bb
deleted file mode 100644
index f86ffe16f..000000000
--- a/meta-efl/recipes-efl/e17/ephoto_svn.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-LICENSE = "MIT & GPL-3.0"
-PV = "0.1.0+svnr${SRCREV}"
-PR = "${INC_PR}.0"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=fdffcddb366d0cc78e0e46c4ea70c8d9 \
-                    file://COPYING.icons;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-
-require e-module.inc
-
-inherit gettext
-
-DEPENDS += "elementary ethumb ecore eio"
-
-SRCNAME = "${PN}"
-
-# autotools-brokensep
-B = "${S}"
-
-SRC_URI += "file://configure.patch"
-
-PNBLACKLIST[ephoto] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/exalt-client_svn.bb b/meta-efl/recipes-efl/e17/exalt-client_svn.bb
deleted file mode 100644
index cb78a2e3a..000000000
--- a/meta-efl/recipes-efl/e17/exalt-client_svn.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-LICENSE = "LGPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-
-PV = "0.0.1+svnr${SRCPV}"
-
-require e-module.inc
-
-DEPENDS += "elementary exalt edje-native"
-
-CFLAGS += " -I${STAGING_INCDIR}/exalt -I${STAGING_INCDIR}/exalt_dbus"
-
-do_configure_prepend() {
-    sed -i -e /po/d ${S}/configure.ac
-    sed -i -e s:\ po::g ${S}/Makefile.am
-}
-
-FILES_${PN} += "${libdir}/enlightenment/modules/*/*.desktop \
-                ${libdir}/enlightenment/modules/*/*.edj \
-                ${libdir}/enlightenment/modules/*/*/*.so"
-
-FILES_${PN}-staticdev += "${libdir}/enlightenment/modules/*/*/*.a"
-FILES_${PN}-dev += "${libdir}/enlightenment/modules/*/*/*.la"
-FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug"
-
-SRC_URI += "file://configure.patch"
-PNBLACKLIST[exalt-client] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/exalt_svn.bb b/meta-efl/recipes-efl/e17/exalt_svn.bb
deleted file mode 100644
index 9e63f1bc2..000000000
--- a/meta-efl/recipes-efl/e17/exalt_svn.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Exalt is a network manager for the windows manager Enlightenment DR17"
-HOMEPAGE = "http://watchwolf.fr/wiki/doku.php?id=exalt"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-
-DEPENDS = "elementary vpnc wpa-supplicant ecore eet edbus"
-RDEPENDS_${PN} = "vpnc wpa-supplicant"
-
-PV = "0.9+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = " \
---with-wpa_supplicant=${sbindir}/wpa_supplicant \
---with-vpnc=${sbindir}/vpnc \
---with-vpnc-disconnect=${sbindir}/vpnc-disconnect \
-"
-
-do_install_append() {
-    # install dbus config file
-    install -d ${D}${sysconfdir}/dbus-1/system.d/
-    install -m 0644 ${S}/data/daemon/dbus/exalt.conf ${D}${sysconfdir}/dbus-1/system.d/exalt.conf
-
-    # install dbus service file
-    install -d ${D}${datadir}/dbus-1/system-services/
-    install -m 0644 ${B}/org.e.Exalt.service ${D}${datadir}/dbus-1/system-services/
-}
-
-FILES_${PN} += "${datadir}/dbus-1"
-
-
-PNBLACKLIST[exalt] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb b/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
deleted file mode 100644
index c9063bc44..000000000
--- a/meta-efl/recipes-efl/e17/exquisite-theme-illume.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-DDESCRIPTION = "A theme for exquisite"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
-SECTION = "x11"
-DEPENDS = "edje-native"
-PV = "1.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e-base update-alternatives allarch
-
-ALTERNATIVE_NAME = "exquisite-config"
-ALTERNATIVE_LINK = "${sysconfdir}/exquisite/config"
-ALTERNATIVE_PATH = "${sysconfdir}/exquisite/config-illume"
-ALTERNATIVE_PRIORITY = "10"
-
-SRCNAME = "b_and_w"
-
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http \
-           file://LICENSE \
-"
-S = "${WORKDIR}/${SRCNAME}"
-
-do_compile() {
-    ${STAGING_BINDIR_NATIVE}/edje_cc exquisite.edc illume.edj
-}
-
-do_install() {
-    install -d ${D}${sysconfdir}/exquisite
-    install -d ${D}${datadir}/exquisite/data/themes
-    install -m 0644 ${S}/illume.edj ${D}${datadir}/exquisite/data/themes/
-    echo 'THEME="-t illume"' > ${D}${sysconfdir}/exquisite/config-illume
-}
-
-CONFFILES_${PN} = "${sysconfdir}/exquisite/config-illume"
-FILES_${PN} = "${sysconfdir}/exquisite ${datadir}/exquisite/data/themes"
-
-PNBLACKLIST[exquisite-theme-illume] ?= "Depends on blacklisted edje-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[exquisite-theme-illume] ?= "Runtime depends on blacklisted exquisite-theme-illume - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[exquisite-theme-illume] ?= "Runtime depends on blacklisted exquisite-theme-illume-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/exquisite_svn.bb b/meta-efl/recipes-efl/e17/exquisite_svn.bb
deleted file mode 100644
index 826cd444e..000000000
--- a/meta-efl/recipes-efl/e17/exquisite_svn.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "A psplash replacement for display"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=14defa372a91118e755133bc8e6aff83"
-DEPENDS = "eet evas ecore embryo edje"
-PV = "0.0.1+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-RRECOMMENDS_${PN} = "exquisite-themes"
-RCONFLICTS_${PN} = "psplash virtual-psplash"
-
-SRCNAME = "exquisite"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
-
-SRC_URI += "file://exquisite-init"
-SRC_URI += "file://splashfuncs"
-
-inherit update-rc.d
-
-do_install_prepend() {
-    install -d ${D}/mnt/.splash/
-    install -d ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/exquisite-init ${D}${sysconfdir}/init.d/exquisite
-    install -d ${D}${sysconfdir}/default
-    install -m 0755 ${WORKDIR}/splashfuncs ${D}${sysconfdir}/default/splashfuncs
-    install -d ${D}${bindir}
-    ln -s exquisite-write ${D}${bindir}/splash-write
-}
-
-
-do_install_append() {
-    rm -rf ${D}${datadir}/exquisite/data/fonts/*
-}
-
-INITSCRIPT_NAME = "exquisite"
-INITSCRIPT_PARAMS = "start 01 S . stop 20 0 1 6 ."
-
-FILES_${PN} += "/mnt/.splash/"
-
-PNBLACKLIST[exquisite] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130619/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/flame_svn.bb b/meta-efl/recipes-efl/e17/flame_svn.bb
deleted file mode 100644
index 6583d2724..000000000
--- a/meta-efl/recipes-efl/e17/flame_svn.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
-                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
-
-PV = "0.0.3+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-do_configure_prepend() {
-    sed -i -e /po/d ${S}/configure.ac
-    sed -i -e s:\ po::g ${S}/Makefile.am
-}
-
-SRC_URI += "file://configure.patch"
-
-PNBLACKLIST[flame] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/forecasts_svn.bb b/meta-efl/recipes-efl/e17/forecasts_svn.bb
deleted file mode 100644
index 495f314fc..000000000
--- a/meta-efl/recipes-efl/e17/forecasts_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
-                    file://COPYING-PLAIN;md5=51328cfb73bfec3eed7cfd3dbed73988"
-
-PV = "0.2.0+svnr${SRCREV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-SRC_URI += "file://configure.patch"
-
-PNBLACKLIST[forecasts] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/news_svn.bb b/meta-efl/recipes-efl/e17/news_svn.bb
deleted file mode 100644
index 4349e0445..000000000
--- a/meta-efl/recipes-efl/e17/news_svn.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-PV = "0.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-do_configure_prepend() {
-    sed -i -e /po/d configure.ac
-    sed -i -e s:\ po::g Makefile.am
-}
-
-PNBLACKLIST[news] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from http://git.enlightenment.org/enlightenment/modules/news.git/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/places_svn.bb b/meta-efl/recipes-efl/e17/places_svn.bb
deleted file mode 100644
index b184f84c3..000000000
--- a/meta-efl/recipes-efl/e17/places_svn.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-
-PV = "0.1.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-do_configure_prepend() {
-    autopoint || touch config.rpath
-}
-
-# Calls /usr/bin/eject for media
-RRECOMMENDS_${PN} += "eject"
-
-SRC_URI += "file://configure.patch"
-
-PNBLACKLIST[places] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/rage_svn.bb b/meta-efl/recipes-efl/e17/rage_svn.bb
deleted file mode 100644
index 0a90fe3cd..000000000
--- a/meta-efl/recipes-efl/e17/rage_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Rage is a media center application based on EFL"
-AUTHOR = "Carsten 'The Rasterman' Haitzler"
-HOMEPAGE = "http://www.rasterman.com"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-DEPENDS = "emotion evas ecore edje"
-SECTION = "x11/multimedia"
-PV = "0.3.0.042+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit e
-SRC_URI = "${E_SVN}/trunk;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-PNBLACKLIST[rage] ?= "if you want to use these modules with E18, then you need to update it to git recipe fetching newer sources from  http://git.enlightenment.org/apps/rage.git/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/rain_svn.bb b/meta-efl/recipes-efl/e17/rain_svn.bb
deleted file mode 100644
index 14aa2ed38..000000000
--- a/meta-efl/recipes-efl/e17/rain_svn.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-LICENSE = "MIT"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
-                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
-
-PV = "0.0.3+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-do_configure_prepend() {
-    sed -i -e /po/d ${S}/configure.ac
-    sed -i -e s:\ po::g ${S}/Makefile.am
-}
-
-SRC_URI += "file://configure.patch"
-
-PNBLACKLIST[rain] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/screenshot_svn.bb b/meta-efl/recipes-efl/e17/screenshot_svn.bb
deleted file mode 100644
index 233f7777f..000000000
--- a/meta-efl/recipes-efl/e17/screenshot_svn.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-LICENSE = "MIT"
-PV = "0.3.0+svnr${SRCREV}"
-PR = "${INC_PR}.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35"
-SRC_URI += "file://screenshot-fix-mkinstalldirs.patch"
-
-require e-module.inc
-
-DEPENDS += "emprint"
-RDEPENDS_${PN} += "emprint"
-
-do_configure_prepend() {
-    sed -i -e 's:AC_MSG_ERROR(emprint not found):echo foo:g' ${S}/configure.ac
-}
-
-PNBLACKLIST[screenshot] ?= "depends on blacklisted emprint - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/terminology_0.9.1.bb b/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
deleted file mode 100644
index 77dd223fd..000000000
--- a/meta-efl/recipes-efl/e17/terminology_0.9.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/apps/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "c7ce2e8ebc5f311d3d3f59ecfdf18f61"
-SRC_URI[sha256sum] = "7fb864a14202490e9181c5f254a7e772019216a3aa75c3952d0f12cd32113896"
-
-PNBLACKLIST[terminology] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/e17/uptime_svn.bb b/meta-efl/recipes-efl/e17/uptime_svn.bb
deleted file mode 100644
index 60d48a2ca..000000000
--- a/meta-efl/recipes-efl/e17/uptime_svn.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=344895f253c32f38e182dcaf30fe8a35 \
-                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
-
-PV = "0.0.2+svnr${SRCREV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-SRC_URI += "file://configure.patch"
-
-PNBLACKLIST[uptime] ?= "Depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/azy_svn.bb b/meta-efl/recipes-efl/efl/azy_svn.bb
deleted file mode 100644
index d3bc200f5..000000000
--- a/meta-efl/recipes-efl/efl/azy_svn.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-DESCRIPTION = "Azy is a library meant for implementing rpc clients and servers in a simple manner."
-DEPENDS = "pkgconfig zlib openssl eina gnutls ecore libxml2 re2c-native mysql5 azy-native glib-2.0"
-DEPENDS_class-native = "pkgconfig-native zlib-native openssl-native eina-native gnutls-native ecore-native libxml2-native re2c-native mysql5-native glib-2.0-native"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-PV = "1.0.0+svnr${SRCPV}"
-PR = "r2"
-
-SRCREV = "${EFL_SRCREV}"
-
-# to provide native lemon binary
-BBCLASSEXTEND = "native"
-
-EXTRA_OECONF += " --disable-mysql-tests"
-
-do_configure_prepend_class-target() {
-    sed -i "s#\./lemon#${STAGING_BINDIR_NATIVE}/azy_lemon#g" ${S}/src/bin/Makefile.am
-    sed -i "s#\$(top_builddir)/src/bin/azy_parser -H -p -o#${STAGING_BINDIR_NATIVE}/azy_parser -H -p -o#g" ${S}/src/tests/Makefile.am
-    sed -i "s#\$(top_builddir)/src/bin/azy_parser -eHn -m#${STAGING_BINDIR_NATIVE}/azy_parser -eHn -m#g" ${S}/src/tests/identi.ca/Makefile.am
-}
-
-do_install_append_class-native() {
-    install -d ${D}/${bindir}
-    install -m 0755 ${B}/src/bin/lemon ${D}/${bindir}/azy_lemon
-}
-
-inherit efl
-
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-# azy/2_1.0.0+svnr82070-r2/azy/src/lib/extras/pugixml.cpp:33:
-# sysroots/qemuarm/usr/include/c++/5.2.0/bits/basic_string.h:4780:5: error: reference to 'basic_string' is ambiguous
-#     basic_string<_CharT, _Traits, _Alloc>
-#     ^
-PNBLACKLIST[azy] ?= "OLD and doesn't build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/edbus_1.7.9.bb b/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
deleted file mode 100644
index a8033ac59..000000000
--- a/meta-efl/recipes-efl/efl/edbus_1.7.9.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "8f72da14e5664aad8c45eeeca0e3ff5f"
-SRC_URI[sha256sum] = "c328c4cf1424629cb67c83689ccc1f95967abcb4c03dffd437e93b799ff151c1"
-
-PNBLACKLIST[edbus] ?= "Depends on blacklisted ecore - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[edbus] ?= "Depends on blacklisted eina - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[edbus] ?= "Runtime depends on blacklisted edbus - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[edbus] ?= "Runtime depends on blacklisted edbus-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
deleted file mode 100644
index 4cd21bfd0..000000000
--- a/meta-efl/recipes-efl/efl/efl.inc
+++ /dev/null
@@ -1,290 +0,0 @@
-SUMMARY = "EFL"
-LICENSE = "MIT & BSD & LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ca7873210523dcfd32694b94286dca60"
-
-DEPENDS_class-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native openssl-native"
-DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxdamage libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native util-linux libunwind"
-
-inherit efl gettext pkgconfig
-
-BBCLASSEXTEND = "native"
-
-PROVIDES += "ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus"
-
-# we don't have bullet for physics
-# You have chosen to disable physics support. This disables lots of
-# core functionality and is effectively never tested. You are going
-# to find features that suddenly don't work and as a result cause
-# a series of breakages. This is simply not tested so you are on
-# your own in terms of ensuring everything works if you do this
-EXTRA_OECONF = " \
-    --disable-physics \
-    --enable-i-really-know-what-i-am-doing-and-that-this-will-probably-break-things-and-i-will-fix-them-myself-and-send-patches-aba \
-"
-EXTRA_OECONF_append_class-target = " \
-    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-    --with-eolian-gen=${STAGING_BINDIR_NATIVE}/eolian_gen \
-    --with-eolian-cxx=${STAGING_BINDIR_NATIVE}/eolian_cxx \
-    --with-elua=${STAGING_BINDIR_NATIVE}/elua \
-"
-EXTRA_OECONF_append_class-native = " \
-    --disable-fontconfig \
-    --disable-audio \
-    --disable-physics \
-    --disable-multisense \
-    --disable-cserve \
-    --disable-libeeze \
-    --with-x11=none \
-    --disable-image-loader-bmp \
-    --disable-image-loader-eet \
-    --disable-image-loader-generic \
-    --disable-image-loader-gif \
-    --disable-image-loader-ico \
-    --disable-image-loader-jp2k \
-    --disable-image-loader-pmaps \
-    --disable-image-loader-psd \
-    --disable-image-loader-tga \
-    --disable-image-loader-wbmp \
-    --disable-image-loader-webp \
-    --disable-image-loader-xpm \
-    --disable-image-loader-tgv \
-    --disable-image-loader-dds \
-"
-
-PACKAGECONFIG ?= "egl opengl-es gstreamer1 pulseaudio luajit ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
-PACKAGECONFIG_class-native = "luajit"
-
-PACKAGECONFIG[wayland] = "--enable-wayland --enable-wayland-ivi-shell,--disable-wayland --disable-wayland-ivi-shell,wayland"
-PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
-# sort of tri-state
-PACKAGECONFIG[opengl-full] = "--with-opengl=full,,virtual/libgl"
-PACKAGECONFIG[opengl-es] = "--with-opengl=es,,virtual/libgles2"
-PACKAGECONFIG[opengl-none] = "--with-opengl=none,,"
-# be aware when enabling this for efl-native, we don't provide gcc-native so you need to make
-# sure that all your builders have g++ which supports -std=gnu++11
-PACKAGECONFIG[c++11] = "--enable-cxx-bindings,--disable-cxx-bindings"
-PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer"
-PACKAGECONFIG[gstreamer1] = "--enable-gstreamer1,--disable-gstreamer1,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
-PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
-PACKAGECONFIG[luajit] = "--disable-lua-old,--enable-lua-old,luajit"
-PACKAGECONFIG[lua-old] = "--enable-lua-old,--disable-lua-old,lua"
-PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
-# currently we don't provide doxygen-native
-PACKAGECONFIG[doc] = "--enable-doc,--disable-doc,doxygen-native"
-
-do_install_append() {
-    # don't ship precompiled lua files
-    rm -f ${datadir}/elua/*/*.luac
-}
-
-PACKAGES =+ "edje-utils embryo-utils embryo-tests efreet-trash efreet-mime libeet libefreet ecore-audio ecore-input-evas ecore-input ecore-imf-evas ecore-imf ecore-file ecore-con ecore-ipc ecore-x ecore-evas libemotion eo ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus elua"
-
-# upgrade path from 1.7
-DEBIAN_NOAUTONAME_ecore-audio = "1"
-DEBIAN_NOAUTONAME_ecore-input-evas = "1"
-DEBIAN_NOAUTONAME_ecore-input = "1"
-DEBIAN_NOAUTONAME_ecore-imf-evas = "1"
-DEBIAN_NOAUTONAME_ecore-imf = "1"
-DEBIAN_NOAUTONAME_ecore-file = "1"
-DEBIAN_NOAUTONAME_ecore-con = "1"
-DEBIAN_NOAUTONAME_ecore-ipc = "1"
-DEBIAN_NOAUTONAME_ecore-x = "1"
-DEBIAN_NOAUTONAME_ecore-evas = "1"
-DEBIAN_NOAUTONAME_embryo = "1"
-
-ALLOW_EMPTY_ecore = "1"
-RDEPENDS_ecore = "ecore-audio ecore-input-evas ecore-input ecore-imf-evas ecore-imf ecore-file ecore-con ecore-ipc ecore-x ecore-evas"
-
-python populate_packages_prepend () {
-    for plugin_type in "engines loaders savers".split():
-        bb.note( "splitting packages for evas %s..." % plugin_type )
-        basedir = d.expand( '${libdir}/evas/modules/%s' % plugin_type)
-
-        do_split_packages(d, basedir, '^(.*)',
-        output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
-        description = 'Evas module %s',
-        allow_dirs=True, recursive=False, extra_depends="" )
-
-        plugin_type = "cserve2"
-        bb.note( "splitting packages for evas %s..." % plugin_type )
-        basedir = d.expand( '${libdir}/evas/%s/loaders' % plugin_type)
-
-        do_split_packages(d, basedir, '^(.*)',
-        output_pattern = 'evas-' + plugin_type + "-%s",
-        description = 'Evas csever2 loader module %s',
-        allow_dirs=True, recursive=False, extra_depends="" )
-}
-
-PACKAGES += "evas-loader-png evas-engine-software-generic evas-engine-fb"
-PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve2-.*"
-
-# PACKAGES_DYNAMIC + do_split_packages isn't used for all libe libs,
-# because PACKAGES_DYNAMIC would be catching too many patterns
-# (or need to list all possible prefixes) and not all original packages
-# were splitted like that, so it would need RCONFLICTS/RPROVIDES/RREPLACES
-# combos at least in few places for upgrade path.
-
-FILES_efreet-trash = " \
-    ${libdir}/libefreet_trash${SOLIBS} \
-"
-FILES_efreet-mime = " \
-    ${libdir}/libefreet_mime${SOLIBS} \
-"
-FILES_libeet = " \
-    ${libdir}/libeet${SOLIBS} \
-"
-FILES_libefreet = " \
-    ${libdir}/libefreet${SOLIBS} \
-"
-FILES_ecore-audio = "\
-    ${libdir}/libecore_audio${SOLIBS} \
-"
-FILES_ecore-input-evas = "\
-    ${libdir}/libecore_input_evas${SOLIBS} \
-"
-FILES_ecore-input = "\
-    ${libdir}/libecore_input${SOLIBS} \
-"
-FILES_ecore-imf-evas = "\
-    ${libdir}/libecore_imf_evas${SOLIBS} \
-    ${libdir}/ecore-imf/modules/*/*/module.so \
-"
-FILES_ecore-imf = "\
-    ${libdir}/libecore_imf${SOLIBS} \
-"
-
-FILES_ecore-file = "\
-    ${libdir}/libecore_file${SOLIBS} \
-"
-FILES_ecore-con = "\
-    ${libdir}/libecore_con${SOLIBS} \
-"
-FILES_ecore-ipc = "\
-    ${libdir}/libecore_ipc${SOLIBS} \
-"
-FILES_ecore-x = "\
-    ${libdir}/libecore_x${SOLIBS} \
-    ${libdir}/ecore_x/bin/v-*/ecore_x_vsync \
-"
-FILES_ecore-evas = "\
-    ${libdir}/libecore_evas${SOLIBS} \
-    ${libdir}/ecore-evas/engines/*/*/module.so \
-"
-FILES_eio = "\
-    ${libdir}/libeio${SOLIBS} \
-"
-FILES_eina = "\
-    ${libdir}/libeina${SOLIBS} \
-    ${bindir}/eina-bench-cmp \
-"
-FILES_edje-utils = "\
-    ${bindir}/edje_* \
-    ${datadir}/edje/include/edje.inc \
-"
-FILES_eldbus = "\
-    ${libdir}/libeldbus${SOLIBS} \
-"
-FILES_eo = "\
-    ${libdir}/libeo${SOLIBS} \
-"
-FILES_libemotion = "\
-    ${libdir}/libemotion${SOLIBS} \
-"
-FILES_efreet = " \
-    ${datadir}/dbus-1/services/*Efreet* \
-    ${libdir}/efreet/*/efreet*create \
-    ${bindir}/efreetd \
-    ${datadir}/efreet \
-"
-FILES_eet = " \
-    ${bindir}/eet \
-    ${bindir}/eetpack \
-    ${bindir}/vieet \
-    ${bindir}/diffeet \
-    ${libdir}/libeet${SOLIBS} \
-"
-FILES_emotion = " \
-    ${datadir}/emotion \
-    ${libdir}/emotion/modules/gstreamer1/*/module.so \
-"
-FILES_embryo-tests = " \
-    ${datadir}/embryo/ \
-"
-FILES_embryo-utils = " \
-    ${binddir}/embryo_* \
-"
-FILES_embryo = " \
-    ${libdir}/libembryo${SOLIBS} \
-"
-FILES_ethumb = " \
-    ${datadir}/dbus-1/services/*Ethumb* \
-    ${libdir}/libethumb${SOLIBS} \
-    ${libdir}/libethumb_client${SOLIBS} \
-    ${bindir}/ethumbd \
-    ${bindir}/ethumbd_client \
-    ${bindir}/ethumb \
-    ${libdir}/ethumb/*/*/*/module.so \
-    ${libdir}/ethumb/*/*/*/*.edj \
-    ${libdir}/ethumb_client/utils/*/ethumbd_slave \
-    ${datadir}/ethumb* \
-"
-FILES_ecore = " \
-    ${libdir}/libecore${SOLIBS} \
-    ${libdir}/ecore*/*/*/*/module.so \
-    ${datadir}/ecore* \
-"
-FILES_evas = " \
-    ${libdir}/libevas${SOLIBS} \
-    ${libdir}/evas*/*/*/*/*/module.so \
-    ${libdir}/evas*/*/*/*/*/*.edj \
-    ${libdir}/evas/cserve2/bin/*/evas_cserve2* \
-    ${datadir}/evas* \
-    ${bindir}/evas_cserve2_* \
-"
-
-FILES_eeze = " \
-    ${libdir}/libeeze${SOLIBS} \
-    ${libdir}/eeze*/*/*/*/*/module.so \
-    ${datadir}/eeze \
-    ${bindir}/eeze_* \
-"
-FILES_edje = " \
-    ${libdir}/libedje${SOLIBS} \
-    ${libdir}/edje*/*/*/*/module.so \
-    ${libdir}/edje/utils/*/epp \
-    ${datadir}/edje \
-    ${datadir}/mime \
-"
-FILES_elua = " \
-    ${bindir}/elua \
-    ${datadir}/elua \
-"
-FILES_${PN}-dbg += " \
-    ${libdir}/efreet/*/.debug \
-    ${libdir}/ecore*/*/*/*/.debug \
-    ${libdir}/ecore*/*/*/.debug \
-    ${libdir}/evas*/*/*/*/*/.debug \
-    ${libdir}/evas/cserve2/bin/*/.debug \
-    ${libdir}/eeze*/*/*/*/*/.debug \
-    ${libdir}/edje*/*/*/*/.debug \
-    ${libdir}/edje/utils/*/.debug \
-    ${libdir}/ethumb/*/*/*/.debug \
-    ${libdir}/ethumb_client/utils/*/.debug \
-    ${libdir}/emotion/modules/gstreamer1/*/.debug \
-"
-FILES_${PN}-dev += " \
-    ${libdir}/cmake \
-    ${libdir}/ecore*/*/*/*/module.la \
-    ${libdir}/evas*/*/*/*/*/module.la \
-    ${libdir}/ethumb*/*/*/*/module.la \
-    ${libdir}/eeze*/*/*/*/*/module.la \
-    ${libdir}/edje*/*/*/*/module.la \
-    ${libdir}/emotion/modules/gstreamer1/*/module.la \
-    ${datadir}/gdb/auto-load \
-    ${datadir}/eo/gdb \
-    ${bindir}/eldbus-codegen \
-"
-
-PNBLACKLIST[efl] ?= "Depends on broken efl-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-PNBLACKLIST[efl-native] ?= "Broken: fails to build with http://errors.yoctoproject.org/Errors/Details/138240/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch b/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
deleted file mode 100644
index fa85f817e..000000000
--- a/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 27aedcdcdafbf079dc022bab72ec309cf7db3172 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Fri, 10 Jan 2014 17:07:13 +0100
-Subject: [PATCH 1/3] configure.ac: Don't check for Xprint extension
-
-* it's long gone
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- configure.ac | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c108b1b..f019bfc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -3474,7 +3474,6 @@ if test "x${want_x11_xlib}" = "xyes" ; then
-    ECORE_CHECK_X_EXTENSION([Xdpms], [dpms.h], [Xext], [DPMSQueryExtension])
-    ECORE_CHECK_X_EXTENSION([Xfixes], [Xfixes.h], [Xfixes], [XFixesExpandRegion])
-    ECORE_CHECK_X_EXTENSION([Xinerama], [Xinerama.h], [Xinerama], [XineramaQueryScreens])
--   ECORE_CHECK_X_EXTENSION([Xprint], [Print.h], [Xp], [XpQueryScreens])
-    ECORE_CHECK_X_EXTENSION([Xrandr], [Xrandr.h], [Xrandr], [XRRGetScreenResourcesCurrent])
-    ECORE_CHECK_X_EXTENSION([Xrender], [Xrender.h], [Xrender], [XRenderFindVisualFormat])
-    ECORE_CHECK_X_EXTENSION([Xtest], [XTest.h], [Xtst], [XTestFakeKeyEvent])
--- 
-2.3.0
-
diff --git a/meta-efl/recipes-efl/efl/efl/0001-evas_3d-Add-Eet.h-includes.patch b/meta-efl/recipes-efl/efl/efl/0001-evas_3d-Add-Eet.h-includes.patch
deleted file mode 100644
index d0f26c7dd..000000000
--- a/meta-efl/recipes-efl/efl/efl/0001-evas_3d-Add-Eet.h-includes.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 2e50fd2dfc68b77e7acddc79550f22987778a897 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 2 Dec 2014 12:21:10 +0100
-Subject: [PATCH] evas_3d: Add Eet.h includes
-
-* with some very restrictive options like we use in efl-native, the build is complaining
-  about missing symbols from Eet.h, add include where needed
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/lib/evas/canvas/evas_canvas3d_eet.c                  | 1 +
- src/modules/evas/model_loaders/eet/evas_model_load_eet.c | 1 +
- src/modules/evas/model_savers/eet/evas_model_save_eet.c  | 1 +
- 3 files changed, 3 insertions(+)
-
-diff --git a/src/lib/evas/canvas/evas_canvas3d_eet.c b/src/lib/evas/canvas/evas_canvas3d_eet.c
-index 281f69d..a604076 100644
---- a/src/lib/evas/canvas/evas_canvas3d_eet.c
-+++ b/src/lib/evas/canvas/evas_canvas3d_eet.c
-@@ -1,3 +1,4 @@
-+#include <Eet.h>
- #include <stdio.h>
- #include "evas_common_private.h"
- #include "evas_private.h"
-diff --git a/src/modules/evas/model_loaders/eet/evas_model_load_eet.c b/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
-index 803846d..7ebaf8e 100644
---- a/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
-+++ b/src/modules/evas/model_loaders/eet/evas_model_load_eet.c
-@@ -3,6 +3,7 @@
- #endif
- 
- #include <Eo.h>
-+#include <Eet.h>
- #include <stdio.h>
- #include "evas_common_private.h"
- #include "evas_private.h"
-diff --git a/src/modules/evas/model_savers/eet/evas_model_save_eet.c b/src/modules/evas/model_savers/eet/evas_model_save_eet.c
-index 71e094a..4d56977 100644
---- a/src/modules/evas/model_savers/eet/evas_model_save_eet.c
-+++ b/src/modules/evas/model_savers/eet/evas_model_save_eet.c
-@@ -2,6 +2,7 @@
-    #include "config.h"
- #endif
- 
-+#include <Eet.h>
- #include <stdio.h>
- #include "evas_common_private.h"
- #include "evas_private.h"
--- 
-2.5.0
-
diff --git a/meta-efl/recipes-efl/efl/efl_1.15.1.bb b/meta-efl/recipes-efl/efl/efl_1.15.1.bb
deleted file mode 100644
index 9f18531de..000000000
--- a/meta-efl/recipes-efl/efl/efl_1.15.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch \
-    file://0001-evas_3d-Add-Eet.h-includes.patch \
-"
-
-SRC_URI[md5sum] = "dc91bcab73275f678e1748a2dea8d88a"
-SRC_URI[sha256sum] = "2a6d0ab28020b4741be20b32ad0ffeb8f97f766c5c32175bacc2f2d0dc52f98c"
-
-# Temporary disable until error like the one following are fixed
-# efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
-# collect2: error: ld returned 1 exit status
-# x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
-# Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
-PARALLEL_MAKE_class-native = ""
-
-#EFL_RUN_IN_TREE=1 ../src/bin/eolian/eolian_gen --eo --legacy -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/eo -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/edje -I/OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/ecore_audio --gc -o lib/evas/canvas/evas_line.eo.c /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/lib/evas/canvas/evas_line.eo
-#ERR<32439>:eolian_gen /OE/build/shr-core/tmp-eglibc/work/x86_64-linux/efl-native/2_1.10.0-r0/efl-1.10.0/src/bin/eolian/main.c:103 _generate_c_file() Couldnt open file lib/evas/canvas/evas_line.eo.c for writing
-#Makefile:30738: recipe for target 'lib/evas/canvas/evas_line.eo.c' failed
-#make[2]: *** [lib/evas/canvas/evas_line.eo.c] Error 1
-#Makefile:2163: recipe for target 'all-recursive' failed
-# autotools-brokensep
-B = "${S}"
-
-#ld: error: modules/evas/image_loaders/png/bin_evas_evas_cserve2_slave-evas_image_load_png.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
-#ld: error: modules/evas/image_loaders/png/bin_evas_evas_cserve2_slave-evas_image_load_png.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
-CFLAGS += "-fPIC"
diff --git a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb b/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
deleted file mode 100644
index 783d12304..000000000
--- a/meta-efl/recipes-efl/efl/elementary-theme-efenniht_svn.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "efenniht elementary theme - Efenniht was devised to be clean \
-and neutral. Its name (which means equinox) comes from the chromatic duality \
-that was decided at the very beginning, with a dark theme (black and orange) \
-and a bright one (white and blue) to be developed so that more people feel \
-comfortable using it. Efenniht uses few animations, discrete contrasts between \
-shades of gray and fine lines (colored) that outline the selected elements."
-SECTION = "e/utils"
-HOMEPAGE = "http://trac.enlightenment.org/e/wiki/Themes#Efenniht"
-DEPENDS = "edje-native"
-RSUGGESTS_${PN} = "e-wm-theme-illume-efenniht"
-LICENSE = "MIT & BSD"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/LICENSE;md5=f523ab5986cc79b52a90d2ac3d5454a2"
-
-SRCREV_THM_REV ?= "${EFL_SRCREV}"
-SRCREV_ELM_REV ?= "${EFL_SRCREV}"
-
-SRCREV_FORMAT = "THM_REV"
-PV = "0.0+svnr${SRCPV}"
-PR = "r1"
-
-inherit e-base allarch
-
-SRCNAME = "efenniht"
-SRC_URI = "${E_SVN}/trunk/THEMES;module=${SRCNAME};protocol=http;name=THM_REV"
-SRC_URI += "${E_SVN}/trunk/elementary/data;module=themes;protocol=http;name=ELM_REV"
-SRC_URI += "file://LICENSE"
-S = "${WORKDIR}/${SRCNAME}"
-
-do_compile() {
-    ${STAGING_BINDIR_NATIVE}/edje_cc -id ${S}/images -id ${WORKDIR}/themes/images ${S}/elm-efenniht.edc -o ${S}/elm-efenniht.edj
-}
-
-do_install() {
-    install -d ${D}${datadir}/elementary/themes/
-    install -m 0644 ${S}/elm-efenniht.edj ${D}${datadir}/elementary/themes/
-}
-
-FILES_${PN} = "${datadir}/elementary/themes/"
-
-PNBLACKLIST[elementary-theme-efenniht] ?= "Depends on blacklisted edje-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[elementary-theme-efenniht] ?= "Runtime depends on blacklisted elementary-theme-efenniht - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[elementary-theme-efenniht] ?= "Runtime depends on blacklisted elementary-theme-efenniht-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/elementary_1.15.1.bb b/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
deleted file mode 100644
index 40dd8ad27..000000000
--- a/meta-efl/recipes-efl/efl/elementary_1.15.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-# only for target, because configure doesn't default to sane default when
-# these paths aren't passed in -native build
-SRC_URI_append_class-target = " file://0001-Makefile-Use-elementary_codegen-defined-in-configure.patch"
-
-SRC_URI[md5sum] = "bde4d85fa10ee8a7c0aeb74e69d7cd06"
-SRC_URI[sha256sum] = "ae5540c2103fcdc69fd7469277ce25a8a00a0f701fc2c20771dc0108401e53a0"
-
-# autotools-brokensep - configure updates Elementary.h correctly in ${B}, but then build is using Elementary.h from ${S}
-# which includes #define ELM_EMAP (instead of #undef ELM_EMAP) and building fails
-B = "${S}"
-
-PNBLACKLIST[elementary] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130584/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb b/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
deleted file mode 100644
index ffdd26982..000000000
--- a/meta-efl/recipes-efl/efl/emotion-generic-players_1.15.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "68627c1aabf5b7fe084299adcc0b73c1"
-SRC_URI[sha256sum] = "10bad633480a691585b0ba470c573b14da0a010008d9d59d0792cea8c621d423"
-
-PNBLACKLIST[emotion-generic-players] ?= "Depends on blacklisted emotion - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[emotion-generic-players] ?= "Runtime depends on blacklisted emotion-generic-players - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[emotion-generic-players] ?= "Runtime depends on blacklisted emotion-generic-players-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/engrave_svn.bb b/meta-efl/recipes-efl/efl/engrave_svn.bb
deleted file mode 100644
index f950938c9..000000000
--- a/meta-efl/recipes-efl/efl/engrave_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Engrave is an Edje Editing Library"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=edf2d968b9eb026bfa82cccbd0e6f9f5"
-# also requires yacc and lex on host
-DEPENDS = "evas ecore flex"
-PV = "0.0.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit efl autotools-brokensep
-SRC_URI = "${E_SVN}/OLD;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-# engrave.l:5:35: fatal error: libengrave_la-engrave.h: No such file or directory
-# http://errors.yoctoproject.org/Errors/Details/56597/
-PNBLACKLIST[engrave] ?= "BROKEN: fails to build with latest oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/entrance_svn.bb b/meta-efl/recipes-efl/efl/entrance_svn.bb
deleted file mode 100644
index b1e580dbe..000000000
--- a/meta-efl/recipes-efl/efl/entrance_svn.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Login manager for Enlightenment"
-DEPENDS = "efreet eina eet ecore elementary"
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-SECTION = "e/apps"
-
-inherit e gettext systemd
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
-    file://0001-pam-use-common-auth-instead-of-system-auth.patch \
-    file://entrance.service \
-"
-S = "${WORKDIR}/${SRCNAME}"
-
-PNBLACKLIST[entrance] ?= "broken: switch to https://git.enlightenment.org/misc/entrance.git and fix 0.0.4+svnr82070-r7/entrance/data/themes/old/default.edc:678. invalid state name: 'defaault'. "default" state must always be first. - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[consolekit] = "--enable-consolekit,--disable-consolekit,consolekit"
-
-EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
-
-PR = "r7"
-PV = "0.0.4+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-RDEPENDS_${PN} += "${PN}-themes sessreg xauth"
-CONFFILES_${PN} += "${sysconfdir}/entrance.conf"
-
-RCONFLICTS_${PN} += "xserver-nodm-init"
-RREPLACES_${PN} += "xserver-nodm-init"
-
-RCONFLICTS_${PN} += "xserver-nodm-init-systemd"
-RREPLACES_${PN} += "xserver-nodm-init-systemd"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-
-SYSTEMD_SERVICE_${PN} = "entrance.service"
-
-do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/entrance.service ${D}${systemd_unitdir}/system
-}
diff --git a/meta-efl/recipes-efl/efl/epdf_svn.bb b/meta-efl/recipes-efl/efl/epdf_svn.bb
deleted file mode 100644
index d664bad78..000000000
--- a/meta-efl/recipes-efl/efl/epdf_svn.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Epdf is the glue between EFL and libpoppler"
-
-DEPENDS = "poppler evas ecore"
-PV = "0.1.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit efl
-
-LICENSE = "GPLv2 & LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
-                    file://COPYING.LESSER;md5=6a6a8e020838b23406c81b19c1d46df6 \
-"
-
-SRC_URI = " \
-    ${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep \
-    file://0001-remove-antialias-functions-poppler-has-dropped-them-.patch \
-    file://0002-epdf_poppler_postscript.cpp-fix-build-for-poppler-AP.patch \
-"
-S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "\
-    --enable-poppler \
-    --disable-mupdf \
-"
-
-# Some upgrade path tweaking, as in evas
-AUTO_LIBNAME_PKGS = ""
-
-PNBLACKLIST[epdf] ?= "Depends on blacklisted ecore - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[epdf] ?= "Depends on blacklisted evas - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[epdf] ?= "Runtime depends on blacklisted epdf-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[epdf] ?= "Runtime depends on blacklisted epdf - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb b/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
deleted file mode 100644
index ecdbcee1f..000000000
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders_1.15.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "3ca8443b8cbf177845595c5e02fbc49c"
-SRC_URI[sha256sum] = "caa22c9ba1ae9629c16a3fe809ea927f60b8f0d80cdb7f145159b997b9ae2bcd"
-
-PNBLACKLIST[evas-generic-loaders] ?= "Depends on blacklisted eina - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[evas-generic-loaders] ?= "Runtime depends on blacklisted evas-generic-loaders - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[evas-generic-loaders] ?= "Runtime depends on blacklisted evas-generic-loaders-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb b/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
deleted file mode 100644
index 832cd00a5..000000000
--- a/meta-efl/recipes-efl/efl/expedite_1.7.9.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "954fe8e40fec6a561190ff0fb75b6bdd"
-SRC_URI[sha256sum] = "a05be096c911e0d66d4bdc497ebb935a04ad23696de9084aed9959b5172a593e"
-
-PNBLACKLIST[expedite] ?= "Depends on blacklisted eet - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Depends on blacklisted evas - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-loader-png - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-themes - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-gl-x11 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-generic - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-x11 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-fb - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/expedite_git.bb b/meta-efl/recipes-efl/efl/expedite_git.bb
deleted file mode 100644
index 65c2d4a49..000000000
--- a/meta-efl/recipes-efl/efl/expedite_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "a5e6af917af52877b378090811cf836c16d0bfbb"
-PV = "1.7.99+gitr${SRCPV}"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "\
-    git://git.enlightenment.org/tools/${BPN}.git \
-"
-S = "${WORKDIR}/${SRCNAME}"
-
-PNBLACKLIST[expedite] ?= "Depends on blacklisted eet - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Depends on blacklisted evas - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-loader-png - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-generic - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-fb - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-software-x11 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted evas-engine-gl-x11 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[expedite] ?= "Runtime depends on blacklisted expedite-themes - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/libeflvala_svn.bb b/meta-efl/recipes-efl/efl/libeflvala_svn.bb
deleted file mode 100644
index eaf4893f7..000000000
--- a/meta-efl/recipes-efl/efl/libeflvala_svn.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Vala meets the Enlightenment Foundation Libraries"
-AUTHOR = "Michael 'Mickey' Lauer <mlauer@vanille-media.de>"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-SECTION = "devel"
-DEPENDS = "vala-native glib-2.0 dbus dbus-glib eina eet evas ecore edje elementary tiff"
-PV = "2011.01.13.1+svnr${SRCPV}"
-PE = "1"
-PR = "r2"
-SRCREV = "${EFL_SRCREV}"
-SRCNAME = "vala"
-
-inherit e-base autotools-brokensep pkgconfig vala
-
-SRC_URI = "${E_SVN}/trunk/BINDINGS;module=${SRCNAME};protocol=http \
-    file://disable.eina.test.patch \
-"
-S = "${WORKDIR}/${SRCNAME}"
-
-PACKAGES =+ "${PN}-examples"
-FILES_${PN}-examples = "${datadir}/libeflvala ${bindir}/*"
-
-PNBLACKLIST[libeflvala] ?= "Depends on blacklisted elementary - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/efl/libeweather_svn.bb b/meta-efl/recipes-efl/efl/libeweather_svn.bb
deleted file mode 100644
index 53988b0d1..000000000
--- a/meta-efl/recipes-efl/efl/libeweather_svn.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "EFL-based weather widget library"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24 \
-                    file://COPYING-PLAIN;md5=c910b645eda0005ccec46f75203dc96e"
-
-DEPENDS = "ecore edje"
-PV = "0.0.0+svnr${SRCPV}"
-SRCREV = "${EFL_SRCREV}"
-
-inherit efl
-SRC_URI = "${E_SVN}/trunk/PROTO;module=${SRCNAME};protocol=http;scmdata=keep"
-S = "${WORKDIR}/${SRCNAME}"
-
-EXTRA_OECONF = "--with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
-
-RSUGGESTS_${PN} = "elementary-tests"
-
-do_compile_append() {
-    sed -i -e s:${STAGING_DIR_TARGET}::g \
-           -e s:/${TARGET_SYS}::g \
-              eweather.pc
-}
-
-PACKAGES += "${PN}-plugins"
-
-FILES_${PN}-themes = "\
-    ${datadir} \
-"
-
-FILES_${PN}-plugins = "\
-    ${libdir}/eweather/plugins/*.so \
-"
-
-FILES_${PN}-dbg += "\
-    ${libdir}/eweather/plugins/.debug \
-"
-
-FILES_${PN}-dev += "\
-    ${libdir}/eweather/plugins/*.a \
-    ${libdir}/eweather/plugins/*.la \
-"
-
-RRECOMMENDS_${PN} = "\
-    ${PN}-themes \
-    ${PN}-plugins \
-"
-
-PNBLACKLIST[libeweather] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130649/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
deleted file mode 100644
index ee4e2c414..000000000
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-sdk.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Efl Software Development Kit"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-ALLOW_EMPTY_${PN} = "1"
-
-PR = "r1"
-
-require packagegroup-efl-sdk.inc
-
-PACKAGES = "${PN}"
-
-RDEPENDS_${PN} = "\
-    packagegroup-core-sdk \
-    ${SDK-EFL} \
-    ${SDK-EXTRAS}"
-
-PNBLACKLIST[packagegroup-efl-sdk] ?= "Runtime depends on blacklisted elementary-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
deleted file mode 100644
index 2d9dde649..000000000
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-efl-standalone-sdk-target.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Efl Software Development Kit"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
-ALLOW_EMPTY_${PN} = "1"
-
-PR = "r1"
-
-require packagegroup-efl-sdk.inc
-
-PACKAGES = "${PN} ${PN}-dbg"
-
-RDEPENDS_${PN} = "\
-    packagegroup-core-standalone-sdk-target \
-    ${SDK-EFL} \
-    ${SDK-EXTRAS}"
-
-PNBLACKLIST[packagegroup-efl-standalone-sdk-target] ?= "Runtime depends on blacklisted elementary-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb b/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
deleted file mode 100644
index 95ebcabf3..000000000
--- a/meta-efl/recipes-efl/packagegroups/packagegroup-x11-illume.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "The Illume Windowing Environment -- install this task to get the Enlightenment Window Manager + the Illume environment."
-SECTION = "x11/wm"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${TOPDIR}/meta-openembedded/meta-efl/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PV = "1.0"
-PR = "r5"
-
-inherit packagegroup allarch
-
-# Default theme and config
-ETHEME ?= "e-wm-theme-default"
-ECONFIG ?= "e-wm-config-mobile"
-
-RRECOMMENDS_${PN} = "\
-    ${ETHEME} \
-"
-
-RDEPENDS_${PN} = "\
-    packagegroup-core-x11-xserver \
-    packagegroup-core-x11-utils \
-    \
-    e-wm \
-    ${ECONFIG} \
-"
-
-PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm-config-mobile - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[packagegroup-x11-illume] ?= "Runtime depends on blacklisted e-wm-theme-default - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl.inc b/meta-efl/recipes-efl/webkit/webkit-efl.inc
deleted file mode 100644
index f49f2ee02..000000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl.inc
+++ /dev/null
@@ -1,69 +0,0 @@
-DESCRIPTION = "Webkit browser engine, EFL edition"
-LICENSE = "GPLv2+ & LGPL-2.1"
-LIC_FILES_CHKSUM = " \
-    file://Source/JavaScriptCore/COPYING.LIB;md5=d0c6d6397a5d84286dda758da57bd691 \
-    file://Source/WebCore/LICENSE-APPLE;md5=4646f90082c40bcf298c285f8bab0b12 \
-    file://Source/WebCore/LICENSE-LGPL-2.1;md5=a778a33ef338abbaf8b8a7c36b6eec80 \
-    file://Source/WebCore/LICENSE-LGPL-2;md5=36357ffde2b64ae177b2494445b79d21 \
-"
-
-# you need harfbuzz with icu enabled, you can add this to your config:
-# PACKAGECONFIG_append_pn-harfbuzz = " icu"
-DEPENDS = "icu libxslt sqlite3 gperf-native bison-native flex-native jpeg \
-           libpng libxt fontconfig cairo freetype glib-2.0 libsoup-2.4 \
-           libxml2 pango eina ecore evas edje eldbus harfbuzz enchant \
-           ruby-native elementary"
-
-PE = "1"
-
-SRCVER ?= "${PV}"
-SRC_URI = "\
-    ${E_RELEASES}/libs/webkit-efl/ewebkit-${SRCVER}.tar.xz \
-"
-S = "${WORKDIR}/ewebkit"
-
-inherit cmake lib_package pkgconfig perlnative pythonnative
-
-ARM_INSTRUCTION_SET = "arm"
-
-EXTRA_OECMAKE = " \
-    -DPORT=Efl \
-    -DSHARED_CORE=On \
-    -DENABLE_DRAG_SUPPORT=On \
-    -DENABLE_WEB_AUDIO=Off \
-    -DENABLE_VIDEO=Off \
-    -DENABLE_VIDEO_TRACK=Off \
-    -DENABLE_ACCESSIBILITY=Off \
-    -DENABLE_BATTERY_STATUS=Off \
-"
-# generated ASM code isn't compatible with armv[45]
-# it was removed from macro assembler in upstream commit 121885
-# https://bugs.webkit.org/show_bug.cgi?id=90198
-EXTRA_OECMAKE_append_armv4 = " -DENABLE_LLINT=Off -DENABLE_JIT=Off -DENABLE_DFG_JIT=Off -DENABLE_FTL_JIT=Off"
-EXTRA_OECMAKE_append_armv5 = " -DENABLE_LLINT=Off -DENABLE_JIT=Off -DENABLE_DFG_JIT=Off -DENABLE_FTL_JIT=Off"
-
-# hack it in OptionsEfl.cmake because that overrules -DENABLE_LLINT=Off
-do_configure_prepend_armv4() {
-    sed -i 's/WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_LLINT ON)/WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_LLINT OFF)/g' ${S}/Source/cmake/OptionsEfl.cmake
-}
-do_configure_prepend_armv5() {
-    sed -i 's/WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_LLINT ON)/WEBKIT_OPTION_DEFAULT_PORT_VALUE(ENABLE_LLINT OFF)/g' ${S}/Source/cmake/OptionsEfl.cmake
-}
-
-# and disabled LLINT currently isn't supported, so restrict to armv7a and x86*
-COMPATIBLE_MACHINE = "(-)"
-COMPATIBLE_MACHINE_x86 = "(.*)"
-COMPATIBLE_MACHINE_x86-64 = "(.*)"
-COMPATIBLE_MACHINE_armv7a = "(.*)"
-
-LEAD_SONAME = "libewebkit.so"
-PACKAGES =+ "${PN}launcher-dbg ${PN}launcher ${PN}-inspector"
-
-FILES_${PN} += "${datadir}/ewebkit2-1/themes/default.edj"
-FILES_${PN}-dev += "${libdir}/cmake"
-FILES_${PN}launcher = "${bindir}/EWebLauncher"
-FILES_${PN}launcher-dbg = "${bindir}/.debug/EWebLauncher"
-FILES_${PN}-inspector += "${datadir}/ewebkit2-1/inspector"
-
-# http://errors.yoctoproject.org/Errors/Details/40659/
-PNBLACKLIST[webkit-efl] ?= "Old and unmaintaned fork with many security issues - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0001-OptionsCommon.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0001-OptionsCommon.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch
deleted file mode 100644
index 19b7bb88d..000000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0001-OptionsCommon.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From e6caaf6e80b9c80dc2b860b471a8f05e825f6dfa Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 14 Aug 2014 01:00:21 +0200
-Subject: [PATCH 1/3] OptionsCommon.cmake: don't mix CXX_FLAGS into C_FLAGS
-
-* it was added in https://bugs.webkit.org/show_bug.cgi?id=130261
-* causes build failures in udis86 which explicitly asks for gcc but then
-  gets g++ flags from CMAKE_CXX_FLAGS.
-
-cc1: error: command line option '-fvisibility-inlines-hidden' is valid
-for C++/ObjC++ but not for C [-Werror]
-cc1: error: command line option '-fpermissive' is valid for C++/ObjC++
-but not for C [-Werror]
-cc1: all warnings being treated as errors
-Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/build.make:11182:
-recipe for target
-'Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/disassembler/udis86/udis86.c.o'
-failed
-make[2]: ***
-[Source/JavaScriptCore/CMakeFiles/JavaScriptCore.dir/disassembler/udis86/udis86.c.o]
-Error 1
-make[2]: *** Waiting for unfinished jobs....
-make[2]: Leaving directory
-'/OE/build/oe-core/tmp-eglibc/work/core2-64-oe-linux/webkit-efl/1_1.10.0+1.11.0-beta1-r0/build'
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/cmake/OptionsCommon.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
-index e304a99..045c614 100644
---- a/Source/cmake/OptionsCommon.cmake
-+++ b/Source/cmake/OptionsCommon.cmake
-@@ -25,7 +25,7 @@ endif ()
- set_property(GLOBAL PROPERTY USE_FOLDERS ON)
- 
- if (CMAKE_COMPILER_IS_GNUCXX OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
--    set(CMAKE_C_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions -fno-strict-aliasing")
-+    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-exceptions -fno-strict-aliasing")
-     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -fno-exceptions -fno-strict-aliasing -fno-rtti")
- endif ()
- 
--- 
-2.1.3
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0002-WebKitHelpers.cmake-Add-Wno-error-deprecated-declara.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0002-WebKitHelpers.cmake-Add-Wno-error-deprecated-declara.patch
deleted file mode 100644
index 627a9e82b..000000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0002-WebKitHelpers.cmake-Add-Wno-error-deprecated-declara.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From de93951f89e851b6689718022eebb4b8b1d14c06 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Mon, 13 Jan 2014 17:21:25 +0100
-Subject: [PATCH 2/3] WebKitHelpers.cmake: Add
- -Wno-error=deprecated-declarations -Wno-error=cast-align
- -Wno-error=type-limits
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/cmake/WebKitHelpers.cmake | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/Source/cmake/WebKitHelpers.cmake b/Source/cmake/WebKitHelpers.cmake
-index 227b9ee..ae52ef6 100644
---- a/Source/cmake/WebKitHelpers.cmake
-+++ b/Source/cmake/WebKitHelpers.cmake
-@@ -40,6 +40,25 @@ macro(WEBKIT_SET_EXTRA_COMPILER_FLAGS _target)
-             # FIXME: When we use -fno-tree-dce to support the jsCStack branch merge, build error occurs due to the uninitialization. Temporarily we set
-             # uninitialized as build warning in order to support the jsCStack merge. https://bugs.webkit.org/show_bug.cgi?id=127777.
-             set(OLD_COMPILE_FLAGS "-Werror -Wno-error=unused-parameter -Wno-error=uninitialized -Wno-error=literal-suffix ${OLD_COMPILE_FLAGS}")
-+            # libsoup-2.4/libsoup/soup-proxy-uri-resolver.h:13:84: error: 'GType soup_proxy_uri_resolver_get_type()' is deprecated (declared at /OE/build/oe-core/tmp-eglibc/sysroots/qemux86-64/usr/include/libsoup-2.4/libsoup/soup-proxy-uri-resolver.h:48) [-Werror=deprecated-declarations]
-+            set(OLD_COMPILE_FLAGS "-Wno-error=deprecated-declarations ${OLD_COMPILE_FLAGS}")
-+            # webkit-efl/1_1.10.0+1.11.0-beta1-r0/ewebkit/Source/WTF/wtf/text/StringImpl.h:742:87: error: cast from 'uint8_t* {aka unsigned char*}' to 'WTF::StringImpl**' increases required alignment of target type [-Werror=cast-align]
-+            set(OLD_COMPILE_FLAGS "-Wno-error=cast-align ${OLD_COMPILE_FLAGS}")
-+            # webkit-efl/1_1.10.0+1.11.0-beta1-r0/ewebkit/Source/WebKit2/Shared/linux/WebMemorySamplerLinux.cpp:70:16: error: comparison is always false due to limited range of data type [-Werror=type-limits]
-+            set(OLD_COMPILE_FLAGS "-Wno-error=type-limits ${OLD_COMPILE_FLAGS}")
-+            # webkit-efl/1_1.11.0-r0/ewebkit/Source/WebKit2/UIProcess/API/efl/EwkView.cpp:832:5: error: missing initializer for member '_Evas_GL_Config::gles_version' [-Werror=missing-field-initializers]
-+            # this one is new with efl-1.12
-+            set(OLD_COMPILE_FLAGS "-Wno-error=missing-field-initializers ${OLD_COMPILE_FLAGS}")
-+            # webkit-efl/1_1.11.0-r0/ewebkit/Source/WTF/wtf/dtoa/bignum.cc:105:10: error: assuming signed overflow does not occur when assuming that (X + c) < X is always false [-Werror=strict-overflow]
-+            # this one is new with gcc-5.2
-+            set(OLD_COMPILE_FLAGS "-Wno-error=strict-overflow ${OLD_COMPILE_FLAGS}")
-+            # webkit-efl/1_1.11.0-r0/ewebkit/Source/WTF/wtf/SaturatedArithmetic.h:46:26: error: suggest parentheses around operand of '!' or change '&' to '&&' or '!' to '~' [-Werror=parentheses]
-+            # this one is new with gcc-5.2
-+            set(OLD_COMPILE_FLAGS "-Wno-error=parentheses ${OLD_COMPILE_FLAGS}")
-+            # webkit-efl/1_1.11.0-r0/ewebkit/Source/WebCore/loader/cache/CachedScript.cpp:103:108: error: logical not is only applied to the left hand side of comparison [-Werror=logical-not-parentheses]
-+            # this one is new with gcc-5.2
-+            set(OLD_COMPILE_FLAGS "-Wno-error=logical-not-parentheses ${OLD_COMPILE_FLAGS}")
-+
-         endif ()
- 
-         set_target_properties(${_target} PROPERTIES
--- 
-2.1.3
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0003-FEBlendNEON.h-fix-missing-semicolon.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0003-FEBlendNEON.h-fix-missing-semicolon.patch
deleted file mode 100644
index e718ee1c1..000000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0003-FEBlendNEON.h-fix-missing-semicolon.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a076d76b8e8862bd641cd991190e82cfd478cc66 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 20 Aug 2014 00:52:03 +0200
-Subject: [PATCH 3/3] FEBlendNEON.h: fix missing semicolon
-
-* Otherwise fails with:
-In file included from ewebkit/Source/WebCore/platform/graphics/filters/FEBlend.cpp:29:0:
-ewebkit/Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h: In member function 'virtual void WebCore::FEBlend::platformApplySoftware()':
-ewebkit/Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h:130:5: error: expected primary-expression before '}' token
-     }
-     ^
-ewebkit/Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h:130:5: error: return-statement with a value, in function returning 'void' [-fpermissive]
-ewebkit/Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h:130:5: error: expected ';' before '}' token
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h b/Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h
-index 1c50765..f4b6f46 100644
---- a/Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h
-+++ b/Source/WebCore/platform/graphics/cpu/arm/filters/FEBlendNEON.h
-@@ -126,7 +126,7 @@ void FEBlend::platformApplySoftware()
- 
-     if (pixelArrayLength >= 8) {
-         platformApplyNEON(srcPixelArrayA->data(), srcPixelArrayB->data(), dstPixelArray->data(), pixelArrayLength);
--        return
-+        return;
-     }
-     // If there is just one pixel we expand it to two.
-     ASSERT(pixelArrayLength > 0);
--- 
-2.1.3
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0004-Fix-the-build-with-EFL-1.12-https-bugs.webkit.org-sh.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0004-Fix-the-build-with-EFL-1.12-https-bugs.webkit.org-sh.patch
deleted file mode 100644
index bfa3052b1..000000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0004-Fix-the-build-with-EFL-1.12-https-bugs.webkit.org-sh.patch
+++ /dev/null
@@ -1,146 +0,0 @@
-From baebc004111289ef658c78a42f8332f3dceef41e Mon Sep 17 00:00:00 2001
-From: "ryuan.choi@navercorp.com" <ryuan.choi@navercorp.com>
-Date: Thu, 13 Nov 2014 07:07:16 +0000
-Subject: [PATCH 4/4] Fix the build with EFL 1.12
- https://bugs.webkit.org/show_bug.cgi?id=138245
-
-Reviewed by Gyuyoung Kim.
-
-Source/WebKit2:
-
-* UIProcess/API/efl/EwkView.cpp:
-First, modified to use Evas_GL raw pointer instead of UniquePtrEfl because
-Evas_GL.h can't be included in UniquePtrEfl.h
-It should be moved into EvasGLContext because WebKit/EFL use only one Evas_GL.
-Second, provided the version of GLES in Evas_GL_Config not to break build with
-EFL 1.12
-(EwkView::EwkView):
-(EwkView::~EwkView):
-(EwkView::displayTimerFired):
-(EwkView::createGLSurface):
-* UIProcess/API/efl/EwkView.h:
-
-Source/WTF:
-
-* wtf/efl/UniquePtrEfl.h:
-Removed Evas_GL.h from UniquePtrEfl.h, which is commonly included, because
-it should not be included with official GL headers.
-
-git-svn-id: http://svn.webkit.org/repository/webkit/trunk@176066 268f45cc-cd09-0410-ab3c-d52691b4dbfc
----
- Source/WTF/wtf/efl/UniquePtrEfl.h            |  2 --
- Source/WebKit2/UIProcess/API/efl/EwkView.cpp | 24 ++++++++++++++++--------
- Source/WebKit2/UIProcess/API/efl/EwkView.h   |  3 ++-
- 3 files changed, 18 insertions(+), 11 deletions(-)
-
-diff --git a/Source/WTF/wtf/efl/UniquePtrEfl.h b/Source/WTF/wtf/efl/UniquePtrEfl.h
-index ba0110a..038d3fb 100644
---- a/Source/WTF/wtf/efl/UniquePtrEfl.h
-+++ b/Source/WTF/wtf/efl/UniquePtrEfl.h
-@@ -33,7 +33,6 @@
- #include <Ecore_IMF.h>
- #include <Eina.h>
- #include <Evas.h>
--#include <Evas_GL.h>
- 
- namespace WTF {
- 
-@@ -51,7 +50,6 @@ using EflUniquePtr = std::unique_ptr<T, EflPtrDeleter<T>>;
-     macro(Eina_Hash, eina_hash_free) \
-     macro(Eina_Module, eina_module_free) \
-     macro(Evas_Object, evas_object_del) \
--    macro(Evas_GL, evas_gl_free)
- 
- #define WTF_DEFINE_EFLPTR_DELETER(typeName, deleterFunc) \
-     template<> struct EflPtrDeleter<typeName> \
-diff --git a/Source/WebKit2/UIProcess/API/efl/EwkView.cpp b/Source/WebKit2/UIProcess/API/efl/EwkView.cpp
-index 50d34ed..6ff3394 100755
---- a/Source/WebKit2/UIProcess/API/efl/EwkView.cpp
-+++ b/Source/WebKit2/UIProcess/API/efl/EwkView.cpp
-@@ -299,9 +299,11 @@ EwkView::EwkView(WKViewRef view, Evas_Object* evasObject)
- 
-     // FIXME: Remove when possible.
-     static_cast<WebViewEfl*>(webView())->setEwkView(this);
--    m_evasGL = EflUniquePtr<Evas_GL>(evas_gl_new(evas_object_evas_get(m_evasObject)));
-+
-+    // FIXME: Consider it to move into EvasGLContext.
-+    m_evasGL = evas_gl_new(evas_object_evas_get(m_evasObject));
-     if (m_evasGL)
--        m_evasGLContext = EvasGLContext::create(m_evasGL.get());
-+        m_evasGLContext = EvasGLContext::create(m_evasGL);
- 
-     if (!m_evasGLContext) {
-         WARN("Failed to create Evas_GL, falling back to software mode.");
-@@ -333,6 +335,9 @@ EwkView::~EwkView()
- {
-     ASSERT(wkPageToEvasObjectMap().get(wkPage()) == m_evasObject);
-     wkPageToEvasObjectMap().remove(wkPage());
-+
-+    if (m_evasGL)
-+        evas_gl_free(m_evasGL);
- }
- 
- EwkView* EwkView::create(WKViewRef webView, Evas* canvas, Evas_Smart* smart)
-@@ -587,7 +592,7 @@ void EwkView::displayTimerFired(Timer<EwkView>*)
-         return;
-     }
- 
--    evas_gl_make_current(m_evasGL.get(), m_evasGLSurface->surface(), m_evasGLContext->context());
-+    evas_gl_make_current(m_evasGL, m_evasGLSurface->surface(), m_evasGLContext->context());
- 
-     WKViewPaintToCurrentGLContext(wkView());
- 
-@@ -828,21 +833,24 @@ bool EwkView::createGLSurface()
-         EVAS_GL_DEPTH_BIT_8,
-         EVAS_GL_STENCIL_NONE,
-         EVAS_GL_OPTIONS_NONE,
--        EVAS_GL_MULTISAMPLE_NONE
-+        EVAS_GL_MULTISAMPLE_NONE,
-+#if defined(EVAS_GL_API_VERSION) && EVAS_GL_API_VERSION >= 2
-+        EVAS_GL_GLES_2_X
-+#endif
-     };
- 
-     // Recreate to current size: Replaces if non-null, and frees existing surface after (OwnPtr).
--    m_evasGLSurface = EvasGLSurface::create(m_evasGL.get(), &evasGLConfig, deviceSize());
-+    m_evasGLSurface = EvasGLSurface::create(m_evasGL, &evasGLConfig, deviceSize());
-     if (!m_evasGLSurface)
-         return false;
- 
-     Evas_Native_Surface nativeSurface;
--    evas_gl_native_surface_get(m_evasGL.get(), m_evasGLSurface->surface(), &nativeSurface);
-+    evas_gl_native_surface_get(m_evasGL, m_evasGLSurface->surface(), &nativeSurface);
-     evas_object_image_native_surface_set(smartData()->image, &nativeSurface);
- 
--    evas_gl_make_current(m_evasGL.get(), m_evasGLSurface->surface(), m_evasGLContext->context());
-+    evas_gl_make_current(m_evasGL, m_evasGLSurface->surface(), m_evasGLContext->context());
- 
--    Evas_GL_API* gl = evas_gl_api_get(m_evasGL.get());
-+    Evas_GL_API* gl = evas_gl_api_get(m_evasGL);
- 
-     WKPoint boundsEnd = WKViewUserViewportToScene(wkView(), WKPointMake(deviceSize().width(), deviceSize().height()));
-     gl->glViewport(0, 0, boundsEnd.x, boundsEnd.y);
-diff --git a/Source/WebKit2/UIProcess/API/efl/EwkView.h b/Source/WebKit2/UIProcess/API/efl/EwkView.h
-index 1c482cf..68dab87 100644
---- a/Source/WebKit2/UIProcess/API/efl/EwkView.h
-+++ b/Source/WebKit2/UIProcess/API/efl/EwkView.h
-@@ -39,6 +39,7 @@
- #endif
- 
- typedef struct _cairo_surface cairo_surface_t;
-+typedef struct _Evas_GL Evas_GL;
- 
- namespace WebKit {
- class ContextMenuClientEfl;
-@@ -241,7 +242,7 @@ private:
-     Evas_Object* m_evasObject;
-     RefPtr<EwkContext> m_context;
-     RefPtr<EwkPageGroup> m_pageGroup;
--    EflUniquePtr<Evas_GL> m_evasGL;
-+    Evas_GL* m_evasGL;
-     std::unique_ptr<WebCore::EvasGLContext> m_evasGLContext;
-     std::unique_ptr<WebCore::EvasGLSurface> m_evasGLSurface;
-     bool m_pendingSurfaceResize;
--- 
-2.1.3
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0005-Fix-the-build-with-cmake-3.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0005-Fix-the-build-with-cmake-3.patch
deleted file mode 100644
index 7e8e295c7..000000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0005-Fix-the-build-with-cmake-3.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From a00a7097b85567ae6eb7a00b3ce7ef021841203c Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Thu, 24 Sep 2015 18:03:52 +0200
-Subject: [PATCH 5/5] Fix the build with cmake 3
-
-* the same issue as in GTK port:
-  https://bugs.webkit.org/show_bug.cgi?id=141796
-  http://trac.webkit.org/changeset/180502
-
-* otherwise linking fails with couple undefined symbols
-| CMakeFiles/WebKit2.dir/PluginProcess/unix/PluginProcessMainUnix.cpp.o: In function `WebKit::webkitXError(_XDisplay*, XErrorEvent*)':
-| ewebkit/Source/WebKit2/PluginProcess/unix/PluginProcessMainUnix.cpp:63: undefined reference to `XGetErrorText'
-| CMakeFiles/WebKit2.dir/PluginProcess/unix/PluginProcessMainUnix.cpp.o: In function `WebKit::PluginProcessMain::parseCommandLine(int, char**)':
-| ewebkit/Source/WebKit2/PluginProcess/unix/PluginProcessMainUnix.cpp:102: undefined reference to `XSetErrorHandler'
-| ewebkit/Source/WebKit2/PluginProcess/unix/PluginProcessMainUnix.cpp:102: undefined reference to `XSetErrorHandler'
-| CMakeFiles/WebKit2.dir/WebProcess/efl/WebProcessMainEfl.cpp.o: In function `WebKit::WebProcessMain::platformInitialize()':
-| ewebkit/Source/WebKit2/WebProcess/efl/WebProcessMainEfl.cpp:67: undefined reference to `XSetExtensionErrorHandler'
-| ewebkit/Source/WebKit2/WebProcess/efl/WebProcessMainEfl.cpp:67: undefined reference to `XSetExtensionErrorHandler'
-| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformPostInitializeWindowed(bool, unsigned long)':
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:170: undefined reference to `XFlush'
-| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformPostInitializeWindowless()':
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:195: undefined reference to `XGetVisualInfo'
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:199: undefined reference to `XFree'
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:202: undefined reference to `XCreateColormap'
-| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformDestroy()':
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:251: undefined reference to `XFreeColormap'
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:255: undefined reference to `XFreePixmap'
-| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformGeometryDidChange()':
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:293: undefined reference to `XCreatePixmap'
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:286: undefined reference to `XFreePixmap'
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:295: undefined reference to `XSync'
-| CMakeFiles/WebKit2.dir/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp.o: In function `WebKit::NetscapePlugin::platformPaint(WebCore::GraphicsContext*, WebCore::IntRect const&, bool)':
-| ewebkit/Source/WebKit2/WebProcess/Plugins/Netscape/x11/NetscapePluginX11.cpp:343: undefined reference to `XSync'
-| collect2: error: ld returned 1 exit status
-| Source/WebKit2/CMakeFiles/WebKit2.dir/build.make:16145: recipe for target 'lib/libewebkit2.so.1.11.0' failed
-| make[2]: *** [lib/libewebkit2.so.1.11.0] Error 1
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/WebCore/PlatformEfl.cmake         | 1 +
- Source/WebKit2/PlatformEfl.cmake         | 3 +++
- Source/cmake/OptionsEfl.cmake            | 1 +
- Tools/WebKitTestRunner/PlatformEfl.cmake | 1 +
- 4 files changed, 6 insertions(+)
-
-diff --git a/Source/WebCore/PlatformEfl.cmake b/Source/WebCore/PlatformEfl.cmake
-index 41ffc15..63b7861 100644
---- a/Source/WebCore/PlatformEfl.cmake
-+++ b/Source/WebCore/PlatformEfl.cmake
-@@ -404,6 +404,7 @@ if (WTF_USE_3D_GRAPHICS)
-         )
-     endif ()
- 
-+    find_package(X11 REQUIRED)
-     list(APPEND WebCore_LIBRARIES
-         ${X11_X11_LIB}
-     )
-diff --git a/Source/WebKit2/PlatformEfl.cmake b/Source/WebKit2/PlatformEfl.cmake
-index 8c66d1b..d96f0bd 100644
---- a/Source/WebKit2/PlatformEfl.cmake
-+++ b/Source/WebKit2/PlatformEfl.cmake
-@@ -331,12 +331,15 @@ if (ENABLE_SECCOMP_FILTERS)
- endif ()
- 
- if (ENABLE_ECORE_X)
-+    find_package(X11 REQUIRED)
-     list(APPEND WebProcess_LIBRARIES
-         ${ECORE_X_LIBRARIES}
-         ${X11_Xext_LIB}
-     )
-     list(APPEND WebKit2_LIBRARIES
-         ${ECORE_X_LIBRARIES}
-+        ${X11_X11_LIB}
-+        ${X11_Xext_LIB}
-     )
- endif ()
- 
-diff --git a/Source/cmake/OptionsEfl.cmake b/Source/cmake/OptionsEfl.cmake
-index 8585f19..1aa9002 100644
---- a/Source/cmake/OptionsEfl.cmake
-+++ b/Source/cmake/OptionsEfl.cmake
-@@ -181,6 +181,7 @@ endif ()
- 
- if (WTF_OS_UNIX)
-     set(ENABLE_X11_TARGET ON)
-+    find_package(X11 REQUIRED)
-     add_definitions(-DXP_UNIX)
- endif (WTF_OS_UNIX)
- 
-diff --git a/Tools/WebKitTestRunner/PlatformEfl.cmake b/Tools/WebKitTestRunner/PlatformEfl.cmake
-index 1873279..a905f2a 100644
---- a/Tools/WebKitTestRunner/PlatformEfl.cmake
-+++ b/Tools/WebKitTestRunner/PlatformEfl.cmake
-@@ -53,6 +53,7 @@ list(APPEND WebKitTestRunnerInjectedBundle_LIBRARIES
- )
- 
- if (ENABLE_ECORE_X)
-+    find_package(X11 REQUIRED)
-     list(APPEND WebKitTestRunner_INCLUDE_DIRECTORIES
-         ${ECORE_X_INCLUDE_DIRS}
-     )
--- 
-2.6.0
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl/0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch b/meta-efl/recipes-efl/webkit/webkit-efl/0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch
deleted file mode 100644
index 05626349b..000000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl/0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 993882f81fe991b8baf1099392703337cc13fac0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 27 Jan 2016 18:40:23 +0100
-Subject: [PATCH] OptionsEfl.cmake: Fix build with newer CMake 3.4
-
-* otherwise it fails with:
-  | CMake Error at Source/cmake/OptionsEfl.cmake:251 (CHECK_INCLUDE_FILES):
-  |   Unknown CMake command "CHECK_INCLUDE_FILES".
-* https://bugs.webkit.org/show_bug.cgi?id=150117
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- Source/cmake/OptionsEfl.cmake | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/Source/cmake/OptionsEfl.cmake b/Source/cmake/OptionsEfl.cmake
-index 1aa9002..05216d0 100644
---- a/Source/cmake/OptionsEfl.cmake
-+++ b/Source/cmake/OptionsEfl.cmake
-@@ -253,6 +253,7 @@ if (ENABLE_WEBGL OR WTF_USE_TILED_BACKING_STORE)
-         set(WTF_USE_EGL 1)
-         add_definitions(-DWTF_USE_EGL=1)
-     else ()
-+        include(CheckIncludeFiles)
-         CHECK_INCLUDE_FILES("GL/glx.h" OPENGLX_FOUND)
-         add_definitions(-DWTF_USE_GLX=1)
-     endif ()
--- 
-2.7.0
-
diff --git a/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb b/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
deleted file mode 100644
index 96ad83029..000000000
--- a/meta-efl/recipes-efl/webkit/webkit-efl_1.11.0.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI += "\
-    file://0001-OptionsCommon.cmake-don-t-mix-CXX_FLAGS-into-C_FLAGS.patch \
-    file://0002-WebKitHelpers.cmake-Add-Wno-error-deprecated-declara.patch \
-    file://0003-FEBlendNEON.h-fix-missing-semicolon.patch \
-    file://0004-Fix-the-build-with-EFL-1.12-https-bugs.webkit.org-sh.patch \
-    file://0005-Fix-the-build-with-cmake-3.patch \
-    file://0006-OptionsEfl.cmake-Fix-build-with-newer-CMake-3.4.patch \
-"
-SRC_URI[md5sum] = "90fa970ebf8646319d292c2bb5bff5db"
-SRC_URI[sha256sum] = "d8d21e27f4a21cd77c41914548c184ddb98693ba23851aa66c8e51c0be4b90b7"
diff --git a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb b/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
deleted file mode 100644
index 040e006ab..000000000
--- a/meta-efl/recipes-navigation/mcnavi/mcnavi_0.3.4.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Free GPS navigation for car and outdoor with OpenStreetMap maps"
-HOMEPAGE = "http://www.gps-routes.info/index.php?name=Content&pa=showpage&pid=1"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
-DEPENDS = "ecore evas imlib2 gpsd edje edje-native mysql5 intltool-native"
-
-SRC_URI = "http://www.gps-routes.info/debian/pool/main/m/mcnavi/mcnavi_${PV}.tar.gz"
-SRC_URI[md5sum] = "6860cde5c02a9f93c829da4b10e5a226"
-SRC_URI[sha256sum] = "ee7f65155e91386175875fc4f72f4bc94e4e9cdb8258112632da94520ef2c349"
-
-S = "${WORKDIR}/${PN}"
-
-inherit autotools
-
-PNBLACKLIST[mcnavi] ?= "BROKEN: latest version 0.3.4 is 3 years old and now broken with more strict ejde_cc from efl-1.13 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-# | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/main.edc:126. invalid state name: 'none'. "default" state must always be first.
-# | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/itinerary.edc:84. invalid state name: 'none'. "default" state must always be first.
-# | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/text.edc:1129. invalid state name: 'none'. "default" state must always be first.
-# | edje_cc: Error. parse error 0.3.4-r0/mcnavi/data/themes/Default/fileopen.edc:78. invalid state name: 'off'. "default" state must always be first.
diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
deleted file mode 100644
index 6995ad3f5..000000000
--- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "FUSE module for mounting an entire SMB/NMB network in a single directory"
-DESCRIPTION = "SMBNetFS is a Linux/FreeBSD filesystem that allow you to use \
-               samba/microsoft network in the same manner as the network \
-               neighborhood in Microsoft Windows. Please donate me to help \
-               in SMBNetFS development."
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
-HOMEPAGE ="http://sourceforge.net/projects/smbnetfs"
-
-DEPENDS = "fuse samba"
-
-inherit autotools gitpkgv pkgconfig
-
-PKGV = "${GITPKGVTAG}"
-
-SRCREV = "ace1c519d45fe488b9b7e6cc77a2bcadb6c83464"
-
-SRC_URI = "git://smbnetfs.git.sourceforge.net/gitroot/smbnetfs/smbnetfs;branch=master \
-           file://configure.patch \
-           file://Using-PKG_CHECK_MODULES-to-found-headers-and-libraries.patch"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--with-gnome-keyring=no,libgnome-keyring"
-
-S = "${WORKDIR}/git"
-
-PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb b/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
deleted file mode 100644
index 632f79d46..000000000
--- a/meta-filesystems/recipes-utils/dmapi/dmapi_2.2.12.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Library functions to get attribute bits"
-DESCRIPTION = "The Data Management API (DMAPI/XDSM) allows implementation \
-               of hierarchical storage management software with no kernel \
-               modifications as well as high-performance dump programs \
-               without requiring "raw" access to the disk and knowledge \
-               of filesystem structures.This interface is implemented by \
-               the libdm library."
-
-HOMEPAGE = "http://oss.sgi.com/projects/xfs"
-SECTION = "base"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://doc/COPYING;md5=1678edfe8de9be9564d23761ae2fa794"
-DEPENDS = "xfsprogs"
-
-SRC_URI = "ftp://oss.sgi.com/projects/xfs/cmd_tars/dmapi-${PV}.tar.gz \
-           file://remove-install-as-user.patch \
-           file://dmapi_aarch64_configure_support.patch \
-          "
-SRC_URI[md5sum] = "cd825d4e141c16011367e0a0dd98c9c5"
-SRC_URI[sha256sum] = "b18e34f47374f6adf7c164993c26df36986a009b86aa004ef9444102653aea69"
-
-inherit autotools-brokensep
-
-PARALLEL_MAKE = ""
-EXTRA_OEMAKE += "LIBTOOL="${HOST_SYS}-libtool --tag=CC" V=1"
-
-do_install () {
-    export DIST_ROOT=${D}
-    install -d ${D}${libdir}
-    oe_runmake install install-dev PKG_DEVLIB_DIR=${libdir}
-}
-
-PNBLACKLIST[dmapi] ?= "Depends on broken xfsprogs - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
deleted file mode 100644
index 3f5a5b124..000000000
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Take photos and videos with your webcam, with fun graphical effects"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
-
-DEPENDS = "gtk+ gstreamer gst-plugins-base libcanberra udev librsvg gnome-desktop evolution-data-server intltool-native"
-
-PR = "r2"
-
-inherit gnome
-
-SRC_URI[archive.md5sum] = "1599fded8a1797ea51fb010af4e6c45b"
-SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afcff86ae0939a74f66ce030d4eed3bc3cbd9a"
-GNOME_COMPRESS_TYPE="bz2"
-
-FILES_${PN} += "${datadir}/dbus-1"
-RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-do_configure_prepend() {
-    sed -i -e "s: help : :g" ${S}/Makefile.am
-}
-
-PNBLACKLIST[cheese] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[cheese] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb b/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
deleted file mode 100644
index 5e11a95de..000000000
--- a/meta-gnome/recipes-apps/epdfview/epdfview_0.1.8.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A lightweight PDF viewer based on gtk and poppler"
-HOMEPAGE = "http://www.emma-soft.com/projects/epdfview/"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-SECTION = "x11/applications"
-DEPENDS = "gtk+ poppler"
-
-PR = "r3"
-
-EXTRA_OECONF += "--without-cups"
-
-inherit autotools gettext
-
-SRC_URI = "http://www.emma-soft.com/projects/${BPN}/chrome/site/releases/${BP}.tar.bz2 \
-           file://browser_command.patch \
-           file://fix-format.patch \
-           file://glib-single-include.patch \
-           file://swap-colors.patch \
-"
-SRC_URI[md5sum] = "e50285b01612169b2594fea375f53ae4"
-SRC_URI[sha256sum] = "948648ae7c9d7b3b408d738bd4f48d87375b1196cae1129d6b846a8de0f2f8f0"
-
-PNBLACKLIST[epdfview] ?= "BROKEN: images are not displayed anymore - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-# There will be no further development / upstream is gone [1]
-# [1] https://bugzilla.redhat.com/show_bug.cgi?id=906121
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
deleted file mode 100644
index f6d737c81..000000000
--- a/meta-gnome/recipes-apps/gnome-mplayer/gmtk_1.0.5.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "GTK+ widget and function libraries for gnome-mplayer"
-HOMEPAGE = "http://code.google.com/p/gmtk"
-SECTION = "libs"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS = "gtk+ alsa-lib glib-2.0 virtual/libx11 intltool-native pulseaudio gtk+3"
-
-SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "e06e9ca8d61d74910343bb3ef4348f7f"
-SRC_URI[sha256sum] = "a07130d62719e8c1244f8405dd97445798df5204fc0f3f2f2b669b125114b468"
-
-EXTRA_OECONF = "--disable-gconf --with-gio --with-alsa --enable-keystore"
-
-inherit gettext pkgconfig autotools gconf
-
-PNBLACKLIST[gmtk] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130661/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb b/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
deleted file mode 100644
index 629b830dd..000000000
--- a/meta-gnome/recipes-apps/gnome-mplayer/gnome-mplayer_1.0.5.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "A GTK+ interface to MPlayer"
-HOMEPAGE = "http://code.google.com/p/gnome-mplayer"
-SECTION = "multimedia"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PNBLACKLIST[gnome-mplayer] ?= "rdepends on blacklisted mplayer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-PR = "r2"
-
-DEPENDS = "gmtk gtk+ alsa-lib libnotify glib-2.0 dbus-glib virtual/libx11 libxscrnsaver"
-
-SRC_URI = "http://${BPN}.googlecode.com/files/${BP}.tar.gz"
-SRC_URI[md5sum] = "1d3ab24c5501b5528e357931ca4dc6da"
-SRC_URI[sha256sum] = "ac3c179345baecb4ca5237782aa33e83253a87bf8b42ce6eb3a9207a340f61b2"
-
-EXTRA_OECONF = "--with-gio --with-alsa --with-dbus --with-libnotify"
-
-FILES_${PN} += "${datadir}/gnome-control-center/default-apps/${PN}.xml"
-PACKAGES =+ "${PN}-nautilus-extension"
-FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so \
-                                   ${libdir}/nautilus/extensions-3.0/*.so"
-FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la \
-                    ${libdir}/nautilus/extensions-3.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
-                          ${libdir}/nautilus/extensions-3.0/*.a"
-FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug \
-                    ${libdir}/nautilus/extensions-3.0/.debug"
-
-inherit gettext pkgconfig mime gtk-icon-cache autotools
-
-RDEPENDS_${PN} = "mplayer"
diff --git a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb b/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
deleted file mode 100644
index c419d0f44..000000000
--- a/meta-gnome/recipes-extended/gtk-theme-torturer/gtk-theme-torturer_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "GTK+ Theme benchmark program"
-DEPENDS = "gtk+"
-HOMEPAGE = "http://wiki.laptop.org/go/GTK_for_OLPC"
-SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://appwindow.c;endline=13;md5=8c09920de460c7ea1f64ee56986aabd9"
-
-SRCREV = "99962ae39bb5aadb31929b25c58e1a053f9c9545"
-PV = "0.0.0+git${SRCPV}"
-
-SRC_URI = "git://dev.laptop.org/projects/soc-gtk/"
-S = "${WORKDIR}/git/gtk-theme-torturer"
-
-CFLAGS += "-Wl,-rpath-link,${STAGING_LIBDIR}"
-
-inherit distro_features_check
-ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 torturer ${D}${bindir}
-}
-
-# http://errors.yoctoproject.org/Errors/Details/35132/
-PNBLACKLIST[gtk-theme-torturer] ?= "BROKEN: gmacros.h:182:53: error: size of array '_GStaticAssertCompileTimeAssertion_2' is negative - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb b/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
deleted file mode 100644
index 6028f2d1a..000000000
--- a/meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "gcalctool is a powerful calculator"
-SECTION = "x11"
-DEPENDS = "gtk+ gnome-doc-utils"
-
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
-SRC_URI = "http://download.gnome.org/sources/${BPN}/${SHRT_VER}/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "48db927c6e7ee1d5395f953a8c184c98"
-SRC_URI[sha256sum] = "346f645c0fdef900642f6e9a2c18e7ba9a7ca9bc62fe2b08eb418f065a425c89"
-
-inherit autotools pkgconfig gsettings
-
-do_configure_prepend() {
-    sed -i -e "s: help: :g" ${S}/Makefile.am
-}
-
-PNBLACKLIST[gcalctool] ?= "broken at least since April 2013 http://permalink.gmane.org/gmane.comp.handhelds.openembedded/57920 and nobody complained, it's also replaced by gnome calculator - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
deleted file mode 100644
index 64785ca1c..000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ /dev/null
@@ -1,108 +0,0 @@
-SUMMARY = "Graphical login manager"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
-
-PR = "r18"
-
-inherit gnome update-rc.d systemd useradd
-
-SRC_URI += " \
-    file://cross-xdetection.diff \
-    file://0001-Remove-user-switch-applet.patch \
-    file://0002-gdm-user-manager.c-avoid-displaying-system-users-in-.patch \
-    file://sysrooted-pkg-config.patch \
-    file://%gconf-tree.xml \
-    file://gdm \
-    file://gdm.conf \
-    file://gdm-pam \
-    file://Default \
-    file://gdm.service.in \
-"
-
-SRC_URI[archive.md5sum] = "dbe5187a2e17881cc454e313e0ae8d1e"
-SRC_URI[archive.sha256sum] = "034d23af0ea18d86e5543e707212d9297ec7d83f221808968af266dbebc0e703"
-GNOME_COMPRESS_TYPE="bz2"
-
-EXTRA_OECONF = " \
-    --enable-authentication-scheme=shadow \
-    --enable-debug=yes \
-    --with-console-kit \
-    --disable-scrollkeeper \
-"
-
-do_configure_prepend() {
-    sed -i -e "s:\bdocs::g" ${S}/Makefile.am
-    rm -f ${S}/m4/gnome-doc-utils.m4
-}
-
-do_install_prepend() {
-    install -d ${D}/${localstatedir}/lib/gdm/.gconf.mandatory
-    install ${WORKDIR}/%gconf-tree.xml ${D}/${localstatedir}/lib/gdm/.gconf.mandatory/
-}
-
-do_install_append() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/gdm ${D}/${sysconfdir}/init.d/
-
-    install -d ${D}/${sysconfdir}/gdm
-    install -m 0644 ${WORKDIR}/gdm.conf ${D}/${sysconfdir}/gdm/
-
-    install -d ${D}/${sysconfdir}/pam.d
-    install -m 0755 ${WORKDIR}/gdm-pam       ${D}/${sysconfdir}/pam.d/gdm
-    rm -f ${D}/${sysconfdir}/pam.d/gdm-autologin
-
-    install -d ${D}/${sysconfdir}/gdm/Init
-    install -m 0755 ${WORKDIR}/Default ${D}/${sysconfdir}/gdm/Init
-
-    install -d ${D}${systemd_unitdir}/system
-    sed -e 's,%sbindir%,${sbindir},g' \
-        < ${WORKDIR}/gdm.service.in \
-        > ${D}${systemd_unitdir}/system/gdm.service
-
-    chown -R gdm:gdm ${D}${localstatedir}/lib/gdm
-    chmod 0750 ${D}${localstatedir}/lib/gdm
-
-    rm -rf "${D}${localstatedir}/run"
-    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
-
-    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/at-spi-registryd-wrapper.desktop
-    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/orca-screen-reader.desktop
-    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/gnome-mag.desktop
-    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/gok.desktop
-    rm -f ${D}${datadir}/gdm/autostart/LoginWindow/metacity.desktop
-}
-
-FILES_${PN} += "${datadir}/icon* \
-    ${datadir}/xsession* \
-"
-
-RDEPENDS_${PN} += "grep dbus-x11 shadow"
-# "libpam-base-files"
-CONFFILES_${PN} += "${sysconfdir}/gdm/gdm.conf ${sysconfdir}/init.d/gdm"
-RRECOMMENDS_${PN} += "openssh-misc desktop-file-utils glib-2.0-utils metacity gnome-session polkit-gnome consolekit"
-
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "gdm.service"
-
-INITSCRIPT_NAME = "gdm"
-INITSCRIPT_PARAMS = "start 99 5 . stop 20 0 1 2 3 6 ."
-
-USERADD_PACKAGES = "${PN}"
-USERADD_PARAM_${PN} = "--system --no-create-home --home ${localstatedir}/lib/gdm --user-group gdm"
-
-pkg_postinst_${PN} () {
-# Register up as default dm
-mkdir -p $D${sysconfdir}/X11/
-echo "${bindir}/gdm" > $D${sysconfdir}/X11/default-display-manager
-}
-
-pkg_postrm_${PN} () {
-    deluser gdm || true
-    delgroup gdm || true
-    sed -i /gdm/d ${sysconfdir}/X11/default-display-manager || true
-}
-
-PNBLACKLIST[gdm] ?= "Depends on broken gnome-panel - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
deleted file mode 100644
index 235b02a2f..000000000
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Gnome background images"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SECTION = "x11/gnome"
-
-# glib-2.0 for glib-gettext.m4 which provides AM_GLIB_GNU_GETTEXT
-# intltool-native for IT_PROG_INTLTOOL(0.35.0)
-DEPENDS = "glib-2.0 intltool-native"
-
-inherit gnomebase
-
-SRC_URI[archive.md5sum] = "3df26626483b02e51adefc6ab5945a8d"
-SRC_URI[archive.sha256sum] = "4d7b60b5ba768bf8834b5fa3a3471cd9a9e14b5884bc210dc2d3cdbf1faddcef"
-GNOME_COMPRESS_TYPE="bz2"
-
-FILES_${PN} += "${datadir}/gnome-background-properties"
-
-
-PNBLACKLIST[gnome-backgrounds] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130647/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
deleted file mode 100644
index 201783e91..000000000
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "GNOME control center"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "desktop-file-utils-native gnome-menus libunique dbus-glib gnome-desktop libxml2 metacity gconf gnome-settings-daemon librsvg pango libgnomekbd libxklavier libcanberra libgtop libxscrnsaver"
-
-PR = "r1"
-
-inherit gnome
-
-SRC_URI[archive.md5sum] = "b4e8ab5c7556ae07addbfcfb4fa2f761"
-SRC_URI[archive.sha256sum] = "7c568b57358e5c08f4d8dd76dbac7df2539135ad081872b60514b7a8ac797e66"
-GNOME_COMPRESS_TYPE="bz2"
-
-LDFLAGS += "-lgthread-2.0 -lxml2"
-
-do_configure_prepend() {
-    sed -i s:help::g ${S}/Makefile.am
-    rm -f ${S}/m4/gnome-doc-utils.m4
-}
-do_install_append() {
-    rm -rf ${D}${datadir}/mime
-}
-
-FILES_${PN} += "${datadir}/icon* \
-                ${datadir}/xsession* \
-                ${libdir}/window-manager-settings/*.so \
-                ${datadir}/gnome \
-                ${datadir}/desktop-directories \
-"
-FILES_${PN}-dbg += "${libdir}/window-manager-settings/.debug"
-FILES_${PN}-dev += "${libdir}/window-manager-settings/*.la"
-FILES_${PN}-staticdev += "${libdir}/window-manager-settings/*.a"
-
-PNBLACKLIST[gnome-control-center] ?= "Depends on broken gnome-menus - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
deleted file mode 100644
index f1dafad2e..000000000
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "GNOME library for reading .desktop files"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-PR = "r6"
-
-inherit gnome pkgconfig
-
-SRC_URI[archive.md5sum] = "5c80d628a240eb9d9ff78913b31f2f67"
-SRC_URI[archive.sha256sum] = "55cbecf67efe1fa1e57ac966520a7c46d799c8ba3c652a1219f60cafccb3739d"
-GNOME_COMPRESS_TYPE="bz2"
-
-DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup-notification intltool-native gnome-common-native"
-
-EXTRA_OECONF = "--disable-scrollkeeper --disable-desktop-docs --disable-gnome-about"
-
-do_configure_prepend () {
-    sed -i -e s:^#!@PYTHON@:#!${bindir}/python: ${S}/gnome-about/gnome-about.in
-    rm -f ${S}/m4/gnome-doc-utils.m4
-}
-
-PACKAGES =+ "libgnome-desktop"
-FILES_libgnome-desktop = "${libdir}/lib*${SOLIBS} ${datadir}/libgnome-desktop/pnp.ids"
-FILES_${PN} += "${datadir}/gnome-about"
-
-PNBLACKLIST[gnome-desktop] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130595/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
deleted file mode 100644
index 55a589c3f..000000000
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "GNOME disk utility"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
-
-DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui \
-    virtual/libx11 libatasmart gnome-doc-utils intltool-native \
-    gnome-common-native libgnome-keyring dbus-glib-native \
-"
-
-PR = "r4"
-
-inherit gnomebase gtk-icon-cache distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
-SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d962652f4de6a98"
-GNOME_COMPRESS_TYPE="bz2"
-
-SRC_URI += "\
-    file://disable-scrollkeeper.patch \
-    file://fix-dbus-interfaces.patch \
-    file://sysrooted-pkg-config.patch \
-    file://0001-Add-support-for-DeviceAutomountHint.patch \
-    file://0002-Require-libnotify-0.6.1.patch \
-"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
-
-do_configure_prepend() {
-    sed -i -e "s: help : :g" ${S}/Makefile.am
-}
-
-PACKAGES =+ "${PN}-nautilus-extension ${PN}-libs"
-FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
-FILES_${PN}-libs += "${libdir}/libgdu*.so.*"
-FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
-FILES_${PN}-dbg += "${libdir}/nautilus/extensions-2.0/.debug"
-
-PNBLACKLIST[gnome-disk-utility] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132824/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
deleted file mode 100644
index 4ac75cbef..000000000
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "Password and keyring managing daemon"
-HOMEPAGE = "http://www.gnome.org/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://gcr/gcr.h;endline=22;md5=a272df1e633e27ecf35e74fb5576250e \
-                    file://egg/egg-dbus.h;endline=25;md5=eb6f531af37165dc53420c073d774e61 \
-                    file://gp11/gp11.h;endline=24;md5=bd8c7a8a21d6c28d40536d96a35e3469 \
-                    file://pkcs11/pkcs11i.h;endline=24;md5=e72cfbb718389b76a4dae838d1c1f439"
-
-SECTION = "x11/gnome"
-
-PR = "r12"
-
-inherit autotools gnome gtk-doc pkgconfig gsettings
-
-SRC_URI += "file://egg-asn1x.patch"
-
-DEPENDS = "gtk+ libgcrypt libtasn1 libtasn1-native gconf ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)} intltool-native"
-RDEPENDS_${PN} = "libgnome-keyring glib-2.0-utils"
-
-EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-pam-dir=${base_libdir}/security', '--disable-pam', d)}"
-
-SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
-SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
-GNOME_COMPRESS_TYPE="bz2"
-
-FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
-                ${base_libdir}/security/*${SOLIBSDEV} \
-               "
-
-FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
-                    ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
-                    ${libdir}/${BPN}/standalone/*.la \
-                    ${base_libdir}/security/*.la \
-                   "
-
-INSANE_SKIP_${PN}-dev += "dev-elf"
-
-FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
-                    ${libdir}/${BPN}/devel/.debug/ \
-                    ${base_libdir}/security/.debug/"
-
-PNBLACKLIST[gnome-keyring] ?= "This version conflicts with gcr from oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
deleted file mode 100644
index d1c9e4d8f..000000000
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "GNOME menus"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-PR = "r1"
-
-DEPENDS = "python libxml2 gconf popt gtk+ intltool-native"
-
-inherit gnomebase pkgconfig python-dir pythonnative gobject-introspection
-
-SRC_URI[archive.md5sum] = "caa6772e63ed5870cf43dc3d354e0624"
-SRC_URI[archive.sha256sum] = "6dcc565006d6e8c2025ae83ab1f82edf6bd04d61c804c0dc9bf5ea50629c4caa"
-GNOME_COMPRESS_TYPE="bz2"
-
-do_configure_append () {
-
-    # this expands to native-pthon which we don't want.
-    sed -i 's:\@PYTHON\@:/usr/bin/env python:' ${S}/simple-editor/gmenu-simple-editor.in
-
-}
-PACKAGES += "${PN}-python ${PN}-python-staticdev"
-FILES_${PN} += "${datadir}/desktop-directories/"
-FILES_${PN}-python-staticdev = "${PYTHON_SITEPACKAGES_DIR}/gmenu.a ${PYTHON_SITEPACKAGES_DIR}/gmenu.la"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/gmenu.so ${PYTHON_SITEPACKAGES_DIR}/GMenuSimpleEditor "
-FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug \
-                    ${PYTHON_SITEPACKAGES_DIR}/.debug"
-
-# http://errors.yoctoproject.org/Errors/Details/81001/
-PNBLACKLIST[gnome-menus] ?= "BROKEN: fails to build because of python + conflicts with gnome-menu3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
deleted file mode 100644
index d1cfab8fb..000000000
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel3_3.0.2.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-SUMMARY = "GNOME panel"
-LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"
-
-BPN = "gnome-panel"
-PR = "r1"
-
-PNBLACKLIST[gnome-panel3] ?= "CONFLICT: depends on libgweather3 which conflicts with libgweather - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-# conflicts with gnome-panel, because they provide the same package
-# http://patches.openembedded.org/patch/43105/
-EXCLUDE_FROM_WORLD = "1"
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING-DOCS;md5=c9211dab3ae61e580f48432020784324 \
-                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-SECTION = "x11/gnome"
-
-DEPENDS = "gnome-doc-utils-native gtk+3 dconf gconf glib-2.0 gnome-desktop3 gtk+ pango libwnck3 gnome-menus cairo libgweather3 dbus-glib librsvg libcanberra"
-
-inherit gtk-doc gnome gettext pkgconfig
-
-SRC_URI += "file://as-needed.patch "
-
-SRC_URI[archive.md5sum] = "0f2f644dc4081b72f6df7a65282af7c6"
-SRC_URI[archive.sha256sum] = "25db8ec026c4bf47f0ef5cc7e2712f2aad175bd7fb8e4952ef5f8b200f17f196"
-
-EXTRA_OECONF = "--disable-scrollkeeper --disable-eds --enable-bonobo=no --with-in-process-applets=none"
-
-do_configure_prepend() {
-    gnome-doc-prepare --automake
-    sed -i -e s:help:: ${S}/Makefile.am
-}
-
-pkg_postinst_${PN}_append () {
-    gconftool-2 --config-source=xml:readwrite:/etc/gconf/gconf.xml.defaults \
-        --direct --load /etc/gconf/schemas/panel-default-setup.entries
-}
-
-PACKAGES =+ "libpanel-applet"
-FILES_libpanel-applet = "${libdir}/libpanel-applet-3.so.*"
-
-FILES_${PN} =+ "${datadir}/gnome* \
-                ${datadir}/dbus-1 \
-                ${datadir}/icons \
-                ${datadir}/PolicyKit \
-                ${libdir}/bonobo \
-"
-
-PNBLACKLIST[gnome-panel3] ?= "Depends on broken gnome-menus - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
deleted file mode 100644
index 7cb8b9ddf..000000000
--- a/meta-gnome/recipes-gnome/gnome-panel/gnome-panel_2.32.1.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "GNOME panel"
-LICENSE = "GPL-2.0 & LGPL-2.0 & GFDL-1.1"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://COPYING-DOCS;md5=c9211dab3ae61e580f48432020784324 \
-                    file://COPYING.LIB;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-SECTION = "x11/gnome"
-
-PR = "r7"
-
-DEPENDS = "gnome-doc-utils gconf glib-2.0 gnome-desktop gtk+ \
-    pango libwnck gnome-menus cairo libgweather dbus dbus-glib \
-    librsvg libcanberra \
-"
-RDEPENDS_${PN} = "python"
-
-inherit gtk-doc gnome autotools-brokensep gettext pkgconfig gconf gobject-introspection
-
-SRCREV = "8292bd2b8a36df7eed3c760899400790cde68590"
-SRC_URI = "git://git.gnome.org/gnome-panel;branch=gnome-2-32 \
-           file://0001-Fix-build-with-gcc-5.patch \
-           file://0001-Add-gnome-doc-utils.make.patch \
-"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECONF = "--disable-scrollkeeper --disable-eds --enable-bonobo=no --with-in-process-applets=none"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[networkmanager] = "--enable-network-manager,--disable-network-manager,networkmanager"
-
-do_configure_prepend() {
-    sed -i -e s:help:: ${S}/Makefile.am
-    sed -i -e s:^#!@PYTHON@:#!/usr/bin/python: ${S}/gnome-panel/gnome-panel-add.in
-}
-
-PACKAGES =+ "libpanel-applet"
-FILES_libpanel-applet = "${libdir}/libpanel-applet-*.so.*"
-
-FILES_${PN} =+ "${datadir}/gnome* \
-                ${datadir}/dbus-1 \
-                ${datadir}/icons \
-                ${datadir}/PolicyKit \
-                ${libdir}/bonobo \
-"
-
-PNBLACKLIST[gnome-panel] ?= "Depends on broken libgweather - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
deleted file mode 100644
index ec2110785..000000000
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-SUMMARY = "Power management daemon"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-PR = "r4"
-
-DEPENDS = "glib-2.0 gtk+ gconf libgnome-keyring dbus dbus-glib libnotify libwnck cairo libunique xrandr virtual/libx11 libxrender libcanberra upower gnome-doc-utils"
-RRECOMMENDS_${PN} += "gnome-keyring"
-
-inherit gnome
-
-SRC_URI += " \
-    file://sysrooted-pkg-config.patch \
-    file://0001-Makefile.am-don-t-build-help-man.patch \
-"
-
-SRC_URI[archive.md5sum] = "9a08e85dce3ffb90775f15e3bda4adda"
-SRC_URI[archive.sha256sum] = "17fa301bf7e133285c0e054ae3be2b0f690c48f59b09f67e04d6ed339b330476"
-GNOME_COMPRESS_TYPE="bz2"
-
-EXTRA_OECONF = " --disable-scrollkeeper \
-                 --disable-applets \
-                 --x-includes=${STAGING_INCDIR} \
-                 --x-libraries=${STAGING_LIBDIR} \
-                 --enable-compile-warnings=no \
-                 ac_cv_header_X11_extensions_dpms_h=yes \
-"
-
-do_configure_append() {
-    # Sigh... --enable-compile-warnings=no doesn't actually turn off -Werror
-    for i in $(find ${B} -name "Makefile") ; do
-        sed -i -e s:-Werror::g $i
-    done
-    sed -e "s/libtool --/${TARGET_SYS}-libtool --/" -i ${B}/src/Makefile
-}
-
-PACKAGES =+ "${PN}-applets"
-
-FILES_${PN}-applets = "${bindir}/*applet* \
-    ${libdir}/bonobo/servers \
-    ${datadir}/gnome-2.0/ui \
-"
-
-FILES_${PN} += "${datadir}/icons \
-    ${datadir}/dbus-1 \
-    ${datadir}/gnome/autostart \
-"
-
-FILES_${PN}-doc += "${datadir}/omf \
-    ${datadir}/gnome/help \
-"
-
-# gnome-power-manager-2.32.0/src/gpm-manager.c:488:18: error: too many arguments to function 'notify_notification_new'
-PNBLACKLIST[gnome-power-manager] ?= "BROKEN: not compatible with current libnotify - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
deleted file mode 100644
index c49f2d3fb..000000000
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Gnome session manager"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-PR = "r3"
-
-SECTION = "x11/gnome"
-DEPENDS = "libxtst gtk+ glib-2.0 upower dbus-glib gconf pango gdk-pixbuf-native startup-notification"
-
-inherit gnome
-
-SRC_URI += "file://use_G_GINT64_FORMAT.patch"
-
-SRC_URI[archive.md5sum] = "222bad6b446cb19a6b9028ea24538002"
-SRC_URI[archive.sha256sum] = "22d93ce433fcf9c7ce6b5f36dd81f64e692ea0e41faaa0f61159ddac28c3686a"
-GNOME_COMPRESS_TYPE="bz2"
-
-EXTRA_OECONF = " --with-gtk=2.0 ac_cv_path_GCONF_SANITY_CHECK=set --disable-docbook-docs"
-
-do_configure_append() {
-    for i in $(find ${S} -name "Makefile") ; do
-        sed -i -e s:"GCONFTOOL = .*/usr/bin/gconftool-2":"GCONFTOOL = /usr/bin/gconftool-2":g $i
-        sed -i -e s:"GCONF_SANITY_CHECK = set":"GCONF_SANITY_CHECK = /usr/libexec/gconf-sanity-check-2":g $i
-    done
-}
-
-RRECOMMENDS_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-ck-connector', '', d)}"
-FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${datadir}/gnome ${libdir}/gnome-session/helpers"
-FILES_${PN}-dbg += "${libexecdir}/gnome-session/helpers/.debug"
-
-# http://errors.yoctoproject.org/Errors/Details/68621/
-PNBLACKLIST[gnome-session] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
deleted file mode 100644
index 9a1897240..000000000
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "GNOME settings daemon"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PR = "r7"
-
-DEPENDS = "intltool libxxf86misc libsndfile1 libxtst glib-2.0 polkit gtk+ gconf dbus-glib libnotify libgnomekbd libxklavier gnome-doc-utils gnome-desktop"
-
-inherit gnome
-
-SRC_URI = " \
-    git://git.gnome.org/gnome-settings-daemon;branch=gnome-2-32 \
-    file://0001-Require-libnotify-0.6.0.patch \
-"
-SRCREV = "0160f6725cfb872e017f3958f108792c3b882872"
-
-S = "${WORKDIR}/git"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio', d)}"
-PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio glib-2.0 libcanberra"
-PACKAGECONFIG[smartcard] = "--enable-smartcard-support,--disable-smartcard-support,nss"
-
-EXTRA_OECONF = " \
-    --x-includes=${STAGING_INCDIR} \
-    --x-libraries=${STAGING_LIBDIR} \
-    --enable-polkit \
-"
-
-do_configure_prepend() {
-    sed -i -e 's:-L$libdir::g' -e 's:-I$includedir::g' ${S}/configure.ac
-}
-
-FILES_${PN} += "${libdir}/gnome-settings-daemon-2.0/*.so ${libdir}/gnome-settings-daemon-2.0/*plugin \
-                ${datadir}/dbus-1/ \
-                ${datadir}/icon* \
-                ${datadir}/gnome-control-center \
-                ${datadir}/xsession*"
-
-FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
-FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.la"
-FILES_${PN}-staticdev += "${libdir}/gnome-settings-daemon-2.0/*.a"
-
-PNBLACKLIST[gnome-settings-daemon] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
deleted file mode 100644
index 4b397bf83..000000000
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Gnome system monitor"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-SECTION = "x11/gnome"
-PR = "r2"
-
-DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils libwnck gtk+ dbus-glib librsvg intltool-native gnome-common-native"
-
-inherit gnome
-SRC_URI[archive.md5sum] = "3f0bca9b0ebc7a365466851cd580d167"
-SRC_URI[archive.sha256sum] = "b628edfd39e3a6b374ce133f367d3568475eb4e981a367f4f9d62a9784e5ae59"
-GNOME_COMPRESS_TYPE="bz2"
-SRC_URI += " \
-    file://0001-Fix-glib-includes.patch \
-    file://0002-src-procman.cpp-include-main-gtkmm.h.patch \
-    file://Remove-pkg-config-check-for-gnome-icon-theme.patch \
-"
-
-do_configure_prepend() {
-    sed -i -e s:help::g ${S}/Makefile.am
-}
-
-CXXFLAGS += "--std=c++11"
-
-RRECOMMENDS_${PN} = "adwaita-icon-theme"
-
-FILES_${PN} += "${datadir}/icons \
-                ${datadir}/dbus-1 \
-                ${datadir}/gnome/autostart \
-"
-
-FILES_${PN}-doc += "${datadir}/omf \
-                    ${datadir}/gnome/help "
-
-PNBLACKLIST[gnome-system-monitor] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131635/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
deleted file mode 100644
index 6b3bf7654..000000000
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY = "GNOME Terminal"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5b51eba4ba4cafe64073227530c061ed"
-DEPENDS = "gtk+ glib-2.0 startup-notification dbus-glib vte9 gnome-doc-utils intltool-native"
-PR = "r1"
-
-inherit gnome
-
-SRC_URI += " \
-    file://0001-Makefile.am-do-not-build-help.patch \
-"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-SRC_URI[archive.md5sum] = "74c4528f00067072c2bd867d1f8fe844"
-SRC_URI[archive.sha256sum] = "2c7af2250698b9f9f53c6eaa93211c1118cf2c7e29cbbacfd1e8a6a10069e07a"
-GNOME_COMPRESS_TYPE="bz2"
-
-RRECOMMENDS_${PN} += "gnome-common-schemas"
-
-# http://errors.yoctoproject.org/Errors/Details/68636/
-PNBLACKLIST[gnome-terminal] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
deleted file mode 100644
index 3480712b5..000000000
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION="Gnome Cups Manager"
-LICENSE="GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS="glib-2.0 gtk+ pango cups intltool libgnomeui"
-
-PR = "r2"
-
-inherit gnomebase pkgconfig
-
-do_compile_append () {
-    cp libgnomecups-1.0.pc libgnomecups-1.0.pc.old
-    sed 's:${STAGING_DIR_HOST}::' < libgnomecups-1.0.pc.old > libgnomecups-1.0.pc
-}
-
-SRC_URI += "\
-    file://libgnomecups-0.2.3-glib.h.patch \
-    file://libgnomecups-0.2.3-cups-1.6.patch \
-"
-
-SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b"
-SRC_URI[archive.sha256sum] = "e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29"
-GNOME_COMPRESS_TYPE="bz2"
-
-PNBLACKLIST[libgnomecups] ?= "Depends on blacklisted libgnomeui - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
deleted file mode 100644
index a462a4b9e..000000000
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-LICENSE = "GPLv2"
-SECTION = "x11/gnome/libs"
-
-DEPENDS = "bison-native flex-native libxml2 libgnomecups glib-2.0 pango libart-lgpl fontconfig popt gnome-common freetype"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit gnomebase
-
-SRC_URI += "file://fix.includes.patch \
-            file://freetype.patch \
-            file://0001-configure-use-pkgconfig-for-freetype.patch \
-            file://bison3-support.patch \
-           "
-SRC_URI[archive.md5sum] = "63b05ffb5386e131487c6af30f4c56ac"
-SRC_URI[archive.sha256sum] = "1034ec8651051f84d2424e7a1da61c530422cc20ce5b2d9e107e1e46778d9691"
-GNOME_COMPRESS_TYPE="bz2"
-
-FILES_${PN}-dbg += "\
-    ${libdir}/${PN}/${PV}/modules/.debug \
-    ${libdir}/${PN}/${PV}/modules/*/.debug \
-"
-FILES_${PN}-staticdev += "\
-    ${libdir}/${PN}/${PV}/modules/*.a \
-    ${libdir}/${PN}/${PV}/modules/*/*.a \
-"
-
-PNBLACKLIST[libgnomeprint] ?= "Depends on broken libgnomecups - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb b/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
deleted file mode 100644
index 49d0fe9d4..000000000
--- a/meta-gnome/recipes-gnome/gnumeric/gnumeric_1.12.0.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-LICENSE = "GPLv2 | GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=be0de417af78dd340558810d1ced52e6"
-SECTION = "x11/utils"
-S = "${WORKDIR}/gnumeric-${PV}"
-DEPENDS = "gdk-pixbuf libgsf gtk+3 libxml2 libglade libart-lgpl intltool-native libgnomecanvas libgnomeprint libbonoboui orbit2-native goffice"
-SUMMARY = "Gnumeric spreadsheet for GNOME"
-
-GNOME_COMPRESS_TYPE = "xz"
-
-inherit gnome pythonnative gobject-introspection
-
-SRC_URI += "file://do-not-use-srcdir.patch \
-            file://0001-configure.in-drop-introspection-macros-replace-them-.patch"
-
-SRC_URI[archive.md5sum] = "3fd87cca95334b5d8ac922989670fe27"
-SRC_URI[archive.sha256sum] = "037b53d909e5d1454b2afda8c4fb1e7838e260343e36d4e36245f4a5d0e04111"
-
-
-EXTRA_OECONF=" --without-perl "
-
-PACKAGES_DYNAMIC += "gnumeric-plugin-*"
-PACKAGES += "libspreadsheet libspreadsheet-dev gnumeric-goffice gnumeric-goffice-dbg"
-
-FILES_${PN}-dbg += "${libdir}/gnumeric/${PV}/plugins/*/.debug"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
-FILES_${PN}-staticdev = "${libdir}/libspreadsheet.la"
-FILES_libspreadsheet = "${libdir}/libspreadsheet-${PV}.so"
-FILES_libspreadsheet-dev = "${libdir}/libspreadsheet.so"
-FILES_gnumeric-goffice-dbg += "${libdir}/goffice/*/plugins/gnumeric/.debug"
-FILES_gnumeric-goffice = "${libdir}/goffice/*/plugins/gnumeric/*"
-
-# This hack works around the problem mentioned here:
-# https://mail.gnome.org/archives/gnumeric-list/2010-February/msg00006.html
-do_install_prepend() {
-    sed -i ${B}/doc/C/Makefile -e 's/\tfor file in $(omffile); do/\t-for file in $(omffile); do/'
-}
-
-python populate_packages_prepend () {
-    gnumeric_libdir = bb.data.expand('${libdir}/gnumeric/${PV}/plugins', d)
-
-    do_split_packages(d, gnumeric_libdir, '^(.*)/.*$',
-        output_pattern='gnumeric-plugin-%s',
-        description='Gnumeric plugin %s',
-        extra_depends='',
-        recursive=True,
-        prepend=True)
-}
-
-PNBLACKLIST[gnumeric] ?= "Depends on broken libgnomeprint - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
deleted file mode 100644
index 62d3df98e..000000000
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "gThumb is an image viewer and browser for the GNOME Desktop"
-SECTION = "x11/gnome"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "gnome-common-native glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base intltool-native gconf-native"
-
-PR = "r4"
-
-EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
-
-inherit gnome pkgconfig
-
-SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
-SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
-GNOME_COMPRESS_TYPE="bz2"
-
-SRC_URI += "file://parallel.patch \
-            file://0001-Drop-help-directory-from-build.patch"
-
-do_configure_prepend () {
-    rm -f ${S}/m4/gnome-doc-utils.m4
-}
-
-do_install_append () {
-    rm -f ${D}${libdir}/${BPN}/extensions/*.a
-}
-
-FILES_${PN} += "${datadir}/icons"
-FILES_${PN} += "${libdir}/${BPN}/extensions/*.so \
-                ${libdir}/${BPN}/extensions/*.extension"
-FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
-FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
-
-
-PNBLACKLIST[gthumb] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb b/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
deleted file mode 100644
index 6920f0aa2..000000000
--- a/meta-gnome/recipes-gnome/gweather/libgweather3_3.0.2.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SECTION = "x11/gnome/libs"
-DEPENDS = "libxml2 gconf libsoup-2.4 gtk+3"
-
-PNBLACKLIST[libgweather3] ?= "CONFLICT: 876 files are conflicting with libgweather - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-# e.g. sysroots/qemux86-64/usr/share/libgweather/locations.dtd
-#      sysroots/qemux86-64/usr/share/libgweather/Locations.zh_TW.xml
-
-BPN = "libgweather"
-
-inherit gnome
-SRC_URI[archive.md5sum] = "f1a96c6f19c9a0bc6b4e12acc9a8a85d"
-SRC_URI[archive.sha256sum] = "9041526fa0466b99dae5cf06c2cc70376f25531eec5d58b1e1378acfb302410c"
-
-do_configure_prepend() {
-    sed -i -e 's: doc : :g' ${S}/Makefile.am
-}
-
-FILES_${PN} += "${datadir}/gnome* \
-                ${datadir}/icons"
-
-PACKAGES =+ "${PN}-locationdata"
-FILES_${PN}-locationdata = "${datadir}/libgweather/*ocations*"
-
-
-
diff --git a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
deleted file mode 100644
index 8b69f1fe7..000000000
--- a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-SECTION = "x11/gnome/libs"
-DEPENDS = "libxml2 gconf libsoup-2.4 gtk+ libgnome-keyring"
-
-inherit gnome
-
-SRC_URI[archive.md5sum] = "bf6a0a05051341ecb250f332e3edfb88"
-SRC_URI[archive.sha256sum] = "b835374661423f37c46aa8e37368ae24a68856f117b7c21e475a21efdba5264c"
-GNOME_COMPRESS_TYPE="bz2"
-
-do_configure_prepend() {
-    sed -i -e 's: doc : :g' ${S}/Makefile.am
-}
-
-FILES_${PN} += "${datadir}/gnome* \
-                ${datadir}/icons"
-
-PACKAGES =+ "${PN}-locationdata"
-FILES_${PN}-locationdata = "${datadir}/libgweather/Locations*"
-
-# http://errors.yoctoproject.org/Errors/Details/68608/
-PNBLACKLIST[libgweather] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
deleted file mode 100644
index 5580f93a5..000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-# nautilus OE build file
-# Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-LICENSE="GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426 \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-PR = "r4"
-
-DEPENDS = "libnotify gtk+3 libunique gvfs librsvg libexif gnome-desktop3"
-# optional: tracker
-
-# to include nautilus3/no-try-run-strftime.diff before the rest
-FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"
-BPN = "nautilus"
-inherit gnome
-
-SRC_URI += "file://no-try-run-strftime.diff"
-SRC_URI[archive.md5sum] = "12314328b59aa1dfd83619f718b81bd5"
-SRC_URI[archive.sha256sum] = "c482d6e7babcc238304cf55586cdf7e2b2806025214a143ed355f0d89b33b154"
-
-EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb --enable-nst-extension"
-export SYSROOT = "${STAGING_DIR_HOST}"
-
-do_configure() {
-    sed -i -e /docs/d ${S}/Makefile.am
-    autotools_do_configure
-}
-
-RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash glib-2.0-utils"
-FILES_${PN} += "${datadir}/icons \
-                /usr/libexec/ \
-                ${datadir}/nautilus* \
-                ${datadir}/dbus-1 \
-                ${libdir}/nautilus/extensions*/*.so \
-"
-FILES_${PN}-dbg += "/usr/libexec/.debug \
-    ${libdir}/nautilus/extensions*/.debug"
-
-# Don't make nautils drag us in
-PRIVATE_LIBS = "libnautilus-extension.so.1"
-
-pkg_postinst_${PN} () {
-if [ -n "$D" ]; then
-    exit 1
-fi
-
-glib-compile-schemas ${datadir}/glib-2.0/schemas
-}
-
-# 3.2.1-r4/nautilus-3.2.1/eel/eel-gnome-extensions.c:34:50: fatal error: libgnome-desktop/gnome-desktop-utils.h: No such file or directory
-# 3.2.1-r4/nautilus-3.2.1/eel/eel-editable-label.c:3105:55: error: 'GTK_STOCK_CUT' undeclared (first use in this function)
-PNBLACKLIST[nautilus3] ?= "BROKEN: fails to build, maybe missing dependency on gnome-desktop-utils.h provider - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
deleted file mode 100644
index caf7f57b1..000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-# nautilus OE build file
-# Copyright (C) 2005, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-LICENSE="GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7c0048536e43642a1f3a724c2909872b \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-PR = "r6"
-
-DEPENDS = "gdk-pixbuf gtk+ libunique gvfs librsvg libexif esound gnome-desktop orbit2-native"
-# optional: tracker
-
-inherit gnome gobject-introspection
-
-SRC_URI[archive.md5sum] = "51565aa10d1625dff56e381228346911"
-SRC_URI[archive.sha256sum] = "2d4ff28c7a7aa5d40eb2468149954a564c257a305183773057584d22d15347a2"
-GNOME_COMPRESS_TYPE="bz2"
-
-SRC_URI += "file://idl-sysroot.patch \
-            file://no-try-run-strftime.diff \
-            file://no-G_DISABLE_DEPRECATED.patch \
-"
-
-
-EXTRA_OECONF = " --disable-gtk-doc  --disable-update-mimedb "
-export SYSROOT = "${STAGING_DIR_HOST}"
-
-do_configure() {
-    sed -i -e /docs/d ${S}/Makefile.am
-    autotools_do_configure
-    # We need native orbit-idl with target idl files. No way to say it in a clean way:
-    find ${B} -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
-}
-
-RDEPENDS_${PN} = "gvfs gvfsd-ftp gvfsd-sftp gvfsd-trash glib-networking"
-FILES_${PN} += "${datadir}/icons"
-
-# Don't make nautils3 drag us in
-PRIVATE_LIBS = "libnautilus-extension.so.1"
-
-
-PNBLACKLIST[nautilus] ?= "Depends on blacklisted gnome-desktop - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb b/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
deleted file mode 100644
index 516cf93e4..000000000
--- a/meta-gnome/recipes-gnome/pimlico/contacts_0.9.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require contacts.inc
-
-PR = "r8"
-
-SRC_URI =+ "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "aab5affbf93d6fa7b978b323a8d44de0"
-SRC_URI[sha256sum] = "9cacec98f8123993033aaa255f3f4c04c86a1be65e487dd21f0aaa54384a6f6d"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/contacts-main.h;endline=18;md5=0371af46fbc72e33575e0072dca5fb19 \
-                    file://src/contacts-dbus.c;endline=18;md5=e4da9ac1a0539fafc7df431010904fd5 \
-                    file://src/contacts-gtk.c;endline=21;md5=1c2e3f55b215635eff4ba76f7696f8ee"
-
-do_configure_prepend () {
-    # It used 8 spaces to instead of a tab, but it doesn't work for us
-    sed -i 's/^        $(MAKE) dist distdir=/\t$(MAKE) dist distdir/' Makefile.am
-}
-
-PNBLACKLIST[contacts] ?= "Fails to fetch, pimlico-project.org is gone http://errors.yoctoproject.org/Errors/Details/132854/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb b/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
deleted file mode 100644
index b46e9d9db..000000000
--- a/meta-gnome/recipes-gnome/pimlico/contacts_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require contacts.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/contacts-main.h;endline=20;md5=9dc3531c914fb6d6d4a8d1aee4519fef \
-                    file://src/contacts-dbus.c;endline=20;md5=95e02d77f155fbd07a14dba3348b9b03 \
-                    file://src/contacts-gtk.c;endline=23;md5=e1ee9b9e72045f2d3aa44cf17313b46e"
-
-SRCREV = "19853893fdb595de6aa59db0d9dc2f9451ed2933"
-PV = "0.12+git${SRCPV}"
-PR = "r4"
-
-S = "${WORKDIR}/git"
-
-SRC_URI =+ "git://git.gnome.org/${BPN} \
-        file://make-382.patch"
-
-S = "${WORKDIR}/git"
-
-PNBLACKLIST[contacts] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/132826/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb b/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
deleted file mode 100644
index 42c20c47e..000000000
--- a/meta-gnome/recipes-gnome/pimlico/tasks_0.19.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require tasks.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/gtk/main.c;endline=19;md5=8659d0b7fd68a2ad6ac30c6539ea5b82 \
-                    file://src/omoko/openmoko-tasks.c;endline=20;md5=04d56a46863c9f4247694f40257a836a \
-                    file://src/hildon/hildon-tasks.c;endline=21;md5=488ddf31dc14b2196dec7cc736211b52"
-
-SRC_URI = "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "0afd969758561599fd782e1effb39c08"
-SRC_URI[sha256sum] = "1a7fdc5f95a2193a1a25fdb13f071867fb7e42245ce19ccee4bcccb69e557f2e"
-
-PR = "r3"
-
-# tasks-0.19/libkoto/koto-utils.c:81:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-PNBLACKLIST[tasks] ?= "Fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb b/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
deleted file mode 100644
index b71f1dc5b..000000000
--- a/meta-gnome/recipes-gnome/pimlico/tasks_git.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require tasks.inc
-
-SRC_URI = "git://git.gnome.org/${BPN}"
-
-SRCREV = "ea52d46d691c5fce4473ea4e24a35411381f3a65"
-PV = "0.13+git${SRCPV}"
-PR = "r3"
-
-S = "${WORKDIR}/git"
-
-# ../../git/libkoto/koto-utils.c:81:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-PNBLACKLIST[tasks] ?= "Fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb b/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
deleted file mode 100644
index 862c0ea30..000000000
--- a/meta-gnome/recipes-gnome/system-tools/system-tools-backends_2.10.2.bb
+++ /dev/null
@@ -1,54 +0,0 @@
-SUMMARY = "gnome system tools backends"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-DEPENDS = "dbus dbus-glib glib-2.0 polkit"
-
-inherit gnome pkgconfig update-rc.d gettext
-
-SRC_URI[archive.md5sum] = "edae148b31342aecae035051adc70c74"
-SRC_URI[archive.sha256sum] = "1dbe5177df46a9c7250735e05e77129fe7ec04840771accfa87690111ca2c670"
-
-SRC_URI += " \
-            file://system-tools-backends \
-"
-
-# This needs to move to meta-angstrom
-SRC_URI_append_angstrom = " \
-            file://add-angstrom-distro.patch \
-"
-
-EXTRA_OECONF = " --with-net-dbus=${libdir}/perl5 "
-
-do_configure() {
-    rm missing || true
-    automake --add-missing
-    sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.am
-    sed -i -e 's:CC=$(CC):CC="$(CC)":g' ${S}/Net-DBus/Makefile.in
-    libtoolize --force --install
-    aclocal
-    gnu-configize
-    oe_runconf
-    cp ${STAGING_BINDIR_CROSS}/${HOST_SYS}-libtool ${S}
-}
-
-do_install_append () {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/system-tools-backends ${D}/${sysconfdir}/init.d/
-}
-
-INITSCRIPT_NAME = "system-tools-backends"
-INITSCRIPT_PARAMS = "start 50 2 3 4 5 . stop 70 1 ."
-
-# Shadow added so there is a full adduser/deluser
-# (Gnome images tend to pull in shadow anyway)
-RDEPENDS_${PN} = "shadow"
-
-FILES_${PN} += " ${sysconfdir}/dbus-1/system.d"
-FILES_${PN} += " ${libdir}/pkgconfig"
-FILES_${PN} += " ${datadir}/dbus-1/system-services"
-FILES_${PN} += " ${datadir}/system-tools-backends-2.0/files"
-FILES_${PN} += " ${datadir}/system-tools-backends-2.0/scripts"
-FILES_${PN} += " ${datadir}/polkit*"
-
-PNBLACKLIST[system-tools-backends] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb b/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
deleted file mode 100644
index bd9f7a0ab..000000000
--- a/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Display dialog boxes from the commandline and shell scripts"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-PR = "r2"
-
-PNBLACKLIST[zenity] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-DEPENDS = "gtk+ glib-2.0 libnotify gnome-doc-utils"
-
-inherit gnomebase
-SRC_URI += "file://0001-Makefile.am-don-t-build-help.patch"
-SRC_URI[archive.md5sum] = "aa66ec35451b16e424519b4973082170"
-SRC_URI[archive.sha256sum] = "8838be041a07364b62a4281c971392e4a09bb01bb3237a836ec0457ec0ea18ac"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-# remove -I/usr/include from zenity_CPPFLAGS
-do_configure_prepend() {
-    sed -i -e '/-I$(includedir)/d' src/Makefile.am
-}
-
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb b/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
deleted file mode 100644
index 6a2080d4c..000000000
--- a/meta-gnome/recipes-support/goffice/goffice_0.10.1.bb
+++ /dev/null
@@ -1,51 +0,0 @@
-DESCRIPTION="Gnome Office Library"
-
-LICENSE="GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=6dc33ff21e1ba1ac1a2a1069d361e29e"
-
-DEPENDS = "libxml-parser-perl-native glib-2.0 gtk+3 pango cairo libgsf libpcre libxml2 libart-lgpl librsvg intltool"
-
-inherit gnomebase pkgconfig perlnative gobject-introspection
-
-GNOME_COMPRESS_TYPE = "xz"
-
-SRC_URI += "file://0001-configure.ac-fix-paths-to-introspection-tools.patch"
-
-SRC_URI[archive.md5sum] = "90fd17c6fe205b779571e00d9b0b4727"
-SRC_URI[archive.sha256sum] = "5c38f4e81e874cc8e89481b080f77c47c72bfd6fe2526f4fc2ef87c17f96cad0"
-
-FILES_${PN}-dbg += "${libdir}/goffice/${PV}/plugins/*/.debug"
-
-RRECOMMENDS_${PN} = " \
-    goffice-plugin-plot-barcol \
-    goffice-plugin-plot-distrib \
-    goffice-plugin-plot-pie \
-    goffice-plugin-plot-radar \
-    goffice-plugin-plot-surface \
-    goffice-plugin-plot-xy \
-    goffice-plugin-reg-linear \
-    goffice-plugin-reg-logfit \
-    goffice-plugin-smoothing \
-"
-
-FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
-    ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-    ${base_bindir}/* ${base_sbindir}/* \
-    ${base_libdir}/*${SOLIBS} \
-    ${datadir}/${PN} \
-    ${datadir}/pixmaps ${datadir}/applications \
-    ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
-    ${libdir}/bonobo/servers"
-
-FILES_${PN}-locale = "${libdir}/locale"
-
-PACKAGES_DYNAMIC += "^goffice-plugin-.*"
-
-python populate_packages_prepend () {
-    goffice_libdir = d.expand('${libdir}/goffice/${PV}/plugins/')
-
-    do_split_packages(d, goffice_libdir, '(.*)', 'goffice-plugin-%s', 'Goffice plugin for %s', allow_dirs=True)
-}
-
-# | ../../goffice-0.10.1/goffice/math/go-complex.c:75:3: error: format not a string literal, argument types not checked [-Werror=format-nonliteral]
-PNBLACKLIST[goffice] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb b/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
deleted file mode 100644
index eb36a120f..000000000
--- a/meta-gnome/recipes-support/tracker/tracker_0.14.2.bb
+++ /dev/null
@@ -1,88 +0,0 @@
-DESCRIPTION = "Tracker is a tool designed to extract information and metadata about your personal data so that it can be searched easily and quickly."
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ee31012bf90e7b8c108c69f197f3e3a4"
-DEPENDS = "file gstreamer dbus libexif gettext sqlite3 icu gst-plugins-base libgnome-keyring poppler tiff enca libgsf libunistring giflib taglib bzip2 upower gtk+3 libgee networkmanager intltool-native"
-
-RDEPENDS_${PN} += " gvfs gsettings-desktop-schemas"
-
-RDEPENDS_${PN}-nautilus-extension += "nautilus"
-HOMEPAGE = "http://projects.gnome.org/tracker/"
-
-PR = "r7"
-
-inherit autotools pkgconfig gnomebase gettext gsettings systemd gobject-introspection
-
-VER_DIR = "${@gnome_verdir("${PV}")}"
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/tracker/${VER_DIR}/tracker-${PV}.tar.xz \
-           file://enable-sqlite-crosscompile.patch \
-           file://fix-removable-media-detection.patch \
-           file://giflib5-support.patch \
-           file://90tracker \
-           file://tracker-store.service \
-           file://tracker-miner-fs.service \
-           file://tracker-dbus.service \
-           "
-
-SYSTEMD_SERVICE_${PN} = " tracker-store.service tracker-miner-fs.service tracker-dbus.service "
-SYSTEMD_AUTO_ENABLE = "disable"
-
-EXTRA_OECONF += " tracker_cv_have_ioprio=yes"
-
-PACKAGECONFIG ?= "nautilus"
-PACKAGECONFIG[nautilus] = "--enable-nautilus-extension,--disable-nautilus-extension,nautilus"
-
-# Disable the desktop-centric miners
-EXTRA_OECONF += "--disable-miner-thunderbird --disable-miner-firefox \
-                 --disable-miner-evolution --disable-miner-flickr"
-
-LEAD_SONAME = "libtrackerclient.so.0"
-
-do_compile_prepend() {
-        export GIR_EXTRA_LIBS_PATH="${B}/src/libtracker-sparql-backend/.libs:${B}/src/libtracker-data/.libs:${B}/src/libtracker-common/.libs"
-}
-
-do_install_append() {
-    cp -PpR ${D}${STAGING_DATADIR}/* ${D}${datadir}/ || true
-#   install -d ${D}/${sysconfdir}/X11/Xsession.d/
-#   install -m 0755 ${WORKDIR}/90tracker  ${D}/${sysconfdir}/X11/Xsession.d/
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/tracker-store.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/tracker-miner-fs.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/tracker-dbus.service ${D}${systemd_unitdir}/system
-    sed -i -e 's,@LIBEXECDIR@,${libexecdir},g' \
-           -e 's,@BASE_BINDIR@,${base_bindir},g' \
-               ${D}${systemd_unitdir}/system/*.service
-}
-
-PACKAGES =+ "${PN}-tests ${PN}-vala ${PN}-nautilus-extension"
-
-FILES_${PN} += "${datadir}/dbus-1/ \
-                ${libdir}/tracker-${VER_DIR}/*.so.* \
-                ${libdir}/tracker-${VER_DIR}/extract-modules/*.so \
-                ${libdir}/tracker-${VER_DIR}/writeback-modules/*.so \
-                ${datadir}/icons/hicolor/*/apps/tracker.* \
-                ${libdir}/nautilus/extensions-2.0/*.la \
-                ${datadir}/glib-2.0/schemas/* \
-                ${systemd_unitdir}/system/tracker-store.service \
-                ${systemd_unitdir}/system/tracker-miner-fs.service \
-                ${systemd_unitdir}/system/tracker-dbus.service \
-"
-
-FILES_${PN}-dev += "${libdir}/tracker-${VER_DIR}/*.la \
-                    ${libdir}/tracker-${VER_DIR}/*.so \
-                    ${libdir}/tracker-${VER_DIR}/*/*.la \
-                    ${libdir}/tracker-${VER_DIR}/extract-modules/*.la"
-
-FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a"
-FILES_${PN}-dbg += "${libdir}/*/*/.debug \
-                    ${libdir}/*/.debug"
-FILES_${PN}-tests = "${datadir}/tracker-tests/"
-FILES_${PN}-vala = "${datadir}/vala/"
-FILES_${PN}-nautilus-extension += "${libdir}/nautilus/extensions-2.0/*.so"
-
-SRC_URI[md5sum] = "f3a871beeebf86fd752863ebd22af9ac"
-SRC_URI[sha256sum] = "9b59330aa2e9e09feee587ded895e9247f71fc25f46b023d616d9969314bc7f1"
-
-# http://errors.yoctoproject.org/Errors/Details/81007/
-PNBLACKLIST[tracker] ?= "BROKEN: fails to build with new binutils-2.27 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb b/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
deleted file mode 100644
index db50e38e3..000000000
--- a/meta-gpe/recipes-graphics/gpe-scap/gpe-scap_1.4.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "A GPE application that allows you to take screenshots"
-SECTION = "gpe"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
-
-DEPENDS = "glib-2.0 gtk+ libgpewidget libglade libsoup-2.4"
-
-PR = "r3"
-
-SRC_URI[md5sum] = "eaf545561b0ad981c9d01833f30fcf95"
-SRC_URI[sha256sum] = "762778421fae7c62d5ec6a9d27986166c0dbbe2ff51fc10bb9b8baff5c367534"
-
-GPE_TARBALL_SUFFIX = "bz2"
-
-inherit gpe autotools pkgconfig
-
-SRC_URI += "file://0001-Fix-the-ordering-of-LDADD-options-to-fix-a-compilati.patch \
-    file://use.libsoup-2.4.patch \
-"
-
-RREPLACES_${PN} = "gpe-screenshot"
-
-PNBLACKLIST[gpe-scap] ?= "Depends on blacklisted libgpewidget - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb b/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
deleted file mode 100644
index 31e247eb1..000000000
--- a/meta-gpe/recipes-graphics/libgpewidget/libgpewidget_0.117.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-DESCRIPTION = "libgpewidget contains a collection of widgets and other common code shared by many GPE applications."
-SECTION = "gpe/libs"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=d8045f3b8f929c1cb29a1e3fd737b499"
-
-DEPENDS = "gtk+ cairo libxinerama libxcomposite libxrender"
-PR = "r5"
-
-inherit gpe pkgconfig autotools gtk-doc
-
-SRC_URI += "file://pkgconfig.patch;striplevel=0 \
-    file://glib-2.32.patch \
-"
-SRC_URI[md5sum] = "b85a839264a35d0faf9a1a38c486e189"
-SRC_URI[sha256sum] = "f96d30c09b0395ea4e146730fd52d9ea303b619bb139051d9f12d3f868a9e18c"
-
-GPE_TARBALL_SUFFIX = "bz2"
-
-EXTRA_OECONF = "--enable-cairo --disable-gtk-doc"
-LDFLAGS += " -L${STAGING_LIBDIR}"
-
-PACKAGES =+ "${PN}-bin"
-
-PNBLACKLIST[libgpewidget] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130594/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb b/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
deleted file mode 100644
index 8e064fdc6..000000000
--- a/meta-gpe/recipes-graphics/minilite/minilite_0.50.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "GPE Screen light control dockapp"
-SECTION = "gpe"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://minilite.c;beginline=8;endline=11;md5=fe9332aaecbce9f74ce2bfeb91680ed1"
-
-DEPENDS = "libgpewidget"
-
-inherit gpe
-
-SRC_URI = "${GPE_MIRROR}/${BP}.tar.gz \
-           file://makefile-fix.patch"
-SRC_URI[md5sum] = "d81cecf269ad7bab0da960e6e7228332"
-SRC_URI[sha256sum] = "2b299425203246090a4949e034f1d0efb3ff99cd1591d0e16c57370a530b361e"
-
-export CVSBUILD="no"
-
-PNBLACKLIST[minilite] ?= "Depends on blacklisted libgpewidget - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb b/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
deleted file mode 100644
index 2dbcef402..000000000
--- a/meta-gpe/recipes-support/fbreader/fbreader_0.12.10.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-SUMMARY = "FBreader is an ebook reader"
-HOMEPAGE = "http://www.fbreader.org"
-SECTION = "x11/utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl sqlite3"
-
-PR = "r1"
-
-SRC_URI = "http://www.fbreader.org/fbreader-sources-${PV}.tgz \
-file://Makefile.patch \
-file://gcc45.patch \
-file://fix-cflags-fribidi.patch \
-file://fix-return-code-gcc6.patch"
-
-# Set the defaults
-READER_RESOLUTION ?= "1024x600"
-READER_ARCH       ?= "desktop"
-READER_UI         ?= "gtk"
-READER_STATUS     ?= "release"
-
-FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
-FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug/"
-
-CFLAGS_append = " RESOLUTION=${READER_RESOLUTION} INSTALLDIR=${prefix}"
-EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' LDFLAGS='${LDFLAGS}' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
-
-inherit pkgconfig
-
-do_configure() {
-    cd ${WORKDIR}/${PN}-${PV}
-    mv makefiles/target.mk makefiles/target.mk.orig
-
-    echo "TARGET_ARCH = ${READER_ARCH}" > makefiles/target.mk
-    echo "UI_TYPE = ${READER_UI}" >> makefiles/target.mk
-    echo "TARGET_STATUS = ${READER_STATUS}" >> makefiles/target.mk
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D} RESOLUTION=${READER_RESOLUTION}
-}
-
-SRC_URI[md5sum] = "da9ec4721efdb0ec0aaa182bff16ad82"
-SRC_URI[sha256sum] = "328aec454db80e225aa0b5c31adef74bf62a14357482947e87e9731686b3c624"
-
-PNBLACKLIST[fbreader] ?= "Depends on blacklisted libgpewidget - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-gpe/recipes-support/fbreader/fbreader_git.bb b/meta-gpe/recipes-support/fbreader/fbreader_git.bb
deleted file mode 100644
index b3e7946b5..000000000
--- a/meta-gpe/recipes-support/fbreader/fbreader_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "FBreader is an ebook reader"
-HOMEPAGE = "http://www.fbreader.org"
-SECTION = "x11/utils"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://fbreader/LICENSE;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ enca expat bzip2 libgpewidget virtual/libiconv liblinebreak libfribidi curl sqlite3"
-SRCREV = "2cf1ec0e306e1122dbed850bfa005cd59a6168ee"
-PV = "0.99.5+gitr${SRCPV}"
-
-PR = "r1"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://github.com/geometer/FBReader.git;protocol=http;branch=master \
-           file://0001-Fix-installation-of-the-icons-when-RESOLUTION-is-set.patch"
-
-# Set the defaults
-READER_RESOLUTION ?= "1024x600"
-READER_ARCH       ?= "desktop"
-READER_UI         ?= "gtk"
-READER_STATUS     ?= "release"
-
-FILES_${PN} += "${datadir}/FBReader ${datadir}/zlibrary ${libdir}/zlibrary"
-FILES_${PN}-dbg += "${libdir}/zlibrary/ui/.debug/"
-
-CFLAGS_append = " RESOLUTION=${READER_RESOLUTION} INSTALLDIR=${prefix}"
-EXTRA_OEMAKE = "CC='${CXX}' LD='${CXX}' INCPATH='${STAGING_INCDIR}' LIBPATH='${STAGING_LIBDIR}'"
-inherit pkgconfig
-
-S = "${WORKDIR}/git"
-
-do_configure() {
-    cd "${S}"
-
-    echo "TARGET_ARCH = ${READER_ARCH}" > makefiles/target.mk
-    echo "UI_TYPE = ${READER_UI}" >> makefiles/target.mk
-    echo "TARGET_STATUS = ${READER_STATUS}" >> makefiles/target.mk
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D} RESOLUTION=${READER_RESOLUTION}
-}
-
-# http://errors.yoctoproject.org/Errors/Details/68618/
-PNBLACKLIST[fbreader] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb b/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
deleted file mode 100644
index 4a7ed9a6e..000000000
--- a/meta-multimedia/recipes-dvb/dvb-apps/dvb-apps_1.1.1.bb
+++ /dev/null
@@ -1,136 +0,0 @@
-HOMEPAGE = "http://www.linuxtv.org"
-SUMMARY = "Linux DVB API applications and utilities"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-DEPENDS = "v4l-utils-native"
-
-SRC_URI = " \
-            hg://linuxtv.org/hg;module=dvb-apps;protocol=http;name=apps \
-            git://linuxtv.org/git/dtv-scan-tables.git;protocol=http;destsuffix=dvb-apps/initial-scan-tables;name=scantables \
-          "
-SRCREV_apps = "3d43b280298c"
-SRCREV_scantables = "ceb11833b35f05813b1f0397a60e0f3b99430aab"
-SRCREV_FORMAT = "apps_scantables"
-
-S = "${WORKDIR}/${BPN}"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-EXTRA_OEMAKE = "VERSION_FILE='${STAGING_INCDIR}/linux/dvb/version.h'"
-
-do_configure() {
-    sed -i -e s:/usr/include:${STAGING_INCDIR}:g util/av7110_loadkeys/generate-keynames.sh
-}
-
-do_compile_append() {
-# dvb-apps only support DVBAPI v3, so generate them from the DVBAPI v5 downloaded files
-    make -C initial-scan-tables clean
-    make -C initial-scan-tables dvbv3
-}
-
-do_install() {
-    make DESTDIR=${D} install
-# dvb-apps only support DVBAPI v3, so only install the generated DVBAPI v3 files
-    make -C initial-scan-tables DATADIR=${D}/${datadir} DVBV3DIR=dvb install_v3
-
-    install -d ${D}/${bindir}
-    install -d ${D}/${docdir}/dvb-apps
-    install -d ${D}/${docdir}/dvb-apps/szap
-    chmod a+rx ${D}/${libdir}/*.so*
-
-    # Install tests
-    install -m 0755 ${S}/test/setvoltage      ${D}${bindir}/test_setvoltage
-    install -m 0755 ${S}/test/set22k          ${D}${bindir}/test_set22k
-    install -m 0755 ${S}/test/sendburst       ${D}${bindir}/test_sendburst
-    install -m 0755 ${S}/test/diseqc          ${D}${bindir}/test_diseqc
-    install -m 0755 ${S}/test/test_sections   ${D}${bindir}/
-    install -m 0755 ${S}/test/test_av_play    ${D}${bindir}/
-    install -m 0755 ${S}/test/test_stillimage ${D}${bindir}/
-    install -m 0755 ${S}/test/test_dvr_play   ${D}${bindir}/
-    install -m 0755 ${S}/test/test_tt         ${D}${bindir}/
-    install -m 0755 ${S}/test/test_sec_ne     ${D}${bindir}/
-    install -m 0755 ${S}/test/test_stc        ${D}${bindir}/
-    install -m 0755 ${S}/test/test_av         ${D}${bindir}/
-    install -m 0755 ${S}/test/test_vevent     ${D}${bindir}/
-    install -m 0755 ${S}/test/test_pes        ${D}${bindir}/
-    install -m 0755 ${S}/test/test_dvr        ${D}${bindir}/
-
-    cp -pPR ${S}/util/szap/channels-conf* ${D}/${docdir}/dvb-apps/szap/
-    cp -pPR ${S}/util/szap/README   ${D}/${docdir}/dvb-apps/szap/
-}
-
-python populate_packages_prepend () {
-    dvb_libdir = bb.data.expand('${libdir}', d)
-    do_split_packages(d, dvb_libdir, '^lib(.*)\.so$', 'lib%s', 'DVB %s package', extra_depends='', allow_links=True)
-    do_split_packages(d, dvb_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'DVB %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, dvb_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'DVB %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, dvb_libdir, '^lib(.*)\.so\.*', 'lib%s', 'DVB %s library', extra_depends='', allow_links=True)
-}
-
-PACKAGES =+ "dvb-evtest dvb-evtest-dbg \
-             dvbapp-tests dvbapp-tests-dbg \
-             dvbdate dvbdate-dbg \
-             dvbtraffic dvbtraffic-dbg \
-             dvbnet dvbnet-dbg \
-             dvb-scan dvb-scan-dbg dvb-scan-data \
-             dvb-azap dvb-azap-dbg \
-             dvb-czap dvb-czap-dbg \
-             dvb-szap dvb-szap-dbg \
-             dvb-tzap dvb-tzap-dbg \
-             dvb-femon dvb-femon-dbg \
-             dvb-zap-data"
-
-# Expose the packages from the above spitting
-PACKAGES =+ "libdvbapi libdvbcfg libdvben50221 \
-             libesg libucsi libdvbsec"
-
-FILES_${PN} = "${bindir} ${datadir}/dvb"
-FILES_${PN}-doc = ""
-FILES_${PN}-dev = "${includedir}"
-
-FILES_dvb-evtest = "${bindir}/evtest"
-FILES_dvb-evtest-dbg = "${bindir}/.debug/evtest"
-RCONFLICTS_dvb-evtest = "evtest"
-
-FILES_dvbapp-tests = "${bindir}/*test* "
-FILES_dvbapp-tests-dbg = "${bindir}/.debug/*test*"
-
-FILES_dvbdate = "${bindir}/dvbdate"
-FILES_dvbdate-dbg = "${bindir}/.debug/dvbdate"
-
-FILES_dvbtraffic = "${bindir}/dvbtraffic"
-FILES_dvbtraffic-dbg = "${bindir}/.debug/dvbtraffic"
-
-FILES_dvbnet = "${bindir}/dvbnet"
-FILES_dvbnet-dbg = "${bindir}/.debug/dvbnet"
-
-FILES_dvb-scan = "${bindir}/*scan "
-FILES_dvb-scan-dbg = "${bindir}/.debug/*scan"
-FILES_dvb-scan-data = "${datadir}/dvb"
-
-FILES_dvb-azap = "${bindir}/azap"
-FILES_dvb-azap-dbg = "${bindir}/.debug/azap"
-
-FILES_dvb-czap = "${bindir}/czap"
-FILES_dvb-czap-dbg = "${bindir}/.debug/czap"
-
-FILES_dvb-szap = "${bindir}/szap"
-FILES_dvb-szap-dbg = "${bindir}/.debug/szap"
-
-FILES_dvb-tzap = "${bindir}/tzap"
-FILES_dvb-tzap-dbg = "${bindir}/.debug/tzap"
-
-FILES_dvb-femon = "${bindir}/femon"
-FILES_dvb-femon-dbg = "${bindir}/.debug/femon"
-
-FILES_dvb-zap-data = "${docdir}/dvb-apps/szap"
-
-RDEPENDS_dvbdate =+ "libdvbapi libucsi"
-RDEPENDS_dvbtraffic =+ "libdvbapi"
-RDEPENDS_dvb-scan =+ "libdvbapi libdvbcfg libdvbsec"
-RDEPENDS_dvb-apps =+ "libdvbapi libdvbcfg libdvbsec libdvben50221 libucsi"
-RDEPENDS_dvb-femon =+ "libdvbapi"
-RDEPENDS_dvbnet =+ "libdvbapi"
-
-PNBLACKLIST[dvb-apps] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130603/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
deleted file mode 100644
index 3b73549d2..000000000
--- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
+++ /dev/null
@@ -1,43 +0,0 @@
-SUMMARY = "Tvheadend TV streaming server"
-HOMEPAGE = "https://www.lonelycoder.com/redmine/projects/tvheadend"
-
-DEPENDS = "avahi zlib openssl python-native dvb-apps"
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
-
-SRC_URI = "git://github.com/tvheadend/tvheadend.git;branch=release/4.0 \
-           file://0001-Fix-checks-for-sse2-mmx.patch \
-           file://0001-disable-varargs-warning-on-clang.patch \
-           file://0001-hdhomerun-Override-forced-overrdiing-og-CC-STRIP-and.patch \
-           file://0001-dvr-Use-labs-instead-of-abs.patch \
-           file://0001-Makefile-Ignore-warning-about-wrong-includes.patch \
-"
-SRCREV = "64fec8120158de585e18be705055259484518d94"
-PV = "4.0.9+git${SRCREV}"
-
-S = "${WORKDIR}/git"
-
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[uriparser] = "--enable-uriparser,--disable-uriparser,uriparser"
-
-do_configure() {
-    ./configure ${PACKAGECONFIG_CONFARGS} \
-                --prefix=${prefix} \
-                --libdir=${libdir} \
-                --bindir=${bindir} \
-                --datadir=${datadir} \
-                --arch=${TARGET_ARCH} \
-                --disable-dvbscan \
-                --disable-bundle
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-
-FILES_${PN} += "${datadir}/${BPN}"
-
-RDEPENDS_${PN} += "libdvben50221 libucsi libdvbapi"
-
-PNBLACKLIST[tvheadend] ?= "Depends on blacklisted dvb-apps - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
deleted file mode 100644
index 7cafebfa2..000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-addon-pvr-hts_git.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY = "Kodi Media Center PVR plugins"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://src/client.cpp;md5=c8f6b73c5bc1048a3d6506700a7a91d2"
-
-DEPENDS = " \
-            zip-native \
-            p8platform \
-            kodi-platform \
-          "
-
-SRCREV_pvrhts = "7f75b70527922aef953123ff97ebaa22d9fb7cb4"
-
-SRCREV_FORMAT = "pvrhts"
-
-PV = "2.2.13+gitr${SRCPV}"
-SRC_URI = "git://github.com/kodi-pvr/pvr.hts.git;branch=Jarvis;destsuffix=pvr.hts;name=pvrhts \
-           file://0001-Update-to-p8-platform.patch \
-          "
-
-inherit cmake pkgconfig gettext
-
-S = "${WORKDIR}/pvr.hts"
-
-EXTRA_OECMAKE = " \
-	  -DADDONS_TO_BUILD=pvr.hts \
-	  -DADDON_SRC_PREFIX=${WORKDIR}/git \
-	  -DCMAKE_BUILD_TYPE=Debug \
-	  -DCMAKE_INSTALL_PREFIX=${datadir}/kodi/addons \
-          -DCMAKE_MODULE_PATH=${STAGING_DIR_HOST}${libdir}/kodi \
-          -DCMAKE_PREFIX_PATH=${STAGING_DIR_HOST}${prefix} \
-          -DPACKAGE_ZIP=1 \
-        "
-
-do_compile_prepend() {
-	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' \
-	       -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g' \
-	          ${B}/CMakeFiles/*/flags.make
-	sed -i -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g'\
-	          ${B}/CMakeFiles/*/link.txt
-}
-
-# Make zip package for manual installation
-do_install_append() {
-	install -d ${D}${datadir}/kodi/addons/packages/
-	( cd ${D}${datadir}/kodi/addons
-	  zip -r ${D}${datadir}/kodi/addons/packages/pvr.hts-${PV}.zip pvr.hts -x '*.debug*' )
-}
-
-# Doesn't get added automagically, dlopen()?
-RDEPENDS_${PN} = "libkodiplatform"
-
-INSANE_SKIP_${PN} = "dev-so"
-FILES_${PN} += "${datadir}/kodi"
-FILES_${PN}-dbg += "${datadir}/kodi/addons/*/.debug/"
-
-PNBLACKLIST[kodi-addon-pvr-hts] ?= "Depends on blacklisted kodi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
deleted file mode 100644
index 0b554ef6a..000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-platform_git.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Platform support library used by libCEC and binary add-ons for Kodi"
-HOMEPAGE = "http://libcec.pulse-eight.com/"
-
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://src/util/XMLUtils.cpp;beginline=2;endline=18;md5=dae8e846500e70dd8ecee55f3f018c30"
-
-DEPENDS = "libtinyxml kodi"
-
-PV = "16.0.0"
-
-SRCREV = "c8188d82678fec6b784597db69a68e74ff4986b5"
-SRC_URI = "git://github.com/xbmc/kodi-platform.git \
-           file://0001-fix-cross-compile-badness.patch \
-           file://kodi-platform-02_no-multi-lib.patch \
-          "
-
-S = "${WORKDIR}/git"
-
-inherit cmake pkgconfig
-
-EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX_TOOLCHAIN=${STAGING_DIR_TARGET} \
-                  -DCMAKE_INSTALL_LIBDIR=${libdir} \
-                  -DCMAKE_INSTALL_LIBDIR_NOARCH=${libdir} \
-                  -DKODI_INCLUDE_DIR=${STAGING_LIBDIR}/kodi \
-                  -DKODI_INCLUDE_DIR=${STAGING_INCDIR}/kodi \
-                "
-
-do_compile_prepend() {
-	sed -i -e 's:I/usr/include:I${STAGING_INCDIR}:g' \
-	       -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g' \
-	          ${B}/CMakeFiles/kodiplatform.dir/flags.make
-	sed -i -e 's:-pipe:${HOST_CC_ARCH} ${TOOLCHAIN_OPTIONS} -pipe:g'\
-	          ${B}/CMakeFiles/kodiplatform.dir/link.txt
-}
-
-RPROVIDES_${PN} += "libkodiplatform"
-FILES_${PN}-dev += "${libdir}/*platform"
-
-PNBLACKLIST[kodi-platform] ?= "Depends on blacklisted kodi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb b/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
deleted file mode 100644
index 47e8f38e9..000000000
--- a/meta-multimedia/recipes-mediacenter/kodi/kodi-startup.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Systemd service for kodi startup"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
-
-PV = "1.0"
-
-SRC_URI = "file://kodi.service"
-
-inherit systemd
-
-do_install() {
-	install -d ${D}/lib/systemd/system
-	install -m 0644 ${WORKDIR}/kodi.service ${D}/lib/systemd/system/ 
-}
-
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "kodi.service"
-
-RDEPENDS_${PN} += "xinit kodi"
-
-PNBLACKLIST[kodi-startup] ?= "Runtime depends on blacklisted kodi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[kodi-startup] ?= "Runtime depends on blacklisted kodi-startup-dev - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
deleted file mode 100644
index 8a142645c..000000000
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
+++ /dev/null
@@ -1,57 +0,0 @@
-SUMMARY = "MKVToolNix -- Cross-platform tools for Matroska"
-HOMEPAGE = "http://www.bunkus.org/videotools/mkvtoolnix/source.html"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis bzip2 lzo file ruby-native"
-
-PV = "8.4.0+git${SRCPV}"
-SRCREV_mkvtoolnix = "7f63ea48ee474754a95838f37aba8f6118c94a65"
-SRCREV_libebml = "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206"
-SRCREV_libmatroska = "db5d627b5bf48516c9e0b540254c0d36595760c3"
-SRCREV_FORMAT = "mkvtoolnix"
-SRC_URI = " \
-           git://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix \
-           git://github.com/Matroska-Org/libebml.git;name=libebml;destsuffix=git/lib/libebml \
-           git://github.com/Matroska-Org/libmatroska.git;name=libmatroska;destsuffix=git/lib/libmatroska \
-          "
-
-S = "${WORKDIR}/git"
-
-inherit autotools-brokensep gettext
-
-# make sure rb files are used from sysroot, not from host
-# ruby-1.9.3-always-use-i386.patch is doing target_cpu=`echo $target_cpu | sed s/i.86/i386/`
-# we need to replace it too (a bit longer version without importing re)
-RUBY_SYS = "${@ '${BUILD_SYS}'.replace('i486', 'i386').replace('i586', 'i386').replace('i686', 'i386') }"
-export RUBYLIB="${STAGING_DATADIR_NATIVE}/rubygems:${STAGING_LIBDIR_NATIVE}/ruby:${STAGING_LIBDIR_NATIVE}/ruby/${RUBY_SYS}"
-
-PACKAGECONFIG ??= "flac ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
-PACKAGECONFIG[flac] = "--with-flac,--without-flac,flac"
-PACKAGECONFIG[qt5] = "--enable-qt --with-moc=${STAGING_BINDIR_NATIVE}/qt5/moc --with-uic=${STAGING_BINDIR_NATIVE}/qt5/uic --with-rcc=${STAGING_BINDIR_NATIVE}/qt5/rcc,--disable-qt,qtbase"
-
-EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
-"
-
-FILES_${PN} += "${datadir}"
-
-# remove some hardcoded searchpaths
-do_configure_prepend() {
-    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
-}
-
-# Yeah, no makefile
-do_compile() {
-    LC_ALL="en_US.UTF-8" ${S}/drake ${PARALLEL_MAKE}
-}
-
-do_install() {
-    LC_ALL="en_US.UTF-8" ${S}/drake install DESTDIR=${D}
-}
-
-# | In file included from src/common/utf8_codecvt_facet.cpp:22:0:
-# | src/common/../../lib/boost/utf8_codecvt_facet/utf8_codecvt_facet.cpp:174:5: error: 'int mtx::utf8_codecvt_facet::do_length' is not a static data member of 'struct mtx::utf8_codecvt_facet'
-# |      BOOST_CODECVT_DO_LENGTH_CONST std::mbstate_t &,
-# |      ^
-PNBLACKLIST[mkvtoolnix] ?= "BROKEN: Failx to build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb b/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
deleted file mode 100755
index 1ddd9aab6..000000000
--- a/meta-multimedia/recipes-multimedia/coriander/coriander_2.0.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Control and capture GUI for IIDC compliant cameras"
-HOMEPAGE = "http://damien.douxchamps.net/ieee1394/coriander/"
-SECTION = "applications"
-LICENSE = "GPL-3.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "gtk+ libgnomeui libraw1394 libdc1394 libxv tiff"
-
-PNBLACKLIST[coriander] ?= "BROKEN: fails to use SDL probably because libsdl-config was removed, error: unknown type name 'SDL_Overlay' - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}/coriander-2/${PV}/${BP}.tar.gz \
-           file://cross-compile.patch \
-          "
-
-SRC_URI[md5sum] = "431d98fb013217681f97ade168201fb8"
-SRC_URI[sha256sum] = "5c7fd31cb58d398e2742352bf1ffbd2ca22e06686c6668ecfd437735c2b79123"
-
-inherit autotools gettext
diff --git a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb b/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
deleted file mode 100644
index ca19fd69b..000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer-0.10/gst-ffmpeg_0.10.13.bb
+++ /dev/null
@@ -1,103 +0,0 @@
-SUMMARY = "FFmpeg-based GStreamer plug-in"
-SECTION = "multimedia"
-LICENSE = "GPLv2+ & LGPLv2+ & ( (GPLv2+ & LGPLv2.1+) | (GPLv3+ & LGPLv3+) )"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://ext/libpostproc/gstpostproc.c;beginline=1;endline=18;md5=5896e445e41681324381f5869ee33d38 \
-                    file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605 \
-                    file://ext/ffmpeg/gstffmpeg.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9 \
-                    file://gst-libs/ext/libav/LICENSE;md5=abc3b8cb02856aa7823bbbd162d16232 \
-                    file://gst-libs/ext/libav/COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://gst-libs/ext/libav/COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=e344c8fa836c3a41c4cbd79d7bd3a379 \
-                    file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
-LICENSE_FLAGS = "commercial"
-HOMEPAGE = "http://www.gstreamer.net/"
-DEPENDS = "gstreamer gst-plugins-base zlib bzip2 yasm-native libpostproc"
-
-inherit autotools-brokensep pkgconfig
-
-SRC_URI = "http://gstreamer.freedesktop.org/src/${BPN}/${BPN}-${PV}.tar.bz2 \
-           file://lower-rank.diff \
-           file://configure-fix.patch \
-           file://h264_qpel_mmx.patch \
-           file://libav_e500mc.patch \
-           file://libav_e5500.patch \
-           file://gst-ffmpeg-CVE-2013-3674.patch \
-           file://0001-avformat-mpegtsenc-Check-data-array-size-in-mpegts_w.patch \
-           file://0001-vqavideo-check-chunk-sizes-before-reading-chunks.patch \
-           file://0001-avcodec-msrle-use-av_image_get_linesize-to-calculate.patch \
-           file://0001-huffyuvdec-Skip-len-0-cases.patch \
-           file://0001-huffyuvdec-Check-init_vlc-return-codes.patch \
-           file://0001-alsdec-check-block-length.patch \
-           file://0001-pgssubdec-check-RLE-size-before-copying.-Fix-out-of-.patch \
-           file://0001-atrac3dec-Check-coding-mode-against-channels.patch \
-           file://0001-eamad-fix-out-of-array-accesses.patch \
-           file://0001-mjpegdec-check-SE.patch \
-           file://0001-alac-fix-nb_samples-order-case.patch \
-           file://0001-h264-correct-ref-count-check-and-limit-fix-out-of-ar.patch \
-           file://0001-roqvideodec-check-dimensions-validity.patch \
-           file://0001-aacdec-check-channel-count.patch \
-           file://0001-pngdec-filter-dont-access-out-of-array-elements-at-t.patch \
-           file://0001-error_concealment-Check-that-the-picture-is-not-in-a.patch \
-           file://0001-vp3-fix-oob-read-for-negative-tokens-and-memleaks-on.patch \
-           file://0001-vp3-Copy-all-3-frames-for-thread-updates.patch \
-           file://0001-h264_sei-Fix-infinite-loop.patch \
-           file://0001-avcodec-parser-reset-indexes-on-realloc-failure.patch \
-           file://0001-avcodec-rpza-Perform-pointer-advance-and-checks-befo.patch \
-           file://gst-ffmpeg-CVE-2013-0855.patch \
-           file://0001-qdm2dec-fix-buffer-overflow.patch \
-           file://0001-smackerdec-Check-that-the-last-indexes-are-within-th.patch \
-           file://0001-avcodec-dsputil-fix-signedness-in-sizeof-comparissio.patch \
-           file://0001-error-concealment-initialize-block-index.patch \
-           file://0001-qdm2-check-array-index-before-use-fix-out-of-array-a.patch \
-           file://0001-lavf-compute-probe-buffer-size-more-reliably.patch \
-           file://0001-ffserver-set-oformat.patch \
-           file://0001-h264-set-parameters-from-SPS-whenever-it-changes.patch \
-           file://0001-h264-skip-error-concealment-when-SPS-and-slices-are-.patch \
-           file://0001-avcodec-smc-fix-off-by-1-error.patch \
-           file://0002-avcodec-mjpegdec-check-bits-per-pixel-for-changes-si.patch \
-           file://libav-9.patch \
-           file://gst-ffmpeg-fix-CVE-2011-4352.patch \
-           file://gst-ffmpeg-fix-CVE-2014-7933.patch \
-           file://gst-ffmpeg-fix-CVE-2014-8542.patch \
-           file://gst-ffmpeg-fix-CVE-2014-8543.patch \
-           file://gst-ffmpeg-fix-CVE-2014-8544.patch \
-           file://gst-ffmpeg-fix-CVE-2014-8545.patch \
-           file://gst-ffmpeg-fix-CVE-2014-8546.patch \
-           file://gst-ffmpeg-fix-CVE-2014-8547.patch \
-           file://gst-ffmpeg-fix-CVE-2014-9318.patch \
-           file://gst-ffmpeg-fix-CVE-2014-9603.patch \
-"
-
-SRC_URI[md5sum] = "7f5beacaf1312db2db30a026b36888c4"
-SRC_URI[sha256sum] = "76fca05b08e00134e3cb92fa347507f42cbd48ddb08ed3343a912def187fbb62"
-
-PR = "r8"
-
-GSTREAMER_DEBUG ?= "--disable-debug"
-
-FFMPEG_EXTRA_CONFIGURE = "--with-ffmpeg-extra-configure"
-# pass --cpu for powerpc. get cpu name by stripping "ppc" or "ppc64"
-# from DEFAULTTUNE
-FFMPEG_CPU_powerpc = "--cpu=${@d.getVar('DEFAULTTUNE', False)[3:]}"
-FFMPEG_CPU_powerpc64 = "--cpu=${@d.getVar('DEFAULTTUNE', False)[5:]}"
-FFMPEG_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux ${FFMPEG_CPU} \
-  --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
-  --ranlib='${RANLIB}' \
-  ${GSTREAMER_DEBUG}"
-FFMPEG_EXTRA_CONFIGURE_COMMON = \
-'${FFMPEG_EXTRA_CONFIGURE}="${FFMPEG_EXTRA_CONFIGURE_COMMON_ARG}"'
-
-EXTRA_OECONF = "${FFMPEG_EXTRA_CONFIGURE_COMMON}"
-
-PACKAGECONFIG ??= "external-libav"
-PACKAGECONFIG[external-libav] = "--with-system-ffmpeg,,libav"
-PACKAGECONFIG[orc] = "--enable-orc,--disable-orc,orc"
-
-FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
-FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
-FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.la"
-FILES_${PN}-staticdev += "${libdir}/gstreamer-0.10/*.a"
-
-# http://errors.yoctoproject.org/Errors/Details/40736/
-PNBLACKLIST[gst-ffmpeg] ?= "Not compatible with currently used ffmpeg 3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb b/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
deleted file mode 100644
index 9fe1bc6b6..000000000
--- a/meta-multimedia/recipes-multimedia/gstreamer/gst123_0.3.1.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Flexible CLI player in the spirit of mpg123, based on GStreamer"
-HOMEPAGE = "http://space.twc.de/~stefan/gst123.php"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
-                    file://src/gst123.cc;beginline=1;endline=19;md5=05d2f5d54b985b986c26af931d2084f8"
-
-DEPENDS = "libx11 gstreamer gst-plugins-base gtk+ ncurses"
-
-SRC_URI = "http://space.twc.de/~stefan/gst123/${BPN}-${PV}.tar.bz2 \
-           file://display.patch"
-
-SRC_URI[md5sum] = "1e77767c9d6fecee5641f95804f160fe"
-SRC_URI[sha256sum] = "89d1de025eca0466c125dcd6a11b64341bdf98ee4c03c3e5a12321d77cb8b0ce"
-
-inherit autotools
-
-PNBLACKLIST[gst123] ?= "gst123 is still "sometimes" using wrong sysroot - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb b/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
deleted file mode 100644
index 2da29d9cb..000000000
--- a/meta-networking/recipes-daemons/dnrd/dnrd_2.20.3.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "A caching, forwarding DNS proxy server"
-DESCRIPTION = "\
-dnrd is a proxying nameserver. It forwards DNS queries to the appropriate \
-nameserver, but can also act as the primary nameserver for a subnet behind \
-a firewall. It also has features such as caching DNS requests, support for \
-DNS servers, cache poisoning prevention, TCP support, etc.."
-HOMEPAGE = "http://dnrd.sourceforge.net/"
-SECTION = "net"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0be67017f1c770313ad7b40e18d568f1"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
-           file://dnrd.service \
-           file://dnrd.conf.sample \
-           file://dnrd.init"
-SRC_URI[md5sum] = "41c9b070aae8ed403fc8c2aac7ab157c"
-SRC_URI[sha256sum] = "aa46e7f8736b88c1d752cf606b3990041221ce91d014e955c6b02eb2167db015"
-
-PNBLACKLIST[dnrd] ?= "BROKEN: dnrd-2.20.3-r0 do_package: QA Issue: dnrd: Files/directories were installed but not shipped in any package: - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SYSTEMD_SERVICE_${PN} = "dnrd.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-
-inherit autotools
-inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
-
-do_install() {
-    oe_runmake install DESTDIR=${D} INSTALL="install -p"
-
-    sed -i -e 's:/etc/rc.d/init.d/functions:/etc/init.d/functions:g' \
-        ${WORKDIR}/dnrd.init
-    install -d -m 0755 ${D}${sysconfdir}/init.d
-    install -d -m 0755 ${D}${sysconfdir}/dnrd
-    install -p -m 0644 ${WORKDIR}/dnrd.conf.sample ${D}${sysconfdir}/dnrd/dnrd.conf
-    install -p -m 0755 ${WORKDIR}/dnrd.init ${D}${sysconfdir}/init.d/dnrd
-
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d -m 0755 ${D}${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/dnrd.service ${D}${systemd_unitdir}/system
-    fi
-}
diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
deleted file mode 100644
index 192ece0e9..000000000
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ /dev/null
@@ -1,92 +0,0 @@
-require netmap.inc
-
-DEPENDS = "virtual/kernel"
-do_configure[depends] += "virtual/kernel:do_shared_workdir"
-
-inherit module
-
-CLEANBROKEN = "1"
-
-export INSTALL_MOD_DIR="kernel/netmap-modules"
-
-EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
-                --kernel-sources=${STAGING_KERNEL_DIR} \
-                --install-mod-path=${D} \
-                --driver-suffix="-netmap" \
-                "
-
-# The driver builds are optional, but for deterministic builds,
-# we should be able to explicitly enable/disable the builds
-# for them in a proper place (maybe in BSP).
-# But we can't use PACKAGECONFIG since there is no option for
-# each driver, and the options are:
-#  --no-drivers    do not compile any driver
-#  --no-drivers=   do not compile the given drivers (comma sep.)
-#  --drivers=      only compile the given drivers (comma sep.)
-#
-# So use NETMAP_DRIVERS and the following python code to add proper
-# configs to EXTRA_OECONF.
-#
-# The default is no-drivers, and all supported drivers are listed
-# in NETMAP_ALL_DRIVERS.
-NETMAP_DRIVERS ??= ""
-NETMAP_ALL_DRIVERS = "ixgbe igb e1000e e1000 veth.c forcedeth.c virtio_net.c r8169.c"
-
-python __anonymous () {
-    drivers_list = d.getVar("NETMAP_DRIVERS").split()
-    all_drivers_list = d.getVar("NETMAP_ALL_DRIVERS").split()
-    config_drivers = "--drivers=" + ",".join(drivers_list)
-
-    extra_oeconf_drivers = bb.utils.contains_any('NETMAP_DRIVERS', all_drivers_list, config_drivers, '--no-drivers', d)
-    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
-}
-
-LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
-LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
-
-do_configure () {
-    cd ${S}/LINUX
-    ./configure ${EXTRA_OECONF}
-}
-
-do_configure_append () {
-    cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
-#define NETMAP_LINUX_HAVE_HRTIMER_MODE_REL
-#define NETMAP_LINUX_HAVE_HRTIMER_FORWARD_NOW
-#define NETMAP_LINUX_HAVE_PHYS_ADDR_T
-#define NETMAP_LINUX_HAVE_ACCESS_ONCE
-#define NETMAP_LINUX_HAVE_NETDEV_OPS
-#define NETMAP_LINUX_HAVE_INIT_NET
-#define NETMAP_LINUX_HAVE_LIVE_ADDR_CHANGE
-#define NETMAP_LINUX_HAVE_TX_SKB_SHARING
-#define NETMAP_LINUX_HAVE_UNLOCKED_IOCTL
-#define NETMAP_LINUX_HAVE_PERNET_OPS_ID
-#define NETMAP_LINUX_VIRTIO_FUNCTIONS
-#define NETMAP_LINUX_VIRTIO_FREE_PAGES
-#define NETMAP_LINUX_VIRTIO_GET_VRSIZE
-#define NETMAP_LINUX_TIMER_RTYPE enum hrtimer_restart
-#define NETMAP_LINUX_VIRTIO_MULTI_QUEUE
-#define NETMAP_LINUX_HAVE_E1000E_EXT_RXDESC
-#define NETMAP_LINUX_HAVE_E1000E_DOWN2
-EOF
-
-if ${@ 'false' if (bb.utils.vercmp_string(d.getVar('KERNEL_VERSION') or "0", '3.17') < 0) else 'true' } ; then
-    echo OK
-    cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
-#define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
-EOF
-fi
-}
-
-do_compile () {
-    cd ${S}/LINUX
-    oe_runmake
-}
-
-do_install () {
-    cd ${S}/LINUX
-    oe_runmake install
-}
-
-# http://errors.yoctoproject.org/Errors/Details/83335/
-PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default kernel version 4.8 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-networking/recipes-kernel/netmap/netmap_git.bb
deleted file mode 100644
index 2d8509c74..000000000
--- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
+++ /dev/null
@@ -1,37 +0,0 @@
-require netmap.inc
-
-DEPENDS = "netmap-modules"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
-                --kernel-sources=${STAGING_KERNEL_DIR} \
-                --no-drivers \
-                --disable-generic \
-                --prefix=${prefix} \
-                --destdir=${D} \
-                --cc='${CC}' \
-                --ld='${LD}' \
-                "
-SRC_URI += "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.patch"
-
-do_configure () {
-    cd ${S}/LINUX
-    ./configure ${EXTRA_OECONF}
-}
-
-do_compile () {
-    cd ${S}/LINUX
-    make apps
-}
-
-do_install () {
-    cd ${S}/LINUX
-    make install-apps DESTDIR=${D}
-}
-
-FILES_${PN} += "${bindir}"
-RDEPENDS_${PN} = "kernel-module-netmap"
-RRECOMMENDS_${PN} = "kernel-module-netmap"
-
-# http://errors.yoctoproject.org/Errors/Details/69733/
-PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails, either it should be disabled or there should be dependency on kernel like in netmap-modules - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb b/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
deleted file mode 100644
index 0a86504c7..000000000
--- a/meta-networking/recipes-protocols/accel-ppp/accel-ppp_git.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY = "ACCEL-PPP is a high performance VPN server application for linux"
-HOMEPAGE = "http://sourceforge.net/apps/trac/accel-ppp/wiki"
-SECTION = "net"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
-
-DEPENDS = "openssl libpcre"
-
-inherit cmake
-
-PR = "r1"
-PV = "1.7.3+git"
-
-SRCREV = "4acfa46c321a344b9a6ce4128e72d1e02828d8a0"
-SRC_URI = "git://accel-ppp.git.sourceforge.net/gitroot/accel-ppp/accel-ppp;branch=1.7"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECMAKE = " \
-                 -DBUILD_DRIVER=FALSE \
-                 -DCMAKE_INSTALL_PREFIX=${prefix} \
-                 -DCMAKE_BUILD_TYPE=Release \
-                 -DLOG_PGSQL=FALSE \
-                 -DRADIUS=FALSE \
-                 -DNETSNMP=FALSE \
-"
-FILES_${PN}-dbg += "/usr/lib/${BPN}/.debug/*"
-
-PACKAGES =+ "${PN}-libs"
-FILES_${PN}-libs = "${libdir}/${BPN}/*.so /usr/lib/${BPN}/*.so"
-INSANE_SKIP_${PN}-libs = "dev-so"
-RDEPENDS_${PN} += "${PN}-libs"
-
-do_install_prepend() {
-    cmlist=`find ${S} -name CMakeLists.txt`
-    for file in $cmlist; do
-        sed -i -e "s:LIBRARY DESTINATION lib/accel-ppp:LIBRARY DESTINATION ${baselib}/accel-ppp:g" \
-               -e "s:\${CMAKE_INSTALL_PREFIX}/lib/accel-ppp:\${CMAKE_INSTALL_PREFIX}/${baselib}/accel-ppp:g" \
-               $cmlist
-    done
-}
-
-# http://errors.yoctoproject.org/Errors/Details/81003/
-PNBLACKLIST[accel-ppp] ?= "BROKEN: fails to build with new binutils-2.27 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb b/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
deleted file mode 100644
index 0b7e5046b..000000000
--- a/meta-networking/recipes-support/nis/ypbind-mt_2.2.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-# This package builds the NIS ypbind daemon
-# The source package is utils/net/NIS/ypbind-mt
-#
-require nis.inc
-
-DESCRIPTION = " \
-Multithreaded NIS bind service (ypbind-mt).  \
-ypbind-mt is a complete new implementation of a NIS \
-binding daemon for Linux. It has the following \
-features.  Supports ypbind protocol V1 and V2.  \
-Uses threads for better response.  Supports multiple \
-domain bindings.  Supports /var/yp/binding/* file \
-for Linux libc 4/5 and glibc 2.x.  Supports a list \
-of known secure NIS server (/etc/yp.conf) Binds to \
-the server which answered as first. \
-"
-HOMEPAGE = "http://www.linux-nis.org/nis/ypbind-mt/index.html"
-DEPENDS = "yp-tools ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
-PROVIDES += "ypbind"
-
-PNBLACKLIST[ypbind-mt] ?= "BROKEN: Depends on broken yp-tools - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "http://www.linux-nis.org/download/ypbind-mt/${BP}.tar.bz2 \
-           file://ypbind.init \
-           file://ypbind.service \
-"
-SRC_URI[md5sum] = "54e2040d8266ae7d302d081ca310c8a8"
-SRC_URI[sha256sum] = "dc2f7d97c94dcab0acfdcd115cd8b464eb8c427e4bb0fe68404ae7465f517cd3"
-
-inherit systemd update-rc.d
-
-SYSTEMD_SERVICE_${PN} = "ypbind.service"
-INITSCRIPT_NAME = "ypbind"
-INITSCRIPT_PARAMS = "start 44 3 5 . stop 70 0 1 2 6 ."
-
-CACHED_CONFIGUREVARS = "ac_cv_prog_STRIP=/bin/true"
-
-EXTRA_OECONF = "PKG_CONFIG_PATH='${STAGING_LIBDIR}/yp-nis/pkgconfig/'"
-
-do_install_append () {
-    install -d ${D}${sysconfdir}/init.d
-    install -d ${D}${sysconfdir}/rcS.d
-
-    install -m 0755 ${WORKDIR}/ypbind.init ${D}${sysconfdir}/init.d/ypbind
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
-}
-
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
diff --git a/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb b/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
deleted file mode 100644
index 8113da76d..000000000
--- a/meta-oe/recipes-benchmark/pmbw/pmbw_git.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMERY = "Parallel Memory Bandwidth Measurement / Benchmark"
-DESCRIPTION = "\
-The tool pmbw is a set of assembler routines to measure the parallel memory \
-(cache and RAM) bandwidth of modern multi-core machines."
-HOMEPAGE = "http://panthema.net/2013/pmbw/"
-SECTION = "benchmark/tests"
-AUTHOR = "Timo Bingmann"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "git://github.com/bingmann/pmbw;protocol=https"
-
-PV = "0.6.2+git${SRCPV}"
-SRCREV = "4a3b37728060a8aba06fc83f157a1965088d79d6"
-
-S = "${WORKDIR}/git"
-
-inherit autotools
-
-# the hand coded asm uses r11, which therefore cannot be used for storing
-# the frame pointer when debugging on arm
-SELECTED_OPTIMIZATION_remove_arm = "-fno-omit-frame-pointer"
-
-PACKAGES =+ "${PN}-stats2gnuplot"
-
-FILES_${PN}-stats2gnuplot = "${bindir}/stats2gnuplot"
-
-RRECOMMENDS_${PN} = "${PN}-stats2gnuplot"
-
-PNBLACKLIST[pmbw] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130568/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb b/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
deleted file mode 100644
index b6098d84a..000000000
--- a/meta-oe/recipes-connectivity/gnokii/gnokii_0.6.31.bb
+++ /dev/null
@@ -1,36 +0,0 @@
-SUMMARY = "Cellphone tools and driver software"
-SECTION = "console/network"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2"
-
-DEPENDS = "glib-2.0 intltool-native"
-X11DEPENDS = " libxpm gtk+"
-
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[bluez4] = "--enable-bluetooth,--disable-bluetooth,bluez4"
-PACKAGECONFIG[libical] = "--enable-libical,--disable-libical,libical"
-PACKAGECONFIG[pcsc-lite] = "--enable-libpcsclite,--disable-libpcsclite,pcsc-lite"
-PACKAGECONFIG[readline] = "--with-readline,--without-readline,readline"
-PACKAGECONFIG[usb] = "--enable-libusb,--disable-libusb,virtual/libusb0"
-PACKAGECONFIG[x11] = ",--without-x,${X11DEPENDS}"
-
-inherit autotools pkgconfig
-
-PACKAGES += "libgnokii libgnokii-dev"
-
-EXTRA_OECONF = "--disable-smsd"
-
-FILES_${PN} = "${bindir} ${sbindir}"
-FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
-    ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
-    /lib/*.a /lib/*.o ${datadir}/aclocal \
-"
-FILES_${PN}-dev = ""
-FILES_libgnokii = "${libdir}/libgnokii.so.*"
-
-SRC_URI[md5sum] = "d9627f4a1152d3ea7806df4532850d5f"
-SRC_URI[sha256sum] = "8f5a083b05c1a66a3402ca5cd80084e14c2c0632c991bb53b03c78e9adb02501"
-
-PNBLACKLIST[gnokii] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130662/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/soft66/soft66_git.bb b/meta-oe/recipes-connectivity/soft66/soft66_git.bb
deleted file mode 100644
index 816f58350..000000000
--- a/meta-oe/recipes-connectivity/soft66/soft66_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Library and tools for Soft66ADD and related SDR radio receivers"
-LICENSE = "GPLv3 & LGPLv3+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
-                    file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02 "
-
-PNBLACKLIST[soft66] ?= "BROKEN: depends on broken libftdi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-DEPENDS = "libftdi"
-
-PV = "0.1.3+gitr${SRCPV}"
-PR = "r1"
-
-SRCREV = "a1dab25e73896c90c98227ac8055f227b830d512"
-SRC_URI = "git://home.horsten.com/soft66 \
-file://fix-ar.patch"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
diff --git a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb b/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
deleted file mode 100644
index 783bd5d73..000000000
--- a/meta-oe/recipes-connectivity/telepathy/libtelepathy_0.3.3.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-SUMMARY = "Telepathy framework"
-DESCRIPTION = "Telepathy is a D-Bus framework for unifying real time \
-communication, including instant messaging, voice calls and video calls.  It \
-abstracts differences between protocols to provide a unified interface for \
-applications."
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/"
-DEPENDS = "glib-2.0 dbus dbus-glib telepathy-glib libxslt-native"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-                    file://src/tp-conn.c;beginline=1;endline=19;md5=4c58069f77d601cc59200bce5396c7cb"
-PR = "r5"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/libtelepathy/libtelepathy-${PV}.tar.gz \
-    file://prefer_python_2.5.patch \
-    file://doublefix.patch \
-"
-
-SRC_URI[md5sum] = "490ca1a0c614d4466394b72d43bf7370"
-SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed115878"
-
-inherit autotools pkgconfig pythonnative
-
-FILES_${PN} += "${datadir}/telepathy \
-    ${datadir}/dbus-1"
-
-PNBLACKLIST[libtelepathy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130609/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb b/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
deleted file mode 100644
index 6a4d5d006..000000000
--- a/meta-oe/recipes-connectivity/telepathy/telepathy-mission-control_5.16.1.bb
+++ /dev/null
@@ -1,53 +0,0 @@
-SUMMARY = "Central control for Telepathy IM connection managers"
-HOMEPAGE = "http://telepathy.freedesktop.org/wiki/Mission_Control/"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
-                    file://src/request.h;beginline=1;endline=21;md5=f80534d9af1c33291b3b79609f196eb2"
-SECTION = "libs"
-DEPENDS = "libtelepathy dbus-glib gconf libxslt-native"
-
-SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-mission-control/${BP}.tar.gz \
-           file://tmc-Makefile-fix-race.patch \
-          "
-SRC_URI[md5sum] = "421115a35b9e427807326877f86e7f43"
-SRC_URI[sha256sum] = "14ceb7d53535b43d44b8271ad11319d1d0fe6d193d154636b9e62b42799b9723"
-
-inherit autotools-brokensep pkgconfig pythonnative
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[upower] = "--enable-upower,--disable-upower,upower"
-
-# to select connman or nm you need to use "connectivity" and "connman" or "nm", default is to disable both
-PACKAGECONFIG[connectivity] = ",--with-connectivity=no"
-PACKAGECONFIG[connman] = "--with-connectivity=connman,,connman"
-PACKAGECONFIG[nm] = "--with-connectivity=nm,,networkmanager"
-
-PACKAGES =+ " \
-    libmissioncontrol \
-    libmissioncontrol-config \
-    libmissioncontrol-server \
-    libmissioncontrol-dev \
-    libmissioncontrol-config-dev \
-    libmissioncontrol-server-dev \
-    libmissioncontrol-dbg \
-    libmissioncontrol-config-dbg \
-    libmissioncontrol-server-dbg \
-"
-
-FILES_${PN} += "${datadir}/dbus* ${datadir}/glib-2.0/schemas"
-
-FILES_libmissioncontrol = "${libdir}/libmissioncontrol.so.*"
-FILES_libmissioncontrol-config = "${libdir}/libmissioncontrol-config.so.*"
-FILES_libmissioncontrol-server = "${libdir}/libmissioncontrol-server.so.*"
-
-FILES_libmissioncontrol-dev = "${libdir}/libmissioncontrol.* \
-                               ${includedir}/libmissioncontrol/ \
-                               ${libdir}/pkgconfig/libmissioncontrol.pc"
-FILES_libmissioncontrol-config-dev = "${libdir}/libmissioncontrol-config.*"
-FILES_libmissioncontrol-server-dev = "${libdir}/libmissioncontrol-server.*"
-
-FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
-FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
-FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
-
-PNBLACKLIST[telepathy-mission-control] ?= "Depends on blacklisted libtelepathy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb b/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
deleted file mode 100644
index 7c833b0eb..000000000
--- a/meta-oe/recipes-connectivity/zeroc-ice/zeroc-ice_3.5.1.bb
+++ /dev/null
@@ -1,87 +0,0 @@
-DESCRIPTION = "The Internet Communications Engine"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://ICE_LICENSE;md5=3dc3037023cc2ae6b2c5b995da529515"
-DEPENDS = "bzip2 expat openssl python db mcpp"
-DEPENDS_prepend_class-target = "zeroc-ice-native "
-
-SRC_URI = "http://www.zeroc.com/download/Ice/3.5/Ice-${PV}.tar.gz \
-           file://0002-Modify-Makefile-for-cross-compile.patch \
-          "
-SRC_URI[md5sum] = "f00c59983cc904bca977133c0a9b3e80"
-SRC_URI[sha256sum] = "989e51194c6adadbd156da3288e37bad847b93b3b876502e83033b70493af392"
-
-#| MapDb.cpp: In constructor 'Freeze::MapDb::MapDb(const ConnectionIPtr&, const string&, const string&, const string&, const KeyCompareBasePtr&, const std::vector<IceUtil::Handle<Freeze::MapIndexBase> >&, bool)':
-#| MapDb.cpp:138:46: error: call of overloaded 'set_bt_compare(int (*)(DB*, const DBT*, const DBT*))' is ambiguous
-#| MapDb.cpp:138:46: note: candidates are:
-#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:272:14: note: virtual int Db::set_bt_compare(bt_compare_fcn_type) <near match>
-#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:272:14: note:   no known conversion for argument 1 from 'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, const __db_dbt*)}' to 'bt_compare_fcn_type {aka int (*)(__db*, const __db_dbt*, const __db_dbt*, long unsigned int*)}'
-#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note: virtual int Db::set_bt_compare(int (*)(Db*, const Dbt*, const Dbt*, size_t*)) <near match>
-#| /home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/db_cxx.h:273:14: note:   no known conversion for argument 1 from 'int (*)(DB*, const DBT*, const DBT*) {aka int (*)(__db*, const __db_dbt*, const __db_dbt*)}' to 'int (*)(Db*, const Dbt*, const Dbt*, size_t*) {aka int (*)(Db*, const Dbt*, const Dbt*, long unsigned int*)}'
-#| make[3]: *** [MapDb.o] Error 1
-PNBLACKLIST[zeroc-ice] ?= "BROKEN: not compatible with default db version - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-S = "${WORKDIR}/Ice-${PV}"
-
-inherit python-dir pkgconfig
-
-export PYTHON_VERSION = "python2.7"
-
-do_configure() {
-    :
-}
-
-do_compile_prepend_class-target () {
-    export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
-    export PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}"
-    export ICE_HOME="${STAGING_DIR_NATIVE}/usr"
-}
-
-do_compile_prepend_class-nativesdk () {
-    export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
-    export PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}"
-    export ICE_HOME="${STAGING_DIR_NATIVE}/usr"
-}
-
-do_compile_prepend_class-native () {
-    export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
-    export PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}"
-    export ICE_HOME="${S}/cpp"
-}
-
-do_compile() {
-    oe_runmake -C ${S} cpp
-    oe_runmake -C ${S} py
-}
-
-do_install_prepend_class-target () {
-    export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
-    export PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}"
-    export ICE_HOME="${STAGING_DIR_NATIVE}/usr"
-}
-
-do_install_prepend_class-nativesdk () {
-    export PYTHON_INCLUDE_DIR="${STAGING_INCDIR}/${PYTHON_DIR}"
-    export PYTHON_LIB_DIR="${STAGING_LIBDIR}/${PYTHON_DIR}"
-    export ICE_HOME="${STAGING_DIR_NATIVE}/usr"
-}
-
-do_install_prepend_class-native () {
-    export ICE_HOME="${S}/cpp"
-}
-
-do_install() {
-    oe_runmake -C ${S}/cpp prefix=${D}${prefix} install install-common
-    oe_runmake -C ${S}/py prefix=${D}${prefix} install
-}
-
-PACKAGES += "${PN}-python ${PN}-python-dev ${PN}-python-dbg"
-
-FILES_${PN}-doc += "${prefix}/man/man1"
-FILES_${PN} += "${prefix}/*LICENSE ${libdir}/ImportKey.class ${prefix}/RELEASE_NOTES ${prefix}/CHANGES"
-FILES_${PN}-dev += "${includedir} ${prefix}/slice ${prefix}/config"
-FILES_${PN}-python-dev = "${PYTHON_SITEPACKAGES_DIR}/IcePy.so"
-FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.py ${PYTHON_SITEPACKAGES_DIR}/IcePy.so.* ${PYTHON_SITEPACKAGES_DIR}/Ice*/*.py"
-FILES_${PN}-python-dbg = "${PYTHON_SITEPACKAGES_DIR}/.debug"
-FILES_${PN}-dev += "${bindir}/slice* ${datadir}/Ice-${PV}/slice/*"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
deleted file mode 100644
index 9d50ea44a..000000000
--- a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-require fakeroot_${PV}.bb
-
-S = "${WORKDIR}/fakeroot-${PV}"
-
-inherit native
-
-EXTRA_OECONF = "--program-prefix="
-
-# Compatability for the rare systems not using or having SYSV
-python () {
-    if d.getVar('HOST_NONSYSV') and d.getVar('HOST_NONSYSV') != '0':
-        d.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ')
-}
-
-RDEPENDS_${PN} = "util-linux-native"
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
deleted file mode 100644
index 0a787e3ea..000000000
--- a/meta-oe/recipes-core/fakeroot/fakeroot_1.18.4.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-SUMMARY = "Gives a fake root environment"
-HOMEPAGE = "http://fakeroot.alioth.debian.org"
-SECTION = "base"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
-
-SRC_URI = "\
-    ${DEBIAN_MIRROR}/main/f/fakeroot/fakeroot_${PV}.orig.tar.bz2 \
-"
-
-inherit autotools
-
-do_configure_prepend() {
-    mkdir -p ${S}/build-aux
-}
-
-do_install_append() {
-    install -d ${D}${includedir}/fakeroot
-    install -m 644 *.h ${D}${includedir}/fakeroot
-}
-
-# fakeroot needs getopt which is provided by the util-linux package
-RDEPENDS_${PN} = "util-linux"
-
-
-SRC_URI[md5sum] = "706171d8d520b1ca1576ac73f2ceb4f3"
-SRC_URI[sha256sum] = "0a359efa3e9496c33234b3e9c89306a09bb4da9d33de43c261f1d8447e6ebea2"
-
-# http://errors.yoctoproject.org/Errors/Details/35143/
-PNBLACKLIST[fakeroot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb b/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
deleted file mode 100644
index 697f9bfa5..000000000
--- a/meta-oe/recipes-core/packagegroups/packagegroup-cli-tools.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "A set of useful command line tools"
-SUMMARY_${PN}-debug = "A set of command line tools useful for debugging"
-SECTION = "console"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PV = "1.0"
-PR = "r21"
-
-inherit packagegroup allarch
-
-PACKAGES += "${PN}-debug"
-
-RDEPENDS_${PN} = "\
-    dbus-daemon-proxy \
-    dosfstools \
-    htop \
-    iptables \
-    lsof \
-    mbuffer \
-    mtd-utils \
-    nano \
-    nfs-utils-client \
-    nmon \
-    powertop \
-    screen \
-    socat \
-    sysstat \
-"
-
-RDEPENDS_${PN}-debug = "\
-    evtest \
-    devmem2 \
-    i2c-tools \
-    gdb \
-    procps \
-    pxaregs \
-    s3c24xx-gpio \
-    s3c64xx-gpio \
-    serial-forward \
-    strace \
-"
-
-RRECOMMENDS_${PN}-debug = "\
-    ltrace \
-"
-
-PNBLACKLIST[packagegroup-cli-tools] ?= "Runtime depends on blacklisted dbus-daemon-proxy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[packagegroup-cli-tools] ?= "Runtime depends on blacklisted packagegroup-cli-tools - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
deleted file mode 100644
index c6d78905d..000000000
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ /dev/null
@@ -1,118 +0,0 @@
-SUMMARY = "Meet Cloud9, development-as-a-service for Javascripters and other developers"
-HOMEPAGE = "http://c9.io"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
-
-PR = "r5"
-
-# Nodejs-native for node-waf, nodejs4-native for the headers
-DEPENDS = "libxml2 nodejs-native nodejs4-native"
-
-PNBLACKLIST[cloud9] ?= "Not comatible with current nodejs 0.12, but upstream is working on it for v3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-inherit systemd
-
-SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
-           git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
-           git://github.com/ajaxorg/ace.git;destsuffix=git/support/ace;name=ace \
-           git://github.com/ajaxorg/ace.wiki.git;destsuffix=git/support/ace/doc/wiki;name=acewiki \
-           git://github.com/ajaxorg/apf.git;destsuffix=git/support/apf;name=apf \
-           git://github.com/ajaxorg/async.js.git;destsuffix=git/support/asyncjs;name=asyncjs \
-           git://github.com/ajaxorg/connect.git;destsuffix=git/support/connect;name=connect;branch=ajaxorg \
-           git://github.com/jashkenas/coffee-script.git;destsuffix=git/support/connect/support/coffee-script;name=coffee-script \
-           git://github.com/visionmedia/expresso.git;destsuffix=git/support/connect/support/expresso;name=expresso \
-           git://github.com/visionmedia/node-jscoverage.git;destsuffix=git/support/connect/support/expresso/deps/jscoverage;name=jscoverage \
-           git://github.com/cloudhead/less.js.git;destsuffix=git/support/connect/support/less;name=less \
-           git://github.com/matehat/sass.js.git;destsuffix=git/support/connect/support/sass;name=sass \
-           git://github.com/ajaxorg/jsDAV.git;destsuffix=git/support/jsdav;name=jsdav \
-           git://github.com/fjakobs/async.js.git;destsuffix=git/support/jsdav/support/async.js;name=async-js \
-           git://github.com/felixge/node-formidable.git;destsuffix=git/support/jsdav/support/formidable;name=formidable \
-           git://github.com/ajaxorg/jsftp.git;destsuffix=git/support/jsdav/support/jsftp;name=jsftp \
-           git://github.com/Gozala/streamer.git;destsuffix=git/support/jsdav/support/jsftp/support/streamer;name=streamer \
-           git://github.com/ajaxorg/node-sftp.git;destsuffix=git/support/jsdav/support/node-sftp;name=sftp \
-           git://github.com/ajaxorg/lib-v8debug.git;destsuffix=git/support/lib-v8debug;name=lib-v8debug \
-           git://github.com/ajaxorg/socket.io.git;destsuffix=git/support/socket.io;name=socketio;branch=cadorn-upstream \
-           git://github.com/LearnBoost/socket.io-client.git;destsuffix=git/support/socket.io-client;name=socketio-client \
-           git://github.com/ajaxorg/treehugger.git;destsuffix=git/support/treehugger;name=treehugger \
-           git://github.com/ajaxorg/UglifyJS.git;destsuffix=git/support/uglify-js;name=uglify-js \
-           file://index.js \
-           file://cloud9-avahi.service \
-           file://cloud9.service \
-           file://0001-ide-use-node-as-interpreter-for-sketches-instead-of-.patch \
-"
-
-SRCREV_cloud9ide = "c4e2574896a22bb749f0500b25f41c888d346bed"
-SRCREV_o3 = "d66d4e3252e505f44ada6804c8cab39915ce8afd"
-SRCREV_ace = "0fc5392cbe46fb134052c3065a238ad8e3b31cfd"
-SRCREV_acewiki = "d2a65d0addc2e5ab922bbff9cb6022a4652b4f13"
-SRCREV_apf = "2560b762b2b0e5a8b46f8a4062f927a9a9d239f4"
-SRCREV_asyncjs = "d36ead408e2959b1e99572114ef3a1b6a48c1072"
-SRCREV_connect = "6bec95b51f2286b942bc7f340d62d816bcdc13d4"
-SRCREV_coffee-script = "a53c104db16d3ac9d13cf9f16834edec250b9749"
-SRCREV_expresso = "7f10ab7fa655299b4e2f519065b0495e6ac34ef2"
-SRCREV_jscoverage = "0d4608a6b4275b020ba665389aa75897d5d4a584"
-SRCREV_less = "a2807288008587b95c6c2f8ba5cac16f1bcab98f"
-SRCREV_sass = "4dfd4c699e7a8baf226215ab044854c4507f4420"
-SRCREV_jsdav = "f04ebf3d012cc8aeabfcfb2b8fab8966d52929e9"
-SRCREV_async-js = "92fb710a70efd3cdc2376ebfba71a7fb3a4f1651"
-SRCREV_formidable = "a37292d4b7d6d76a38909ed670334c9068d40871"
-SRCREV_jsftp = "e3f10c8927347c170cdd0150ef38e18272acf942"
-SRCREV_streamer = "1a7f75d4065819171ac91a09974199b932dbe17d"
-SRCREV_sftp = "a0539345134970d7535a19cb2608e3d1bc119d71"
-SRCREV_lib-v8debug = "7c11897f4bc77c7275c2b6dff5becc72ac018662"
-SRCREV_socketio = "735d5239b325df2ba67d2b9bb4ec32442283bc06"
-SRCREV_socketio-client = "4375ef1344ecb8ad75a3848a00af6b391822f86b"
-SRCREV_treehugger = "436d0d6dd0ce43782e6be08ad12c356730626996"
-SRCREV_uglify-js = "941c845c4a01e4e47a158458fe846eb36d0828ad"
-
-SRCREV_FORMAT = "cloud9ide"
-
-S = "${WORKDIR}/git"
-
-do_configure () {
-    cd ${WORKDIR}/o3
-    node-waf -vv configure
-}
-
-EXTRA_CXXFLAGS = "-Idefault/include -I../include -Idefault/hosts -I../hosts -Idefault/modules -I../modules -Idefault/deps -I../deps -I${STAGING_DIR_NATIVE}/usr/include/node4 -fPIC -DPIC"
-
-do_compile () {
-    cd ${WORKDIR}/o3
-    node4 tools/gluegen.js
-    cd hosts
-    ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o sh_node.o node-o3/sh_node.cc
-    ${CXX} ${TARGET_CXXFLAGS} ${EXTRA_CXXFLAGS} -c -o sh_node_libs.o node-o3/sh_node_libs.cc
-    cd ..
-    ${CXX} ${TARGET_LDFLAGS} hosts/sh_node.o hosts/sh_node_libs.o -o o3.node -shared -Wl,-Bdynamic -lxml2
-}
-
-do_install () {
-    install -m 0755 -d ${D}${datadir}/cloud9 ${D}${bindir} ${D}/var/lib/cloud9
-    rsync -r --exclude=".*" ${S}/* ${D}${datadir}/cloud9
-
-    touch ${D}${bindir}/cloud9
-    echo "#!/bin/sh" > ${D}${bindir}/cloud9
-    echo "node4 ${datadir}/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000" >> ${D}${bindir}/cloud9
-    chmod 0755 ${D}${bindir}/cloud9
-
-    install -m 0755 -d ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml
-    install -m 0644 ${WORKDIR}/index.js ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/index.js
-    install -m 0644 ${WORKDIR}/o3/modules/o3.js ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.js
-    install -m 0755 ${WORKDIR}/o3/o3.node ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.node
-
-     install -m 0755 -d ${D}${sysconfdir}/avahi/services/
-     install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
-
-     install -d ${D}${systemd_unitdir}/system
-     install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system
-}
-
-FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/.debug \
-                    ${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/.debug \
-"
-
-RDEPENDS_${PN} = "nodejs4 nodejs gzip"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "cloud9.service"
diff --git a/meta-oe/recipes-devtools/dt/dt_18.32.bb b/meta-oe/recipes-devtools/dt/dt_18.32.bb
deleted file mode 100644
index 0234f765a..000000000
--- a/meta-oe/recipes-devtools/dt/dt_18.32.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "Generic data test program"
-DESCRIPTION = "The Data Test Program (dt) is a generic data test program used to verify proper \
-operation of peripherals, file systems, device drivers, or any data stream supported by the \
-operating system."
-HOMEPAGE = "http://www.scsifaq.org/RMiller_Tools/dt.html"
-
-SECTION = "console/tests"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=be8bb25bbcfaa0725710d188e5152668"
-
-# Source URI taken from Fedora RPM spec file at:
-#  http://pkgs.fedoraproject.org/git/rpms/dt.git
-SRC_URI = "http://dl.dropboxusercontent.com/u/32363629/Datatest/dt-source-v${PV}.tar.gz \
-           file://dt-default-source-define.patch \
-           file://dt-wformat-security.patch \
-           file://Stop-using-relative-path-for-scsilib.c-link.patch \
-           file://Use-tcsh-shell.patch \
-"
-
-SRC_URI[md5sum] = "3054aeaaba047a1dbe90c2132a382ee2"
-SRC_URI[sha256sum] = "10d164676e918a4d07f233bcd11e4cb6bfd1052c996182cd1827ccd0c063fcc6"
-
-S = "${WORKDIR}/dt.v${PV}"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-EXTRA_OEMAKE += "-f Makefile.linux \
-                 OS=linux \
-                 CFLAGS="-I.. -DAIO -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -DTHREADS -DSCSI""
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    install -Dm755 dt ${D}${sbindir}/dt
-    install -Dm644 Documentation/dt.man ${D}${mandir}/man8/dt.8
-
-    install -d ${D}${datadir}/dt/
-    install -d ${D}${docdir}/dt/html/
-    install -m755 Scripts/dt? ${D}${datadir}/dt/
-    install -m644 data/pattern_* ${D}${datadir}/dt/
-    install -m644 html/* ${D}${docdir}/dt/html/
-}
-
-RDEPENDS_${PN} += "tcsh"
-
-PNBLACKLIST[dt] ?= "Rdepends on blacklisted tcsh - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
deleted file mode 100644
index b13bd7bcc..000000000
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_1.0.0.bb
+++ /dev/null
@@ -1,97 +0,0 @@
-SUMMARY = "Embedded Linux Device Driver Tests based on Linux Test Project"
-HOMEPAGE = "http://arago-project.org/git/projects/test-automation/ltp-ddt.git"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-PROVIDES += "ltp"
-DEPENDS += "zip-native virtual/kernel alsa-lib"
-
-RDEPENDS_${PN} += "pm-qa serialcheck"
-
-inherit autotools module-base kernel-module-split
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-SRCREV = "f086bed6cc88bf102eaad0e96cb7ebe79944a8ad"
-BRANCH ?= "master"
-
-SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
-    file://ltp-Do-not-link-against-libfl.patch \
-"
-
-S = "${WORKDIR}/git"
-
-LTPROOT = "/opt/ltp"
-
-EXTRA_OEMAKE_append = " \
-    prefix=${LTPROOT} \
-    CROSS_COMPILE=${HOST_PREFIX} \
-    SKIP_IDCHECK=1 \
-    KERNEL_PATH=${STAGING_KERNEL_DIR} \
-    KERNEL_INC=${STAGING_KERNEL_DIR} \
-    KERNEL_USR_INC=${STAGING_INCDIR} \
-    ALSA_INCPATH=${STAGING_INCDIR} \
-    ALSA_LIBPATH=${STAGING_LIBDIR} \
-    PLATFORM=${MACHINE} \
-    RANLIB=${RANLIB} \
-    DESTDIR=${D} \
-    CC='${CC}' \
-    KERNEL_CC='${KERNEL_CC}' \
-"
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-FILES_${PN}-dbg += " \
-    ${LTPROOT}/.debug \
-    ${LTPROOT}/bin/.debug \
-    ${LTPROOT}/runtest/.debug \
-    ${LTPROOT}/testcases/bin/.debug \
-    ${LTPROOT}/testcases/bin/*/bin/.debug \
-    ${LTPROOT}/testcases/bin/*/test/.debug \
-    ${LTPROOT}/testcases/bin/ddt/.debug \
-    ${LTPROOT}/testcases/bin/ddt/*/bin/.debug \
-    ${LTPROOT}/testcases/bin/ddt/*/test/.debug \
-    ${LTPROOT}/testcases/realtime/*/*/.debug \
-"
-
-FILES_${PN}-staticdev += "${LTPROOT}/lib"
-FILES_${PN} += "${LTPROOT}/*"
-
-KERNEL_MODULES_META_PACKAGE = "${PN}"
-
-kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
-
-# ltp doesn't regenerate ffsb-6.0-rc2 configure and hardcode configure call.
-# we explicitly force regeneration of that directory and pass configure options.
-do_configure_append() {
-    (cd utils/ffsb-6.0-rc2; autoreconf -fvi; ./configure ${CONFIGUREOPTS})
-}
-
-# The makefiles make excessive use of make -C and several include testcases.mk
-# which triggers a build of the syscall header. To reproduce, build ltp,
-# then delete the header, then "make -j XX" and watch regen.sh run multiple
-# times. Its easier to generate this once here instead.
-do_compile_prepend () {
-    ( make -C ${B}/testcases/kernel include/linux_syscall_numbers.h )
-}
-
-do_compile_append () {
-    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
-    oe_runmake modules
-}
-
-do_install() {
-    oe_runmake install
-    install -d ${D}${datadir}
-    install -d ${D}${kmoddir}
-    mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
-}
-
-# do_make_scripts should be a separate task for the lock to work
-addtask make_scripts before do_compile
-do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
-do_make_scripts[deptask] = "do_populate_sysroot"
-
-# http://errors.yoctoproject.org/Errors/Details/56327/
-PNBLACKLIST[ltp-ddt] ?= "BROKEN: fails since last autotools.bbclass changes - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb b/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
deleted file mode 100644
index 1b60c470d..000000000
--- a/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SUMMARY = "PackageKit package management abstraction"
-SECTION = "libs"
-LICENSE = "GPL-2.0+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "gtk+ python polkit dbus dbus-glib glib-2.0 sqlite3 opkg intltool intltool-native"
-RDEPENDS_${PN} = "opkg bash"
-
-inherit gnome pythonnative
-
-SRC_URI = "http://www.freedesktop.org/software/PackageKit/releases/PackageKit-${PV}.tar.bz2;name=archive \
-           file://configurefix.patch \
-           file://opkgfixes.patch \
-           file://0001-Don-t-call-deprecated-glib-functions-and-use-the-new.patch \
-          "
-
-SRC_URI[archive.md5sum] = "33a3127e9ed41e26671786aee9fe56ff"
-SRC_URI[archive.sha256sum] = "8dae41493dfb011442746d252b3435bf3204e17bf7c47e396f90fbd215260e14"
-
-S = "${WORKDIR}/PackageKit-${PV}"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[service-packs] = "--enable-service-packs,--disable-service-packs,libarchive"
-
-EXTRA_OECONF = "--with-security-framework=dummy \
-                --with-default-backend=opkg \
-                --enable-opkg \
-                --disable-tests \
-                --disable-ruck \
-                --disable-qt \
-                --disable-gstreamer-plugin \
-                --disable-local  \
-                --disable-networkmanager \
-                --disable-device-rebind \
-                ac_cv_path_XMLTO=no \
-"
-
-#do_configure_prepend() {
-#    mkdir -p m4
-#    echo "EXTRA_DIST=" > gtk-doc.make
-#}
-
-do_configure_append() {
-    for i in $(find . -name Makefile) ; do
-        sed -i -e s:${STAGING_DIR_NATIVE}::g \
-               -e s:/usr/bin/intltool-merge:${STAGING_BINDIR_NATIVE}/intltool-merge:g \
-               $i
-    done
-}
-
-PACKAGES =+ "${PN}-website"
-FILES_${PN}-website = "${datadir}/PackageKit/website"
-
-PACKAGES =+ "${PN}-python"
-FILES_${PN}-python = "${libdir}/python*"
-
-PACKAGES =+ "${PN}-gtkmodule"
-FILES_${PN}-gtkmodule = "${libdir}/gtk-2.0/*/*.so"
-
-FILES_${PN} += "${libdir}/packagekit-backend/*.so ${libdir}/pm-utils ${datadir}/dbus-1/system-services/ ${datadir}/PolicyKit ${datadir}/PackageKit"
-FILES_${PN}-dbg += "${libdir}/packagekit-backend/.debug/*.so ${libdir}/gtk-2.0/*/.debug"
-FILES_${PN}-dev += "${libdir}/packagekit-backend/*.la ${libdir}/gtk-2.0/*/*.la"
-FILES_${PN}-staticdev += "${libdir}/packagekit-backend/*.a ${libdir}/gtk-2.0/*/*.a"
-
-# PackageKit-0.5.6/backends/opkg/pk-backend-opkg.c:31:26: fatal error: libopkg/opkg.h: No such file or directory
-PNBLACKLIST[packagekit] ?= "BROKEN: depends on old deprecated libopkg which is currently disabled and will be removed soon - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
deleted file mode 100644
index 19e3dceca..000000000
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_0.4.0.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require vala-dbus-binding-tool.inc
-
-SRC_URI[md5sum] = "59eab7abf38f35355d3786803bd2441f"
-SRC_URI[sha256sum] = "1e37ab2e6238eaef9f573560ea7379e6955570f7c9503083e50c4c185c1956df"
-
-PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/131628/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
deleted file mode 100644
index 32f34550d..000000000
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-require vala-dbus-binding-tool.inc
-
-# Temporary remove negative preference, because there are 2 versions of 0.4.0 archives:
-# the original one depending on libgee1.0 from
-# http://downloads.freesmartphone.org/sources/${BPN}/${BP}.tar.bz2
-# and new one depending on libgee0.8 from
-# http://sourceforge.net/projects/freesmartphone/files/sources/
-# The original one can be already deployed on various premirrors,
-# so prefer the git recipe which doesn't suffer from this issue
-# DEFAULT_PREFERENCE = "-1"
-
-SRCREV = "742c04c2bb0743891904522ce47e50f9e5c99b12"
-PV = "0.4.0+gitr${SRCPV}"
-
-SRC_URI = "git://github.com/freesmartphone/vala-dbus-binding-tool.git;protocol=https \
-    file://0001-configure.ac-don-t-use-dash-in-m4-macro-names.patch \
-"
-S = "${WORKDIR}/git"
-
-PNBLACKLIST[vala-dbus-binding-tool] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130581/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
deleted file mode 100644
index 081bd3bc0..000000000
--- a/meta-oe/recipes-extended/openlmi/openlmi-networking_0.3.1.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "CIM providers for network management"
-DESCRIPTION = "\
-openlmi-networking is set of CMPI providers for network management using \
-Common Information Model (CIM)."
-HOMEPAGE = "http://www.openlmi.org/"
-LICENSE = "LGPL-2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
-SECTION = "System/Management"
-DEPENDS = "openlmi-providers konkretcmpi konkretcmpi-native sblim-cmpi-devel cim-schema-exper networkmanager dbus libcheck glib-2.0"
-
-SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
-           file://0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch \
-          "
-SRC_URI[md5sum] = "f20de8c76fb6a80001b14c1eb035953e"
-SRC_URI[sha256sum] = "578eaa5c65fe924b5d7aeb635509dd46443166cd6a88b019bc42646e3518a460"
-
-inherit cmake
-
-EXTRA_OECMAKE = "${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-                "
-
-
-do_configure_prepend() {
-     export CMAKE_INSTALL_DATDIR="${STAGING_DATADIR}"
-}
-
-
-FILES_${PN} =+ "${libdir}/cmpi/libcmpiLMI_Networking.so ${prefix}/libexec*"
-FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug*"
-
-PNBLACKLIST[openlmi-networking] ?= "Depends on blacklisted openlmi-providers - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb b/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
deleted file mode 100644
index 2eda65320..000000000
--- a/meta-oe/recipes-extended/openlmi/openlmi-providers_0.6.0.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "Set of basic CIM providers"
-DESCRIPTION = "\
-openlmi-providers is set of (usually) small CMPI providers (agents) for \
-basic monitoring and management of host system using Common Information \
-Model (CIM)."
-HOMEPAGE = "http://www.openlmi.org/"
-LICENSE = "LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7c13b3376cea0ce68d2d2da0a1b3a72c"
-SECTION = "System/Management"
-DEPENDS = "konkretcmpi-native konkretcmpi sblim-sfcb sblim-cmpi-devel cim-schema-exper lmsensors libuser swig swig-native dbus udev systemd-systemctl-native pciutils"
-
-SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz \
-           file://0001-fix-error.patch \
-           file://0001-fix-lib64-can-not-be-shiped-in-64bit-target.patch \
-          "
-SRC_URI[md5sum] = "5904f23cf494946237cfbbdbe644a3cd"
-SRC_URI[sha256sum] = "e2b2fbeaec45a83905d0da3b87da83904d9cd94c1b86312f844587b3fff11f56"
-
-inherit cmake
-LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
-EXTRA_OECMAKE = " \
-                 -DWITH-DEVASSISTANT=OFF \
-                 -DWITH-JOURNALD=OFF \
-                 -DWITH-SERVICE=OFF \
-                 -DWITH-SERVICE-LEGACY=ON \
-                 -DWITH-ACCOUNT=OFF \
-                 -DWITH-PCP=OFF \
-                 -DWITH-REALMD=OFF \
-                 -DWITH-FAN=OFF \
-                 -DWITH-LOCALE=OFF \
-                 -DWITH-INDSENDER=OFF \
-                 -DWITH-JOBMANAGER=OFF \
-                 -DWITH-SSSD=OFF \
-                 -DWITH-SELINUX=OFF \
-                 -DWITH-SOFTWARE-DBUS=ON \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-               "
-
-do_configure_prepend() {
-    export CMAKE_INSTALL_DATDIR="${STAGING_DATADIR}"
-}
-
-do_install_append() {
-    if [ -d ${D}${prefix}${sysconfidr} ]; then
-        mv ${D}${prefix}${sysconfdir} ${D}${sysconfdir}
-    fi
-}
-
-FILES_${PN} =+ "${libdir}/cmpi/libcmpiLMI* ${prefix}/libexec*"
-FILES_${PN}-dev =+ "${datadir}/cmake*"
-FILES_${PN}-dbg =+ "${libdir}/cmpi/.debug*"
-
-RDEPENDS_${PN} = "python"
-
-PNBLACKLIST[openlmi-providers] ?= "Depends on blacklisted lmsensors - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb b/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
deleted file mode 100644
index f99b77ca4..000000000
--- a/meta-oe/recipes-extended/openlmi/openlmi-storage_0.8.1.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "CIM providers for storage management"
-DESCRIPTION = "\
-The openlmi-storage package contains CMPI providers for management of storage \
-using Common Information Managemen (CIM) protocol. \
-\
-The providers can be registered in any CMPI-aware CIMOM, both OpenPegasus and \
-SFCB were tested."
-HOMEPAGE = "http://www.openlmi.org/"
-LICENSE = "LGPL-2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-SECTION = "System/Management"
-DEPENDS = "openlmi-providers pywbem cmpi-bindings"
-RDEPENDS_${PN} += "bash"
-
-SRC_URI = "http://fedorahosted.org/released/${BPN}/${BP}.tar.gz"
-SRC_URI[md5sum] = "898cf0d8c03b8ad6b45d65f335ddee0d"
-SRC_URI[sha256sum] = "4a1ba9957750f94ea58a89cea28985564f38d7cc9aa00fcae20c51e7b32bd0a8"
-
-inherit setuptools
-
-do_install_append() {
-    install -m 755 -d ${D}${datadir}/${BPN}
-    install -m 644 ${S}/mof/* ${D}${datadir}/${BPN}/
-
-    install -m 755 -d ${D}${sysconfdir}/openlmi/storage
-    install -m 644 storage.conf ${D}${sysconfdir}/openlmi/storage/storage.conf
-
-    install -m 755 -d ${D}${libexecdir}/pegasus
-    install -m 755 pycmpiLMI_Storage-cimprovagt ${D}${libexecdir}/pegasus/
-}
-
-FILES_${PN} =+ "${sysconfdir}/openlmi/storage/storage.conf ${datadir}/${BPN}/*"
-
-PNBLACKLIST[openlmi-storage] ?= "Depends on blacklisted pywbem - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
deleted file mode 100644
index 90adaf487..000000000
--- a/meta-oe/recipes-extended/subsurface/subsurface_git.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "Subsurface is an open source dive log program"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS = "libdivecomputer gtk+ libxml2 glib-2.0 gconf"
-
-PNBLACKLIST[subsurface] ?= "Needs to be upgraded for compatibility with new libdivecomputer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-inherit gtk-icon-cache cmake
-
-inherit gitpkgv
-PKGV = "${GITPKGVTAG}"
-PV = "4.2"
-
-SRCREV = "f61ee20ba356ecfc4c5b247f548f52d588179c94"
-SRC_URI = "git://subsurface.hohndel.org/subsurface.git"
-S = "${WORKDIR}/git"
-
-#FILES_${PN} += "${datadir}/icons/hicolor/scalable/apps/subsurface.svg"
-RRECOMMENDS_${PN}_append_libc-glibc = " glibc-gconv-iso8859-15"
-
diff --git a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb b/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
deleted file mode 100644
index 34b7aa64a..000000000
--- a/meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Gtk+Extra is a set of custom widget for plots and images"
-HOMEPAGE = "http://gtkextra.sourceforge.net/"
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/gtkextra/${BP}.tar.gz \
-           file://remove-tutorial.patch \
-"
-
-SRC_URI[md5sum] = "486cea93666020f85f101ed8341baf41"
-SRC_URI[sha256sum] = "9cab6c5d6b792eb828d17cec2b9c1baba2ef57f789a290464afab80b53969e65"
-
-DEPENDS = "gtk+"
-
-inherit autotools pkgconfig gobject-introspection
-
-# | ./.libs/libgtkextra-x11-3.0.so: error: undefined reference to 'roundint'
-PNBLACKLIST[gtkextra] ?= "BROKEN: Fails to build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb b/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
deleted file mode 100644
index 021b077de..000000000
--- a/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SECTION = "libs"
-DEPENDS = "gtk+ glib-2.0 libxml2"
-SUMMARY = "A GTK+ HTML rendering library"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
-
-SRCREV = "1161"
-PV = "2.11.0+svnr${SRCPV}"
-PR = "r5"
-
-SRC_URI = "svn://svn.gnome.org/svn/gtkhtml2/;module=trunk;protocol=http \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-stylesheet-user.patch;striplevel=0;name=patch2 \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/css-media.patch;striplevel=0;name=patch3 \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-end-element-signal.patch;striplevel=0;name=patch4 \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/add-dom-functions.patch;striplevel=0;name=patch5 \
-           http://git.yoctoproject.org/cgit/cgit.cgi/web-patches/plain/iain-mem-leak.patch;striplevel=0;name=patch6 \
-           file://0001-tests-main.c-fix-build-with-glib-2.36.patch \
-"
-
-SRC_URI[patch2.md5sum] = "05fc3627ca364095702dc804f41c8391"
-SRC_URI[patch2.sha256sum] = "df5cca50a8f95333505d7920929fea251daea3be25be6834a1c50a742d9eb674"
-
-SRC_URI[patch3.md5sum] = "d3fe4cda3545f3e4718f1acc186608ab"
-SRC_URI[patch3.sha256sum] = "3aefaa17ffa38143bf5df1161c51ab402d35bfbee41ab4643c313edf569165d5"
-
-SRC_URI[patch4.md5sum] = "651b1601d8a1b21c8a3040fadb729043"
-SRC_URI[patch4.sha256sum] = "d067e8331bf9c6851f1c6067d991a7f54327f532900b405ebdf8e149c071f381"
-
-SRC_URI[patch5.md5sum] = "041be9711a16e629d01487664ba97152"
-SRC_URI[patch5.sha256sum] = "42956fb41341cf82ae8bce18b4cf96a7e2aa631b1b60657afb6d7e9be7cd138c"
-
-SRC_URI[patch6.md5sum] = "4e11dc7899d68f2be2e06ccee01d296d"
-SRC_URI[patch6.sha256sum] = "1e2cc080e654c1839c5cb4b4adf4c62a23e7da208427f3ba0b16cfed9e5cfa98"
-
-S = "${WORKDIR}/trunk"
-
-inherit pkgconfig autotools
-
-EXTRA_OECONF = " --disable-accessibility"
-
-PNBLACKLIST[gtkhtml2] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130633/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb b/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
deleted file mode 100644
index d73e2f15e..000000000
--- a/meta-oe/recipes-graphics/clutter/clutter-box2d_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-require clutter-box2d.inc
-
-LIC_FILES_CHKSUM = "file://box2d/License.txt;md5=e5d39ad91f7dc4692dcdb1d85139ec6b"
-
-# 0.12.1+gitAUTOINC+de5452e56b-r1/git/clutter-box2d/clutter-box2d.h:226:47:
-#  fatal error: clutter-box2d/clutter-box2d-child.h: No such file or directory
-# |  #include <clutter-box2d/clutter-box2d-child.h>
-PNBLACKLIST[clutter-box2d] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRCREV = "de5452e56b537a11fd7f9453d048ff4b4793b5a2"
-PV = "0.12.1+git${SRCPV}"
-PR = "r1"
-
-SRC_URI = "git://git.gnome.org/clutter-box2d.git"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "clutter-1.0"
-PROVIDES = "clutter-box2d-1.6"
diff --git a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb b/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
deleted file mode 100644
index 7d1a3aaa8..000000000
--- a/meta-oe/recipes-graphics/fim/fim_0.4-rc1.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-SUMMARY = "Framebuffer (scriptable) image viewer"
-DESCRIPTION = "FIM (Fbi IMproved) aims to be a highly customizable and scriptable \
-               image viewer targeted at users who are comfortable with software \
-               like the Vim text editor or the Mutt mail user agent."
-SECTION = "utils"
-HOMEPAGE = "http://www.autistici.org/dezperado/fim/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fa01bff138cc98a62b8840a157951c88"
-
-PNBLACKLIST[fim] ?= "BROKEN: doesn't build with B!=S (flex: can't open lex.lex) - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-# flex with provide /usr/include/FlexLexer.h
-DEPENDS = "flex-native bison-native flex"
-
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/fbi-improved/${BPN}-${PV}.tar.gz \
-           file://cross_cc.patch"
-SRC_URI[md5sum] = "d7362dde5541c2b6439c35c6e2bd5046"
-SRC_URI[sha256sum] = "3f6bf2de2952b9adcbeb3db12c2a979e999a81dd1e314a03bc58e24f1ea9f686"
-
-PARALLEL_MAKE = ""
-
-inherit autotools pkgconfig
-
-# Don't use provided regex.c
-EXTRA_OECONF = "fim_cv_regex=no fim_cv_regex_broken=no \
-    --enable-framebuffer \
-    --disable-djvu \
-    --disable-ps \
-    --disable-xcftopnm \
-    --disable-convert \
-    --disable-inkscape \
-    --disable-xfig \
-    --disable-dia \
-    --disable-aa \
-    --disable-sdl \
-    --enable-read-dirs \
-    --enable-recursive-dirs \
-    --enable-custom-status-bar \
-"
-
-# Note: imlib2 is located in meta-efl layer.
-PACKAGECONFIG ?= "jpeg rl hf"
-PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
-PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[tiff] = "--enable-tiff,--disable-tiff,tiff"
-PACKAGECONFIG[gif] = "--enable-gif,--disable-gif,giflib"
-PACKAGECONFIG[pdf] = "--enable-poppler,--disable-poppler,poppler"
-PACKAGECONFIG[magick] = "--enable-graphicsmagick,--disable-graphicsmagick,imagemagick"
-PACKAGECONFIG[imlib2] = "--enable-imlib2,--disable-imlib2,imlib2"
-PACKAGECONFIG[rl] = "--enable-readline,--disable-readline,readline"
-PACKAGECONFIG[hf] = "--enable-hardcoded-font,--disable-hardcoded-font"
diff --git a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
deleted file mode 100644
index 2ba1ebbb7..000000000
--- a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require libsexy.inc
-
-PR = "r2"
-
-SRC_URI[md5sum] = "33c079a253270ec8bfb9508e4bb30754"
-SRC_URI[sha256sum] = "8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e"
-
-PNBLACKLIST[libsexy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb b/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
deleted file mode 100644
index 2fbdcab46..000000000
--- a/meta-oe/recipes-graphics/slim/slim_1.3.2.bb
+++ /dev/null
@@ -1,82 +0,0 @@
-DESCRIPTION="Simple Login Manager"
-HOMEPAGE="http://slim.berlios.de"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-PR = "r1"
-
-DEPENDS = "virtual/libx11 libxmu libpng jpeg freetype sessreg ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SRC_URI = " \
-    http://download.berlios.de/${BPN}/${BP}.tar.gz \
-    file://0002-Fix-image-handling-integer-overflows.patch \
-    file://0003-Fix-build-failure-with-ld-as-needed.patch \
-    file://0004-Add-support-libpng15.patch \
-    file://0005-Remove-path-of-gcc-amd-g-and-version-of-g.patch \
-    file://0006-Remove-localhost-from-Authenticator-of-pam.patch \
-    file://0007-Fix-tty-slowness.patch \
-    file://0008-restart-Xserver-if-killed.patch \
-    file://slim-dynwm \
-    file://update_slim_wmlist \
-    file://Makefile.oe \
-    file://slim.pamd \
-    file://slim.service \
-"
-
-SRC_URI[md5sum] = "ca1ae6120e6f4b4969f2d6cf94f47b42"
-SRC_URI[sha256sum] = "f1560125005f253b9b88220598fed7a9575ef405716862c6ca3fcc72dbd482b8"
-
-
-EXTRA_OEMAKE += " \
-    USE_PAM=${@bb.utils.contains('DISTRO_FEATURES', 'pam', '1', '0', d)} \
-    PREFIX=${prefix} \
-    CFGDIR=${sysconfdir} \
-    MANDIR=${mandir} \
-    DESTDIR=${D} \
-    CFLAGS+=-I${STAGING_INCDIR}/freetype2 \
-    CXXFLAGS+=-I${STAGING_INCDIR}/freetype2 \
-"
-
-do_compile_prepend() {
-    cp -pP ${WORKDIR}/Makefile.oe ${S}/Makefile
-}
-
-do_install() {
-    oe_runmake install
-    install -d ${D}${bindir}
-    install -m 0755 ${WORKDIR}/slim-dynwm ${D}${bindir}/
-    install -m 0755 ${WORKDIR}/update_slim_wmlist ${D}${bindir}/
-    install -d ${D}${sysconfdir}/pam.d/
-    install -m 0644 ${WORKDIR}/slim.pamd ${D}${sysconfdir}/pam.d/slim
-
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/*.service ${D}${systemd_unitdir}/system/
-
-    echo 'sessionstart_cmd    /usr/bin/sessreg -a -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf
-    echo 'sessionstop_cmd     /usr/bin/sessreg -d -l $DISPLAY %user' >> ${D}${sysconfdir}/slim.conf
-}
-
-
-RDEPENDS_${PN} = "perl xauth freetype sessreg "
-FILES_${PN} += "${systemd_unitdir}/system/"
-
-pkg_postinst_${PN} () {
-if test "x$D" != "x"; then
-    exit 1
-fi
-systemctl enable slim.service
-
-# Register SLiM as default DM
-mkdir -p ${sysconfdir}/X11/
-echo "${bindir}/slim" > ${sysconfdir}/X11/default-display-manager
-}
-
-pkg_postrm_${PN} () {
-if test "x$D" != "x"; then
-    exit 1
-fi
-systemctl disable slim.service
-sed -i /slim/d $D${sysconfdir}/X11/default-display-manager || true
-}
-
-PNBLACKLIST[slim] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb b/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
deleted file mode 100644
index 4c8399d7d..000000000
--- a/meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb
+++ /dev/null
@@ -1,47 +0,0 @@
-SUMMARY = "Terminus fonts packages (console and X11)"
-DESCRIPTION = "Terminus Font is a clean, fixed width bitmap font, designed for \
-               long (8 and more hours per day) work with computers."
-HOMEPAGE = "http://terminus-font.sourceforge.net/"
-AUTHOR = "Dimitar Zhekov"
-SECTION = "fonts"
-
-LICENSE = "OFL-1.1"
-LIC_FILES_CHKSUM = "file://OFL.TXT;md5=9cadb26f4c5c005618c5ae74f041ec54"
-
-DEPENDS = "hostperl-runtime-native gzip-native"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "a8e792fe6e84c86ed2b6ed3e2a12ba66"
-SRC_URI[sha256sum] = "f6f4876a4dabe6a37c270c20bb9e141e38fb50e0bba200e1b9d0470e5eed97b7"
-
-inherit allarch fontcache
-
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-PACKAGECONFIG[x11] = ""
-
-# Don't use font cache mecanism for console packages
-FONT_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '${PN}-pcf', '', d)}"
-
-# Hand made configure script. Don't need oe_runconf
-do_configure() {
-    chmod +x ${S}/configure
-    ${S}/configure --prefix=${prefix} \
-                   --psfdir=${datadir}/consolefonts \
-                   --acmdir=${datadir}/consoletrans \
-                   --x11dir=${datadir}/fonts/terminus
-}
-
-do_compile() {
-    oe_runmake DESTDIR=${D} psf txt ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'pcf', '', d)}
-}
-
-do_install() {
-    oe_runmake DESTDIR=${D} install-psf install-acm ${@bb.utils.contains('PACKAGECONFIG', 'x11', 'install-pcf', '', d)}
-}
-
-PACKAGES += "${PN}-consolefonts ${PN}-consoletrans ${PN}-pcf"
-FILES_${PN}-consolefonts = "${datadir}/consolefonts"
-FILES_${PN}-consoletrans = "${datadir}/consoletrans"
-FILES_${PN}-pcf = "${datadir}/fonts/terminus"
-
-PNBLACKLIST[terminus-font] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130638/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb b/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
deleted file mode 100755
index 2af669770..000000000
--- a/meta-oe/recipes-graphics/wayland/wayland-fits_git.bb
+++ /dev/null
@@ -1,35 +0,0 @@
-SUMMARY = "Wayland-fits, the Wayland Functional Integration Test Suite"
-DESCRIPTION = "Wayland-fits is a fully automated functional integration \
-test suite. Its main purpose is to test the functionality and integration of \
-client-side (i.e. toolkit) and server-side (compositor) implementations of \
-the Wayland protocol."
-HOMEPAGE = "https://github.com/01org/wayland-fits"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f8d34cadaf891753c0f00c6cd48f08f5 \
-                    file://src/extensions/weston/weston-wfits.cpp;endline=21;md5=848c81e55cf3a30a9f6ed75f0dba7a97"
-
-SRC_URI = "git://github.com/01org/wayland-fits.git"
-SRCREV = "f108335e374772ae2818a30ae37fe6fcda81980f"
-
-S = "${WORKDIR}/git"
-
-inherit autotools pkgconfig
-
-DEPENDS = "libcheck boost wayland weston"
-RDEPENDS_${PN} = "weston"
-
-EXTRA_OECONF += "--enable-shared --disable-static --with-boost-libdir=${STAGING_LIBDIR}"
-
-PACKAGECONFIG ?= "gtk+3"
-
-PACKAGECONFIG[elementary] = "--enable-efl-tests,--disable-efl-tests,elementary"
-PACKAGECONFIG[gtk+3] = "--enable-gtk-tests,--disable-gtk-tests,gtk+3"
-
-do_install_append() {
-    rm -f ${D}/${libdir}/weston/*.la
-}
-
-FILES_${PN} += "${bindir}/wfits ${libdir}/weston/*.so"
-FILES_${PN}-dbg += "${bindir}/.debug ${libdir}/weston/.debug ${prefix}/src"
-
-PNBLACKLIST[wayland-fits] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130632/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
deleted file mode 100644
index 5f2adec1a..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-mtev_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-require recipes-graphics/xorg-driver/xorg-driver-input.inc
-SUMMARY = "X.Org X server -- multitouch input driver"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=8a71d0475d08eee76d8b6d0c6dbec543"
-
-DEPENDS += "pixman"
-
-PNBLACKLIST[xf86-input-mtev] ?= "BROKEN: doesn't build with B!=S (Makefile without ${S} in sed call) - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "git://gitorious.org/xorg/xf86-input-mtev.git file://fix-it.patch"
-SRCREV = "1eb469166ffc095c5801475f057f911f97a6e641"
-S = "${WORKDIR}/git"
-PV = "1.0.0+gitr${SRCPV}"
-PR = "${INC_PR}.0"
-
-EXTRA_OEMAKE = "'INCLUDE=-I${STAGING_INCDIR}/xorg -I${STAGING_INCDIR}/pixman-1'"
-
-#skip xorg-driver-common.inc AC_CHECK_FILE mangling
-do_configure_prepend () {
-    sed 's#gcc#${CC}#g' -i Makefile
-    return
-}
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
deleted file mode 100644
index e543413ad..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2.11.16.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require recipes-graphics/xorg-driver/xorg-driver-video.inc
-LIC_FILES_CHKSUM = "file://COPYING;md5=e7f3e39474aeea5af381a8e103dafc36"
-
-SUMMARY = "X.org server -- Geode GX2/LX display driver"
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://0001-Add-config.h-include-to-src-lx_memory.c.patch"
-SRC_URI[md5sum] = "35fa387f6a33f6b22a56ce4bda424392"
-SRC_URI[sha256sum] = "38fc1f55e29fb7985b90c9021a4b7e5295d42888bd669174f42f3b7f681fc1a7"
-
-COMPATIBLE_HOST = "i.86.*-linux"
-
-RDEPENDS_${PN} += "xserver-xorg-module-exa"
-
-# 2_2.11.16-r21.0/xf86-video-geode-2.11.16/src/gx_driver.c:376:20: error: implicit declaration of function 'xf86MapVidMem' [-Werror=implicit-function-declaration]
-PNBLACKLIST[xf86-video-geode] ?= "BROKEN, fails to build - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
deleted file mode 100644
index 5818d0cc9..000000000
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require recipes-graphics/xorg-driver/xorg-driver-video.inc
-SUMMARY = "X.Org X server -- Glamo display driver with KMS support"
-DEPENDS += "libdrm"
-RDEPENDS_${PN} += "xserver-xorg-module-exa"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
-
-PE = "2"
-PV = "1.0.0+gitr${SRCPV}"
-PR = "${INC_PR}.4"
-
-SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;branch=master \
-           file://0001-glamo-kms-driver-drop-unused-xf86_config.patch \
-           file://0001-fix-build-with-KMS-disabled.patch \
-           file://0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch \
-           file://0001-glamo-driver-remove-references-to-mibstore.patch \
-           file://0004-glamo.h-use-const-for-jbt6k74_state_path.patch \
-"
-
-S = "${WORKDIR}/git"
-SRCREV = "cb9ed17035a79e49dde26a1e7e2bc5f10fd8144b"
-
-EXTRA_OECONF = " --disable-kms "
-
-PNBLACKLIST[xf86-video-glamo] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130629/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
deleted file mode 100644
index fcf68262c..000000000
--- a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Xorg 100 DPI font set"
-LICENSE = "Custom"
-
-inherit packagegroup distro_features_check
-# rdepends on font recipes with this restriction
-REQUIRED_DISTRO_FEATURES = "x11"
-
-RDEPENDS_${PN} = "\
-    font-adobe-100dpi \
-    font-adobe-utopia-100dpi \
-    font-bh-100dpi \
-    font-bh-lucidatypewriter-100dpi \
-    font-bitstream-100dpi \
-"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted xorg-fonts-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-adobe-utopia-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PNBLACKLIST[xorg-fonts-100dpi] ?= "Runtime depends on blacklisted font-bh-lucidatypewriter-100dpi - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-kernel/ktap/ktap-module_git.bb b/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
deleted file mode 100644
index 1119d4c90..000000000
--- a/meta-oe/recipes-kernel/ktap/ktap-module_git.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-require ktap.inc
-
-SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
-
-inherit module
-
-# See https://github.com/ktap/ktap/issues/80
-PNBLACKLIST[ktap-module] ?= "Not compatible with 3.19 kernel - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-# Only build the module
-MAKE_TARGETS = "mod"
-
-# Kernel module packages MUST begin with 'kernel-module-', otherwise
-# multilib image generation can fail.
-#
-# The following line is only necessary if the recipe name does not begin
-# with kernel-module-.
-#
-PKG_${PN} = "kernel-module-${PN}"
-
diff --git a/meta-oe/recipes-kernel/ktap/ktap_git.bb b/meta-oe/recipes-kernel/ktap/ktap_git.bb
deleted file mode 100644
index a947b7fcc..000000000
--- a/meta-oe/recipes-kernel/ktap/ktap_git.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-require ktap.inc
-
-SUMMARY = "KTAP is a scripting dynamic tracing tool for Linux"
-DEPENDS = "ktap-module"
-
-PNBLACKLIST[ktap] ?= "Depends on blacklisted kernel-module-ktapvm - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-# Only build the userspace app
-EXTRA_OEMAKE += "ktap"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/ktap ${D}${bindir}/
-}
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-RRECOMMENDS_${PN} = "kernel-module-ktapvm"
diff --git a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb b/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
deleted file mode 100644
index 81d700a7b..000000000
--- a/meta-oe/recipes-multimedia/minidlna/minidlna_1.1.5.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "v1_1_5"
-LIC_FILES_CHKSUM = "file://LICENCE.miniupnpd;md5=b0dabf9d8e0f871554e309d62ead8d2b"
-
-PNBLACKLIST[minidlna] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130630/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
deleted file mode 100644
index 1a4ae27e6..000000000
--- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
+++ /dev/null
@@ -1,159 +0,0 @@
-SUMMARY = "Open Source multimedia player"
-SECTION = "multimedia"
-HOMEPAGE = "http://www.mplayerhq.hu/"
-DEPENDS = "libvpx libdvdread libtheora virtual/libsdl ffmpeg xsp zlib \
-           libpng jpeg liba52 freetype fontconfig alsa-lib lzo ncurses \
-           libxv virtual/libx11 libass speex faad2 libxscrnsaver"
-
-RDEPENDS_${PN} = "mplayer-common"
-PROVIDES = "mplayer"
-RPROVIDES_${PN} = "mplayer"
-RCONFLICTS_${PN} = "mplayer"
-
-# Depends on xsp, libxv, virtual/libx11, libxscrnsaver
-REQUIRED_DISTRO_FEATURES = "x11"
-
-# because it depends on libpostproc/libav which has commercial flag
-LICENSE_FLAGS = "${@bb.utils.contains('PACKAGECONFIG', 'postproc', 'commercial', '', d)}"
-
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI = "git://repo.or.cz/mplayer.git \
-    file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
-    file://0001-demux_ogg-partially-port-libtheora-glue-code-to-Theo.patch \
-"
-
-SRCREV = "2c378c71a4d9b1df382db9aa787b646628b4e3f9"
-
-ARM_INSTRUCTION_SET = "arm"
-
-PV = "2.0+gitr${SRCPV}"
-PR = "r13"
-
-PARALLEL_MAKE = ""
-
-S = "${WORKDIR}/git"
-
-FILES_${PN} = "${bindir}/mplayer ${libdir} /usr/etc/mplayer/"
-CONFFILES_${PN} += "/usr/etc/mplayer/input.conf \
-                    /usr/etc/mplayer/example.conf \
-                    /usr/etc/mplayer/codecs.conf \
-"
-
-inherit autotools-brokensep pkgconfig python3native
-
-EXTRA_OECONF = " \
-    --prefix=/usr \
-    --mandir=${mandir} \
-    --target=${SIMPLE_TARGET_SYS} \
-    \
-    --disable-lirc \
-    --disable-lircc \
-    --disable-joystick \
-    --disable-vm \
-    --disable-xf86keysym \
-    --enable-tv \
-    --enable-tv-v4l2 \
-    --disable-tv-bsdbt848 \
-    --enable-rtc \
-    --enable-networking \
-    --disable-smb \
-    --disable-dvdnav \
-    --enable-dvdread \
-    --disable-dvdread-internal \
-    --disable-libdvdcss-internal \
-    --disable-enca \
-    --disable-ftp \
-    --disable-vstream \
-    \
-    --disable-gif \
-    --enable-png \
-    --enable-jpeg \
-    --disable-libcdio \
-    --disable-qtx \
-    --disable-xanim \
-    --disable-real \
-    --disable-xvid \
-    \
-    --enable-speex \
-    --enable-theora \
-    --disable-ladspa \
-    --disable-libdv \
-    --enable-mad \
-    --disable-xmms \
-    --disable-musepack \
-    \
-    --disable-gl \
-    --enable-sdl \
-    --disable-caca \
-    --disable-directx \
-    --disable-dvb \
-    --enable-xv \
-    --disable-vm \
-    --disable-xinerama \
-    --enable-x11 \
-    --disable-directfb \
-    --disable-tga \
-    --disable-pnm \
-    --disable-md5sum \
-    \
-    --enable-alsa \
-    --enable-ossaudio \
-    --disable-pulse \
-    --disable-jack \
-    --disable-openal \
-    --enable-select \
-    --enable-libass \
-    \
-    --extra-libs=' -lXext -lX11 -lvorbis -ltheoradec -lasound ' \
-"
-# -ltheoradec is missing in:
-# libmpcodecs/vd_theora.o: undefined reference to symbol 'theora_decode_init@@libtheora.so.1.0'
-
-EXTRA_OECONF_append_armv6 = " --enable-armv6"
-EXTRA_OECONF_append_armv7a = " --enable-armv6 --enable-neon"
-
-PACKAGECONFIG ??= "vorbis postproc"
-PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
-PACKAGECONFIG[a52] = "--enable-liba52,--disable-liba52,liba52"
-PACKAGECONFIG[lame] = ",,lame"
-PACKAGECONFIG[postproc] = ",--disable-libpostproc,libpostproc"
-PACKAGECONFIG[vorbis] = ",--disable-libvorbis,libvorbis"
-PACKAGECONFIG[portaudio] = ",--disable-portaudio,portaudio-v19"
-PACKAGECONFIG[mpg123] = ",--disable-mpg123,mpg123"
-PACKAGECONFIG[directfb] = "--enable-directfb,--disable-directfb,directfb"
-
-FULL_OPTIMIZATION = "-fexpensive-optimizations -fomit-frame-pointer -frename-registers -O4 -ffast-math"
-BUILD_OPTIMIZATION = "${FULL_OPTIMIZATION}"
-
-CFLAGS_append = " -I${S}/libdvdread4 "
-
-do_configure() {
-    sed -i 's|/usr/include|${STAGING_INCDIR}|g' ${S}/configure
-    sed -i 's|/usr/lib|${STAGING_LIBDIR}|g' ${S}/configure
-    sed -i 's|/usr/\S*include[\w/]*||g' ${S}/configure
-    sed -i 's|/usr/\S*lib[\w/]*||g' ${S}/configure
-    sed -i 's|_install_strip="-s"|_install_strip=""|g' ${S}/configure
-    sed -i 's|HOST_CC|BUILD_CC|' ${S}/Makefile
-    sed -i 's|extra_cflags="-I. $extra_cflags"|extra_cflags="-I. -I${STAGING_INCDIR}/directfb $extra_cflags"|g' ${S}/configure
-    export SIMPLE_TARGET_SYS="$(echo ${TARGET_SYS} | sed s:${TARGET_VENDOR}::g)"
-    ./configure ${EXTRA_OECONF}
-
-}
-
-do_compile () {
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install-no-man
-    install -d ${D}/usr/etc/mplayer
-    install ${S}/etc/input.conf ${D}/usr/etc/mplayer/
-    install ${S}/etc/example.conf ${D}/usr/etc/mplayer/
-    install ${S}/etc/codecs.conf ${D}/usr/etc/mplayer/
-    [ -e ${D}/usr/lib ] && rmdir ${D}/usr/lib
-}
-
-# http://errors.yoctoproject.org/Errors/Details/40734/
-PNBLACKLIST[mplayer2] ?= "Not compatible with currently used ffmpeg 3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb b/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
deleted file mode 100644
index 4e821be5a..000000000
--- a/meta-oe/recipes-navigation/gdal/gdal_1.11.1.bb
+++ /dev/null
@@ -1,114 +0,0 @@
-SUMMARY = "GDAL is a translator library for raster geospatial data formats"
-HOMEPAGE = "http://www.gdal.org/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=0952e17969fab12227096b5228f23149"
-
-DEPENDS = "proj sqlite3 tiff json-c"
-
-SRC_URI = "ftp://download.osgeo.org/gdal/${PV}/${BP}.tar.xz"
-
-SRC_URI[md5sum] = "2e126d7c6605691d38f3e71b945f5c73"
-SRC_URI[sha256sum] = "20e1042cff15a71038459a299732fb342428aea9912f32df30c85790fcab6302"
-
-inherit autotools-brokensep lib_package binconfig
-
-EXTRA_OECONF = "--without-perl \
-                --without-php \
-                --without-ruby \
-                --without-python \
-                \
-                --without-grass \
-                --without-libgrass \
-                --without-cfitsio \
-                --without-dds \
-                --without-gta \
-                --without-pcidsk \
-                --without-ogdi \
-                --without-fme \
-                --without-hdf4 \
-                --without-hdf5 \
-                --without-pg \
-                --without-jpeg12 \
-                --without-ogdi \
-                --without-netcdf \
-                --without-openjpeg \
-                --without-fgdb \
-                --without-ecw \
-                --without-kakadu \
-                --without-mrsid \
-                --without-jp2mrsid \
-                --without-mrsid_lidar \
-                --without-msg \
-                --without-bsb \
-                --without-grib \
-                --without-mysql \
-                --without-ingres \
-                --without-odbc \
-                --without-dods_root \
-                --without-xml2 \
-                --without-spatialite \
-                --without-pcre \
-                --without-dwgdirect \
-                --without-dwgdirect \
-                --without-idb \
-                --without-sde \
-                --without-sde-version \
-                --without-epsilon \
-                --without-webp \
-                --without-opencl \
-                --without-opencl-include \
-                --without-opencl-lib \
-                --without-freexl \
-                --without-pam \
-                --without-poppler \
-                --without-podofo \
-                --without-podofo-lib \
-                --without-podofo-extra-lib-for-test \
-                --without-static_proj4 \
-                --without-perl \
-                --without-php \
-                --without-ruby \
-                --without-python \
-                --without-java \
-                --without-mdb \
-                --without-jvm-lib \
-                --without-jvm-lib-add-rpath \
-                --without-rasdaman \
-                --without-armadillo \
-                \
-                --with-pcraster=internal \
-                --with-geotiff=internal \
-                \
-                --with-sqlite3=${STAGING_EXECPREFIXDIR} \
-                --with-libtiff=${STAGING_EXECPREFIXDIR} \
-                --with-libjson-c=${STAGING_EXECPREFIXDIR} \
-                --with-expat=${STAGING_EXECPREFIXDIR} \
-"
-
-EXTRA_OEMAKE += "INST_DATA="${datadir}/gdal""
-
-PACKAGECONFIG ?= "geos png jasper"
-PACKAGECONFIG[geos] = "--with-geos,--without-geos,geos"
-PACKAGECONFIG[lzma] = "--with-liblzma,--without-liblzma,xz"
-PACKAGECONFIG[png] = "--with-png,--without-png,libpng"
-PACKAGECONFIG[gif] = "--with-gif,--without-gif,giflib"
-PACKAGECONFIG[jpeg] = "--with-jpeg,--without-jpeg,jpeg"
-PACKAGECONFIG[z] = "--with-libz,--without-libz,zlib"
-PACKAGECONFIG[jasper] = "--with-jasper,--without-jasper,jasper"
-PACKAGECONFIG[curl] = "--with-curl,--without-curl,curl"
-
-do_configure_prepend () {
-    # The configure script has many hardcoded paths to search
-    # for the library headers when using external libraries,
-    # workaround it.
-    sed -e 's,/usr/include,NON_EXISTENT_DIR,g' \
-        -e 's,/usr/lib,NON_EXISTENT_DIR,g' \
-        -i ${S}/configure.in
-}
-
-FILES_${PN} += "${libdir}/gdalplugins"
-
-# | gdalserver.c:124:21: error: storage size of 'sHints' isn't known
-# |      struct addrinfo sHints;
-# |                      ^
-PNBLACKLIST[gdal] ?= "BROKEN: fails to build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb b/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
deleted file mode 100644
index 534ba3b14..000000000
--- a/meta-oe/recipes-sato/claws-mail/claws-mail_3.9.0.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SECTION = "x11/network"
-SUMMARY = "Mail user agent"
-DEPENDS = "gtk+ libetpan openssl aspell curl libgcrypt"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e059bde2972c1790af786f3e86bac22e"
-
-PNBLACKLIST[claws-mail] ?= "depends on blacklisted libetpan - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-inherit autotools pkgconfig gettext
-
-# translation patch: http://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=1774
-SRC_URI = "\
-        ${SOURCEFORGE_MIRROR}/project/claws-mail/Claws%20Mail/${PV}/claws-mail-${PV}.tar.bz2;name=archive "
-SRC_URI[archive.md5sum] = "4c5ac7b21f0ed17d0f6404124c2229a4"
-SRC_URI[archive.sha256sum] = "ed70975a5056b3ffc4fe6e977f0d9606febc1499763c090241b029a73ff24e65"
-
-do_configure_append() {
-    cd ${S}/po ; for PO in *.po ; do MO=`echo $PO | sed s/\\.po//`.gmo ; if ! test -f $MO ; then msgfmt $PO -o $MO ; fi ; done; cd ${B}
-}
-
-PACKAGECONFIG ??= "startup-notification dbus"
-PACKAGECONFIG[enchant] = "--enable-enchant,--disable-enchant,enchant"
-PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
-PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,openldap"
-
-# FIXME: maemo builds may want --enable-maemo
-# FIXME: some platforms may want --enable-generic-umpc
-EXTRA_OECONF = " \
-    --disable-manual \
-    --disable-crash-dialog \
-    --disable-jpilot \
-    --disable-trayicon-plugin \
-    --disable-spamassassin-plugin \
-    --disable-bogofilter-plugin \
-    --disable-pgpcore-plugin \
-    --disable-pgpmime-plugin \
-    --disable-pgpinline-plugin \
-    --disable-dillo-viewer-plugin \
-    --disable-valgrind \
-"
-
-# Remove enchant references:
-do_install_prepend() {
-    sed -i -e 's:${STAGING_INCDIR}:${includedir}:g;s:${STAGING_LIBDIR}:${libdir}:g' claws-mail.pc
-}
-
-# Work-around broken GPE icon lookup:
-do_install_append() {
-    rm -r ${D}${datadir}/icons
-    install -d ${D}${datadir}/pixmaps
-    install -m 0644 ${S}/claws-mail.png ${D}${datadir}/pixmaps/
-    sed -i 's/Icon=[^.]*$/&.png/' ${D}${datadir}/applications/claws-mail.desktop
-}
-
-RSUGGESTS_${PN} = "claws-plugin-gtkhtml2-viewer claws-plugin-mailmbox claws-plugin-rssyl"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
deleted file mode 100644
index 29b41be93..000000000
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-gtkhtml2-viewer_0.31.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SECTION = "x11/network"
-SUMMARY = "Mail user agent plugins"
-DEPENDS = "claws-mail gtkhtml2 curl"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=977f04a8048c04684e521c06e2844a94"
-
-PNBLACKLIST[claws-plugin-gtkhtml2-viewer] ?= "depends on blacklisted claws-mail - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-PR = "r1"
-
-SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/gtkhtml2_viewer-${PV}.tar.gz \
-           file://configure.patch"
-SRC_URI[md5sum] = "a6c9dfa6f969ccd844796a5724b52167"
-SRC_URI[sha256sum] = "4d41f6d961efaac0f51705e5052bac732bc0bdafee2ef2082a9cf9d89f183ae5"
-
-inherit autotools pkgconfig gettext
-
-S = "${WORKDIR}/gtkhtml2_viewer-${PV}"
-
-FILES_${PN} = "${libdir}/claws-mail/plugins/*.so"
-FILES_${PN}-dbg += "${libdir}/claws-mail/plugins/.debug"
-FILES_${PN}-dev += "${libdir}/claws-mail/plugins/*.la"
-FILES_${PN}-staticdev = "${libdir}/claws-mail/plugins/*.a"
-
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
deleted file mode 100644
index 986b5d40d..000000000
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-mailmbox_1.15.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SECTION = "x11/network"
-SUMMARY = "Mail user agent plugins"
-DEPENDS = "claws-mail"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-PNBLACKLIST[claws-plugin-mailmbox] ?= "depends on blacklisted claws-mail - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/mailmbox-${PV}.tar.gz"
-SRC_URI[md5sum] = "7f72c68e6e1a8768f1247f455fd20b62"
-SRC_URI[sha256sum] = "633f7835261c88a0aa06de38553ac935a1799a7128120963a7fa87ace01dac18"
-
-inherit autotools pkgconfig
-
-S = "${WORKDIR}/mailmbox-${PV}"
-
-FILES_${PN} = "${libdir}/claws-mail/plugins/*.so"
-FILES_${PN}-dbg += "${libdir}/claws-mail/plugins/.debug"
-FILES_${PN}-dev += "${libdir}/claws-mail/plugins/*.la"
-FILES_${PN}-staticdev = "${libdir}/claws-mail/plugins/*.a"
diff --git a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb b/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
deleted file mode 100644
index eec9a2d70..000000000
--- a/meta-oe/recipes-sato/claws-mail/claws-plugin-rssyl_0.34.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SECTION = "x11/network"
-SUMMARY = "Mail user agent plugins"
-DEPENDS = "claws-mail libxml2 curl glib-2.0 gtk+"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c2348e0a084e573f0220f5e45d8097e"
-
-PNBLACKLIST[claws-plugin-rssyl] ?= "depends on blacklisted claws-mail - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "http://www.claws-mail.org/downloads/plugins_obsolete/rssyl-${PV}.tar.gz \
-           file://configure.patch"
-SRC_URI[md5sum] = "49b45608e8d160b3625d3d50016ec2ca"
-SRC_URI[sha256sum] = "2e96a1cd6a1a5bb7f86cd2eb48f6e174665957fafe1f3b1e8361aac3bb967f79"
-inherit autotools pkgconfig gettext
-
-S = "${WORKDIR}/rssyl-${PV}"
-
-FILES_${PN} = "${libdir}/claws-mail/plugins/*.so"
-FILES_${PN}-dbg += "${libdir}/claws-mail/plugins/.debug"
-FILES_${PN}-dev += "${libdir}/claws-mail/plugins/*.la"
-FILES_${PN}-staticdev = "${libdir}/claws-mail/plugins/*.a"
diff --git a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb b/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
deleted file mode 100644
index 978d777ea..000000000
--- a/meta-oe/recipes-sato/claws-mail/sylpheed_2.7.1.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SECTION = "x11/network"
-SUMMARY = "Mail user agent"
-DEPENDS = "gtk+ gpgme gnutls"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
-                    file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-PR = "r2"
-
-SRC_URI = "http://sylpheed.sraoss.jp/sylpheed/v2.7/sylpheed-${PV}.tar.bz2 \
-    file://glib-2.32.patch \
-"
-SRC_URI[md5sum] = "1f470525c1fbe53253813a0978c18228"
-SRC_URI[sha256sum] = "8bb6457db4e2eea1877b487d9ac8513546372db9a6a2e4271d11229f4af84e23"
-
-FILES_${PN} += "${datadir}/pixmaps ${datadir}/applications"
-FILES_${PN}-doc += "${datadir}"
-
-EXTRA_OECONF = "--disable-ssl"
-
-CFLAGS += "-D_GNU_SOURCE"
-
-do_configure_prepend() {
-    mkdir -p m4
-    for i in $(find ${S} -name "Makefile.am") ; do
-        sed -i s:'-I$(includedir)'::g $i
-    done
-}
-
-inherit autotools pkgconfig
-
-
-PNBLACKLIST[sylpheed] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130651/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
deleted file mode 100644
index c8c54a413..000000000
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY = "Apcupsd a daemon for controlling APC UPSes"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c12853cc7fdf20d17b4fddefd26b7802"
-
-SRC_URI = "http://garr.dl.sourceforge.net/project/apcupsd/apcupsd%20-%20Stable/3.14.10/apcupsd-${PV}.tar.gz"
-SRC_URI[md5sum] = "5928822d855c5cf7ac29655e3e0b8c23"
-SRC_URI[sha256sum] = "0707b5ec9916fbde9e44eb8d18037c8d8f75dfd6aeef51aba5487e189eef2032"
-
-PNBLACKLIST[apcupsd] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-inherit autotools
-
-LD = "${CXX}"
-
-EXTRA_OECONF = "--without-x \
-                --enable-usb \
-                --with-distname=${DISTRO}"
-
-do_configure() {
-    export topdir=${S}
-    cp -R --no-dereference --preserve=mode,links -v ${S}/autoconf/configure.in ${S}
-
-    if ! [ -d ${S}/platforms/${DISTRO} ] ; then
-        cp -R --no-dereference --preserve=mode,links -v ${S}/platforms/unknown ${S}/platforms/${DISTRO}
-    fi
-
-    gnu-configize --force
-    # install --help says '-c' is an ignored option, but it turns out that the argument to -c isn't ignored, so drop the complete '-c path/to/strip' line
-    sed -i -e 's:$(INSTALL_PROGRAM) $(STRIP):$(INSTALL_PROGRAM):g' ${S}/autoconf/targets.mak
-    # Searching in host dirs triggers the QA checks
-    sed -i -e 's:-I/usr/local/include::g' -e 's:-L/usr/local/lib64::g' -e 's:-L/usr/local/lib::g' ${S}/configure
-
-    # m4 macros are missing, using autotools_do_configure leads to linking errors with gethostname_re
-    oe_runconf
-}
-
-do_install_append() {
-    rm ${D}${datadir}/hal -rf
-}
-
-
diff --git a/meta-oe/recipes-support/emacs/emacs_23.4.bb b/meta-oe/recipes-support/emacs/emacs_23.4.bb
deleted file mode 100644
index 3388ff01e..000000000
--- a/meta-oe/recipes-support/emacs/emacs_23.4.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require emacs.inc
-
-PR = "r4"
-
-PNBLACKLIST[emacs] ?= "qemu: uncaught target signal 11 (Segmentation fault) - core dumped - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=tarball \
-           file://use-qemu.patch \
-           file://nostdlib-unwind.patch \
-"
-SRC_URI[tarball.md5sum] = "34405165fcd978fbc8b304cbd99ccf4f"
-SRC_URI[tarball.sha256sum] = "b9a2b8434052771f797d2032772eba862ff9aa143029efc72295170607289c18"
diff --git a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb b/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
deleted file mode 100644
index 14ce57aaf..000000000
--- a/meta-oe/recipes-support/farsight/farsight2_0.0.22.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-DESCRIPTION = "FarSight is an audio/video conferencing framework specifically designed for Instant Messengers."
-HOMEPAGE = "http://farsight.sf.net"
-SRC_URI = "http://farsight.freedesktop.org/releases/farsight2/${BP}.tar.gz"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-
-PR = "r3"
-
-DEPENDS = "libnice glib-2.0 libxml2 zlib dbus gstreamer gst-plugins-base"
-
-inherit autotools pkgconfig
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gupnp] = "--enable-gupnp,--disable-gupnp,gupnp-igd"
-
-EXTRA_OECONF = " \
-    --disable-debug \
-    --disable-gtk-doc \
-    --disable-python \
-"
-
-FILES_${PN} += "${libdir}/*/*.so"
-FILES_${PN}-dev += "${libdir}/*/*.la"
-FILES_${PN}-staticdev += "${libdir}/*/*.a"
-FILES_${PN}-dbg += "${libdir}/*/.debug"
-
-
-SRC_URI[md5sum] = "e1f540cf3ebab06c3d7db1f46b44ac88"
-SRC_URI[sha256sum] = "3ae59aa61a8071c9fad111e5fd606aabc27961eb4192f8729987a27dae6b3974"
-
-PNBLACKLIST[farsight2] ?= "Depends on blacklisted gstreamer - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-PNBLACKLIST[farsight2] ?= "Depends on blacklisted libnice - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-PNBLACKLIST[farsight2] ?= "Depends on blacklisted gst-plugins-base - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/fftw/benchfft_3.1.bb b/meta-oe/recipes-support/fftw/benchfft_3.1.bb
deleted file mode 100644
index 49cc270fe..000000000
--- a/meta-oe/recipes-support/fftw/benchfft_3.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "FFTW benchmarks"
-SECTION = "libs"
-LICENSE = "GPLv2"
-
-# single precision fftw is called fftwf
-DEPENDS = "virtual/fftw"
-
-SRC_URI = "http://www.fftw.org/benchfft/benchfft-${PV}.tar.gz"
-
-EXTRA_OECONF = "--disable-fortran --enable-single --enable-shared"
-
-inherit autotools pkgconfig
-
-do_compile_prepend() {
-    sed -i -e 's:all-recursive:$(RECURSIVE_TARGETS):g' ${S}/Makefile
-}
-
-SRC_URI[md5sum] = "9356e5e9dcb3f1481977009720a2ccf8"
-SRC_URI[sha256sum] = "1b4a5b5e48ad5e61a21586b7b59d5c0a88691a981e73e2c6dc5868197461791b"
-
-PNBLACKLIST[benchfft] ?= "does not build with distroless qemuarm as reported in 'State of bitbake world' thread, nobody volunteered to fix them - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb b/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
deleted file mode 100644
index 0883c1ad4..000000000
--- a/meta-oe/recipes-support/flite/flite-alsa_1.3.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require flite.inc
-
-PR = "r1"
-
-EXTRA_OECONF = "--with-audio=alsa --enable-shared"
-
-SRC_URI = "http://www.speech.cs.cmu.edu/flite/packed/flite-${PV}/flite-${PV}-release.tar.gz \
-           file://flite-1.3-alsa_support-1.2.diff \
-           file://flite-alsa-1.3-configure-with-audio.patch"
-
-SRC_URI[md5sum] = "ae0aca1cb7b4801f4372f3a75a9e52b5"
-SRC_URI[sha256sum] = "922225f7001e57a0fbace8833b0a48790a68f6c7b491f2d47c78ad537ab78a8b"
-
-# Looks like caused by flite-1.3-alsa_support-1.2.diff
-# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
-# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/armv5te-oe-linux-gnueabi/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]
-# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
-# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/core2-64-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]
-# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox16/usr/lib/libflite_cmu_us_kal16.so.1.3' [ldflags]
-# flite-alsa-1.3: No GNU_HASH in the elf binary: '/tmp/work/i586-oe-linux/flite-alsa/1.3-r1/packages-split/libflite-alsa-vox8/usr/lib/libflite_cmu_us_kal.so.1.3' [ldflags]
-PNBLACKLIST[flite-alsa] ?= "OLD: wasn't updated in over 6 years, only navit was RSUGGESTing it and doesn't respect LDFLAGS - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb b/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
deleted file mode 100644
index 3dc22c590..000000000
--- a/meta-oe/recipes-support/iksemel/iksemel_1.4.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Fast and portable XML parser and Jabber protocol library"
-AUTHOR = "Gurer Ozen <meduketto at gmail.com>"
-HOMEPAGE = "http://iksemel.googlecode.com"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
-DEPENDS = "gnutls"
-
-PR = "r1"
-
-# http://errors.yoctoproject.org/Errors/Details/25825/
-PNBLACKLIST[iksemel] ?= "Not compatible with gnutls version 3.4 currently in oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "http://iksemel.googlecode.com/files/${BP}.tar.gz;name=archive \
-           file://r25.diff"
-SRC_URI[archive.md5sum] = "532e77181694f87ad5eb59435d11c1ca"
-SRC_URI[archive.sha256sum] = "458c1b8fb3349076a6cecf26c29db1d561315d84e16bfcfba419f327f502e244"
-
-inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb b/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
deleted file mode 100644
index 8d2c5054a..000000000
--- a/meta-oe/recipes-support/libdbi/libdbi-drivers_0.8.3-1.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require ${PN}.inc
-
-
-SRC_URI[md5sum] = "4de79b323162a5a7652b65b608eca6cd"
-SRC_URI[sha256sum] = "4ab9944398ce769c0deeb64d2f73555c67bc25ccd2ade1ccf552226c7b2acf72"
-
-# libdbi-drivers-0.8.3-1/drivers/mysql/dbd_mysql.c:232:5: error: conflicting types for 'dbd_goto_row'
-PNBLACKLIST[libdbi-drivers] ?= "BROKEN: fails to build with gcc-5 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb b/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
deleted file mode 100644
index 5cadf16ce..000000000
--- a/meta-oe/recipes-support/libetpan/libetpan_0.57.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "libetpan is a library for communicating with mail and news servers. \
-It supports the protocols SMTP, POP3, IMAP and NNTP."
-HOMEPAGE = "http://www.etpan.org"
-SECTION = "libs"
-DEPENDS = "gnutls liblockfile curl"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f18ebe7e452708c26f83954f81062ba7"
-
-PR = "r1"
-
-# http://errors.yoctoproject.org/Errors/Details/25823/
-PNBLACKLIST[libetpan] ?= "Not compatible with gnutls version 3.4 currently in oe-core - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/libetpan/libetpan-${PV}.tar.gz \
-           file://libetpan-autoreconf.patch \
-           file://libetpan-ldflags.patch \
-           file://sepbuild.patch"
-
-inherit autotools pkgconfig gettext binconfig
-
-EXTRA_OECONF = "--without-openssl --without-sasl --with-gnutls --disable-db"
-
-PARALLEL_MAKE = ""
-
-FILES_${PN} = "${libdir}/lib*.so.*"
-FILES_${PN}-dev = "${bindir} ${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libdir}/pkgconfig"
-
-
-SRC_URI[md5sum] = "8ce8c6c071e81884a475b12b7f9a9cc0"
-SRC_URI[sha256sum] = "1f3fda5c9e2961d1a6298dc8aadae321493d37727d8db45bc2e8d58f20547011"
diff --git a/meta-oe/recipes-support/ode/ode_0.13.bb b/meta-oe/recipes-support/ode/ode_0.13.bb
deleted file mode 100644
index c90c81954..000000000
--- a/meta-oe/recipes-support/ode/ode_0.13.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "ODE is an Open Source Physics Engine"
-SECTION = "libs"
-HOMEPAGE = "http://www.ode.org"
-LICENSE = "LGPLv2.1 & BSD"
-LIC_FILES_CHKSUM = " \
-    file://COPYING;md5=1de906ee96808d9776dd72a5f9a79a22 \
-    file://LICENSE.TXT;md5=771782cb6245c7fbbe74bc0ec059beff \
-"
-# LICENSE-BSD.TXT is missing in 0.13 tarball, but COPYING still says it's dual licensed
-# and svn repo still contains LICENSE-BSD.TXT so maybe it will return in next tarball
-# file://LICENSE-BSD.TXT;md5=c74e6304a772117e059458fb9763a928
-
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-${PV}.tar.bz2 \
-           file://configure.patch"
-SRC_URI[md5sum] = "04b32c9645c147e18caff7a597a19f84"
-SRC_URI[sha256sum] = "34ce3e236e313bf109a0cb5546d2fca462aed99f29a42e62bc1463b803c31ef9"
-
-inherit autotools binconfig
-
-EXTRA_OECONF = "--disable-demos --enable-soname"
-
-FILES_${PN} = "${libdir}/lib*${SOLIBS}"
-
-PACKAGECONFIG ?= ""
-# if it isn't explicitly selected and "$build_os" == "$target_os", then configure will run
-# series of AC_TRY_RUN which won't work for cross-compilation and configure fails
-PACKAGECONFIG[double-precision] = "--enable-double-precision,--disable-double-precision"
-
-PNBLACKLIST[ode] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130599/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-PNBLACKLIST[ode] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130620/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
deleted file mode 100644
index d3f2e789b..000000000
--- a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.4.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY = "An encoder/decoder for the VCDIFF (RFC3284) format"
-DESCRIPTION = "A library with a simple API is included, as well as a \
-               command-line executable that can apply the encoder and \
-               decoder to source, target, and delta files. \
-               A slight variation from the draft standard is defined \
-               to allow chunk-by-chunk decoding when only a partial \
-               delta file window is available."
-HOMEPAGE = "http://code.google.com/p/open-vcdiff/"
-SECTION = "console/utils"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ff820d4ddc1ba05b6fd37b41a21506f9"
-
-SRC_URI = "https://drive.google.com/uc?id=0B5WpIi2fQU1aNGJwVE9hUjU5clU&export=download;downloadfilename=${BP}.tar.gz"
-SRC_URI[md5sum] = "5c0d378d907bebc38b51c3d7e4117011"
-SRC_URI[sha256sum] = "2b142b1027fb0a62c41347600e01a53fa274dad15445a7da48083c830c3138b3"
-
-inherit autotools
-
-# http://errors.yoctoproject.org/Errors/Details/68667/
-PNBLACKLIST[open-vcdiff] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb b/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
deleted file mode 100644
index 107184be4..000000000
--- a/meta-oe/recipes-support/opencv/opencv-samples_2.4.bb
+++ /dev/null
@@ -1,41 +0,0 @@
-SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.willowgarage.com/wiki/"
-SECTION = "libs"
-LICENSE = "BSD"
-
-DEPENDS = "opencv"
-
-LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14 \
-"
-SRCREV = "6fae07ba8867b8fd2c53344a774aab669afa7c5e"
-SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
-          "
-PV = "2.4.3+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    cd samples/c
-    install -d ${D}/${bindir}
-    install -d ${D}/${datadir}/opencv/samples
-
-    cp * ${D}/${datadir}/opencv/samples || true
-
-    for i in *.c; do
-        echo "compiling $i"
-        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .c` $i `pkg-config --libs opencv` || true
-        install -m 0755 `basename $i .c` ${D}/${bindir} || true
-        rm ${D}/${datadir}/opencv/samples/`basename $i .c` || true
-    done
-    for i in *.cpp; do
-        echo "compiling $i"
-        ${CXX} ${CFLAGS} ${LDFLAGS} -ggdb `pkg-config --cflags opencv` -o `basename $i .cpp` $i `pkg-config --libs opencv` || true
-        install -m 0755 `basename $i .cpp` ${D}/${bindir} || true
-        rm ${D}/${datadir}/opencv/samples/`basename $i .cpp` || true
-    done
-}
-
-FILES_${PN}-dev += "${datadir}/opencv/samples/*.c* ${datadir}/opencv/samples/*.vcp* ${datadir}/opencv/samples/build*"
-FILES_${PN} += "${bindir} ${datadir}/opencv"
-
-PNBLACKLIST[opencv-samples] ?= "Depends on blacklisted opencv - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
deleted file mode 100644
index d17c640ac..000000000
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ /dev/null
@@ -1,106 +0,0 @@
-SUMMARY = "Opencv : The Open Computer Vision Library"
-HOMEPAGE = "http://opencv.org/"
-SECTION = "libs"
-
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://include/opencv2/opencv.hpp;endline=41;md5=6d690d8488a6fca7a2c192932466bb14"
-
-ARM_INSTRUCTION_SET_armv4 = "arm"
-ARM_INSTRUCTION_SET_armv5 = "arm"
-
-DEPENDS = "python-numpy libtool swig swig-native python bzip2 zlib glib-2.0"
-
-SRCREV = "2c9547e3147779001811d01936aed38f560929fc"
-SRC_URI = "git://github.com/Itseez/opencv.git;branch=2.4 \
-  file://0001-Use-__vector-instead-of-vector-as-suggests-Eigen.patch"
-
-PV = "2.4.11+git${SRCPV}"
-
-S = "${WORKDIR}/git"
-
-# Do an out-of-tree build
-OECMAKE_SOURCEPATH = "${S}"
-OECMAKE_BUILDPATH = "${WORKDIR}/build-${TARGET_ARCH}"
-
-EXTRA_OECMAKE = "-DPYTHON_NUMPY_INCLUDE_DIR:PATH=${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/core/include \
-                 -DBUILD_PYTHON_SUPPORT=ON \
-                 -DWITH_GSTREAMER=OFF \
-                 -DWITH_1394=OFF \
-                 -DCMAKE_SKIP_RPATH=ON \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse3", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1", "", d)} \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.1", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1", "", d)} \
-                 ${@bb.utils.contains("TARGET_CC_ARCH", "-msse4.2", "-DENABLE_SSE=1 -DENABLE_SSE2=1 -DENABLE_SSE3=1 -DENABLE_SSSE3=1 -DENABLE_SSE41=1 -DENABLE_SSE42=1", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib64", "-DLIB_SUFFIX=64", "", d)} \
-                 ${@base_conditional("libdir", "/usr/lib32", "-DLIB_SUFFIX=32", "", d)} \
-"
-
-PACKAGECONFIG ??= "eigen jpeg png tiff v4l libv4l \
-                   ${@bb.utils.contains("DISTRO_FEATURES", "x11", "gtk", "", d)} \
-                   ${@bb.utils.contains("LICENSE_FLAGS_WHITELIST", "commercial", "libav", "", d)}"
-
-PACKAGECONFIG[eigen] = "-DWITH_EIGEN=ON,-DWITH_EIGEN=OFF,libeigen,"
-PACKAGECONFIG[gtk] = "-DWITH_GTK=ON,-DWITH_GTK=OFF,gtk+,"
-PACKAGECONFIG[jasper] = "-DWITH_JASPER=ON,-DWITH_JASPER=OFF,jasper,"
-PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON,-DWITH_JPEG=OFF,jpeg,"
-PACKAGECONFIG[libav] = "-DWITH_FFMPEG=ON,-DWITH_FFMPEG=OFF,libav,"
-PACKAGECONFIG[libv4l] = "-DWITH_LIBV4L=ON,-DWITH_LIBV4L=OFF,v4l-utils,"
-PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng,"
-PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
-PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-
-inherit distutils-base pkgconfig cmake
-
-export PYTHON_CSPEC="-I${STAGING_INCDIR}/${PYTHON_DIR}"
-export PYTHON="${STAGING_BINDIR_NATIVE}/python"
-
-TARGET_CC_ARCH += "-I${S}/include "
-
-PACKAGES += "${PN}-apps python-opencv"
-
-python populate_packages_prepend () {
-    cv_libdir = d.expand('${libdir}')
-    cv_libdir_dbg = d.expand('${libdir}/.debug')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
-
-    pn = d.getVar('PN')
-    metapkg =  pn + '-dev'
-    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg ]
-    metapkg_rdepends = [ ]
-    packages = d.getVar('PACKAGES').split()
-    for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
-            metapkg_rdepends.append(pkg)
-    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
-}
-
-PACKAGES_DYNAMIC += "^libopencv-.*"
-
-FILES_${PN} = ""
-FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
-FILES_${PN}-dbg += "${libdir}/.debug"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
-FILES_${PN}-doc = "${datadir}/OpenCV/doc"
-
-ALLOW_EMPTY_${PN} = "1"
-
-SUMMARY_python-opencv = "Python bindings to opencv"
-FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-opencv = "python-core python-numpy"
-
-do_install_append() {
-    cp ${S}/include/opencv/*.h ${D}${includedir}/opencv/
-    sed -i '/blobtrack/d' ${D}${includedir}/opencv/cvaux.h
-
-    # Move Python files into correct library folder (for multilib build)
-    if [ "$libdir" != "/usr/lib" ]; then
-        mv ${D}/usr/lib/* ${D}/${libdir}/
-        rm -rf ${D}/usr/lib
-    fi
-}
-
-# http://errors.yoctoproject.org/Errors/Details/40660/
-PNBLACKLIST[opencv] ?= "Not compatible with currently used ffmpeg 3 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb b/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
deleted file mode 100644
index 35c39cbe8..000000000
--- a/meta-oe/recipes-support/openmotif/openmotif_2.3.3.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SECTION = "libs"
-SUMMARY = "OSM/Motif implementation"
-LICENSE = "OGPL"
-DEPENDS = "xbitmaps virtual/libx11 libxt libxft xproto"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=14f692c82491db3d52419929d2f3b343"
-
-PR = "r3"
-
-PNBLACKLIST[openmotif] ?= "BROKEN: doesn't build with B!=S - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-SRC_URI = "http://motif.ics.com/sites/default/files/openmotif-2.3.3.tar.gz \
-           file://configure.patch;patch=1"
-
-SRC_URI[md5sum] = "fd27cd3369d6c7d5ef79eccba524f7be"
-SRC_URI[sha256sum] = "c85f5545e218fa0c59a3789192132d472fc5a33e914a221a568eee4fc10cd103"
-
-inherit autotools
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[jpeg] = "--enable-jpeg,--disable-jpeg,jpeg"
-PACKAGECONFIG[png] = "--enable-png,--disable-png,libpng"
-
-EXTRA_OECONF = "X_CFLAGS=-I${STAGING_INCDIR} --disable-printing"
-
-PACKAGES += "${PN}-bin"
-
-FILES_${PN}-bin = "${bindir}"
-
-do_compile() {
-    (
-        # HACK: build a native binaries need during the build
-        unset CC LD CXX CCLD CFLAGS
-        oe_runmake -C config/util CC="${BUILD_CC}" LD="${BUILD_LD}" CXX="${BUILD_CXX}" LIBS="" makestrs
-    )
-    if [ "$?" != "0" ]; then
-        exit 1
-    fi
-    oe_runmake -C lib
-    oe_runmake -C include
-}
-
-do_install() {
-    oe_runmake DESTDIR=${D} -C lib install
-    oe_runmake DESTDIR=${D} -C include install
-}
-
-LEAD_SONAME = "libXm.so.4"
diff --git a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb b/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
deleted file mode 100644
index e9142385b..000000000
--- a/meta-oe/recipes-support/openwbem/openwbem_3.2.3.bb
+++ /dev/null
@@ -1,115 +0,0 @@
-SUMMARY = "Web Based Enterprise Management (WBEM) Implementation"
-DESCRIPTION = "OpenWBEM is a set of software components that help facilitate \
-deployment of the Common Information Model (CIM) and Web-Based \
-Enterprise Management (WBEM) technologies of the Distributed Management \
-Task Force (DMTF). \
- \
-Web-Based Enterprise Management (WBEM) is a set of management and \
-Internet standard technologies developed to unify the management of \
-distributed computing environments. WBEM provides the ability for the \
-industry to deliver a well-integrated set of standards-based management \
-tools, facilitating the exchange of data across otherwise disparate \
-technologies and platforms. \
- \
-For more information about DMTF and its technologies, visit \
-http://www.dmtf.org/standards. "
-SECTION = "System/Management"
-HOMEPAGE = "http://openwbem.sourceforge.net/"
-
-inherit autotools-brokensep pkgconfig
-
-SOURCE1="novell-openwbem-root-acl.mof"
-SOURCE2="loadmof.sh"
-SOURCE3="rmmof.sh"
-SOURCE4="openwbem-owcimomd.init"
-SOURCE5="openwbem-etc_pam.d_openwbem"
-SOURCE6="openwbem-rpmlintrc"
-
-SRC_URI = " \
-   git://github.com/kkaempf/openwbem.git \
-   file://${SOURCE1} \
-   file://${SOURCE2} \
-   file://${SOURCE3} \
-   file://${SOURCE4} \
-   file://${SOURCE5} \
-   file://${SOURCE6} \
-   file://checkserverkey \
-   file://owcimomd.service \
-"
-SRCREV = "5c688eefc1f8e35a4b1c58529aae5f114c25c2a8"
-S = "${WORKDIR}/git"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM += "file://COPYING;md5=0504a2eb85e01aa92c9efd4125a34660"
-INSANE_SKIP_${PN} = "dev-so"
-DEPENDS += "openssl libpam bash"
-RDEPENDS_${PN} += "bash"
-EXTRA_OECONF = " \
-    --prefix=/usr \
-    --sysconfdir=/etc \
-    --libdir=${libdir} \
-    --localstatedir=/var/lib \
-    --libexecdir=${libdir}/openwbem/bin \
-    --mandir=/usr/share/man \
-    --enable-threads-run-as-user \
-"
-do_configure_prepend() {
-    autoreconf --force --install
-}
-
-do_install() {
-    oe_runmake DESTDIR=${D} install
-    install -d ${D}/etc/openwbem/openwbem.conf.d
-    install -d ${D}/var/adm/fillup-templates
-    install -m 644 etc/sysconfig/daemons/owcimomd ${D}/var/adm/fillup-templates/sysconfig.owcimomd
-
-    # fix up hardcoded paths
-    sed -i -e 's,/usr/sbin/,${sbindir}/,' ${WORKDIR}/owcimomd.service
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        install -d ${D}/${systemd_unitdir}/system
-        install -m 644 ${WORKDIR}/owcimomd.service ${D}/${systemd_unitdir}/system
-        install -m 755 ${WORKDIR}/checkserverkey ${D}${sysconfdir}/openwbem/
-    fi
-
-    install -d ${D}/etc/init.d
-    ln -sf ../../etc/init.d/owcimomd ${D}/usr/sbin/rcowcimomd
-    install -m 755 ${WORKDIR}/${SOURCE4} ${D}/etc/init.d/owcimomd
-    install -d ${D}${sbindir}
-    install -d ${D}/usr/bin
-    install -d ${D}/etc/pam.d
-    install -d ${D}/${libdir}/openwbem/cmpiproviders
-    install -m 644 etc/pam.d/openwbem ${D}/etc/pam.d
-    install -d ${D}/${libdir}/openwbem/c++providers
-    install -d ${D}/var/lib/openwbem
-    install -m 755 ${WORKDIR}/${SOURCE2} ${D}/usr/bin/ow-loadmof.sh
-    install -m 755 ${WORKDIR}/${SOURCE3} ${D}/usr/bin/ow-rmmof.sh
-    install -m 644 ${WORKDIR}/${SOURCE5} ${D}/etc/pam.d/openwbem
-
-    MOFPATH=${D}/usr/share/mof/openwbem
-    install -d $MOFPATH
-    mv ${D}/usr/share/openwbem/* $MOFPATH/
-    rmdir ${D}/usr/share/openwbem
-    install -m 644 ${WORKDIR}/${SOURCE1} $MOFPATH/
-
-    touch ${D}/var/lib/openwbem/{classassociation,instances,instassociation,namespaces,schema}.{dat,ndx,lock}
-}
-
-inherit ${@bb.utils.filter('VIRTUAL-RUNTIME_init_manager', 'systemd', d)}
-SYSTEMD_SERVICE_${PN} = "owcimomd.service"
-SYSTEMD_AUTO_ENABLE = "disable"
-FILES_${PN} += " \
-    ${libdir} \
-    ${datadir}/mof \
-    ${systemd_unitdir} \
-"
-FILES_${PN}-dbg += " \
-    ${libdir}/openwbem/c++providers/.debug \
-    ${libdir}/openwbem/provifcs/.debug \
-    ${libdir}/openwbem/bin/openwbem/.debug \
-"
-FILES_${PN}-dev = " \
-    ${includedir} \
-    ${datadir}/aclocal/openwbem.m4 \
-"
-
-# http://errors.yoctoproject.org/Errors/Details/68630/
-PNBLACKLIST[openwbem] ?= "BROKEN: fails to build with gcc-6 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb b/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
deleted file mode 100644
index 97326a20e..000000000
--- a/meta-oe/recipes-support/psqlodbc/psqlodbc_09.05.0300.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require ${PN}.inc
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://license.txt;md5=6db3822fc7512e83087ba798da013692"
-
-SRC_URI = "http://ftp.postgresql.org/pub/odbc/versions/src/${BPN}-${PV}.tar.gz \
-    file://psqlodbc-remove-some-checks-for-cross-compiling.patch \
-    file://psqlodbc-donot-use-the-hardcode-libdir.patch \
-    file://psqlodbc-fix-for-ptest-support.patch \
-    file://run-ptest \
-"
-
-SRC_URI[md5sum] = "4c6e0b22187d7bb1c998ffac89e50f6b"
-SRC_URI[sha256sum] = "9521f328bf28aaaf5c8488dc89792b614f9d6271742c0baf9bb41c97537764a8"
-
-PNBLACKLIST[psqlodbc] ?= "Depends on blacklisted postgresql - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb b/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
deleted file mode 100644
index 0bd7af734..000000000
--- a/meta-oe/recipes-support/system-setup-keyboard/system-setup-keyboard_0.8.8.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "xorg.conf keyboard layout callout"
-DESCRIPTION = "system-setup-keyboard is a daemon to monitor the keyboard layout configured in \
-/etc/sysconfig/keyboard and transfer this into the matching xorg.conf.d snippet."
-
-HOMEPAGE = "https://git.fedorahosted.org/git/system-setup-keyboard.git"
-SECTION = "Applications/System"
-
-SRC_URI = "https://git.fedorahosted.org/cgit/${PN}.git/snapshot/${BP}.tar.gz"
-SRC_URI[md5sum] = "399003968ccc739cddd9cc370af377a0"
-SRC_URI[sha256sum] = "1ef6ef79c3588e85d7f42e99eb80a2e459f966284cf029c2d6fc1b645abcb860"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bf57969a59612c5aca007b340c49d3a2"
-
-inherit pythonnative
-
-DEPENDS = "glib-2.0 system-config-keyboard-native"
-
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-do_compile_prepend() {
-    ${PYTHON} -v get_layouts.py > keyboards.h
-}
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-    install -d ${D}/etc/X11/xorg.conf.d
-    touch ${D}/etc/X11/xorg.conf.d/00-system-setup-keyboard.conf
-}
-
-FILES_${PN} += "${systemd_unitdir}/system/${BPN}.service"
-
-PNBLACKLIST[system-setup-keyboard] ?= "Depends on blacklisted system-config-keyboard-native - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb b/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
deleted file mode 100644
index 1219cb8ed..000000000
--- a/meta-oe/recipes-support/vala-terminal/vala-terminal_git.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "A lightweight Terminal Emulator based on libvte, written in Vala"
-SECTION = "x11/applications"
-DEPENDS = "vte9 intltool-native"
-SRCREV = "0fefa38087581f85fa0631b40500b9428369c146"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-PV = "1.3+gitr${SRCPV}"
-PE = "1"
-PR = "r1"
-
-PNBLACKLIST[vala-terminal] ?= "BROKEN: Doesn't work with B!=S, touch: cannot touch `src/.stamp': No such file or directory - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-
-inherit autotools perlnative vala
-
-SRC_URI = "${FREESMARTPHONE_GIT}/vala-terminal.git;branch=master"
-S = "${WORKDIR}/git"
-
-RDEPENDS_${PN} = "ttf-liberation-mono"
-RREPLACES_${PN} = "openmoko-terminal2"
-RPROVIDES_${PN} = "openmoko-terminal2"
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
deleted file mode 100644
index c7bae1c08..000000000
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_4.3.36.bb
+++ /dev/null
@@ -1,72 +0,0 @@
-SUMMARY = "VirtualBox Linux Guest Drivers"
-SECTION = "core"
-LICENSE = "GPL-2.0"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/${VBOX_NAME}/COPYING;md5=e197d5641bb35b29d46ca8c4bf7f2660"
-
-DEPENDS = "virtual/kernel"
-
-inherit module kernel-module-split
-
-COMPATIBLE_MACHINE = "(qemux86|qemux86-64)"
-
-VBOX_NAME = "VirtualBox-${PV}"
-
-SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
-           file://Makefile.utils \
-"
-SRC_URI[md5sum] = "8635387dec6cbfd576ba453355d4dc0c"
-SRC_URI[sha256sum] = "af0776df6d03b2709cb76a69f055487bf12bdb3b4163e2a82959860300283046"
-
-S = "${WORKDIR}/vbox_module"
-
-export BUILD_TARGET_ARCH="${ARCH}"
-export BUILD_TARGET_ARCH_x86-64="amd64"
-export KERN_DIR="${STAGING_KERNEL_DIR}"
-
-addtask export_sources before do_patch after do_unpack
-
-do_export_sources() {
-    mkdir -p "${S}"
-    ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/export_modules ${T}/vbox_modules.tar.gz
-    tar -C "${S}" -xzf ${T}/vbox_modules.tar.gz
-
-    # add a mount utility to use shared folder from VBox Addition Source Code
-    mkdir -p "${S}/utils"
-    install ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/mount.vboxsf.c ${S}/utils
-    install ${WORKDIR}/${VBOX_NAME}/src/VBox/Additions/linux/sharedfolders/vbsfmount.c ${S}/utils
-    install ${S}/../Makefile.utils ${S}/utils/Makefile
-
-}
-
-# compile and install mount utility
-do_compile_append() {
-    oe_runmake 'LD=${CC}' 'LDFLAGS=${LDFLAGS}' -C ${S}/utils
-    if ! [ -e vboxguest.ko -a -e vboxsf.ko -a -e vboxvideo.ko ] ; then
-        echo "ERROR: One of vbox*.ko modules wasn't built"
-        exit 1
-    fi
-}
-
-module_do_install() {
-    MODULE_DIR=${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}/kernel/misc
-    install -d $MODULE_DIR
-    install -m 644 vboxguest.ko $MODULE_DIR
-    install -m 644 vboxsf.ko $MODULE_DIR
-    install -m 644 vboxvideo.ko $MODULE_DIR
-}
-
-do_install_append() {
-    install -d ${D}${base_sbindir}
-    install -m 755 ${S}/utils/mount.vboxsf ${D}${base_sbindir}
-}
-
-PACKAGES += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
-RRECOMMENDS_${PN} += "kernel-module-vboxguest kernel-module-vboxsf kernel-module-vboxvideo"
-
-FILES_${PN} = "${base_sbindir}"
-
-# autoload if installed
-KERNEL_MODULE_AUTOLOAD += "vboxguest vboxsf vboxvideo"
-
-# http://errors.yoctoproject.org/Errors/Details/83333/
-PNBLACKLIST[vboxguestdrivers] ?= "BROKEN: not compatible with default kernel version 4.8 - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb b/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
deleted file mode 100644
index 408c700bb..000000000
--- a/meta-oe/recipes-support/xchat/xchat_2.8.8.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Full-featured IRC chat client with scripting support"
-LICENSE = "GPLv2+"
-HOMEPAGE = "http://www.xchat.org"
-SECTION = "x11/network"
-
-DEPENDS = "libgcrypt zlib gtk+ libsexy"
-DEPENDS += "gdk-pixbuf-native"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
-
-PR = "r2"
-
-SRC_URI = "http://xchat.org/files/source/2.8/xchat-${PV}.tar.bz2 \
-    file://glib-2.32.patch \
-    file://automake-foreign.patch \
-    file://fix-includes-for-separate-build.patch \
-"
-
-inherit autotools gettext pkgconfig
-
-PACKAGECONFIG ??= "dbus"
-PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus-glib"
-PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
-PACKAGECONFIG[python] = "--enable-python,--disable-python,python"
-
-EXTRA_OECONF = "\
-    --enable-maintainer-mode \
-    --disable-perl \
-    --disable-tcl \
-"
-
-RDEPENDS_${PN} += "dbus"
-FILES_${PN} += "${datadir}/dbus-1"
-FILES_${PN}-dbg += "${libdir}/xchat/plugins/.debug"
-
-SRC_URI[md5sum] = "6775c44f38e84d06c06c336b32c4a452"
-SRC_URI[sha256sum] = "0d6d69437b5e1e45f3e66270fe369344943de8a1190e498fafa5296315a27db0"
-
-PNBLACKLIST[xchat] ?= "Depends on blacklisted libsexy - the recipe will be removed on 2017-09-01 unless the issue is fixed"
diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
deleted file mode 100644
index df89520b6..000000000
--- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Makes sure Ruby applications run the same code on every machine."
-DESCRIPTION = "Bundler makes sure Ruby applications run the same code \
-on every machine. It does this by managing the gems that the \
-application depends on. Given a list of gems, it can automatically \
-download and install those gems, as well as any other gems needed by \
-the gems that are listed. Before installing gems, it checks the \
-versions of every gem to make sure that they are compatible, and can \
-all be loaded at the same time. After the gems have been installed, \
-Bundler can help you update some or all of them when new versions \
-become available. Finally, it records the exact versions that have \
-been installed, so that others can install the exact same gems."
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=196bb963e601609817d7e9ac9a64a867"
-
-SRCREV = "06dc8472b9142fd6aaefff780d6d252c20dc2a04"
-
-BRANCH = "1-9-stable"
-PV = "1.9.4"
-
-S = "${WORKDIR}/git"
-
-SRC_URI = " \
-    git://github.com/bundler/bundler.git;branch=${BRANCH} \
-    "
-
-inherit ruby
-
-RDEPENDS_${PN} = "git"
-
-BBCLASSEXTEND = "native"
-
-PNBLACKLIST[bundler] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130640/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.14.0


