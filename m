Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0106.outbound.protection.outlook.com [157.56.110.106])
	by mail.openembedded.org (Postfix) with ESMTP id 559A3716CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 05:25:30 +0000 (UTC)
Received: from BLUPR0301CA0026.namprd03.prod.outlook.com (25.162.113.164) by
	BN3PR03MB1365.namprd03.prod.outlook.com (25.163.34.151) with Microsoft
	SMTP Server (TLS) id 15.1.148.16; Tue, 28 Apr 2015 05:25:30 +0000
Received: from BL2FFO11FD042.protection.gbl (2a01:111:f400:7c09::167) by
	BLUPR0301CA0026.outlook.office365.com (2a01:111:e400:5259::36) with
	Microsoft SMTP Server (TLS) id 15.1.130.23 via Frontend Transport;
	Tue, 28 Apr 2015 05:25:30 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD042.mail.protection.outlook.com (10.173.161.138) with
	Microsoft SMTP Server (TLS) id 15.1.154.14 via Frontend Transport;
	Tue, 28 Apr 2015 05:25:29 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t3S5PP5w001507;
	Mon, 27 Apr 2015 22:25:26 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Apr 2015 13:25:23 +0800
Message-ID: <1430198723-7927-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(104016003)(106466001)(105606002)(229853001)(2351001)(450100001)(110136001)(62966003)(77156002)(46102003)(77096005)(92566002)(50226001)(86362001)(50986999)(19580395003)(48376002)(36756003)(47776003)(85426001)(19580405001)(87936001)(6806004)(50466002)(86152002)(33646002)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR03MB1365;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR03MB1365;
X-Microsoft-Antispam-PRVS: <BN3PR03MB136525760C0265C9A6B3C66C84E80@BN3PR03MB1365.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006)(3002001); SRVR:BN3PR03MB1365;
	BCL:0; PCL:0; RULEID:; SRVR:BN3PR03MB1365; 
X-Forefront-PRVS: 0560A2214D
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2015 05:25:29.5021 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR03MB1365
Subject: [meta-networking][fido][PATCH] lmsensors-config: fix a warning about not existant S
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
X-List-Received-Date: Tue, 28 Apr 2015 05:25:31 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  Set the S variable to $WORKDIR to remove the warning about S being not existant
  (which is true for this package, since there are no original sources for it).

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index 343971f..fe2f499 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -11,6 +11,7 @@ SRC_URI = "file://fancontrol \
            file://sensord.conf \
            file://sensors.conf \
 "
+S = "${WORKDIR}"
 
 RDEPENDS_${PN}-dev = ""
 
-- 
1.9.2


