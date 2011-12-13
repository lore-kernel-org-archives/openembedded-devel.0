Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RaJSK-00010x-0q
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 04:55:04 +0100
Received: from mail158-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.23; Tue, 13 Dec 2011 03:17:55 +0000
Received: from mail158-ch1 (localhost [127.0.0.1])	by
	mail158-ch1-R.bigfish.com (Postfix) with ESMTP id 2A19E44013A	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 03:17:55 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz1432Nzz1202hzz8275bh8275dhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail158-ch1 (localhost.localdomain [127.0.0.1]) by mail158-ch1
	(MessageSwitch) id 132374627365973_10249;
	Tue, 13 Dec 2011 03:17:53 +0000 (UTC)
Received: from CH1EHSMHS005.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail158-ch1.bigfish.com (Postfix) with ESMTP id
	0BEEDA0045 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 03:17:53 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS005.bigfish.com
	(10.43.70.5) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 13 Dec 2011 03:17:52 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 12 Dec 2011 21:17:54 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197] (may
	be forged))	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pBD3HqdH029069;	Mon, 12 Dec 2011 21:17:53 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 13 Dec 2011 11:20:23 +0800
Message-ID: <1323746424-18637-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH mate-oe 1/2] xmlto: add
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
X-List-Received-Date: Tue, 13 Dec 2011 03:55:04 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    > 'xmlto' converts an XML file (DocBook or XSL-FO) into a specified format
      (PS, PDF, HTML, man, ASCII, XSL-FO, etc.).

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb

diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
new file mode 100644
index 0000000..dcbf799
--- /dev/null
+++ b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "A shell-script tool for converting XML files to various formats" 
+SECTION = "docs/xmlto" 
+LICENSE = "GPLv2" 
+HOMEPAGE = "https://fedorahosted.org/xmlto/" 
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz" 
+
+inherit autotools  
+
+SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
+SRC_URI[sha256sum] = "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
+
+BBCLASSEXTEND = "native nativesdk"
+
-- 
1.7.0.4




