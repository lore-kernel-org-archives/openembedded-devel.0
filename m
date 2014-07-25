Return-Path: <ting.liu@freescale.com>
Received: from na01-bn1-obe.outbound.protection.outlook.com
	(mail-bn1lp0142.outbound.protection.outlook.com [207.46.163.142])
	by mail.openembedded.org (Postfix) with ESMTP id 014D470746
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:06:13 +0000 (UTC)
Received: from BY2PR03CA039.namprd03.prod.outlook.com (10.141.249.12) by
	BY2PR03MB158.namprd03.prod.outlook.com (10.242.36.15) with Microsoft
	SMTP Server (TLS) id 15.0.990.7; Fri, 25 Jul 2014 10:06:12 +0000
Received: from BN1BFFO11FD057.protection.gbl (2a01:111:f400:7c10::1:118) by
	BY2PR03CA039.outlook.office365.com (2a01:111:e400:2c5d::12) with
	Microsoft SMTP Server (TLS) id 15.0.995.14 via Frontend Transport;
	Fri, 25 Jul 2014 10:06:12 +0000
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD057.mail.protection.outlook.com (10.58.145.12) with
	Microsoft SMTP Server (TLS) id 15.0.980.11 via Frontend Transport;
	Fri, 25 Jul 2014 10:06:11 +0000
Received: from b28495.ap.freescale.net (b28495.ap.freescale.net [10.193.20.99])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	s6PA662U025130; Fri, 25 Jul 2014 03:06:09 -0700
From: <ting.liu@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Jul 2014 18:08:15 +0800
Message-ID: <1406282895-19011-2-git-send-email-ting.liu@freescale.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1406282895-19011-1-git-send-email-ting.liu@freescale.com>
References: <1406282895-19011-1-git-send-email-ting.liu@freescale.com>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:192.88.168.50; CTRY:US; IPV:CAL; IPV:NLI;
	EFV:NLI; SFV:NSPM;
	SFS:(6009001)(199002)(189002)(21056001)(85306003)(47776003)(68736004)(6806004)(81342001)(99396002)(110136001)(102836001)(86362001)(105606002)(15975445006)(76176999)(2351001)(80022001)(50466002)(74502001)(64706001)(97736001)(86152002)(77156001)(76482001)(4396001)(31966008)(92726001)(46102001)(36756003)(26826002)(93916002)(62966002)(104166001)(50226001)(95666004)(89996001)(44976005)(85852003)(92566001)(87936001)(106466001)(83322001)(104016003)(77982001)(20776003)(74662001)(575784001)(87286001)(107046002)(33646002)(19580405001)(83072002)(15202345003)(48376002)(81542001)(88136002)(79102001)(229853001)(19580395003)(50986999)(84676001);
	DIR:OUT; SFP:; SCL:1; SRVR:BY2PR03MB158;
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
Subject: [meta-oe][PATCH 2/2] ipsec-tools: enable Dead Peer Detection and NAT traversal
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
X-List-Received-Date: Fri, 25 Jul 2014 10:06:14 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

* Dead peer detection (DPD) is a method that network devices use to verify
  the current existence and availability of other peer devices.
* NAT traversal (sometimes abbreviated as NAT-T) is a general term for
  techniques that establish and maintain Internet protocol connections
  traversing network address translation (NAT) gateways

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../ipsec-tools/ipsec-tools_0.8.1.bb               |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
index 2e5c0a4..eed5b92 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -49,6 +49,8 @@ EXTRA_OECONF = "--with-kernel-headers=${STAGING_INCDIR} \
                 --without-libpam \
                 --disable-security-context \
                 --enable-shared \
+                --enable-dpd \
+                --enable-natt=yes \
                 ${@base_contains('DISTRO_FEATURES', 'ipv6', '--enable-ipv6=yes', '', d)}"
 
 # See http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=530527
-- 
1.7.3.4


