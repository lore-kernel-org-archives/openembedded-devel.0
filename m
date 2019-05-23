Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 051837E3FD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id m3so4884111wrv.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Dcsu34FVWn79B/OOJTdyhpDoO+H8amcruKD7u9lYZjA=;
	b=fvnfdO5FHDZ8kWk6pYmFdGcVV9CcypfOvQfwfWY5N6dO7vdu97jO2AHpiwgMGMBujy
	FpPCfg2zzEvvyDhQ5vBOzUywf5LWkozqtkRq1C19AXPoiky4DnjRdw4U6f3fJBB4/NDu
	2HwfVp0F1R//ViATaeRqOEgOuEMixKtV49OkazjYVuWwFTPYircnowoQJIhSXlHUuiCK
	oxWrgu6mCDIKKLwBCobHoGZrkn4mrSvs1wtMTrpDCETYyNq0IxHpd0zQYenqypQjFCn0
	+fr7mQlKJOeZ5EUt8V7i9GD6yioc5n3BWy3wGYz0AN0jrt+DxUWypeQTl+ERvl+Mli9E
	33gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Dcsu34FVWn79B/OOJTdyhpDoO+H8amcruKD7u9lYZjA=;
	b=X93e8a5c9D1kQgMJzHRoZVseZiX7etEjPuzfSOBUZgkWL4/+38AGBEVAXHaWkNotWq
	86ASF7DayokTBlQdUxvhTu29LkDXyN5C2ghE3iSaNkCl2RNvodAdxLxckVI1hnghqkIp
	EjQfv1bJZSzPAxs7pLCHZ/aEJLj3yAY8CeOCyt+37DECFsmDQyANo0igU71rKVWWeTSt
	+TaERv8BMww5NrH/HTiHNat73DxpXu5c75pmcLNZ4UpMBDxHihxH6oJAvd2QIrihL1+R
	ME1EA96eoO1C8HUmnS8tq9J4o78uxK5I+QncIdZ2cdNUJ/v9IyITzr0LTcrThLXUc28X
	AHDg==
X-Gm-Message-State: APjAAAWPI1lhf8mw4bJk2sssNlzp/ZQliDFCeOepMAnO/ShJzs11Og3q
	qmdeuOV4o7J9AAK5Wyn2D42WCRdubuI=
X-Google-Smtp-Source: APXvYqwOu1qc3aUmD520Id2Oe4DhFkcqbshfpABKBY/ELVcG5J9d/cIxT4NwwePjWbCOwLHc9j07eQ==
X-Received: by 2002:adf:df87:: with SMTP id z7mr31691962wrl.8.1558594164584;
	Wed, 22 May 2019 23:49:24 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:37 +0200
Message-Id: <20190523064859.24336-20-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 19/41] evince: upgrade 3.28.2 -> 3.32.0
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
X-List-Received-Date: Thu, 23 May 2019 06:49:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add upstream-version-is-even to inherit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-format-attribute-to-_synctex_malloc.patch | 12 ++--
 .../evince/0001-help-remove-YELP-macro.patch  | 24 --------
 ...vDocumentModel-get-type-function-dec.patch | 33 ----------
 ...02-add-a-formatting-attribute-check.patch} |  0
 .../{evince_3.28.2.bb => evince_3.32.0.bb}    | 60 ++++++++-----------
 5 files changed, 30 insertions(+), 99 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
 rename meta-gnome/recipes-gnome/evince/evince/{0001-add-a-formatting-attribute-check.patch => 0002-add-a-formatting-attribute-check.patch} (100%)
 rename meta-gnome/recipes-gnome/evince/{evince_3.28.2.bb => evince_3.32.0.bb} (32%)

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch b/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
index de739c5b3..32ca073f9 100644
--- a/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
+++ b/meta-gnome/recipes-gnome/evince/evince/0001-Add-format-attribute-to-_synctex_malloc.patch
@@ -11,17 +11,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/cut-n-paste/synctex/synctex_parser_utils.c b/cut-n-paste/synctex/synctex_parser_utils.c
-index f8a9f6f..9459b2d 100644
+index 08053f0..0519b38 100644
 --- a/cut-n-paste/synctex/synctex_parser_utils.c
 +++ b/cut-n-paste/synctex/synctex_parser_utils.c
-@@ -78,6 +78,7 @@ void *_synctex_malloc(size_t size) {
- 	return (void *)ptr;
+@@ -136,6 +136,7 @@ int _synctex_log(int level, const char * prompt, const char * reason,va_list arg
+ 	return result;
  }
  
 +__attribute__((__format__ (__printf__, 1, 0)))
  int _synctex_error(const char * reason,...) {
- 	va_list arg;
- 	int result;
+     va_list arg;
+     int result;
 -- 
-2.12.2
+2.20.1
 
diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch b/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
deleted file mode 100644
index 592f46606..000000000
--- a/meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 40921037d8e7205a3889d529fb4e06f79e1e88b0 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 19 Feb 2016 16:52:18 +0200
-Subject: [PATCH] help: remove YELP macro
-
-Upstream-Status: Inappropriate [embedded-specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- help/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/help/Makefile.am b/help/Makefile.am
-index 7835810..37c88ce 100644
---- a/help/Makefile.am
-+++ b/help/Makefile.am
-@@ -1,5 +1,3 @@
--@YELP_HELP_RULES@
--
- SUBDIRS = reference
- 
- HELP_ID = evince
--- 
-2.7.0
-
diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch b/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
deleted file mode 100644
index dcc4a4e9c..000000000
--- a/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0cdce687d3edfa5ac0fd19539ba1815d039026d5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?I=C3=B1igo=20Mart=C3=ADnez?= <inigomartinez@gmail.com>
-Date: Fri, 7 Sep 2018 22:34:29 +0200
-Subject: [PATCH] libview: Remove EvDocumentModel get type function declaration
-
-The EvDocumentModel class declares the `ev_document_model_get_type`
-function as part of the `GObject` boilerplate code.
-
-However, this declaration is not necessary and also causes a warning
-when introspection data file, `EvinceView-3.0.gir`, is generated.
-
-Upstream-Status: Applied [1]
-
-
----
- libview/ev-document-model.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/libview/ev-document-model.h b/libview/ev-document-model.h
-index 784e27d6..6a99e43a 100644
---- a/libview/ev-document-model.h
-+++ b/libview/ev-document-model.h
-@@ -54,7 +54,6 @@ typedef enum {
- 	EV_PAGE_LAYOUT_AUTOMATIC
- } EvPageLayout;
- 
--GType            ev_document_model_get_type          (void) G_GNUC_CONST;
- EvDocumentModel *ev_document_model_new               (void);
- EvDocumentModel *ev_document_model_new_with_document (EvDocument      *document);
- 
--- 
-2.20.1
-
diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-add-a-formatting-attribute-check.patch b/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
similarity index 100%
rename from meta-gnome/recipes-gnome/evince/evince/0001-add-a-formatting-attribute-check.patch
rename to meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.32.0.bb
similarity index 32%
rename from meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
rename to meta-gnome/recipes-gnome/evince/evince_3.32.0.bb
index d2885906f..e4d0d69be 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.32.0.bb
@@ -2,48 +2,43 @@ SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
 SECTION = "x11/office"
-DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
+DEPENDS = " \
+    gnome-common-native \
+    itstool-native \
+    yelp-tools-native \
+    appstream-glib \
+    gtk+3 \
+    gspell \
+    libsecret \
+    poppler \
+    gstreamer1.0-plugins-base \
+    orc \
+    adwaita-icon-theme \
+    ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} \
+"
 
-inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
+inherit gnomebase gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext distro_features_check
 
-SRC_URI = " \
-    ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-    file://0001-help-remove-YELP-macro.patch \
+SRC_URI[archive.md5sum] = "b7402d14e12ea09da1490f2e624eb6de"
+SRC_URI[archive.sha256sum] = "f0d977216466ed2f5a6de64476ef7113dc7c7c9832336f1ff07f3c03c5324c40"
+SRC_URI += " \
     file://0001-Add-format-attribute-to-_synctex_malloc.patch \
-    file://0001-add-a-formatting-attribute-check.patch \
-    file://0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch \
+    file://0002-add-a-formatting-attribute-check.patch \
 "
-SRC_URI[archive.md5sum] = "66aa1766eaaa37536e48def11a0e67a3"
-SRC_URI[archive.sha256sum] = "0955d22d85c9f6d322b6cbb464f1cc4c352db619017ec95dad4cc5c3440f73e1"
 
-EXTRA_OECONF = "--enable-thumbnailer"
+EXTRA_OECONF = " \
+    --enable-thumbnailer \
+    --without-systemduserunitdir \
+"
 
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/libdocument/.libs"
 }
 
-
-do_install_append() {
-    install -d ${D}${datadir}/pixmaps
-    install -m 0755 ${S}/data/icons/48x48/apps/evince.png ${D}${datadir}/pixmaps/
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}
-    then
-        install -d ${D}${systemd_unitdir}/system
-        mv ${D}${systemd_user_unitdir}/evince.service ${D}${systemd_system_unitdir}/evince.service
-    else
-        rm -rf ${D}${libdir}/systemd/user/evince.service
-    fi
-    rmdir --ignore-fail-on-non-empty ${D}${systemd_user_unitdir}
-    rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd
-    rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}
-}
-
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
 PACKAGECONFIG[browser-plugin] = "--enable-browser-plugin,--disable-browser-plugin,"
 
-SYSTEMD_SERVICE_${PN} = "evince.service"
-
 RDEPENDS_${PN} += "glib-2.0-utils"
 RRECOMMMENDS_${PN} = "adwaita-icon-theme"
 
@@ -53,13 +48,6 @@ PACKAGES =+ "${PN}-browser-plugin"
 FILES_${PN} += "${datadir}/dbus-1 \
                 ${datadir}/metainfo \
                 ${datadir}/thumbnailers \
-                ${systemd_unitdir}/systemd/user/evince.service \
-               "
-FILES_${PN}-dbg += "${libdir}/*/*/.debug \
-                    ${libdir}/*/*/*/.debug"
-FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la \
-                    ${libdir}/evince/*/backends/*.la"
-FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
-                          ${libdir}/evince/*/backends/*.a"
+"
 FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
 FILES_${PN}-browser-plugin = "${libdir}/mozilla/*/*so"
-- 
2.20.1


