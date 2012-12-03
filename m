Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaI8-00028f-OL
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:52 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528075"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:11 +0000
Message-Id: <40deb02f7f396b375ff6a6461dabdc18817ca841.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 05/11] libnetfilter-cttimeout: add new recipe for version 1.0.0
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:53 -0000

This library is needed by recent versions of conntrack-tools.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libnetfilter/libnetfilter-cttimeout_1.0.0.bb          |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
new file mode 100644
index 0000000..2f25852
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cttimeout_1.0.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Netfilter connection tracking timeout library"
+DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter fine-grain connection tracking timeout infrastructure"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libmnl"
+
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_cttimeout/files/libnetfilter_cttimeout-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "7697437fc9ebb6f6b83df56a633db7f9"
+SRC_URI[tar.sha256sum] = "aeab12754f557cba3ce2950a2029963d817490df7edb49880008b34d7ff8feba"
+
+S = "${WORKDIR}/libnetfilter_cttimeout-${PV}"
+
+inherit autotools pkgconfig
-- 
1.7.10.4



