Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1SrUyb-0005ce-G2
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 16:11:41 +0200
Received: from mail77-ch1-R.bigfish.com (10.43.68.238) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.23; Wed, 18 Jul 2012 13:45:13 +0000
Received: from mail77-ch1 (localhost [127.0.0.1])	by mail77-ch1-R.bigfish.com
	(Postfix) with ESMTP id 7BA663804D8	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:45:13 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1202hzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah)
Received: from mail77-ch1 (localhost.localdomain [127.0.0.1]) by mail77-ch1
	(MessageSwitch) id 1342619111148556_2096;
	Wed, 18 Jul 2012 13:45:11 +0000 (UTC)
Received: from CH1EHSMHS028.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.228])	by mail77-ch1.bigfish.com (Postfix) with ESMTP id
	0C6722A0061 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 13:45:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS028.bigfish.com
	(10.43.70.28) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 18 Jul 2012 13:45:08 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.298.5; Wed, 18 Jul 2012 08:45:07 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q6IDj6bY000645; Wed, 18 Jul 2012 06:45:07 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Jul 2012 08:45:03 -0500
Message-ID: <1342619103-12808-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe] rp-pppoe: discard use of dnl in Makefile.am
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
X-List-Received-Date: Wed, 18 Jul 2012 14:11:41 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

Since Makefile.am is not processed by m4, but by automake, 'dnl' does
not introduce a comment.

Fix the following error: (appearred on opensuse-11.4/fedora-15, which
shipped make with version 3.82)
...
NOTE: package rp-pppoe-3.8-r8: task do_compile: Started
...
| NOTE: make -j 3
| Makefile:640: *** missing separator.  Stop.
| ERROR: oe_runmake failed
NOTE: package rp-pppoe-3.8-r8: task do_compile: Failed

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 .../discard-use-of-dnl-in-Makefile.am.patch        |   27 ++++++++++++++++++++
 .../recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb  |    3 +-
 2 files changed, 29 insertions(+), 1 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch

diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch
new file mode 100644
index 0000000..8b78864
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe-3.8/discard-use-of-dnl-in-Makefile.am.patch
@@ -0,0 +1,27 @@
+From 611c9fe719c5aa264a2ad2eb920cf4522ae2ddec Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Tue, 12 Jun 2012 14:26:16 -0400
+Subject: [PATCH] discard use of dnl in Makefile.am
+
+Since Makefile.am is not processed by m4, but by automake, 'dnl' does
+not introduce a comment.
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index eff6977..3091c33 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,5 +1,5 @@
+ PACKAGE = rp-pppoe
+ VERSION = 3.8
+ 
+-dnl AM_CFLAGS = -Wall -DDEBUG
++##dnl AM_CFLAGS = -Wall -DDEBUG
+ SUBDIRS = src
+-- 
+1.7.6.5
+
diff --git a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
index 673633a..7deac84 100644
--- a/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
+++ b/meta-oe/recipes-connectivity/rp-pppoe/rp-pppoe_3.8.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=a194eaefae2be54ee3221339b10d0581"
 RDEPENDS_${PN} = "ppp"
 RDEPENDS_${PN}-server = "${PN}"
 RRECOMMENDS_${PN} = "ppp-oe"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
            file://top-autoconf.patch \
@@ -14,6 +14,7 @@ SRC_URI = "http://www.roaringpenguin.com/files/download/${P}.tar.gz \
            file://pppoe-src-restrictions.patch \
            file://update-config.patch \
            file://dont-swallow-errors.patch \
+           file://discard-use-of-dnl-in-Makefile.am.patch \
            file://use-ldflags.patch \
            file://pppoe-server.default \
            file://pppoe-server.init"
-- 
1.7.3.4




