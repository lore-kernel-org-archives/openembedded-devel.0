Return-Path: <frederic.paut@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 02ECD6CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Oct 2013 15:25:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Oct 2013 08:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1019,1371106800"; d="scan'208";a="410436343"
Received: from fpaut-mobl2.mp.intel.com ([10.237.24.36])
	by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2013 08:25:28 -0700
From: Frederic PAUT <frederic.paut@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Oct 2013 17:25:28 +0200
Message-Id: <1380727528-29964-1-git-send-email-frederic.paut@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [YOCTO][meta-oe][PATCH] autobahn recipe (v0.5.14)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Oct 2013 15:25:28 -0000

AutobahnPython provides a WebSocket (RFC6455, Hybi-10 to -17, Hixie-76)
framework for creating WebSocket-based clients and servers.
AutobahnPython also includes an implementation of WAMP
(The WebSockets Application Messaging Protocol), a light-weight,
asynchronous RPC/PubSub over JSON/WebSocket protocol.

Signed-off-by: Frederic PAUT <frederic.paut@linux.intel.com>
---
 .../python/python-autobahn_0.5.14.bb               |   32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb

diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb b/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb
new file mode 100644
index 0000000..9f051a3
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "AutobahnPython provides a WebSocket (RFC6455, Hybi-10 to -17, Hixie-76) framework for creating WebSocket-based clients and servers. \
+AutobahnPython also includes an implementation of WAMP (The WebSockets Application Messaging Protocol), a light-weight,  \
+asynchronous RPC/PubSub over JSON/WebSocket protocol."
+HOMEPAGE = "http://autobahn.ws/python"
+SECTION = "console/network"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
+
+SRC_URI = "https://pypi.python.org/packages/source/a/autobahn/autobahn-${PV}.zip"
+SRC_URI[md5sum] = "e2c80ba3e46428b32837537609d4d582"
+
+S = "${WORKDIR}/autobahn-${PV}"
+
+inherit setuptools
+
+RDEPENDS_${PN} = "python python-pprint python-twisted-protocols python-netserver python-twisted-web"
+
+FILES_${PN}-${PV} = " \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/httpstatus.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/__init__.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/pbkdf2.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/prefixmap.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/resource.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/useragent.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/utf8validator.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/util.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/_version.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/wamp.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/websocket.py \
+    ${libdir}/${PYTHON_DIR}/site-packages/autobahn/xormasker.py \
+    "                     
\ No newline at end of file
-- 
1.7.10.4


