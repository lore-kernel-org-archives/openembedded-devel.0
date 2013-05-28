Return-Path: <B19537@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe004.messaging.microsoft.com [216.32.181.184])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF296A36E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 04:34:34 +0000 (UTC)
Received: from mail82-ch1-R.bigfish.com (10.43.68.234) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Tue, 28 May 2013 04:34:35 +0000
Received: from mail82-ch1 (localhost [127.0.0.1])	by mail82-ch1-R.bigfish.com
	(Postfix) with ESMTP id E517E4806C9	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 04:34:34 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1155h)
Received: from mail82-ch1 (localhost.localdomain [127.0.0.1]) by mail82-ch1
	(MessageSwitch) id 1369715671399653_3344;
	Tue, 28 May 2013 04:34:31 +0000 (UTC)
Received: from CH1EHSMHS019.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.244])	by mail82-ch1.bigfish.com (Postfix) with ESMTP id
	5B552805A6 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 04:34:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS019.bigfish.com
	(10.43.70.19) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 28 May 2013 04:34:31 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 28 May 2013 04:35:25 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r4S4YRHB024991;
	Mon, 27 May 2013 21:34:28 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 28 May 2013 12:40:03 +0800
Message-ID: <1369716003-8053-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>, b40527@freescale.com
Subject: [meta-oe][PATCH] debianutils: fix for multilib build
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
X-List-Received-Date: Tue, 28 May 2013 04:34:34 -0000
Content-Type: text/plain

When do multilib build for debianutils, following error appear:
    ERROR: Function failed: Fetcher failure for URL:
    'ftp://ftp.debian.org/debian/pool/main/d/lib64-debianutils/lib64-debianutils_2.30.tar.gz'.
    Unable to fetch URL from any source.

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 .../debianutils/debianutils_2.30.bb                |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb b/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
index e6c03eb..8b378b0 100644
--- a/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
+++ b/meta-oe/recipes-support/debianutils/debianutils_2.30.bb
@@ -3,7 +3,9 @@ SECTION = "base"
 LICENSE = "GPLv2 & BSD & SMAIL_GPL"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=b948675029f79c64840e78881e91e1d4"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/d/${PN}/${PN}_${PV}.tar.gz"
+PR = "r1"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.gz"
 SRC_URI[md5sum] = "7fdd5f8395162d8728d4b79e97b9819e"
 SRC_URI[sha256sum] = "d62e98fee5b1a758d83b62eed8d8bdec473677ff782fed89fc4ae3ba3f381401"
 
-- 
1.7.9.5



