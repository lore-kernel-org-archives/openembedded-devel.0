Return-Path: <ben.shelton@ni.com>
Received: from ni.com (unknown [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id D4A3965FE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 18:20:37 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	s4CHW7Um010118 for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 12:32:07 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP5)
	with ESMTP id 2014051212320777-1004973 ;
	Mon, 12 May 2014 12:32:07 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 12:31:48 -0500
Message-Id: <139978ea7125a5ffb15a583faef889b1409e3987.1399914295.git.ben.shelton@ni.com>
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
Subject: [meta-oe][PATCH 1/7] bdftopcf: add recipe
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
X-List-Received-Date: Mon, 12 May 2014 18:20:48 -0000

The bdftopcf tool is necessary to build the core X fonts, which ship in
BDF format.  Adapted from a recipe in OE-Classic and from an earlier
mailing list post by Trevor Woerner.

Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb

diff --git a/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
new file mode 100644
index 0000000..5009d54
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/bdftopcf_1.0.4.bb
@@ -0,0 +1,13 @@
+require recipes-graphics/xorg-app/xorg-app-common.inc
+
+SUMMARY = "bdftopcf is a tool to convert BDF fonts to PCF fonts"
+HOMEPAGE = "http://cgit.freedesktop.org/xorg/app/bdftopcf/"
+SECTION = "x11/app"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9a35333adf75edd1eaef84bca65a490"
+DEPENDS = "libxfont"
+
+SRC_URI[md5sum] = "96a648a332160a7482885800f7a506fa"
+SRC_URI[sha256sum] = "eaf59057ba3d7cffe29526562ce50868da7da823487a4cfb3e16946e5ffd2798"
+
+BBCLASSEXTEND = "native"
-- 
1.9.3


