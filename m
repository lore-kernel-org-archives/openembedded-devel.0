Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaI6-00028f-4i
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:50 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528035"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:07 +0000
Message-Id: <477f47037079ec758f6d4050de5900ce041852af.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 01/11] netcat: add from OE-Classic
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:50 -0000

Changes from the OE-Classic recipe:
* Use ALTERNATIVE_${PN} instead of ALTERNATIVE_NAME
* Add LIC_FILES_CHKSUM
* Move SRC_URI checksums underneath SRC_URI

Based on a patch by Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support/netcat/netcat_0.7.1.bb         |   21 ++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-networking/recipes-support/netcat/netcat_0.7.1.bb

diff --git a/meta-networking/recipes-support/netcat/netcat_0.7.1.bb b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
new file mode 100644
index 0000000..c5ab85d
--- /dev/null
+++ b/meta-networking/recipes-support/netcat/netcat_0.7.1.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "GNU Netcat"
+HOMEPAGE = "http://netcat.sourceforge.net"
+SECTION = "console/network"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/netcat/netcat-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "0a29eff1736ddb5effd0b1ec1f6fe0ef"
+SRC_URI[sha256sum] = "b55af0bbdf5acc02d1eb6ab18da2acd77a400bafd074489003f3df09676332bb"
+
+inherit autotools update-alternatives gettext
+
+do_install_append() {
+	mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
+}
+
+ALTERNATIVE_${PN} = "nc"
+ALTERNATIVE_PRIORITY = "100"
-- 
1.7.10.4



