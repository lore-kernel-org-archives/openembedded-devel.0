Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 03174708BD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 22:04:47 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SM4nVG007309 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 17:04:49 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072817044916-335393 ;
	Mon, 28 Jul 2014 17:04:49 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jul 2014 17:04:33 -0500
Message-Id: <1406585073-15852-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.3
In-Reply-To: <1406585073-15852-1-git-send-email-ben.shelton@ni.com>
References: <1406585073-15852-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 05:04:49 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 05:04:49 PM,
	Serialize complete at 07/28/2014 05:04:49 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH v2 2/2] font-cursor-misc: add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 22:04:54 -0000

Adding a recipe for the X.org cursor-misc fonts.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 .../recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb    | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb

diff --git a/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
new file mode 100644
index 0000000..7db03eb
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-font/font-cursor-misc_1.0.3.bb
@@ -0,0 +1,13 @@
+require recipes-graphics/xorg-font/xorg-font-common.inc
+
+SUMMARY = "X.org cursor fonts"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/font/cursor-misc/"
+SECTION = "x11/font"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8b32ccac3ad25e75e68478deb7780265"
+
+DEPENDS = "util-macros-native font-util-native bdftopcf-native"
+RDEPENDS_${PN} = "encodings font-util"
+
+SRC_URI[md5sum] = "3e0069d4f178a399cffe56daa95c2b63"
+SRC_URI[sha256sum] = "17363eb35eece2e08144da5f060c70103b59d0972b4f4d77fd84c9a7a2dba635"
-- 
2.0.3


