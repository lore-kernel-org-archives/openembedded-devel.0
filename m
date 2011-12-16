Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbO0o-0004Fs-AG
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 03:59:06 +0100
Received: from mail10-tx2-R.bigfish.com (10.9.14.240) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 02:37:01 +0000
Received: from mail10-tx2 (localhost [127.0.0.1])	by mail10-tx2-R.bigfish.com
	(Postfix) with ESMTP id 07D352C0176	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 02:37:04 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275bh8275dhz2dh2a8h668h839hb79i62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail10-tx2 (localhost.localdomain [127.0.0.1]) by mail10-tx2
	(MessageSwitch) id 1324003023889677_26881;
	Fri, 16 Dec 2011 02:37:03 +0000 (UTC)
Received: from TX2EHSMHS035.bigfish.com (unknown [10.9.14.253])	by
	mail10-tx2.bigfish.com (Postfix) with ESMTP id D2BA014006D	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 02:37:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS035.bigfish.com
	(10.9.99.135) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 02:37:00 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 15 Dec 2011 20:36:59 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBG2alj3009971;
	Thu, 15 Dec 2011 20:36:58 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 10:39:31 +0800
Message-ID: <1324003173-13994-7-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324003173-13994-1-git-send-email-b19537@freescale.com>
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe 7/9] strongswan: add
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
X-List-Received-Date: Fri, 16 Dec 2011 02:59:06 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    strongSwan is an OpenSource IPsec implementation for the Linux operating system.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../recipes-support/strongswan/strongswan_4.5.1.bb |   23 ++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb

diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
new file mode 100644
index 0000000..a692637
--- /dev/null
+++ b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
@@ -0,0 +1,23 @@
+SECTION = "console/network"
+DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
+Linux operating system."
+HOMEPAGE = "http://www.strongswan.org"
+LICENSE = "GPLv2"
+DEPENDS = "gmp openssl flex-native flex bison-native"
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
+
+EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
+		--enable-gmp --disable-mysql --disable-sqlite \
+		--enable-openssl"
+
+inherit autotools
+
+FILES_${PN}-dbg += "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plugins/.debug"
+
+SRC_URI[md5sum] = "81a4a699c4a1a49b74061dfa47b5a033"
+SRC_URI[sha256sum] = "252d7369d94aa2d79e6fad078853b07ca897ea811ab1e1a2b008bcec0d1e758a"
-- 
1.7.0.4




