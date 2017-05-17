Return-Path: <stanley.cheong.kwan.phoong@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 730D371A8C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 May 2017 03:08:06 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 17 May 2017 20:08:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,356,1491289200"; d="scan'208";a="103291121"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by fmsmga005.fm.intel.com with ESMTP; 17 May 2017 20:08:07 -0700
From: Phoong Stanley Cheong Kwan <stanley.cheong.kwan.phoong@intel.com>
To: OpenEmbedded Devel Mailing List <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 May 2017 12:57:11 -0700
Message-Id: <1495051031-10963-1-git-send-email-stanley.cheong.kwan.phoong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] [PATCH] libsexy: Added glib-2.0-native dependency and removed PNBLACKLIST
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
X-List-Received-Date: Thu, 18 May 2017 03:08:06 -0000

From: "Stanley Cheong Kwan, Phoong" <stanley.cheong.kwan.phoong@intel.com>

Found out that libsexy is missing the dependency for glib-2.0-native.

Added glib-2.0-native into DEPENDS and unblacklist libsexy by
removing PNBLACKLIST.

Signed-off-by: Stanley Cheong Kwan, Phoong <stanley.cheong.kwan.phoong@intel.com>
---
 meta-oe/recipes-graphics/libsexy/libsexy.inc       | 2 +-
 meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/libsexy/libsexy.inc b/meta-oe/recipes-graphics/libsexy/libsexy.inc
index 5a11ca0..d8c41d7 100644
--- a/meta-oe/recipes-graphics/libsexy/libsexy.inc
+++ b/meta-oe/recipes-graphics/libsexy/libsexy.inc
@@ -6,7 +6,7 @@ SECTION = "x11/libs"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-DEPENDS = "gtk+ enchant libxml2"
+DEPENDS = "gtk+ enchant libxml2 glib-2.0-native"
 
 SRC_URI = "http://releases.chipx86.com/libsexy/${BPN}/${BP}.tar.gz \
            file://libsexy-pkgconfig-fixes.patch"
diff --git a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
index 2ba1ebb..86b4958 100644
--- a/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
+++ b/meta-oe/recipes-graphics/libsexy/libsexy_0.1.11.bb
@@ -4,5 +4,3 @@ PR = "r2"
 
 SRC_URI[md5sum] = "33c079a253270ec8bfb9508e4bb30754"
 SRC_URI[sha256sum] = "8c4101a8cda5fccbba85ba1a15f46f2cf75deaa8b3c525ce5b135b9e1a8fe49e"
-
-PNBLACKLIST[libsexy] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130607/ - the recipe will be removed on 2017-09-01 unless the issue is fixed"
-- 
2.7.4


