Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UIWGt-0001Hc-Cc
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 04:34:32 +0100
Received: from mail107-co9-R.bigfish.com (10.236.132.231) by
	CO9EHSOBE014.bigfish.com (10.236.130.77) with Microsoft SMTP Server id
	14.1.225.23; Thu, 21 Mar 2013 02:32:18 +0000
Received: from mail107-co9 (localhost [127.0.0.1])	by
	mail107-co9-R.bigfish.com (Postfix) with ESMTP id 35ADE2C00A3	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:32:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail107-co9 (localhost.localdomain [127.0.0.1]) by mail107-co9
	(MessageSwitch) id 1363833136524871_10843;
	Thu, 21 Mar 2013 02:32:16 +0000 (UTC)
Received: from CO9EHSMHS028.bigfish.com (unknown [10.236.132.237])	by
	mail107-co9.bigfish.com (Postfix) with ESMTP id 7D850C005C	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 02:32:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS028.bigfish.com
	(10.236.130.38) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 21 Mar 2013 02:32:13 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 21 Mar 2013 02:32:12 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r2L2W8IT026626;	Wed, 20 Mar 2013 19:32:10 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Mar 2013 10:32:05 +0800
Message-ID: <1363833125-9370-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Chunrong Guo <B40290@freescale.com>, B19537@freescale.com
Subject: [OE-core][PATCH] fmlib: update to the commit for sdk 1.3.2
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
X-List-Received-Date: Thu, 21 Mar 2013 03:34:32 -0000
Content-Type: text/plain

From: Chunrong Guo <b40290@freescale.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 recipes-ucode/fmlib/fmlib_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-ucode/fmlib/fmlib_git.bb b/recipes-ucode/fmlib/fmlib_git.bb
index 74eb204..038f899 100644
--- a/recipes-ucode/fmlib/fmlib_git.bb
+++ b/recipes-ucode/fmlib/fmlib_git.bb
@@ -3,11 +3,13 @@ SECTION = "fman"
 LICENSE = "BSD & GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3f16fa8e677e45af3127c5c4bafc3c00"
 
+PR = "r1"
+
 DEPENDS = "linux-libc-headers"
 DEPENDS_virtclass-native = ""
 
 SRC_URI = "git://git.freescale.com/ppc/sdk/fmlib.git"
-SRCREV = "5ebbf75c3108404b513198c9fd9b955b123680af"
+SRCREV = "e80c0625d4f2671ac4f15cabfdd1b334143eb515"
 
 S = "${WORKDIR}/git"
 
@@ -34,6 +36,6 @@ do_install_virtclass-native () {
       cp -rf ${S}/include/* ${D}/${includedir}
 }
 
-ALLOW_EMPTY = "1"
+ALLOW_EMPTY_${PN} = "1"
 
 BBCLASSEXTEND = "native"
-- 
1.7.5.4




