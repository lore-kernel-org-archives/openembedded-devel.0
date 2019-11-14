Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id EC8E87F9C6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t1so8036693wrv.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=bCsXvhOB6CndnSqxMI8IWFBY5SDuyG903Ght9wTDxAg=;
	b=ofu1z64VJEhcqyL0WRbCuZq4SyoCRanxZpCfSSnnRcLH3cBnvTkhN6slfbmlA7anju
	YSCDJ8E3u3Dwwayi3U2+RnD0n6XbQlzV7plRORKdgXH663GJJ9Y/0HESyQQvZu72Tagx
	d+G3VRMqv/D7xoVogYwr5KWAahU8UMA8SXGfcueqAzCNPG2IrSwTPUvMXjPBDsjmpC9K
	wObav5CFnIxptUwaYbe3DEbAkMjHY+jwOYatZYgJfpBNU7A7FbgjoQ8H3RSPl5cSh/hf
	gBf1P2egsebkQTtpiMmJawbXP6v8mq4SMp8oQsQsT14L7fc2pVORBjBbi4g13w8aIjUK
	S4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bCsXvhOB6CndnSqxMI8IWFBY5SDuyG903Ght9wTDxAg=;
	b=HBRcnOcJNBPUN5X7uzdIsH9SQCfumnkP0BFij27Ks66JEnZ16ElxEyCOFkJ256r00S
	0K6xlCQeHHHVX+K7C/oogYdczCAm4ZJB2qcv6jXVpL7xBdkfbLlGASsKI3+5XI8iW1kr
	sfnY72/oVKL/suWM4H/JSlQcXRn0MjnwBDa+P/Wr+q7BpQKt84emQ39bOnRelYCEh/CF
	zzdd47ANmSC+MCir8cRqn8sz5QrXiCNuWRFzW5JwkERiA7k6NFN84BKXoMRMhqIYd/li
	UpbgIIjmi4uCxmFOAayAJa8HOvPMVyhVS/Ewv3j+CXrV5ttq46DWfnskkky9GpJVpQu/
	oHpg==
X-Gm-Message-State: APjAAAUwF1FZWzyGce75bxtl3nSRakz+nBvGi1qq3hu5eRRWZDCnReRT
	+y6nyfLpqPH/LKJoGSaR8fqfB5oB
X-Google-Smtp-Source: APXvYqxCm6ShnnNhAAxBhXuFS07t/xyN+XLvo273tmNUjWgVBzJyfGGYalAj4U4sLrz/UYdaUce02g==
X-Received: by 2002:adf:b746:: with SMTP id n6mr9997656wre.65.1573760985996;
	Thu, 14 Nov 2019 11:49:45 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:21 +0100
Message-Id: <20191114194930.2786-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/16] evince: upgrade 3.28.2 -> 3.34.1
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* remove unnecessary or upstreamed patches
* add upstream-version-is-even to inherit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-format-attribute-to-_synctex_malloc.patch | 12 ++--
 .../evince/0001-help-remove-YELP-macro.patch  | 24 -------
 ...vDocumentModel-get-type-function-dec.patch | 33 ----------
 ...02-add-a-formatting-attribute-check.patch} |  0
 .../recipes-gnome/evince/evince_3.28.2.bb     | 65 -------------------
 .../recipes-gnome/evince/evince_3.34.1.bb     | 52 +++++++++++++++
 6 files changed, 58 insertions(+), 128 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-help-remove-YELP-macro.patch
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
 rename meta-gnome/recipes-gnome/evince/evince/{0001-add-a-formatting-attribute-check.patch => 0002-add-a-formatting-attribute-check.patch} (100%)
 delete mode 100644 meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
 create mode 100644 meta-gnome/recipes-gnome/evince/evince_3.34.1.bb

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
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
deleted file mode 100644
index f45180e79..000000000
--- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
+++ /dev/null
@@ -1,65 +0,0 @@
-SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
-SECTION = "x11/office"
-DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-desktop3','',d)} poppler gstreamer1.0-plugins-base orc adwaita-icon-theme intltool-native gnome-common-native"
-
-inherit gnomebase pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
-
-SRC_URI = " \
-    ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-    file://0001-help-remove-YELP-macro.patch \
-    file://0001-Add-format-attribute-to-_synctex_malloc.patch \
-    file://0001-add-a-formatting-attribute-check.patch \
-    file://0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch \
-"
-SRC_URI[archive.md5sum] = "66aa1766eaaa37536e48def11a0e67a3"
-SRC_URI[archive.sha256sum] = "0955d22d85c9f6d322b6cbb464f1cc4c352db619017ec95dad4cc5c3440f73e1"
-
-EXTRA_OECONF = "--enable-thumbnailer"
-
-do_compile_prepend() {
-    export GIR_EXTRA_LIBS_PATH="${B}/libdocument/.libs"
-}
-
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
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
-PACKAGECONFIG[browser-plugin] = "--enable-browser-plugin,--disable-browser-plugin,"
-
-SYSTEMD_SERVICE_${PN} = "evince.service"
-
-RDEPENDS_${PN} += "glib-2.0-utils"
-RRECOMMMENDS_${PN} = "adwaita-icon-theme"
-
-PACKAGES =+ "${PN}-nautilus-extension"
-PACKAGES =+ "${PN}-browser-plugin"
-
-FILES_${PN} += "${datadir}/dbus-1 \
-                ${datadir}/metainfo \
-                ${datadir}/thumbnailers \
-                ${systemd_unitdir}/systemd/user/evince.service \
-               "
-FILES_${PN}-dbg += "${libdir}/*/*/.debug \
-                    ${libdir}/*/*/*/.debug"
-FILES_${PN}-dev += "${libdir}/nautilus/extensions-2.0/*.la \
-                    ${libdir}/evince/*/backends/*.la"
-FILES_${PN}-staticdev += "${libdir}/nautilus/extensions-2.0/*.a \
-                          ${libdir}/evince/*/backends/*.a"
-FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
-FILES_${PN}-browser-plugin = "${libdir}/mozilla/*/*so"
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.34.1.bb b/meta-gnome/recipes-gnome/evince/evince_3.34.1.bb
new file mode 100644
index 000000000..6f0392d27
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince_3.34.1.bb
@@ -0,0 +1,52 @@
+SUMMARY = "Evince is a document viewer for document formats like pdf, ps, djvu"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=96f2f8d5ee576a2163977938ea36fa7b"
+SECTION = "x11/office"
+DEPENDS = " \
+    gnome-common-native \
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
+
+inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection upstream-version-is-even gettext distro_features_check
+
+SRC_URI[archive.md5sum] = "77b38b625008f5940e9bd4b3d38e8cf8"
+SRC_URI[archive.sha256sum] = "85e407cde396147b249120d816c7715fb6df191ca561cf65ff3554a5d67626df"
+SRC_URI += " \
+    file://0001-Add-format-attribute-to-_synctex_malloc.patch \
+    file://0002-add-a-formatting-attribute-check.patch \
+"
+
+EXTRA_OECONF = " \
+    --enable-thumbnailer \
+    --without-systemduserunitdir \
+"
+
+do_compile_prepend() {
+    export GIR_EXTRA_LIBS_PATH="${B}/libdocument/.libs"
+}
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[nautilus] = "--enable-nautilus,--disable-nautilus,nautilus"
+PACKAGECONFIG[browser-plugin] = "--enable-browser-plugin,--disable-browser-plugin,"
+
+RDEPENDS_${PN} += "glib-2.0-utils"
+RRECOMMMENDS_${PN} = "adwaita-icon-theme"
+
+PACKAGES =+ "${PN}-nautilus-extension"
+PACKAGES =+ "${PN}-browser-plugin"
+
+FILES_${PN} += "${datadir}/dbus-1 \
+                ${datadir}/metainfo \
+                ${datadir}/thumbnailers \
+"
+FILES_${PN}-nautilus-extension = "${libdir}/nautilus/*/*so"
+FILES_${PN}-browser-plugin = "${libdir}/mozilla/*/*so"
-- 
2.21.0


