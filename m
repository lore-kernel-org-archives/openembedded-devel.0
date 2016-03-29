Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9074B65CC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:55:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2T7tOl0009178
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 00:55:24 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 29 Mar 2016 00:55:23 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Mar 2016 15:49:44 +0800
Message-ID: <1459237784-26118-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] tmon: add recipes
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
X-List-Received-Date: Tue, 29 Mar 2016 07:55:23 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

tmon is a monitoring and testing tool for Linux kernel thermal subsystem

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-kernel/tmon/tmon.bb | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/tmon/tmon.bb

diff --git a/meta-oe/recipes-kernel/tmon/tmon.bb b/meta-oe/recipes-kernel/tmon/tmon.bb
new file mode 100644
index 0000000..3bf2b3d
--- /dev/null
+++ b/meta-oe/recipes-kernel/tmon/tmon.bb
@@ -0,0 +1,34 @@
+SUMMARY = "A monitoring and testing tool for Linux kernel thermal subsystem"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+DEPENDS = "ncurses"
+
+inherit kernelsrc kernel-arch
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+B = "${WORKDIR}/${BPN}-${PV}"
+
+EXTRA_OEMAKE = '\
+    -C ${S}/tools/thermal/tmon \
+    CROSS_COMPILE=${TARGET_PREFIX} \
+    ARCH=${ARCH} \
+    CC="${CC}" \
+    AR="${AR}" \
+'
+do_compile() {
+	unset CFLAGS
+	oe_runmake tmon
+}
+
+do_install() {
+	unset CFLAGS
+	oe_runmake INSTALL_ROOT=${D} install
+}
+
+python do_package_prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


