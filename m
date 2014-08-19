Return-Path: <B40869@freescale.com>
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2lp0242.outbound.protection.outlook.com [207.46.163.242])
	by mail.openembedded.org (Postfix) with ESMTP id 3E6F76FC63
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 07:10:11 +0000 (UTC)
Received: from CH1PR03CA012.namprd03.prod.outlook.com (10.255.156.157) by
	BY2PR0301MB0758.namprd03.prod.outlook.com (25.160.63.23) with Microsoft
	SMTP Server (TLS) id 15.0.1005.10; Tue, 19 Aug 2014 07:10:11 +0000
Received: from BN1BFFO11FD052.protection.gbl (10.255.156.132) by
	CH1PR03CA012.outlook.office365.com (10.255.156.157) with Microsoft SMTP
	Server (TLS) id 15.0.1010.18 via Frontend Transport; Tue, 19 Aug 2014
	07:10:10 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD052.mail.protection.outlook.com (10.58.145.7) with Microsoft
	SMTP
	Server (TLS) id 15.0.1010.11 via Frontend Transport; Tue, 19 Aug 2014
	07:10:10 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s7J7A30X015245; Tue, 19 Aug 2014 00:10:08 -0700
From: YangHaibo <b40869@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Aug 2014 15:01:49 +0800
Message-ID: <1408431709-5955-1-git-send-email-b40869@freescale.com>
X-Mailer: git-send-email 1.9.2
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(10019006)(6009001)(189002)(199003)(104166001)(20776003)(85852003)(83072002)(47776003)(89996001)(74502001)(102836001)(104016003)(33646002)(88136002)(92566001)(105606002)(97736001)(95666004)(77982001)(83322001)(44976005)(6806004)(229853001)(106466001)(50986999)(4396001)(85306004)(2351001)(81342001)(99396002)(80022001)(107046002)(79102001)(110136001)(74662001)(62966002)(76482001)(68736004)(46102001)(26826002)(86362001)(36756003)(64706001)(48376002)(77156001)(50466002)(87936001)(92726001)(50226001)(84676001)(87286001)(93916002)(21056001)(31966008)(81542001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0301MB0758;
	H:tx30smr01.am.freescale.net; FPR:; MLV:ovrnspm;
	PTR:InfoDomainNonexistent; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;UriScan:;
X-Forefront-PRVS: 0308EE423E
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=B40869@freescale.com; 
X-OriginatorOrg: freescale.com
Cc: YangHaibo <b40869@freescale.com>
Subject: [meta-oe][meta-webserver][PATCH] move fcgi-2.4.0 recipe and patch to correct folder
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
X-List-Received-Date: Tue, 19 Aug 2014 07:10:18 -0000
Content-Type: text/plain

---
 meta-webserver/recipes-support/{ => fcgi}/fcgi_2.4.0.bb                   | 0
 .../recipes-support/fcgi/{ => files}/Fix_EOF_not_declared_issue.patch     | 0
 .../fcgi/{ => files}/add_foreign_to_AM_INIT_AUTOMAKE.patch                | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-webserver/recipes-support/{ => fcgi}/fcgi_2.4.0.bb (100%)
 rename meta-webserver/recipes-support/fcgi/{ => files}/Fix_EOF_not_declared_issue.patch (100%)
 rename meta-webserver/recipes-support/fcgi/{ => files}/add_foreign_to_AM_INIT_AUTOMAKE.patch (100%)

diff --git a/meta-webserver/recipes-support/fcgi_2.4.0.bb b/meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
similarity index 100%
rename from meta-webserver/recipes-support/fcgi_2.4.0.bb
rename to meta-webserver/recipes-support/fcgi/fcgi_2.4.0.bb
diff --git a/meta-webserver/recipes-support/fcgi/Fix_EOF_not_declared_issue.patch b/meta-webserver/recipes-support/fcgi/files/Fix_EOF_not_declared_issue.patch
similarity index 100%
rename from meta-webserver/recipes-support/fcgi/Fix_EOF_not_declared_issue.patch
rename to meta-webserver/recipes-support/fcgi/files/Fix_EOF_not_declared_issue.patch
diff --git a/meta-webserver/recipes-support/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch b/meta-webserver/recipes-support/fcgi/files/add_foreign_to_AM_INIT_AUTOMAKE.patch
similarity index 100%
rename from meta-webserver/recipes-support/fcgi/add_foreign_to_AM_INIT_AUTOMAKE.patch
rename to meta-webserver/recipes-support/fcgi/files/add_foreign_to_AM_INIT_AUTOMAKE.patch
-- 
1.9.2


