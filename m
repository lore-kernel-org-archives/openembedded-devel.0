Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 361 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Dec 2016 10:26:21 UTC
Received: from atl4mhfb03.myregisteredsite.com
	(atl4mhfb03.myregisteredsite.com [209.17.115.119])
	by mail.openembedded.org (Postfix) with ESMTP id A88E8772E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 10:26:21 +0000 (UTC)
Received: from atl4mhob15.myregisteredsite.com
	(atl4mhob15.myregisteredsite.com [209.17.115.53])
	by atl4mhfb03.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	uBKAKN9m006611 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 05:20:23 -0500
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob15.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	uBKAKKeX027999 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2016 05:20:20 -0500
Received: (qmail 17309 invoked by uid 0); 20 Dec 2016 10:20:20 -0000
X-TCPREMOTEIP: 37.74.225.130
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO mikebuntu.TOPIC.LOCAL)
	(mike@milosoftware.com@37.74.225.130)
	by 0 with ESMTPA; 20 Dec 2016 10:20:19 -0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2016 11:20:06 +0100
Message-Id: <1482229206-7475-1-git-send-email-mike.looijmans@topic.nl>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][morty][PATCH] libwnck3: Resurrect recipe
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
X-List-Received-Date: Tue, 20 Dec 2016 10:26:21 -0000

libwnck3 moved to OE-core, then OE-core removed all dependencies on it
and removed the recipe, so now it's gone. Bring back the recipe into
meta-openembedded.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_3.20.1.bb
new file mode 100644
index 0000000..d3c3a86
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
+inherit gnomebase gobject-introspection
+SRC_URI[archive.md5sum] = "487938d65d4bfae1f2501052b1bd7492"
+SRC_URI[archive.sha256sum] = "1cb03716bc477058dfdf3ebfa4f534de3b13b1aa067fcd064d0b7813291cba72"
+
+inherit distro_features_check
+# libxres means x11 only
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
1.9.1


