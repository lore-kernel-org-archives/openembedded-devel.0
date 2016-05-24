Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 225276FFDA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 11:56:06 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2016 04:56:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498839"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:56:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 14:56:53 +0300
Message-Id: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 0/8] Fixes for oe-core's python 3 move
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
X-List-Received-Date: Tue, 24 May 2016 11:56:07 -0000

This patch unbreaks what would otherwise be broken by oe-core's move
to Python 3. Do not apply until the corresponding oe-core patchset is merged.

The following changes since commit 4ff633a23a055ca1cb58b269846cbca649f42cea:

  uim: Fix Warning (2016-05-19 12:03:54 +0200)

are available in the git repository at:

  git://git.openembedded.org/meta-openembedded-contrib akanavin/deprecate-python2
  http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=akanavin/deprecate-python2

Alexander Kanavin (8):
  Remove unnecessary exports of HOST_SYS and BUILD_SYS in python-based
    recipes
  florence: update to 0.6.3
  python-dbus: add a recipe
  python-imaging: add a recipe
  python-pyrex: add a recipe
  python-pygobject: add a recipe
  cmpi-bindings: fix build with python 3
  gnome-doc-utils-stub: add a recipe

 meta-efl/recipes-devtools/python/python-edbus.inc  |   4 -
 meta-efl/recipes-devtools/python/python-efl.inc    |   4 -
 .../recipes-extended/gparted/gparted_0.24.0.bb     |   2 +-
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb         |   1 +
 .../0001-Remove-help-directory-from-build.patch    |  29 +
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb     |  12 +-
 .../gnome-control-center_2.32.1.bb                 |   1 +
 .../gnome-desktop/gnome-desktop_2.32.1.bb          |   1 +
 .../0001-Add-gnome-doc-utils.make.patch            | 730 +++++++++++++++++++++
 .../gnome-panel/gnome-panel_2.32.1.bb              |   4 +-
 .../0001-Drop-help-directory-from-build.patch      |  25 +
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb   |   7 +-
 .../florence/files/0001-Fix-glib-includes.patch    |  33 -
 .../{florence_0.5.1.bb => florence_0.6.3.bb}       |  10 +-
 .../recipes-mediacentre/xbmc/xbmc_git.bb           |   2 -
 meta-networking/classes/waf-samba.bbclass          |   2 -
 meta-oe/recipes-devtools/geany/geany_1.27.bb       |   4 +-
 meta-oe/recipes-devtools/glade/glade3_3.8.5.bb     |   6 +-
 .../mercurial/mercurial-native_3.4.1.bb            |   2 +-
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch |  41 ++
 .../python/python-pygobject_3.18.2.bb              |  31 +
 ...HON_ABI-suffix-to-the-python-library-name.patch |  27 +
 .../cmpi-bindings/cmpi-bindings_git.bb             |   7 +-
 meta-oe/recipes-extended/hplip/hplip_3.12.6.bb     |   2 -
 .../recipes-extended/openwsman/openwsman_2.6.2.bb  |   2 -
 meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb  |   2 -
 .../gnome-doc-utils-stub/files/gnome-doc-utils.m4  |  61 ++
 .../gnome-doc-utils-stub_1.0.bb                    |  18 +
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb       |   6 -
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |   2 -
 meta-oe/recipes-support/opencv/opencv_3.1.bb       |   2 -
 meta-oe/recipes-support/postgresql/postgresql.inc  |   2 +-
 .../recipes-devtools/python/python-dbus_1.2.0.bb   |  31 +
 ...ing-setup.py-force-paths-for-zlib-freetyp.patch |  55 ++
 .../allow.to.disable.some.features.patch           |  65 ++
 .../python-imaging/fix-freetype-includes.patch     |  30 +
 .../python/python-imaging_1.1.7.bb                 |  45 ++
 .../python/python-matplotlib_1.1.0.bb              |   3 -
 .../python/python-pyrex-native_0.9.9.bb            |   5 +
 .../python-pyrex/pyrex-fix-optimized-mode.patch    |  15 +
 .../recipes-devtools/python/python-pyrex_0.9.9.bb  |  22 +
 meta-python/recipes-devtools/python/python-six.inc |   1 -
 .../python/python-vcversioner_2.14.0.0.bb          |   1 -
 43 files changed, 1259 insertions(+), 96 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gedit/files/0001-Remove-help-directory-from-build.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome-panel/gnome-panel/0001-Add-gnome-doc-utils.make.patch
 create mode 100644 meta-gnome/recipes-gnome/gthumb/files/0001-Drop-help-directory-from-build.patch
 delete mode 100644 meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
 rename meta-gnome/recipes-support/florence/{florence_0.5.1.bb => florence_0.6.3.bb} (71%)
 create mode 100644 meta-oe/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
 create mode 100644 meta-oe/recipes-devtools/python/python-pygobject_3.18.2.bb
 create mode 100644 meta-oe/recipes-extended/cmpi-bindings/cmpi-bindings/0001-Add-PYTHON_ABI-suffix-to-the-python-library-name.patch
 create mode 100644 meta-oe/recipes-gnome/gnome-doc-utils-stub/files/gnome-doc-utils.m4
 create mode 100644 meta-oe/recipes-gnome/gnome-doc-utils-stub/gnome-doc-utils-stub_1.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-dbus_1.2.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
 create mode 100644 meta-python/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
 create mode 100644 meta-python/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
 create mode 100644 meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyrex-native_0.9.9.bb
 create mode 100644 meta-python/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
 create mode 100644 meta-python/recipes-devtools/python/python-pyrex_0.9.9.bb

-- 
2.8.1


