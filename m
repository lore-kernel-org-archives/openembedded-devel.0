Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3qCf-0000rb-Ev
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 16:49:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 07:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="284541561"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 07:33:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 15:33:11 +0000
Message-Id: <36d1800774388670e93677ff062ba89958a87902.1360337212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 4/6] python-psutil: add new recipe for version 0.6.1
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
X-List-Received-Date: Fri, 08 Feb 2013 15:49:30 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb

diff --git a/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb b/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
new file mode 100644
index 0000000..6e462c0
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-psutil_0.6.1.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "A cross-platform process and system utilities module for Python"
+SECTION = "devel/python"
+HOMEPAGE = "http://code.google.com/p/psutil"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0f02e99f7f3c9a7fe8ecfc5d44c2be62"
+
+SRC_URI = "http://psutil.googlecode.com/files/psutil-${PV}.tar.gz"
+SRC_URI[md5sum] = "3cfcbfb8525f6e4c70110e44a85e907e"
+SRC_URI[sha256sum] = "d665a4cc58c9a5d207fb0dc9869fc0ee10f4f66ad885e84886ef6339ccce0a6f"
+
+S = "${WORKDIR}/psutil-${PV}"
+
+inherit setuptools
+
-- 
1.7.10.4



