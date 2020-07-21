Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.6335.1595368900840122869
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Jul 2020 15:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: joe.slater@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 06LM1JlH027185
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2020 15:01:29 -0700
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Tue, 21 Jul 2020
 15:01:08 -0700
From: "Joe Slater" <joe.slater@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [meta-oe][PATCH 1/1][v2] toybox-inittab: unpack to S
Date: Tue, 21 Jul 2020 15:00:55 -0700
Message-ID: <20200721220055.37211-2-joe.slater@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721220055.37211-1-joe.slater@windriver.com>
References: <20200721220055.37211-1-joe.slater@windriver.com>
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
index 9af1e3f14..f82f8e9ce 100644
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
-	for f in inittab rcK rcS; do
-		cp ${WORKDIR}/$f ${S}
-	done
+	cp orig/* .
 
 	for config in ${PACKAGECONFIG_CONFARGS}; do
 		if [[ ${config} == "enable_getty" ]]; then
-- 
2.17.1

