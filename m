Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE1076DE1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443653"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:05 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:42 +0300
Message-Id: <1442233610-32279-3-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/9] libwnck3: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:05 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.14.0.bb | 16 ----------------
 1 file changed, 16 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck3_3.14.0.bb

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.14.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.14.0.bb
deleted file mode 100644
index 35e07cb..0000000
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.14.0.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Window navigation construction toolkit"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-BPN = "libwnck"
-
-SECTION = "x11/libs"
-DEPENDS = "gobject-introspection-stub gtk+3 gdk-pixbuf-native libxres"
-
-PACKAGECONFIG ??= "startup-notification"
-PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
-
-inherit gnomebase
-GNOME_COMPRESS_TYPE = "xz"
-SRC_URI[archive.md5sum] = "4538672e0d775fadedf10abeb8020047"
-SRC_URI[archive.sha256sum] = "f5080076346609b4c36394b879f3a86b92ced3b90a37cb54c8e9a14f00e7921c"
-- 
2.1.4


