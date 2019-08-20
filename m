Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id B20147ECB9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2019 18:54:40 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id BA8B21014BA;
	Tue, 20 Aug 2019 18:54:40 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Aug 2019 20:54:32 +0200
Message-Id: <20190820185434.2637-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 1/3] gnome-bluetooth: Update to version 3.32.1.
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
X-List-Received-Date: Tue, 20 Aug 2019 18:54:42 -0000
Content-Transfer-Encoding: 8bit

This is the latest upstream stable version.

Besides simple version bump this patch also makes the following changes:
1. Switch build system from autotools to meson.
2. Drop x11 as required distro feature. This package by itself does not
   depend on x11. It's perfectly usable in headles or wayland only
   environments.
3. Drop intltool-native and gnome-common-native from DEPENDS since those
   packages no longer seem to be needed by meson based build setup.
4. Add runtime dependency on bluez5. The package obviously needs it to
   function, but since it does not link with any libs provided by bluez5
   (it talks to bluez stack via dbus) this dependency won't be added
   automatically.
5. Inherit upstream-version-is-even since GNOME packages do follow
   versioning convention checked by this bbclass.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 .../gnome-bluetooth/gnome-bluetooth_3.18.2.bb | 19 ----------------
 .../gnome-bluetooth/gnome-bluetooth_3.32.1.bb | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 19 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
deleted file mode 100644
index d0eebda38..000000000
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "GNOME bluetooth manager"
-LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
-"
-
-SECTION = "x11/gnome"
-
-DEPENDS = "udev gtk+3 libnotify libcanberra intltool-native gnome-common-native \
-    bluez5 \
-"
-
-inherit gnomebase gtk-icon-cache gobject-introspection distro_features_check
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI[archive.md5sum] = "75d09c924468ec0c687f9ab3acf7f113"
-SRC_URI[archive.sha256sum] = "d8df073c331df0f97261869fb77ffcdbf4e3e4eaf460d3c3ed2b16e03d9c5398"
-
-FILES_${PN}-dbg += "${libdir}/gnome-bluetooth/plugins/.debug/"
diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
new file mode 100644
index 000000000..3c4438e7e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.32.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "GNOME bluetooth manager"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
+"
+
+SECTION = "x11/gnome"
+
+DEPENDS = "udev gtk+3 libnotify libcanberra bluez5"
+
+GNOMEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+inherit gnomebase gtk-icon-cache gtk-doc gobject-introspection upstream-version-is-even
+
+# gtk-icon-cache bbclass will take care of this for us.
+EXTRA_OEMESON = "-Dicon_update=false"
+
+SRC_URI[archive.md5sum] = "5b3d66f564a5067ea154750cdb6d850d"
+SRC_URI[archive.sha256sum] = "6441cafd313af94fba28b701698074f97d693b9023788a74e8e6f16f817ba1aa"
+
+RDEPENDS_${PN} += "bluez5"
-- 
2.21.0


