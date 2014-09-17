Return-Path: <B40869@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0125.outbound.protection.outlook.com [207.46.100.125])
	by mail.openembedded.org (Postfix) with ESMTP id DF09671441
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 03:20:22 +0000 (UTC)
Received: from DM2PR03CA0036.namprd03.prod.outlook.com (10.141.96.35) by
	CY1PR0301MB0764.namprd03.prod.outlook.com (25.160.160.12) with
	Microsoft SMTP
	Server (TLS) id 15.0.1024.12; Wed, 17 Sep 2014 03:20:21 +0000
Received: from BY2FFO11FD052.protection.gbl (2a01:111:f400:7c0c::192) by
	DM2PR03CA0036.outlook.office365.com (2a01:111:e400:2428::35) with
	Microsoft SMTP Server (TLS) id 15.0.1024.12 via Frontend Transport;
	Wed, 17 Sep 2014 03:20:21 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD052.mail.protection.outlook.com (10.1.15.189) with Microsoft
	SMTP
	Server (TLS) id 15.0.1019.14 via Frontend Transport; Wed, 17 Sep 2014
	03:20:17 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s8H3KApd015836; Tue, 16 Sep 2014 20:20:14 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Sep 2014 11:10:04 +0800
Message-ID: <1410923404-1311-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(15395725005)(20776003)(47776003)(105606002)(107046002)(102836001)(62966002)(229853001)(86362001)(97736003)(19580395003)(15202345003)(84676001)(4396001)(85306004)(87936001)(68736004)(50986999)(2351001)(33646002)(15975445006)(76482002)(50466002)(44976005)(85852003)(88136002)(21056001)(48376002)(92566001)(83072002)(93916002)(104166001)(74502003)(46102003)(79102003)(110136001)(64706001)(95666004)(83322001)(106466001)(89996001)(6806004)(92726001)(19580405001)(81342003)(77156001)(31966008)(77982003)(80022003)(87286001)(36756003)(90102001)(50226001)(104016003)(74662003)(99396002)(26826002)(81542003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0764;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;
X-Forefront-PRVS: 0337AFFE9A
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-networking][PATCH V3] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Wed, 17 Sep 2014 03:20:31 -0000
Content-Type: text/plain

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb

diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
new file mode 100644
index 0000000..7c03dd6
--- /dev/null
+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
@@ -0,0 +1,10 @@
+SUMMARY = "pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon."
+HOMEPAGE = "http://troglobit.com/pimd.html"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
+
+SRC_URI = "ftp://troglobit.com/pimd/${BP}.tar.bz2"
+SRC_URI[md5sum] = "a12448bc7c9bfcebf51a13ebf1ffa962"
+SRC_URI[sha256sum] = "3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8fb080126009"
+
+CFLAGS_prepend = "-I ${S}/include "
-- 
1.9.2


