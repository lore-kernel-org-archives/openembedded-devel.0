Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2D173CBD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Sep 2015 12:25:03 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 14 Sep 2015 05:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,527,1437462000"; d="scan'208";a="644443552"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Sep 2015 05:25:03 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Sep 2015 15:26:40 +0300
Message-Id: <1442233610-32279-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/9] gsettings-desktop-schemas: remove the recipe due to its move to oe-core
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
X-List-Received-Date: Mon, 14 Sep 2015 12:25:04 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../gsettings-desktop-schemas_3.14.1.bb                   | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.14.1.bb

diff --git a/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.14.1.bb b/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.14.1.bb
deleted file mode 100644
index e6d1d1a..0000000
--- a/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.14.1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "GNOME desktop-wide GSettings schemas"
-HOMEPAGE = "http://live.gnome.org/gsettings-desktop-schemas"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "glib-2.0 intltool-native gobject-introspection-stub-native"
-
-inherit gnomebase gsettings gettext
-
-GNOME_COMPRESS_TYPE = "xz"
-
-SRC_URI[archive.md5sum] = "92d41934212fc7da48648afa3927f4b0"
-SRC_URI[archive.sha256sum] = "217eba09f0fb263dcb8ce6efa21c9afaf0504ac1d937732d1af1c6724c05f065"
-- 
2.1.4


