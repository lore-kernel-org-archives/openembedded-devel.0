Return-Path: <B40290@freescale.com>
X-Greylist: delayed 1397 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Apr 2015 07:53:33 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bbn0103.outbound.protection.outlook.com [157.56.111.103])
	by mail.openembedded.org (Postfix) with ESMTP id CD37C738EB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:53:33 +0000 (UTC)
Received: from BY2PR03CA005.namprd03.prod.outlook.com (10.255.93.22) by
	BL2PR03MB434.namprd03.prod.outlook.com (10.141.92.22) with Microsoft
	SMTP Server (TLS) id 15.1.148.15; Fri, 24 Apr 2015 07:53:33 +0000
Received: from BN1AFFO11FD044.protection.gbl (10.255.93.4) by
	BY2PR03CA005.outlook.office365.com (10.255.93.22) with Microsoft SMTP
	Server (TLS) id 15.1.148.16 via Frontend Transport;
	Fri, 24 Apr 2015 07:53:33 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD044.mail.protection.outlook.com (10.58.52.191) with
	Microsoft SMTP Server (TLS) id 15.1.154.14 via Frontend Transport;
	Fri, 24 Apr 2015 07:53:31 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t3O7rRsX001785;
	Fri, 24 Apr 2015 00:53:28 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Apr 2015 15:53:25 +0800
Message-ID: <1429862005-31991-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(229853001)(110136001)(104016003)(105606002)(85426001)(46102003)(50226001)(33646002)(50466002)(48376002)(86152002)(2351001)(6806004)(87936001)(47776003)(19580405001)(50986999)(106466001)(77096005)(92566002)(62966003)(450100001)(77156002)(36756003)(19580395003)(86362001)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB434;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB434;
X-Microsoft-Antispam-PRVS: <BL2PR03MB43456DF061F035FD3F2C4A784EC0@BL2PR03MB434.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006)(3002001); SRVR:BL2PR03MB434;
	BCL:0; PCL:0; RULEID:; SRVR:BL2PR03MB434; 
X-Forefront-PRVS: 05568D1FF7
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2015 07:53:31.1668 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR03MB434
Subject: [meta-oe][PATCH] fbset-modes: fix a warning about not existant S
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
X-List-Received-Date: Fri, 24 Apr 2015 07:53:36 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   Set the S variable to $WORKDIR to remove the warning about S being not
existant

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-support/fbset/fbset-modes.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/fbset/fbset-modes.bb b/meta-oe/recipes-support/fbset/fbset-modes.bb
index 1310e6f..88f7a4f 100644
--- a/meta-oe/recipes-support/fbset/fbset-modes.bb
+++ b/meta-oe/recipes-support/fbset/fbset-modes.bb
@@ -6,6 +6,7 @@ PV = "0.1.0"
 PR = "r6"
 
 SRC_URI = "file://fb.modes"
+S = "${WORKDIR}"
 
 do_install() {
     install -d ${D}${sysconfdir}
-- 
1.9.2


