Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 33A53734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 10:05:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2015 03:05:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,415,1437462000"; d="scan'208";a="775907412"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 03:05:45 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 13:07:01 +0300
Message-Id: <1440583622-11664-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/3] gnome: add explicit bz2 compress type to older packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Aug 2015 10:05:46 -0000

The default was changed to xz in the gnomebase class to match the upstream.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb                         | 1 +
 meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb                     | 2 +-
 meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb                   | 1 +
 meta-gnome/recipes-gnome/evince/evince_2.32.0.bb                        | 1 +
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb                              | 1 +
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                          | 1 +
 meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb  | 1 +
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb      | 1 +
 .../recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb   | 1 +
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb          | 1 +
 .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb       | 1 +
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb          | 1 +
 meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb       | 1 +
 meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb              | 1 +
 .../recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb     | 1 +
 meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb          | 1 +
 .../recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb   | 1 +
 meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb                  | 1 +
 meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb                 | 1 +
 meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb                    | 1 +
 meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb                  | 1 +
 meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb                        | 1 +
 meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb                 | 1 +
 meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb                     | 1 +
 meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb                    | 1 +
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb              | 1 +
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb                 | 1 +
 meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb                  | 1 +
 meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb                      | 1 +
 meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb                    | 1 +
 meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb                  | 1 +
 meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb               | 1 +
 32 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
index a54a3a2..6e0e0aa 100644
--- a/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
+++ b/meta-gnome/recipes-apps/cheese/cheese_2.30.1.bb
@@ -10,6 +10,7 @@ inherit gnome
 
 SRC_URI[archive.md5sum] = "1599fded8a1797ea51fb010af4e6c45b"
 SRC_URI[archive.sha256sum] = "48f03470c6f527caa0e3b269d3afcff86ae0939a74f66ce030d4eed3bc3cbd9a"
+GNOME_COMPRESS_TYPE="bz2"
 
 FILES_${PN} += "${datadir}/dbus-1"
 RRECOMMENDS_${PN} = "gst-plugins-good-meta gst-plugins-base-meta"
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
index a83a0f1..fd4d812 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.32.1.bb
@@ -5,4 +5,4 @@ SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch \
            "
 SRC_URI[archive.md5sum] = "27fa902d4fdf6762ee010e7053aaf77b"
 SRC_URI[archive.sha256sum] = "9160d4f277646400d3bb6b4fa73636cc6d1a865a32b9d0760e1e9e6ee624976b"
-
+GNOME_COMPRESS_TYPE="bz2"
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
index f3e37a9..627f37e 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonoboui_2.24.5.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://gcc5.patch"
 
 SRC_URI[archive.md5sum] = "853be8e28aaa4ce48ba60be7d9046bf4"
 SRC_URI[archive.sha256sum] = "fab5f2ac6c842d949861c07cb520afe5bee3dce55805151ce9cd01be0ec46fcd"
+GNOME_COMPRESS_TYPE="bz2"
 
 DEPENDS = "libgnomecanvas libbonobo libgnome glib-2.0 gconf libxml2 libglade gnome-common intltool-native"
 
diff --git a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
index 5aa485e..e742ede 100644
--- a/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb
@@ -15,6 +15,7 @@ SRC_URI += " \
 
 SRC_URI[archive.md5sum] = "ebc3ce6df8dcbf29cb9492f8dd031319"
 SRC_URI[archive.sha256sum] = "2a4c91ae38f8b5028cebb91b9da9ddc50ea8ae3f3d429df89ba351da2d787ff7"
+GNOME_COMPRESS_TYPE="bz2"
 
 EXTRA_OECONF = " --enable-thumbnailer \
                  --disable-scrollkeeper \
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 723eee8..259c609 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -23,6 +23,7 @@ SRC_URI += " \
 
 SRC_URI[archive.md5sum] = "dbe5187a2e17881cc454e313e0ae8d1e"
 SRC_URI[archive.sha256sum] = "034d23af0ea18d86e5543e707212d9297ec7d83f221808968af266dbebc0e703"
+GNOME_COMPRESS_TYPE="bz2"
 
 EXTRA_OECONF = " \
     --enable-authentication-scheme=shadow \
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index 36bae08..1c7b7e3 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -11,6 +11,7 @@ inherit gnome gettext pythonnative
 SRC_URI+= "file://0001-workaround-void-pointer-arithmetic.patch"
 SRC_URI[archive.md5sum] = "e1eecb0a92a1a363b3d375ec5ac0fb3b"
 SRC_URI[archive.sha256sum] = "a561fe3dd1d199baede1bd07c4ee65f06fc7c494dd4d3327117f04149a608e3c"
+GNOME_COMPRESS_TYPE="bz2"
 
 EXTRA_OECONF = "--disable-scrollkeeper \
                 --enable-gvfs-metadata"
diff --git a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
index ca18341..2adb81b 100644
--- a/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-backgrounds/gnome-backgrounds_2.32.0.bb
@@ -13,6 +13,7 @@ inherit gnomebase
 
 SRC_URI[archive.md5sum] = "3df26626483b02e51adefc6ab5945a8d"
 SRC_URI[archive.sha256sum] = "4d7b60b5ba768bf8834b5fa3a3471cd9a9e14b5884bc210dc2d3cdbf1faddcef"
+GNOME_COMPRESS_TYPE="bz2"
 
 FILES_${PN} += "${datadir}/gnome-background-properties"
 
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
index 9edceb5..7b09fe1 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_2.32.0.bb
@@ -18,6 +18,7 @@ SRC_URI += " \
 "
 SRC_URI[archive.md5sum] = "f129686fe46c4c98eb70a0cc85d59cae"
 SRC_URI[archive.sha256sum] = "57b1f06c96a1b85e1c19ff919d708cc38e95edae658881ed99968c325839a973"
+GNOME_COMPRESS_TYPE="bz2"
 
 # No 'nautilus-sendto' recipe in meta-gnome yet
 EXTRA_OECONF += "--enable-nautilus-sendto=no"
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
index 5cc7ad1..86b913b 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_2.32.1.bb
@@ -10,6 +10,7 @@ inherit gnome
 
 SRC_URI[archive.md5sum] = "b4e8ab5c7556ae07addbfcfb4fa2f761"
 SRC_URI[archive.sha256sum] = "7c568b57358e5c08f4d8dd76dbac7df2539135ad081872b60514b7a8ac797e66"
+GNOME_COMPRESS_TYPE="bz2"
 
 LDFLAGS += "-lgthread-2.0 -lxml2"
 
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
index f167516..6256396 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_2.32.1.bb
@@ -10,6 +10,7 @@ inherit gnome pkgconfig
 
 SRC_URI[archive.md5sum] = "5c80d628a240eb9d9ff78913b31f2f67"
 SRC_URI[archive.sha256sum] = "55cbecf67efe1fa1e57ac966520a7c46d799c8ba3c652a1219f60cafccb3739d"
+GNOME_COMPRESS_TYPE="bz2"
 
 DEPENDS += "gconf libxrandr virtual/libx11 gtk+ glib-2.0 gnome-doc-utils startup-notification"
 
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
index 2c526c8..4f95066 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
@@ -10,6 +10,7 @@ PR = "r4"
 inherit gnomebase gtk-icon-cache
 SRC_URI[archive.md5sum] = "f0366c8baebca0404d190b2d78f3582d"
 SRC_URI[archive.sha256sum] = "03e461b6bda7f773f8018d25fa3213d3073d4dc83a76e6b39d962652f4de6a98"
+GNOME_COMPRESS_TYPE="bz2"
 
 SRC_URI += "\
     file://disable-scrollkeeper.patch \
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
index 860851d..1bbfb17 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_2.32.1.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam --with-
 
 SRC_URI[archive.md5sum] = "9a8aa74e03361676f29d6e73155786fc"
 SRC_URI[archive.sha256sum] = "31fecec1430a97f59a6159a5a2ea8d6a1b44287f1e9e595b3594df46bf7f18f9"
+GNOME_COMPRESS_TYPE="bz2"
 
 FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr \
                 ${base_libdir}/security/*${SOLIBSDEV} \
diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
index 43379bd..e241882 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_2.32.0.bb
@@ -17,3 +17,4 @@ DEPENDS = "dbus libgcrypt glib-2.0 intltool-native"
 
 SRC_URI[archive.md5sum] = "c42b2ca66204835d901d3dbfc1fa5ae6"
 SRC_URI[archive.sha256sum] = "56388c0d81ddfdb57d30e4963c83ecc1c18498aab99395420e0fff69929a0f0c"
+GNOME_COMPRESS_TYPE="bz2"
diff --git a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
index d9328b8..5e1588e 100644
--- a/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
+++ b/meta-gnome/recipes-gnome/gnome-menus/gnome-menus_2.30.5.bb
@@ -11,6 +11,7 @@ inherit gnomebase pkgconfig python-dir pythonnative
 
 SRC_URI[archive.md5sum] = "caa6772e63ed5870cf43dc3d354e0624"
 SRC_URI[archive.sha256sum] = "6dcc565006d6e8c2025ae83ab1f82edf6bd04d61c804c0dc9bf5ea50629c4caa"
+GNOME_COMPRESS_TYPE="bz2"
 
 PACKAGES += "${PN}-python"
 FILES_${PN} += "${datadir}/desktop-directories/"
diff --git a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
index 2c55cf1..5a8a62b 100644
--- a/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb
@@ -16,6 +16,7 @@ SRC_URI += " \
 
 SRC_URI[archive.md5sum] = "9a08e85dce3ffb90775f15e3bda4adda"
 SRC_URI[archive.sha256sum] = "17fa301bf7e133285c0e054ae3be2b0f690c48f59b09f67e04d6ed339b330476"
+GNOME_COMPRESS_TYPE="bz2"
 
 EXTRA_OECONF = " --disable-scrollkeeper \
                  --disable-applets \
diff --git a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
index cd8f43d..000db35 100644
--- a/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.32.1.bb
@@ -13,6 +13,7 @@ SRC_URI += "file://use_G_GINT64_FORMAT.patch"
 
 SRC_URI[archive.md5sum] = "222bad6b446cb19a6b9028ea24538002"
 SRC_URI[archive.sha256sum] = "22d93ce433fcf9c7ce6b5f36dd81f64e692ea0e41faaa0f61159ddac28c3686a"
+GNOME_COMPRESS_TYPE="bz2"
 
 EXTRA_OECONF = " --with-gtk=2.0 ac_cv_path_GCONF_SANITY_CHECK=set --disable-docbook-docs"
 
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index ce4b64e..dd2e63d 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -9,6 +9,7 @@ DEPENDS = "libgtop gtkmm glibmm gnome-doc-utils gnome-icon-theme libwnck gtk+ db
 inherit gnome
 SRC_URI[archive.md5sum] = "3f0bca9b0ebc7a365466851cd580d167"
 SRC_URI[archive.sha256sum] = "b628edfd39e3a6b374ce133f367d3568475eb4e981a367f4f9d62a9784e5ae59"
+GNOME_COMPRESS_TYPE="bz2"
 SRC_URI += " \
     file://0001-Fix-glib-includes.patch \
     file://0002-src-procman.cpp-include-main-gtkmm.h.patch \
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 6988b3a..48132ff 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -29,6 +29,7 @@ SRC_URI += " \
 
 SRC_URI[archive.md5sum] = "a05fab03eeef10a47dd156b758982f2e"
 SRC_URI[archive.sha256sum] = "62de64b5b804eb04104ff98fcd6a8b7276d510a49fbd9c0feb568f8996444faa"
+GNOME_COMPRESS_TYPE="bz2"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)}"
 PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
diff --git a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
index 26fbeb2..0ac2b20 100644
--- a/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
+++ b/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.30.2.bb
@@ -14,5 +14,6 @@ EXTRA_OECONF += "--disable-scrollkeeper"
 
 SRC_URI[archive.md5sum] = "74c4528f00067072c2bd867d1f8fe844"
 SRC_URI[archive.sha256sum] = "2c7af2250698b9f9f53c6eaa93211c1118cf2c7e29cbbacfd1e8a6a10069e07a"
+GNOME_COMPRESS_TYPE="bz2"
 
 RRECOMMENDS_${PN} += "gnome-common-schemas"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
index fe0d34e..6bb6816 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomecups_0.2.3.bb
@@ -20,3 +20,4 @@ SRC_URI += "\
 
 SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b"
 SRC_URI[archive.sha256sum] = "e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29"
+GNOME_COMPRESS_TYPE="bz2"
diff --git a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
index b17062b..9d41914 100644
--- a/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
+++ b/meta-gnome/recipes-gnome/gnome/libgnomeprint_2.18.8.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://fix.includes.patch \
            "
 SRC_URI[archive.md5sum] = "63b05ffb5386e131487c6af30f4c56ac"
 SRC_URI[archive.sha256sum] = "1034ec8651051f84d2424e7a1da61c530422cc20ce5b2d9e107e1e46778d9691"
+GNOME_COMPRESS_TYPE="bz2"
 
 FILES_${PN}-dbg += "\
     ${libdir}/${PN}/${PV}/modules/.debug \
diff --git a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
index 70ef193..a1c0347 100644
--- a/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
+++ b/meta-gnome/recipes-gnome/gthumb/gthumb_2.12.4.bb
@@ -12,6 +12,7 @@ inherit gnome pkgconfig
 
 SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
 SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
+GNOME_COMPRESS_TYPE="bz2"
 
 SRC_URI += "file://parallel.patch"
 
diff --git a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
index 09388fb..aeec2d3 100644
--- a/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/gweather/libgweather_2.30.3.bb
@@ -8,6 +8,7 @@ inherit gnome
 
 SRC_URI[archive.md5sum] = "bf6a0a05051341ecb250f332e3edfb88"
 SRC_URI[archive.sha256sum] = "b835374661423f37c46aa8e37368ae24a68856f117b7c21e475a21efdba5264c"
+GNOME_COMPRESS_TYPE="bz2"
 
 do_configure_prepend() {
     sed -i -e 's: doc : :g' ${S}/Makefile.am
diff --git a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
index 5b367de..a641270 100644
--- a/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
+++ b/meta-gnome/recipes-gnome/libgdata/libgdata_0.7.1.bb
@@ -13,3 +13,4 @@ inherit gnomebase pkgconfig autotools-brokensep gettext gtk-doc
 
 SRC_URI[archive.md5sum] = "ec5262cbcb07b63b58d45aa3ac636096"
 SRC_URI[archive.sha256sum] = "fb244138276a5ce98510b0e2408bbf6f9ce0fd8cdcf86f07cd4be38afbb7c2bc"
+GNOME_COMPRESS_TYPE="bz2"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
index 0a2f41c..27b8b9a 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnome_2.32.1.bb
@@ -10,6 +10,7 @@ PR = "r2"
 SRC_URI[archive.md5sum] = "a4345e6087ae6195d65a4674ffdca559"
 SRC_URI[archive.sha256sum] = "b2c63916866485793b87398266dd7778548c1734923c272a94d84ee011b6f7a4"
 SRC_URI += "file://0001-libgnome-Makefile.am-allow-deprecated-symbols.patch"
+GNOME_COMPRESS_TYPE="bz2"
 
 DEPENDS += "libcanberra gconf-native gnome-vfs libbonobo esound"
 
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index fd8f689..a0f0b51 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -12,6 +12,7 @@ DEPENDS = "gtk+ libglade libart-lgpl xineramaproto intltool-native"
 
 SRC_URI[archive.md5sum] = "ffcbb719c671ff5cd86e59aeba8d0b92"
 SRC_URI[archive.sha256sum] = "859b78e08489fce4d5c15c676fec1cd79782f115f516e8ad8bed6abcb8dedd40"
+GNOME_COMPRESS_TYPE="bz2"
 
 FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
 FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
index d148062..969df3b 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_2.32.0.bb
@@ -10,6 +10,7 @@ inherit gnome
 
 SRC_URI[archive.md5sum] = "de32a6e3e3464b566eecdc4332bf34bd"
 SRC_URI[archive.sha256sum] = "ddd52c4cc7d83ad7ef964a1bcb4db87407e65b00ffc3e70c088ca4ee7383d256"
+GNOME_COMPRESS_TYPE="bz2"
 
 do_configure_append() {
     find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
index 597c2ff..6fb2786 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomeui_2.24.3.bb
@@ -4,3 +4,4 @@ PR = "r1"
 
 SRC_URI[archive.md5sum] = "ceab6f4370581d1a03c09f15cc103099"
 SRC_URI[archive.sha256sum] = "04c81f3bb5a337cdf3ed1230916f82d29857ee95eb884f58dd2f5c6860efe803"
+GNOME_COMPRESS_TYPE="bz2"
diff --git a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
index 69a0f5c..2816e00 100644
--- a/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/libgtop/libgtop_2.28.2.bb
@@ -5,5 +5,6 @@ LIC_FILES_CHKSUM = "file://copyright.txt;md5=dbc839bf158d19a20e661db14db7a58c"
 inherit gnomebase lib_package gtk-doc
 SRC_URI[archive.md5sum] = "ed44d736efd97d062b77621de6aff439"
 SRC_URI[archive.sha256sum] = "49958d7da1f76b257bfd0d557d8ed2b218a5ab0d31b59fed1c32ddf2a1529f5d"
+GNOME_COMPRESS_TYPE="bz2"
 
 DEPENDS = "glib-2.0 intltool-native libxau"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
index 4be3f08..9728d52 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_2.32.2.bb
@@ -15,6 +15,7 @@ inherit gnome
 
 SRC_URI[archive.md5sum] = "51565aa10d1625dff56e381228346911"
 SRC_URI[archive.sha256sum] = "2d4ff28c7a7aa5d40eb2468149954a564c257a305183773057584d22d15347a2"
+GNOME_COMPRESS_TYPE="bz2"
 
 SRC_URI += "file://idl-sysroot.patch \
             file://no-try-run-strftime.diff \
diff --git a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
index a2b7e0c..90bc63c 100644
--- a/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/themes/gnome-themes_2.32.1.bb
@@ -28,3 +28,4 @@ FILES_${PN} += "${datadir}/themes ${datadir}/icons"
 SRC_URI += "file://iconpath-option.patch" 
 SRC_URI[archive.md5sum] = "41db9e3cb25d35af2675c599e67944d1"
 SRC_URI[archive.sha256sum] = "8601ee24c2e096593221cbd6ebdb6686042225a03c02a01c0d67c163f9febd1a"
+GNOME_COMPRESS_TYPE="bz2"
diff --git a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
index e512419..4f1430b 100644
--- a/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
+++ b/meta-oe/recipes-connectivity/loudmouth/loudmouth_1.4.3.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://04-use-pkg-config-for-gnutls.patch \
 
 SRC_URI[archive.md5sum] = "55339ca42494690c3942ee1465a96937"
 SRC_URI[archive.sha256sum] = "95a93f5d009b71ea8193d994aa11f311bc330a3efe1b7cd74dc48f11c7f929e3"
+GNOME_COMPRESS_TYPE="bz2"
 
 EXTRA_OECONF = "--with-ssl=openssl"
 
-- 
2.1.4


