Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tfi1K-0001vt-9z
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 03:14:06 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1925600eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 17:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer;
	bh=CrxRKN093Pc1rs5KBP1tYgQd0utPpOgMw+k4nx5tm5o=;
	b=tDQjtJf9WN0cN+KHlSLHlX9gQCXVX6IgTQsI44pgsRfMLMaSATJ3z2AJAaZK/ccejt
	ZkWQGKpX68qSCK/vAyYmqOhc1W1zfGxQ1Im/WnV//PmjEYCgVWvvPv/wHlF6BIst+Mi4
	FLWeDD+49bdcC1ukaRgEI7n29dG3l3sHVZtpNBHvlpUI6+WaW/36Of4SpAbOXoNmeyDz
	tIN++bN3QczVFWG2N7fHQuuFfrjt1gK5r+5/l1KkKnlgfgJiggKOv3h2yExCRmxwGFsF
	C3l7J9YZJ+hOqqnYK6EK2MAaQmoYTJaDJKhzPT5TZ+um1X312CufCj08v6XK4mV10kR0
	BoXw==
Received: by 10.14.177.1 with SMTP id c1mr42723521eem.8.1354586380427;
	Mon, 03 Dec 2012 17:59:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 46sm34796547eeg.4.2012.12.03.17.59.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 17:59:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 02:58:33 +0100
Message-Id: <cover.1354586187.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [PATCH 00/58] [meta-oe] Small fixes from bitbake world
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
X-List-Received-Date: Tue, 04 Dec 2012 02:14:06 -0000

The following changes since commit 85ab35f4edac91ecc180161e97c6698f1c10928b:

  netperf: Correct license flags (2012-11-30 11:49:56 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib jansa/pull
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=jansa/pull

Martin Jansa (58):
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

 meta-efl/classes/e-base.bbclass                    |   2 +-
 meta-efl/recipes-efl/e17/cpu_svn.bb                |   3 +
 meta-efl/recipes-efl/e17/diskio_svn.bb             |   7 +-
 meta-efl/recipes-efl/e17/edje-viewer_svn.bb        |   5 +-
 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb   |  17 -
 meta-efl/recipes-efl/e17/ephoto_svn.bb             |   6 +-
 meta-efl/recipes-efl/e17/exalt-client_svn.bb       |   4 +-
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
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb    |   4 +-
 .../epdfview}/epdfview/browser_command.patch       |   0
 .../epdfview}/epdfview/fix-format.patch            |   0
 .../epdfview}/epdfview/glib-single-include.patch   |   0
 .../epdfview}/epdfview/swap-colors.patch           |   0
 .../recipes-apps/epdfview}/epdfview_0.1.8.bb       |   0
 meta-gnome/recipes-gnome/bonobo/libbonobo.inc      |   4 +-
 .../recipes-gnome/bonobo/libbonobo_2.24.3.bb       |   2 +
 .../recipes-gnome/bonobo/libbonoboui_2.24.3.bb     |   5 +-
 .../recipes-gnome/gcalctool/gcalctool_5.8.17.bb    |   3 +
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |  11 +-
 .../recipes-gnome/gnome/gnome-terminal_2.26.3.bb   |   5 +-
 .../recipes-gnome/gnome/libgnomecanvas_2.20.0.bb   |  14 -
 .../recipes-gnome/libgnome/libgnome_2.32.1.bb      |   6 +-
 .../libgnome/libgnomecanvas_2.26.0.bb              |   5 +-
 meta-gnome/recipes-gnome/libgnome/libgnomeui.inc   |   3 +-
 .../recipes-gnome/libgnome/libgnomeui_2.24.3.bb    |   2 +
 .../recipes-gnome/libgtkstylus/libgtkstylus_0.5.bb |   8 +-
 .../recipes-gnome/libnotify/libnotify3_0.7.3.bb    |   2 +
 .../fluidsynth/fluidsynth_1.0.8.bb                 |  19 +
 .../recipes-connectivity/vpnc/vpnc/default.conf    |  19 +
 .../recipes-connectivity/vpnc/vpnc/long-help       | 168 ++++++++
 .../recipes-connectivity/vpnc/vpnc/makeman.patch   |  11 +
 .../vpnc/vpnc/vpnc-install.patch                   |  35 ++
 .../recipes-connectivity/vpnc/vpnc_0.5.3.bb        |  30 ++
 .../libcanberra/libcanberra_0.26.bb                |   6 +-
 meta-oe/recipes-devtools/lua/lua5.1_5.1.4.bb       |   6 +-
 .../packagekit/packagekit-0.5.6/configurefix.patch |  13 +
 .../packagekit/packagekit-0.5.6/opkgfixes.patch    | 422 +++++++++++++++++++++
 .../packagekit/packagekit_0.5.6.bb                 |  58 +++
 meta-oe/recipes-devtools/python/pyrtm_0.2.bb       |  12 +
 .../xorg-doc/xorg-sgml-doctools_1.7.bb             |   2 +
 .../xorg-driver/xf86-input-void_1.4.0.bb           |   4 +-
 .../recipes-navigation/tangogps/tangogps_0.99.4.bb |   6 +-
 meta-oe/recipes-qt/qconnman/qconnman.inc           |   2 +-
 meta-oe/recipes-support/eject/eject_2.1.5.bb       |  16 +-
 meta-oe/recipes-support/fuse/fuse_2.9.2.bb         |   6 +
 ...20120120.bb => usb-modeswitch-data_20121109.bb} |   4 +-
 ...usbmodeswitch-leave-stripping-to-packager.patch |   7 +-
 ...modeswitch-leave-script-munging-to-recipe.patch |  16 +-
 ...modeswitch_1.2.2.bb => usb-modeswitch_1.2.5.bb} |   6 +-
 meta-oe/recipes-support/vim/gvim_7.2.446.bb        |   4 +
 .../{xserver-nodm.service => entrance.service}     |   0
 .../meta-efl/recipes-efl/efl/entrance_svn.bbappend |   4 +-
 .../pcsc-lite/pcsc-lite_1.8.6.bbappend             |   6 +
 .../util-linux/util-linux_2.22.1.bbappend          |   8 +
 meta-systemd/recipes-core/systemd/systemd_git.bb   |  23 +-
 68 files changed, 959 insertions(+), 142 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/elementary-alarm_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/notification_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/waker_svn.bb
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/browser_command.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/fix-format.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/glib-single-include.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview/swap-colors.patch (100%)
 rename {meta-efl/recipes-efl/efl => meta-gnome/recipes-apps/epdfview}/epdfview_0.1.8.bb (100%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome/libgnomecanvas_2.20.0.bb
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_1.0.8.bb
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



