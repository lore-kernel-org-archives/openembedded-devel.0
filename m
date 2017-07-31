Return-Path: <kevron.m.rees@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6A96C78589
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jul 2017 17:52:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2017 10:52:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,304,1498546800"; d="scan'208";a="1201174291"
Received: from tripzero-desktop.jf.intel.com ([10.54.70.70])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2017 10:51:55 -0700
From: Kevron Rees <kevron.m.rees@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Jul 2017 10:52:30 -0700
Message-Id: <1501523550-30183-1-git-send-email-kevron.m.rees@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] add recipes for autobahn and txaio
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
X-List-Received-Date: Mon, 31 Jul 2017 17:52:07 -0000

Signed-off-by: Kevron Rees <kevron.m.rees@intel.com>
---
 .../python-autobahn/python3-autobahn_17.7.1.bb     | 16 ++++++++
 .../recipes-devtools/python/python3-txaio_2.8.1.bb | 43 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-python/recipes-connectivity/python-autobahn/python3-autobahn_17.7.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-txaio_2.8.1.bb

diff --git a/meta-python/recipes-connectivity/python-autobahn/python3-autobahn_17.7.1.bb b/meta-python/recipes-connectivity/python-autobahn/python3-autobahn_17.7.1.bb
new file mode 100644
index 0000000..644fa6c
--- /dev/null
+++ b/meta-python/recipes-connectivity/python-autobahn/python3-autobahn_17.7.1.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "AutobahnPython provides a WebSocket (RFC6455, Hybi-10 to -17, Hixie-76) framework for creating WebSocket-based clients and servers. \
+AutobahnPython also includes an implementation of WAMP (The WebSockets Application Messaging Protocol), a light-weight,  \
+asynchronous RPC/PubSub over JSON/WebSocket protocol."
+HOMEPAGE = "http://autobahn.ws/python"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = " file://autobahn/__init__.py;beginline=1;endline=17;md5=3efa50c72bcff15042722ebd09c54701"
+
+SRC_URI[md5sum] = "0458295eff8a05b09982e87125a1a2e8"
+SRC_URI[sha256sum] = "801a318d5bf6776a60f7a93d715f83f7f12204b470019a339e4e7e14087c17e6"
+
+PYPI_PACKAGE_EXT = "tar.gz"
+inherit pypi setuptools3
+
+RDEPENDS_${PN} = "python3 python3-txaio"
+
diff --git a/meta-python/recipes-devtools/python/python3-txaio_2.8.1.bb b/meta-python/recipes-devtools/python/python3-txaio_2.8.1.bb
new file mode 100644
index 0000000..f6b72c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txaio_2.8.1.bb
@@ -0,0 +1,43 @@
+# Recipe created by recipetool
+# This is the basis of a recipe and may need further editing in order to be fully functional.
+# (Feel free to remove these comments when editing.)
+
+SUMMARY = "Compatibility API between asyncio/Twisted/Trollius"
+HOMEPAGE = "https://github.com/crossbario/txaio"
+# WARNING: the following LICENSE and LIC_FILES_CHKSUM values are best guesses - it is
+# your responsibility to verify that the values are complete and correct.
+# NOTE: License in setup.py/PKGINFO is: MIT License
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
+
+SRC_URI = "https://pypi.python.org/packages/1a/e5/7f9106acf4d12b6f5c30d1e654d8f0f3d7aec6fe13a4fe83895f331e10cf/txaio-${PV}.tar.gz"
+SRC_URI[md5sum] = "2e36cbc6b34b5cacb1bf8a05c1ae114e"
+SRC_URI[sha256sum] = "fe2e0e4d3a06705f86bbd351fdd1f39dae61755e44162375e024acbf32eafddb"
+
+S = "${WORKDIR}/txaio-${PV}"
+
+inherit setuptools3
+
+# The following configs & dependencies are from setuptools extras_require.
+# These dependencies are optional, hence can be controlled via PACKAGECONFIG.
+# The upstream names may not correspond exactly to bitbake package names.
+#
+# Uncomment this line to enable all the optional features.
+#PACKAGECONFIG ?= "dev twisted all"
+PACKAGECONFIG[dev] = ",,,python3-mock python3-pep8 python3-pyenchant python3-pytest python3-pytest-cov python3-sphinx python3-sphinx_rtd_theme python3-sphinxcontrib-spelling python3-tox python3-twine"
+PACKAGECONFIG[twisted] = ",,,python3-twisted python3-zope-interface"
+PACKAGECONFIG[all] = ",,,python3-twisted python-zope-interface"
+
+# WARNING: the following rdepends are from setuptools install_requires. These
+# upstream names may not correspond exactly to bitbake package names.
+RDEPENDS_${PN} += "python3-six"
+
+# WARNING: the following rdepends are determined through basic analysis of the
+# python sources, and might not be 100% accurate.
+#RDEPENDS_${PN} += "python3-contextlib python3-core python3-datetime python3-lang python3-logging"
+
+
+do_install_append() {
+	echo "removing licence file because why is it installed here?"
+	rm -rf ${D}/usr/share
+}
-- 
2.7.4


