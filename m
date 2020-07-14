Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.13611.1594702434169309736
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 21:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: wNzWL7q9iWUSSrNLV320LI4qlajNPncasmg9ntCKWGsgM+ve+iNC09Mq+8ki/XYdv6xGWd0PZI
 DU4PNDA7hnBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="166912746"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="166912746"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2020 21:53:52 -0700
IronPort-SDR: MwaOxKpCRIuuKqg91g5FC6M/1StrtWn/erudUVjrsTsqtYINZnz7PjUDxZn16IGoR21VBRKNR3
 jsW1bWsX17KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; 
   d="scan'208";a="429638762"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by orsmga004.jf.intel.com with ESMTP; 13 Jul 2020 21:53:51 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/2] safestringlib: add recipe
Date: Tue, 14 Jul 2020 13:01:19 +0800
Message-Id: <20200714050120.17802-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1

The Secure Development Lifecycle (SDL) recommends banning certain
C Library functions because they directly contribute to security
vulnerabilities such as buffer overflows.

However routines for the manipulation of strings and memory buffers
are common in software and firmware, and are essential to accomplish
certain programming tasks.

Safer replacements for these functions that avoid or prevent serious
security vulnerabilities (e.g. buffer overflows, string format attacks,
conversion overflows/underflows, etc.) are available in the SafeString Library.

Ref:
https://github.com/intel/safestringlib

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../safestringlib/safestringlib_git.bb        | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-support/safestringlib/safestringlib_git.bb

diff --git a/meta-oe/recipes-support/safestringlib/safestringlib_git.bb b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
new file mode 100644
index 000000000..1ca594412
--- /dev/null
+++ b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Safe string operations and memory routines"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE&COPYING.txt;md5=edd6f8c4c1072d72645ae28cb04bdbce \
+                    file://LICENSE;md5=54f68ba2c33474320fcc46b1f2d01249"
+
+SRC_URI = "git://github.com/intel/safestringlib.git;protocol=https \
+        "
+
+PV = "1.0.0+git${SRCPV}"
+SRCREV = "245c4b8cff1d2e7338b7f3a82828fc8e72b29549"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'
+
+do_install() {
+    install -d ${D}${libdir}
+    install -d ${D}${includedir}
+    install -m 0644 ${B}/libsafestring_shared.so ${D}${libdir}
+    install -m 0644 ${B}/libsafestring_static.a ${D}${libdir}
+    install -m 0644 ${S}/include/*.h ${D}${includedir}
+}
+
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
-- 
2.17.1

