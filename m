Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id E367A708AC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 19:26:54 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SJQtLu006726 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 14:26:55 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072814265542-326956 ;
	Mon, 28 Jul 2014 14:26:55 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jul 2014 14:26:34 -0500
Message-Id: <1406575596-15006-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 02:26:55 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 02:26:55 PM,
	Serialize complete at 07/28/2014 02:26:55 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 1/3] font-misc-misc: add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 19:26:55 -0000

Adding a recipe for the X.org misc-misc fonts.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb

diff --git a/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
new file mode 100644
index 0000000..d60fa0f
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-font/font-misc-misc_1.1.2.bb
@@ -0,0 +1,14 @@
+require recipes-graphics/xorg-font/xorg-font-common.inc
+
+SUMMARY = "X.org miscellaneous fonts"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/font/misc-misc/"
+SECTION = "x11/font"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=200c507f595ee97008c7c5c3e94ab9a8"
+
+DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+RDEPENDS_${PN} = "encodings font-util"
+RDEPENDS_${PN}_class-native = "font-util-native"
+
+SRC_URI[md5sum] = "c88eb44b3b903d79fb44b860a213e623"
+SRC_URI[sha256sum] = "b8e77940e4e1769dc47ef1805918d8c9be37c708735832a07204258bacc11794"
-- 
2.0.3


