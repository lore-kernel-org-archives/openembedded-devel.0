Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 561B27E434
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:28 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id d18so4885299wrs.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=higvNpcbOhuEb+wUBv56sQDUVL9/ft9DimOHy8TK2og=;
	b=nkOy9oLoIsUqHMWZbsRhtEdiOd50us6zEL+/9nUhat2Q8JL4wXpwrjl6qUnaytBlQW
	PvJrBvsVQDD151P12jA3yAg5DRVdB1vqAD2yO7f/uyqdG/3NYfqzGaJMvk3MfHcOTe3w
	XpynuU438Ir24Isy6sdx6thTKUmaMtsmSeZnQQ7LrlX90WsLq6Q84vYkCvlhPOoY4ZC8
	eKylWtFYriLvYSiHhgkD2MDi8puG6u7WwCSse4uIdQXONqV4Xz6+RUP9l5d2n73GO1Hw
	6emM2qic/ExSqsyqLyo+vNM/OzTj5lgzIwUId3GHo6gk4KfDVxDgUms6Zdpr8xtvE6tj
	BHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=higvNpcbOhuEb+wUBv56sQDUVL9/ft9DimOHy8TK2og=;
	b=MeLcs8doesih82BVSJHb3eFBVNWdTnjU4tcJluZWJeVGKHprqgJwlFumxI/3jvFLAK
	g0CdJBUXRjlfV6FWINXrMEGIIIBilje2EkTzPgN9LnHAFAJCS3wSmPv7JTzqYR9s/M8g
	9+Xn5g3apXE2YnYkvoGadxyTbw7lMvlK4/FL1mM8ngiBe12jKs2DoqRGGl7UtM0ytf9A
	eFnpB8JcvB62Jzk0NvvJJFQY4mgp7uNptgemsj5MHzcBupnc70264qvcw4mipkgl90rD
	U4mfoBlz11maTu9YhaxDL+F1bzsfykp2wvd7E7bnhMcSwT7DftzLRTwCa5fqLh0oI+bI
	Fbzw==
X-Gm-Message-State: APjAAAUr8C3TlKt4MycGmL3GgPj/wNuwwkUy75ir7GI9El0rSRidZWJS
	0tR4qbUJzMom8Rui3CVFtGHPs2asDgE=
X-Google-Smtp-Source: APXvYqxRZIdL+AW81183Ad8qzNGmjviCAHhw47G2hHjT43qGFDB7O1+vKkfFXFI489roFk7l6vSPVw==
X-Received: by 2002:adf:c7d0:: with SMTP id y16mr395109wrg.39.1558594168874;
	Wed, 22 May 2019 23:49:28 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:28 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:42 +0200
Message-Id: <20190523064859.24336-25-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 24/41] nautilus: upgrade 3.18.5 -> 3.32.1
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
X-List-Received-Date: Thu, 23 May 2019 06:49:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ome-desktop-thumbnail-API-with-new-g.patch | 40 -------------------
 .../recipes-gnome/nautilus/nautilus_3.18.5.bb | 33 ---------------
 .../recipes-gnome/nautilus/nautilus_3.32.1.bb | 32 +++++++++++++++
 3 files changed, 32 insertions(+), 73 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus_3.32.1.bb

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
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.32.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.32.1.bb
new file mode 100644
index 000000000..8f7f2f2e7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.32.1.bb
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
+SRC_URI[archive.md5sum] = "e1bd5e67979b2082166a41319d5df079"
+SRC_URI[archive.sha256sum] = "fa54038f9d09e3c989ba82f501df99dfe5c4448e604f22e3a00305b26bdcb96e"
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
2.20.1


