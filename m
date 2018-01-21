Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 76AFE78748
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 23:45:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2018 15:45:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,393,1511856000"; d="scan'208";a="197412390"
Received: from wrath.jf.intel.com ([10.54.70.11])
	by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2018 15:45:27 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 21 Jan 2018 15:45:17 -0800
Message-Id: <20180121234517.26145-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [meta-python][PATCH] python[3]-systemd: cleanup common content; fix build for musl
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
X-List-Received-Date: Sun, 21 Jan 2018 23:45:41 -0000

* Put common content in python-systemd.inc
* Add patch to provide strndupa() for musl

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../recipes-devtools/python/python-systemd.inc     | 18 ++++++++++
 ...ovide-implementation-of-strndupa-for-musl.patch | 42 ++++++++++++++++++++++
 .../recipes-devtools/python/python-systemd_234.bb  | 15 ++------
 .../recipes-devtools/python/python3-systemd_234.bb | 15 ++------
 4 files changed, 64 insertions(+), 26 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-systemd.inc
 create mode 100644 meta-python/recipes-devtools/python/python-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch

diff --git a/meta-python/recipes-devtools/python/python-systemd.inc b/meta-python/recipes-devtools/python/python-systemd.inc
new file mode 100644
index 000000000..808af82cd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-systemd.inc
@@ -0,0 +1,18 @@
+SUMMARY = "Python interface for libsystemd"
+HOMEPAGE = "https://github.com/systemd/python-systemd"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
+
+PYPI_PACKAGE = "systemd-python"
+DEPENDS += "systemd (<=234)"
+RDEPENDS_${PN} += "systemd"
+REQUIRED_DISTRO_FEATURES = "systemd"
+inherit pypi distro_features_check
+
+SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
+SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
+
+# allow for common patches for python- and python3-systemd
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-systemd:"
+
+SRC_URI_append_libc-musl = " file://0001-Provide-implementation-of-strndupa-for-musl.patch"
diff --git a/meta-python/recipes-devtools/python/python-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch b/meta-python/recipes-devtools/python/python-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch
new file mode 100644
index 000000000..d7085a856
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-systemd/0001-Provide-implementation-of-strndupa-for-musl.patch
@@ -0,0 +1,42 @@
+From 8b639f9faf6199e47b9eae0698d01a22917b6abe Mon Sep 17 00:00:00 2001
+From: Tim Orling <timothy.t.orling@linux.intel.com>
+Date: Fri, 29 Dec 2017 09:17:17 -0800
+Subject: [PATCH] Provide implementation of strndupa for musl
+
+Reuse the approach from oe-core:
+/meta/recipes-core/systemd/systemd/0002-src-basic-missing.h-check-for-missing-strndupa.patch
+
+Original patch author: Emil Renner Berthing <systemd@esmil.dk>
+
+Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com
+---
+Upstream-Status: Pending
+
+ systemd/util.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/systemd/util.c b/systemd/util.c
+index e02c825..277e611 100644
+--- a/systemd/util.c
++++ b/systemd/util.c
+@@ -34,6 +34,17 @@
+ 
+ #include "util.h"
+ 
++#if !HAVE_DECL_STRNDUPA
++#define strndupa(s, n) \
++  ({ \
++    const char *__old = (s); \
++    size_t __len = strnlen(__old, (n)); \
++    char *__new = (char *)alloca(__len + 1); \
++    __new[__len] = '\0'; \
++    (char *)memcpy(__new, __old, __len); \
++  })
++#endif
++
+ int safe_atou(const char *s, unsigned *ret_u) {
+         char *x = NULL;
+         unsigned long l;
+-- 
+2.13.6
+
diff --git a/meta-python/recipes-devtools/python/python-systemd_234.bb b/meta-python/recipes-devtools/python/python-systemd_234.bb
index ef1183171..80f290077 100644
--- a/meta-python/recipes-devtools/python/python-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python-systemd_234.bb
@@ -1,13 +1,2 @@
-SUMMARY = "Python interface for libsystemd"
-HOMEPAGE = "https://github.com/systemd/python-systemd"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
-
-PYPI_PACKAGE = "systemd-python"
-DEPENDS += "systemd (<=234)"
-RDEPENDS_${PN} += "systemd"
-REQUIRED_DISTRO_FEATURES = "systemd"
-inherit pypi setuptools distro_features_check
-
-SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
-SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
+require python-systemd.inc
+inherit setuptools
diff --git a/meta-python/recipes-devtools/python/python3-systemd_234.bb b/meta-python/recipes-devtools/python/python3-systemd_234.bb
index 845b7d9e1..580d99352 100644
--- a/meta-python/recipes-devtools/python/python3-systemd_234.bb
+++ b/meta-python/recipes-devtools/python/python3-systemd_234.bb
@@ -1,13 +1,2 @@
-SUMMARY = "Python interface for libsystemd"
-HOMEPAGE = "https://github.com/systemd/python-systemd"
-LICENSE = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4fbd65380cdd255951079008b364516c"
-
-PYPI_PACKAGE = "systemd-python"
-DEPENDS += "systemd (<=234)"
-RDEPENDS_${PN} += "systemd"
-REQUIRED_DISTRO_FEATURES = "systemd"
-inherit pypi setuptools3 distro_features_check
-
-SRC_URI[md5sum] = "5071ea5bcb976186e92a3f5e75df221d"
-SRC_URI[sha256sum] = "fd0e44bf70eadae45aadc292cb0a7eb5b0b6372cd1b391228047d33895db83e7"
+require python-systemd.inc
+inherit setuptools3
-- 
2.13.6


