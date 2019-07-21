Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id C7ED57ED5C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:41:42 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id f20so7196328pgj.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ydU6bUXp0vN1WxXJ8vqC4YaqaL3euJIh56R+eqhuuUA=;
	b=u/pNXG1Wiry0IUue8lesnDVZjE2Kxx73Ab7IWHC7wUf6h3yKv9ky4hqu7UW1520TQV
	yIbBVJXzmZdz4+98Xf6Su9e6zNWNVOc3rW0fzjno7VEh2hlXfFlQSrE6IakbsRbmDXiD
	yb94VwZWOE3OMZc+Pb5Wr9QRIwMbQVDbrrcE0Az3Myk89ivcJqaY5P86ysEhGe+Z917n
	pSX46i/CFDcdNsw99iDZLN2mdnZIawWDbwPwPqF6m7zwEjAfP5MdfiwitcgNEWpAnq29
	Kj2cVs16eQC4JQpIGhjP6lLrEjD4WlEnNTpA9gpeNyMMWtsDqn9YzFrOSBJdteboTRWZ
	M1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ydU6bUXp0vN1WxXJ8vqC4YaqaL3euJIh56R+eqhuuUA=;
	b=Pl7DH2qBWoGRKSqtnIqmODF7mUdTYRtpLTTljJqD/wjFbHjtflKVxvS6U/2bZBEuWG
	x5UeZl+fbmlNGjpDbX5xz/MFfLmZUgZG+XNBmmjUWBA/epu52Sb2Ih4EPdDSqDVORLD6
	FpDNUWh2oaQdRxmLFmvSVbwgQglTFtUCHMXL/v55voJSX7P98ZSpg+c1lZgEfw6BHwIJ
	iYHtl4HXCnzKabtkUqY5M6Yng/7QXoN11jMl6tpA3Vpdi1gXZpkaHuSZnBzL8vlYFTCD
	u4TG5bbGKWspdsjfM9V0ekfELXmrslsTfeXoEDM+Zn+IED1TNFwNAfKJ5Yek8gJ/H+KM
	VHRQ==
X-Gm-Message-State: APjAAAVmZY2ze9wRQX1EiWXqNTHdMQE6Y+O09ffmF/WG93Hk8693blip
	V40NRQEbE46LT09RQFJh0vjGftiz
X-Google-Smtp-Source: APXvYqz89BQOpybDtsC6TS7Hf7in7QCa/6wqafv0CGem3Nu4iwDyNXQk7VyLZXaIphj8CLNdC4F1Tw==
X-Received: by 2002:a17:90a:d151:: with SMTP id
	t17mr70930567pjw.60.1563720103724; 
	Sun, 21 Jul 2019 07:41:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	t9sm37392604pji.18.2019.07.21.07.41.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:41:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:41:30 -0700
Message-Id: <26e6bf0f26815b06e4335c6a3bd34f52754faec5.1563719997.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719996.git.akuster808@gmail.com>
References: <cover.1563719996.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior] 2/8] evince: add patch to fix build with recent gobject-introspection
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
X-List-Received-Date: Sun, 21 Jul 2019 14:41:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

gobject-introspection torned some warnings to errors. That caused:

| ../../evince-3.28.2/libview/ev-document-model.h:57: Fatal: EvinceView: Namespace conflict for 'document_model_get_type'

Have tried to fix evince by update to 3.28.5 and 3.32.0 but that causes nasty
gettext errors which I was not able to fix yet.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ove-EvDocumentModel-get-type-function-dec.patch | 33 ++++++++++++++++++++++
 meta-gnome/recipes-gnome/evince/evince_3.28.2.bb   | 12 ++++----
 2 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch b/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
new file mode 100644
index 0000000..dcc4a4e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
@@ -0,0 +1,33 @@
+From 0cdce687d3edfa5ac0fd19539ba1815d039026d5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?I=C3=B1igo=20Mart=C3=ADnez?= <inigomartinez@gmail.com>
+Date: Fri, 7 Sep 2018 22:34:29 +0200
+Subject: [PATCH] libview: Remove EvDocumentModel get type function declaration
+
+The EvDocumentModel class declares the `ev_document_model_get_type`
+function as part of the `GObject` boilerplate code.
+
+However, this declaration is not necessary and also causes a warning
+when introspection data file, `EvinceView-3.0.gir`, is generated.
+
+Upstream-Status: Applied [1]
+
+
+---
+ libview/ev-document-model.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libview/ev-document-model.h b/libview/ev-document-model.h
+index 784e27d6..6a99e43a 100644
+--- a/libview/ev-document-model.h
++++ b/libview/ev-document-model.h
+@@ -54,7 +54,6 @@ typedef enum {
+ 	EV_PAGE_LAYOUT_AUTOMATIC
+ } EvPageLayout;
+ 
+-GType            ev_document_model_get_type          (void) G_GNUC_CONST;
+ EvDocumentModel *ev_document_model_new               (void);
+ EvDocumentModel *ev_document_model_new_with_document (EvDocument      *document);
+ 
+-- 
+2.20.1
+
diff --git a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
index 01f581a..d288590 100644
--- a/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_3.28.2.bb
@@ -6,11 +6,13 @@ DEPENDS = "gtk+3 libsecret ${@bb.utils.contains('DISTRO_FEATURES','x11','gnome-d
 
 inherit gnome pkgconfig gtk-icon-cache gsettings gobject-introspection distro_features_check systemd
 
-SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
-           file://0001-help-remove-YELP-macro.patch \
-           file://0001-Add-format-attribute-to-_synctex_malloc.patch \
-           file://0001-add-a-formatting-attribute-check.patch \
-           "
+SRC_URI = " \
+    ${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+    file://0001-help-remove-YELP-macro.patch \
+    file://0001-Add-format-attribute-to-_synctex_malloc.patch \
+    file://0001-add-a-formatting-attribute-check.patch \
+    file://0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch \
+"
 SRC_URI[archive.md5sum] = "66aa1766eaaa37536e48def11a0e67a3"
 SRC_URI[archive.sha256sum] = "0955d22d85c9f6d322b6cbb464f1cc4c352db619017ec95dad4cc5c3440f73e1"
 
-- 
2.7.4


