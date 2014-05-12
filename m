Return-Path: <ben.shelton@ni.com>
Received: from ni.com (unknown [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id F12BF60173
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 18:05:11 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s4CHW7II017594 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 12:32:07 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014051212320785-1004978 ;
	Mon, 12 May 2014 12:32:07 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 12:31:53 -0500
Message-Id: <70c1a03b8033cbaf4be7ea31edb11751dca52b18.1399914295.git.ben.shelton@ni.com>
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
Subject: [meta-oe][PATCH 6/7] font-bitstream-100dpi: add recipe
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
X-List-Received-Date: Mon, 12 May 2014 18:05:13 -0000

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../xorg-font/font-bitstream-100dpi_1.0.3.bb               | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
new file mode 100644
index 0000000..9a83ac1
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-font/font-bitstream-100dpi_1.0.3.bb
@@ -0,0 +1,14 @@
+require recipes-graphics/xorg-font/xorg-font-common.inc
+
+SUMMARY = "Bitstream 100 DPI fonts"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/font/bitstream-100dpi/"
+SECTION = "x11/font"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=30330812324ff9d9bd9ea645bb944427"
+
+DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+RDEPENDS_${PN} = "encodings font-util"
+RDEPENDS_${PN}_class-native = "font-util-native"
+
+SRC_URI[md5sum] = "6b223a54b15ecbd5a1bc52312ad790d8"
+SRC_URI[sha256sum] = "ebe0d7444e3d7c8da7642055ac2206f0190ee060700d99cd876f8fc9964cb6ce"
-- 
1.9.3


