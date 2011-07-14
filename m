Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QhNql-0007WR-4o
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jul 2011 17:29:16 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2011 08:25:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,529,1304319600"; d="scan'208";a="25856525"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.207])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2011 08:25:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Jul 2011 16:25:09 +0100
Message-Id: <ee364ff9d7e21bfa9871e2e134648cefa8e721b5.1310656986.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1310656986.git.paul.eggleton@linux.intel.com>
References: <cover.1310656986.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1310656986.git.paul.eggleton@linux.intel.com>
References: <cover.1310656986.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe] [PATCH 2/3] pango: remove inherit of flow-lossage.bbclass
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
X-List-Received-Date: Thu, 14 Jul 2011 15:29:16 -0000

This should no longer be needed with modern gcc versions.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb b/meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb
index 449e769..3489464 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.26.0.bb
@@ -3,11 +3,11 @@ SECTION = "libs"
 LICENSE = "LGPL"
 DEPENDS = "mm-common cairomm glibmm"
 SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.bz2"
 
-inherit autotools flow-lossage
+inherit autotools
 
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev += "${libdir}/*/include/"
-- 
1.7.4.1



