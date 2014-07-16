Return-Path: <ting.liu@freescale.com>
X-Greylist: delayed 914 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 16 Jul 2014 06:38:25 UTC
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0141.outbound.protection.outlook.com [207.46.163.141])
	by mail.openembedded.org (Postfix) with ESMTP id 32E27704D3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 06:38:25 +0000 (UTC)
Received: from DM2PR03CA003.namprd03.prod.outlook.com (10.141.52.151) by
	BL2PR03MB145.namprd03.prod.outlook.com (10.255.230.13) with Microsoft
	SMTP Server (TLS) id 15.0.985.8; Wed, 16 Jul 2014 06:23:11 +0000
Received: from BL2FFO11FD037.protection.gbl (2a01:111:f400:7c09::176) by
	DM2PR03CA003.outlook.office365.com (2a01:111:e400:2414::23) with
	Microsoft
	SMTP Server (TLS) id 15.0.990.7 via Frontend Transport; Wed, 16 Jul 2014
	06:23:10 +0000
Received: from az84smr01.freescale.net (192.88.158.2) by
	BL2FFO11FD037.mail.protection.outlook.com (10.173.161.133) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Wed, 16 Jul 2014 06:23:10 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s6G6N5ci011967;
	Tue, 15 Jul 2014 23:23:08 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Jul 2014 14:23:58 +0800
Message-ID: <1405491841-24744-1-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.158.2; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(97736001)(85306003)(77156001)(104166001)(47776003)(74502001)(74662001)(102836001)(68736004)(6806004)(4396001)(19580405001)(33646002)(19580395003)(26826002)(48376002)(50226001)(31966008)(62966002)(93916002)(77982001)(79102001)(104016003)(46102001)(85852003)(20776003)(81542001)(87286001)(99396002)(64706001)(36756003)(2351001)(110136001)(50466002)(89996001)(92566001)(81342001)(92726001)(105606002)(83072002)(95666004)(106466001)(229853001)(87936001)(21056001)(50986999)(44976005)(86362001)(84676001)(83322001)(88136002)(107046002)(80022001)(81156004)(76482001)(69596002)(86152002);
	DIR:OUT; SFP:; SCL:1; SRVR:BL2PR03MB145;
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
Subject: [meta-oe][PATCH 0/3] libhugetlbfs and luajit update
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
X-List-Received-Date: Wed, 16 Jul 2014 06:38:29 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Since there are several libhugetlbfs patches to be applied, generate
the patches based on meta-openembedded-contrib (jansa/master branch):

commit 76afdeedacf4497893359c5e9cb335ada6729e12
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Wed Jun 25 20:30:44 2014 +0200

    python-cython: Add git version

Ting Liu (3):
  libhugetlbfs: use ARCH ppc/ppc64 for powerpc/powerpc64
  libhugetlbfs: not build obj32 for powerpc64
  luajit: replace MACHINEOVERRIDES fslmachine with qoriq-ppc

 .../libhugetlbfs/libhugetlbfs_git.bb               |    6 +++++-
 meta-oe/recipes-devtools/luajit/luajit_2.0.3.bb    |    2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
1.7.3.4


