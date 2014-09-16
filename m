Return-Path: <B40869@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0112.outbound.protection.outlook.com [65.55.169.112])
	by mail.openembedded.org (Postfix) with ESMTP id 0FD0A7117E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Sep 2014 03:00:27 +0000 (UTC)
Received: from CH1PR03CA004.namprd03.prod.outlook.com (10.255.156.149) by
	DM2PR0301MB0766.namprd03.prod.outlook.com (25.160.97.15) with Microsoft
	SMTP Server (TLS) id 15.0.1024.12; Tue, 16 Sep 2014 03:00:33 +0000
Received: from BN1AFFO11FD056.protection.gbl (10.255.156.132) by
	CH1PR03CA004.outlook.office365.com (10.255.156.149) with Microsoft SMTP
	Server (TLS) id 15.0.1029.13 via Frontend Transport; Tue, 16 Sep 2014
	03:00:20 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD056.mail.protection.outlook.com (10.58.53.71) with Microsoft
	SMTP
	Server (TLS) id 15.0.1019.14 via Frontend Transport; Tue, 16 Sep 2014
	03:00:20 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s8G30FB0005119; Mon, 15 Sep 2014 20:00:18 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 16 Sep 2014 10:48:58 +0800
Message-ID: <1410835738-27343-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(85306004)(31966008)(106466001)(50226001)(15975445006)(93916002)(86362001)(19580405001)(97736003)(4396001)(76482001)(107046002)(84676001)(90102001)(99396002)(19580395003)(92726001)(87286001)(15395725005)(26826002)(36756003)(6806004)(50986999)(102836001)(44976005)(95666004)(104166001)(15202345003)(68736004)(92566001)(21056001)(50466002)(48376002)(64706001)(110136001)(33646002)(47776003)(20776003)(229853001)(2351001)(83322001)(89996001)(62966002)(88136002)(105606002)(85852003)(104016003)(87936001)(81542003)(81342003)(79102003)(77982003)(74502003)(80022003)(83072002)(46102003)(77156001)(74662003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB0766;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;
X-Forefront-PRVS: 03361FCC43
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-networking][PATCH] pimd: add recipe for pimd-2.1.8
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
X-List-Received-Date: Tue, 16 Sep 2014 03:00:35 -0000
Content-Type: text/plain

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-networking/recipes-support/pimd/pimd_2.1.8.bb | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta-networking/recipes-support/pimd/pimd_2.1.8.bb

diff --git a/meta-networking/recipes-support/pimd/pimd_2.1.8.bb b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
new file mode 100644
index 0000000..4d1137f
--- /dev/null
+++ b/meta-networking/recipes-support/pimd/pimd_2.1.8.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "pimd is a lightweight stand-alone PIM-SM v2 multicast routing daemon."
+HOMEPAGE = "http://troglobit.com/pimd.html"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94f108f91fab720d62425770b70dd790"
+
+SRC_URI = "ftp://troglobit.com/pimd/pimd-2.1.8.tar.bz2"
+SRC_URI[md5sum] = "a12448bc7c9bfcebf51a13ebf1ffa962"
+
+CFLAGS_prepend = "-I ${S}/include "
-- 
1.9.2


