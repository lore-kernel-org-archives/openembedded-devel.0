Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 47196780A1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:14:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 04:14:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,440,1500966000"; d="scan'208";a="156104836"
Received: from lmazlan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.67.104])
	by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2017 04:14:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Sep 2017 00:14:22 +1300
Message-Id: <1fdecc334ec50875786acd2a50a4cb45ebd05b63.1506424421.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1506424421.git.paul.eggleton@linux.intel.com>
References: <cover.1506424421.git.paul.eggleton@linux.intel.com>
Subject: [meta-python][PATCH 1/1] python-pyfirmata: move in from meta-intel-iot-middleware and upgrade
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
X-List-Received-Date: Tue, 26 Sep 2017 11:14:32 -0000

The following improvements have been made over the recipe that was in
meta-intel-iot-middleware (a layer which is no longer actively
maintained):

* Upgrade to 1.0.3
* Inherit from setuptools instead of distutils since that changed with
  the upgrade
* Inherit pypi and also provide Python 3 version
* Use the correct LICENSE (changed BSD -> MIT back at version 0.9.5)
* Set short description in SUMMARY instead of DESCRIPTION

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-python/recipes-devtools/python/python-pyfirmata.inc    | 13 +++++++++++++
 .../recipes-devtools/python/python-pyfirmata_1.0.3.bb       |  3 +++
 .../recipes-devtools/python/python3-pyfirmata_1.0.3.bb      |  3 +++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pyfirmata.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pyfirmata_1.0.3.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pyfirmata_1.0.3.bb

diff --git a/meta-python/recipes-devtools/python/python-pyfirmata.inc b/meta-python/recipes-devtools/python/python-pyfirmata.inc
new file mode 100644
index 0000000..2365379
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyfirmata.inc
@@ -0,0 +1,13 @@
+SUMMARY = "A Python interface for the Firmata protocol"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84ddcef430b7c44caa22b2ff4b37a3df"
+PYPI_PACKAGE = "pyFirmata"
+
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-pyserial \
+"
+
+SRC_URI[md5sum] = "ee4c23ca5c35d3091d550a63540811a3"
+SRC_URI[sha256sum] = "b54d49d66a9d93c1ef9c72ca01264414cb2de177baac116c12d5cce0c380160c"
+
+inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyfirmata_1.0.3.bb b/meta-python/recipes-devtools/python/python-pyfirmata_1.0.3.bb
new file mode 100644
index 0000000..d77e0f3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pyfirmata_1.0.3.bb
@@ -0,0 +1,3 @@
+inherit setuptools
+require python-pyfirmata.inc
+
diff --git a/meta-python/recipes-devtools/python/python3-pyfirmata_1.0.3.bb b/meta-python/recipes-devtools/python/python3-pyfirmata_1.0.3.bb
new file mode 100644
index 0000000..25af1b5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyfirmata_1.0.3.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-pyfirmata.inc
+
-- 
2.9.5


