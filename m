Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0244.outbound.protection.outlook.com [207.46.163.244])
	by mail.openembedded.org (Postfix) with ESMTP id 5B20C70695
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:06:11 +0000 (UTC)
Received: from BN3PR0301CA0035.namprd03.prod.outlook.com (25.160.180.173) by
	BN1PR0301MB0706.namprd03.prod.outlook.com (25.160.78.13) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Fri, 25 Jul 2014 10:06:10 +0000
Received: from BN1BFFO11FD025.protection.gbl (2a01:111:f400:7c10::1:143) by
	BN3PR0301CA0035.outlook.office365.com (2a01:111:e400:4000::45) with
	Microsoft SMTP Server (TLS) id 15.0.995.14 via Frontend Transport;
	Fri, 25 Jul 2014 10:06:10 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD025.mail.protection.outlook.com (10.58.144.88) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Fri, 25 Jul 2014 10:06:09 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6PA662T025130; Fri, 25 Jul 2014 03:06:08 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Jul 2014 18:08:14 +0800
Message-ID: <1406282895-19011-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(33646002)(2351001)(20776003)(107046002)(84676001)(79102001)(87286001)(74662001)(81542001)(92566001)(229853001)(50986999)(105606002)(104016003)(6806004)(110136001)(44976005)(77156001)(31966008)(48376002)(77982001)(106466001)(87936001)(47776003)(89996001)(99396002)(93916002)(4396001)(46102001)(74502001)(81342001)(95666004)(102836001)(50466002)(86362001)(104166001)(62966002)(19580395003)(86152002)(85852003)(76482001)(97736001)(21056001)(88136002)(50226001)(19580405001)(83072002)(80022001)(64706001)(85306003)(68736004)(26826002)(92726001)(36756003)(83322001);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR0301MB0706;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 02830F0362
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.50
	as permitted sender) receiver=; client-ip=192.88.168.50;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH 1/2] libhugetlbfs: not build obj32 for all 64b platforms
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
X-List-Received-Date: Fri, 25 Jul 2014 10:06:12 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

qemux86_64 has the same issue with powerpc64, set
BUILDTYPE=NATIVEONLY as default

Fix the below build issue for 64bit platforms:
| fatal error: gnu/stubs-32.h: No such file or directory
|  # include <gnu/stubs-32.h>
|                            ^
| compilation terminated.
| make: *** [obj32/elflink.o] Error 1

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../libhugetlbfs/libhugetlbfs_git.bb               |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
index 55d555b..315863d 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
@@ -28,8 +28,7 @@ LIBARGS = "LIB32=${baselib} LIB64=${baselib}"
 LIBHUGETLBFS_ARCH = "${TARGET_ARCH}"
 LIBHUGETLBFS_ARCH_powerpc = "ppc"
 LIBHUGETLBFS_ARCH_powerpc64 = "ppc64"
-EXTRA_OEMAKE = "'ARCH=${LIBHUGETLBFS_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} V=2"
-EXTRA_OEMAKE_append_powerpc64 = " BUILDTYPE=NATIVEONLY"
+EXTRA_OEMAKE = "'ARCH=${LIBHUGETLBFS_ARCH}' 'OPT=${CFLAGS}' 'CC=${CC}' ${LIBARGS} BUILDTYPE=NATIVEONLY V=2"
 PARALLEL_MAKE = ""
 CFLAGS += "-fexpensive-optimizations -frename-registers -fomit-frame-pointer -g0"
 
-- 
1.7.3.4


