Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SuSML-0006NZ-CW
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jul 2012 20:00:25 +0200
Received: from mail99-am1-R.bigfish.com (10.3.201.228) by
	AM1EHSOBE010.bigfish.com (10.3.204.30) with Microsoft SMTP Server id
	14.1.225.23; Thu, 26 Jul 2012 17:48:54 +0000
Received: from mail99-am1 (localhost [127.0.0.1])	by mail99-am1-R.bigfish.com
	(Postfix) with ESMTP id 2E5AD4E03DF	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2012 17:48:54 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275ch8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail99-am1 (localhost.localdomain [127.0.0.1]) by mail99-am1
	(MessageSwitch) id 1343324931925176_8512;
	Thu, 26 Jul 2012 17:48:51 +0000 (UTC)
Received: from AM1EHSMHS002.bigfish.com (unknown [10.3.201.248])	by
	mail99-am1.bigfish.com (Postfix) with ESMTP id DF822240052	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2012 17:48:51 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS002.bigfish.com
	(10.3.207.102) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 26 Jul 2012 17:48:52 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Thu, 26 Jul 2012 12:48:49 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6QHmnM6025912 for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2012 10:48:49 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 26 Jul 2012 12:48:48 -0500
Message-ID: <1343324928-4354-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.10
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe for-denzil] cramfs_cvs.bb: fix compile step so it can be rerun without failing
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
X-List-Received-Date: Thu, 26 Jul 2012 18:00:25 -0000
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




