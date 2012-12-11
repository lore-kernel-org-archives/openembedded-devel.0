Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TiEUX-00080m-D2
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 02:18:37 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1931218eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Dec 2012 17:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=56G0KxSc4YBj8jhDpBvyynPAiybiRYoirFwrnWmcuo0=;
	b=Ox4+PjxOGy/ttb3P9vTdWiXUSv1dtdZJ8VhR9+NIF9BvwhnNgVJ7dVXWy0WQO0qt4I
	8Jdj43Mx1+hVDngUpMHx9bc6k8NoeAM3a56Jq+NdKYXI6c4EKT9zVEdVzMJyRTa8Xn0N
	gI05+LAWCuSyKW6YB9e3K57BHkpELYHDx85oC1k44e7kdihv54qLR5jIYYoAiM90LTGB
	Kq7sBTWHqmk3Uj7tn9j13AS0fWfuv9SJwQNkASBmR98Iix0bZOlGBIAqyK2SDI9PLKca
	nKdPBTeoa4ivQ8pmHg0ZiPE5dxHV4hE0fuomtGcnqH83afkcp6bkbph3CXoKZgr7T+TC
	hRgg==
Received: by 10.14.184.134 with SMTP id s6mr54823334eem.43.1355187846200;
	Mon, 10 Dec 2012 17:04:06 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id f6sm24864521eeo.7.2012.12.10.17.04.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Dec 2012 17:04:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 02:04:17 +0100
Message-Id: <cover.1355187290.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354586187.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
Subject: [PATCH 00/90] [meta-oe] Small fixes from bitbake world - updated cover letter
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Dec 2012 01:18:38 -0000

As builder was finishing more recipes in world build, I've 
added few more commits to this branch and also sent some v2

Here is updated cover letter.

I've also forget to set [meta-oe] prefix for individual commits, 
only cover letter has it, but I guess that nobody will try to apply
90 commits from patchwork.. and merging this branch should work fine.

The following changes since commit 9c2eee256d52e7ee40163542381d8d2691bd5bfe:

  Revert "qt4: rename bbappends to match new 4.8.4 version from oe-core" (2012-12-10 11:48:15 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (89):
  e-base.bbclass: bump EFL_SRCREV for E17 alpha6
  e-base.bbclass: bump EFL_SRCREV for E17 alpha7
  vpnc: import from OE-classic
  fluidsynth: import from OE-Classic
  packagekit: import from OE-Classic
  pyrtm: import from OE-Classic
  usb-modeswitch-data: upgrade to 20121109
  usb-modeswitch: upgrade to 1.2.5
  cheese: rename eds-dbus to evolution-data-server in DEPENDS
  gnome-terminal: add SRC_URI checksums
  libnotify3: add SRC_URI checksum
  gcalctool: add SRC_URI checksums
  libgtkstylus: add SRC_URI checksums
  qconnman: update git repo URL
  edje-viewer: add LIC_FILES_CHKSUM and drop BSD from LICENSE
  uptime: add LIC_FILES_CHKSUM
  forecast: add LIC_FILES_CHKSUM
  cpu: add LIC_FILES_CHKSUM
  diskio: add LIC_FILES_CHKSUM
  exquisite: add LIC_FILES_CHKSUM
  ephoto: update LICENSE and LIC_FILES_CHKSUM
  exalt: fix LICENSE and add LIC_FILES_CHKSUM
  news: fix LICENSE and add LIC_FILES_CHKSUM
  flame: add LIC_FILES_CHKSUM
  rain: add LIC_FILES_CHKSUM
  libeweather: add LIC_FILES_CHKSUM
  epeg: add LIC_FILES_CHKSUM
  xorg-sgml-doctools: add LIC_FILES_CHKSUM
  engrave: add LIC_FILES_CHKSUM
  edb: add LIC_FILES_CHKSUM
  gnome-terminal: add LICENSE version and LIC_FILES_CHKSUM
  notification: remove recipe, notification module is now part of e-wm
  waker: remove recipe, source was removed in r70549
  elementary-alarm: remove recipe, source was removed in r70549
  epdfview: move from meta-efl to meta-gnome
  gnome-vfs: fix QA warnings in packaging
  fuse: remove /dev/fuse in do_install_append
  libbonobo: fix QA warnings in packaging
  gnome/libgnomecanvas: delete, there is newer version in
    libgnome/libgnomecanvas
  libgnomecanvas: fix QA warnings from packaging
  libgnome: fix QA warnings from packaging
  libbonoboui: fix QA warnings from packaging
  libgnomeui: fix QA warnings from packaging
  pcsc-lite: add bbappend in meta-systemd
  entrance: rename xserver-nodm.service to entrance.service so it does
    not conflict with xserver-nodm-init in sysroot
  systemd: add PACKAGES_DYNAMIC
  exalt-client: add LIC_FILES_CHKSUM
  systemd: reenable python and add python-systemd-journald
  xf86-input-void: fix SRC_URI checksums
  lightmediascaner: move .a files from PN-dev to PN-staticdev
  tangogps: fix doc instalation
  lightmediascaner: move .a files from PN-dev to PN-staticdev
  gvim: fix unpackaged files QA warning
  libcanberra: package also gtk-3.0 if it gets built
  lua5.1: fix packaging QA warnings
  util-linux: add meta-systemd bbappend for new version which installs
    uuidd.service and socket
  eject: drop 2nd LICENSE field
  eject: use new update-alternatives and add u-a for eject
  libcanberra: skip dev-so QA for PN-gtk
  python-twisted: fix packaging QA warnings
  e-base.bbclass: bump EFL_SRCREV for E17 alpha8
  enjoy: depend on edbus2
  python-efl: fix do_configure_prepend to be reentrant
  samba: remove empty /sbin
  gpm: include /usr/share/emacs/site-lisp in PN
  desktop-file-utils: don't build
    /usr/share/emacs/site-lisp/desktop-entry-mode.el
  systemd: add target python to depends
  vim-tiny: package /usr/share/vim in PN-data
  efl.bbclass: fix FILES for PN-staticdev
  exalt-client: fix FILES for PN-staticdev
  gnome-disk-utility: disable failing docs generation
  gnome-disk-utility: fix unpackaged files
  gnome-session: disable failing docs generation
  gdm: disable failing docs generation
  cheese: disable scrollkeeper
  gnome-themes: fix path to icon-name-mapping
  cheese: disable help build
  gnome-mplayer: fix unpackaged files warning
  libwmf: fix QA warnings
  gateone: fix unpackaged files
  lmbench: fix unpackaged files
  xdotool: fix unpackaged files
  libxml++: fix unpackaged files
  qwt: fix unpackaged files
  vlc: disable kde-solid
  vlc: add fluidsynth and alsa-lib to DEPENDS for reproducible builds
  openbox: fix PR format and use new update-alternatives syntax
  fluidsynth: upgrade to 1.1.1
  gcalctool: upgrade to 5.32.0

Samuel Stirtzel (1):
  maliit-plugins: Don't build the documentation as it requires Doxygen

 meta-efl/classes/e-base.bbclass                    |   2 +-
 meta-efl/classes/efl.bbclass                       |   4 +-
 meta-efl/recipes-devtools/python/python-efl.inc    |   4 +-
 meta-efl/recipes-efl/e17/cpu_svn.bb                |   3 +
 meta-efl/recipes-efl/e17/diskio_svn.bb             |   7 +-
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb        |   5 +-
 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb   |  17 -
 meta-efl/recipes-efl/e17/enjoy_svn.bb              |   2 +-
 meta-efl/recipes-efl/e17/ephoto_svn.bb             |   6 +-
 meta-efl/recipes-efl/e17/exalt-client_svn.bb       |   6 +-
 meta-efl/recipes-efl/e17/exalt_svn.bb              |   4 +-
 meta-efl/recipes-efl/e17/exquisite_svn.bb          |   1 +
 meta-efl/recipes-efl/e17/flame_svn.bb              |   3 +
 meta-efl/recipes-efl/e17/forecasts_svn.bb          |   3 +
 meta-efl/recipes-efl/e17/news_svn.bb               |   7 +-
 meta-efl/recipes-efl/e17/notification_svn.bb       |  13 -
 meta-efl/recipes-efl/e17/rain_svn.bb               |   4 +
 meta-efl/recipes-efl/e17/uptime_svn.bb             |   3 +
 meta-efl/recipes-efl/e17/waker_svn.bb              |  17 -
 meta-efl/recipes-efl/efl/edb_svn.bb                |   3 +
 meta-efl/recipes-efl/efl/engrave_svn.bb            |   1 +
 meta-efl/recipes-efl/efl/epeg_svn.bb               |   3 +
 meta-efl/recipes-efl/efl/libeweather_svn.bb        |   5 +-
 .../lightmediascanner/lightmediascanner_0.4.4.bb   |   3 +-
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb    |   9 +-
 .../epdfview}/epdfview/browser_command.patch       |   0
 .../epdfview}/epdfview/fix-format.patch            |   0
 .../epdfview}/epdfview/glib-single-include.patch   |   0
 .../epdfview}/epdfview/swap-colors.patch           |   0
 .../recipes-apps/epdfview}/epdfview_0.1.8.bb       |   0
 .../gnome-mplayer/gnome-mplayer_1.0.5.bb           |   7 +
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |   4 +-
 .../recipes-gnome/bonobo/libbonobo_2.24.3.bb       |   2 +
 .../recipes-gnome/bonobo/libbonoboui_2.24.3.bb     |   5 +-
 .../desktop-file-utils/desktop-file-utils_0.18.bb  |   4 +
 .../recipes-gnome/gcalctool/gcalctool_5.32.0.bb    |  18 +
 .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |  12 -
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |   8 +-
 .../gnome-disk-utility_2.32.0.bb                   |   9 +-
 .../gnome-session/gnome-session_2.32.1.bb          |   6 +-
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |  11 +-
 .../recipes-gnome/gnome/gnome-terminal_2.26.3.bb   |   5 +-
 .../recipes-gnome/gnome/libgnomecanvas_2.20.0.bb   |  14 -
 .../recipes-gnome/libgnome/libgnome_2.32.1.bb      |   6 +-
 .../libgnome/libgnomecanvas_2.26.0.bb              |   5 +-
 meta-gnome/recipes-gnome/libgnome/libgnomeui.inc   |   3 +-
 .../recipes-gnome/libgnome/libgnomeui_2.24.3.bb    |   2 +
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |   8 +-
 .../recipes-gnome/libnotify/libnotify3_0.7.3.bb    |   2 +
 .../recipes-gnome/themes/gnome-themes_2.32.1.bb    |   4 +-
 .../fluidsynth/fluidsynth_1.1.1.bb                 |  13 +
 .../recipes-connectivity/vpnc/vpnc/default.conf    |  19 +
 .../recipes-connectivity/vpnc/vpnc/long-help       | 168 ++++++++
 .../recipes-connectivity/vpnc/vpnc/makeman.patch   |  11 +
 .../vpnc/vpnc/vpnc-install.patch                   |  35 ++
 .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        |  30 ++
 .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   7 +-
 .../recipes-connectivity/gateone/gateone_git.bb    |   6 +-
 meta-oe/recipes-connectivity/samba/samba.inc       |   1 +
 meta-oe/recipes-connectivity/samba/samba_3.6.8.bb  |   2 +-
 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb     |   6 +-
 .../libcanberra/libcanberra_0.26.bb                |   9 +-
 meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb       |   6 +-
 .../packagekit/packagekit-0.5.6/configurefix.patch |  13 +
 .../packagekit/packagekit-0.5.6/opkgfixes.patch    | 422 +++++++++++++++++++++
 .../packagekit/packagekit_0.5.6.bb                 |  57 +++
 meta-oe/recipes-devtools/python/pyrtm_0.2.bb       |  12 +
 .../python/python-twisted_10.2.0.bb                |   6 +-
 meta-oe/recipes-extended/libwmf/libwmf_0.2.8.4.bb  |   5 +-
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb  |   9 +-
 .../xdotool/xdotool_1.20100416.2809.bb             |   4 +-
 .../xorg-doc/xorg-sgml-doctools_1.7.bb             |   2 +
 .../xorg-driver/xf86-input-void_1.4.0.bb           |   4 +-
 meta-oe/recipes-multimedia/vlc/vlc.inc             |   4 +-
 meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb       |   2 +-
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |   6 +-
 meta-oe/recipes-qt/qconnman/qconnman.inc           |   2 +-
 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb              |   2 +
 meta-oe/recipes-qt/qwt/qwt.inc                     |   6 +-
 meta-oe/recipes-qt/qwt/qwt_6.0.1.bb                |   2 +
 meta-oe/recipes-support/eject/eject_2.1.5.bb       |  16 +-
 meta-oe/recipes-support/fuse/fuse_2.9.2.bb         |   6 +
 meta-oe/recipes-support/gpm/gpm_1.99.7.bb          |   3 +
 .../recipes-support/maliit/maliit-plugins_git.bb   |   1 +
 ...20120120.bb => usb-modeswitch-data_20121109.bb} |   4 +-
 ...usbmodeswitch-leave-stripping-to-packager.patch |   7 +-
 ...modeswitch-leave-script-munging-to-recipe.patch |  16 +-
 ...modeswitch_1.2.2.bb => usb-modeswitch_1.2.5.bb} |   6 +-
 meta-oe/recipes-support/vim/gvim_7.2.446.bb        |   4 +
 meta-oe/recipes-support/vim/vim-tiny_7.2.446.bb    |   6 +
 .../{xserver-nodm.service => entrance.service}     |   0
 .../meta-efl/recipes-efl/efl/entrance_svn.bbappend |   4 +-
 .../pcsc-lite/pcsc-lite_1.8.6.bbappend             |   6 +
 .../util-linux/util-linux_2.22.1.bbappend          |   8 +
 meta-systemd/recipes-core/systemd/systemd_git.bb   |  25 +-
 95 files changed, 1061 insertions(+), 192 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/notification_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/waker_svn.bb
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/browser_command.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/fix-format.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/glib-single-include.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/swap-colors.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview_0.1.8.bb (100%)
 create mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.32.0.bb
 delete mode 100644 meta-gnome/recipes-gnome/gcalctool/gcalctool_5.8.17.bb
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.1.1.bb
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/default.conf
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/long-help
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/makeman.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc/vpnc-install.patch
 create mode 100644 meta-networking/recipes-connectivity/vpnc/vpnc_0.5.3.bb
 create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/configurefix.patch
 create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit-0.5.6/opkgfixes.patch
 create mode 100644 meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb
 create mode 100644 meta-oe/recipes-devtools/python/pyrtm_0.2.bb
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20120120.bb => usb-modeswitch-data_20121109.bb} (74%)
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_1.2.2.bb => usb-modeswitch_1.2.5.bb} (78%)
 rename meta-systemd/meta-efl/recipes-efl/efl/entrance/{xserver-nodm.service => entrance.service} (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-support/pcsc-lite/pcsc-lite_1.8.6.bbappend
 create mode 100644 meta-systemd/oe-core/recipes-core/util-linux/util-linux_2.22.1.bbappend

-- 
1.8.0



