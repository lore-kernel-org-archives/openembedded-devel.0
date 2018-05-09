Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 64B9A74A0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:29 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id f189so26070980pfa.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=35pJOihlTfPbyIwxYCfsmGYuSF93AF6m5ivqDlPhTv4=;
	b=DzXkU+TDoY+KROyiE24ylXqFarPMeo9f/RFn454ZuOBkHeblcwFNh6I9Ul5RHApmx+
	/v5gYOZsnuqQK0kiTAjwkMx4/CCS3k5BygUswNP30s0tqY8OCD8K1PMpTcu1304GiFy2
	HdMe/CQvo4WpzyVva6dq+dCg3H6ElT8QTjlWAdhEVwlMlt5PN+DHFbHOOSYC9efp3gUo
	HPFQwxDAUopQ1/obOZwMsVgvYEoEhF+3UhAm7ImlPef77kZbEdhyjKuB9Hy5vhYcCPfS
	yMqHkpTlKz0EYxhE0KyP4mO9C7gfnkw0OzxhsqwK0KwPIyQYeAl0npELq8310SLr+RHf
	HPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=35pJOihlTfPbyIwxYCfsmGYuSF93AF6m5ivqDlPhTv4=;
	b=NfdHFfrKE58IHf2l5VsCqLtb7FRj9fiwg53ixdsT2ersDju95b1Aos/qysse9TbJwT
	oANqprWTwpDVxXHDamkFBCFPT/NikfZzOqeeNTm/lfXXv3J4ane6ksFNxFTtgm3lVgj8
	/C5VWGuJsfgRMO+TVZ1W4XyfrlqEwuh7ZRxnYO0JfsOJSqpCVkcsE8rwATYH2Y8XMnwl
	eypuSLF1/0tH1W8sRmoWqFvUIFvDPsAPFfZEWlVBDQBXkT7Lm8CqF2d6nngOIHvZcoZp
	otZaPGAYaN0tHqM6HbbmNfThbIwtPSAzfUKWh9XfmdQ0q1ejmLwh/EahSuFgkiJdV0ax
	dCVA==
X-Gm-Message-State: ALQs6tDDIwdebKYOoq3pbqdmG9qiIVv70JmNxBj0tVPx8dh7HxqaaPPt
	ul+zyw0RQlCZx0RNNQlhF+htdw==
X-Google-Smtp-Source: AB8JxZr3i7RQLiZIjtRysvJ/PoZ5ILdisTAaHHjMWPvArJjGdMcDs3z2+EqLA7puFbkCuMyexWAXjw==
X-Received: by 10.98.227.15 with SMTP id g15mr45177919pfh.68.1525892430285;
	Wed, 09 May 2018 12:00:30 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:05 -0700
Message-Id: <20180509190011.30006-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 10/16] nautilus: Fix build with gdx-pixbuf >= to 2.36.11
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
X-List-Received-Date: Wed, 09 May 2018 19:00:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

OE-Core has updates to 2.36.11, so we have to replace
obsolete API uses

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ome-desktop-thumbnail-API-with-new-g.patch | 40 +++++++++++++++++++
 .../recipes-gnome/nautilus/nautilus_3.18.5.bb | 10 +++--
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
new file mode 100644
index 0000000000..f19eb49798
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch
@@ -0,0 +1,40 @@
+From a4ed38e95cbe07f02028249b8b315565a5ac1e43 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 May 2018 22:32:45 -0700
+Subject: [PATCH] nautilus: drop gnome-desktop thumbnail API with new
+ gdk-pixbuf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+If gdk-pixbuf >= 2.36.5 is available, its scaling API can do what we
+want, so we don’t need to use the deprecated gnome-desktop one.
+
+Also fixes compile errors seen on master
+nautilus-properties-window.c:5101: undefined reference to `gnome_desktop_thumbnail_scale_down_pixbuf'
+
+Upstream-Status: Backport
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nautilus-properties-window.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/nautilus-properties-window.c b/src/nautilus-properties-window.c
+index dea8b0f..fad9bd1 100644
+--- a/src/nautilus-properties-window.c
++++ b/src/nautilus-properties-window.c
+@@ -5098,10 +5098,11 @@ update_preview_callback (GtkFileChooser *icon_chooser,
+ 			scale = (double)gdk_pixbuf_get_height (pixbuf) /
+ 				gdk_pixbuf_get_width (pixbuf);
+ 
+-			scaled_pixbuf = gnome_desktop_thumbnail_scale_down_pixbuf
++			scaled_pixbuf = gdk_pixbuf_scale_simple
+ 				(pixbuf,
+ 				 PREVIEW_IMAGE_WIDTH,
+-				 scale * PREVIEW_IMAGE_WIDTH);
++				 scale * PREVIEW_IMAGE_WIDTH,
++				 GDK_INTERP_HYPER);
+ 			g_object_unref (pixbuf);
+ 			pixbuf = scaled_pixbuf;
+ 		}
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
index 8fdbf6ac2b..bdb2f3c884 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.18.5.bb
@@ -6,14 +6,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=36cf660aea2b8beffba7945f44a7e748 \
                     file://COPYING.EXTENSIONS;md5=7579d6678402a1868631bf82c93ff0d4 \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/nautilus/3.18/nautilus-${PV}.tar.xz"
+inherit distro_features_check autotools pkgconfig gobject-introspection
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/nautilus/${MAJ_VER}/nautilus-${PV}.tar.xz \
+           file://0001-nautilus-drop-gnome-desktop-thumbnail-API-with-new-g.patch \
+           "
 
 SRC_URI[md5sum] = "0f578bda5655c0ce204befafca5803d7"
 SRC_URI[sha256sum] = "60a927c0522b4cced9d8f62baed2ee5e2fd4305be4523eb5bc44805971a6cc15"
 
 DEPENDS = "gtk+3 gnome-desktop3 gsettings-desktop-schemas glib-2.0-native intltool-native pango"
 
-inherit distro_features_check autotools pkgconfig gobject-introspection
 REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = " \
@@ -23,7 +27,7 @@ EXTRA_OECONF = " \
     --enable-tracker=no \
     --disable-schemas-compile \
     --enable-xmp=no \
-    --enable-libexif=no \ 
+    --enable-libexif=no \
 "
 
 FILES_${PN} += "${datadir}/*"
-- 
2.17.0


