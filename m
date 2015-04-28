Return-Path: <B40290@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0138.outbound.protection.outlook.com [157.56.110.138])
	by mail.openembedded.org (Postfix) with ESMTP id BB66B716CE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Apr 2015 05:49:36 +0000 (UTC)
Received: from BLUPR0301CA0028.namprd03.prod.outlook.com (25.162.113.166) by
	BY2PR03MB441.namprd03.prod.outlook.com (10.141.141.142) with Microsoft
	SMTP Server (TLS) id 15.1.148.15; Tue, 28 Apr 2015 05:33:40 +0000
Received: from BN1BFFO11FD012.protection.gbl (2a01:111:f400:7c10::1:128) by
	BLUPR0301CA0028.outlook.office365.com (2a01:111:e400:5259::38) with
	Microsoft SMTP Server (TLS) id 15.1.130.23 via Frontend Transport;
	Tue, 28 Apr 2015 05:33:38 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD012.mail.protection.outlook.com (10.58.144.75) with
	Microsoft SMTP Server (TLS) id 15.1.154.14 via Frontend Transport;
	Tue, 28 Apr 2015 05:33:37 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t3S5XYvx007599;
	Mon, 27 Apr 2015 22:33:35 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 Apr 2015 13:33:32 +0800
Message-ID: <1430199212-16711-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(50226001)(19580405001)(77096005)(230783001)(450100001)(85426001)(106466001)(47776003)(6806004)(104016003)(105606002)(46102003)(110136001)(2351001)(86152002)(19580395003)(77156002)(5001920100001)(62966003)(86362001)(33646002)(87936001)(48376002)(50466002)(229853001)(36756003)(92566002)(50986999)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB441;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY2PR03MB441;
X-Microsoft-Antispam-PRVS: <BY2PR03MB44189E5B1FA46FC2273C2CB84E80@BY2PR03MB441.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010)(3002001); SRVR:BY2PR03MB441;
	BCL:0; PCL:0; RULEID:; SRVR:BY2PR03MB441; 
X-Forefront-PRVS: 0560A2214D
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2015 05:33:37.9250 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB441
Subject: [meta-networking][fido][PATCH] lmsensors-config: add rrdtool to lmsensors-config-cgi RDEPENDS
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
X-List-Received-Date: Tue, 28 Apr 2015 05:49:43 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  QA reports a warning because lmsensors-config-cgi uses rrdtool, but does not declare runtime dependency on it.
  Add rrdtool to RDEPENDS_${PN}-cgi.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
index fe2f499..df834a3 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors-config_1.0.bb
@@ -46,7 +46,7 @@ PACKAGES =+ "${PN}-fancontrol"
 # sensord web cgi support
 PACKAGES =+ "${PN}-cgi"
 RRECOMMENDS_${PN}-cgi = "lighttpd lighttpd-module-cgi"
-RDEPENDS_${PN}-cgi = "${PN}-sensord"
+RDEPENDS_${PN}-cgi = "${PN}-sensord rrdtool"
 FILES_${PN}-cgi = "/www/*" 
 
 # libsensors configuration file
-- 
1.9.2


