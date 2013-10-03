Return-Path: <frederic.paut@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0C89E6CC91
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2013 13:31:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 03 Oct 2013 06:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1026,1371106800"; d="scan'208";a="387318946"
Received: from fpaut-mobl2.mp.intel.com ([10.237.24.31])
	by orsmga001.jf.intel.com with ESMTP; 03 Oct 2013 06:31:40 -0700
From: Frederic PAUT <frederic.paut@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Oct 2013 15:31:41 +0200
Message-Id: <1380807101-30589-1-git-send-email-frederic.paut@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [YOCTO][meta-oe][PATCH V2] autobahn recipe (v0.5.14)
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
X-List-Received-Date: Thu, 03 Oct 2013 13:31:54 -0000

AutobahnPython provides a WebSocket (RFC6455, Hybi-10 to -17, Hixie-76)
framework for creating WebSocket-based clients and servers.
AutobahnPython also includes an implementation of WAMP
(The WebSockets Application Messaging Protocol), a light-weight,
asynchronous RPC/PubSub over JSON/WebSocket protocol.

Signed-off-by: Frederic PAUT <frederic.paut@linux.intel.com>
---
 .../python/python-autobahn_0.5.14.bb                 |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb

diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb b/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb
new file mode 100644
index 0000000..0208c8b
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-autobahn_0.5.14.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "AutobahnPython provides a WebSocket (RFC6455, Hybi-10 to -17, Hixie-76) framework for creating WebSocket-based clients and servers. \
+AutobahnPython also includes an implementation of WAMP (The WebSockets Application Messaging Protocol), a light-weight,  \
+asynchronous RPC/PubSub over JSON/WebSocket protocol."
+HOMEPAGE = "http://autobahn.ws/python"
+SECTION = "console/network"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = " file://autobahn/__init__.py;beginline=1;endline=17;md5=81964ceb3ab93bfb5e8cfbcd26f3af9c"
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
-- 
1.7.10.4


