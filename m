Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D862D6FF7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:09:53 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:09:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62868825"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:09:54 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:16 +0200
Message-Id: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 00/38] Initial gobject introspection support for meta-openembedded
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
X-List-Received-Date: Wed, 09 Mar 2016 15:09:55 -0000

This patch adds gobject introspection support to recipes in meta-openembedded.
To make it work, you need to fetch the following poky branch and build against it:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/gobject-introspection-experimental

For general information about gobject introspection support in openembedded, see here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/113390.html

NOTE to meta-oe maintainers: please queue this patchset and have it ready, the
introspection support in oe-core should appear very soon and lots of things in
meta-oe will break when it does.

The following changes since commit a1e135a499998add7575682bf53db5e02e753580:

  Revert "toybox: upgrade to 0.7.0" (2016-03-07 13:02:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akanavin/gobject-introspection-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akanavin/gobject-introspection-fixes

Alexander Kanavin (38):
  evolution-data-server: fix gobject introspection
  evince: update to 3.18.2
  gnome-bluetooth: update to 3.18.2
  gnome-desktop: remove pygtk dependency
  gnumeric: fix gobject introspection support
  libgsf: fix gobject introspection
  libwnck: fix gobject introspection
  libxklavier: fix gobject introspection
  goffice: fix gobject introspection
  tracker: fix gobject introspection
  gupnp: fix gobject introspection
  rygel: fix gobject introspection
  media-service-demo: remove the recipe
  python-gst: remove the 0.10 recipe
  gstreamer-0.10: disable gobject introspection
  libmediaart: fix gobject introspection
  bluez4: use real introspection instead of legacy pygobject
  modemmanager: fix vala support
  networkmanager: fix introspection and vala support
  telepathy-glib: fix gobject introspection support
  libgee: fix gobject introspection support
  polkit: fix gobject introspection support
  gtkextra: fix gobject introspection support
  libunique: fix gobject introspection support
  babl: update to 0.1.16
  gegl: update to 0.3.4
  gimp: accept newer versins of babl and gegl
  omgps: remove the recipe
  poppler: fix gobject introspection
  udisks2: fix gobject introspection
  upower: fix gobject introspection
  python-dbusmock: use real introspection instead on legacy pygobject
  gnome-menus: fix gobject introspection
  libgdata: fix gobject introspection
  libgtop: fix gobject introspection
  nautilus: fix gobject introspection
  network-manager-applet: fix gobject introspection
  gnome-panel: fix gobject introspection

 .../network-manager-applet_1.0.10.bb               |   2 +-
 .../recipes-gnome/eds/evolution-data-server_git.bb |   6 +-
 .../evince/0001-help-remove-YELP-macro.patch       |  24 ++++
 .../evince/0001-tiff-fix-compile-warning.patch     |  33 ------
 ...ove-pkg-config-check-for-gnome-icon-theme.patch |  35 ------
 .../evince/evince/cross-compile-fix.patch          |  25 -----
 .../evince/{evince_2.32.0.bb => evince_3.18.2.bb}  |  31 ++---
 .../0001-bluetooth-input-Fix-compile-errors.patch  |  37 ------
 ...luetooth-client-use-valid-interface-names.patch | 122 --------------------
 .../0003-Fix-build-with-libnotify-0.7.0.patch      |  47 --------
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |  38 -------
 .../gnome-bluetooth/gnome-bluetooth_3.18.2.bb      |  20 ++++
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |   6 +-
 .../gnome-menus/gnome-menus3_3.10.1.bb             |   2 +-
 .../gnome-menus/gnome-menus_2.30.5.bb              |   2 +-
 .../gnome-panel/gnome-panel_2.32.1.bb              |   2 +-
 ...n-drop-introspection-macros-replace-them-.patch |  84 ++++++++++++++
 .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |   5 +-
 .../recipes-gnome/libgdata/libgdata_0.16.1.bb      |   2 +-
 ...c-drop-a-copy-paste-of-introspection.m4-m.patch | 103 +++++++++++++++++
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb  |   4 +-
 meta-gnome/recipes-gnome/libgtop/libgtop_2.30.0.bb |   2 +-
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |   4 +-
 .../recipes-gnome/libxklavier/libxklavier_5.3.bb   |   4 +-
 .../recipes-gnome/nautilus/nautilus_2.32.2.bb      |   2 +-
 ...igure.ac-fix-paths-to-introspection-tools.patch |  41 +++++++
 .../recipes-support/goffice/goffice_0.10.1.bb      |   4 +-
 .../recipes-support/tracker/tracker_0.14.2.bb      |   7 +-
 .../recipes-connectivity/gupnp/gssdp.inc           |  12 +-
 .../recipes-connectivity/gupnp/gupnp-av.inc        |   9 +-
 .../recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb |   4 +-
 .../recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb  |   6 +-
 .../recipes-connectivity/gupnp/gupnp.inc           |  12 +-
 .../recipes-connectivity/gupnp/no-vala.inc         |   5 -
 .../recipes-connectivity/rygel/rygel_0.28.2.bb     |   4 +-
 .../dleyna/media-service-demo_git.bb               |  18 ---
 .../gstreamer-0.10/gst-plugins.inc                 |   2 +-
 .../gstreamer-0.10/gst-rtsp_0.10.8.bb              |   2 +
 .../gstreamer-0.10/gstreamer_0.10.36.bb            |   1 +
 .../gstreamer-0.10/python-gst/python-path.patch    |  28 -----
 .../gstreamer-0.10/python-gst_0.10.22.bb           |  29 -----
 .../recipes-support/libmediaart/libmediaart.inc    |   4 +-
 ...pygobject-instead-ofgobject-introspection.patch |  27 -----
 meta-oe/recipes-connectivity/bluez/bluez4_4.101.bb |   1 -
 .../modemmanager/modemmanager_1.4.12.bb            |   2 +-
 .../networkmanager/networkmanager_1.0.10.bb        |   8 +-
 .../telepathy/telepathy-glib_0.24.0.bb             |   2 +-
 meta-oe/recipes-devtools/libgee/libgee_0.16.1.bb   |   4 +-
 meta-oe/recipes-extended/polkit/polkit_0.113.bb    |  14 ++-
 meta-oe/recipes-gnome/gtkextra/gtkextra_3.0.5.bb   |   4 +-
 ...-use-LIBTOOL-instead-of-hardcoded-libtool.patch |  27 +++++
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb |   6 +-
 .../babl/{babl_0.1.10.bb => babl_0.1.16.bb}        |   4 +-
 .../gegl/{gegl_0.2.0.bb => gegl_0.3.4.bb}          |  22 ++--
 .../gimp/gimp/bump_Babl-GEGL_versions.patch        |  53 +++++++++
 meta-oe/recipes-graphics/gimp/gimp_2.8.14.bb       |   1 +
 ...g_type_init-is-deprecated-for-glib-2.35.0.patch |  33 ------
 .../omgps/omgps/fix.build.with.gcc.4.9.patch       |  22 ----
 .../omgps/omgps/fix.build.with.glib.2.34.patch     | 125 ---------------------
 .../omgps/omgps/fix.capability.patch               |  62 ----------
 .../recipes-navigation/omgps/omgps/gcc-4.4.patch   |  71 ------------
 .../omgps/omgps/gdk-pixbuf-2.26.5.patch            |  15 ---
 .../omgps/omgps/sysfs.node.2.6.32.patch            |  14 ---
 .../omgps/omgps/use.unused.variable.patch          |  15 ---
 meta-oe/recipes-navigation/omgps/omgps_svn.bb      |  29 -----
 meta-oe/recipes-support/poppler/poppler_0.37.0.bb  |   6 +-
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb    |   4 +-
 meta-oe/recipes-support/upower/upower_0.9.14.bb    |   4 +-
 ...-t-use-gobject-introspection-for-bindings.patch |  29 -----
 .../python/python-dbusmock_0.10.1.bb               |   1 -
 70 files changed, 481 insertions(+), 954 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
 rename meta-gnome/recipes-gnome/evince/{evince_2.32.0.bb => evince_3.18.2.bb} (56%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric/0001-configure.in-drop-introspection-macros-replace-them-.patch
 create mode 100644 meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
 create mode 100644 meta-gnome/recipes-support/goffice/goffice/0001-configure.ac-fix-paths-to-introspection-tools.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/no-vala.inc
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst/python-path.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_0.10.22.bb
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
 create mode 100644 meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
 rename meta-oe/recipes-graphics/babl/{babl_0.1.10.bb => babl_0.1.16.bb} (72%)
 rename meta-oe/recipes-graphics/gegl/{gegl_0.2.0.bb => gegl_0.3.4.bb} (45%)
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp/bump_Babl-GEGL_versions.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps_svn.bb
 delete mode 100644 meta-python/recipes-devtools/python/python-dbusmock/0001-Don-t-use-gobject-introspection-for-bindings.patch

-- 
2.7.0


