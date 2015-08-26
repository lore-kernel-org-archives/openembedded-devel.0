Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A2616734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 10:05:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2015 03:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,415,1437462000"; d="scan'208";a="775907366"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2015 03:05:40 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Aug 2015 13:07:00 +0300
Message-Id: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/3] libnotify3: remove the recipe
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
X-List-Received-Date: Wed, 26 Aug 2015 10:05:46 -0000

libnotify 0.7.6 is now provided in oe-core

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb | 16 ----------------
 meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb   |  2 +-
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb

diff --git a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb b/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
deleted file mode 100644
index b66fe97..0000000
--- a/meta-gnome/recipes-gnome/libnotify/libnotify3_0.7.3.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Send desktop notifications to a notification daemon"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
-
-DEPENDS = "dbus gtk+3"
-
-# conflicts with libnotify, mixing them in build breaks couple of packages
-EXCLUDE_FROM_WORLD = "1"
-
-BPN = "libnotify"
-
-inherit gnome lib_package
-
-SRC_URI[archive.md5sum] = "d20676bde7bd2d276508d019dc7276f1"
-SRC_URI[archive.sha256sum] = "322541fdf276eb803686df81763a5186af041b2ee3e9cc5fa1dc86c550388c88"
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
index 1acf8d3..586d1d9 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f08a446809913fc9b3c718f0eaea0426 \
 
 PR = "r4"
 
-DEPENDS = "libnotify3 gtk+3 libunique gvfs librsvg libexif gnome-desktop3"
+DEPENDS = "libnotify gtk+3 libunique gvfs librsvg libexif gnome-desktop3"
 # optional: tracker
 
 # needs libnotify3 which conflicts with libnotify, mixing them in build breaks couple of packages
-- 
2.1.4


