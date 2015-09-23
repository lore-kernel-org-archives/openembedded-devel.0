Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 346 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 Sep 2015 14:02:06 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 126BA7701F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 14:02:06 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 2BD883879A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 15:56:04 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Sep 2015 15:56:06 +0200
Message-Id: <1443016567-15788-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
References: <1443016567-15788-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH 4/5] libiec61883: add new recipe
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
 .../recipes-multimedia/libiec61883/libiec61883_1.2.0.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libiec61883/libiec61883_1.2.0.bb

diff --git a/meta-multimedia/recipes-multimedia/libiec61883/libiec61883_1.2.0.bb b/meta-multimedia/recipes-multimedia/libiec61883/libiec61883_1.2.0.bb
new file mode 100644
index 0000000..e6079bd
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libiec61883/libiec61883_1.2.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "An implementation of the most relevant parts of IEC 61883 over \
+libraw1394 for transmission, reception, and management of media streams and \
+devices such as DV, MPEG2-TS, audio, and MIDI"
+HOMEPAGE = "https://ieee1394.wiki.kernel.org/index.php/Libraries#libiec61883"
+SECTION = "libs/multimedia"
+
+DEPENDS = "libraw1394"
+
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=771782cb6245c7fbbe74bc0ec059beff"
+
+SRC_URI = "https://www.kernel.org/pub/linux/libs/ieee1394/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "ed91bc1727fac8e019402fc3724a283d"
+SRC_URI[sha256sum] = "d1e02c7e276fac37313a2f8c1c33d7a9e19282ff16f32e72435428ff5121f09e"
+
+inherit autotools pkgconfig
-- 
1.9.1


