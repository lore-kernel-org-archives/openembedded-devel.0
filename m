Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaIE-00028n-D2
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528082"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:12 +0000
Message-Id: <8892c612c44dd3498ef3c63033be6106e653b523.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 06/11] libnetfilter-cthelper: add new recipe for version 1.0.0
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:58 -0000

This library is needed by recent versions of conntrack-tools.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libnetfilter/libnetfilter-cthelper_1.0.0.bb          |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
new file mode 100644
index 0000000..405e8bf
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-cthelper_1.0.0.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Netfilter connection tracking helper library"
+DESCRIPTION = "Userspace library providing a programming interface (API) to the Linux kernel netfilter user-space helper infrastructure"
+HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_cthelper/index.html"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libmnl"
+
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_cthelper/files/libnetfilter_cthelper-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "b2efab1a3a198a5add448960ba011acd"
+SRC_URI[tar.sha256sum] = "07618e71c4d9a6b6b3dc1986540486ee310a9838ba754926c7d14a17d8fccf3d"
+
+S = "${WORKDIR}/libnetfilter_cthelper-${PV}"
+
+inherit autotools pkgconfig
-- 
1.7.10.4



