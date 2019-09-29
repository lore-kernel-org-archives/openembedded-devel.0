Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D4A817F23B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Sep 2019 05:54:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8T5sUBv003990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Sep 2019 22:54:30 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Sat, 28 Sep 2019 22:54:29 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 29 Sep 2019 13:42:41 +0800
Message-ID: <95e4f51534535a918208aacb3062f4a608e096e3.1569734973.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569734973.git.jackie.huang@windriver.com>
References: <cover.1569734973.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 4/4] python-pyperf: add recipes for python2 and python3
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
X-List-Received-Date: Sun, 29 Sep 2019 05:54:29 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The Python pyperf module is a toolkit to write,
run and analyze benchmarks.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../recipes-devtools/python/python-pyperf.inc      | 23 ++++++++++++++++++++++
 .../recipes-devtools/python/python-pyperf_1.6.1.bb |  4 ++++
 .../python/python3-pyperf_1.6.1.bb                 |  4 ++++
 3 files changed, 31 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyperf.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyperf_1.6.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyperf_1.6.1.bb

diff --git a/meta-python/recipes-devtools/python/python-pyperf.inc b/meta-python/recipes-devtools/python/python-pyperf.inc
new file mode 100644
index 0000000..81837f3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyperf.inc
@@ -0,0 +1,23 @@
+SUMMARY = "A toolkit to write, run and analyze benchmarks"
+DESCRIPTION = " \
+The Python pyperf module is a toolkit to write, run and analyze benchmarks. \
+Features: \
+    * Simple API to run reliable benchmarks \
+    * Automatically calibrate a benchmark for a time budget. \
+    * Spawn multiple worker processes. \
+    * Compute the mean and standard deviation. \
+    * Detect if a benchmark result seems unstable. \
+    * JSON format to store benchmark results. \
+    * Support multiple units: seconds, bytes and integer. \
+"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=78bc2e6e87c8c61272937b879e6dc2f8"
+
+SRC_URI[md5sum] = "d67fe5f447963da8873f3e9923f76de1"
+SRC_URI[sha256sum] = "8d0143a22a13ee10c997a648f30b82cdc40175d5a20b11055ae058a82e45d371"
+
+inherit pypi
+
+PYPI_PACKAGE = "pyperf"
+
+DEPENDS += "${PYTHON_PN}-six-native"
diff --git a/meta-python/recipes-devtools/python/python-pyperf_1.6.1.bb b/meta-python/recipes-devtools/python/python-pyperf_1.6.1.bb
new file mode 100644
index 0000000..a9d5c74
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyperf_1.6.1.bb
@@ -0,0 +1,4 @@
+inherit setuptools
+require python-pyperf.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-statistics"
diff --git a/meta-python/recipes-devtools/python/python3-pyperf_1.6.1.bb b/meta-python/recipes-devtools/python/python3-pyperf_1.6.1.bb
new file mode 100644
index 0000000..5ba5efb
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyperf_1.6.1.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-pyperf.inc
+
+RDEPENDS_${PN} += "${PYTHON_PN}-misc"
-- 
2.7.4


