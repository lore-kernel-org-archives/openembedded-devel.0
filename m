Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US3od-0006dI-2S
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Apr 2013 13:12:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 Apr 2013 03:54:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,485,1363158000"; d="scan'208";a="319811889"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by fmsmga001.fm.intel.com with ESMTP; 16 Apr 2013 03:54:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2013 11:53:58 +0100
Message-Id: <d0a8253e41f3eda55cc3bce324558e8fc2c8ab1f.1366109533.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366109533.git.paul.eggleton@linux.intel.com>
References: <cover.1366109533.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking, meta-oe][PATCH 4/9] bridge-utils: move to meta-networking and tweak
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
X-List-Received-Date: Tue, 16 Apr 2013 11:13:10 -0000

* Update HOMEPAGE
* Set SUMMARY instead of DESCRIPTION
* Move DEPENDS up towards the top

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-support}/bridge-utils/bridge-utils.inc              |    7 ++++---
 .../bridge-utils/bridge-utils/kernel-headers.patch              |    0
 .../recipes-support}/bridge-utils/bridge-utils_1.5.bb           |    0
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/bridge-utils/bridge-utils.inc (84%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/bridge-utils/bridge-utils/kernel-headers.patch (100%)
 rename {meta-oe/recipes-connectivity => meta-networking/recipes-support}/bridge-utils/bridge-utils_1.5.bb (100%)

diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
similarity index 84%
rename from meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
rename to meta-networking/recipes-support/bridge-utils/bridge-utils.inc
index 3fc54ba..271fc82 100644
--- a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils.inc
@@ -1,8 +1,10 @@
-DESCRIPTION = "Tools for ethernet bridging."
-HOMEPAGE = "http://bridge.sourceforge.net/"
+SUMMARY = "Tools for ethernet bridging"
+HOMEPAGE = "http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge"
 SECTION = "console/network"
 LICENSE = "GPLv2"
 
+DEPENDS = "sysfsutils"
+
 SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz"
 
 inherit autotools
@@ -16,7 +18,6 @@ do_install_append () {
     install -d ${D}/${sysconfdir}/network/if-post-down.d
 }
 
-DEPENDS = "sysfsutils"
 RRECOMMENDS_${PN} = "kernel-module-bridge"
 
 pkg_postinst_${PN} () {
diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils/kernel-headers.patch b/meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/bridge-utils/bridge-utils/kernel-headers.patch
rename to meta-networking/recipes-support/bridge-utils/bridge-utils/kernel-headers.patch
diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.5.bb
rename to meta-networking/recipes-support/bridge-utils/bridge-utils_1.5.bb
-- 
1.7.10.4



