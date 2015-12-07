Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 010B06012C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Dec 2015 07:45:06 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 06 Dec 2015 23:45:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,393,1444719600"; d="scan'208";a="855398527"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2015 23:45:05 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Dec 2015 09:48:47 +0200
Message-Id: <1449474527-15007-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libgudev: Remove (moved to OE-Core)
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
X-List-Received-Date: Mon, 07 Dec 2015 07:45:09 -0000

libgudev was added to OE-Core in revision c6d37fc47f.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta-oe/recipes-gnome/libgudev/libgudev_230.bb | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-oe/recipes-gnome/libgudev/libgudev_230.bb

diff --git a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb b/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
deleted file mode 100644
index ea8e82c..0000000
--- a/meta-oe/recipes-gnome/libgudev/libgudev_230.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "GObject wrapper for libudev"
-
-SRC_URI[archive.md5sum] = "e4dee8f3f349e9372213d33887819a4d"
-SRC_URI[archive.sha256sum] = "a2e77faced0c66d7498403adefcc0707105e03db71a2b2abd620025b86347c18"
-
-DEPENDS = "glib-2.0 udev"
-
-RCONFLICTS_${PN} = "systemd (<= 220)"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-inherit gnomebase distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "systemd"
-- 
2.1.4


