Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7B9B47D485
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 May 2019 08:38:10 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id f2so9187923wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 May 2019 01:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WF7GqkBGIsttlNJxyIGiYdOlYt6tb8v1O1oE6X8+0j8=;
	b=oO3Br3Nt4bjGIY5zevHDo9UnSoGU1jzDJr3OfTX9Q9Th313WpKMP6DnWqiU/rMAVLl
	bEj4gIlD2yNXslD5V9F9UHXCDsIJEDl6wsGVZF+0OtymUzMfxxftCmh0fsGL24YR0L74
	pS9na/T3opgBDYFqvldnpJ+JL87kZEbOuXTJSCAZdHuhj79GDT2aV2jh8itdH7SXGTcP
	upgVjQRQTdVplOEr56sB/OyCFj8Cc8S/m94jpR0nDqHZb87FWS2IEQF8w9gygaJ8BGmk
	MK4E1vpCXDldTEc/aAR835rPxMX5WdZ8aUn07vjEvzz5NRJny2fQZM+Y2/tOaNn4998T
	OS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WF7GqkBGIsttlNJxyIGiYdOlYt6tb8v1O1oE6X8+0j8=;
	b=SDwzHqpj1M8VsDHunuTXfRR7sYgKwJ6Xj4jqNl0p6Pd0r/Aq4wAr0Btc/OvnDvK65D
	3j8xq2FzuhQCv+oAD+6sdCD2sC/PUEwyL/UihtfggVQAXW8NFxvg458HzN0TS8yK5LXD
	3i7rmqazRkzajeijE71P5ch8m+zUFXFo8PSNsE3LK+mIhHl4EjXdfFKac/CJCGEwYpPn
	1VzvCrvhPyK6b8mqh+yM88QTsHJOIqiKxTCLkhtV4n8V22AAR/6AJrfiStWD7m0NUo56
	TX3mhWPREWuoPJ1K2tDI9mKR287bRJl8Lso26SLwFF6AIZ/HphDj8HoNwxzhJau+ss+X
	UfqA==
X-Gm-Message-State: APjAAAVlJhmHHPwP/I4qg3jiGiX++y9On4yS3Avt2UM1yjczCOK9zJkU
	mOKMKKU8LB8RvJI2mEmvRcsKheCB
X-Google-Smtp-Source: APXvYqyEaAUKvBeltBvTn80rBDGFtb4g8s3ibEZa52NupQZtqonGo5kxHdyXa6SkxuTXZcOwv7Oyzg==
X-Received: by 2002:a7b:c844:: with SMTP id c4mr15339017wml.108.1557131891285; 
	Mon, 06 May 2019 01:38:11 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163]) by smtp.gmail.com with ESMTPSA id
	y197sm9843711wmd.34.2019.05.06.01.38.10
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 01:38:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2019 10:37:50 +0200
Message-Id: <20190506083750.22786-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506083750.22786-1-schnitzeltony@gmail.com>
References: <20190506083750.22786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libwnck3: upgrade 3.30.0 and move to meson build
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
X-List-Received-Date: Mon, 06 May 2019 08:38:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/libwnck/libwnck3_3.30.0.bb  | 20 ----------------
 .../recipes-gnome/libwnck/libwnck3_3.32.0.bb  | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 20 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck3_3.30.0.bb
 create mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.30.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.30.0.bb
deleted file mode 100644
index 9cee9c967..000000000
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.30.0.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Window navigation construction toolkit"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-BPN = "libwnck"
-
-SECTION = "x11/libs"
-DEPENDS = "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native libxres"
-
-PACKAGECONFIG ??= "startup-notification"
-PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-
-inherit gnomebase gobject-introspection gtk-doc gettext
-
-SRC_URI[archive.md5sum] = "60109c2ab0b07da1099ee57980054de1"
-SRC_URI[archive.sha256sum] = "ac6d0d2646aa80676d3066651e73abb7bff7ed79be238c9b21a0083e2adc3439"
-
-inherit distro_features_check
-# libxres means x11 only
-REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb
new file mode 100644
index 000000000..e4829ea8c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.32.0.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Window navigation construction toolkit"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+BPN = "libwnck"
+
+SECTION = "x11/libs"
+DEPENDS = "intltool-native gnome-common-native gtk+3 gdk-pixbuf-native libxres"
+
+PACKAGECONFIG ??= "startup-notification"
+PACKAGECONFIG[startup-notification] = "-Dstartup_notification=enabled,-Dstartup_notification=disabled,startup-notification"
+
+GNOMEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk_doc"
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
+inherit gnomebase gobject-introspection gtk-doc gettext distro_features_check
+
+SRC_URI[archive.md5sum] = "89dbe5a1843fd3745b8b64b34a2ef55d"
+SRC_URI[archive.sha256sum] = "9595835cf28d0fc6af5526a18f77f2fcf3ca8c09e36741bb33915b6e69b8e3ca"
+
+# libxres means x11 only
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.20.1


