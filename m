Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0139.outbound.protection.outlook.com [207.46.100.139])
	by mail.openembedded.org (Postfix) with ESMTP id 6C96D721E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Jan 2015 08:38:39 +0000 (UTC)
Received: from BN3PR0301CA0045.namprd03.prod.outlook.com (25.160.152.141) by
	DM2PR0301MB1199.namprd03.prod.outlook.com (25.160.217.149) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20; Wed, 21 Jan 2015 08:23:24 +0000
Received: from BN1AFFO11FD007.protection.gbl (2a01:111:f400:7c10::104) by
	BN3PR0301CA0045.outlook.office365.com (2a01:111:e400:401e::13) with
	Microsoft
	SMTP Server (TLS) id 15.1.65.19 via Frontend Transport; Wed, 21 Jan 2015
	08:23:24 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD007.mail.protection.outlook.com (10.58.52.67) with Microsoft
	SMTP Server (TLS) id 15.1.75.11 via Frontend Transport;
	Wed, 21 Jan 2015 08:23:22 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	t0L8NEeu017727; Wed, 21 Jan 2015 01:23:20 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Jan 2015 16:23:05 +0800
Message-ID: <1421828586-19021-4-git-send-email-b28495@freescale.com>
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
	SFS:(10019020)(6009001)(339900001)(199003)(189002)(50986999)(92566002)(106466001)(229853001)(2351001)(105606002)(76176999)(50226001)(36756003)(33646002)(86152002)(104016003)(62966003)(77156002)(450100001)(68736005)(77096005)(2950100001)(50466002)(110136001)(48376002)(47776003)(64706001)(97736003)(46102003)(87936001)(19580395003)(6806004)(19580405001)(85426001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR0301MB1199;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005004);SRVR:DM2PR0301MB1199;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:DM2PR0301MB1199; 
X-Forefront-PRVS: 04631F8F77
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:DM2PR0301MB1199; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2015 08:23:22.7226 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR0301MB1199
Subject: [meta-java][PATCH 3/4] openjdk-6: do not run gamma test for cross compiles
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
X-List-Received-Date: Wed, 21 Jan 2015 08:38:42 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

set CROSS_COMPILE_ARCH which will be checked before run gamma test.

Fix the below issue:
| make[6]: Leaving directory `.../openjdk-6-jre/6b32-1.13.4-r22.0/build/openjdk.build/hotspot/outputdir/linux_ppc64_zero/product'
| cd linux_ppc64_zero/product && ./test_gamma
| ./test_gamma: line 72: ./gamma: cannot execute binary file
| make[5]: *** [productzero] Error 126

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 recipes-core/openjdk/openjdk-6-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-6-common.inc b/recipes-core/openjdk/openjdk-6-common.inc
index 4254c9f..7ad7097 100644
--- a/recipes-core/openjdk/openjdk-6-common.inc
+++ b/recipes-core/openjdk/openjdk-6-common.inc
@@ -167,6 +167,7 @@ EXTRA_OEMAKE += ' \
                 OE_CXXFLAGS="${TARGET_CXXFLAGS}" \
                 OE_LDFLAGS="${TARGET_LDFLAGS}" \
                 ZIPEXE="${STAGING_BINDIR_NATIVE}/zip" \
+                CROSS_COMPILE_ARCH="${JDK_ARCH}" \
                '
 
 OE_LAUNCHER_LDFLAGS = "-Wl,-rpath-link,${STAGING_LIBDIR}/llvm${WANT_LLVM_RELEASE} -Wl,-rpath,/usr/lib/llvm${WANT_LLVM_RELEASE}"
-- 
1.9.1


