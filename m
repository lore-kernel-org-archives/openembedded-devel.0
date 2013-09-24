Return-Path: <B28495@freescale.com>
Received: from db9outboundpool.messaging.microsoft.com
	(mail-db9lp0250.outbound.messaging.microsoft.com [213.199.154.250])
	by mail.openembedded.org (Postfix) with ESMTP id 9350D601D6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 07:11:26 +0000 (UTC)
Received: from mail179-db9-R.bigfish.com (10.174.16.232) by
	DB9EHSOBE027.bigfish.com (10.174.14.90) with Microsoft SMTP Server id
	14.1.225.22; Tue, 24 Sep 2013 07:11:27 +0000
Received: from mail179-db9 (localhost [127.0.0.1])	by
	mail179-db9-R.bigfish.com (Postfix) with ESMTP id 3D7B4E0050	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 07:11:27 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275ch1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail179-db9 (localhost.localdomain [127.0.0.1]) by mail179-db9
	(MessageSwitch) id 1380006685176889_7101;
	Tue, 24 Sep 2013 07:11:25 +0000 (UTC)
Received: from DB9EHSMHS030.bigfish.com (unknown [10.174.16.254])	by
	mail179-db9.bigfish.com (Postfix) with ESMTP id 268453C004C	for
	<openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 07:11:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB9EHSMHS030.bigfish.com
	(10.174.14.40) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 24 Sep 2013 07:11:24 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 24 Sep 2013 07:11:22 +0000
Received: from NETWORKudp177383uds.ap.freescale.net ([10.193.20.27])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r8O7BKPY023089;
	Tue, 24 Sep 2013 00:11:21 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 24 Sep 2013 15:11:19 +0800
Message-ID: <1380006679-15867-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-oe][PATCH] tipcutils: add recipe
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
X-List-Received-Date: Tue, 24 Sep 2013 07:11:27 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

The Transparent Inter-Process Communication protocol allows applications
in a clustered computer environment to communicate quickly and reliably
with other applications, regardless of their location within the
cluster.

demo binaries are packaged to tipcutils-demos.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 recipes-extended/tipcutils/tipcutils_2.0.6.bb |   40 +++++++++++++++++++++++++
 1 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 recipes-extended/tipcutils/tipcutils_2.0.6.bb

diff --git a/recipes-extended/tipcutils/tipcutils_2.0.6.bb b/recipes-extended/tipcutils/tipcutils_2.0.6.bb
new file mode 100644
index 0000000..f91ef0e
--- /dev/null
+++ b/recipes-extended/tipcutils/tipcutils_2.0.6.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "Transparent Inter-Process Communication protocol"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://tipc-config/tipc-config.c;endline=32;md5=527a3d5745e1581b15a4fddfb5dfda68"
+
+SRC_URI = "git://tipc.git.sourceforge.net/gitroot/tipc/tipcutils"
+SRCREV = "292a03e17f889013fca2c7bd0aaeebd600c88f40"
+
+DEPENDS="virtual/kernel"
+
+inherit autotools
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+    ( cd ${S}; ${S}/bootstrap )
+}
+
+do_install_append() {
+    demos="benchmark hello_world topology_subscr_demo connection_demo \
+           multicast_demo stream_demo"
+    for i in $demos;do
+        install -d ${D}/opt/tipcutils/demos/$i
+        install ${S}/demos/$i/client_tipc ${D}/opt/tipcutils/demos/$i/
+        install ${S}/demos/$i/server_tipc ${D}/opt/tipcutils/demos/$i/
+    done
+    install -d ${D}/opt/tipcutils/demos/inventory_sim
+    install ${S}/demos/inventory_sim/inventory_sim ${D}/opt/tipcutils/demos/inventory_sim/
+
+    install -d ${D}/opt/tipcutils/ptts
+    install ${S}/ptts/tipcTS ${D}/opt/tipcutils/ptts/
+    install ${S}/ptts/tipcTC ${D}/opt/tipcutils/ptts/
+
+    install -d ${D}${sysconfdir}
+    cp -a ${S}/scripts/etc/* ${D}${sysconfdir}/
+}
+
+PACKAGES += "${PN}-demos"
+FILES_${PN}-dbg += "/opt/tipcutils/demos/*/.debug /opt/tipcutils/ptts/.debug"
+FILES_${PN}-demos = "/opt/tipcutils/*"
+
-- 
1.7.3.4



