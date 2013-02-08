Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U3qCd-0000ra-Sw
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Feb 2013 16:49:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Feb 2013 07:33:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,630,1355126400"; d="scan'208";a="284541525"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.51])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2013 07:33:20 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2013 15:33:08 +0000
Message-Id: <d27fbed307bc6afc4e260622a8c36b32fc2d89ce.1360337212.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360337212.git.paul.eggleton@linux.intel.com>
References: <cover.1360337212.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/6] python-feedparser: add new recipe for version 5.1.3
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
X-List-Received-Date: Fri, 08 Feb 2013 15:49:28 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-devtools/python/python-feedparser_5.1.3.bb   |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb

diff --git a/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
new file mode 100644
index 0000000..86e4fd6
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python-feedparser_5.1.3.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python Atom and RSS feed parser"
+HOMEPAGE = "http://code.google.com/p/feedparser"
+SECTION = "devel/python"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=39082dbc030b4a3ee3e48e162eab408e"
+
+SRC_URI = "http://feedparser.googlecode.com/files/feedparser-${PV}.tar.bz2"
+SRC_URI[md5sum] = "f8790accd379b578261cb5b0047bd20c"
+SRC_URI[sha256sum] = "91a28a76b5cbaf7457a22e47e04347568a1f21fac85c806867ac72d32aabe718"
+
+S = "${WORKDIR}/feedparser-${PV}"
+
+inherit distutils
+
-- 
1.7.10.4



