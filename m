Return-Path: <Lauren.Post@freescale.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe002.messaging.microsoft.com [213.199.154.205])
	by mail.openembedded.org (Postfix) with ESMTP id 107416F62F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:37:58 +0000 (UTC)
Received: from mail13-am1-R.bigfish.com (10.3.201.231) by
	AM1EHSOBE010.bigfish.com (10.3.204.30) with Microsoft SMTP Server id
	14.1.225.22; Fri, 7 Mar 2014 21:37:59 +0000
Received: from mail13-am1 (localhost [127.0.0.1])	by mail13-am1-R.bigfish.com
	(Postfix) with ESMTP id E8CC53A017A	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:37:58 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -5
X-BigFish: VS-5(zze0eah444fMzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail13-am1 (localhost.localdomain [127.0.0.1]) by mail13-am1
	(MessageSwitch) id 1394228277614085_8865;
	Fri,  7 Mar 2014 21:37:57 +0000 (UTC)
Received: from AM1EHSMHS002.bigfish.com (unknown [10.3.201.231])	by
	mail13-am1.bigfish.com (Postfix) with ESMTP id 8A9334A00B8;
	Fri,  7 Mar 2014 21:37:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS002.bigfish.com
	(10.3.207.102) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 7 Mar 2014 21:37:57 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 7 Mar 2014 21:37:55 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s27LbrwJ002056;
	Fri, 7 Mar 2014 14:37:54 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Mar 2014 15:26:14 -0600
Message-ID: <1394227575-27897-6-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1394227575-27897-1-git-send-email-lauren.post@freescale.com>
References: <lauren.post@freescale.com>
	<1394227575-27897-1-git-send-email-lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 6/7] vlan: Create 1.9 version
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
X-List-Received-Date: Fri, 07 Mar 2014 21:37:59 -0000
Content-Type: text/plain

VLAN provides vconfig utility

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../recipes-connectivity/vlan/vlan_1.9.bb          |   25 ++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/vlan/vlan_1.9.bb

diff --git a/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
new file mode 100644
index 0000000..a9711ed
--- /dev/null
+++ b/meta-networking/recipes-connectivity/vlan/vlan_1.9.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "VLAN provides vconfig utility"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://vconfig.c;md5=293ef69c4e88434d37a5ee577a5288cb"
+
+SRC_URI = "http://vlan.sourcearchive.com/downloads/1.9-3ubuntu9/vlan_1.9.orig.tar.gz"
+
+SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
+SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
+
+S = "${WORKDIR}/vlan"
+
+# comment out MakeInclude in Makefile which sets build environment
+do_configure_append () {
+    sed -i 's/^ include/#^include/' ${S}/Makefile
+}
+
+# ignore strip to avoid yocto errors in stripping
+do_compile () {
+    oe_runmake PLATFORM=ARM 'STRIP=echo' all
+}
+
+do_install () {
+     install -d ${D}/${exec_prefix}/bin
+     cp ${S}/vconfig ${D}/${exec_prefix}/bin
+}
-- 
1.7.9.5



