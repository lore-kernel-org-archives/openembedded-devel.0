Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8355962132
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 13:58:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 21 Mar 2016 06:58:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="70404976"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2016 06:58:38 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2016 15:54:51 +0200
Message-Id: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 1/2] gnome-bluetooth: inherit gobject-introspection class
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
X-List-Received-Date: Mon, 21 Mar 2016 13:58:39 -0000

This fixes introspection support.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
index 77e9a15..b3058e8 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -11,7 +11,7 @@ SECTION = "x11/gnome"
 DEPENDS = "systemd gtk+3 libnotify libcanberra"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 
-inherit gnomebase gtk-icon-cache distro_features_check
+inherit gnomebase gtk-icon-cache distro_features_check gobject-introspection
 REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI[archive.md5sum] = "75d09c924468ec0c687f9ab3acf7f113"
-- 
2.7.0


