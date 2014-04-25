Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id C049865D92
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 19:55:13 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s3PJtEFL008815 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 14:55:14 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014042514551468-264746 ;
	Fri, 25 Apr 2014 14:55:14 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Apr 2014 14:53:33 -0500
Message-Id: <1398455613-27167-1-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 1.9.2
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP5|July 31, 2013) at 04/25/2014 02:55:14 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP5|July
	31, 2013) at 04/25/2014 02:55:14 PM,
	Serialize complete at 04/25/2014 02:55:14 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-04-25_05:2014-04-25, 2014-04-25,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH] xwd: add recipe
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
X-List-Received-Date: Fri, 25 Apr 2014 19:55:16 -0000

Adding a recipe for the X Window Dump tool, a lightweight tool that is
useful for taking screenshots on embedded targets.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
new file mode 100644
index 0000000..b73afe1
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xwd_1.0.6.bb
@@ -0,0 +1,11 @@
+SUMMARY = "xwd is a tool to capture an X window or screen to file"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xwd/"
+SECTION = "x11/app"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c0cdb783e9a0198237371fdaa26a18bf"
+DEPENDS = "libxmu"
+
+SRC_URI[md5sum] = "6b5d48464c5f366e91efd08b62b12d94"
+SRC_URI[sha256sum] = "3bb396a2268d78de4b1c3e5237a85f7849d3434e87b3cd1f4d57eef614227d79"
+
+require recipes-graphics/xorg-app/xorg-app-common.inc
-- 
1.9.2


