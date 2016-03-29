Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDA1606A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:34:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2T7Yax1014096
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Mar 2016 00:34:36 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 29 Mar 2016 00:34:36 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 Mar 2016 15:28:56 +0800
Message-ID: <1459236536-15190-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] cpupower: add recipes
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
X-List-Received-Date: Tue, 29 Mar 2016 07:34:38 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

cpupower is tools to shows and sets processor power related values

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb | 41 +++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/cpupower/cpupower.bb

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
new file mode 100644
index 0000000..d53deac
--- /dev/null
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -0,0 +1,41 @@
+SUMMARY = "Shows and sets processor power related values"
+DESCRIPTION = "cpupower is a collection of tools to examine and tune power \
+saving related features of your processor."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+DEPENDS = "pciutils"
+
+inherit kernelsrc kernel-arch
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+PROVIDES = "virtual/cpupower"
+
+B = "${WORKDIR}/${BPN}-${PV}"
+
+EXTRA_OEMAKE = '\
+    -C ${S}/tools/power/cpupower \
+    O=${B} \
+    CROSS=${TARGET_PREFIX} \
+    ARCH=${ARCH} \
+    CC="${CC}" \
+    AR="${AR}" \
+'
+do_compile() {
+	unset CFLAGS
+	oe_runmake all
+}
+
+do_install() {
+	unset CFLAGS
+	oe_runmake DESTDIR=${D} install
+	chown root:root ${D}/${libdir}/*
+}
+
+python do_package_prepend() {
+    d.setVar('PKGV', d.getVar("KERNEL_VERSION", True).split("-")[0])
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+RDEPENDS_${PN} = "bash"
-- 
1.9.1


