Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 148AD74D36
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 May 2018 06:18:10 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c10so20400834pfi.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2018 23:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xdcsrN5ve43mXaorfEmThu4UMPeenZ4r9DpI9mFJi0o=;
	b=AoDZdIrsXBQGkQM3DtBbr5QVggN5fDnBMjgQRmWdzUMt2Ep+cBcor2+TARgDj7eX5B
	D3H3BZ6prqHn7RjgJwaoXnnaZa2+ziUxmASqPkUmm4dTypenLnB9hxEVBpvOpGQad1Bo
	y9Jl79yL9rsFNHfqN31TTskuMUcjMnjXPfqWuvbH02U/0pk+yzR0ISfrew9dOHTKN8hM
	Hi16NVqSTdEEmLEA9qhxb83+lBsLXxGqz7xcvdnutW8sW7uWeGjZ88gNl+UjfsJeeMhP
	DfRnpky4DM+dc5dh2fxsQIU3iRYZXe2Ksj81wKLpD1lM8wUXXeTDFqv6ZrcHlCMqHRHu
	uaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xdcsrN5ve43mXaorfEmThu4UMPeenZ4r9DpI9mFJi0o=;
	b=eMMrwNzuhtdzMzPTlXVEmNSt4KQE3ygBfUPdni7muhd6akq32mA62EMchfAo19V0ZN
	LFnhINMvskmOYQwHYxjqaZNj+6ptf+ZYgr2HP32UKoN1skJwQaOrNWqqaBed0qgs4wVS
	t0IxlmOnhJsZgM8mrRRgatFuzjcFSdWgxBKjoNaE+nkh/sZsmrItMahH7xL4JKGEsafZ
	eYmR8Uk/wzT2E45QpQUHmeiM8VNoQXPwxI4Kn6kMIXapf1dq9N3bXybTZqXFyIj0OUFL
	qrdDIB+HamaVZxxjAEyU/5yDJ+fLZPYlSPNcK4adhryd3dV2Sc7EvWPkANL2r5dCrqdj
	z6mw==
X-Gm-Message-State: ALQs6tAgh6LMUlAZy4Da0ifowED8SE1y8g1Ho0A8igHb9oUJpK+efD94
	r2Rr6mzjXelOTYQJQcBz4Qmafg==
X-Google-Smtp-Source: AB8JxZpWXYiKpr2m2OWJu0fOcG49KEACIXDO8sm0uLAnsob7yCGwVql4TPPJH+DxpObyEQNjLn+jpg==
X-Received: by 2002:a17:902:9a8c:: with SMTP id
	w12-v6mr34298708plp.333.1525587491379; 
	Sat, 05 May 2018 23:18:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	s65sm46674457pfj.124.2018.05.05.23.18.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 23:18:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 May 2018 23:18:00 -0700
Message-Id: <20180506061804.19509-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180506061804.19509-1-raj.khem@gmail.com>
References: <20180506061804.19509-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 2/6] nautilus: Fix build with gdx-pixbuf >= to 2.36.11
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
X-List-Received-Date: Sun, 06 May 2018 06:18:11 -0000
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
index 000000000..f19eb4979
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
index 8fdbf6ac2..bdb2f3c88 100644
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


