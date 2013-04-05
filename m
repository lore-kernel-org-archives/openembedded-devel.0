Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UOGRO-0001C0-0S
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 01:53:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2013 16:34:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,418,1363158000"; d="scan'208";a="313153727"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.194])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2013 16:35:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2013 00:35:41 +0100
Message-Id: <e61eed4360c4441da61aa458fc36775290d1c0fc.1365204818.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365204818.git.paul.eggleton@linux.intel.com>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/4] icon-naming-utils: remove
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
X-List-Received-Date: Fri, 05 Apr 2013 23:53:08 -0000

This version is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb  |   23 --------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb

diff --git a/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
deleted file mode 100644
index 88d0779..0000000
--- a/meta-oe/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "libxml-simple-perl-native"
-
-PR = "r3"
-
-SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-${PV}.tar.gz"
-SRC_URI[md5sum] = "2c5c7a418e5eb3268f65e21993277fba"
-SRC_URI[sha256sum] = "044ab2199ed8c6a55ce36fd4fcd8b8021a5e21f5bab028c0a7cdcf52a5902e1c"
-
-S = "${WORKDIR}/icon-naming-utils-${PV}"
-
-inherit autotools allarch perlnative
-
-do_configure_append() {
-        # replace paths to STAGING_BINDIR_NATIVE/perl with ${bindir}/perl
-        sed -i -e "1s:#!.*:#! /usr/bin/env perl:" ${S}/icon-name-mapping.pl.in
-}
-
-FILES_${PN} += "${datadir}/dtds"
-
-BBCLASSEXTEND = "native"
-- 
1.7.10.4



