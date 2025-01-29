Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152F6C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 09:00:35 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.8649.1738141232708092076
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 01:00:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=KxMla+IW;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.45, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436249df846so43879835e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 01:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738141231; x=1738746031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7SFuhL1ZTkCfyL/izCziRZgD2ZEmgkYXnb0q4u1OqkU=;
        b=KxMla+IWWp/ueUou34mE7oWq4gRSLUNQP75yz4RqVR1d2j2YUmKMD4SABupH/vjejH
         NSSiM9a9OFXO0WUIJNn1dkAr1HGnnGDmSIDEOMtFlbb/jXWfRrDEyiqFiZ6mgONTup4V
         Pw/pvRW1ur4Lan5NhYSw+F5tYmyBVZ/7p3kIcG2zYwiSdoRSLhziBT79ZCCqv9ssrqv1
         sEIvSa4y8JrcAgAUWN4jAeKrNheMPbDrjPadNUQKLfTydsk9EI/eyhrzcdEFebZK/C5r
         tGkZ4qqNt5FWRIctR5e1/wM4sC13ZmGJq9pgboq7yTu6yocXIc26KZa/eNZZTuC/3AsU
         2HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738141231; x=1738746031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SFuhL1ZTkCfyL/izCziRZgD2ZEmgkYXnb0q4u1OqkU=;
        b=a5PTWy2hQEJ9sdXVGiDnPePqDamWIGU6xvgJXyF2Bnmv11K+kozrnvQ7jMipMWuW6/
         HVrQYIpiqxYMqBR/3mAnmcHAEW2N/W57kXIrfOfkP+BGLABzQu6n8DApXxSASf0r8KdG
         7YLKl398mKJa4XWyDAcL3VAq8+Vy1wUUV/sFvB+p6Y0bD3ABWWRhFzic4TVZSgUsjXCU
         IirIqyQeYdwQLcOSNM/InZp1TrLOn6d25VhteqGu28WqNSsDcr35cvyKBZJ4xI3UpJVr
         wqs6xYxaibcFzqot8srd4CvWHcmpBLN9qjOtjjVOuDWQRllABHq8w87RnONPb3HIsU3Z
         6lXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBrRnL54/pNtvFiZsO2hUt2rzW1kRsiNfb5r7/Z3vcjP2UdefwFRPduiJM4nXD5MdeG2L5oXkB1GNb/Kfy6JBldOc=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyk0AzhTgl1GyxwpOABTc+25Du81Y0K9Rz9tbLDgw45llfefj8h
	oS1NipO8OQN6LnFE2zV+WnJD1cOCFdM1yqIfcaa0vigX205kIX1IV28pQlgylOI=
X-Gm-Gg: ASbGnctJ6YQaSxTmnoVA1CaWUtLPVQNXPE3Hj9ZmciHPlnixW/XUyLZM6miaqNdxYZn
	tVdOsdLhmn2JFsaFQ19hVHlOHi0taLj66eNbA4Nzdd1HDt5VC/zBWI5qtJvfHoQZfofSIm1+L/s
	gHcPAnDtwAsyLfi75AmFIycZNK3bb/olG4tf5VSUTuuP7EFN0tLP/rI9OlqICR4ghU4WWl8Os+B
	jAEtz+D/swZ9IUmM5f+9ama76AYhbDP8zxLGp6k+extXudT14d7LVc7J8sFdhsCpCKYImfsxLzw
	V1l/FojCCAZWGlc=
X-Google-Smtp-Source: AGHT+IFWiRacTTZi7UwsrZFkuxoSi9qS16STXBeYCflu927zWUHs00kOEX2XVkDbVhnoVpkYdd61tw==
X-Received: by 2002:a05:600c:348e:b0:434:a734:d268 with SMTP id 5b1f17b1804b1-438dc3cbb7cmr18560715e9.14.1738141230894;
        Wed, 29 Jan 2025 01:00:30 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9645:4655:5d18:825b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc12f88sm15036695e9.2.2025.01.29.01.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 01:00:30 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-gnome][PATCH v2] cheese: new recipe
Date: Wed, 29 Jan 2025 10:00:27 +0100
Message-ID: <20250129090027.9563-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 09:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115129

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for cheese - a Gnome application for taking photos and
videos with webcams.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- use ${datadir} instead of hardcoding /usr/share

 ...kWidget-cast-to-avoid-an-incompatibl.patch | 29 +++++++++++++++++++
 .../recipes-gnome/cheese/cheese_44.1.bb       | 26 +++++++++++++++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/cheese/cheese/0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch
 create mode 100644 meta-gnome/recipes-gnome/cheese/cheese_44.1.bb

diff --git a/meta-gnome/recipes-gnome/cheese/cheese/0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch b/meta-gnome/recipes-gnome/cheese/cheese/0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch
new file mode 100644
index 0000000000..8d2d413149
--- /dev/null
+++ b/meta-gnome/recipes-gnome/cheese/cheese/0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch
@@ -0,0 +1,29 @@
+From d8b8f27730cca948a5e5346b8ed2db0793bb16e7 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 19 Jan 2024 21:31:33 +0100
+Subject: [PATCH] libcheese: Add GtkWidget cast to avoid an
+ incompatible-pointer-types error
+
+This is required for compilation with GCC 14.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/cheese/-/merge_requests/70]
+---
+ libcheese/cheese-flash.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libcheese/cheese-flash.c b/libcheese/cheese-flash.c
+index 59959dbd..e4023221 100644
+--- a/libcheese/cheese-flash.c
++++ b/libcheese/cheese-flash.c
+@@ -132,7 +132,7 @@ cheese_flash_set_property (GObject      *object,
+       GObject *parent;
+       parent = g_value_get_object (value);
+       if (object != NULL)
+-        priv->parent = g_object_ref (parent);
++        priv->parent = GTK_WIDGET (g_object_ref (parent));
+       else
+         priv->parent = NULL;
+     }
+-- 
+2.45.2
+
diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
new file mode 100644
index 0000000000..180f3f6319
--- /dev/null
+++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Take photos and videos with your webcam, with fun graphical effects"
+SECTION = "x11/gnome"
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
+
+inherit gnomebase gobject-introspection vala itstool gtk-icon-cache gsettings gnome-help gtk-doc
+
+SRC_URI += "file://0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch"
+
+SRC_URI[archive.sha256sum] = "5f2185c4c99e54ddf2b8baf60c82819950e54952e132e8639875f3edcbf8f68e"
+
+DEPENDS += " \
+    clutter-1.0 \
+    clutter-gst-3.0 \
+    clutter-gtk-1.0 \
+    gnome-desktop \
+    libcanberra \
+    libxslt-native \
+"
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
+# Man page build wants to access sourceforge
+EXTRA_OEMESON += "-Dman=false"
+
+FILES:${PN} += "${datadir}"
-- 
2.45.2


