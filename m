Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id BA15B6D494
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 May 2019 23:28:37 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id n25so745609wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 May 2019 16:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Omo6xILk6bMu4XHowBgxtt+LFEj50229dhnx4WaVfPc=;
	b=B7LFYV/RIOUR24/6nnv61KVSPB6SUx9OZecndrWWflOxA5LJNtu+WRQJB5rB0yimL7
	8MnuD5HtsJmesoZbADyjkTOx2F8cH6jQbdHc3808JRUSpqjj/3rkYjYdQ8leB9yfUq/d
	IgWPSWc231touiCl2WpbsY7ND0gDq+FcqPqDMnajHKRflm5YMKT/qa8nd/FbJnOvV7nU
	qqh2nltoijBCkina+OSOez+LwX+oAy2xRhBl6zWlKi+2PcBGG7LILU0sbsGAtVWirF6V
	zw8FDX6TySFzjIPLA8LeKII1qBJob1U9wezVYOpTBKzbrUVuq/wkNpqYPxXwWMNWrSW5
	kAaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Omo6xILk6bMu4XHowBgxtt+LFEj50229dhnx4WaVfPc=;
	b=kImx+kSvqgJ8NbwmK3PTISoWIzu1yA48jtr1brPbqprD/hqdTNOlxbaTy0nrWCOJJK
	zp6uxHgFJvenUYKddWCUaTwdCFGAyEoOCP7uIEm3pCDRIf9I3w/xsYXxqGPeJ9fkApg0
	Jd1xO80ggfHSLkv78ZjTYh9QQ/AA0iM/KgjRxiaZU/PUrY5mC6xw0SZF3eOL18AJQihs
	p6c+Ua2e+yJga80e8oagaxbBfxBEBdD6/1jK3oNmottCAS7IUgWKEig11PezjOCcEXZR
	LDv5ahfvDs8hQ1ZwjRnrE9rE2qic5XLkuqYm2hty1wKilWih9CfCVg/KhT+5ZuBxc99x
	O0QA==
X-Gm-Message-State: APjAAAUXmVkP1CZH927bf1bMVJqfJM0JwxJSGdUuj19H/R/OuIB4TAzx
	KzH/q/ebJgDuI+zwQowl35jQoz1CYwE=
X-Google-Smtp-Source: APXvYqzNXIH25pJ3+HPlNEqUkNj9WQfO2cSrkYMKHJkE7J2Zyl9BbsCC8vWDq4YPa5MVqKla4c1O7A==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr14926010wmh.0.1557098917979;
	Sun, 05 May 2019 16:28:37 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F04849985EFC643178755BA.dip0.t-ipconnect.de.
	[2003:f0:7f04:8499:85ef:c643:1787:55ba])
	by smtp.gmail.com with ESMTPSA id
	l5sm16311473wrb.51.2019.05.05.16.28.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 05 May 2019 16:28:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 01:28:26 +0200
Message-Id: <20190505232826.25538-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] evince: add patch to fix build with recent gobject-introspection
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
X-List-Received-Date: Sun, 05 May 2019 23:28:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gobject-introspection torned some warnings to errors. That caused:

| ../../evince-3.28.2/libview/ev-document-model.h:57: Fatal: EvinceView: Namespace conflict for 'document_model_get_type'

Have tried to fix evince by update to 3.28.5 and 3.32.0 but that causes nasty
gettext errors which I was not able to fix yet.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...vDocumentModel-get-type-function-dec.patch | 33 +++++++++++++++++++
 .../recipes-gnome/evince/evince_3.28.2.bb     | 12 ++++---
 2 files changed, 40 insertions(+), 5 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch

diff --git a/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch b/meta-gnome/recipes-gnome/evince/evince/0001-libview-Remove-EvDocumentModel-get-type-function-dec.patch
new file mode 100644
index 000000000..dcc4a4e9c
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
index 01f581a35..d2885906f 100644
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
2.20.1


