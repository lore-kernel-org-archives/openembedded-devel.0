Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D21E565C5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Nov 2016 15:30:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 01 Nov 2016 08:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,580,1473145200"; d="scan'208";a="1079023422"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 01 Nov 2016 08:30:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  1 Nov 2016 17:28:21 +0200
Message-Id: <20161101152821.600-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.10.1
Subject: [PATCH] libwnck3: add a recipe
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
X-List-Received-Date: Tue, 01 Nov 2016 15:30:51 -0000

It is no longer needed in oe-core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
new file mode 100644
index 0000000..fd4ef69
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Window navigation construction toolkit"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+
+BPN = "libwnck"
+
+SECTION = "x11/libs"
+DEPENDS = "intltool-native gtk+3 gdk-pixbuf-native libxres"
+
+PACKAGECONFIG ??= "startup-notification"
+PACKAGECONFIG[startup-notification] = "--enable-startup-notification,--disable-startup-notification,startup-notification"
+
+inherit gnomebase gobject-introspection gtk-doc
+SRC_URI[archive.md5sum] = "487938d65d4bfae1f2501052b1bd7492"
+SRC_URI[archive.sha256sum] = "1cb03716bc477058dfdf3ebfa4f534de3b13b1aa067fcd064d0b7813291cba72"
+
+inherit distro_features_check
+# libxres means x11 only
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.10.1


