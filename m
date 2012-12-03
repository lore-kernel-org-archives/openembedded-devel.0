Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaI7-00028f-Nu
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:52 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528048"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:09 +0000
Message-Id: <e7de6514238b9107c17167c26494257bb8160600.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 03/11] libmnl: add new recipe for version 1.0.3
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

This library is required by recent versions of some the libnetfilter*
libraries.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb

diff --git a/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb b/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
new file mode 100644
index 0000000..369aaa9
--- /dev/null
+++ b/meta-networking/recipes-filter/libmnl/libmnl_1.0.3.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Minimalistic user-space Netlink utility library"
+DESCRIPTION = "Minimalistic user-space library oriented to Netlink developers, providing \
+ functions for common tasks in parsing, validating, and constructing both the Netlink header and TLVs."
+HOMEPAGE = "http://www.netfilter.org/projects/libmnl/index.html"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI = "http://www.netfilter.org/projects/libmnl/files/libmnl-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "7d95fc3bea3365bc03c48e484224f65f"
+SRC_URI[tar.sha256sum] = "6f14336e9acdbc62c2dc71bbb59ce162e54e9af5c80153e92476c5443fe784de"
+
+inherit autotools pkgconfig
-- 
1.7.10.4



