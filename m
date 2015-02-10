Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 925 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 10 Feb 2015 07:08:48 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1bn0101.outbound.protection.outlook.com [157.56.110.101])
	by mail.openembedded.org (Postfix) with ESMTP id 498A4601A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 07:08:48 +0000 (UTC)
Received: from BY2PR03CA009.namprd03.prod.outlook.com (10.255.93.26) by
	CY1PR0301MB0715.namprd03.prod.outlook.com (25.160.159.145) with
	Microsoft
	SMTP Server (TLS) id 15.1.75.20; Tue, 10 Feb 2015 06:53:23 +0000
Received: from BL2FFO11FD035.protection.gbl (10.255.93.4) by
	BY2PR03CA009.outlook.office365.com (10.255.93.26) with Microsoft SMTP
	Server (TLS) id 15.1.81.19 via Frontend Transport;
	Tue, 10 Feb 2015 06:53:22 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD035.mail.protection.outlook.com (10.173.161.131) with
	Microsoft
	SMTP Server (TLS) id 15.1.87.10 via Frontend Transport; Tue, 10 Feb 2015
	06:53:21 +0000
Received: from sweet.ap.freescale.net (sweet.ap.freescale.net [10.193.20.55])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	t1A6rJZL019766; Mon, 9 Feb 2015 23:53:20 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 10 Feb 2015 14:55:10 +0800
Message-ID: <1423551310-1863-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 2.1.0
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=zhenhua.luo@freescale.com; freescale.mail.onmicrosoft.com;
	dkim=none (message not signed) header.d=none;
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(50226001)(87936001)(6806004)(19580405001)(19580395003)(86362001)(85426001)(46102003)(36756003)(2351001)(77156002)(106466001)(62966003)(105606002)(110136001)(229853001)(450100001)(77096005)(104016003)(33646002)(47776003)(50986999)(50466002)(48376002)(92566002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB0715;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:CY1PR0301MB0715;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:CY1PR0301MB0715; 
X-Forefront-PRVS: 048396AFA0
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB0715; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2015 06:53:21.7545 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0715
Subject: [meta-oe][PATCH] python-pip: add python-distribute in RDEPENDS
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
X-List-Received-Date: Tue, 10 Feb 2015 07:08:57 -0000
Content-Type: text/plain

Fix the following runtime issue of pip:
    # pip
    Traceback (most recent call last):
      File "/usr/bin/pip", line 5, in <module>
        from pkg_resources import load_entry_point
    ImportError: No module named pkg_resources

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta-python/recipes-devtools/python/python-pip_1.3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pip_1.3.1.bb b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
index d1a7c8b..1388a3d 100644
--- a/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-pip_1.3.1.bb
@@ -11,4 +11,4 @@ S = "${WORKDIR}/pip-${PV}"
 inherit setuptools
 
 # Since PIP is like CPAN for PERL we need to drag in all python modules to ensure everything works
-RDEPENDS_${PN} = "python-modules"
+RDEPENDS_${PN} = "python-modules python-distribute"
-- 
2.1.0


