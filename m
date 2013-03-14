Received: from co1ehsobe005.messaging.microsoft.com ([216.32.180.188]
	helo=co1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1UFyIi-0001CQ-Br
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Mar 2013 03:54:18 +0100
Received: from mail62-co1-R.bigfish.com (10.243.78.225) by
	CO1EHSOBE038.bigfish.com (10.243.66.103) with Microsoft SMTP Server id
	14.1.225.23; Thu, 14 Mar 2013 02:37:09 +0000
Received: from mail62-co1 (localhost [127.0.0.1])	by mail62-co1-R.bigfish.com
	(Postfix) with ESMTP id B5ABC840109	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 02:37:09 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275ch17326ah8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail62-co1 (localhost.localdomain [127.0.0.1]) by mail62-co1
	(MessageSwitch) id 1363228627921100_6181;
	Thu, 14 Mar 2013 02:37:07 +0000 (UTC)
Received: from CO1EHSMHS028.bigfish.com (unknown [10.243.78.232])	by
	mail62-co1.bigfish.com (Postfix) with ESMTP id DE20474004F	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 14 Mar 2013 02:37:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS028.bigfish.com
	(10.243.66.38) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 14 Mar 2013 02:37:07 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Thu, 14 Mar 2013 02:37:07 +0000
Received: from b28495.ap.freescale.net (udp143739uds.ap.freescale.net
	[10.192.208.202])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r2E2b36E011742;	Wed, 13 Mar 2013 19:37:05 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 14 Mar 2013 10:37:03 +0800
Message-ID: <1363228623-2182-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH v3] tclap: initial add 1.2.1
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
X-List-Received-Date: Thu, 14 Mar 2013 02:54:19 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

TCLAP (Templatized C++ Command Line Parser Library ) is a small,
flexible library that provides a simple interface for defining
and accessing command line arguments.

Use the commit of tag tclap-1-2-1-release-final.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
new file mode 100644
index 0000000..311287a
--- /dev/null
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Templatized C++ Command Line Parser"
+HOMEPAGE = "http://tclap.sourceforge.net/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
+
+SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
+SRC_URI = "git://tclap.git.sourceforge.net/gitroot/tclap/tclap"
+
+S = "${WORKDIR}/git"
+inherit autotools
+
+do_install_prepend() {
+    install -d ${S}/docs/html
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4




