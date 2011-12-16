Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbUbb-0001qt-FI
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 11:01:31 +0100
Received: from mail8-db3-R.bigfish.com (10.3.81.243) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 09:39:25 +0000
Received: from mail8-db3 (localhost [127.0.0.1])	by mail8-db3-R.bigfish.com
	(Postfix) with ESMTP id 13F892604F0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:39:34 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275bh8275dhz2dh2a8h668h839hb79i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail8-db3 (localhost.localdomain [127.0.0.1]) by mail8-db3
	(MessageSwitch) id 1324028373983089_3090;
	Fri, 16 Dec 2011 09:39:33 +0000 (UTC)
Received: from DB3EHSMHS005.bigfish.com (unknown [10.3.81.241])	by
	mail8-db3.bigfish.com (Postfix) with ESMTP id EB31B16004B	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 09:39:33 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS005.bigfish.com
	(10.3.87.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 09:39:25 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.355.3; Fri, 16 Dec 2011 03:39:23 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBG9dDjk008853;
	Fri, 16 Dec 2011 03:39:22 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 17:41:58 +0800
Message-ID: <1324028520-16474-6-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1324028520-16474-1-git-send-email-b19537@freescale.com>
References: <1324028520-16474-1-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe v2 6/8] strongswan: add
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
X-List-Received-Date: Fri, 16 Dec 2011 10:01:31 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    strongSwan is an OpenSource IPsec implementation for the Linux operating system.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../recipes-support/strongswan/strongswan_4.5.1.bb |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb

diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
new file mode 100644
index 0000000..9c5e736
--- /dev/null
+++ b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
+Linux operating system."
+HOMEPAGE = "http://www.strongswan.org"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
+SRC_URI[md5sum] = "81a4a699c4a1a49b74061dfa47b5a033"
+SRC_URI[sha256sum] = "252d7369d94aa2d79e6fad078853b07ca897ea811ab1e1a2b008bcec0d1e758a"
+
+EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
+		--enable-gmp --disable-mysql --disable-sqlite \
+		--enable-openssl"
+
+inherit autotools
+
+DEPENDS = "gmp openssl flex-native flex bison-native"
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
+
+FILES_${PN}-dbg += "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plugins/.debug"
-- 
1.7.0.4




