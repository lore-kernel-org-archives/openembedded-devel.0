Return-Path: <B40869@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0122.outbound.protection.outlook.com [65.55.169.122])
	by mail.openembedded.org (Postfix) with ESMTP id EFBC070EF1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Sep 2014 05:58:02 +0000 (UTC)
Received: from DM2PR03CA0024.namprd03.prod.outlook.com (10.141.96.23) by
	DM2PR0301MB0768.namprd03.prod.outlook.com (25.160.97.151) with
	Microsoft SMTP
	Server (TLS) id 15.0.1029.13; Fri, 19 Sep 2014 05:58:01 +0000
Received: from BY2FFO11FD033.protection.gbl (2a01:111:f400:7c0c::111) by
	DM2PR03CA0024.outlook.office365.com (2a01:111:e400:2428::23) with
	Microsoft SMTP Server (TLS) id 15.0.1024.12 via Frontend Transport;
	Fri, 19 Sep 2014 05:58:00 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD033.mail.protection.outlook.com (10.1.14.218) with Microsoft
	SMTP
	Server (TLS) id 15.0.1029.15 via Frontend Transport; Fri, 19 Sep 2014
	05:58:00 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s8J5vsln019629;
	Thu, 18 Sep 2014 22:57:57 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Sep 2014 13:47:40 +0800
Message-ID: <1411105660-19048-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(21056001)(50226001)(31966008)(87286001)(76482002)(4396001)(81542003)(104016003)(90102001)(26826002)(15395725005)(99396002)(20776003)(97736003)(44976005)(48376002)(2351001)(81342003)(80022003)(83322001)(79102003)(106466001)(33646002)(85306004)(88136002)(86362001)(92726001)(19580405001)(62966002)(83072002)(64706001)(6806004)(229853001)(47776003)(93916002)(87936001)(68736004)(102836001)(105606002)(81156004)(110136001)(107046002)(50986999)(69596002)(15975445006)(50466002)(46102003)(74502003)(92566001)(36756003)(74662003)(19580395003)(15202345003)(89996001)(95666004)(84676001)(77156001)(77982003)(85852003)(104166001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0768;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;
X-Forefront-PRVS: 0339F89554
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B40869@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-networking][PATCH v4] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Fri, 19 Sep 2014 05:58:09 -0000
Content-Type: text/plain

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb

diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
new file mode 100644
index 0000000..e73d4f5
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
+CFLAGS += "-I ${S}/include "
-- 
1.9.2


