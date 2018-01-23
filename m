Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC3B787BE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jan 2018 22:15:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2018 14:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,403,1511856000"; d="scan'208";a="168597009"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 23 Jan 2018 14:15:09 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Jan 2018 14:15:03 -0800
Message-Id: <20180123221503.52037-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [meta-oe][PATCH] cpuid: add recipe for v20170122
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
X-List-Received-Date: Tue, 23 Jan 2018 22:15:25 -0000

cpuid dumps detailed information about the CPU(s) gathered from the CPUID
instruction, and also determines the exact model of CPU(s). It supports
Intel, AMD, and VIA CPUs, as well as older Transmeta, Cyrix, UMC, NexGen,
Rise, and SiS CPUs.

http://www.etallen.com/cpuid.html

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb

diff --git a/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb b/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
new file mode 100644
index 0000000000..7a70f75763
--- /dev/null
+++ b/meta-oe/recipes-devtools/cpuid/cpuid_20170122.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Linux tool to dump x86 CPUID information about the CPU(s)"
+DESCRIPTION = "cpuid dumps detailed information about the CPU(s) gathered \
+from the CPUID instruction, and also determines the exact model of CPU(s). \
+It supports Intel, AMD, and VIA CPUs, as well as older Transmeta, Cyrix, \
+UMC, NexGen, Rise, and SiS CPUs"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = "http://www.etallen.com/${BPN}/${BP}.src.tar.gz"
+SRC_URI[md5sum] = "1c46a6662626c5a6eaca626f23a5a7d7"
+SRC_URI[sha256sum] = "667612aae6704341dd10844e97c84c5c5c8700817a5937a3c293b55013bc4865"
+
+COMPATIBLE_HOST = "(i.86|x86_64).*-linux"
+
+# The install rule from the Makefile has hardcoded paths, so we duplicate
+# the actions to accommodate different paths.
+do_install () {
+    install -d -m755 ${D}/${bindir}
+    install -m755 ${B}/cpuid ${D}/${bindir}/cpuid
+    install -d -m755 ${D}/${mandir}
+    install -m444 ${B}/cpuid.man.gz ${D}/${mandir}
+}
-- 
2.14.3


