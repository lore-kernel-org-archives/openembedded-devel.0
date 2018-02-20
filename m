Return-Path: <maxin.john@intel.com>
X-Greylist: delayed 575 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 20 Feb 2018 08:45:45 UTC
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 0560573123
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 08:45:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2018 00:36:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,538,1511856000"; d="scan'208";a="19672279"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga006.jf.intel.com with ESMTP; 20 Feb 2018 00:36:11 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 80B9758038C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 00:36:11 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Feb 2018 10:38:46 +0200
Message-Id: <1519115926-35489-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [meta-python][PATCH] python-evdev: add python3 version of the recipe
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
X-List-Received-Date: Tue, 20 Feb 2018 08:45:46 -0000

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-python/recipes-devtools/python/python-evdev.inc    | 15 +++++++++++++++
 .../recipes-devtools/python/python-evdev_0.7.0.bb       | 17 +----------------
 .../recipes-devtools/python/python3-evdev_0.7.0.bb      |  2 ++
 3 files changed, 18 insertions(+), 16 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python-evdev.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-evdev_0.7.0.bb

diff --git a/meta-python/recipes-devtools/python/python-evdev.inc b/meta-python/recipes-devtools/python/python-evdev.inc
new file mode 100644
index 0000000..ccd5077
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-evdev.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Python evdev lib"
+HOMEPAGE = "https://github.com/gvalkov/python-evdev"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
+
+SRC_URI[md5sum] = "c7e855ae9f97f869a59e75b29f05ce74"
+SRC_URI[sha256sum] = "57edafc469a414f58b51af1bfb9ee2babb9f626dd2df530d71c1176871850aa1"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-ctypes \
+    ${PYTHON_PN}-fcntl \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-stringold \
+    "
diff --git a/meta-python/recipes-devtools/python/python-evdev_0.7.0.bb b/meta-python/recipes-devtools/python/python-evdev_0.7.0.bb
index 0875da4..6354136 100644
--- a/meta-python/recipes-devtools/python/python-evdev_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python-evdev_0.7.0.bb
@@ -1,17 +1,2 @@
-SUMMARY = "Python evdev lib"
-HOMEPAGE = "https://github.com/gvalkov/python-evdev"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
-
-SRC_URI[md5sum] = "c7e855ae9f97f869a59e75b29f05ce74"
-SRC_URI[sha256sum] = "57edafc469a414f58b51af1bfb9ee2babb9f626dd2df530d71c1176871850aa1"
-
 inherit pypi setuptools
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-ctypes \
-    ${PYTHON_PN}-fcntl \
-    ${PYTHON_PN}-io \
-    ${PYTHON_PN}-shell \
-    ${PYTHON_PN}-stringold \
-    "
+require python-evdev.inc
diff --git a/meta-python/recipes-devtools/python/python3-evdev_0.7.0.bb b/meta-python/recipes-devtools/python/python3-evdev_0.7.0.bb
new file mode 100644
index 0000000..3a92b6e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-evdev_0.7.0.bb
@@ -0,0 +1,2 @@
+inherit pypi setuptools3
+require python-evdev.inc
-- 
2.4.0


