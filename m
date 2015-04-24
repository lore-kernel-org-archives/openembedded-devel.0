Return-Path: <B40290@freescale.com>
X-Greylist: delayed 2008 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Apr 2015 07:48:47 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0112.outbound.protection.outlook.com [157.56.110.112])
	by mail.openembedded.org (Postfix) with ESMTP id A06436E268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:48:47 +0000 (UTC)
Received: from CH1PR03CA007.namprd03.prod.outlook.com (10.255.156.152) by
	DM2PR03MB448.namprd03.prod.outlook.com (10.141.85.24) with Microsoft
	SMTP Server (TLS) id 15.1.136.17; Fri, 24 Apr 2015 07:15:19 +0000
Received: from BN1BFFO11FD054.protection.gbl (10.255.156.132) by
	CH1PR03CA007.outlook.office365.com (10.255.156.152) with Microsoft SMTP
	Server (TLS) id 15.1.118.21 via Frontend Transport;
	Fri, 24 Apr 2015 07:15:19 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD054.mail.protection.outlook.com (10.58.145.9) with Microsoft
	SMTP Server (TLS) id 15.1.148.11 via Frontend Transport;
	Fri, 24 Apr 2015 07:15:19 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t3O7FGiV023493;
	Fri, 24 Apr 2015 00:15:17 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 24 Apr 2015 15:15:12 +0800
Message-ID: <1429859712-22034-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI; BMV:1;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(377424004)(199003)(33646002)(6806004)(19580395003)(19580405001)(85426001)(229853001)(50986999)(2351001)(104016003)(46102003)(110136001)(50226001)(50466002)(450100001)(62966003)(77156002)(86362001)(36756003)(47776003)(106466001)(105606002)(86152002)(87936001)(48376002)(92566002)(77096005)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR03MB448;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR03MB448;
X-Microsoft-Antispam-PRVS: <DM2PR03MB448AC535AF63409248D155384EC0@DM2PR03MB448.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(5002010)(3002001); SRVR:DM2PR03MB448;
	BCL:0; PCL:0; RULEID:; SRVR:DM2PR03MB448; 
X-Forefront-PRVS: 05568D1FF7
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2015 07:15:19.1490 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB448
Subject: [meta-oe][PATCH] mozjs: fix the compile error of powerpc64
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
X-List-Received-Date: Fri, 24 Apr 2015 07:48:48 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  fix the following error
  |error: 'jsuword' does not name a type

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../mozjs/fix-the-compile-error-of-powerpc64.patch     | 18 ++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb         |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch b/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
new file mode 100644
index 0000000..43c4590
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/fix-the-compile-error-of-powerpc64.patch
@@ -0,0 +1,18 @@
+fix the compile error of powerpc64
+ 
+Upstream-status: Accepted
+
+ fix the following error
+ |error: 'jsuword' does not name a type
+
+
+--- a/js/src/jsval.hold	2015-04-24 01:15:06.692970731 -0500
++++ b/js/src/jsval.h	2015-04-24 01:15:41.792969478 -0500
+@@ -304,7 +304,6 @@
+             int32_t        i32;
+             uint32_t       u32;
+             JSWhyMagic     why;
+-            jsuword        word;
+         } payload;
+     } s;
+     double asDouble;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
index 263e940..ac6ce4e 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb
@@ -11,6 +11,7 @@ SRC_URI = " \
     file://0004-mozbug746112-no-decommit-on-large-pages.patch;patchdir=../../ \
     file://0005-aarch64-64k-page.patch;patchdir=../../ \
     file://0001-regenerate-configure.patch;patchdir=../../ \ 
+    file://fix-the-compile-error-of-powerpc64.patch;patchdir=../../ \
   "
 
 SRC_URI[md5sum] = "20b6f8f1140ef6e47daa3b16965c9202"
-- 
1.9.2


