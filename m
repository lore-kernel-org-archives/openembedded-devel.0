Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D7E671C87
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:07:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2017 05:07:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="931503275"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 08 Feb 2017 05:07:26 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:08:04 +0200
Message-Id: <1486559284-23081-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] libgphoto: Replace 'lib' with ${nonarch_base_libdir}
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
X-List-Received-Date: Wed, 08 Feb 2017 13:07:27 -0000

Make use of bitbake variable for udev ruls folder. This change makes the recipe
more portable.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
index 098da79..fa07cd3 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
@@ -23,7 +23,7 @@ SRC_URI[libgphoto2.sha256sum] = "031a262e342fae43f724afe66787947ce1fb483277dfe5a
 
 inherit autotools pkgconfig gettext lib_package
 
-EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
+EXTRA_OECONF = " --with-drivers=all udevscriptdir=${nonarch_base_libdir}/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[gd] = ",--without-gdlib,gd"
-- 
2.7.4


