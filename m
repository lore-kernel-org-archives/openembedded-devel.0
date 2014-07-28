Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id E276B6FE7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 19:26:54 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SJQtLw006726 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 14:26:55 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072814265544-326958 ;
	Mon, 28 Jul 2014 14:26:55 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jul 2014 14:26:36 -0500
Message-Id: <1406575596-15006-3-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.3
In-Reply-To: <1406575596-15006-1-git-send-email-ben.shelton@ni.com>
References: <1406575596-15006-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 02:26:55 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 02:26:55 PM,
	Serialize complete at 07/28/2014 02:26:55 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 3/3] xorg-fonts-misc: add recipe
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

Adding a packagegroup recipe to build both the misc-misc and cursor-misc
X.org fonts.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb

diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb
new file mode 100644
index 0000000..b2d1db7
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-misc.bb
@@ -0,0 +1,11 @@
+SUMMARY = "X.org misc font set"
+LICENSE = "PD"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "\
+	font-cursor-misc \
+	font-misc-misc \
+"
-- 
2.0.3


