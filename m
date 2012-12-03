Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaI8-00028n-ID
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:52 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528061"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:30 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:10 +0000
Message-Id: <d3e83d8c7d3f408ab1ba1e8d4921ff152e0bf2ba.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 04/11] libnetfilter-conntrack: add from OE-Classic and update
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:52 -0000

* Update to version 1.0.2
* Add SUMMARY and tweak DESCRIPTION
* Add HOMEPAGE
* Add dependency on libmnl

Based on a patch by Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libnetfilter/libnetfilter-conntrack_1.0.2.bb         |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb
new file mode 100644
index 0000000..fb915ab
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-conntrack_1.0.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Netfilter connection tracking library"
+DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter connection tracking state table"
+HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_conntrack/index.html"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libnfnetlink libmnl"
+
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_conntrack/files/libnetfilter_conntrack-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "447114b5d61bb9a9617ead3217c3d3ff"
+SRC_URI[tar.sha256sum] = "a0bd747dd58ae1513586b43c7125b41e6325f97eb95ac63d53cf5aeb33254d12"
+
+S = "${WORKDIR}/libnetfilter_conntrack-${PV}"
+
+inherit autotools pkgconfig
-- 
1.7.10.4



