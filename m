Return-Path: <B40290@freescale.com>
Received: from db8outboundpool.messaging.microsoft.com
	(mail-db8lp0184.outbound.messaging.microsoft.com [213.199.154.184])
	by mail.openembedded.org (Postfix) with ESMTP id F357F6CB44
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:27:48 +0000 (UTC)
Received: from mail208-db8-R.bigfish.com (10.174.8.231) by
	DB8EHSOBE028.bigfish.com (10.174.4.91) with Microsoft SMTP Server id
	14.1.225.22; Fri, 18 Oct 2013 08:27:49 +0000
Received: from mail208-db8 (localhost [127.0.0.1])	by
	mail208-db8-R.bigfish.com (Postfix) with ESMTP id 851FE10017D	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:27:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275dh1de097h186068h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail208-db8 (localhost.localdomain [127.0.0.1]) by mail208-db8
	(MessageSwitch) id 1382084866892551_15435;
	Fri, 18 Oct 2013 08:27:46 +0000 (UTC)
Received: from DB8EHSMHS004.bigfish.com (unknown [10.174.8.236])	by
	mail208-db8.bigfish.com (Postfix) with ESMTP id D5B9320065	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2013 08:27:46 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB8EHSMHS004.bigfish.com
	(10.174.4.14) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 18 Oct 2013 08:27:46 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 18 Oct 2013 08:27:44 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP
	id r9I8RgRb019411;	Fri, 18 Oct 2013 01:27:42 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 18 Oct 2013 16:27:40 +0800
Message-ID: <1382084860-25061-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-networking][PATCH v2 3/3] barnyard: add recipe
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
X-List-Received-Date: Fri, 18 Oct 2013 08:27:49 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *Barnyard is a output system for Snort

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../barnyard/barnyard_0.2.0.bb                     |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb

diff --git a/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb b/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb
new file mode 100644
index 0000000..09c5506
--- /dev/null
+++ b/meta-networking/recipes-connectivity/barnyard/barnyard_0.2.0.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Barnyard is a output system for Snort."
+HOMEPAGE = "http://www.snort.org/"
+LICENSE = "QPL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE.QPL;md5=1b8ff8c0012b5a2d647357699bf44b41"
+
+DEPENDS = "libpcap"
+
+SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
+          "
+SRC_URI[tarball.md5sum] = "be3283028cf414b52b220308ceb411e9"
+SRC_URI[tarball.sha256sum] = "09e0f8e095e79cfe70ea069d13e7d02521a504a1f400a45556a634dccfd31a3a"
+
+
+inherit autotools pkgconfig
+
+do_configure_prepend () {
+	#fix hardcoded include path
+	sed -i -e 's:extra_incl=/usr/include/pcap::g' ${S}/configure.in
+}
+
-- 
1.7.5.4



