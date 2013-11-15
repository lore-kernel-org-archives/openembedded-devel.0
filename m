Return-Path: <Prabhu.Sundararaj@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe004.messaging.microsoft.com [216.32.180.187])
	by mail.openembedded.org (Postfix) with ESMTP id ABF356D75B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 16:58:08 +0000 (UTC)
Received: from mail65-co1-R.bigfish.com (10.243.78.228) by
	CO1EHSOBE022.bigfish.com (10.243.66.85) with Microsoft SMTP Server id
	14.1.225.22; Fri, 15 Nov 2013 16:58:09 +0000
Received: from mail65-co1 (localhost [127.0.0.1])	by mail65-co1-R.bigfish.com
	(Postfix) with ESMTP id B461E9201A4	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 16:58:09 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -10
X-BigFish: VS-10(z98bRzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail65-co1 (localhost.localdomain [127.0.0.1]) by mail65-co1
	(MessageSwitch) id 1384534688340316_4543;
	Fri, 15 Nov 2013 16:58:08 +0000 (UTC)
Received: from CO1EHSMHS020.bigfish.com (unknown [10.243.78.241])	by
	mail65-co1.bigfish.com (Postfix) with ESMTP id 4FA3378004E	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2013 16:58:08 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS020.bigfish.com
	(10.243.66.30) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 15 Nov 2013 16:58:08 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 15 Nov 2013 16:58:07 +0000
Received: from blueale.am.freescale.net (blueale.am.freescale.net
	[10.81.16.90])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP
	id rAFGw61Z022837;	Fri, 15 Nov 2013 09:58:07 -0700
From: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Nov 2013 16:58:32 -0600
Message-ID: <1384556312-14691-1-git-send-email-prabhu.sundararaj@freescale.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-browser][PATCH] ninja : update to Version 1.4
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
X-List-Received-Date: Fri, 15 Nov 2013 16:58:09 -0000
Content-Type: text/plain

Signed-off-by: Prabhu Sundararaj <prabhu.sundararaj@freescale.com>
---
 recipes-devtools/ninja/ninja-native_1.1.0.bb | 21 ---------------------
 recipes-devtools/ninja/ninja-native_1.4.0.bb | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 21 deletions(-)
 delete mode 100644 recipes-devtools/ninja/ninja-native_1.1.0.bb
 create mode 100644 recipes-devtools/ninja/ninja-native_1.4.0.bb

diff --git a/recipes-devtools/ninja/ninja-native_1.1.0.bb b/recipes-devtools/ninja/ninja-native_1.1.0.bb
deleted file mode 100644
index c3235fd..0000000
--- a/recipes-devtools/ninja/ninja-native_1.1.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-DESCRIPTION = "Ninja is a small build system with a focus on speed."
-LICENSE = "Apache-2"
-
-inherit native
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
-
-SRCREV="2c953d1501de5195e2485185fa24a2ebfd76bbb5"
-
-SRC_URI = "git://github.com/martine/ninja.git"
-
-S="${WORKDIR}/git"
-
-do_compile() {
-    python ${S}/bootstrap.py
-}
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 ${S}/ninja ${D}${bindir}/ninja
-}
diff --git a/recipes-devtools/ninja/ninja-native_1.4.0.bb b/recipes-devtools/ninja/ninja-native_1.4.0.bb
new file mode 100644
index 0000000..c72542c
--- /dev/null
+++ b/recipes-devtools/ninja/ninja-native_1.4.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Ninja is a small build system with a focus on speed."
+LICENSE = "Apache-2"
+
+inherit native
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
+
+SRCREV="63d5b1013cafb2db95687cf446eb5bb68cf6a27a"
+
+SRC_URI = "git://github.com/martine/ninja.git"
+
+S="${WORKDIR}/git"
+
+do_compile() {
+    python ${S}/bootstrap.py
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/ninja ${D}${bindir}/ninja
+}
-- 
1.8.1.2



