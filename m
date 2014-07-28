Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 13E5D70187
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 19:18:11 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SJICF0000998 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 14:18:12 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072814181226-326618 ;
	Mon, 28 Jul 2014 14:18:12 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jul 2014 14:17:47 -0500
Message-Id: <1406575069-6575-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 02:18:12 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 02:18:12 PM,
	Serialize complete at 07/28/2014 02:18:12 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 1/3] xfontsel: add recipe
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
X-List-Received-Date: Mon, 28 Jul 2014 19:18:13 -0000

The xfontsel utility is useful for verifying and viewing the various
X.org fonts that are available on a system.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.5.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.5.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.5.bb
new file mode 100644
index 0000000..c74b291
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xfontsel_1.0.5.bb
@@ -0,0 +1,13 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "xfontsel provides point and click selection of X11 font names"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xfontsel/"
+SECTION = "x11/app"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4669d2703c60d585cc29ba7e9a69bcb3"
+DEPENDS += " libxaw"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4669d2703c60d585cc29ba7e9a69bcb3"
+
+SRC_URI[md5sum] = "a40302b88c599b63e3d3d412e02871e6"
+SRC_URI[sha256sum] = "170d8550b96fb47b04db6181b947e6f6b8b97f4df5d691c351a278480cc931bf"
-- 
2.0.3


