Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 12A0A77020
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:02:06 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id E2E3D38799
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:56:03 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2015 15:56:05 +0200
Message-Id: <1443016567-15788-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
References: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH 3/5] libavc1394: add new recipe
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
X-List-Received-Date: Wed, 23 Sep 2015 14:02:09 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-multimedia/libavc1394/libavc1394_0.5.4.bb     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb

diff --git a/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb b/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
new file mode 100644
index 0000000..97e2bf1
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavc1394/libavc1394_0.5.4.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "libavc1394 is a programming interface for the 1394 Trade \
+Association AV/C (Audio/Video Control) Digital Interface Command Set"
+HOMEPAGE = "http://sourceforge.net/projects/libavc1394/"
+SECTION = "libs/multimedia"
+
+DEPENDS = "libraw1394"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dcf3c825659e82539645da41a7908589"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz"
+SRC_URI[md5sum] = "caf0db059d8b8d35d6f08e6c0e1c7dfe"
+SRC_URI[sha256sum] = "7cb1ff09506ae911ca9860bef4af08c2403f3e131f6c913a2cbd6ddca4215b53"
+
+inherit autotools pkgconfig
-- 
1.9.1


