Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0FAF271C42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:22:15 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id c198so467479pfc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 11:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KaPqMLo0HDMB9SInYFHj+M4MDAHC7qq0pvjkIOSWtVQ=;
	b=H5MT/joJ6u/OapwsP0sMvC49hJ/hlE++0njcxaix2LL7G4YP7yRKMCpx+75ME2h5rm
	opgooEumRHdWHv/7LwadFxhayuw3mJG0uWmU3oCVKBa0UppWTxx4ad9u4jI+IzvHk42O
	ol9+MAK6hG+y01/swB1UqnfGTKv+eHzugjkcRBm/Ov8XhoG+pRK124XYN2HPWIfe8G8C
	1dTWoXB9m2lCuvBq9K16B36ryHcgs3IxpJtk08Xg1kJByQNmyN3h3XggMV88tLkoPhKR
	7UDwzImSKtd16hLPRjZXO53xK4eLnQmGwipi8ZWCIMJGNd0siL9Xk1T27XQqExIpgth7
	QHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KaPqMLo0HDMB9SInYFHj+M4MDAHC7qq0pvjkIOSWtVQ=;
	b=GqsDYX/nSFxOYw+g/3kxpzjOvpc1FOdWBXetKoKeEqxM9f2X4kV0JIGJRalzTbsCcp
	lTQEvjO3KQpM195QSaFtt1iWu94m3y13859kFXaht7C0YxpsgBh0sAJCbkPHJ1Nu6+z5
	vmQDSCGrpfyG5waslMxQ/Et8UT7OrIMlSfXScOBFK4vd1VYWjDPNQOQMe0UFNIGb+rcp
	KO2qu54b2Ugcjv9nXHoJ63eHoIPuVOx0iUjdKgZGyocNY7xmZttWywailI3QATKUE3f0
	C4FPy/A7PosrMZSg8XaeOkcwNix17hzoU3X3uZIhPDC1PqFtIzwpZmKCyAuQoecw1/2K
	yE2w==
X-Gm-Message-State: AN3rC/7MGFWPm613579s4BWOZ3STvZqx8+voxLT2Bs9PCsdcRschzhvW
	ye3r9dkaOQ0DJ60/
X-Received: by 10.98.10.147 with SMTP id 19mr19244517pfk.193.1492539736765;
	Tue, 18 Apr 2017 11:22:16 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	m29sm25402101pfj.32.2017.04.18.11.22.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Apr 2017 11:22:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Apr 2017 11:21:26 -0700
Message-Id: <20170418182142.27253-16-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170418182142.27253-1-raj.khem@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
Subject: [meta-gnome][ 16/32] evince: Upgrade to 3.24.0
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
X-List-Received-Date: Tue, 18 Apr 2017 18:22:16 -0000

Fix build with security flags

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Add-format-attribute-to-_synctex_malloc.patch | 27 +++++++++++++++
 .../evince/evince/0002-fix-gcc6-errors.patch       | 39 ----------------------
 .../evince/{evince_3.18.2.bb => evince_3.24.0.bb}  | 29 +++++++++++-----
 3 files changed, 48 insertions(+), 47 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch
 rename meta-gnome/recipes-gnome/evince/{evince_3.18.2.bb => evince_3.24.0.bb} (60%)

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch b/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
new file mode 100644
index 000000000..de739c5b3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
@@ -0,0 +1,27 @@
+From 3776fd0b42e473fe51d3678bf26cdaa37e1d8e0d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 8 Apr 2017 13:36:12 -0700
+Subject: [PATCH] Add format attribute to _synctex_malloc
+
+Helps in avoiding compile errors about formating with clang
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cut-n-paste/synctex/synctex_parser_utils.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/cut-n-paste/synctex/synctex_parser_utils.c b/cut-n-paste/synctex/synctex_parser_utils.c
+index f8a9f6f..9459b2d 100644
+--- a/cut-n-paste/synctex/synctex_parser_utils.c
++++ b/cut-n-paste/synctex/synctex_parser_utils.c
+@@ -78,6 +78,7 @@ void *_synctex_malloc(size_t size) {
+ 	return (void *)ptr;
+ }
+ 
++__attribute__((__format__ (__printf__, 1, 0)))
+ int _synctex_error(const char * reason,...) {
+ 	va_list arg;
+ 	int result;
+-- 
+2.12.2
+
diff --git a/meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch b/meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch
deleted file mode 100644
index b8e30f7d9..000000000
--- a/meta-gnome/recipes-gnome/evince/evince/0002-fix-gcc6-errors.patch
+++ /dev/null
@@ -1,39 +0,0 @@
---- evince-3.18.2/backend/comics/comics-document.c.orig	2016-06-22 20:08:01.789805750 +0000
-+++ evince-3.18.2/backend/comics/comics-document.c	2016-06-22 20:07:00.817804688 +0000
-@@ -241,6 +241,8 @@
- /* This function shows how to use the choosen command for decompressing a
-  * comic book file. It modifies fields of the ComicsDocument struct with 
-  * this information */
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- static gboolean 
- comics_generate_command_lines (ComicsDocument *comics_document, 
- 			       GError         **error)
-@@ -296,6 +298,7 @@
- 	}
- 
- }
-+#pragma GCC diagnostic pop
- 
- /* This function chooses an external command for decompressing a comic 
-  * book based on its mime tipe. */
---- evince-3.18.2/libdocument/ev-document-misc.c.orig	2016-06-22 20:01:49.205799262 +0000
-+++ evince-3.18.2/libdocument/ev-document-misc.c	2016-06-22 20:02:27.233799924 +0000
-@@ -519,7 +519,8 @@
- 
- 	return (dp / di);
- }
--
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-y2k"
- /* Returns a locale specific date and time representation */
- gchar *
- ev_document_misc_format_date (GTime utime)
-@@ -542,6 +543,7 @@
- 
- 	return g_locale_to_utf8 (s, -1, NULL, NULL, NULL);
- }
-+#pragma GCC diagnostic pop
- 
- void
- ev_document_misc_get_pointer_position (GtkWidget *widget,
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
similarity index 60%
rename from meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
index 4e3e0f05c..2b75244fe 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.24.0.bb
@@ -5,16 +5,16 @@ SECTION = "x11/office"
 DEPENDS = "gtk+3 libsecret gnome-desktop3 poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
 PR = "r5"
 
-inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check
+inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "c39af6b8b1c44d4393ef8ac9dab99c0b"
-SRC_URI[archive.sha256sum] = "42ad6c7354d881a9ecab136ea84ff867acb942605bcfac48b6c12e1c2d8ecb17"
-
-SRC_URI += "file://0001-help-remove-YELP-macro.patch \
-            file://0002-fix-gcc6-errors.patch \
-"
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+           file://0001-help-remove-YELP-macro.patch \
+           file://0001-Add-format-attribute-to-_synctex_malloc.patch \
+           "
+SRC_URI[archive.md5sum] = "3fb65ff46de191dc49c481f1fc66201c"
+SRC_URI[archive.sha256sum] = "043895af7bbd6f1b57f9ab8778e78cf9c0af5dfcc347eaa94a17bf864c04dc8f"
 
 EXTRA_OECONF = " --enable-thumbnailer \
 "
@@ -25,22 +25,35 @@ do_compile_prepend() {
 
 
 do_install_append() {
-    install -d install -d ${D}${datadir}/pixmaps
+    install -d ${D}${datadir}/pixmaps
     install -m 0755 ${S}/data/icons/48x48/apps/evince.png ${D}${datadir}/pixmaps/
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
+    then
+        install -d ${D}${systemd_unitdir}/system
+        mv ${D}${libdir}/systemd/user/evince.service ${D}${systemd_unitdir}/system/evince.service
+    else
+        rm -rf ${D}${libdir}/systemd/user/evince.service
+    fi
+    rmdir --ignore-fail-on-non-empty ${D}${libdir}/systemd/user
+    rmdir --ignore-fail-on-non-empty ${D}${libdir}/systemd
 }
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
 PACKAGECONFIG[browser-plugin] = "--enable-browser-plugin,--disable-browser-plugin,"
 
+SYSTEMD_SERVICE_${PN} = "evince.service"
+
 RDEPENDS_${PN} += "glib-2.0-utils"
 RRECOMMMENDS_${PN} = "adwaita-icon-theme"
 
 PACKAGES =+ "${PN}-nautilus-extension"
 PACKAGES =+ "${PN}-browser-plugin"
+
 FILES_${PN} += "${datadir}/dbus-1 \
                 ${datadir}/appdata \
                 ${datadir}/thumbnailers \
+                ${systemd_unitdir}/systemd/user/evince.service \
                "
 FILES_${PN}-dbg += "${libdir}/*/*/.debug \
                     ${libdir}/*/*/*/.debug"
-- 
2.12.2


