Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AE51860CFC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 18:09:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2014 10:06:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,495,1413270000"; d="scan'208";a="616789807"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.54])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2014 10:09:20 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Dec 2014 12:09:14 -0600
Message-Id: <1417457354-6636-1-git-send-email-alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-gnome][PATCH] gsettings-desktop-schemas: Moved from OE-Core
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
X-List-Received-Date: Mon, 01 Dec 2014 18:09:30 -0000

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../gsettings-desktop-schemas_3.14.1.bb                   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.14.1.bb

diff --git a/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.14.1.bb b/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.14.1.bb
new file mode 100644
index 0000000..e6d1d1a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.14.1.bb
@@ -0,0 +1,15 @@
+SUMMARY = "GNOME desktop-wide GSettings schemas"
+HOMEPAGE = "http://live.gnome.org/gsettings-desktop-schemas"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "glib-2.0 intltool-native gobject-introspection-stub-native"
+
+inherit gnomebase gsettings gettext
+
+GNOME_COMPRESS_TYPE = "xz"
+
+SRC_URI[archive.md5sum] = "92d41934212fc7da48648afa3927f4b0"
+SRC_URI[archive.sha256sum] = "217eba09f0fb263dcb8ce6efa21c9afaf0504ac1d937732d1af1c6724c05f065"
-- 
1.9.1


