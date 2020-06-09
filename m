Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1205.1591682554386480371
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2020 23:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yongxin.liu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05961qFC009741
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 Jun 2020 23:02:23 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Mon, 8 Jun 2020
 23:01:57 -0700
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][PATCH V3] intel-speed-select: Add new recipe for the tool to validate Intel SST
Date: Tue, 9 Jun 2020 13:59:23 +0800
Message-ID: <20200609055923.41671-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 .../intel-speed-select/intel-speed-select.bb       | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb

diff --git a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
new file mode 100644
index 000000000..53f6de106
--- /dev/null
+++ b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
@@ -0,0 +1,30 @@
+SUMMARY = "A tool to validate Intel Speed Select commands"
+
+DESCRIPTION = "The Intel Speed Select Technology (Intel SST) is a powerful new \
+collection of features giving you more granular control over CPU performance \
+for optimized total cost of ownership."
+
+LICENSE = "GPLv2"
+
+inherit kernelsrc
+
+COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
+COMPATIBLE_HOST_libc-musl = 'null'
+
+do_populate_lic[depends] += "virtual/kernel:do_patch"
+
+B = "${WORKDIR}/${BPN}-${PV}"
+
+EXTRA_OEMAKE = "-C ${S}/tools/power/x86/intel-speed-select O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+do_configure[depends] += "virtual/kernel:do_shared_workdir"
+
+do_compile() {
+	oe_runmake
+}
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
2.14.4

