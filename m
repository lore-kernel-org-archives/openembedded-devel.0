Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 5CD506C44A
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 08:04:37 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id i19so7926185pfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Mar 2019 01:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WIXb5fkbY6MZJshoaTtJwCwJJ83qwYv9BzWOCXPq2dA=;
	b=A5BqDqSDTo/kpZ7d/e25USz7IEuktC6rQk0qZx1i9DuzIxqOLTAQNzEV8DArgivPoM
	bb/mAimQWiBpg4d6fSkZZfykBk6WR5nhOOlIiK5utHpRHbaMpHpsoPm+zxj5wjoHRk9r
	yH5H1enqQgnqBwZ3SoA1a5q8f7YFguINXa6fD/5kTk/4z6hOd97WfH7/POX5pRPfalHv
	FcDNa0rc3HFimEieqKsX3V4HMl1P7qB77Sqj7WUZ0rHwnHj4eAAhwssL90dlnO21ImGj
	8oJGe2jP0x3U3nWHqAqVN/b8SGVQ5VjcWgbV+RrB1d3FbWaPS0t4UKGKaRPsaS65mb2f
	xkXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=WIXb5fkbY6MZJshoaTtJwCwJJ83qwYv9BzWOCXPq2dA=;
	b=lfJZS+Gyhpao2l+3zNwIv/cr4FSd6DvM75P5yU42G+VMNudcLLKHBIIPYMhHEPxxsd
	+Jf/twWm/I11JhkOAgeeQz3/RnJbupIcGBgbz1UBJtSyWySAJeAuq1OGHKF410dYGuiB
	UxIgF7BWM6vVwM07ph0rEObaMUZtDgbki04DU8X2bgBHlQcW9IqTWqnGkDdnf5fHqWOG
	JqPyvFMK6XiSl3NJW6QDjd0ZgkcmcbErlw8V+Vsdwh89fY9zw9kcfm13xLtInzc0FPAd
	ocaG1Ff4Z5qE6Yx5E12IQLmnkfkHdBN7L418mRX6PpeDi/qZK23GuuI4DBEbVx7NL7y7
	m16A==
X-Gm-Message-State: APjAAAV28R+B/EXfnW4UQLtMI+uPaAr36GD1d0T0b9uwrvv1sR0MjnG6
	WIhF/jiVAUV98GpverE8lYJic6eT
X-Google-Smtp-Source: APXvYqxu9m+2zYzokVH6Y1Z0hCsGG9N3twziXESZ3CyL5sFFYsbPuzhd71zoB7zLKGUcBd9tViTDDA==
X-Received: by 2002:a63:694a:: with SMTP id e71mr7565511pgc.129.1552723477892; 
	Sat, 16 Mar 2019 01:04:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::b8f7])
	by smtp.gmail.com with ESMTPSA id
	h11sm4296347pgq.57.2019.03.16.01.04.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Mar 2019 01:04:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Mar 2019 01:04:28 -0700
Message-Id: <20190316080428.36688-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH] xfce4-mixer: Remove recipe
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
X-List-Received-Date: Sat, 16 Mar 2019 08:04:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

xfce4-mixer can be replaced with xfce4-pulseaudio-plugin

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...001-Fix-build-after-update-of-xfconf.patch | 61 -------------------
 .../xfce4-mixer/xfce4-mixer_4.11.0.bb         | 17 ------
 .../packagegroup-xfce-extended.bb             |  1 -
 3 files changed, 79 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch
 delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch b/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch
deleted file mode 100644
index 31216c0381..0000000000
--- a/meta-xfce/recipes-apps/xfce4-mixer/files/0001-Fix-build-after-update-of-xfconf.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 6ecaeced291f935a9d41e9bc33411358c95a5e91 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 22 Jan 2018 15:35:08 +0100
-Subject: [PATCH] Fix build after update of xfconf
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-xfconf stopped using dbus-glib so required flags must be included here
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- panel-plugin/Makefile.am | 2 ++
- xfce4-mixer/Makefile.am  | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/panel-plugin/Makefile.am b/panel-plugin/Makefile.am
-index a494682..b094472 100644
---- a/panel-plugin/Makefile.am
-+++ b/panel-plugin/Makefile.am
-@@ -27,6 +27,7 @@ libmixer_la_CFLAGS =							\
- 	$(LIBXFCE4UI_CFLAGS)						\
- 	$(LIBXFCE4PANEL_CFLAGS)						\
- 	$(XFCONF_CFLAGS)						\
-+	$(DBUS_GLIB_CFLAGS)						\
- 	$(GST_PLUGINS_BASE_CFLAGS)					\
- 	$(KEYBINDER_CFLAGS)
- 
-@@ -48,6 +49,7 @@ libmixer_la_LIBADD =							\
- 	$(LIBXFCE4UI_LIBS)						\
- 	$(LIBXFCE4PANEL_LIBS)						\
- 	$(XFCONF_LIBS)							\
-+	$(DBUS_GLIB_LIBS)						\
- 	$(GST_PLUGINS_BASE_LIBS)					\
- 	-lgstaudio-0.10							\
- 	-lgstinterfaces-0.10						\
-diff --git a/xfce4-mixer/Makefile.am b/xfce4-mixer/Makefile.am
-index 4af69e9..e076fc8 100644
---- a/xfce4-mixer/Makefile.am
-+++ b/xfce4-mixer/Makefile.am
-@@ -32,6 +32,7 @@ xfce4_mixer_CFLAGS = 							\
- 	$(UNIQUE_CFLAGS)						\
- 	$(LIBXFCE4UTIL_CFLAGS)						\
- 	$(LIBXFCE4UI_CFLAGS)						\
-+	$(DBUS_GLIB_CFLAGS)						\
- 	$(XFCONF_CFLAGS)						\
- 	$(GST_PLUGINS_BASE_CFLAGS)
- 
-@@ -46,6 +47,7 @@ xfce4_mixer_LDFLAGS = 							\
- 	$(UNIQUE_LIBS)							\
- 	$(LIBXFCE4UTIL_LIBS)						\
- 	$(LIBXFCE4UI_LIBS)						\
-+	$(DBUS_GLIB_LIBS)						\
- 	$(XFCONF_LIBS)							\
- 	$(GST_PLUGINS_BASE_LIBS)					\
- 	-lgstaudio-0.10							\
--- 
-2.14.3
-
diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
deleted file mode 100644
index 6c057d8845..0000000000
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "A volume control application based on GStreamer"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-inherit xfce-panel-plugin
-
-DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
-
-SRC_URI = " \
-    http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2 \
-    file://0001-Fix-build-after-update-of-xfconf.patch \
-"
-
-SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
-SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
-
-RDEPENDS_${PN} = "gst-meta-audio"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index 5f8c03cc5b..b412c27262 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -64,7 +64,6 @@ RRECOMMENDS_${PN} = " \
     xfce4-appfinder \
     xfce4-screenshooter \
     xfce4-power-manager \
-    xfce4-mixer \
     ristretto \
     xfce4-taskmanager \
     gigolo \
-- 
2.21.0


