Return-Path: <ting.liu@freescale.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2lp0208.outbound.protection.outlook.com [207.46.163.208])
	by mail.openembedded.org (Postfix) with ESMTP id 08C5560438
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Aug 2014 10:39:53 +0000 (UTC)
Received: from BL2PR03MB148.namprd03.prod.outlook.com (10.255.230.27) by
	BL2PR03MB403.namprd03.prod.outlook.com (10.141.91.148) with Microsoft
	SMTP Server (TLS) id 15.0.1005.10; Tue, 12 Aug 2014 10:39:47 +0000
Received: from BY2PR03CA066.namprd03.prod.outlook.com (10.141.249.39) by
	BL2PR03MB148.namprd03.prod.outlook.com (10.255.230.27) with Microsoft
	SMTP Server (TLS) id 15.0.1005.10; Tue, 12 Aug 2014 10:39:46 +0000
Received: from BY2FFO11FD044.protection.gbl (2a01:111:f400:7c0c::189) by
	BY2PR03CA066.outlook.office365.com (2a01:111:e400:2c5d::39) with
	Microsoft SMTP Server (TLS) id 15.0.1005.10 via Frontend Transport;
	Tue, 12 Aug 2014 10:39:45 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BY2FFO11FD044.mail.protection.outlook.com (10.1.14.229) with Microsoft
	SMTP
	Server (TLS) id 15.0.1010.11 via Frontend Transport; Tue, 12 Aug 2014
	10:39:45 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s7CAdfu7012663; Tue, 12 Aug 2014 03:39:43 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 12 Aug 2014 18:44:14 +0800
Message-ID: <1407840254-3381-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199003)(189002)(21056001)(50466002)(76482001)(102836001)(50226001)(47776003)(20776003)(4396001)(36756003)(64706001)(6806004)(48376002)(87286001)(26826002)(88136002)(97736001)(46102001)(92566001)(84676001)(104166001)(83072002)(89996001)(92726001)(79102001)(85852003)(86362001)(86152002)(87936001)(77156001)(62966002)(106466001)(33646002)(99396002)(50986999)(93916002)(31966008)(74502001)(74662001)(2351001)(107046002)(19580395003)(77982001)(83322001)(44976005)(68736004)(95666004)(85306004)(81542001)(104016003)(80022001)(110136001)(229853001)(19580405001)(81342001)(105606002);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB148;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; A:1; MX:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;UriScan:;
X-Forefront-PRVS: 0301360BF5
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=ting.liu@freescale.com; 
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH] inetutils: not use auto-detected login for telnetd
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
X-List-Received-Date: Tue, 12 Aug 2014 10:40:00 -0000
Content-Type: text/plain

From: Ting Liu <ting.liu@freescale.com>

Below error appears as login was auto-detected by default:
| telnetd: /usr/bin/login -p -h 192.168.2.1 : No such file or directory.
| Connection closed by foreign host.

Signed-off-by: Ting Liu <ting.liu@freescale.com>
---
 .../inetutils/inetutils_1.9.1.bb                   |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
index 0e47015..315e374 100644
--- a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
+++ b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
@@ -37,6 +37,7 @@ PACKAGECONFIG[uucpd] = "--enable-uucpd,--disable-uucpd,readline"
 
 EXTRA_OECONF = "--with-ncurses-include-dir=${STAGING_INCDIR} \
         ${noipv6} \
+        inetutils_cv_path_login=${base_bindir}/login \
         --with-libreadline-prefix=${STAGING_LIBDIR} \
         --enable-rpath=no \
 "
-- 
1.7.3.4


