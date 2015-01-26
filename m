Return-Path: <B40869@freescale.com>
X-Greylist: delayed 2012 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 26 Jan 2015 07:54:09 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0101.outbound.protection.outlook.com [157.56.111.101])
	by mail.openembedded.org (Postfix) with ESMTP id 56F1472646
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 07:54:09 +0000 (UTC)
Received: from BY2PR03CA007.namprd03.prod.outlook.com (10.255.93.24) by
	BY2PR0301MB0758.namprd03.prod.outlook.com (25.160.63.23) with Microsoft
	SMTP Server (TLS) id 15.1.59.20; Mon, 26 Jan 2015 07:20:36 +0000
Received: from BN1AFFO11FD029.protection.gbl (10.255.93.4) by
	BY2PR03CA007.outlook.office365.com (10.255.93.24) with Microsoft SMTP
	Server (TLS) id 15.1.65.19 via Frontend Transport;
	Mon, 26 Jan 2015 07:20:35 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD029.mail.protection.outlook.com (10.58.52.184) with
	Microsoft SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Mon, 26 Jan 2015 07:20:35 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0Q7KWWg022281; Mon, 26 Jan 2015 00:20:33 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Jan 2015 15:20:29 +0800
Message-ID: <1422256829-16034-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=b40869@freescale.com; freescale.mail.onmicrosoft.com;
	dkim=none
	(message not signed) header.d=none;freescale.mail.onmicrosoft.com;
	dmarc=permerror action=none header.from=freescale.com;
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(33646002)(6806004)(19580395003)(2351001)(110136001)(229853001)(77096005)(46102003)(106466001)(105606002)(50226001)(92566002)(86362001)(36756003)(450100001)(62966003)(50986999)(104016003)(85426001)(87936001)(48376002)(50466002)(77156002)(47776003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0758;
	H:tx30smr01.am.freescale.net; FPR:; SPF:None; MLV:sfv; LANG:; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BY2PR0301MB0758;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY2PR0301MB0758; 
X-Forefront-PRVS: 0468FE4A2B
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB0758; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2015 07:20:35.6341 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0758
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-oe][PATCH] tclap: add ALLOW_EMPTY in bb file
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
X-List-Received-Date: Mon, 26 Jan 2015 07:54:14 -0000
Content-Type: text/plain

---
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
index c6bedea..ab15a7e 100644
--- a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -11,4 +11,6 @@ SRC_URI = "git://git.code.sf.net/p/tclap/code \
 S = "${WORKDIR}/git"
 inherit autotools
 
+ALLOW_EMPTY_${PN} = "1"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.2


