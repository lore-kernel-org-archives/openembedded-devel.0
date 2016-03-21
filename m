Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6E06FFA6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 13:58:40 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 21 Mar 2016 06:58:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="70405004"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2016 06:58:40 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Mar 2016 15:54:52 +0200
Message-Id: <1458568492-29611-2-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1458568492-29611-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] gnome-bluetooth: replace systemd dependency with udev
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
X-List-Received-Date: Mon, 21 Mar 2016 13:58:40 -0000

Now we have an up to date standalone libudev (via eudev),
so systemd is no longer required.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
index b3058e8..984dad5 100644
--- a/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-bluetooth_3.18.2.bb
@@ -6,13 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
 
 SECTION = "x11/gnome"
 
-# systemd is needed because it has a necessary version of libudev
-# Effectively this means that systemd must be in DISTRO_FEATURES
-DEPENDS = "systemd gtk+3 libnotify libcanberra"
+DEPENDS = "udev gtk+3 libnotify libcanberra"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES','bluez5','bluez5','bluez4',d)}"
 
 inherit gnomebase gtk-icon-cache distro_features_check gobject-introspection
-REQUIRED_DISTRO_FEATURES = "systemd"
 
 SRC_URI[archive.md5sum] = "75d09c924468ec0c687f9ab3acf7f113"
 SRC_URI[archive.sha256sum] = "d8df073c331df0f97261869fb77ffcdbf4e3e4eaf460d3c3ed2b16e03d9c5398"
-- 
2.7.0


