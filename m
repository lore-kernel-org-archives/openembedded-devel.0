Return-Path: <B40290@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0119.outbound.protection.outlook.com [207.46.100.119])
	by mail.openembedded.org (Postfix) with ESMTP id E9E35601DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 May 2015 10:03:58 +0000 (UTC)
Received: from DM2PR03CA0001.namprd03.prod.outlook.com (10.141.96.11) by
	DM2PR03MB447.namprd03.prod.outlook.com (10.141.85.18) with Microsoft
	SMTP Server (TLS) id 15.1.160.10; Mon, 4 May 2015 09:48:05 +0000
Received: from BY2FFO11FD037.protection.gbl (2a01:111:f400:7c0c::159) by
	DM2PR03CA0001.outlook.office365.com (2a01:111:e400:2428::11) with
	Microsoft
	SMTP Server (TLS) id 15.1.154.19 via Frontend Transport; Mon, 4 May 2015
	09:48:04 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=freescale.com; freescale.mail.onmicrosoft.com; dkim=none
	(message not signed) header.d=none;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BY2FFO11FD037.mail.protection.outlook.com (10.1.14.222) with Microsoft
	SMTP Server (TLS) id 15.1.160.8 via Frontend Transport;
	Mon, 4 May 2015 09:48:03 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id t449m13S001113;
	Mon, 4 May 2015 02:48:02 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 May 2015 17:47:56 +0800
Message-ID: <1430732876-15399-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(339900001)(189002)(199003)(47776003)(86152002)(575784001)(77096005)(104016003)(33646002)(5001960100002)(48376002)(77156002)(86362001)(2351001)(92566002)(19580405001)(106466001)(19580395003)(6806004)(46102003)(62966003)(229853001)(5001920100001)(50226001)(50466002)(50986999)(110136002)(450100001)(15975445007)(85426001)(105606002)(87936001)(107886002)(36756003)(4001430100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM2PR03MB447;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:DM2PR03MB447;
X-Microsoft-Antispam-PRVS: <DM2PR03MB447FB418629DCC5A3072EE084D20@DM2PR03MB447.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(5005006)(3002001); SRVR:DM2PR03MB447; BCL:0;
	PCL:0; RULEID:; SRVR:DM2PR03MB447; 
X-Forefront-PRVS: 05669A7924
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2015 09:48:03.9025 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR03MB447
Subject: [meta-oe][PATCH] polkit: do not hardcode the libdir
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
X-List-Received-Date: Mon, 04 May 2015 10:04:00 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

 libdir is defined as ${prefix}/lib/, but we want it to support multilib path

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../polkit/0001-do-not-hardcoded-libdir.patch      | 44 ++++++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_0.112.bb    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch

diff --git a/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
new file mode 100644
index 0000000..3ccedcd
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/polkit/0001-do-not-hardcoded-libdir.patch
@@ -0,0 +1,44 @@
+From c9e09d9b101109832b1dcb050f0c8b588e276686 Mon Sep 17 00:00:00 2001
+From: Zhenhua Luo <zhenhua.luo@freescale.com>
+Date: Mon, 4 May 2015 04:11:27 -0500
+Subject: [PATCH] do not hardcoded libdir
+
+Upstream-Status: Pending
+
+libdir is hardcoded to ${prefix}/lib, but we want it to support multilib
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+---
+ polkitagent/Makefile.am   | 2 +-
+ polkitbackend/Makefile.am | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/polkitagent/Makefile.am b/src/polkitagent/Makefile.am
+index 3bc364e..7d1ac0e 100644
+--- a/src/polkitagent/Makefile.am
++++ b/src/polkitagent/Makefile.am
+@@ -78,7 +78,7 @@ libpolkit_agent_1_la_LIBADD =                               		\
+ 
+ libpolkit_agent_1_la_LDFLAGS = -export-symbols-regex '(^polkit_.*)'
+ 
+-libprivdir = $(prefix)/lib/polkit-1
++libprivdir = $(prefix)/${base_libdir}/polkit-1
+ libpriv_PROGRAMS = polkit-agent-helper-1
+ 
+ polkit_agent_helper_1_SOURCES = 					\
+diff --git a/src/polkitbackend/Makefile.am b/src/polkitbackend/Makefile.am
+index 9f430d0..1f7610b 100644
+--- a/src/polkitbackend/Makefile.am
++++ b/src/polkitbackend/Makefile.am
+@@ -67,7 +67,7 @@ rules_DATA = 50-default.rules
+ 
+ # ----------------------------------------------------------------------------------------------------
+ 
+-libprivdir = $(prefix)/lib/polkit-1
++libprivdir = $(prefix)/${base_libdir}/polkit-1
+ libpriv_PROGRAMS = polkitd
+ 
+ polkitd_SOURCES = 							\
+-- 
+2.3.3
+
diff --git a/meta-oe/recipes-extended/polkit/polkit_0.112.bb b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
index 72b182b..f20e1a4 100644
--- a/meta-oe/recipes-extended/polkit/polkit_0.112.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_0.112.bb
@@ -21,6 +21,7 @@ PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://www.freedesktop.org/software/polkit/releases/polkit-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)} \
            file://0001-configure.ac-Check-only-for-libsystemd-not-libsystem.patch \
+           file://0001-do-not-hardcoded-libdir.patch \
 "
 
 SRC_URI[md5sum] = "b0f2fa00a55f47c6a5d88e9b73f80127"
-- 
1.9.2


