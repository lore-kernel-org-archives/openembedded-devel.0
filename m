Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0140.outbound.protection.outlook.com [207.46.163.140])
	by mail.openembedded.org (Postfix) with ESMTP id D58D565D1A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 10:13:29 +0000 (UTC)
Received: from BN3PR0301CA0059.namprd03.prod.outlook.com (25.160.152.155) by
	BN1PR03MB153.namprd03.prod.outlook.com (10.255.201.15) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Wed, 16 Jul 2014 10:13:28 +0000
Received: from BY2FFO11FD010.protection.gbl (2a01:111:f400:7c0c::179) by
	BN3PR0301CA0059.outlook.office365.com (2a01:111:e400:401e::27) with
	Microsoft
	SMTP Server (TLS) id 15.0.990.7 via Frontend Transport; Wed, 16 Jul 2014
	10:13:28 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD010.mail.protection.outlook.com (10.1.14.74) with Microsoft
	SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 10:13:28 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6GADOJQ031802; Wed, 16 Jul 2014 03:13:26 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Jul 2014 18:14:22 +0800
Message-ID: <1405505662-28883-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(50226001)(79102001)(95666004)(81342001)(87936001)(77982001)(4396001)(80022001)(106466001)(21056001)(64706001)(47776003)(20776003)(93916002)(105606002)(86362001)(33646002)(99396002)(15395725005)(104166001)(50986999)(86152002)(92726001)(92566001)(50466002)(31966008)(88136002)(6806004)(89996001)(87286001)(44976005)(83072002)(85852003)(74502001)(77156001)(26826002)(83322001)(15202345003)(229853001)(19580405001)(104016003)(19580395003)(2351001)(107046002)(68736004)(48376002)(36756003)(110136001)(81542001)(76482001)(46102001)(97736001)(74662001)(102836001)(62966002)(85306003)(15975445006)(84676001);
	DIR:OUT; SFP:; SCL:1; SRVR:BN1PR03MB153;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 0274272F87
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.168.50
	as permitted sender) receiver=; client-ip=192.88.168.50;
	helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH] luajit: remove fsl ppc specfic patch
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
X-List-Received-Date: Wed, 16 Jul 2014 10:13:37 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Will add this patch in meta-fsl-ppc layer via bbappend.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
index de3a40b..684ec14 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb
@@ -9,8 +9,6 @@ SRC_URI = "http://luajit.org/download/LuaJIT-${PV}.tar.gz \
 SRC_URI[md5sum] = "f14e9104be513913810cd59c8c658dc0"
 SRC_URI[sha256sum] = "55be6cb2d101ed38acca32c5b1f99ae345904b365b642203194c585d27bebd79"
 
-SRC_URI_append_fslmachine = " file://ppc-fixplt.patch "
-
 S = "${WORKDIR}/LuaJIT-${PV}"
 
 inherit pkgconfig binconfig
-- 
1.7.3.4


