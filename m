Return-Path: <B40290@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0187.outbound.messaging.microsoft.com [213.199.154.187])
	by mail.openembedded.org (Postfix) with ESMTP id 709F861105
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:20:16 +0000 (UTC)
Received: from mail146-db8-R.bigfish.com (10.174.8.239) by
	DB8EHSOBE018.bigfish.com (10.174.4.81) with Microsoft SMTP Server id
	14.1.225.22; Mon, 23 Sep 2013 09:20:16 +0000
Received: from mail146-db8 (localhost [127.0.0.1])	by
	mail146-db8-R.bigfish.com (Postfix) with ESMTP id C4D0F3E038D	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:20:16 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah1de097h186068h8275bh8275dhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail146-db8 (localhost.localdomain [127.0.0.1]) by mail146-db8
	(MessageSwitch) id 1379928014680783_11361;
	Mon, 23 Sep 2013 09:20:14 +0000 (UTC)
Received: from DB8EHSMHS026.bigfish.com (unknown [10.174.8.242])	by
	mail146-db8.bigfish.com (Postfix) with ESMTP id A233DC008C	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:20:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS026.bigfish.com
	(10.174.4.36) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 23 Sep 2013 09:20:14 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Mon, 23 Sep 2013 09:20:12 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r8N9K9Vq000842;	Mon, 23 Sep 2013 02:20:10 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 23 Sep 2013 17:20:07 +0800
Message-ID: <1379928007-28803-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-networking][PATCH 3/3] barnyard: add recipe
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
X-List-Received-Date: Mon, 23 Sep 2013 09:20:17 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *Barnyard is a output system for Snort

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../barnyard/barnyard_0.2.0.bb                     |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb

diff --git a/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb b/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb
new file mode 100644
index 0000000..c5e0e78
--- /dev/null
+++ b/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "Barnyard is a output system for Snort."
+HOMEPAGE = "http://www.snort.org/"
+LICENSE = "QPL"
+LIC_FILES_CHKSUM = "file://LICENSE.QPL;md5=1b8ff8c0012b5a2d647357699bf44b41"
+
+DEPENDS = "libpcap"
+
+SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
+          "
+SRC_URI[tarball.md5sum] = "be3283028cf414b52b220308ceb411e9"
+SRC_URI[tarball.sha256sum] = "09e0f8e095e79cfe70ea069d13e7d02521a504a1f400a45556a634dccfd31a3a"
+
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+	#fix hardcoded include path
+	sed -i -e 's:extra_incl=-I/usr/include/pcap::g' ${S}/configure.in
+}
+
-- 
1.7.5.4



