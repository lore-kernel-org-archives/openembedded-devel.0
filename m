Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 2050 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Sep 2014 07:43:15 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1on0141.outbound.protection.outlook.com [157.56.110.141])
	by mail.openembedded.org (Postfix) with ESMTP id 371ED65CB2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 07:43:15 +0000 (UTC)
Received: from BN3PR0301CA0075.namprd03.prod.outlook.com (25.160.152.171) by
	BL2PR03MB146.namprd03.prod.outlook.com (10.255.230.18) with Microsoft
	SMTP Server (TLS) id 15.0.1034.13; Tue, 23 Sep 2014 07:09:03 +0000
Received: from BL2FFO11FD033.protection.gbl (2a01:111:f400:7c09::103) by
	BN3PR0301CA0075.outlook.office365.com (2a01:111:e400:401e::43) with
	Microsoft SMTP Server (TLS) id 15.0.1034.13 via Frontend Transport;
	Tue, 23 Sep 2014 07:09:03 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD033.mail.protection.outlook.com (10.173.161.129) with
	Microsoft SMTP Server (TLS) id 15.0.1029.15 via Frontend Transport;
	Tue, 23 Sep 2014 07:09:03 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s8N790YE004557;
	Tue, 23 Sep 2014 00:09:01 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 23 Sep 2014 15:04:08 +0800
Message-ID: <1411455848-21704-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.8.3.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(199003)(189002)(104016003)(33646002)(110136001)(229853001)(36756003)(2351001)(76482002)(102836001)(50466002)(104166001)(31966008)(90102001)(47776003)(64706001)(120916001)(10300001)(48376002)(20776003)(77982003)(107046002)(77156001)(46102003)(575784001)(21056001)(92566001)(87286001)(86152002)(81542003)(69596002)(92726001)(4396001)(88136002)(97736003)(50226001)(89996001)(62966002)(87936001)(80022003)(6806004)(79102003)(83072002)(106466001)(93916002)(19580395003)(86362001)(74662003)(85852003)(74502003)(81342003)(84676001)(99396002)(81156004)(105606002)(95666004)(85306004)(83322001)(44976005)(68736004)(50986999)(19580405001)(211663006);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BL2PR03MB146;
	H:az84smr01.freescale.net; FPR:; MLV:nov;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2PR03MB146;
X-Forefront-PRVS: 0343AC1D30
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH] libunwind: Fix test case link failure on PowerPC systems with Altivec
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
X-List-Received-Date: Tue, 23 Sep 2014 07:43:24 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 ...k-failure-on-PowerPC-systems-with-Altivec.patch | 31 ++++++++++++++++++++++
 meta-oe/recipes-support/libunwind/libunwind_1.1.bb |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch

diff --git a/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch b/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
new file mode 100644
index 0000000..e8f4382
--- /dev/null
+++ b/meta-oe/recipes-support/libunwind/libunwind/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
@@ -0,0 +1,31 @@
+From 4c62c4a9556f92495d93eddc7641497e1ce1e35c Mon Sep 17 00:00:00 2001
+From: Ulrich Weigand <uweigand@de.ibm.com>
+Date: Tue, 17 Dec 2013 15:00:54 +0100
+Subject: [PATCH] Fix test case link failure on PowerPC systems with Altivec
+
+Upstream-Status:backport
+
+On systems where the system compiler supports Altivec by default,
+the libunwind Makefile will attempt to build an extra test case
+ppc64-test-altivec.  Unfortunately, the link step will fail since
+the Makefile does not actually link against the libunwind library.
+
+Fixed by adding the appropriate LDADD macro.
+
+Signed-off-by: Ulrich Weigand <uweigand@de.ibm.com>
+---
+ tests/Makefile.am |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 0e30536..9c76628 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -201,3 +201,4 @@ Lia64_test_rbs_LDADD = $(LIBUNWIND_local)
+ Lia64_test_readonly_LDADD = $(LIBUNWIND_local)
+ ia64_test_dyn1_LDADD = $(LIBUNWIND)
+ ia64_test_sig_LDADD = $(LIBUNWIND)
++ppc64_test_altivec_LDADD = $(LIBUNWIND)
+-- 
+1.7.2.5
+
diff --git a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
index bc38e36..18bca0e 100644
--- a/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta-oe/recipes-support/libunwind/libunwind_1.1.bb
@@ -1,4 +1,5 @@
 require libunwind.inc
 
+SRC_URI += "file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch"
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
 SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.8.3.2


