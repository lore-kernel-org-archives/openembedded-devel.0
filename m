Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SsGaK-0003nz-FR
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2012 19:01:48 +0200
Received: from mail39-ch1-R.bigfish.com (10.43.68.237) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Fri, 20 Jul 2012 16:35:19 +0000
Received: from mail39-ch1 (localhost [127.0.0.1])	by mail39-ch1-R.bigfish.com
	(Postfix) with ESMTP id AD212E038C	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:35:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275ch8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail39-ch1 (localhost.localdomain [127.0.0.1]) by mail39-ch1
	(MessageSwitch) id 1342802116582435_29717;
	Fri, 20 Jul 2012 16:35:16 +0000 (UTC)
Received: from CH1EHSMHS022.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail39-ch1.bigfish.com (Postfix) with ESMTP id
	8C1B54A0123 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:35:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS022.bigfish.com
	(10.43.70.22) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 20 Jul 2012 16:35:15 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Fri, 20 Jul 2012 11:35:13 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6KGZCog004162 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2012 09:35:13 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 20 Jul 2012 11:35:12 -0500
Message-ID: <1342802112-9917-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Fri, 20 Jul 2012 17:01:48 -0000
Content-Type: text/plain

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta-oe/recipes-support/cramfs/cramfs_cvs.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
index 667097c..d9b6c06 100644
--- a/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
+++ b/meta-oe/recipes-support/cramfs/cramfs_cvs.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/linux/COPYING;md5=9579385572eb40eded61dcb0
 DEPENDS = "zlib"
 SRCDATE = "20110110"
 PV = "1.1+cvs${SRCDATE}"
+PR = "r1"
 
 SRC_URI = "cvs://anonymous@cramfs.cvs.sourceforge.net/cvsroot/cramfs;module=linux"
 S = "${WORKDIR}/linux/scripts/cramfs"
@@ -16,7 +17,7 @@ EXTRA_OEMAKE = "\
 
 
 do_compile_prepend() {
-        ln -s GNUmakefile Makefile
+        ln -sf GNUmakefile Makefile
 }
 
 do_install() {
-- 
1.7.10




