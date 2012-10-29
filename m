Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSlzB-0007ZN-3S
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 10:50:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Oct 2012 02:36:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,670,1344236400"; d="scan'208";a="241425425"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.120])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2012 02:36:45 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2012 09:36:40 +0000
Message-Id: <a08289afb483cab265d1d098eada947c1335bb65.1351503373.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1351503373.git.paul.eggleton@linux.intel.com>
References: <cover.1351503373.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1351503373.git.paul.eggleton@linux.intel.com>
References: <cover.1351503373.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/2] iotop: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Mon, 29 Oct 2012 09:50:21 -0000

* Update to 0.4.4, adjusting python module dependencies as appropriate
* Add SUMMARY and DESCRIPTION
* Add LIC_FILES_CHKSUM
* Make LICENSE more accurate
* Fix unpackaged directory warning

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 meta-oe/recipes-extended/iotop/iotop_0.4.4.bb

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
new file mode 100644
index 0000000..8be41af
--- /dev/null
+++ b/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
@@ -0,0 +1,24 @@
+SUMMARY = "Simple top-like I/O monitor"
+DESCRIPTION = "iotop does for I/O usage what top(1) does for CPU usage. \
+ It watches I/O usage information output by the Linux kernel and displays \
+ a table of current I/O usage by processes on the system."
+HOMEPAGE = "http://guichaz.free.fr/iotop/"
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
+
+SRC_URI = "http://guichaz.free.fr/iotop/files/${PN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "cdd38b276cbf238676f5d2bcf098ba9c"
+SRC_URI[sha256sum] = "46f3279fb1a7dfc129b5d00950c6e8389e4aedeb58880e848b88d686483df0b0"
+
+inherit distutils
+
+do_install_append() {
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.pyo
+	rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py
+	[ -d ${D}${datadir}/share ] && rmdir ${D}${datadir}/share
+}
+
+RDEPENDS_${PN} = "python-distutils python-curses python-textutils \
+                  python-codecs python-ctypes python-pprint \
+                  python-shell"
-- 
1.7.9.5



