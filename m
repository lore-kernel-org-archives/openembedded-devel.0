Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0133.outbound.protection.outlook.com [207.46.100.133])
	by mail.openembedded.org (Postfix) with ESMTP id F2190724EB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 08:23:27 +0000 (UTC)
Received: from BN3PR0301MB1186.namprd03.prod.outlook.com (25.160.156.148) by
	BN3PR0301MB0881.namprd03.prod.outlook.com (25.160.155.143) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20; Wed, 21 Jan 2015 08:23:27 +0000
Received: from BN3PR0301CA0059.namprd03.prod.outlook.com (25.160.152.155) by
	BN3PR0301MB1186.namprd03.prod.outlook.com (25.160.156.148) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20; Wed, 21 Jan 2015 08:23:22 +0000
Received: from BN1AFFO11FD034.protection.gbl (2a01:111:f400:7c10::161) by
	BN3PR0301CA0059.outlook.office365.com (2a01:111:e400:401e::27) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20 via Frontend Transport; Wed, 21 Jan 2015
	08:23:22 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD034.mail.protection.outlook.com (10.58.52.158) with
	Microsoft SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Wed, 21 Jan 2015 08:23:21 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0L8NEet017727; Wed, 21 Jan 2015 01:23:19 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Jan 2015 16:23:04 +0800
Message-ID: <1421828586-19021-3-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <1421828586-19021-1-git-send-email-b28495@freescale.com>
References: <1421828586-19021-1-git-send-email-b28495@freescale.com>
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(86152002)(85426001)(2351001)(47776003)(64706001)(36756003)(92566002)(97736003)(229853001)(33646002)(50466002)(104016003)(106466001)(77156002)(50986999)(50226001)(76176999)(62966003)(2950100001)(19580395003)(230783001)(87936001)(110136001)(6806004)(77096005)(105606002)(68736005)(48376002)(19580405001)(46102003)(450100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1186;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BN3PR0301MB1186;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN3PR0301MB1186; 
X-Forefront-PRVS: 04631F8F77
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1186; 
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2015 08:23:21.1811 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1186
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BN3PR0301MB0881;
X-OriginatorOrg: freescale.com
Subject: [meta-java][PATCH 2/4] openjdk-6: pass option --disable-system-lcms
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
X-List-Received-Date: Wed, 21 Jan 2015 08:23:30 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Fix the below issue:
| checking whether to enable the use of LCMS2... yes
| checking whether to use the system LCMS install... yes
| checking for LCMS2... no
| configure: error: Could not find LCMS >= 2.5; install it or build with --disable-system-lcms to use the in-tree copy.
| Configure failed. The contents of all config.log files follows to aid debugging
| ERROR: oe_runconf failed

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 recipes-core/openjdk/openjdk-6-release-6b32.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-6-release-6b32.inc b/recipes-core/openjdk/openjdk-6-release-6b32.inc
index bf5e675..f49048d 100644
--- a/recipes-core/openjdk/openjdk-6-release-6b32.inc
+++ b/recipes-core/openjdk/openjdk-6-release-6b32.inc
@@ -11,6 +11,7 @@ EXTRA_OECONF += "--disable-downloading \
                  --enable-system-jpeg \
                  --enable-system-png \
                  --enable-system-gif \
+                 --disable-system-lcms \
                 "
 do_configure_append () {
     patch -p0 <${WORKDIR}/icedtea-openjdk-remove-currency-data-generation-expi.patch
-- 
1.9.1


