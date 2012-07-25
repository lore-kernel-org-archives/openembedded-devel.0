Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B05471@freescale.com>) id 1Su4aj-0005Rv-Qb
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2012 18:37:42 +0200
Received: from mail75-ch1-R.bigfish.com (10.43.68.225) by
	CH1EHSOBE001.bigfish.com (10.43.70.51) with Microsoft SMTP Server id
	14.1.225.23; Wed, 25 Jul 2012 15:55:56 +0000
Received: from mail75-ch1 (localhost [127.0.0.1])	by mail75-ch1-R.bigfish.com
	(Postfix) with ESMTP id 67D741002AD	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 15:55:56 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -10
X-BigFish: VS-10(z98bRzzz1202hzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail75-ch1 (localhost.localdomain [127.0.0.1]) by mail75-ch1
	(MessageSwitch) id 1343231754999478_12451;
	Wed, 25 Jul 2012 15:55:54 +0000 (UTC)
Received: from CH1EHSMHS023.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.233])	by mail75-ch1.bigfish.com (Postfix) with ESMTP id
	F0BF24800C8 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 15:55:54 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS023.bigfish.com
	(10.43.70.23) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 25 Jul 2012 15:55:55 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Wed, 25 Jul 2012 10:55:53 -0500
Received: from localhost.localdomain ([10.171.77.122])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6PFtkdn014846	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 08:55:52 -0700
From: Horia Geanta <horia.geanta@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jul 2012 21:52:56 +0300
Message-ID: <1343242376-10509-1-git-send-email-horia.geanta@freescale.com>
X-Mailer: git-send-email 1.7.7.6
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH] strongswan: upgrade to version 5.0.0
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
X-List-Received-Date: Wed, 25 Jul 2012 16:37:43 -0000
Content-Type: text/plain

COPYING change is trivial:
http://git.strongswan.org/?p=strongswan.git;a=commitdiff;h=fbdef639d6ed3500bda9e330a2f57de5e833750c

Signed-off-by: Horia Geanta <horia.geanta@freescale.com>
---
 .../{strongswan_4.5.1.bb => strongswan_5.0.0.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/strongswan/{strongswan_4.5.1.bb => strongswan_5.0.0.bb} (73%)

diff --git a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
similarity index 73%
rename from meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
rename to meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
index 3276fdd..189cfa3 100644
--- a/meta-oe/recipes-support/strongswan/strongswan_4.5.1.bb
+++ b/meta-oe/recipes-support/strongswan/strongswan_5.0.0.bb
@@ -3,12 +3,12 @@ Linux operating system."
 HOMEPAGE = "http://www.strongswan.org"
 SECTION = "console/network"
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gmp openssl flex-native flex bison-native"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2"
-SRC_URI[md5sum] = "81a4a699c4a1a49b74061dfa47b5a033"
-SRC_URI[sha256sum] = "252d7369d94aa2d79e6fad078853b07ca897ea811ab1e1a2b008bcec0d1e758a"
+SRC_URI[md5sum] = "c8b861305def7c0abae04f7bbefec212"
+SRC_URI[sha256sum] = "efc13c86e715b5e596d9d8535640c830f83e977fe521afd2c70d68926c4b573e"
 
 EXTRA_OECONF = "--disable-curl --disable-soup --disable-ldap \
 		--enable-gmp --disable-mysql --disable-sqlite \
-- 
1.7.7.6




