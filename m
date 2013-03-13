Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1UFgwI-0001ME-VQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 09:21:46 +0100
Received: from mail34-tx2-R.bigfish.com (10.9.14.243) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Wed, 13 Mar 2013 07:49:49 +0000
Received: from mail34-tx2 (localhost [127.0.0.1])	by mail34-tx2-R.bigfish.com
	(Postfix) with ESMTP id 4984C2C012E	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 07:49:49 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275dh19a27bh8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail34-tx2 (localhost.localdomain [127.0.0.1]) by mail34-tx2
	(MessageSwitch) id 1363160987123622_13193;
	Wed, 13 Mar 2013 07:49:47 +0000 (UTC)
Received: from TX2EHSMHS008.bigfish.com (unknown [10.9.14.249])	by
	mail34-tx2.bigfish.com (Postfix) with ESMTP id 1798B3A0049	for
	<openembedded-devel@lists.openembedded.org>;
	Wed, 13 Mar 2013 07:49:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS008.bigfish.com
	(10.9.99.108) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 13 Mar 2013 07:49:46 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 13 Mar 2013 07:49:45 +0000
Received: from b28495.ap.freescale.net (udp143739uds.ap.freescale.net
	[10.192.208.202])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r2D7nhew018802;	Wed, 13 Mar 2013 00:49:44 -0700
From: <b28495@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 13 Mar 2013 15:49:42 +0800
Message-ID: <1363160982-31939-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [meta-oe][PATCH] lio-utils: initial add 4.1
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
X-List-Received-Date: Wed, 13 Mar 2013 08:21:51 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

lio-utils (lio-utils.git) provide a simple low-level configuration tool
set for the Target+iSCSI (LIO).

lio-utils use the configFS kernel API that is available with LIO, which
provides a clean interface for controlling the kernel level Target
engine and its fabric module subsystems.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb |   59 ++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb

diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
new file mode 100644
index 0000000..bbedb78
--- /dev/null
+++ b/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
@@ -0,0 +1,59 @@
+SUMMARY = "lio-utils"
+DESCRIPTION = "a simple low-level configuration tool set for the Target+iSCSI (LIO)"
+HOMEPAGE = "http://linux-iscsi.org/index.php/Lio-utils"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=c3ea231a32635cbb5debedf3e88aa3df"
+
+PV = "4.1+git${SRCPV}"
+
+SRC_URI = "git://risingtidesystems.com/lio-utils.git"
+SRCREV = "28bd928655bdc7bd3cf380f0196630690c51e05f"
+S = "${WORKDIR}/git"
+
+inherit distutils
+
+EXTRA_OEMAKE += "DESTDIR=${D}"
+
+do_compile() {
+    cd ${S}/tcm-py
+    distutils_do_compile
+
+    cd ${S}/lio-py
+    distutils_do_compile
+
+    if test -d ${S}/tools; then
+        oe_runmake -C ${S}/tools
+    fi
+}
+
+do_install() {
+    cd ${S}/tcm-py
+    distutils_do_install
+
+    cd ${S}/lio-py
+    distutils_do_install
+
+    SITE_PACKAGES=${D}/${PYTHON_SITEPACKAGES_DIR}
+    install -d ${D}/${sbindir}
+    for var in tcm_node tcm_dump tcm_loop tcm_fabric lio_dump lio_node; do
+        if [ ! -h ${D}/${sbindir}/${var} ];then
+            chmod a+x ${SITE_PACKAGES}/${var}.py
+            ln -s ${PYTHON_SITEPACKAGES_DIR}/${var}.py ${D}/${sbindir}/${var}
+        fi
+    done
+
+    if test -d ${S}/tools; then
+        oe_runmake -C ${S}/tools install
+    fi
+
+    install -d ${D}/etc/target/
+    install -d ${D}/etc/init.d/
+    install -m 755 ${S}/scripts/rc.target ${D}/etc/init.d/
+    install -m 755 ${S}/conf/tcm_start.default ${D}/etc/target/tcm_start.sh
+    install -m 755 ${S}/conf/lio_start.default ${D}/etc/target/lio_start.sh
+}
+
+RDEPENDS_${PN} += "python-stringold python-subprocess python-shell \
+    python-datetime python-textutils python-crypt python-netclient python-email"
+
+FILES_${PN} += "${sbindir}/* /etc/init.d/* /etc/target/*"
-- 
1.7.3.4




