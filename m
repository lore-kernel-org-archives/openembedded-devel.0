Received: from va3ehsobe005.messaging.microsoft.com ([216.32.180.31]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1SCvCn-00014i-Hk
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Mar 2012 17:54:37 +0200
Received: from mail7-va3-R.bigfish.com (10.7.14.245) by
	VA3EHSOBE009.bigfish.com (10.7.40.29) with Microsoft SMTP Server id
	14.1.225.23; Wed, 28 Mar 2012 15:00:14 +0000
Received: from mail7-va3 (localhost [127.0.0.1])	by mail7-va3-R.bigfish.com
	(Postfix) with ESMTP id 93CCE38010E	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 15:00:14 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275ch8275bhz2dh2a8h668h839hd24h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail7-va3 (localhost.localdomain [127.0.0.1]) by mail7-va3
	(MessageSwitch) id 1332946812881327_7207;
	Wed, 28 Mar 2012 15:00:12 +0000 (UTC)
Received: from VA3EHSMHS016.bigfish.com (unknown [10.7.14.243])	by
	mail7-va3.bigfish.com (Postfix) with ESMTP id CFEA6120052	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2012 15:00:12 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS016.bigfish.com
	(10.7.99.26) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 28 Mar 2012 15:00:11 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Wed, 28 Mar 2012 10:00:11 -0500
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q2SF09wO015743;
	Wed, 28 Mar 2012 08:00:10 -0700
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 28 Mar 2012 23:10:49 +0800
Message-ID: <1332947449-3431-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] tclap: add v1.2.1
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
X-List-Received-Date: Wed, 28 Mar 2012 15:54:37 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb

diff --git a/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
new file mode 100644
index 0000000..85d6493
--- /dev/null
+++ b/meta-oe/recipes-devtools/tclap/tclap_1.2.1.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Templatized C++ Command Line Parser" 
+HOMEPAGE = "http://tclap.sourceforge.net/" 
+SECTION = "tclap" 
+LICENSE = "MIT" 
+LIC_FILES_CHKSUM = "file://COPYING;md5=c8ab0ff134bcc584d0e6b5b9f8732453"
+
+SRCREV = "3627d9402e529770df9b0edf2aa8c0e0d6c6bb41"
+SRC_URI = "git://tclap.git.sourceforge.net/gitroot/tclap/tclap;protocal=git;branch=master" 
+
+S = "${WORKDIR}/git"
+inherit autotools
+
+do_install_prepend() {
+    install -d ${S}/docs/html
+}
-- 
1.7.0.4




