Return-Path: <ben.shelton@ni.com>
Received: from ni.com (unknown [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 64CD260167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 17:56:38 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s4CHW8r9010121 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 12:32:08 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014051212320787-1004979 ;
	Mon, 12 May 2014 12:32:07 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 12:31:54 -0500
Message-Id: <947b0227c967de641b862489ccb173241e42bf51.1399914295.git.ben.shelton@ni.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1399914295.git.ben.shelton@ni.com>
References: <cover.1399914295.git.ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP5|July 31, 2013) at 05/12/2014 12:32:08 PM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP5|July
	31, 2013) at 05/12/2014 12:32:08 PM,
	Serialize complete at 05/12/2014 12:32:08 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.11.96, 1.0.14,
	0.0.0000
	definitions=2014-05-12_03:2014-05-12, 2014-05-12,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 7/7] xorg-fonts-100dpi: add recipe
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
X-List-Received-Date: Mon, 12 May 2014 17:56:39 -0000

Adding a packagegroup recipe to build all the core 100dpi X fonts.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb

diff --git a/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
new file mode 100644
index 0000000..aacf379
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-font/xorg-fonts-100dpi.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Xorg 100 DPI font set"
+LICENSE = "Custom"
+
+inherit packagegroup
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "\
+	font-adobe-100dpi \
+	font-adobe-utopia-100dpi \
+	font-bh-100dpi \
+	font-bh-lucidatypewriter-100dpi \
+	font-bitstream-100dpi \
+"
-- 
1.9.3


