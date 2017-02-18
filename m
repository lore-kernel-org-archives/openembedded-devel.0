Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 82BF477341
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 02:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id BF9842E69F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:16 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id jhTIhS3ivESE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id C7E6D2E69D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4AA01A069
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8EEF1A063
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 9CFE9442
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1I2AC8o032042
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1I2ACTP032041
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2017 03:10:12 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2017 03:10:08 +0100
Message-Id: <20170218021012.31978-4-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20170218021012.31978-1-pkj@axis.com>
References: <20170218021012.31978-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH 4/8] lvm2: Add a PACKAGECONFIG for udev support
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
X-List-Received-Date: Sat, 18 Feb 2017 02:10:17 -0000

The added dependency on util-linux is necessary to avoid the following
QA warning which appears when the dependency on udev is removed:

  WARNING: lvm2-2.02.166-r0 do_package_qa: QA Issue: lvm2 rdepends on
  util-linux-libblkid, but it isn't a build dependency, missing
  util-linux in DEPENDS or PACKAGECONFIG? [build-deps]

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 7c4bbb9..5d228ea 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -1,10 +1,11 @@
 SECTION = "utils"
 DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
-DEPENDS_append_class-target = " udev"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
 
+DEPENDS += "util-linux"
+
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
@@ -20,6 +21,7 @@ LVM2_PACKAGECONFIG = ""
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
     thin-provisioning-tools \
+    udev \
 "
 
 PACKAGECONFIG ??= "${LVM2_PACKAGECONFIG}"
@@ -34,6 +36,7 @@ PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
 PACKAGECONFIG[thin-provisioning-tools] = "--with-thin=internal,--with-thin=none,,thin-provisioning-tools"
+PACKAGECONFIG[udev] = "--enable-udev_sync --enable-udev_rules --with-udev-prefix=,--disable-udev_sync --disable-udev_rules,udev"
 
 # Unset user/group to unbreak install.
 EXTRA_OECONF = "--with-user= \
@@ -51,17 +54,6 @@ EXTRA_OECONF = "--with-user= \
                 --with-thin-dump=${sbindir}/thin_dump \
                 --with-thin-repair=${sbindir}/thin_repair \
                 --with-thin-restore=${sbindir}/thin_restore \
-                ${EXTRA_OECONF_UDEV} \
-"
-
-EXTRA_OECONF_UDEV = " \
-                --disable-udev_sync \
-                --disable-udev_rules \
-"
-EXTRA_OECONF_UDEV_class-target = " \
-                --enable-udev_sync \
-                --enable-udev_rules \
-                --with-udev-prefix= \
 "
 
 CACHED_CONFIGUREVARS += "MODPROBE_CMD=${base_sbindir}/modprobe"
-- 
2.9.0


