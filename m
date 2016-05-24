Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7BADB731C2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 11:56:07 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2016 04:56:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109498882"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:56:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 24 May 2016 14:56:55 +0300
Message-Id: <2e56393d31a7bc3596af56ffb0803409d2127aa1.1464090710.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
References: <cover.1464090710.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/8] florence: update to 0.6.3
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
X-List-Received-Date: Tue, 24 May 2016 11:56:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../florence/files/0001-Fix-glib-includes.patch    | 33 ----------------------
 .../{florence_0.5.1.bb => florence_0.6.3.bb}       | 10 +++----
 2 files changed, 5 insertions(+), 38 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
 rename meta-gnome/recipes-support/florence/{florence_0.5.1.bb => florence_0.6.3.bb} (71%)

diff --git a/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch b/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
deleted file mode 100644
index 83e598e..0000000
--- a/meta-gnome/recipes-support/florence/files/0001-Fix-glib-includes.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From c8419ef05ff92ffa3de2e626eb6acd5d2df3baa1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 15 May 2012 13:40:05 +0200
-Subject: [PATCH] Fix glib includes
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-Upstream-Status: unknown
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- src/trace.c |    5 +----
- 1 files changed, 1 insertions(+), 4 deletions(-)
-
-diff --git a/src/trace.c b/src/trace.c
-index 5ea5c13..774c56d 100644
---- a/src/trace.c
-+++ b/src/trace.c
-@@ -21,10 +21,7 @@
- 
- #include "trace.h"
- #include "system.h"
--#include <glib/gprintf.h>
--#include <glib/gutils.h>
--#include <glib/gslist.h>
--#include <glib/gstrfuncs.h>
-+#include <glib.h>
- #include <stdio.h>
- #include <stdarg.h>
- 
--- 
-1.7.6.5
-
diff --git a/meta-gnome/recipes-support/florence/florence_0.5.1.bb b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
similarity index 71%
rename from meta-gnome/recipes-support/florence/florence_0.5.1.bb
rename to meta-gnome/recipes-support/florence/florence_0.6.3.bb
index 71014f0..a8600a4 100644
--- a/meta-gnome/recipes-support/florence/florence_0.5.1.bb
+++ b/meta-gnome/recipes-support/florence/florence_0.6.3.bb
@@ -8,13 +8,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 PR = "r1"
 
-DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify"
+DEPENDS = "gtk+ libxml2 libglade librsvg libxtst gconf cairo intltool-native gnome-doc-utils libnotify gstreamer1.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/florence/florence/${PV}/florence-${PV}.tar.bz2 \
-           file://0001-Fix-glib-includes.patch"
-SRC_URI[md5sum] = "56d12e5b47c100d9df172aa5ddc0f609"
-SRC_URI[sha256sum] = "7b06ed84ef2b7b22d8d2cf0c7d013a05409bd82028240ac8719a68b192d5bc62"
+          "
+SRC_URI[md5sum] = "8775051d7352f75dec5a86dc9964e8e0"
+SRC_URI[sha256sum] = "422992fd07d285be73cce721a203e22cee21320d69b0fda1579ce62944c5091e"
 
-inherit gettext autotools gconf pkgconfig
+inherit gettext autotools gconf pkgconfig gsettings
 
 EXTRA_OECONF = "--disable-scrollkeeper --without-docs --without-at-spi --without-panelapplet"
-- 
2.8.1


