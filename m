Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TfaI6-00028f-Ve
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 18:58:51 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Dec 2012 09:44:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,208,1355126400"; d="scan'208";a="175528042"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.191])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Dec 2012 09:44:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  3 Dec 2012 17:44:08 +0000
Message-Id: <d39cd779b4f6fd605239f3264ecfa1d78a8e4884.1354555874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354555874.git.paul.eggleton@linux.intel.com>
References: <cover.1354555874.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 02/11] libnfnetlink: move to meta-networking and update to 1.0.1
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
X-List-Received-Date: Mon, 03 Dec 2012 17:58:51 -0000

* Fix SRC_URI checksum to not be version-specific
* Refer to new COPYING file in LIC_FILES_CHKSUM (previously none was
  distributed)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb       |   11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb => meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb (60%)

diff --git a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
similarity index 60%
rename from meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
rename to meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
index f4a65f0..036366a 100644
--- a/meta-oe/recipes-connectivity/libnfnetlink/libnfnetlink_1.0.0.bb
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Low-level library for netfilter related kernel/userspace communication"
 DESCRIPTION = "libnfnetlink is the low-level library for netfilter related \
 kernel/userspace communication. It provides a generic messaging \
 infrastructure for in-kernel netfilter subsystems (such as nfnetlink_log, \
@@ -7,12 +8,12 @@ HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
 SECTION = "devel/libs"
 LICENSE = "GPLv2+"
 
-PR = "r1"
+PR = "r0"
 
-LIC_FILES_CHKSUM = "file://src/libnfnetlink.c;beginline=3;endline=11;md5=28bd3bf7f60a78101491eef6b9bb9eba"
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
-SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=libnfnetlink-${PV}"
-SRC_URI[libnfnetlink-1.0.0.md5sum] = "016fdec8389242615024c529acc1adb8"
-SRC_URI[libnfnetlink-1.0.0.sha256sum] = "3752b03a4c09821ee9a2528d69289423a01e7171f1a22dfdd11d5459e03972fb"
+SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=tar"
+SRC_URI[tar.md5sum] = "98927583d2016a9fb1936fed992e2c5e"
+SRC_URI[tar.sha256sum] = "f270e19de9127642d2a11589ef2ec97ef90a649a74f56cf9a96306b04817b51a"
 
 inherit autotools pkgconfig
-- 
1.7.10.4



