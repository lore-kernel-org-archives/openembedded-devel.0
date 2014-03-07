Return-Path: <Lauren.Post@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe001.messaging.microsoft.com [207.46.163.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7453B6F642
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:38:02 +0000 (UTC)
Received: from mail150-co9-R.bigfish.com (10.236.132.229) by
	CO9EHSOBE037.bigfish.com (10.236.130.100) with Microsoft SMTP Server id
	14.1.225.22; Fri, 7 Mar 2014 21:38:02 +0000
Received: from mail150-co9 (localhost [127.0.0.1])	by
	mail150-co9-R.bigfish.com (Postfix) with ESMTP id 9BF9F3003E4	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 21:38:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz8275ch1de098h177df4h17326ah8275bh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h1155h)
Received: from mail150-co9 (localhost.localdomain [127.0.0.1]) by mail150-co9
	(MessageSwitch) id 1394228275475505_24458;
	Fri,  7 Mar 2014 21:37:55 +0000 (UTC)
Received: from CO9EHSMHS010.bigfish.com (unknown [10.236.132.236])	by
	mail150-co9.bigfish.com (Postfix) with ESMTP id 6E8982E0056;
	Fri,  7 Mar 2014 21:37:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS010.bigfish.com
	(10.236.130.20) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 7 Mar 2014 21:37:54 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 7 Mar 2014 21:37:53 +0000
Received: from neo.am.freescale.net (neo.am.freescale.net [10.81.16.89])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s27LbrwE002056;
	Fri, 7 Mar 2014 14:37:53 -0700
From: Lauren Post <lauren.post@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 7 Mar 2014 15:26:09 -0600
Message-ID: <1394227575-27897-1-git-send-email-lauren.post@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <lauren.post@freescale.com>
References: <lauren.post@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH 1/7] linuxptp: Create 1.4 version
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
X-List-Received-Date: Fri, 07 Mar 2014 21:38:03 -0000
Content-Type: text/plain

Precision Time Protocol (PTP) according to IEEE standard 1588

Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../recipes-connectivity/linuxptp/linuxptp_1.4.bb  |   26 ++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
new file mode 100644
index 0000000..c708b13
--- /dev/null
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_1.4.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "virtual/kernel"
+
+SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz"
+
+SRC_URI[md5sum] = "a37ad2b2ef7d1ebc4d64a66d3fe55cdf"
+SRC_URI[sha256sum] = "6cfd5291fb7394cc9f25458927874a203971b66b76d1c9d6568e007d0cbd81f2"
+
+inherit autotools pkgconfig
+
+EXTRA_OEMAKE = 'KBUILD_OUTPUT="${STAGING_KERNEL_DIR}" CROSS_COMPILE="${TARGET_PREFIX}"'
+
+do_configure_append () {
+    find ${S} -name makefile | xargs sed -i 's,^\(CC\|CFLAGS\|prefix\|AR\)=,\1 ?=,g'
+}
+
+do_install () {
+    install -d ${D}/${bindir}
+    install -p ${S}/ptp4l  ${D}/${bindir}
+    install -p ${S}/pmc  ${D}/${bindir}
+    install -p ${S}/phc2sys  ${D}/${bindir}
+    install -p ${S}/hwstamp_ctl  ${D}/${bindir}
+}
-- 
1.7.9.5



