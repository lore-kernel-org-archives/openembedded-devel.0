Return-Path: <ting.liu@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0242.outbound.protection.outlook.com [207.46.163.242])
	by mail.openembedded.org (Postfix) with ESMTP id C414470515
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:38:36 +0000 (UTC)
Received: from BN3PR0301CA0068.namprd03.prod.outlook.com (25.160.152.164) by
	BLUPR03MB149.namprd03.prod.outlook.com (10.255.212.17) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Wed, 16 Jul 2014 06:23:18 +0000
Received: from BN1AFFO11FD018.protection.gbl (2a01:111:f400:7c10::172) by
	BN3PR0301CA0068.outlook.office365.com (2a01:111:e400:401e::36) with
	Microsoft
	SMTP Server (TLS) id 15.0.990.7 via Frontend Transport; Wed, 16 Jul 2014
	06:23:17 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1AFFO11FD018.mail.protection.outlook.com (10.58.52.78) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 06:23:17 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6G6N5cl011967;
	Tue, 15 Jul 2014 23:23:14 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Jul 2014 14:24:01 +0800
Message-ID: <1405491841-24744-4-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
References: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(979002)(6009001)(189002)(199002)(76176999)(229853001)(87936001)(88136002)(104016003)(110136001)(77982001)(99396002)(95666004)(89996001)(85852003)(83072002)(62966002)(87286001)(31966008)(50226001)(46102001)(50466002)(107046002)(21056001)(92566001)(86152002)(76482001)(2351001)(50986999)(48376002)(92726001)(4396001)(74662001)(74502001)(79102001)(102836001)(104166001)(36756003)(86362001)(83322001)(93916002)(44976005)(106466001)(15395725005)(81156004)(15202345003)(97736001)(77156001)(6806004)(26826002)(84676001)(19580395003)(47776003)(20776003)(105606002)(69596002)(80022001)(64706001)(19580405001)(85306003)(15975445006)(81342001)(33646002)(81542001)(68736004)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:; SCL:1; SRVR:BLUPR03MB149;
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
Subject: [meta-oe][PATCH 3/3] luajit: replace MACHINEOVERRIDES fslmachine with qoriq-ppc
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
X-List-Received-Date: Wed, 16 Jul 2014 06:38:39 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

fslmachine is too generic, use qoriq-ppc instead.
The change had been applided in meta-fsl-ppc layer.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
index de3a40b..75885d6 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
 SRC_URI[md5sum] = "f14e9104be513913810cd59c8c658dc0"
 SRC_URI[sha256sum] = "55be6cb2d101ed38acca32c5b1f99ae345904b365b642203194c585d27bebd79"
 
-SRC_URI_append_fslmachine = " file://ppc-fixplt.patch "
+SRC_URI_append_qoriq-ppc = " file://ppc-fixplt.patch "
 
 S = "${WORKDIR}/LuaJIT-${PV}"
 
-- 
1.7.3.4


