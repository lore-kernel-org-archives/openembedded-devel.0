Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaIA-00028f-1u
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:54 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528095"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:13 +0000
Message-Id: <1e2d3a90575dc606fed4c9f276c1131b53680371.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 07/11] libnetfilter-queue: add new recipe for version 1.0.2
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:54 -0000

This library is needed by recent versions of conntrack-tools.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libnetfilter/libnetfilter-queue_1.0.2.bb             |   14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb

diff --git a/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
new file mode 100644
index 0000000..7276f5c
--- /dev/null
+++ b/meta-networking/recipes-filter/libnetfilter/libnetfilter-queue_1.0.2.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Netfilter packet queue access library"
+DESCRIPTION = "Userspace library providing a programming interface (API) to access the Linux kernel netfilter packet queue"
+HOMEPAGE = "http://www.netfilter.org/projects/libnetfilter_queue/index.html"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+DEPENDS = "libnfnetlink"
+
+SRC_URI = "http://www.netfilter.org/projects/libnetfilter_queue/files/libnetfilter_queue-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "df09befac35cb215865b39a36c96a3fa"
+SRC_URI[tar.sha256sum] = "838490eb5dbe358f9669823704982f5313a8d397111562373200203f93ac1a32"
+
+S = "${WORKDIR}/libnetfilter_queue-${PV}"
+
+inherit autotools pkgconfig
-- 
1.7.10.4



