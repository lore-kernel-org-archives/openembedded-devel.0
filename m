Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1D8748EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 13:55:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4ODtFrN022456
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 06:55:16 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 May 2018 06:55:09 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 May 2018 06:55:09 -0700
Message-ID: <20180524135509.22244-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2] turbostat: add the recipe of turbostat to meta-oe
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
X-List-Received-Date: Thu, 24 May 2018 13:55:15 -0000
Content-Type: text/plain

It is an efficient and necessary tool to reflect the status of X86
processors. Turbostat reports processor topology, frequency, idle
power-state statistics, temperature and power on X86 processors.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 recipes-kernel/turbostat/turbostat_3.4.bb | 58 +++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 recipes-kernel/turbostat/turbostat_3.4.bb

diff --git a/recipes-kernel/turbostat/turbostat_3.4.bb b/recipes-kernel/turbostat/turbostat_3.4.bb
new file mode 100644
index 0000000..13c53aa
--- /dev/null
+++ b/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -0,0 +1,58 @@
+#
+# Copyright (C) 2013 Wind River Systems, Inc.
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+SUMMARY = "Frequency and Idle power monitoring tools for Linux"
+
+DESCRIPTION = "The turbostat tool allows you to determine the actual \
+processor frequency and idle power saving state residency on supported \
+processors."
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
+COMPATIBLE_HOST_libc-musl = "null"
+
+DEPENDS = "virtual/kernel"
+
+do_fetch[noexec] = "1"
+do_unpack[noexec] = "1"
+do_patch[noexec] = "1"
+
+# This looks in S, so we better make sure there's
+# something in the directory.
+#
+do_populate_lic[depends] = "${PN}:do_configure"
+
+
+EXTRA_OEMAKE = '\
+                CC="${CC}" \
+		'CFLAGS=-Wall -I${STAGING_KERNEL_DIR}/arch/x86/include/uapi ${LDFLAGS}' \
+               '
+
+# If we build under STAGING_KERNEL_DIR, source will not be put
+# into the dbg rpm.  STAGING_KERNEL_DIR will exist by the time
+# do_configure() is invoked so we can safely copy from it.
+#
+do_configure_prepend() {
+	mkdir -p ${S}
+	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/msr-index.h ${S}
+	cp -r ${STAGING_KERNEL_DIR}/arch/x86/include/asm/intel-family.h ${S}
+	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
+	cp -r ${STAGING_KERNEL_DIR}/COPYING ${S}
+}
+
+do_compile() {
+	sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
+	sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
+	sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
+	oe_runmake STAGING_KERNEL_DIR=${STAGING_KERNEL_DIR}
+}
+
+do_install() {
+	oe_runmake DESTDIR="${D}" install
+}
-- 
2.11.0


