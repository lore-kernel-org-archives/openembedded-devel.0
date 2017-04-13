Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id DC40977E78
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 20:41:39 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id s16so33295941pfs.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Apr 2017 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KaPqMLo0HDMB9SInYFHj+M4MDAHC7qq0pvjkIOSWtVQ=;
	b=bNAZ3QNftHJ03R5nO/s3GfRFXBMQF6AJXotH6CDU2WubFuRmogbfavyQalwBSB6/SJ
	4g/0jCHzw9kMNphrOcSHWWLSl4pn5VDet0uhQV+EcjJHgzuoueIVzoMDSlKDevJMfst1
	ZtX4Lwhq4qfzss+lOpx4pC79u3ju3DDE7kRu+Yojz3296X5GKkX5vXhNvvUqLjeCi81u
	x60m4QS0cr/N22C7n0SrNUYNWltsAAjV5FPU3QUMWEGsMyr3Sgqdlav9o+JxFLWam2UD
	+WtU0JFWYadve6wi7OH/RYVsGvZqug59Q7Heiq9KrcQMw6AiiWyZS9E5lChAReXjjYc7
	qVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KaPqMLo0HDMB9SInYFHj+M4MDAHC7qq0pvjkIOSWtVQ=;
	b=jjd3S9t50abyCasB02+UgLI4braRhf34gSFVy+lY4/2uY70sqUKmukLFAAYixCWZoB
	uWxKUJgvsdl9BaWDS63BV5fRLQxdSg58Gdkl8/DC9pZXakKvjDFKweFMv+8Fo7IYurrq
	kw+d+mRQfyhT6gbu683Y9VF34x3pMPNZXX2thU57JetcDBEiXtYjPihnKG72jM8naxVF
	jHlhpW8pXE6HpmqcC1KSk8bYEfnRKl+1vl3sDT747UibRqPSCGni7ibrnGjewUhWG2y6
	1qZoroP+Q2ne1JDHaMGFHXytQf16K4WjmrHAawL8qs31FBUEJBlxKUdPxG/qcnR8oOeC
	5bWA==
X-Gm-Message-State: AN3rC/656kzr8txeM7UvSBQYtP1Gyt4VeAtHOM7tZ1pHUEWpcH9ZZZkr
	F3YzZyzrvehvGhqn
X-Received: by 10.84.160.226 with SMTP id v31mr5387006plg.122.1492116100330;
	Thu, 13 Apr 2017 13:41:40 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	u29sm44033332pfa.123.2017.04.13.13.41.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Apr 2017 13:41:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Apr 2017 13:40:52 -0700
Message-Id: <20170413204106.30679-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170413204106.30679-1-raj.khem@gmail.com>
References: <20170413204106.30679-1-raj.khem@gmail.com>
Subject: [meta-gnome][ 15/29] evince: Upgrade to 3.24.0
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
X-List-Received-Date: Thu, 13 Apr 2017 20:41:40 -0000

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


