Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id A864A605D2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:36:30 +0000 (UTC)
Received: by wicgi11 with SMTP id gi11so74460520wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Jun 2015 05:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ij8o7SqZ00m4LBdmDLQi6+T4gDsHIRBu6TI4d8NHD8E=;
	b=PrjcLZxs3R3YG1UZg7LfprGzHAevGJut9bCEX1Rsv5/SKsDrGxJqBrRwVFo8EnMaUs
	twN52a76B4NSTK+JrEKffpmRQtA9BQ6rsvvA4w/53ZNNL2ETto1MSeaRz+R+zGdBpTae
	w8cVU2+b05STauti0oxdHWXYhvLYH+CEngYtlWr001tG+TqtgS9HPRFle4UeVUPeWTy3
	JCzdP7IyhemiIP4haX/6T/bPcZNk4Sdk+bAdC5gWWzp0Si4f7HxWAqHIj/03+cVOLOO9
	yyK3+wfz4deEO+JR5w8KqEEOXyuWPmTiOplSvxxAozZIvFQ5ZR2yRtdKZrhUj5YgwxUs
	mkZw==
X-Received: by 10.194.71.82 with SMTP id s18mr81043723wju.102.1435235791760;
	Thu, 25 Jun 2015 05:36:31 -0700 (PDT)
Received: from localhost.localdomain
	(ip-95-222-156-55.hsi15.unitymediagroup.de. [95.222.156.55])
	by mx.google.com with ESMTPSA id
	pg1sm45655780wjb.39.2015.06.25.05.36.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Jun 2015 05:36:30 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Jun 2015 14:35:51 +0200
Message-Id: <1435235754-7339-5-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
References: <1435235754-7339-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 4/7] libxfce4ui: build gtk3 libs and pack gtk2/gtk3 libs in separate packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Jun 2015 12:36:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

the solution provided still allows gtk3 free images (tested on image including
packagegroup-xfce-extended) but there will be updates/new recipes for xfce4
requiring gtk3 part of libxfce4ui e.g xfce4-pulseaudio-plugin (replacement for
deprecated xfce4-mixer due to missing mixer API in gstreamer-1.0) / parole /
xfce4-power-manager.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...configure.ac-remove-optional-gtk3-support.patch | 37 ----------------------
 .../recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb   |  7 ++--
 2 files changed, 5 insertions(+), 39 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch b/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch
deleted file mode 100644
index e154711..0000000
--- a/meta-xfce/recipes-xfce/libxfce4ui/files/0002-configure.ac-remove-optional-gtk3-support.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From d61dc6718a2abaf70d19f17d34128cb7e161e057 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 18 Sep 2013 20:50:11 +0200
-Subject: [PATCH] configure.ac: remove optional gtk3 support
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-it drags in gtk3 if that was build before. This is not yet wanted
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac | 6 ------
- 1 file changed, 6 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index e47df04..b6edab1 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -129,12 +129,6 @@ XDT_CHECK_PACKAGE([GOBJECT], [gobject-2.0], [2.28.0])
- XDT_CHECK_PACKAGE([GTK2], [gtk+-2.0], [2.24.0])
- XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
- 
--dnl ***********************************************************
--dnl *** Optional support for a GTK+3 version of the library ***
--dnl ***********************************************************
--XDT_CHECK_OPTIONAL_PACKAGE([GTK3],
--                           [gtk+-3.0], [3.2.0], [gtk3],
--                           [GTK+ 3 support])
- AM_CONDITIONAL([ENABLE_GTK3_LIBRARY], [test "x$GTK3_FOUND" = "xyes"])
- 
- dnl *************************************************
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
index 36f42d3..26d21c1 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
@@ -2,13 +2,12 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "perl-native glib-2.0 gtk+ intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
+DEPENDS = "perl-native glib-2.0 gtk+ gtk+3 intltool libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
 
 inherit xfce autotools gettext gtk-doc
 
 SRC_URI += " \
     file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
-    file://0002-configure.ac-remove-optional-gtk3-support.patch \
 "
 SRC_URI[md5sum] = "ea9fad7d059fe8f531fe8db42dabb5a9"
 SRC_URI[sha256sum] = "3d619811bfbe7478bb984c16543d980cadd08586365a7bc25e59e3ca6384ff43"
@@ -19,6 +18,10 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[gladeui] = "--enable-gladeui,--disable-gladeui,glade3"
 PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
 
+PACKAGES =+ "${PN}-gtk2 ${PN}-gtk3"
+FILES_${PN}-gtk2 += "${libdir}/libxfce4ui-1.so.* ${libdir}/libxfce4kbd-private-2.so.*"
+FILES_${PN}-gtk3 += "${libdir}/libxfce4ui-2.so.* ${libdir}/libxfce4kbd-private-3.so.*"
+
 FILES_${PN}-dbg += "${libdir}/glade3/modules/.debug"
 FILES_${PN}-dev += "${libdir}/glade3/modules/*.la \
                    ${datadir}/glade3/catalogs/*.in"
-- 
1.9.3


