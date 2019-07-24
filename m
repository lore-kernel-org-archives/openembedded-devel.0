Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6F77DD72
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 12:01:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45tv8L0VW1z23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jul 2019 14:01:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563969698;
	bh=FhoB5ah9GGc9WZvWhAy971G2us9fHMN/oGLhF1rskIA=;
	h=From:To:Subject:Date:From;
	b=mMCfeQjG8V29y02LcLHDy8pOSJ+DyBbukdhSCYBYK0piEY2cm4ngHdCylSlN9m2kR
	XDBjmKM0T0wkuxZYuxdfsqNm0O1KM/5dQzixoCvTmH68f9fNKk7YZRdB8uFhhRFjFX
	H8YsO7rmDdjntNEyQsdpU8SUB0ol2zAszQB+U9n0twaWUhrvgsyeGVYejGvTVp3mhc
	Cb/oLgXRPub5lDNmFvbUkn2GJJ8mzmWyt6RGnggvD9DaqzpAZhqTiIG60+csp2iZz3
	6H7StbyuR7ujOsmO3OAjldsvoGYdGzBVNeOPyIDVbG4OHcJXmlOagQTMMEmcLVMZbF
	sSBT/M6wQXWPgrMiER44GanNuPE7DBmTKUd0ASDNimICqqw5QxQZAyzx1nDxuM5nTO
	bLbDA7aOK0Exsp21OLldODJS0GIunkUtVFeAXgfh0ZPvOmsk1meUI6ezlGteqrOYol
	m7XUbtJ++wRhNS8xt3MhV1e278QLyizpn4yAdT4Z/pQD7QrQsoBTp8g5EAdoKM/Ib/
	ke1PnAVDtQ6cnmx9kzz2CThUH0gadxgIY8qRBTLIvYtFaQIHEkwwdNwCLp29ffB44w
	EU/M5U1nGOClzRD6R4QBHgUGJ/mnCMnNABUlGXlAAmLshz4xHo0BQY/A4UQhlSIoeD
	UZSvOfYWwBHr8LTc+4kqCOZM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 24 Jul 2019 15:01:33 +0300
Message-Id: <20190724120133.3666-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-gnome][PATCH v3] meta-gnome: Inherit gnomebase instead of gnome
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
X-List-Received-Date: Wed, 24 Jul 2019 12:01:38 -0000

The gnome class pulls in usually unwanted dependencies like gconf.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-gnome/recipes-gnome/evince/evince_3.28.2.bb              | 2 +-
 meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb                | 4 ++--
 .../recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb      | 2 +-
 .../gnome-system-monitor/gnome-system-monitor_3.32.0.bb       | 2 +-
 meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb                  | 4 ++--
 meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb       | 2 +-
 meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb             | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
index d2885906f..f45180e79 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
 DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
 
-inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
+inherit gnomebase pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
 SRC_URI = " \
     ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
diff --git a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
index ea6439d91..6e0720888 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_2.30.4.bb
@@ -3,13 +3,13 @@ SECTION = "x11/gnome"
 LICENSE = "GPLv2+"
 PR = "r2"
 
-DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 gtk+ \
+DEPENDS = "gvfs enchant gconf gnome-doc-utils glib-2.0 glib-2.0-native gtk+ \
            gtksourceview2 iso-codes intltool-native gnome-common-native \
            libice python3-six-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit distro_features_check gnome gettext python3native
+inherit distro_features_check gnomebase gconf gettext python3native
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index 1dad1e95b..85ee5e6cf 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -8,7 +8,7 @@ BPN = "gnome-desktop"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnome pkgconfig upstream-version-is-even gobject-introspection distro_features_check
+inherit gnomebase pkgconfig upstream-version-is-even gobject-introspection distro_features_check
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
index c2432a322..701b0891c 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_3.32.0.bb
@@ -14,7 +14,7 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gtk-icon-cache distro_features_check gettext
+inherit gnomebase gconf gtk-icon-cache distro_features_check gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
index 3a4714a12..893379b52 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.40.0.bb
@@ -3,9 +3,9 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=05df38dd77c35ec8431f212410a3329e"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnome bash-completion gettext upstream-version-is-even
+inherit gnomebase bash-completion gettext upstream-version-is-even
 
-DEPENDS += "libsecret glib-2.0 gconf libgudev shadow-native"
+DEPENDS += "libsecret glib-2.0 glib-2.0-native gconf libgudev shadow-native"
 
 SRC_URI = "https://download.gnome.org/sources/${BPN}/${@gnome_verdir("${PV}")}/${BPN}-${PV}.tar.xz;name=archive"
 
diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
index 7babbd0a8..d9f643106 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomekbd_3.26.1.bb
@@ -6,7 +6,7 @@ SECTION = "x11/gnome/libs"
 
 DEPENDS = "gconf glib-2.0 libxklavier gtk+3 intltool-native"
 
-inherit distro_features_check gnome gobject-introspection gettext
+inherit distro_features_check gnomebase gobject-introspection gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
index 08e52241b..e2a838b3a 100644
--- a/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
+++ b/meta-gnome/recipes-gnome/libgsf/libgsf_1.14.45.bb
@@ -7,7 +7,7 @@ SECTION = "libs"
 
 DEPENDS= "libxml2 bzip2 glib-2.0 zlib intltool-native gnome-common-native"
 
-inherit autotools pkgconfig gnome gconf gobject-introspection
+inherit autotools pkgconfig gnomebase gconf gobject-introspection
 
 SRC_URI += "file://0001-configure.ac-drop-a-copy-paste-of-introspection.m4-m.patch"
 
-- 
2.17.1


