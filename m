Return-Path: <Lauren.Post@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe006.messaging.microsoft.com [216.32.180.16])
	by mail.openembedded.org (Postfix) with ESMTP id 280216FA52
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 16:47:19 +0000 (UTC)
Received: from mail151-va3-R.bigfish.com (10.7.14.236) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 21 Mar 2014 16:47:18 +0000
Received: from mail151-va3 (localhost [127.0.0.1])	by
	mail151-va3-R.bigfish.com (Postfix) with ESMTP id 4F8C946024A;
	Fri, 21 Mar 2014 16:47:18 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh8275dh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail151-va3 (localhost.localdomain [127.0.0.1]) by mail151-va3
	(MessageSwitch) id 1395420431625765_21130;
	Fri, 21 Mar 2014 16:47:11 +0000 (UTC)
Received: from VA3EHSMHS021.bigfish.com (unknown [10.7.14.241])	by
	mail151-va3.bigfish.com (Postfix) with ESMTP id 8F9D5C004E;
	Fri, 21 Mar 2014 16:47:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS021.bigfish.com
	(10.7.99.31) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 21 Mar 2014 16:47:07 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 21 Mar 2014 16:47:06 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id s2LGl5s5013424;
	Fri, 21 Mar 2014 09:47:06 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 21 Mar 2014 11:35:16 -0500
Message-ID: <1395419717-32210-1-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <lauren.post@freescale.com>
References: <lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 1/2] can-utils: Create git version
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
X-List-Received-Date: Fri, 21 Mar 2014 16:47:20 -0000
Content-Type: text/plain

Linux CAN network development utilities - newer version than canutils

Signed-off-by: Lauren Post <lauren.post@freescale.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

---
 .../recipes-extended/socketcan/can-utils_git.bb    |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils_git.bb

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_git.bb b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
new file mode 100644
index 0000000..d8de9df
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils_git.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Linux CAN network development utilities"
+DESCRIPTION = "Linux CAN network development"
+LICENSE = "GPLv2 & BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=43;md5=390a2c9a3c5e3595a069ac1436553ee7"
+
+DEPENDS = "libsocketcan"
+
+SRC_URI = "git://git.gitorious.org/linux-can/${BPN}.git;protocol=git;branch=master"
+SRCREV = "67a2bdcd336e6becfa5784742e18c88dbeddc973"
+
+PV = "0.0+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
-- 
1.7.9.5



