Return-Path: <B40869@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0136.outbound.protection.outlook.com [65.55.169.136])
	by mail.openembedded.org (Postfix) with ESMTP id 821F1601A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:31:03 +0000 (UTC)
Received: from CO2PR03CA0026.namprd03.prod.outlook.com (10.141.194.153) by
	BY2PR0301MB0758.namprd03.prod.outlook.com (25.160.63.23) with Microsoft
	SMTP Server (TLS) id 15.0.1034.13; Wed, 24 Sep 2014 02:31:03 +0000
Received: from BY2FFO11FD005.protection.gbl (2a01:111:f400:7c0c::191) by
	CO2PR03CA0026.outlook.office365.com (2a01:111:e400:1414::25) with
	Microsoft SMTP Server (TLS) id 15.0.1034.13 via Frontend Transport;
	Wed, 24 Sep 2014 02:31:02 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD005.mail.protection.outlook.com (10.1.14.126) with Microsoft
	SMTP
	Server (TLS) id 15.0.1029.15 via Frontend Transport; Wed, 24 Sep 2014
	02:31:02 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s8O2UxmA005541; Tue, 23 Sep 2014 19:31:00 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 24 Sep 2014 10:30:48 +0800
Message-ID: <1411525848-1105-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(189002)(199003)(88136002)(21056001)(77156001)(87936001)(85306004)(105606002)(76482002)(47776003)(50466002)(36756003)(50986999)(99396002)(20776003)(48376002)(84676001)(95666004)(89996001)(46102003)(97736003)(80022003)(6806004)(64706001)(110136001)(33646002)(92566001)(4396001)(81542003)(104166001)(83072002)(19580395003)(31966008)(77982003)(19580405001)(90102001)(15202345003)(2351001)(86362001)(83322001)(15975445006)(74502003)(107046002)(87286001)(81342003)(74662003)(44976005)(229853001)(120916001)(106466001)(10300001)(93916002)(92726001)(50226001)(104016003)(68736004)(62966002)(79102003)(102836001)(85852003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0758;
	H:tx30smr01.am.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BY2PR0301MB0758;
X-Forefront-PRVS: 03449D5DD1
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-networking][PATCH v2] ssmping: add recipe for ssmping-0.9.1
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
X-List-Received-Date: Wed, 24 Sep 2014 02:31:13 -0000
Content-Type: text/plain

Signed-off-by: YangHaibo <b40869@freescale.com>
---
 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb

diff --git a/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb b/meta-networking/recipes-support/ssmping/ssmping_0.9.1.bb
new file mode 100644
index 0000000..06d6d28
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
+CFLAGS += "-D_GNU_SOURCE "
-- 
1.9.2


