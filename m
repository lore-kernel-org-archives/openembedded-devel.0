Return-Path: <B40290@freescale.com>
X-Greylist: delayed 952 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 18 Jun 2014 03:32:33 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0142.outbound.protection.outlook.com [207.46.163.142])
	by mail.openembedded.org (Postfix) with ESMTP id 562C26FD5C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 03:32:33 +0000 (UTC)
Received: from BY2PR03CA034.namprd03.prod.outlook.com (10.242.234.155) by
	BY2PR03MB393.namprd03.prod.outlook.com (10.141.141.12) with Microsoft
	SMTP Server (TLS) id 15.0.954.9; Wed, 18 Jun 2014 03:16:40 +0000
Received: from BL2FFO11FD050.protection.gbl (2a01:111:f400:7c09::149) by
	BY2PR03CA034.outlook.office365.com (2a01:111:e400:2c2c::27) with
	Microsoft SMTP Server (TLS) id 15.0.959.24 via Frontend Transport;
	Wed, 18 Jun 2014 03:16:39 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD050.mail.protection.outlook.com (10.173.161.212) with
	Microsoft SMTP Server (TLS) id 15.0.959.15 via Frontend Transport;
	Wed, 18 Jun 2014 03:16:39 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s5I3GaLp022036;
	Tue, 17 Jun 2014 20:16:37 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jun 2014 11:12:15 +0800
Message-ID: <1403061135-22767-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(377424004)(199002)(189002)(19580405001)(19580395003)(83322001)(77156001)(44976005)(87936001)(81342001)(6806004)(81156003)(97736001)(74662001)(74502001)(31966008)(62966002)(50986999)(99396002)(104166001)(105606002)(46102001)(68736004)(36756003)(50466002)(81542001)(69596002)(80022001)(48376002)(83072002)(92566001)(92726001)(33646001)(21056001)(84676001)(93916002)(87286001)(86362001)(102836001)(85852003)(26826002)(77982001)(4396001)(76482001)(79102001)(50226001)(95666004)(47776003)(64706001)(104016002)(85306003)(20776003)(89996001)(86152002)(88136002);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB393;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BL:0; ACTION:Default; RISK:Low; SCL:0; SPMLVL:NotSpam;
	PCL:0; RULEID:
X-Forefront-PRVS: 02462830BE
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=B40290@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH] libhugetlbfs: arm 32bit support
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
X-List-Received-Date: Wed, 18 Jun 2014 03:32:37 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../libhugetlbfs/files/arm32-support.patch         | 29 ++++++++++++++++++++++
 .../libhugetlbfs/libhugetlbfs_git.bb               |  3 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
new file mode 100644
index 0000000..96f162d
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/arm32-support.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Submitted
+
+This patch adds support for arm32.
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+--- a/Makefileold	2014-06-17 21:55:23.131058918 -0500
++++ b/Makefile	2014-06-17 21:56:08.726098531 -0500
+@@ -59,6 +59,12 @@
+ TMPLIB32 = lib
+ CPPFLAGS += -DPPC_NO_SEGMENTS
+ else
++ifeq ($(ARCH),arm)
++CC32 = $(CC)
++TMPLIB32 = lib
++ELF32 += armelf_linux_eabi
++CUSTOM_LDSCRIPTS = no
++else
+ ifeq ($(ARCH),armv7l)
+ CC32 = $(CC)
+ TMPLIB32 = lib
+@@ -116,6 +122,7 @@
+ endif
+ endif
+ endif
++endif
+ 
+ ifdef CC32
+ OBJDIRS += obj32
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 5645add..879f2a0 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -14,11 +14,12 @@ SRC_URI = "git://git.code.sf.net/p/libhugetlbfs/code \
     file://0001-aarch64-fix-cross-compilation.patch \
     file://0001-aarch64-fix-page-size-not-properly-computed.patch \
     file://0001-replace-lib-lib64-hardcoded-values-by-LIBDIR32-LIBDI.patch \
+    file://arm32-support.patch \
 "
 
 S = "${WORKDIR}/git"
 
-COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64).*-linux*"
+COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} V=1"
-- 
1.9.2


