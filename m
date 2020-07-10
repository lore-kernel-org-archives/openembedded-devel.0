Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.4583.1594357719904155029
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jul 2020 22:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: naveen.kumar.saini@intel.com)
IronPort-SDR: whB/WFjYSgLQWpj7+8pYDtZ5WlqH+ppG+xNj+4nesi9LmymkJO58cGyDzaHYp5VL+YOp1YfoWL
 pYXI32ZiEdgA==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="148141373"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="148141373"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2020 22:08:38 -0700
IronPort-SDR: qgVBMCuRs2xRGot8Ar4A/PuY477jTYkJCvydwYNt8Rf0LvpAUCxVB9fQUqPamQVoTe+7WbN46a
 YERoVO8htehQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="484528039"
Received: from saininav-desk1.png.intel.com ([172.30.199.23])
  by fmsmga005.fm.intel.com with ESMTP; 09 Jul 2020 22:08:36 -0700
From: "Naveen Saini" <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] safestringlib: add recipe
Date: Fri, 10 Jul 2020 13:16:00 +0800
Message-Id: <20200710051601.11962-1-naveen.kumar.saini@intel.com>
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
 .../safestringlib/safestringlib_git.bb        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-support/safestringlib/safestringlib_git.bb

diff --git a/meta-oe/recipes-support/safestringlib/safestringlib_git.bb b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
new file mode 100644
index 000000000..3d54fc8d6
--- /dev/null
+++ b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
@@ -0,0 +1,26 @@
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

