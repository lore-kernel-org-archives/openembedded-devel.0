Return-Path: <zhenhua.luo@freescale.com>
X-Greylist: delayed 957 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 07 May 2014 13:53:49 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0183.outbound.protection.outlook.com [207.46.163.183])
	by mail.openembedded.org (Postfix) with ESMTP id 16FBD60702
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 May 2014 13:53:49 +0000 (UTC)
Received: from CH1PR03CA005.namprd03.prod.outlook.com (10.255.156.150) by
	BL2PR03MB387.namprd03.prod.outlook.com (10.141.91.152) with Microsoft
	SMTP Server (TLS) id 15.0.934.12; Wed, 7 May 2014 13:37:52 +0000
Received: from BL2FFO11FD021.protection.gbl (10.255.156.132) by
	CH1PR03CA005.outlook.office365.com (10.255.156.150) with Microsoft SMTP
	Server (TLS) id 15.0.939.12 via Frontend Transport;
	Wed, 7 May 2014 13:37:42 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD021.mail.protection.outlook.com (10.173.161.100) with
	Microsoft
	SMTP Server (TLS) id 15.0.929.8 via Frontend Transport; Wed, 7 May 2014
	13:37:42 +0000
Received: from fly.ap.freescale.net (fly.ap.freescale.net [10.193.20.113])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s47Dbde8023734; Wed, 7 May 2014 06:37:40 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 7 May 2014 21:39:41 +0800
Message-ID: <1399469981-23875-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.9.1
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009001)(6009001)(189002)(199002)(2009001)(33646001)(76482001)(50466002)(50986999)(77982001)(93916002)(81542001)(81342001)(88136002)(62966002)(84676001)(86362001)(92726001)(92566001)(50226001)(46102001)(36756003)(97736001)(4396001)(99396002)(74662001)(77096999)(87936001)(87286001)(20776003)(575784001)(47776003)(74502001)(64706001)(80022001)(6806004)(44976005)(83322001)(31966008)(19580405001)(19580395003)(21056001)(68736004)(79102001)(48376002)(83072002)(77156001)(89996001)(85852003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR03MB387;
	H:tx30smr01.am.freescale.net; FPR:; MLV:sfv;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Forefront-PRVS: 0204F0BDE2
Received-SPF: Fail (: domain of freescale.com does not designate
	192.88.168.50 as permitted sender) receiver=; client-ip=192.88.168.50; 
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=zhenhua.luo@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [meta-java][PAYCH] openjdk-6: Fix cross compilation for e6500 machines
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
X-List-Received-Date: Wed, 07 May 2014 13:53:50 -0000
Content-Type: text/plain

    This is only way for compile for now since qemu can not
    run the sizers binary for e6500 machines. It segfaults
    so we disable generating sizes and also xawt and jawt
    which depends on sizers, this lets jre to cross compile
    for ppc/e6500

The fix is ported according to da0b3a20a67496dc8d4282d19a60672001b7f825

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
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


