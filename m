Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F28C0218A
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 13:17:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.17040.1738070225672186798
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jan 2025 05:17:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=KtEeK3sZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52, mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4363ae65100so62092155e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 05:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738070224; x=1738675024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=puBm+AGKogudcDwkhVOX49J3W6rd9EMNNEc74WIMu0o=;
        b=KtEeK3sZwNyiT31mA0zKoTjiLUxx4ArF+ZdqO29nt1Ex/sTTqC5PjWeRw6IJbvsxBl
         0wB9K44ubXpLs8DldaBY9toDgt1eiVIBzjwoB/5gdi7pTN+ZI6OLIuZOIbN6M4GKITxi
         5hxkvo7WqOjcA96uaDpz6vBedNHhLt1tbWcdX+dTdTphKKu7/lq+5gCXvUGl4nBkZ348
         5C8KN0A/6djO0XcWz/8iKSzL7m1i2Hdq0963t0HNNfR2vcuLgfufi0XhWsbazt7WlSQk
         v1iew4pE+1SOSNaTwD5f9bELTalBMrdEE3mYBPOVsTlQJuVVwH2LYtZF9bdyX+WoqbJu
         p2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738070224; x=1738675024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puBm+AGKogudcDwkhVOX49J3W6rd9EMNNEc74WIMu0o=;
        b=iNc8emKA+TrzuGxoVwbd9yMfmJagfk7CN0UtPbPeQSySHVGAKXdcRY8BJOJhj8fQDM
         tqvh7pzZgLmPelDkUEa//kF+Vlx3Lq9ChKgw93/iYwlYXNozi55f61BkvO7z2yo5BAsK
         Ob4d5Bftu32qf7c/j7xRe38KKGoP8D5uKz0wS514ZHh+P+KyzsTgSC7Fy4Xaj9TrLWvm
         C7ezyZ7rvAZakSHvydFUsUd7GS276qEVUBpkSgZzotWhDZrSPogQ6XxZnq7i5VpxdHos
         yjXQju1V2H9xj2bcorusRNZ5A9qT7VcrijGK/Nnc1flH37j3A3n5o11t2JenDSOEnYQO
         cOsA==
X-Forwarded-Encrypted: i=1; AJvYcCW65PsZnXvqFz3MBR9v87sWWiqwDWQSTpiQpew8BCD5FIelHZT3H3wsGqwcxhR5lSApOckuC0lhF8PgKr1sUnvRTac=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyyQxTjFWvLV0eR4dBXhGnBp5+b12wMqOBNo1Pq5rTvVUnR2S62
	49VYURznsEh9P0gSeToedYdRk0O2xqPv0vfjyZ+nu3xVjZ5+kMgLWepi9pfqueY=
X-Gm-Gg: ASbGnctV1A0rU/ik8F5NfQ8Zr9KmwfiUq4Eococohl8spdYRrTxYKeYcLx3/iK2Y1ak
	Aj7apu4xDbSsvj44Kl396fG169lYBTF0exUrPgnyd457QqsYurK3nAlEcVzXWgpmUNizkpoSRUy
	fHBNPFwK0JL0NV/X/lqpRXD4SZDVRqYfXJ25dLvkSq6jQPYpYzBjyh+4c/z+OUXYmeZCWcqQaJU
	mJNUlQnrNnfyBGxHgTNtiEd3ZvWT7Y1I7foDa+55LzNG2mjX516p8EprPQX/3lQP39bkjK8g5js
	MfAtEKFKp+qzQ4E=
X-Google-Smtp-Source: AGHT+IHjXvqXlrBTmT426cptPfOkH72fEMyKgZUwD9/J3ikfvEtsLc5Nw1dqIagjm2JpTZpZAQIE0w==
X-Received: by 2002:a05:600c:3548:b0:434:a1d3:a321 with SMTP id 5b1f17b1804b1-438913c6150mr416551465e9.3.1738070223977;
        Tue, 28 Jan 2025 05:17:03 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9138:73f8:bd73:cdf9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f355sm166398695e9.4.2025.01.28.05.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 05:17:03 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-gnome][PATCH] cheese: new recipe
Date: Tue, 28 Jan 2025 14:16:56 +0100
Message-ID: <20250128131656.61467-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jan 2025 13:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115119

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a recipe for cheese - a Gnome application for taking photos and
videos with webcams.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
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
index 0000000000..c58d475675
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
+FILES:${PN} += "/usr/share/"
-- 
2.45.2


