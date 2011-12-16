Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
	helo=TX2EHSOBE005.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbYhr-0004wk-C2
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 15:24:16 +0100
Received: from mail18-tx2-R.bigfish.com (10.9.14.242) by
	TX2EHSOBE005.bigfish.com (10.9.40.25) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 14:17:11 +0000
Received: from mail18-tx2 (localhost [127.0.0.1])	by mail18-tx2-R.bigfish.com
	(Postfix) with ESMTP id E8982660651	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:17:20 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275ch8275bhz2dh2a8h668h839hb79i64h)
X-Spam-TCS-SCL: 3:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail18-tx2 (localhost.localdomain [127.0.0.1]) by mail18-tx2
	(MessageSwitch) id 1324045023745162_9961;
	Fri, 16 Dec 2011 14:17:03 +0000 (UTC)
Received: from TX2EHSMHS031.bigfish.com (unknown [10.9.14.249])	by
	mail18-tx2.bigfish.com (Postfix) with ESMTP id 1938D2005D	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 14:17:01 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS031.bigfish.com
	(10.9.99.131) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 14:16:41 +0000
Received: from az33smr02.freescale.net (10.64.34.200) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Fri, 16 Dec 2011 08:16:42 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr02.freescale.net (8.13.1/8.13.0) with ESMTP id pBGEGdRq024976;
	Fri, 16 Dec 2011 08:16:40 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 22:19:21 +0800
Message-ID: <1324045163-19287-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe v3 1/3] bridge-utils: add
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
X-List-Received-Date: Fri, 16 Dec 2011 14:24:16 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    bridge-utils provides tools for ethernet bridging.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../bridge-utils/bridge-utils.inc                  |   28 ++++++++++++++++++++
 .../bridge-utils/bridge-utils_1.4.bb               |    6 ++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
 create mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb

diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
new file mode 100644
index 0000000..75bf2a9
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
@@ -0,0 +1,28 @@
+DESCRIPTION = "Tools for ethernet bridging."
+HOMEPAGE = "http://bridge.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
+
+do_install_append () {
+	mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN}
+	install -d ${D}/${datadir}/bridge-utils
+	install -d ${D}/${sysconfdir}/network/if-pre-up.d
+	install -d ${D}/${sysconfdir}/network/if-post-down.d
+}
+
+DEPENDS = "sysfsutils"
+RRECOMMENDS_${PN} = "kernel-module-bridge"
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${sbindir}/brctl brctl brctl.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove brctl brctl.${PN}
+}
diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
new file mode 100644
index 0000000..00a5815
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
@@ -0,0 +1,6 @@
+require bridge-utils.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
+
+SRC_URI[md5sum] = "0182fcac3a2b307113bbec34e5f1c673"
+SRC_URI[sha256sum] = "876975e9bcc302aa8b829161ea3348b12b9b879f1db0dc98feaed8d0e5dd5933"
-- 
1.7.0.4




