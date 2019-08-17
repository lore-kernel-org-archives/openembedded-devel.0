Return-Path: <tworaz@tworaz.net>
Received: from mail.tworaz.net (tworaz.net [139.162.170.142])
	by mail.openembedded.org (Postfix) with ESMTP id 88A567F32C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Aug 2019 22:00:38 +0000 (UTC)
Received: from raven.lan (87-206-69-189.dynamic.chello.pl [87.206.69.189])
	by mail.tworaz.net (Postfix) with ESMTPSA id 5C903103740;
	Sat, 17 Aug 2019 22:00:39 +0000 (UTC)
From: Piotr Tworek <tworaz@tworaz.net>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Aug 2019 00:00:30 +0200
Message-Id: <20190817220032.6778-1-tworaz@tworaz.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 1/3] gnome-themes-standard: Update to version 3.28
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
X-List-Received-Date: Sat, 17 Aug 2019 22:00:38 -0000
Content-Transfer-Encoding: 8bit

This is the latest upstream stable version that has been released over a
year ago. It also seems that upstream has renamed the package to
gnome-themes-extra.

While doing the upgrade modify the recipe to use gnomebase bbclass from
oe-core. This allows us to re-use SRC_URI pattern provided by this
bbclass.

Signed-off-by: Piotr Tworek <tworaz@tworaz.net>
---
 ...rd_3.22.3.bb => gnome-themes-standard_3.28.bb} | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-gnome/gnome-themes/{gnome-themes-standard_3.22.3.bb => gnome-themes-standard_3.28.bb} (73%)

diff --git a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.22.3.bb b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
similarity index 73%
rename from meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.22.3.bb
rename to meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
index 55ee27760..53eb32be9 100644
--- a/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.22.3.bb
+++ b/meta-oe/recipes-gnome/gnome-themes/gnome-themes-standard_3.28.bb
@@ -4,20 +4,19 @@ BUGTRACKER = "https://bugzilla.gnome.org/"
 SECTION = "x11/gnome"
 
 LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
-inherit autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even distro_features_check
+# Upstream renamed this package to gnome-themes-extra at some point
+BPN = "gnome-themes-extra"
+
+inherit gnomebase gettext gtk-icon-cache upstream-version-is-even distro_features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 
 DEPENDS += "intltool-native gtk+"
 
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-          "
-
-SRC_URI[md5sum] = "b51c362b157b6407303d44f93c31ee11"
-SRC_URI[sha256sum] = "61dc87c52261cfd5b94d65e8ffd923ddeb5d3944562f84942eeeb197ab8ab56a"
+SRC_URI[archive.md5sum] = "f9f2c6c521948da427f702372e16f826"
+SRC_URI[archive.sha256sum] = "7c4ba0bff001f06d8983cfc105adaac42df1d1267a2591798a780bac557a5819"
 
 EXTRA_OECONF = "--disable-gtk3-engine"
 
-- 
2.21.0


