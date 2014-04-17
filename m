Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe005.messaging.microsoft.com [216.32.180.31])
	by mail.openembedded.org (Postfix) with ESMTP id 86EB865E53
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 03:41:40 +0000 (UTC)
Received: from mail11-va3-R.bigfish.com (10.7.14.251) by
	VA3EHSOBE006.bigfish.com (10.7.40.26) with Microsoft SMTP Server id
	14.1.225.22; Thu, 17 Apr 2014 03:40:58 +0000
Received: from mail11-va3 (localhost [127.0.0.1])	by mail11-va3-R.bigfish.com
	(Postfix) with ESMTP id D9A1A320176	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 17 Apr 2014 03:40:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIe0eahzz1f42h1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch21a7h1fc6h208chzz1de098h8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh26d3h1155h)
Received: from mail11-va3 (localhost.localdomain [127.0.0.1]) by mail11-va3
	(MessageSwitch) id 1397706055871607_18228;
	Thu, 17 Apr 2014 03:40:55 +0000 (UTC)
Received: from VA3EHSMHS011.bigfish.com (unknown [10.7.14.232])	by
	mail11-va3.bigfish.com (Postfix) with ESMTP id C062E20047;
	Thu, 17 Apr 2014 03:40:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS011.bigfish.com
	(10.7.99.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 17 Apr 2014 03:40:55 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.174.2; Thu, 17 Apr 2014 03:41:36 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s3H3fYFW015554;
	Wed, 16 Apr 2014 20:41:35 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 17 Apr 2014 11:41:31 +0800
Message-ID: <1397706091-8116-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-networking][PATCH ] sethdlc: don't search host directories for header files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 Apr 2014 03:41:42 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

    *The build process hard-codes searches of various directories
     in /usr/src/linux/include when looking for header files,
     delete this to avoid host contamination

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../sethdlc/files/fix-includedir.patch                    | 15 +++++++++++++++
 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb   | 11 +++--------
 2 files changed, 18 insertions(+), 8 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/sethdlc/files/fix-includedir.patch

diff --git a/meta-networking/recipes-connectivity/sethdlc/files/fix-includedir.patch b/meta-networking/recipes-connectivity/sethdlc/files/fix-includedir.patch
new file mode 100644
index 0000000..49d6d42
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sethdlc/files/fix-includedir.patch
@@ -0,0 +1,15 @@
+--- a/Makefileold	2014-04-16 22:05:58.070199084 -0500
++++ b/Makefile	2014-04-16 22:06:27.153074058 -0500
+@@ -1,11 +1,10 @@
+ CC = gcc
+ CFLAGS = -O2 -Wall -W -Wno-long-long -pipe
+-INCLUDES = -I/usr/src/linux/include -I/usr/src/linux-2.6/include
+ 
+ all:		sethdlc
+ 
+ sethdlc:	sethdlc.c
+-		$(CC) $(CFLAGS) $(INCLUDES) -o $@ $<
++		$(CC) $(CFLAGS)  -o $@ $<
+ 
+ install:
+ 		install -C -p -s sethdlc /usr/local/sbin/
diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
index 3a9692f..3459a36 100644
--- a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
@@ -1,27 +1,22 @@
 DESCRIPTION = "set Linux HDLC packet radio modem driver port information"
 HOMEPAGE = "https://www.kernel.org/pub/linux/utils/net/hdlc"
 LICENSE = "GPLv2 & GPLv2+ "
-LIC_FILES_CHKSUM = "file://Makefile;md5=19aada31930b2be84bf7138420d77263"
-
+LIC_FILES_CHKSUM = "file://sethdlc.c;beginline=1;endline=10;md5=90f936879e9f8b755a138aeb348782eb"
 
 SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.tar.gz \
+           file://fix-includedir.patch \
 "
 SRC_URI[md5sum] = "9016878156a5eadb06c0bae71cc5c9ab"
 SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6ab6b04e"
 
-
 S = "${WORKDIR}/${BPN}-1.18"
 
-DEPENDS="virtual/kernel"
-
-EXTRA_OEMAKE="CROSS_COMPILE=${TARGET_PREFIX} CC='${CC} ${LDFLAGS}' \
-              KERNEL_DIR=${STAGING_KERNEL_DIR} "
+EXTRA_OEMAKE="CROSS_COMPILE=${TARGET_PREFIX} CC='${CC} ${LDFLAGS}'" 
 
 do_compile_prepend () {
     oe_runmake clean
 }
 
-
 do_install() {
     install -d ${D}/${bindir}
     install sethdlc ${D}/${bindir}/
-- 
1.8.3.2



