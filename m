Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3qCe-0000rb-PS
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 16:49:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 07:33:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="284541536"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 07:33:21 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 15:33:09 +0000
Message-Id: <13bda4e0ae2442cca21064b23051b81ba947a492.1360337212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/6] python-greenlet: add new recipe for version 0.3.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 15:49:29 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb

diff --git a/meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb b/meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb
new file mode 100644
index 0000000..4a240fa
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-greenlet_0.3.4.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python lightweight in-process concurrent programming"
+HOMEPAGE = "http://pypi.python.org/pypi/greenlet"
+SECTION = "devel/python"
+LICENSE = "MIT & PSF"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
+                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
+SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.zip"
+SRC_URI[md5sum] = "530a69acebbb0d66eb5abd83523d8272"
+SRC_URI[sha256sum] = "259ed0f34de9b0c948f42bdaffe378ea53d210d38377c6dcb0c6b728fccad1b0"
+
+S = "${WORKDIR}/greenlet-${PV}"
+
+inherit distutils
+
-- 
1.7.10.4



