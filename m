Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 713F977338
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 02:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B30FC2E698
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 7O634lLhwy-M
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id D45C52E69F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C23A21A05B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B61141A075
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A8479770
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1I2AC8B032046
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1I2AC60032045
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2017 03:10:12 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2017 03:10:09 +0100
Message-Id: <20170218021012.31978-5-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20170218021012.31978-1-pkj@axis.com>
References: <20170218021012.31978-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH 5/8] lvm2: Add a PACKAGECONFIG for dmeventd
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
X-List-Received-Date: Sat, 18 Feb 2017 02:10:16 -0000

This allows the support for dmeventd to be disabled.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 5d228ea..2c0ad29 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -17,7 +17,7 @@ S = "${WORKDIR}/LVM2.${PV}"
 
 inherit autotools-brokensep pkgconfig systemd
 
-LVM2_PACKAGECONFIG = ""
+LVM2_PACKAGECONFIG = "dmeventd"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
     thin-provisioning-tools \
@@ -32,6 +32,7 @@ PACKAGECONFIG ??= "${LVM2_PACKAGECONFIG}"
 # upstream...
 PACKAGECONFIG_append = " odirect"
 
+PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
 PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
@@ -45,7 +46,6 @@ EXTRA_OECONF = "--with-user= \
                 --enable-applib \
                 --enable-cmdlib \
                 --enable-pkgconfig \
-                --enable-dmeventd \
                 --enable-lvmetad \
                 --with-usrlibdir=${libdir} \
                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
@@ -74,8 +74,9 @@ do_install_append() {
 }
 
 SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "lvm2-monitor.service dm-event.socket dm-event.service lvm2-lvmetad.socket \
-                         lvm2-pvscan@.service blk-availability.service"
+SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
+                         lvm2-lvmetad.socket lvm2-pvscan@.service \
+                         blk-availability.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
-- 
2.9.0


