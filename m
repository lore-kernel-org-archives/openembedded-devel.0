Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB11C44521
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 07:57:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4156.1784534222968260964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 00:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qzEp7Srg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784534223; x=1816070223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8nHm3sJB365ym/5N7c8GY1s8nT6z9rWWam2qCMnpvlM=;
  b=qzEp7SrgulKZSXiwW5tEALRF5xQyx3nLvu9tGnCqv3tpmj2vg6PMpzNt
   eJLXUmNiNJM/eGVJW/NuO17jpIVDJJ87W9EB8fBhIB8yO7P2HpWLv8E4z
   sWaUHwrwOVPE1KTthMXOBMIejB8TBCmU4oT5QmcHlf3eYAu/MvarTRUqA
   ZXT00RG5r66cOtfXsHUgz1l2uoGLaiZnuiBgdYGURwJDFTw4Lvrh90R/Q
   8kougtXpFkNmELSiXk1WblQZWHKBNCH22Y35PafLz7jmETmCE1vycQ77t
   Cilt9/o1VbzHYrIhEv7HDsN355jqcZ2w44BUV7izNi9SflPOgt8UqmIKs
   A==;
X-CSE-ConnectionGUID: UYmVknX2Qcm8Pa2+kY9l4w==
X-CSE-MsgGUID: w4O6gQklR1W1JFyXYRIjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="251450970"
X-IronPort-AV: E=Sophos;i="6.25,174,1779116400"; 
   d="scan'208";a="251450970"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 16:57:01 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2B0521002B80
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:57:01 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id D2E19C0033A
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:57:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id ECFDF404687;
	Mon, 20 Jul 2026 07:56:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] crash-trace: add recipe for crash trace extension module
Date: Mon, 20 Jul 2026 15:56:54 +0800
Message-ID: <20260720075655.2233-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 07:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128275

From: Wang Mingyu <wangmy@fujitsu.com>

Add a new recipe for crash-trace, a crash utility extension that
displays kernel tracing data and traced events prior to a panic.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-kernel/crash/crash-trace_git.bb   | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash-trace_git.bb

diff --git a/meta-oe/recipes-kernel/crash/crash-trace_git.bb b/meta-oe/recipes-kernel/crash/crash-trace_git.bb
new file mode 100644
index 0000000000..b54ef79ab5
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-trace_git.bb
@@ -0,0 +1,65 @@
+SUMMARY = "trace extension module for crash"
+DESCRIPTION = "Displays kernel tracing data and traced events that occurred prior to a panic."
+
+HOMEPAGE = "https://github.com/fujitsu/crash-trace"
+SECTION = "devel"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "crash zlib readline ncurses"
+RDEPENDS:${PN} = "crash"
+
+SRC_URI = "git://github.com/fujitsu/crash-trace.git;branch=master;protocol=https"
+SRCREV = "2106a9d04020192f6f286171a060c4d2300059b7"
+PV = "3.0+git"
+
+TARGET_CC_ARCH:append = " ${SELECTED_OPTIMIZATION}"
+
+# crash 7.1.3 and before don't support mips64/riscv64
+COMPATIBLE_HOST:riscv64 = "null"
+COMPATIBLE_HOST:riscv32 = "null"
+COMPATIBLE_HOST:mipsarchn64 = "null"
+COMPATIBLE_HOST:mipsarchn32 = "null"
+
+python () {
+    arch = d.getVar('TARGET_ARCH')
+    makefile_arch = ""
+    if arch.startswith('x86_64'):
+        makefile_arch = "X86_64"
+    elif arch == 'aarch64':
+        makefile_arch = "ARM64"
+    elif arch == 'i686':
+        makefile_arch = "i686"
+    elif arch == 'i586':
+        makefile_arch = "X86"
+
+    d.setVar('TARGET_ARCH_FOR_MAKEFILE', makefile_arch)
+}
+
+EXTRA_OEMAKE = 'TARGET=${TARGET_ARCH_FOR_MAKEFILE}'
+
+do_configure() {
+    :
+}
+
+do_compile:prepend() {
+    sed -i -E 's,^([ \t]*)gcc ,\1${CC} ${CFLAGS} ,' ${S}/Makefile
+    sed -i 's,INCDIR=/usr/include/crash,INCDIR=${STAGING_INCDIR}/crash,' ${S}/Makefile
+    sed -i 's|-o trace.so|${LDFLAGS} -o trace.so|' ${S}/Makefile
+}
+
+ARM_INSTRUCTION_SET = "arm"
+
+COMPATIBLE_HOST:libc-musl = 'null'
+
+do_install () {
+    install -d ${D}${libdir}/crash/extensions/
+
+    install -m 0644 ${S}/trace.so ${D}/${libdir}/crash/extensions/
+}
+
+FILES:${PN} += " \
+    ${libdir}/crash/extensions/ \
+"
+
-- 
2.43.0


