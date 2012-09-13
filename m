Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TC0eD-0007UF-1R
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 06:03:26 +0200
Received: from mail45-co1-R.bigfish.com (10.243.78.234) by
	CO1EHSOBE014.bigfish.com (10.243.66.77) with Microsoft SMTP Server id
	14.1.225.23; Thu, 13 Sep 2012 02:50:20 +0000
Received: from mail45-co1 (localhost [127.0.0.1])	by mail45-co1-R.bigfish.com
	(Postfix) with ESMTP id 9613E280158	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 02:50:20 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h12bdh12e5h1155h)
Received: from mail45-co1 (localhost.localdomain [127.0.0.1]) by mail45-co1
	(MessageSwitch) id 1347504618575862_2798;
	Thu, 13 Sep 2012 02:50:18 +0000 (UTC)
Received: from CO1EHSMHS029.bigfish.com (unknown [10.243.78.232])	by
	mail45-co1.bigfish.com (Postfix) with ESMTP id 87BEEE0046	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 02:50:18 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS029.bigfish.com
	(10.243.66.39) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 13 Sep 2012 02:50:16 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Wed, 12 Sep 2012 21:50:06 -0500
Received: from bjsimics-desktop.ap.freescale.net
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q8D2o4WD014541;
	Wed, 12 Sep 2012 19:50:05 -0700
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 13 Sep 2012 11:07:07 +0800
Message-ID: <1347505627-17550-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: msm@freescale.com
Subject: [meta-oe] libnfnetlink: use a correct LIC_FILES_CHKSUM
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
X-List-Received-Date: Thu, 13 Sep 2012 04:03:26 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    The current LIC_FILES_CHKSUM checks the copyright/license from the
    generated Makefile.in, this is not correct.
    Since there is no seperated license/copying file, this fixes it to 
    use license content in src/libnfnetlink.c instead.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../libnfnetlink/libnfnetlink_1.0.0.bb             |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
index 1ce5912..f4a65f0 100644
--- a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
+++ b/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
@@ -7,7 +7,9 @@ HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
 SECTION = "devel/libs"
 LICENSE = "GPLv2+"
 
-LIC_FILES_CHKSUM = "file://Makefile.in;endline=13;md5=a44bb8f4c22793d55c5e879eec256702"
+PR = "r1"
+
+LIC_FILES_CHKSUM = "file://src/libnfnetlink.c;beginline=3;endline=11;md5=28bd3bf7f60a78101491eef6b9bb9eba"
 
 SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=libnfnetlink-${PV}"
 SRC_URI[libnfnetlink-1.0.0.md5sum] = "016fdec8389242615024c529acc1adb8"
-- 
1.7.9.5




