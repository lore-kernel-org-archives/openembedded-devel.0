Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 690 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Jan 2015 08:34:56 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0111.outbound.protection.outlook.com [65.55.169.111])
	by mail.openembedded.org (Postfix) with ESMTP id E4F0A71144
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 08:34:56 +0000 (UTC)
Received: from DM2PR03CA0036.namprd03.prod.outlook.com (10.141.96.35) by
	BY2PR0301MB0712.namprd03.prod.outlook.com (25.160.63.154) with
	Microsoft SMTP
	Server (TLS) id 15.1.59.20; Wed, 21 Jan 2015 08:34:55 +0000
Received: from BL2FFO11FD019.protection.gbl (2a01:111:f400:7c09::142) by
	DM2PR03CA0036.outlook.office365.com (2a01:111:e400:2428::35) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20 via Frontend Transport; Wed, 21 Jan 2015
	08:34:54 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD019.mail.protection.outlook.com (10.173.161.37) with
	Microsoft SMTP Server (TLS) id 15.1.59.14 via Frontend Transport;
	Wed, 21 Jan 2015 08:34:54 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0L8Yp1D023248; Wed, 21 Jan 2015 01:34:52 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Jan 2015 16:34:50 +0800
Message-ID: <1421829290-10623-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(50986999)(229853001)(33646002)(2351001)(86152002)(85426001)(87936001)(62966003)(6806004)(77156002)(450100001)(19580405001)(110136001)(19580395003)(50226001)(575784001)(46102003)(48376002)(92566002)(50466002)(105606002)(97736003)(64706001)(47776003)(104016003)(106466001)(36756003)(77096005)(68736005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0712;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:BY2PR0301MB0712;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BY2PR0301MB0712; 
X-Forefront-PRVS: 04631F8F77
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0301MB0712; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2015 08:34:54.2548 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0301MB0712
Subject: [meta-java][PATCH] openjdk-6: Fix cross compilation for e6500 machines
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
X-List-Received-Date: Wed, 21 Jan 2015 08:35:05 -0000
Content-Type: text/plain

From: Zhenhua Luo <zhenhua.luo@freescale.com>

This is only way for compile for now since qemu can not
run the sizers binary for e6500 machines. It segfaults
so we disable generating sizes and also xawt and jawt
which depends on sizers, this lets jre to cross compile
for ppc/e6500

The fix is ported according to da0b3a20a67496dc8d4282d19a60672001b7f825

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 recipes-core/openjdk/openjdk-6-release-6b24.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-6-release-6b24.inc b/recipes-core/openjdk/openjdk-6-release-6b24.inc
index d0da379..da5299f 100644
--- a/recipes-core/openjdk/openjdk-6-release-6b24.inc
+++ b/recipes-core/openjdk/openjdk-6-release-6b24.inc
@@ -90,6 +90,13 @@ ICEDTEAPATCHES_append_e5500-64b = " \
 ICEDTEAPATCHES_append_e5500 = " \
         file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=no \
 	"
+ICEDTEAPATCHES_append_e6500-64b = " \
+        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=no \
+        "
+ICEDTEAPATCHES_append_e6500 = " \
+        file://icedtea-jdk-sizers-crosscompile-hack.patch;apply=no \
+        "
+
 ICEDTEAPATCHES_append_libc-uclibc = " \
         file://icedtea-hotspot-isfinte.patch;apply=no \
         file://icedtea-hotspot-glibc-version.patch;apply=no \
@@ -132,4 +139,11 @@ DISTRIBUTION_PATCHES_append_e5500-64b = " \
 DISTRIBUTION_PATCHES_append_e5500 = " \
        patches/icedtea-jdk-sizers-crosscompile-hack.patch \
        "
+DISTRIBUTION_PATCHES_append_e6500-64b = " \
+       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
+       "
+
+DISTRIBUTION_PATCHES_append_e6500 = " \
+       patches/icedtea-jdk-sizers-crosscompile-hack.patch \
+       "
 export DISTRIBUTION_PATCHES
-- 
1.9.1


