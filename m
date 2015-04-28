Return-Path: <B40290@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0142.outbound.protection.outlook.com [207.46.100.142])
	by mail.openembedded.org (Postfix) with ESMTP id 2B29565CD0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 03:31:25 +0000 (UTC)
Received: from BLUPR0301CA0005.namprd03.prod.outlook.com (25.162.113.143) by
	BLUPR03MB1362.namprd03.prod.outlook.com (25.163.80.28) with Microsoft
	SMTP Server (TLS) id 15.1.148.16; Tue, 28 Apr 2015 03:16:43 +0000
Received: from BY2FFO11FD029.protection.gbl (2a01:111:f400:7c0c::189) by
	BLUPR0301CA0005.outlook.office365.com (2a01:111:e400:5259::15) with
	Microsoft SMTP Server (TLS) id 15.1.130.23 via Frontend Transport;
	Tue, 28 Apr 2015 03:16:43 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD029.mail.protection.outlook.com (10.1.14.212) with Microsoft
	SMTP Server (TLS) id 15.1.154.14 via Frontend Transport;
	Tue, 28 Apr 2015 03:16:43 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t3S3GeBB021018;
	Mon, 27 Apr 2015 20:16:41 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Apr 2015 11:16:37 +0800
Message-ID: <1430190997-29577-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(50226001)(2351001)(16601075003)(19580405001)(48376002)(86362001)(104016003)(19580395003)(6806004)(229853001)(33646002)(110136001)(46102003)(50986999)(92566002)(50466002)(450100001)(15975445007)(106466001)(36756003)(105606002)(85426001)(86152002)(47776003)(77156002)(77096005)(87936001)(62966003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB1362;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB1362;
X-Microsoft-Antispam-PRVS: <BLUPR03MB136228EACA2E67E4AD846FAC84E80@BLUPR03MB1362.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006)(3002001); SRVR:BLUPR03MB1362;
	BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB1362; 
X-Forefront-PRVS: 0560A2214D
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2015 03:16:43.2252 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB1362
Subject: [meta-networking][fido][PATCH] netcat-openbsd: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 28 Apr 2015 03:31:26 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
index 4237dc4..12409d4 100644
--- a/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
+++ b/meta-networking/recipes-support/netcat/netcat-openbsd_1.105.bb
@@ -2,6 +2,7 @@ require netcat.inc
 SUMMARY = "OpenBSD Netcat"
 HOMEPAGE = "http://ftp.debian.org"
 LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=ee6bbaacb5db5f2973818f0902c3ae6f"
 
 DEPENDS += "glib-2.0 libbsd"
 
-- 
1.9.2


