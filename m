Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1UFdRn-0006zJ-Li
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 05:37:51 +0100
Received: from mail30-db3-R.bigfish.com (10.3.81.235) by
	DB3EHSOBE002.bigfish.com (10.3.84.22) with Microsoft SMTP Server id
	14.1.225.23; Wed, 13 Mar 2013 03:50:51 +0000
Received: from mail30-db3 (localhost [127.0.0.1])	by mail30-db3-R.bigfish.com
	(Postfix) with ESMTP id 218DA2E0273	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 03:50:51 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275ch17326ah8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail30-db3 (localhost.localdomain [127.0.0.1]) by mail30-db3
	(MessageSwitch) id 1363146648603441_9609;
	Wed, 13 Mar 2013 03:50:48 +0000 (UTC)
Received: from DB3EHSMHS006.bigfish.com (unknown [10.3.81.245])	by
	mail30-db3.bigfish.com (Postfix) with ESMTP id 8A8C94004C	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 03:50:48 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS006.bigfish.com
	(10.3.87.106) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 13 Mar 2013 03:50:48 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 13 Mar 2013 03:50:46 +0000
Received: from b28495.ap.freescale.net (udp143739uds.ap.freescale.net
	[10.192.208.202])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r2D3oh3n022374;	Tue, 12 Mar 2013 20:50:44 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Mar 2013 11:50:43 +0800
Message-ID: <1363146643-30820-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH] tclap: initial add 1.2.1
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
X-List-Received-Date: Wed, 13 Mar 2013 04:37:52 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

TCLAP (Templatized C++ Command Line Parser Library ) is a small,
flexible library that provides a simple interface for defining
and accessing command line arguments. Templatized C++ Command
Line Parser Library.

Use the commit of tag tclap-1-2-1-release-final.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
new file mode 100644
index 0000000..c2b03a4
--- /dev/null
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Templatized C++ Command Line Parser" 
+HOMEPAGE = "http://tclap.sourceforge.net/" 
+SECTION = "tclap" 
+LICENSE = "MIT" 
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
+
+SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
+SRC_URI = "git://tclap.git.sourceforge.net/gitroot/tclap/tclap" 
+
+S = "${WORKDIR}/git"
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.3.4




