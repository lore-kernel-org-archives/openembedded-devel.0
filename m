Return-Path: <B40869@freescale.com>
X-Greylist: delayed 911 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Sep 2014 03:04:18 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0104.outbound.protection.outlook.com [207.46.100.104])
	by mail.openembedded.org (Postfix) with ESMTP id 36B716B8F6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 03:04:18 +0000 (UTC)
Received: from BY2PR03CA067.namprd03.prod.outlook.com (10.141.249.40) by
	BY2PR0301MB0760.namprd03.prod.outlook.com (25.160.63.24) with Microsoft
	SMTP Server (TLS) id 15.0.1019.16; Wed, 17 Sep 2014 02:49:06 +0000
Received: from BN1AFFO11FD039.protection.gbl (2a01:111:f400:7c10::193) by
	BY2PR03CA067.outlook.office365.com (2a01:111:e400:2c5d::40) with
	Microsoft SMTP Server (TLS) id 15.0.1029.13 via Frontend Transport;
	Wed, 17 Sep 2014 02:49:05 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD039.mail.protection.outlook.com (10.58.52.243) with
	Microsoft SMTP
	Server (TLS) id 15.0.1019.14 via Frontend Transport; Wed, 17 Sep 2014
	02:49:05 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s8H2mw5F025096; Tue, 16 Sep 2014 19:49:00 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Sep 2014 10:38:45 +0800
Message-ID: <1410921525-20513-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(88136002)(84676001)(44976005)(87286001)(36756003)(83322001)(93916002)(110136001)(74502003)(68736004)(85852003)(74662003)(81342003)(92726001)(80022003)(77982003)(86362001)(90102001)(62966002)(92566001)(46102003)(81542003)(50986999)(97736003)(50466002)(2351001)(76482002)(33646002)(47776003)(87936001)(105606002)(95666004)(50226001)(85306004)(104016003)(6806004)(19580395003)(106466001)(15975445006)(20776003)(102836001)(21056001)(31966008)(19580405001)(229853001)(107046002)(104166001)(77156001)(48376002)(99396002)(4396001)(64706001)(26826002)(15395725005)(83072002)(79102003)(15202345003)(89996001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0760;
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
Subject: [meta-networking][PATCH V2] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Wed, 17 Sep 2014 03:04:23 -0000
Content-Type: text/plain

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb

diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
new file mode 100644
index 0000000..0cb7979
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
+SRC_URI[sha256] = "3379436c16caccdef9b40a49fbdfdbb45aad8ecb05870834490b8fb080126009"
+
+CFLAGS_prepend = "-I ${S}/include "
-- 
1.9.2


