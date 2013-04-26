Received: from ch1ehsobe003.messaging.microsoft.com ([216.32.181.183]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B40290@freescale.com>) id 1UVZvj-0004Xa-OZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Apr 2013 06:06:40 +0200
Received: from mail116-ch1-R.bigfish.com (10.43.68.246) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.23; Fri, 26 Apr 2013 03:18:44 +0000
Received: from mail116-ch1 (localhost [127.0.0.1])	by
	mail116-ch1-R.bigfish.com (Postfix) with ESMTP id 10B4B4203A5	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:18:44 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1155h)
Received: from mail116-ch1 (localhost.localdomain [127.0.0.1]) by mail116-ch1
	(MessageSwitch) id 1366946322195373_21324;
	Fri, 26 Apr 2013 03:18:42 +0000 (UTC)
Received: from CH1EHSMHS018.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.225])	by mail116-ch1.bigfish.com (Postfix) with ESMTP id
	2DC992A006E	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2013 03:18:42 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS018.bigfish.com
	(10.43.70.18) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 26 Apr 2013 03:18:42 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 26 Apr 2013 03:18:41 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r3Q3Ic0O025146;	Thu, 25 Apr 2013 20:18:39 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Apr 2013 11:18:35 +0800
Message-ID: <1366946315-19589-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Chunrong Guo <B40290@freescale.com>, B19537@freescale.com
Subject: [OE-core][PATCH] connman: tist of connman do not support powerpc64
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
X-List-Received-Date: Fri, 26 Apr 2013 04:06:47 -0000
Content-Type: text/plain

    connman build for powerpc 64bit boards were producing errors like this:
    | make[1]: *** [plugins/plugins_tist_la-tist.lo] Error 1
    | make[1]: *** Waiting for unfinished jobs....
    | make: *** [all] Error 2
    | ERROR: oe_runmake failed

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/recipes-connectivity/connman/connman.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 589ece8..5389f3a 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,10 +20,11 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r19"
+INC_PR = "r20"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
+TIST_powerpc64 = ""
 
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
-- 
1.7.5.4




