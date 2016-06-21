Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 2042 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 Jun 2016 13:50:23 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0068.outbound.protection.outlook.com
	[104.47.37.68])
	by mail.openembedded.org (Postfix) with ESMTP id 466CF6010B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jun 2016 13:50:23 +0000 (UTC)
Received: from BL2NAM02FT019.eop-nam02.prod.protection.outlook.com
	(10.152.76.59) by BL2NAM02HT209.eop-nam02.prod.protection.outlook.com
	(10.152.77.74) with Microsoft SMTP Server (TLS) id 15.1.517.7;
	Tue, 21 Jun 2016 13:16:20 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT019.mail.protection.outlook.com (10.152.77.166) with
	Microsoft SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Tue, 21 Jun 2016 13:16:20 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:51280
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1bFLXM-00068O-RU
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2016 06:16:16 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>) id 1bFLXP-0004nR-EK
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Jun 2016 06:16:19 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u5LDGFRL010284; Tue, 21 Jun 2016 06:16:15 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1bFLXK-0004mQ-V9; Tue, 21 Jun 2016 06:16:15 -0700
From: Soren Brinkmann <soren.brinkmann@xilinx.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 21 Jun 2016 06:16:12 -0700
Message-ID: <20160621131612.3616-1-soren.brinkmann@xilinx.com>
X-Mailer: git-send-email 2.9.0.3.g94f1210
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22404.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(450100001)(11100500001)(87936001)(63266004)(50466002)(356003)(50986999)(575784001)(92566002)(86362001)(6806005)(110136002)(77096005)(9786002)(57986006)(48376002)(76506005)(107886002)(15650500001)(36756003)(8936002)(50226002)(586003)(81156014)(1076002)(4326007)(81166006)(189998001)(33646002)(106466001)(8676002)(5003940100001)(19580405001)(19580395003)(7846002)(47776003)(229853001)(2351001)(36386004)(2906002)(4001430100002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT209; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 46a03552-ce65-4d01-d971-08d399d63c57
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BL2NAM02HT209; 
X-Microsoft-Antispam-PRVS: <a4ec9b04f4ca42bab3cd9b45bebd333c@BL2NAM02HT209.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13023025)(13017025)(8121501046)(13015025)(13024025)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BL2NAM02HT209; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT209; 
X-Forefront-PRVS: 098076C36C
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2016 13:16:20.1938 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT209
Subject: [meta-oe][PATCH] analyze-suspend: Bump to latest Git version
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Jun 2016 13:50:26 -0000
Content-Type: text/plain

Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
---
 meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
index d97ff0a5bdd2..afbaaba07808 100644
--- a/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
+++ b/meta-oe/recipes-benchmark/analyze-suspend/analyze-suspend_git.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 RDEPENDS_${PN} += "python-core python-datetime python-stringold"
 
 PV = "3.2+gitr${SRCPV}"
-SRCREV = "bce3cbec43bc2ce7a8c79b210314dd9d9ac1010b"
+SRCREV = "c669e002a2e7504f21e277ad248fa81033926391"
 SRC_URI = "git://github.com/01org/suspendresume.git;protocol=https"
 S = "${WORKDIR}/git"
 
-- 
2.9.0.3.g94f1210


