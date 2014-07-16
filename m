Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0145.outbound.protection.outlook.com [207.46.163.145])
	by mail.openembedded.org (Postfix) with ESMTP id 64EDD704B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:38:49 +0000 (UTC)
Received: from CH1PR03CA006.namprd03.prod.outlook.com (10.255.156.151) by
	BLUPR03MB152.namprd03.prod.outlook.com (10.255.212.28) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Wed, 16 Jul 2014 06:23:15 +0000
Received: from BN1AFFO11FD017.protection.gbl (10.255.156.132) by
	CH1PR03CA006.outlook.office365.com (10.255.156.151) with Microsoft SMTP
	Server (TLS) id 15.0.985.8 via Frontend Transport;
	Wed, 16 Jul 2014 06:23:14 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD017.mail.protection.outlook.com (10.58.52.77) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 06:23:14 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6G6N5ck011967;
	Tue, 15 Jul 2014 23:23:12 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Jul 2014 14:24:00 +0800
Message-ID: <1405491841-24744-3-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(21056001)(26826002)(81342001)(99396002)(4396001)(19580395003)(86152002)(50226001)(6806004)(102836001)(86362001)(77156001)(76176999)(97736001)(105606002)(85306003)(81542001)(92566001)(47776003)(64706001)(33646002)(20776003)(95666004)(87936001)(50466002)(80022001)(88136002)(93916002)(87286001)(62966002)(44976005)(110136001)(107046002)(76482001)(104016003)(48376002)(31966008)(74502001)(85852003)(69596002)(89996001)(50986999)(36756003)(92726001)(2351001)(19580405001)(83322001)(104166001)(84676001)(229853001)(81156004)(106466001)(77982001)(83072002)(46102001)(79102001)(74662001)(68736004);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB152;
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
Subject: [meta-oe][PATCH 2/3] libhugetlbfs: not build obj32 for powerpc64
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
X-List-Received-Date: Wed, 16 Jul 2014 06:38:50 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

If obj32 needed, user can build lib32-libhugetlbfs.

Fix the below build issue for 64bit powerpc boards:
| fatal error: gnu/stubs-32.h: No such file or directory
|  # include <gnu/stubs-32.h>
|                            ^
| compilation terminated.
| make: *** [obj32/elflink.o] Error 1

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../libhugetlbfs/libhugetlbfs_git.bb               |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index e554b26..55d555b 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -29,6 +29,7 @@ LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
 LIBHUGETLBFS_ARCH_powerpc = "ppc"
 LIBHUGETLBFS_ARCH_powerpc64 = "ppc64"
 EXTRA_OEMAKE = "'ARCH=${LIBHUGETLBFS_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} V=2"
+EXTRA_OEMAKE_append_powerpc64 = " BUILDTYPE=NATIVEONLY"
 PARALLEL_MAKE = ""
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
 
-- 
1.7.3.4


