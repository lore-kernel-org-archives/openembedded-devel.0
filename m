Received: from co1ehsobe003.messaging.microsoft.com ([216.32.180.186]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SnApl-0000hJ-Vy
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Jul 2012 17:52:42 +0200
Received: from mail169-co1-R.bigfish.com (10.243.78.234) by
	CO1EHSOBE010.bigfish.com (10.243.66.73) with Microsoft SMTP Server id
	14.1.225.23; Fri, 6 Jul 2012 15:24:18 +0000
Received: from mail169-co1 (localhost [127.0.0.1])	by
	mail169-co1-R.bigfish.com (Postfix) with ESMTP id DC64380016B	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2012 15:24:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275ch8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail169-co1 (localhost.localdomain [127.0.0.1]) by mail169-co1
	(MessageSwitch) id 1341588256456732_4464;
	Fri,  6 Jul 2012 15:24:16 +0000 (UTC)
Received: from CO1EHSMHS030.bigfish.com (unknown [10.243.78.247])	by
	mail169-co1.bigfish.com (Postfix) with ESMTP id 641A3600044	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  6 Jul 2012 15:24:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS030.bigfish.com
	(10.243.66.40) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 6 Jul 2012 15:24:16 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Fri, 6 Jul 2012 10:26:23 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q66FQMg1029534 for <openembedded-devel@lists.openembedded.org>;
	Fri, 6 Jul 2012 08:26:22 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 6 Jul 2012 10:26:22 -0500
Message-ID: <1341588382-17688-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] cramfs_cvs.bb: fix compile step so it can be rerun without failing
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Jul 2012 15:52:42 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta-oe/recipes-support/cramfs/cramfs_cvs.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
index 667097c..61a3fdd 100644
--- a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
+++ b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/linux/COPYING;md5=9579385572eb40eded61dcb0
 DEPENDS = "zlib"
 SRCDATE = "20110110"
 PV = "1.1+cvs${SRCDATE}"
+PR = "r1"
 
 SRC_URI = "cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;module=linux"
 S = "${WORKDIR}/linux/scripts/cramfs"
@@ -16,6 +17,7 @@ EXTRA_OEMAKE = "\
 
 
 do_compile_prepend() {
+	unlink Makefile || true
         ln -s GNUmakefile Makefile
 }
 
-- 
1.7.10




