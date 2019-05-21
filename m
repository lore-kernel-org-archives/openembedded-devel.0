Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
	[209.85.210.175])
	by mail.openembedded.org (Postfix) with ESMTP id A37E17E069
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:51 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id g9so8292450pfo.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=ydU6bUXp0vN1WxXJ8vqC4YaqaL3euJIh56R+eqhuuUA=;
	b=HsqjQpV1V8a1Gdw9Jxb4lS0JXvI1BrTTtXP7zmVyeNXfDCJgNo3Ljv8p0CzTVtqLLx
	VtxE3M2rkifNSkWJlA8/UnMys4jIqalcpRm7wmmWBjI6cGApq++B0LBh/Tiyi6jBhhjI
	ps+6utUO9PSEJFoQ5q4UxGgELiTKdmMAkV+/tEGheTImSm5He4TgAUPpCXuUzkDOYMMg
	1f+/gibo+99f6X4gbOHjJwWLPARrQlaMi0mQv3xGmTC9BS10oI1rjvoPSVjqUygetOOX
	QIHm1qfE31oFJpe0TG1ZVTwo2ZgYP7gSFfPjiNigXkq0AvMho/wvsb3jaCJTR9hcmrB3
	aUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ydU6bUXp0vN1WxXJ8vqC4YaqaL3euJIh56R+eqhuuUA=;
	b=D4SP1FWqtO4RtnA9hWSpIab+zWh2Q5dS2aAEMzoVNs35VyclJGbnAfyv9ak0c5C7jR
	XZsMjJlKaB8gd2YWc3NJ3Wopj0XsgthjEmWesx8ytU8pf5uoW2GN8fJZ45jVZ2z8HPXH
	m9zNaG4VSDOPzhEVYxF6Sa5+iVOpRh8BtDpPibICAAMEQmHlpVIahbeFqkPbeps7UTuu
	z7A0i4bqg1DijY/aarVERrRova5f+8XHitsBu5R3NTkK5ZyhRlBNpphb6Rc3N7KAU003
	gFFNGVNzwr9k5eEQlHqDGJGFMoFRNHyMZjVrQnbKW7232A7F8BHqyVeWnsaM1r8XHJsO
	Z77Q==
X-Gm-Message-State: APjAAAXw/MkObnQ2rm3uOVrSHh5ZYAaTphPEs+e2H1QKjofhhMv7mSSa
	aj61o41cbCZxdHBlETMcj4eaUcv8
X-Google-Smtp-Source: APXvYqzlp8ik2SRdxg3xEsGB+VepXSgNos7s8lCWMk31AMQxk8qdWotD6/u8Y/tCWt+oKS6lT7HHQg==
X-Received: by 2002:a62:f247:: with SMTP id y7mr83564629pfl.18.1558411012551; 
	Mon, 20 May 2019 20:56:52 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:52 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:17 -0700
Message-Id: <8af1b3526defb5b604a7edb096d594e81cd2a72a.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior][patch 17/34] evince: add patch to fix build with recent gobject-introspection
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
X-List-Received-Date: Tue, 21 May 2019 03:56:51 -0000
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


