Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 15A5B708AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 19:18:11 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6SJICF1000998 for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jul 2014 14:18:12 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072814181227-326620 ;
	Mon, 28 Jul 2014 14:18:12 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Jul 2014 14:17:49 -0500
Message-Id: <1406575069-6575-3-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.3
In-Reply-To: <1406575069-6575-1-git-send-email-ben.shelton@ni.com>
References: <1406575069-6575-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 02:18:12 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/28/2014 02:18:12 PM,
	Serialize complete at 07/28/2014 02:18:12 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-28_03:2014-07-28, 2014-07-28,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 3/3] xmag: add recipe
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

The xmag utility magnifies the pixels rendered on-screen and is useful
for examining bitmaps and matching font metrics.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-app/xmag_1.0.5.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xmag_1.0.5.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/xmag_1.0.5.bb b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.5.bb
new file mode 100644
index 0000000..d577421
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xmag_1.0.5.bb
@@ -0,0 +1,11 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "xmag is a tool to magnify parts of the screen"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/xmag/"
+SECTION = "x11/app"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3413fe6832380b44b69b172d2d1b2387"
+DEPENDS += " libxaw libxt"
+
+SRC_URI[md5sum] = "280b81cb09d1903aa868a058d90128ad"
+SRC_URI[sha256sum] = "4ace8795cf756be4ba387f30366045594ce26adda2f5ffe1f8e896825d0932c6"
-- 
2.0.3


