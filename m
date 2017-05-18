Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D360C77E98
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 09:33:21 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 18 May 2017 02:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,358,1491289200"; d="scan'208";a="103511952"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 18 May 2017 02:33:22 -0700
From: Phoong Stanley Cheong Kwan <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 May 2017 19:22:18 -0700
Message-Id: <1495074138-105166-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] xstdcmap: Change libxmu from RDEPENDS -> DEPENDS and unblacklist xstdcmap
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 May 2017 09:33:22 -0000

From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>

The build for xstdcmap was failing in do_configure due to the missing
xmu package. The libxmu inside the recipe should have been DEPENDS
and not RDEPENDS.

Since this is working, xstdcmap is unblacklist-ed from the build.

Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
index f92d883..99f7036 100644
--- a/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xstdcmap_1.0.3.bb
@@ -8,10 +8,9 @@ SECTION = "x11/app"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2b08d9e2e718ac83e6fe2b974d4b5fd8"
 
-RDEPENDS_${PN} = "libxmu"
+DEPENDS += "libxmu"
 BBCLASSEXTEND = "native"
 
 SRC_URI[md5sum] = "eb5473acaef15a5db9b50df29c6a7f90"
 SRC_URI[sha256sum] = "f648e2b0cf16aa29856de998e2c7204be39dc1f8daeda9464d32288e0b580fc1"
 
-PNBLACKLIST[xstdcmap] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130660/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.7.4


