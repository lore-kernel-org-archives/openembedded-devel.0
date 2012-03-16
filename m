Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1S8Uz6-0000ru-Vy
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Mar 2012 12:06:13 +0100
Received: from mail63-tx2-R.bigfish.com (10.9.14.241) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Mar 2012 10:57:24 +0000
Received: from mail63-tx2 (localhost [127.0.0.1])	by mail63-tx2-R.bigfish.com
	(Postfix) with ESMTP id 2A4191C0433	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2012 10:57:24 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bh8275dhz2dh2a8h668h839hd24h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail63-tx2 (localhost.localdomain [127.0.0.1]) by mail63-tx2
	(MessageSwitch) id 13318954434754_32353; Fri, 16 Mar 2012 10:57:23 +0000
	(UTC)
Received: from TX2EHSMHS040.bigfish.com (unknown [10.9.14.250])	by
	mail63-tx2.bigfish.com (Postfix) with ESMTP id E64D53400F0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2012 10:57:22 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS040.bigfish.com
	(10.9.99.140) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Mar 2012 10:57:22 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.1.355.3; Fri, 16 Mar 2012 05:57:21 -0500
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id q2GAvJnS005581;
	Fri, 16 Mar 2012 03:57:20 -0700
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Mar 2012 19:07:11 +0800
Message-ID: <1331896031-19776-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] strongswan: upgrade to 4.6.2
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
X-List-Received-Date: Fri, 16 Mar 2012 11:06:13 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../recipes-support/strongswan/strongswan_4.5.1.bb |   21 --------------------
 .../recipes-support/strongswan/strongswan_4.6.2.bb |   21 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)
 delete mode 100644 meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
 create mode 100644 meta-oe/recipes-support/strongswan/strongswan_4.6.2.bb

diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb b/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
deleted file mode 100644
index 3276fdd..0000000
--- a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
-Linux operating system."
-HOMEPAGE = "http://www.strongswan.org"
-SECTION = "console/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-DEPENDS = "gmp openssl flex-native flex bison-native"
-
-SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
-SRC_URI[md5sum] = "81a4a699c4a1a49b74061dfa47b5a033"
-SRC_URI[sha256sum] = "252d7369d94aa2d79e6fad078853b07ca897ea811ab1e1a2b008bcec0d1e758a"
-
-EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
-		--enable-gmp --disable-mysql --disable-sqlite \
-		--enable-openssl"
-
-inherit autotools
-
-RRECOMMENDS_${PN} = "kernel-module-ipsec"
-
-FILES_${PN}-dbg += "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plugins/.debug"
diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.6.2.bb b/meta-oe/recipes-support/strongswan/strongswan_4.6.2.bb
new file mode 100644
index 0000000..3816e57
--- /dev/null
+++ b/meta-oe/recipes-support/strongswan/strongswan_4.6.2.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "strongSwan is an OpenSource IPsec implementation for the \
+Linux operating system."
+HOMEPAGE = "http://www.strongswan.org"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "gmp openssl flex-native flex bison-native"
+
+SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
+SRC_URI[md5sum] = "ed64e6746011930a70f3a271dc0e3c9e"
+SRC_URI[sha256sum] = "a5ecb3fc60a94ded9197532c7ebf42e8e321223311e4a4834ea15219aa1625e4"
+
+EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
+		--enable-gmp --disable-mysql --disable-sqlite \
+		--enable-openssl"
+
+inherit autotools
+
+RRECOMMENDS_${PN} = "kernel-module-ipsec"
+
+FILES_${PN}-dbg += "${libexecdir}/ipsec/.debug ${libexecdir}/ipsec/plugins/.debug"
-- 
1.7.0.4




