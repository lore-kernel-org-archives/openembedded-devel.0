Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 9A58E77CEC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 16:53:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 35BDF260A78
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Sep 2017 18:53:07 +0200
Message-Id: <20170906165307.18066-1-fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
Subject: [meta-gnome][PATCH] evince: Remove X dependency
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
X-List-Received-Date: Wed, 06 Sep 2017 16:53:15 -0000

gnome-desktop is the only X dependency for evince.
In order to build evince for Wayland based system without X support,
gnome-desktop is added to DEPENDS only if x11 exists in DISTRO_FEATURES.
So x11 is dropped from REQUIRED_DISTRO_FEATURES.

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 meta-gnome/recipes-gnome/evince/evince_3.24.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb b/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
index aae8e719a..78a949526 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
@@ -2,13 +2,11 @@ SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
-DEPENDS = "gtk+3 libsecret gnome-desktop3 poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
+DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
 PR = "r5"
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
-REQUIRED_DISTRO_FEATURES = "x11"
-
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0001-help-remove-YELP-macro.patch \
            file://0001-Add-format-attribute-to-_synctex_malloc.patch \
-- 
2.11.0


