Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe002.messaging.microsoft.com [216.32.180.12])
	by mail.openembedded.org (Postfix) with ESMTP id 207BF6BB2F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 07:44:27 +0000 (UTC)
Received: from mail59-va3-R.bigfish.com (10.7.14.228) by
	VA3EHSOBE014.bigfish.com (10.7.40.64) with Microsoft SMTP Server id
	14.1.225.22; Thu, 20 Mar 2014 07:44:26 +0000
Received: from mail59-va3 (localhost [127.0.0.1])	by mail59-va3-R.bigfish.com
	(Postfix) with ESMTP id E15CB4C0261	for
	<openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2014 07:44:26 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch21a7h1fc6hzz1de098h8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h2668h1155h)
Received: from mail59-va3 (localhost.localdomain [127.0.0.1]) by mail59-va3
	(MessageSwitch) id 1395301464985645_29840;
	Thu, 20 Mar 2014 07:44:24 +0000 (UTC)
Received: from VA3EHSMHS039.bigfish.com (unknown [10.7.14.237])	by
	mail59-va3.bigfish.com (Postfix) with ESMTP id E97E92E006D;
	Thu, 20 Mar 2014 07:44:24 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS039.bigfish.com
	(10.7.99.49) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Thu, 20 Mar 2014 07:44:24 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Thu, 20 Mar 2014 07:44:23 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.136])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s2K7iLnY002164;
	Thu, 20 Mar 2014 00:44:22 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 20 Mar 2014 15:44:17 +0800
Message-ID: <1395301457-20665-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-networking][PATCH ] sethdlc : add recipe
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
X-List-Received-Date: Thu, 20 Mar 2014 07:44:28 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

   * sethdlc: get/set Linux HDLC packet radio modem driver port information
   * sethdlc is  a  program designed to set and/or report the configuration
     information associated with a soundcard radio modem port. This information
     includes  the  modem type, what I/O port, IRQ and DMA channel a particular
     modem port is using, and where to output a transmitter  keying (PTT) signal.

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../recipes-connectivity/sethdlc/sethdlc.bb        | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/sethdlc/sethdlc.bb

diff --git a/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
new file mode 100644
index 0000000..3a9692f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/sethdlc/sethdlc.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "set Linux HDLC packet radio modem driver port information"
+HOMEPAGE = "https://www.kernel.org/pub/linux/utils/net/hdlc"
+LICENSE = "GPLv2 & GPLv2+ "
+LIC_FILES_CHKSUM = "file://Makefile;md5=19aada31930b2be84bf7138420d77263"
+
+
+SRC_URI = "https://www.kernel.org/pub/linux/utils/net/hdlc/${BPN}-1.18.tar.gz \
+"
+SRC_URI[md5sum] = "9016878156a5eadb06c0bae71cc5c9ab"
+SRC_URI[sha256sum] = "21b1e2e1cb0e288b0ec8fcfd9fed449914e0f8e6fc273706bd5b3d4f6ab6b04e"
+
+
+S = "${WORKDIR}/${BPN}-1.18"
+
+DEPENDS="virtual/kernel"
+
+EXTRA_OEMAKE="CROSS_COMPILE=${TARGET_PREFIX} CC='${CC} ${LDFLAGS}' \
+              KERNEL_DIR=${STAGING_KERNEL_DIR} "
+
+do_compile_prepend () {
+    oe_runmake clean
+}
+
+
+do_install() {
+    install -d ${D}/${bindir}
+    install sethdlc ${D}/${bindir}/
+}
+
+FILES_${PN} += "${bindir}/sethdlc"
-- 
1.8.3.2



