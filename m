Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSlzA-0007ZN-E7
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Oct 2012 10:50:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Oct 2012 02:36:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,670,1344236400"; d="scan'208";a="241425420"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.120])
	by fmsmga002.fm.intel.com with ESMTP; 29 Oct 2012 02:36:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2012 09:36:39 +0000
Message-Id: <419c82c89f32cc115ff801a8e3fb0908c138c5dc.1351503373.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1351503373.git.paul.eggleton@linux.intel.com>
References: <cover.1351503373.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1351503373.git.paul.eggleton@linux.intel.com>
References: <cover.1351503373.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/2] ddrescue: add from OE-Classic, update and tidy up
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
X-List-Received-Date: Mon, 29 Oct 2012 09:50:20 -0000

* Update to 1.16
* Add LIC_FILES_CHKSUM
* Add SUMMARY and extend DESCRIPTION
* Drop PRIORITY
* Drop AUTHOR (generally we don't include this)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb

diff --git a/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
new file mode 100644
index 0000000..3000dbb
--- /dev/null
+++ b/meta-oe/recipes-extended/ddrescue/ddrescue_1.16.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Data recovery tool"
+DESCRIPTION = "GNU ddrescue is a data recovery tool. It copies data \
+ from one file or block device (hard disc, cdrom, etc) to another, \
+ trying hard to rescue data in case of read errors."
+HOMEPAGE = "http://www.gnu.org/software/ddrescue/ddrescue.html"
+SECTION = "console"
+LICENSE = "GPLv3+"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
+                    file://main_common.cc;startline=5;endline=16;md5=0ef2c1bede11c6c9c6c12330d60bc7a7"
+
+SRC_URI = "${GNU_MIRROR}/${PN}/${P}.tar.gz"
+SRC_URI[md5sum] = "57b67407e882c6418531d48a2f20d16b"
+SRC_URI[sha256sum] = "76b3f2e5fb0306d24f2632c3e168cccb73dc0a348e3a7089cd9230748ff23de6"
+
+inherit autotools
+
+EXTRA_OECONF = "'CXX=${CXX}' 'CPPFLAGS=${CPPFLAGS}' 'CXXFLAGS=${CXXFLAGS}' 'LDFLAGS=${LDFLAGS}'"
-- 
1.7.9.5



