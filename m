Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RdFJB-0002lv-56
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Dec 2011 07:05:45 +0100
Received: from mail111-ch1-R.bigfish.com (10.43.68.241) by
	CH1EHSOBE008.bigfish.com (10.43.70.58) with Microsoft SMTP Server id
	14.1.225.23; Wed, 21 Dec 2011 05:58:31 +0000
Received: from mail111-ch1 (localhost [127.0.0.1])	by
	mail111-ch1-R.bigfish.com (Postfix) with ESMTP id 7AA04E0313	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:59:01 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(z21eN98bRzzz1202hzz8275bh8275dhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail111-ch1 (localhost.localdomain [127.0.0.1]) by mail111-ch1
	(MessageSwitch) id 1324447139398470_11505;
	Wed, 21 Dec 2011 05:58:59 +0000 (UTC)
Received: from CH1EHSMHS019.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail111-ch1.bigfish.com (Postfix) with ESMTP id
	5C96FC0050 for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:58:59 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS019.bigfish.com
	(10.43.70.19) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 21 Dec 2011 05:58:28 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server id 14.1.355.3; Tue, 20 Dec 2011 23:58:36 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBL5wYWV015654;
	Tue, 20 Dec 2011 23:58:35 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 21 Dec 2011 14:01:38 +0800
Message-ID: <1324447304-4874-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH v2 meta-oe 1/7] xmlto: add version 0.0.25
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
X-List-Received-Date: Wed, 21 Dec 2011 06:05:46 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    xmlto converts an XML file (DocBook or XSL-FO) into a specified format
    (PS, PDF, HTML, man, ASCII, XSL-FO, etc.)

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb

diff --git a/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
new file mode 100644
index 0000000..806ea2e
--- /dev/null
+++ b/meta-oe/recipes-support/xmlto/xmlto_0.0.25.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A shell-script tool for converting XML files to various formats" 
+HOMEPAGE = "https://fedorahosted.org/xmlto/" 
+SECTION = "docs/xmlto" 
+LICENSE = "GPLv2" 
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+SRC_URI = "https://fedorahosted.org/releases/x/m/xmlto/xmlto-${PV}.tar.gz" 
+SRC_URI[md5sum] = "a88cd3f08789b4825d1ac89fa065170d"
+SRC_URI[sha256sum] = "c52b56d929e8d20fc19cd3b7ec238f8d039730c56ee311cc352e843147e3e31a"
+
+inherit autotools  
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.0.4




