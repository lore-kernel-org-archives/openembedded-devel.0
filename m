Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1blp0188.outbound.protection.outlook.com [207.46.163.188])
	by mail.openembedded.org (Postfix) with ESMTP id 3949970807
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jul 2014 06:22:00 +0000 (UTC)
Received: from BLUPR03CA034.namprd03.prod.outlook.com (10.141.30.27) by
	BY2PR03MB159.namprd03.prod.outlook.com (10.242.36.18) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Wed, 23 Jul 2014 06:21:58 +0000
Received: from BL2FFO11FD038.protection.gbl (2a01:111:f400:7c09::195) by
	BLUPR03CA034.outlook.office365.com (2a01:111:e400:879::27) with
	Microsoft SMTP Server (TLS) id 15.0.995.11 via Frontend Transport;
	Wed, 23 Jul 2014 06:21:57 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD038.mail.protection.outlook.com (10.173.161.134) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 23 Jul 2014 06:21:57 +0000
Received: from neptune.ap.freescale.net (neptune.ap.freescale.net
	[10.192.208.77])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6N6Ls0o021055;
	Tue, 22 Jul 2014 23:21:55 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Jul 2014 14:19:00 +0800
Message-ID: <1406096340-13229-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.8.3.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(102836001)(64706001)(77982001)(83322001)(19580405001)(31966008)(84676001)(107046002)(97736001)(99396002)(69596002)(50226001)(74662001)(6806004)(74502001)(81156004)(44976005)(21056001)(105606002)(229853001)(95666004)(2351001)(4396001)(76482001)(33646002)(77156001)(36756003)(68736004)(19580395003)(85306003)(92726001)(83072002)(47776003)(86362001)(104166001)(87286001)(46102001)(88136002)(87936001)(93916002)(26826002)(85852003)(50986999)(80022001)(89996001)(62966002)(48376002)(81342001)(50466002)(106466001)(104016003)(20776003)(86152002)(110136001)(81542001)(92566001)(79102001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB159;
	H:az84smr01.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:
X-Forefront-PRVS: 028166BF91
Received-SPF: Fail (: domain of freescale.com does not designate 192.88.158.2
	as permitted sender) receiver=; client-ip=192.88.158.2;
	helo=az84smr01.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=ting.liu@freescale.com; 
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH] xterm: disable-rpath-hack to avoid QA issue
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
X-List-Received-Date: Wed, 23 Jul 2014 06:22:06 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Fix:
| .../packages-split/xterm/usr/bin/resize contains bad RPATH.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 meta-oe/recipes-graphics/xorg-app/xterm_303.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_303.bb b/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
index 61890ab..fad07d9 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_303.bb
@@ -13,6 +13,7 @@ EXTRA_OECONF = " --x-includes=${STAGING_INCDIR} \
                  --x-libraries=${STAGING_LIBDIR} \
                  FREETYPE_CONFIG=${STAGING_BINDIR_CROSS}/freetype-config \
                  --disable-imake \
+                 --disable-rpath-hack \
                  --disable-setuid"
 
 B = "${S}"
-- 
1.8.3.2


