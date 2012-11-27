Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TdKEb-0006oL-Dt
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 13:25:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Nov 2012 04:11:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,328,1352102400"; d="scan'208";a="222960013"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.231])
	by azsmga001.ch.intel.com with ESMTP; 27 Nov 2012 04:11:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 12:11:32 +0000
Message-Id: <0e6cf54a922e0ce3d3c8143b7c6bbdeb335a492b.1354018185.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354018185.git.paul.eggleton@linux.intel.com>
References: <cover.1354018185.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1354018185.git.paul.eggleton@linux.intel.com>
References: <cover.1354018185.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/4] libcgroup: remove
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
X-List-Received-Date: Tue, 27 Nov 2012 12:25:53 -0000

This is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb |   27 --------------------
 1 file changed, 27 deletions(-)
 delete mode 100644 meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb

diff --git a/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb
deleted file mode 100644
index 9aba6e1..0000000
--- a/meta-oe/recipes-core/libcgroup/libcgroup_0.37.1.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "Libcgroup"
-SECTION = "libs"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-PR = "r1"
-
-inherit autotools pkgconfig
-
-DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${PN}/v${PV}/${PN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "24a41b18de112e8d085bb1f7d9e82af7"
-SRC_URI[sha256sum] = "0b08632de5d3641aa554b422d02a77d9367e57933328a8765204ad9588cd5c0d"
-
-EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
-
-# http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg21444.html
-PARALLEL_MAKE = ""
-
-PACKAGES =+ "cgroups-pam-plugin"
-FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
-FILES_${PN}-dbg += "${base_libdir}/security/.debug"
-FILES_${PN}-dev += "${base_libdir}/security/*.la"
-
-# We really need the symlink so :(
-ERROR_QA = "debug-deps dev-deps debug-files arch la2 pkgconfig la perms"
-- 
1.7.9.5



