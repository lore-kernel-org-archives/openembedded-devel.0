Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 871 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 14 Jan 2015 15:50:40 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0111.outbound.protection.outlook.com [207.46.100.111])
	by mail.openembedded.org (Postfix) with ESMTP id E9FF27162E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2015 15:50:40 +0000 (UTC)
Received: from CH1PR03CA003.namprd03.prod.outlook.com (10.255.156.148) by
	BN3PR0301MB1187.namprd03.prod.outlook.com (25.160.156.149) with
	Microsoft
	SMTP Server (TLS) id 15.1.59.20; Wed, 14 Jan 2015 15:36:07 +0000
Received: from BN1AFFO11FD060.protection.gbl (10.255.156.132) by
	CH1PR03CA003.outlook.office365.com (10.255.156.148) with Microsoft SMTP
	Server (TLS) id 15.1.59.20 via Frontend Transport;
	Wed, 14 Jan 2015 15:36:07 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD060.mail.protection.outlook.com (10.58.53.75) with Microsoft
	SMTP Server (TLS) id 15.1.49.13 via Frontend Transport;
	Wed, 14 Jan 2015 15:36:07 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t0EFa4e3027398;
	Wed, 14 Jan 2015 08:36:05 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Jan 2015 23:36:03 +0800
Message-ID: <1421249763-31177-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(64706001)(33646002)(47776003)(229853001)(110136001)(104016003)(15188155005)(19300405004)(19273905006)(87936001)(97736003)(46102003)(36756003)(68736005)(77156002)(62966003)(86152002)(15975445007)(77096005)(50466002)(85426001)(48376002)(92566002)(69596002)(50226001)(6806004)(19580395003)(19580405001)(16799955002)(50986999)(2351001)(81156004)(105606002)(106466001)(562404015)(563064011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0301MB1187;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-DmarcAction-Test: None
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(3005003);SRVR:BN3PR0301MB1187;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:(601004);
	SRVR:BN3PR0301MB1187; 
X-Forefront-PRVS: 04569283F9
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0301MB1187; 
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2015 15:36:07.3279 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0301MB1187
Subject: [meta-oe][PATCH] lcov: add initial recipe 1.11
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
X-List-Received-Date: Wed, 14 Jan 2015 15:50:50 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta-oe/recipes-support/lcov/lcov_1.11.bb | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/lcov/lcov_1.11.bb

diff --git a/meta-oe/recipes-support/lcov/lcov_1.11.bb b/meta-oe/recipes-support/lcov/lcov_1.11.bb
new file mode 100644
index 0000000..5f3b889
--- /dev/null
+++ b/meta-oe/recipes-support/lcov/lcov_1.11.bb
@@ -0,0 +1,28 @@
+SUMMARY = "A graphical front-end for gcov"
+HOMEPAGE = "http://ltp.sourceforge.net/coverage/lcov.php"
+DESCRIPTION = "LCOV is a graphical front-end for GCC's coverage testing \
+tool gcov. It collects gcov data for multiple source files and creates \
+HTML pages containing the source code annotated with coverage information. \
+It also adds overview pages for easy navigation within the file structure. \
+LCOV supports statement, function and branch coverage measurement." 
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+RDEPENDS_${PN} += " \
+    gcov \
+    perl \
+    perl-module-filehandle \
+    perl-module-getopt-std \
+    perl-module-digest-sha \
+"
+
+SRC_URI = "http://downloads.sourceforge.net/ltp/${BP}.tar.gz"
+
+SRC_URI[md5sum] = "e79b799ae3ce149aa924c7520e993024"
+SRC_URI[sha256sum] = "c282de8d678ecbfda32ce4b5c85fc02f77c2a39a062f068bd8e774d29ddc9bf8"
+
+do_install() {
+    oe_runmake install PREFIX=${D}
+    sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/*
+}
+
-- 
1.9.1


