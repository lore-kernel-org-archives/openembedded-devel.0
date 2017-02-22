Return-Path: <amarnath.valluri@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id ECE1F70031
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:31:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 22 Feb 2017 06:31:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51294802"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:31:18 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 16:29:56 +0200
Message-Id: <1487773796-11450-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486559259-22981-1-git-send-email-amarnath.valluri@intel.com>
References: <1486559259-22981-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH v2] lvm2: Replace 'lib' with ${nonarch_base_libdir} for placing udev rules.
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
X-List-Received-Date: Wed, 22 Feb 2017 14:31:19 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index e0a126e..2bb0134 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -38,7 +38,7 @@ PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
-PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udev-prefix=,--disable-udev_sync --disable-udev_rules,udev"
+PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev"
 
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
@@ -83,7 +83,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
+FILES_${PN} += "${libdir}/device-mapper/*.so ${nonarch_base_libdir}/udev"
 FILES_${PN}-scripts = " \
     ${sbindir}/blkdeactivate \
     ${sbindir}/fsadm \
-- 
2.7.4


