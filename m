Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CB526772E2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751676856"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:19:39 +0200
Message-Id: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 00/34] Initial gobject introspection support for meta-openembedded
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:12 -0000

This patch adds gobject introspection support to recipes in meta-openembedded.
To make it work, you need to fetch the following poky branch and build against it:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/gobject-introspection-experimental

For general information about gobject introspection support in openembedded, see here:
http://lists.openembedded.org/pipermail/openembedded-core/2015-November/113390.html

NOTE to meta-oe maintainers: this patchset is meant for testing and review. It depends
on changes to oe-core that are not yet available in master branch, and therefore
it should not be merged yet.

The following changes since commit dafd61fa87c31fab97e36f71974fc097a1841c91:

  net-snmp: fix cross-compile breakage, add libnl pkgconfig option (2016-02-22 15:51:20 -0500)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akanavin/gobject-introspection-fixes
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akanavin/gobject-introspection-fixes

Alexander Kanavin (34):
  evolution-data-server: fix gobject introspection
  evince: update to 3.18.2
  gnome-bluetooth: update to 3.18.2
  gnome-desktop: remove pygtk dependency
  gnumeric: fix gobject introspection support
  libgdata: update to 0.16.1
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
  poppler-data: fix do_install()
  poppler: fix gobject introspection
  udisks2: fix gobject introspection
  upower: fix gobject introspection
  python-dbusmock: use real introspection instead on legacy pygobject

 .../recipes-gnome/eds/evolution-data-server_git.bb |   6 +-
 .../evince/0001-help-remove-YELP-macro.patch       |  24 ++++
 .../evince/0001-tiff-fix-compile-warning.patch     |  33 ------
 ...ove-pkg-config-check-for-gnome-icon-theme.patch |  35 ------
 .../evince/evince/cross-compile-fix.patch          |  25 -----
 .../evince/{evince_2.32.0.bb => evince_3.18.2.bb}  |  29 ++---
 .../0001-bluetooth-input-Fix-compile-errors.patch  |  37 ------
 ...luetooth-client-use-valid-interface-names.patch | 122 --------------------
 .../0003-Fix-build-with-libnotify-0.7.0.patch      |  47 --------
 .../gnome-bluetooth/gnome-bluetooth_2.32.0.bb      |  38 -------
 .../gnome-bluetooth/gnome-bluetooth_3.18.2.bb      |  20 ++++
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |   6 +-
 ...n-drop-introspection-macros-replace-them-.patch |  84 ++++++++++++++
 .../recipes-gnome/gnumeric/gnumeric_1.12.0.bb      |   5 +-
 .../{libgdata_0.7.1.bb => libgdata_0.16.1.bb}      |  21 +++-
 ...c-drop-a-copy-paste-of-introspection.m4-m.patch | 103 +++++++++++++++++
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.29.bb  |   2 +
 meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |   2 +-
 .../recipes-gnome/libxklavier/libxklavier_5.3.bb   |   2 -
 ...igure.ac-fix-paths-to-introspection-tools.patch |  41 +++++++
 .../recipes-support/goffice/goffice_0.10.1.bb      |   2 +
 .../recipes-support/tracker/tracker_0.14.2.bb      |   7 +-
 .../recipes-connectivity/gupnp/gssdp.inc           |  12 +-
 .../recipes-connectivity/gupnp/gupnp-av.inc        |   9 +-
 .../recipes-connectivity/gupnp/gupnp-dlna_0.9.4.bb |   4 +-
 .../recipes-connectivity/gupnp/gupnp-igd_0.2.2.bb  |   6 +-
 .../recipes-connectivity/gupnp/gupnp.inc           |  12 +-
 .../recipes-connectivity/gupnp/no-vala.inc         |   5 -
 .../recipes-connectivity/rygel/rygel_0.28.2.bb     |   2 +-
 .../dleyna/media-service-demo_git.bb               |  18 ---
 .../gstreamer-0.10/gst-plugins.inc                 |   2 +-
 .../gstreamer-0.10/gst-rtsp_0.10.8.bb              |   2 +
 .../gstreamer-0.10/gstreamer_0.10.36.bb            |   1 +
 .../gstreamer-0.10/python-gst/python-path.patch    |  28 -----
 .../gstreamer-0.10/python-gst_0.10.22.bb           |  29 -----
 .../recipes-support/libmediaart/libmediaart.inc    |   2 +-
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
 .../recipes-support/poppler/poppler-data_0.4.7.bb  |   2 +-
 meta-oe/recipes-support/poppler/poppler_0.37.0.bb  |   6 +-
 meta-oe/recipes-support/udisks/udisks2_2.1.5.bb    |   4 +-
 meta-oe/recipes-support/upower/upower_0.9.14.bb    |   4 +-
 ...-t-use-gobject-introspection-for-bindings.patch |  29 -----
 .../python/python-dbusmock_0.10.1.bb               |   1 -
 65 files changed, 484 insertions(+), 946 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-tiff-fix-compile-warning.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/Remove-pkg-config-check-for-gnome-icon-theme.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/cross-compile-fix.patch
 rename meta-gnome/recipes-gnome/evince/{evince_2.32.0.bb => evince_3.18.2.bb} (60%)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0001-bluetooth-input-Fix-compile-errors.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0002-bluetooth-client-use-valid-interface-names.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth/0003-Fix-build-with-libnotify-0.7.0.patch
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gnumeric/gnumeric/0001-configure.in-drop-introspection-macros-replace-them-.patch
 rename meta-gnome/recipes-gnome/libgdata/{libgdata_0.7.1.bb => libgdata_0.16.1.bb} (43%)
 create mode 100644 meta-gnome/recipes-gnome/libgsf/files/0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch
 create mode 100644 meta-gnome/recipes-support/goffice/goffice/0001-configure.ac-fix-paths-to-introspection-tools.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/no-vala.inc
 delete mode 100644 meta-multimedia/recipes-multimedia/dleyna/media-service-demo_git.bb
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst/python-path.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/gstreamer-0.10/python-gst_0.10.22.bb
 delete mode 100644 meta-oe/recipes-connectivity/bluez/bluez4-4.101/use-legacy-pygobject-instead-ofgobject-introspection.patch
 create mode 100644 meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
 rename meta-oe/recipes-graphics/babl/{babl_0.1.10.bb => babl_0.1.16.bb} (72%)
 rename meta-oe/recipes-graphics/gegl/{gegl_0.2.0.bb => gegl_0.3.4.bb} (46%)
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


