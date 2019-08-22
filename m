Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 849BF7F260
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 09:48:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x7M9mWsM024619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2019 02:48:32 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 22 Aug 2019 02:48:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 22 Aug 2019 17:48:30 +0800
Message-ID: <1566467310-28839-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH meta-oe] lvm2: fix circular dependencies while systemd enable cryptsetup
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
X-List-Received-Date: Thu, 22 Aug 2019 09:48:32 -0000
Content-Type: text/plain

While systemd enable cryptsetup (PACKAGECONFIG_append_pn-systemd = ' cryptsetup'),
there is a circular dependencies:
systemd -> systemd -> cryptsetup -> libdevmapper -> udev (PREFERRED_PROVIDER_udev = systemd)

The libdevmapper was used to break circular dependencies,
it does not require udev, refer commit [698d512 lvm2: Add a
PACKAGECONFIG for udev support] to move udev related from
lvm2.inc to lvm2.bb

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc        | 4 +---
 meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb | 6 ++++++
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index ca409a6..f358663 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -5,7 +5,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
 
-DEPENDS += "util-linux libaio"
+DEPENDS += "libaio"
 
 SRC_URI = "https://sourceware.org/pub/lvm2/LVM2.${PV}.tgz \
            file://lvm.conf \
@@ -27,7 +27,6 @@ LVM2_PACKAGECONFIG = "dmeventd"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux', d)} \
     ${@incompatible_license_contains('GPLv3', '', 'thin-provisioning-tools', d)} \
-    udev \
 "
 
 # odirect is always enabled because there currently is a bug in
@@ -41,7 +40,6 @@ PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
-PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev"
 
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
index 4ae0a62..9922ef7 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
@@ -40,6 +40,12 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 
 EXTRA_OECONF_append_class-nativesdk = " --with-confdir=${sysconfdir}"
 
+DEPENDS += "util-linux"
+LVM2_PACKAGECONFIG_append_class-target = " \
+    udev \
+"
+PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udevdir=${nonarch_base_libdir}/udev/rules.d,--disable-udev_sync --disable-udev_rules,udev"
+
 FILES_${PN} += "${libdir}/device-mapper/*.so"
 FILES_${PN}-scripts = " \
     ${sbindir}/blkdeactivate \
-- 
2.7.4


