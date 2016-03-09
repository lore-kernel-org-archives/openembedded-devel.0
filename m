Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 0277960721
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:10:46 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 07:10:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="62869207"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2016 07:10:19 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:05:40 +0200
Message-Id: <3c097bb6e5f0bd7ad0ffcb7568093adae6dedc86.1457535831.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/38] libunique: fix gobject introspection support
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
X-List-Received-Date: Wed, 09 Mar 2016 15:10:48 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...-use-LIBTOOL-instead-of-hardcoded-libtool.patch | 27 ++++++++++++++++++++++
 meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb |  6 +++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch

diff --git a/meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch b/meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
new file mode 100644
index 0000000..2b5eda0
--- /dev/null
+++ b/meta-oe/recipes-gnome/libunique/libunique/0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch
@@ -0,0 +1,27 @@
+From f39bcd5af79aa3efe2cecb2212793c5b596890a8 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 18 Feb 2016 17:40:45 +0200
+Subject: [PATCH] Makefile.am: use $(LIBTOOL) instead of hardcoded libtool name
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ unique/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/unique/Makefile.am b/unique/Makefile.am
+index 6475a87..734f431 100644
+--- a/unique/Makefile.am
++++ b/unique/Makefile.am
+@@ -114,7 +114,7 @@ Unique-1.0.gir: $(INTROSPECTION_SCANNER) libunique-1.0.la
+ 		--include=GObject-2.0 \
+ 		--include=Gtk-2.0 \
+ 		--library=libunique-1.0.la \
+-		--libtool="$(top_builddir)/libtool" \
++		--libtool="$(LIBTOOL)" \
+ 		--pkg gobject-2.0 \
+ 		--pkg gtk+-2.0 \
+ 		--output $@ \
+-- 
+2.7.0
+
diff --git a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
index d97d1d6..3d13e5a 100644
--- a/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta-oe/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -6,7 +6,9 @@ BUGTRACKER = "https://bugzilla.gnome.org/enter_bug.cgi?product=libunique"
 SRC_URI = "${GNOME_MIRROR}/libunique/1.1/libunique-${PV}.tar.bz2 \
 	file://fix_for_compile_with_gcc-4.6.0.patch \
 	file://noconst.patch \
-        file://build.patch"
+        file://build.patch \
+        file://0001-Makefile.am-use-LIBTOOL-instead-of-hardcoded-libtool.patch \
+        "
 
 SRC_URI[md5sum] = "7955769ef31f1bc4f83446dbb3625e6d"
 SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66cdd4fbb"
@@ -22,4 +24,4 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig gobject-introspection
-- 
2.7.0


