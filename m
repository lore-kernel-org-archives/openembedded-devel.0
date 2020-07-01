Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.132.1593638995946797331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2020 14:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 061LTshW028633
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Jul 2020 14:29:54 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 1 Jul 2020
 14:29:35 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1] toybox-inittab: unpack to S
Date: Wed, 1 Jul 2020 14:29:35 -0700
Message-ID: <20200701212935.111528-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

toybox-inittab does not unpack source files into S, so
the archiver cannot see them.  We copy them to a sub-directory
in order to keep the originals available if running do_configure()
(again) without first running do_unpack().

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../recipes-core/toybox/toybox-inittab_0.8.2.bb   | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
index 8d7ff61e8..f82f8e9ce 100644
--- a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
+++ b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
@@ -2,10 +2,12 @@ SUMMARY = "Toybox Inittab Configuration"
 LICENSE = "BSD-0-Clause"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-0-Clause;md5=81eeb0083e31f11ab1e33ded846d521c"
 
+# Unpack to ${S}/orig
+#
 SRC_URI = "\
-    file://inittab \
-    file://rcK \
-    file://rcS \
+    file://inittab;subdir=${BP}/orig \
+    file://rcK;subdir=${BP}/orig \
+    file://rcS;subdir=${BP}/orig \
 "
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -15,6 +17,9 @@ RCONFLICTS_${PN} = "\
     sysvinit-inittab \
 "
 
+# Just being sure.
+B = "${S}"
+
 # most users may want to have getty enabled by default
 PACKAGECONFIG ??= "getty"
 
@@ -26,9 +31,7 @@ do_patch[noexec] = "1"
 
 do_configure() {
 	# copy over files now to have a fresh start on each config
-	for file in ${SRC_URI}; do
-		cp ${WORKDIR}/${file/file:\/\//} ${S}
-	done
+	cp orig/* .
 
 	for config in ${PACKAGECONFIG_CONFARGS}; do
 		if [[ ${config} == "enable_getty" ]]; then
-- 
2.17.1

