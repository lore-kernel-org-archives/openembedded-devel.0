Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E5C9877333
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 02:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 236C111A030
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8PpHxTuQKUy3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:13 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 0427D11A036
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:13 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE22F1A069
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCE681A05B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id CFF7788F
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v1I2ACxt032058
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2017 03:10:12 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v1I2AC24032057
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Feb 2017 03:10:12 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Feb 2017 03:10:12 +0100
Message-Id: <20170218021012.31978-8-pkj@axis.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20170218021012.31978-1-pkj@axis.com>
References: <20170218021012.31978-1-pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [meta-oe][PATCH 8/8] lvm2: Move libdevmapper to a separate package
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
X-List-Received-Date: Sat, 18 Feb 2017 02:10:15 -0000

This allows, e.g., cryptsetup to use libdevmapper without having to
pull in all of lvm2.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 1462841..e0a126e 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -73,7 +73,7 @@ do_install_append() {
     fi
 }
 
-PACKAGE_BEFORE_PN = "${PN}-scripts"
+PACKAGE_BEFORE_PN = "${PN}-scripts libdevmapper libdevmapper-dev"
 
 SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'dmeventd', 'lvm2-monitor.service dm-event.socket dm-event.service', '', d)} \
@@ -90,8 +90,15 @@ FILES_${PN}-scripts = " \
     ${sbindir}/lvmconf \
     ${sbindir}/lvmdump \
 "
+FILES_libdevmapper = "${libdir}/libdevmapper.so.*"
+FILES_libdevmapper-dev = " \
+    ${libdir}/libdevmapper.so \
+    ${libdir}/pkgconfig/devmapper.pc \
+    ${includedir}/libdevmapper.h \
+"
 
 RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
+RDEPENDS_libdevmapper-dev = "libdevmapper (= ${EXTENDPKGV})"
 RRECOMMENDS_${PN} = "${PN}-scripts (= ${EXTENDPKGV})"
 
 CONFFILES_${PN} += "${sysconfdir}/lvm/lvm.conf"
-- 
2.9.0


