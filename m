Return-Path: <ben.shelton@ni.com>
Received: from ni.com (unknown [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id A73B960167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 17:57:39 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s4CHW7IH017594 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 12:32:07 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014051212320782-1004976 ;
	Mon, 12 May 2014 12:32:07 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 12:31:51 -0500
Message-Id: <39bdb80ebcf591aebf6d0e5feac43f87b70ad8e0.1399914295.git.ben.shelton@ni.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1399914295.git.ben.shelton@ni.com>
References: <cover.1399914295.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP5|July 31, 2013) at 05/12/2014 12:32:07 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP5|July
	31, 2013) at 05/12/2014 12:32:07 PM,
	Serialize complete at 05/12/2014 12:32:07 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-12_03:2014-05-12, 2014-05-12,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 4/7] font-bh-100dpi: add recipe
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
X-List-Received-Date: Mon, 12 May 2014 17:57:39 -0000

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
new file mode 100644
index 0000000..3ee91ce
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-font/font-bh-100dpi_1.0.3.bb
@@ -0,0 +1,14 @@
+require recipes-graphics/xorg-font/xorg-font-common.inc
+
+SUMMARY = "Bigelow & Holmes 100 DPI fonts"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/font/bh-100dpi/"
+SECTION = "x11/font"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cffd5e9c4b61b3d74166ca74b99e460e"
+
+DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+RDEPENDS_${PN} = "encodings font-util"
+RDEPENDS_${PN}_class-native = "font-util-native"
+
+SRC_URI[md5sum] = "9f11ade089d689b9d59e0f47d26f39cd"
+SRC_URI[sha256sum] = "23c07162708e4b79eb33095c8bfa62c783717a9431254bbf44863734ea239481"
-- 
1.9.3


