Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0236.outbound.protection.outlook.com [207.46.163.236])
	by mail.openembedded.org (Postfix) with ESMTP id 8761B7051E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:39:20 +0000 (UTC)
Received: from BN3PR0301CA0061.namprd03.prod.outlook.com (25.160.152.157) by
	CY1PR0301MB0715.namprd03.prod.outlook.com (25.160.159.145) with
	Microsoft
	SMTP Server (TLS) id 15.0.985.8; Wed, 16 Jul 2014 06:23:14 +0000
Received: from BN1BFFO11FD030.protection.gbl (2a01:111:f400:7c10::1:118) by
	BN3PR0301CA0061.outlook.office365.com (2a01:111:e400:401e::29) with
	Microsoft
	SMTP Server (TLS) id 15.0.985.8 via Frontend Transport; Wed, 16 Jul 2014
	06:23:14 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD030.mail.protection.outlook.com (10.58.144.93) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 06:23:14 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6G6N5cj011967;
	Tue, 15 Jul 2014 23:23:10 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Jul 2014 14:23:59 +0800
Message-ID: <1405491841-24744-2-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(189002)(199002)(26826002)(88136002)(19580395003)(77156001)(110136001)(76176999)(99396002)(92566001)(85852003)(36756003)(97736001)(93916002)(83072002)(102836001)(2351001)(229853001)(89996001)(107046002)(50466002)(6806004)(74662001)(87936001)(84676001)(74502001)(81542001)(48376002)(104016003)(104166001)(19580405001)(80022001)(83322001)(85306003)(69596002)(105606002)(81342001)(31966008)(76482001)(87286001)(62966002)(50986999)(77982001)(20776003)(95666004)(44976005)(86152002)(46102001)(50226001)(92726001)(106466001)(86362001)(81156004)(21056001)(68736004)(4396001)(64706001)(47776003)(79102001)(33646002);
	DIR:OUT; SFP:; SCL:1; SRVR:CY1PR0301MB0715;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0274272F87
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: yocto@mindchasers.com
Subject: [meta-oe][PATCH 1/3] libhugetlbfs: use ARCH ppc/ppc64 for powerpc/powerpc64
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
X-List-Received-Date: Wed, 16 Jul 2014 06:39:22 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

In recent libhugetlbfs source, powerpc/powerpc64 is changed back to
ppc/ppc64 (to match with the output of `uname -a`).

Update the recipe to avoid build issue for now.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../libhugetlbfs/libhugetlbfs_git.bb               |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index e8e0787..e554b26 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -25,7 +25,10 @@ S = "${WORKDIR}/git"
 COMPATIBLE_HOST = "(x86_64|powerpc|powerpc64|aarch64|arm).*-linux*"
 
 LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
-EXTRA_OEMAKE = "'ARCH=${TARGET_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} V=1"
+LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
+LIBHUGETLBFS_ARCH_powerpc = "ppc"
+LIBHUGETLBFS_ARCH_powerpc64 = "ppc64"
+EXTRA_OEMAKE = "'ARCH=${LIBHUGETLBFS_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} V=2"
 PARALLEL_MAKE = ""
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
 
-- 
1.7.3.4


