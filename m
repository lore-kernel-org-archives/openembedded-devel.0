Return-Path: <B40869@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0140.outbound.protection.outlook.com [157.56.110.140])
	by mail.openembedded.org (Postfix) with ESMTP id C9123714C2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Sep 2014 03:24:29 +0000 (UTC)
Received: from CY1PR0301MB0763.namprd03.prod.outlook.com (25.160.160.11) by
	CY1PR0301MB1194.namprd03.prod.outlook.com (25.160.165.25) with
	Microsoft SMTP
	Server (TLS) id 15.0.1024.12; Wed, 17 Sep 2014 03:24:29 +0000
Received: from BN3PR0301CA0045.namprd03.prod.outlook.com (25.160.152.141) by
	CY1PR0301MB0763.namprd03.prod.outlook.com (25.160.160.11) with
	Microsoft SMTP
	Server (TLS) id 15.0.1024.12; Wed, 17 Sep 2014 03:24:27 +0000
Received: from BN1AFFO11FD060.protection.gbl (2a01:111:f400:7c10::106) by
	BN3PR0301CA0045.outlook.office365.com (2a01:111:e400:401e::13) with
	Microsoft SMTP Server (TLS) id 15.0.1029.13 via Frontend Transport;
	Wed, 17 Sep 2014 03:24:05 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD060.mail.protection.outlook.com (10.58.53.75) with Microsoft
	SMTP
	Server (TLS) id 15.0.1019.14 via Frontend Transport; Wed, 17 Sep 2014
	03:24:06 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s8H3Nron018322; Tue, 16 Sep 2014 20:23:59 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Sep 2014 11:13:42 +0800
Message-ID: <1410923622-13103-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(104166001)(95666004)(36756003)(4396001)(97736003)(31966008)(107046002)(48376002)(68736004)(105606002)(15202345003)(50226001)(93916002)(26826002)(85306004)(20776003)(83072002)(90102001)(92726001)(86362001)(89996001)(2351001)(19580405001)(110136001)(33646002)(229853001)(19580395003)(81342003)(106466001)(74502003)(104016003)(74662003)(79102003)(21056001)(77156001)(87286001)(15975445006)(85852003)(87936001)(44976005)(50466002)(88136002)(84676001)(50986999)(83322001)(102836001)(80022003)(6806004)(92566001)(64706001)(99396002)(76482002)(47776003)(62966002)(81542003)(46102003)(77982003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0763;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;UriScan:;
X-Forefront-PRVS: 0337AFFE9A
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;
X-OriginatorOrg: freescale.com
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-networking][PATCH] pimd: add recipe for ssmping-0.9.1
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
X-List-Received-Date: Wed, 17 Sep 2014 03:24:32 -0000
Content-Type: text/plain

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb

diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
new file mode 100644
index 0000000..ec56024
--- /dev/null
+++ b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
@@ -0,0 +1,10 @@
+SUMMARY = "ssmping is a tool for checking whether one can receive SSM from a given host"
+HOMEPAGE = "http://www.venaas.no/multicast/ssmping/"
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://asmping.c;beginline=2;endline=11;md5=1ca8d1a1ca931e5cfe604ebf20a78b71"
+
+SRC_URI = "http://www.venaas.no/multicast/ssmping/${BP}.tar.gz"
+SRC_URI[md5sum] = "ad8e3d13f6d72918f73be7e7975d7fad"
+SRC_URI[sha256sum] = "22103a37eaa28489169a0927bc01e0596c3485fc4d29fc8456c07fd2c70fca6d"
+
+CFLAGS_prepend = "-D_GNU_SOURCE "
-- 
1.9.2


