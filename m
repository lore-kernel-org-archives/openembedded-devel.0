Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 37B657FA28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:50 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id r10so8036370wrx.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=0WTc08Z+CXUKkN1P62Brrs9Eampt6u5+b7lZPA4NGg0=;
	b=NFJa4sdyhZQVo9tSumO4WwWpprTR68pFwFoCOONCzrafy+XO4xhpkI++ZfqAkZh0Kc
	X4NwF0QdFemo86lhGmwgr5GGDu95V3sUGEBLxDTGImVKyl8kkw+xstoRBJe5ciyKBALy
	CofKMMv8WprakCexreRYZ/Yj/aPqKtO0X9Jm4HArB8hOiHCHmwZQcvFahYA9nP1IaCpT
	SoDT3MW/KehsyjS5yRKxGUAz04ZA23a0zlY+y7YwjAEdrCkUXLWCq5FXJULZcrkW6l2b
	plxGfC8eCJ4qkILiFNgmyP5iJugobtros/WNQoubqIdX83Rp5HXEPfIfA4Tz9BG0rfyo
	3tOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0WTc08Z+CXUKkN1P62Brrs9Eampt6u5+b7lZPA4NGg0=;
	b=ZCVLJObN/0XvneTRywJsWcqzPJTH/4iBPalMTDBuzltGsVy295udPl7/CxHo+fT11W
	biz1fsX++Xx+uEfqoJsJJlb2cA188nC6Ch3nwPSB5tuswOFfQWfS20VWS9i5DPEtX7Vv
	VxdDdIvbT95sZs6JK5j/nbnCKiMFWC0Vd80yX2Um7hdBQUYZ8FpEKDqT2UNAHWhFA+4w
	2/gYrqbbcchR7w9TtwvN2AAvIG2QDAquK/UgI8YyCFtvY/OmmQRj3fu5WVqMA7fJGw/J
	I1y4TFM+zmtOCO49CGP8i6lXttr+AqwYv+eppfEWqwOp7Q+DKCOfDvYyPCb6EqoiALng
	2VQg==
X-Gm-Message-State: APjAAAWa9giaX2z1WKOVUN9UFEcaz1UNYVX0H1ytq2YXgmvxk4Rpunu3
	M62htQDv6gC/Qqrj1hr8bdiTG34A
X-Google-Smtp-Source: APXvYqzTmu3YcqSnABg8/LFRL9Kjunn3YnQyFiQpPOXb+WHd2Ih7ALdnwgltqZzgdDDKybl38rPhxw==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr10210112wrp.5.1573760990539;
	Thu, 14 Nov 2019 11:49:50 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:49 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:26 +0100
Message-Id: <20191114194930.2786-13-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 12/16] nautilus: upgrade 3.18.5 -> 3.34.1
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

bumping high requires rewrite from scratch almost:

* meson-build
* remove backported patch

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ome-desktop-thumbnail-API-with-new-g.patch | 40 -------------------
 .../recipes-gnome/nautilus/nautilus_3.18.5.bb | 33 ---------------
 .../recipes-gnome/nautilus/nautilus_3.34.1.bb | 32 +++++++++++++++
 3 files changed, 32 insertions(+), 73 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
deleted file mode 100644
index f19eb4979..000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From a4ed38e95cbe07f02028249b8b315565a5ac1e43 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 5 May 2018 22:32:45 -0700
-Subject: [PATCH] nautilus: drop gnome-desktop thumbnail API with new
- gdk-pixbuf
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If gdk-pixbuf >= 2.36.5 is available, its scaling API can do what we
-want, so we don’t need to use the deprecated gnome-desktop one.
-
-Also fixes compile errors seen on master
-nautilus-properties-window.c:5101: undefined reference to `gnome_desktop_thumbnail_scale_down_pixbuf'
-
-Upstream-Status: Backport
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/nautilus-properties-window.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/nautilus-properties-window.c b/src/nautilus-properties-window.c
-index dea8b0f..fad9bd1 100644
---- a/src/nautilus-properties-window.c
-+++ b/src/nautilus-properties-window.c
-@@ -5098,10 +5098,11 @@ update_preview_callback (GtkFileChooser *icon_chooser,
- 			scale = (double)gdk_pixbuf_get_height (pixbuf) /
- 				gdk_pixbuf_get_width (pixbuf);
- 
--			scaled_pixbuf = gnome_desktop_thumbnail_scale_down_pixbuf
-+			scaled_pixbuf = gdk_pixbuf_scale_simple
- 				(pixbuf,
- 				 PREVIEW_IMAGE_WIDTH,
--				 scale * PREVIEW_IMAGE_WIDTH);
-+				 scale * PREVIEW_IMAGE_WIDTH,
-+				 GDK_INTERP_HYPER);
- 			g_object_unref (pixbuf);
- 			pixbuf = scaled_pixbuf;
- 		}
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
deleted file mode 100644
index bdb2f3c88..000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "File manager for GNOME"
-SECTION = "x11/gnome"
-
-LICENSE="GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=36cf660aea2b8beffba7945f44a7e748 \
-                    file://COPYING.EXTENSIONS;md5=7579d6678402a1868631bf82c93ff0d4 \
-                    file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-inherit distro_features_check autotools pkgconfig gobject-introspection
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/nautilus/${MAJ_VER}/nautilus-${PV}.tar.xz \
-           file://0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch \
-           "
-
-SRC_URI[md5sum] = "0f578bda5655c0ce204befafca5803d7"
-SRC_URI[sha256sum] = "60a927c0522b4cced9d8f62baed2ee5e2fd4305be4523eb5bc44805971a6cc15"
-
-DEPENDS = "gtk+3 gnome-desktop3 gsettings-desktop-schemas glib-2.0-native intltool-native pango"
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-EXTRA_OECONF = " \
-    --disable-gtk-doc \
-    --disable-update-mimedb \
-    --disable-nst-extension \
-    --enable-tracker=no \
-    --disable-schemas-compile \
-    --enable-xmp=no \
-    --enable-libexif=no \
-"
-
-FILES_${PN} += "${datadir}/*"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
new file mode 100644
index 000000000..342c59d6d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.34.1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "File manager for GNOME"
+SECTION = "x11/gnome"
+
+LICENSE="GPLv3"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+DEPENDS = " \
+    fontconfig \
+    gtk+3 \
+    gnome-desktop3 \
+    gsettings-desktop-schemas \
+    gnome-autoar \
+    tracker \
+"
+
+inherit gnomebase gobject-introspection gtk-doc gettext distro_features_check
+
+SRC_URI[archive.md5sum] = "19e4f1d89fb9d0ff135d5b1974ce43b5"
+SRC_URI[archive.sha256sum] = "37ce2c16a610c589dcc7660f9092446465568e38e29bce6ed8c24f2e8e0077f3"
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+PACKAGECONFIG = "extensions"
+PACKAGECONFIG[extensions] = "-Dextensions=true,-Dextensions=false, gexiv2 gstreamer1.0-plugins-base"
+
+FILES_${PN} += " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+    ${datadir}/gnome-shell \
+"
-- 
2.21.0


