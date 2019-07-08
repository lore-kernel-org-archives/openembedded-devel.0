Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78A176C108
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Jul 2019 01:54:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x681sW6t005223
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Jul 2019 18:54:32 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 7 Jul 2019 18:54:20 -0700
From: Yongxin Liu <yongxin.liu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Jul 2019 09:52:35 +0800
Message-ID: <20190708015236.42034-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 1/2] keyutils: add new recipe for version 1.6.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2019 01:54:32 -0000
Content-Type: text/plain

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta-oe/recipes-security/keyutils/keyutils_1.6.bb | 38 +++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-security/keyutils/keyutils_1.6.bb

diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
new file mode 100644
index 000000000..3a26c902a
--- /dev/null
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Linux Key Management Utilities"
+DESCRIPTION = "These tools are used to control the key management system built into the Linux."
+
+SECTION = "base"
+
+LICENSE = "LGPLv2.1+ & GPLv2.0+"
+LIC_FILES_CHKSUM = "file://LICENCE.GPL;md5=5f6e72824f5da505c1f4a7197f004b45 \
+                    file://LICENCE.LGPL;md5=7d1cacaa3ea752b72ea5e525df54a21f"
+
+PV = "1.6+git${SRCPV}"
+
+SRC_URI = "\
+    git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git \
+"
+
+SRCREV = "4723f0185d11b13df243ad3cd41fbddfed53b5b1"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "'CFLAGS=${CFLAGS} -Wall'"
+
+INSTALL_FLAGS = "\
+    LIBDIR=${libdir} \
+    USRLIBDIR=${libdir} \
+    BINDIR=${bindir} \
+    SBINDIR=${sbindir} \
+    ETCDIR=${sysconfdir} \
+    SHAREDIR=${datadir} \
+    MANDIR=${mandir} \
+    INCLUDEDIR=${includedir} \
+    DESTDIR=${D} \
+"
+
+do_install() {
+    cd ${S} && oe_runmake ${INSTALL_FLAGS} install
+}
+
+FILES_${PN} += "${datadir}/request-key-debug.sh"
-- 
2.14.4


