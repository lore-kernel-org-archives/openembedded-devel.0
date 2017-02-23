Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D32F972FE5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:09:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 01:09:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="937176380"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2017 01:09:34 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 11:05:40 +0200
Message-Id: <1487840743-23198-7-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
References: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 6/9] xf86-input-tslib: Replace 'lib' with ${nonarch_base_libdir} for placing udev rules.
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
X-List-Received-Date: Thu, 23 Feb 2017 09:09:34 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
index 082c771..6a3689a 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
+++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
@@ -28,8 +28,8 @@ do_configure_prepend() {
 do_install_append() {
     install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
     install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
-    install -d ${D}/lib/udev/rules.d
-    install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}/lib/udev/rules.d/
+    install -d ${D}${nonarch_base_libdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}${nonarch_base_libdir}/udev/rules.d/
 }
 
-FILES_${PN} += "${datadir}/hal /lib/udev"
+FILES_${PN} += "${datadir}/hal ${nonarch_base_libdir}/udev"
-- 
2.7.4


