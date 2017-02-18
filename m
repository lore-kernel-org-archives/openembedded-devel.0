Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 5876277333
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 02:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 7528B11A039
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:14 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id r+Zm5wGesbGc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:13 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id E1FED11A030
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1F481A064
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C5B8D1A063
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id BA341442
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1I2ACQt032050
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1I2ACHa032049
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2017 03:10:12 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2017 03:10:10 +0100
Message-Id: <20170218021012.31978-6-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20170218021012.31978-1-pkj@axis.com>
References: <20170218021012.31978-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH 6/8] lvm2: Add a PACKAGECONFIG for lvmetad
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
X-List-Received-Date: Sat, 18 Feb 2017 02:10:14 -0000

This allows the support for lvmetad to be disabled.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 2c0ad29..438ea7b 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -17,7 +17,7 @@ S = "${WORKDIR}/LVM2.${PV}"
 
 inherit autotools-brokensep pkgconfig systemd
 
-LVM2_PACKAGECONFIG = "dmeventd"
+LVM2_PACKAGECONFIG = "dmeventd lvmetad"
 LVM2_PACKAGECONFIG_append_class-target = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
     thin-provisioning-tools \
@@ -33,6 +33,7 @@ PACKAGECONFIG ??= "${LVM2_PACKAGECONFIG}"
 PACKAGECONFIG_append = " odirect"
 
 PACKAGECONFIG[dmeventd] = "--enable-dmeventd,--disable-dmeventd"
+PACKAGECONFIG[lvmetad] = "--enable-lvmetad,--disable-lvmetad"
 PACKAGECONFIG[odirect] = "--enable-o_direct,--disable-o_direct"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux"
@@ -46,7 +47,6 @@ EXTRA_OECONF = "--with-user= \
                 --enable-applib \
                 --enable-cmdlib \
                 --enable-pkgconfig \
-                --enable-lvmetad \
                 --with-usrlibdir=${libdir} \
                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
                 --disable-thin_check_needs_check \
@@ -75,7 +75,7 @@ do_install_append() {
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
-                         lvm2-lvmetad.socket lvm2-pvscan@.service \
+                         ${@bb.utils.contains('PACKAGECONFIG', 'lvmetad', 'lvm2-lvmetad.socket lvm2-pvscan@.service', '', d)} \
                          blk-availability.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-- 
2.9.0


