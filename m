Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TaV6l-00081d-5L
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2012 18:26:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Nov 2012 09:11:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,280,1352102400"; d="scan'208";a="249506874"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.190])
	by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2012 09:11:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Nov 2012 17:11:24 +0000
Message-Id: <85b1fc35ede29a0580f6858d428a5a08d068a8ff.1353345006.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1353345006.git.paul.eggleton@linux.intel.com>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1353345006.git.paul.eggleton@linux.intel.com>
References: <cover.1353345006.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 2/8] tunctl: add from OE-Classic and tweak
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
X-List-Received-Date: Mon, 19 Nov 2012 17:26:08 -0000

* Set SUMMARY (which sets DESCRIPTION)
* Make LICENSE more accurate
* Add LIC_FILES_CHKSUM

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-support/tunctl/tunctl.inc  |   15 +++++++++++++++
 .../recipes-support/tunctl/tunctl_1.5.bb           |    4 ++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-networking/recipes-support/tunctl/tunctl.inc
 create mode 100644 meta-networking/recipes-support/tunctl/tunctl_1.5.bb

diff --git a/meta-networking/recipes-support/tunctl/tunctl.inc b/meta-networking/recipes-support/tunctl/tunctl.inc
new file mode 100644
index 0000000..952af24
--- /dev/null
+++ b/meta-networking/recipes-support/tunctl/tunctl.inc
@@ -0,0 +1,15 @@
+SUMMARY = "Tool for controlling the Linux TUN/TAP driver"
+SECTION = "net"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://tunctl.c;startline=1;endline=4;md5=ff3a09996bc5fff6bc5d4e0b4c28f999"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/tunctl/tunctl-${PV}.tar.gz"
+
+do_compile() {
+	oe_runmake tunctl
+}
+
+do_install() {
+	install -d ${D}/${sbindir}
+	install -m 755 tunctl ${D}/${sbindir}
+}
diff --git a/meta-networking/recipes-support/tunctl/tunctl_1.5.bb b/meta-networking/recipes-support/tunctl/tunctl_1.5.bb
new file mode 100644
index 0000000..dd26561
--- /dev/null
+++ b/meta-networking/recipes-support/tunctl/tunctl_1.5.bb
@@ -0,0 +1,4 @@
+require tunctl.inc
+
+SRC_URI[md5sum] = "fdbedc263b3e85bb0e087cd567414607"
+SRC_URI[sha256sum] = "aa2a6c4cc6bfacb11e0d9f62334a6638a0d435475c61230116f00b6af8b14fff"
-- 
1.7.9.5



