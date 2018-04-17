Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 183EC6059F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Apr 2018 03:08:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3H38Zqm028020
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Apr 2018 20:08:36 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 16 Apr 2018 20:08:35 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 16 Apr 2018 23:08:16 -0400
Message-ID: <1523934496-207336-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libteam: add ptest
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
X-List-Received-Date: Tue, 17 Apr 2018 03:08:35 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The scripts/team_basic_test.py will be called as testcase.

RedHat specific tests have been disabled since they are incampatible
with OE.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 ...asic_test.py-disable-RedHat-specific-test.patch | 32 ++++++++++++++++++++++
 meta-oe/recipes-support/libteam/libteam/run-ptest  |  3 ++
 meta-oe/recipes-support/libteam/libteam_1.27.bb    |  8 +++++-
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-disable-RedHat-specific-test.patch
 create mode 100644 meta-oe/recipes-support/libteam/libteam/run-ptest

diff --git a/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-disable-RedHat-specific-test.patch b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-disable-RedHat-specific-test.patch
new file mode 100644
index 0000000..468a55f
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam/0001-team_basic_test.py-disable-RedHat-specific-test.patch
@@ -0,0 +1,32 @@
+From 00debe6bd4cf5a3133a8fbaab75f7447a39fa655 Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Thu, 12 Apr 2018 01:54:15 +0000
+Subject: [PATCH] team_basic_test.py: disable RedHat specific test
+
+The test _run_teamd_initscripts() is for RedHat ifcfg scripts which are
+incompatible with OE:
+  /etc/sysconfig/network-scripts/ifcfg-*
+
+Upstream-Status: Inappropriate [OE Specific]
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ scripts/team_basic_test.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/team_basic_test.py b/scripts/team_basic_test.py
+index b05be9e..faabd18 100755
+--- a/scripts/team_basic_test.py
++++ b/scripts/team_basic_test.py
+@@ -171,7 +171,7 @@ TEAM_PORT_CONFIG='{"prio": 10}'
+         try:
+             for mode_name in self._team_modes:
+                 self._run_one_mode(mode_name)
+-            self._run_teamd_initscripts()
++            #self._run_teamd_initscripts()
+         finally:
+             cmd_exec("modprobe -r team_mode_loadbalance team_mode_roundrobin team_mode_activebackup team_mode_broadcast team");
+ 
+-- 
+2.13.3
+
diff --git a/meta-oe/recipes-support/libteam/libteam/run-ptest b/meta-oe/recipes-support/libteam/libteam/run-ptest
new file mode 100644
index 0000000..4ba5acf
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+python $(dirname $0)/team_basic_test.py
diff --git a/meta-oe/recipes-support/libteam/libteam_1.27.bb b/meta-oe/recipes-support/libteam/libteam_1.27.bb
index 3222700..442592d 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.27.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.27.bb
@@ -10,6 +10,8 @@ DEPENDS = "libnl libdaemon jansson"
 SRC_URI = "git://github.com/jpirko/libteam \
            file://0001-include-sys-select.h-for-fd_set-definition.patch \
            file://0002-teamd-Re-adjust-include-header-order.patch \
+           file://0001-team_basic_test.py-disable-RedHat-specific-test.patch \
+           file://run-ptest \
            "
 SRCREV = "91a928a56a501daac5ce8b3c16bd9943661f1d16"
 
@@ -18,7 +20,7 @@ SRC_URI[sha256sum] = "d65286379141db141bea33424ec0507bb0f827a0bf03d9c65004bb593e
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig ptest
 
 FILES_${PN} = "${libdir}/libteam${SOLIBS} \
 "
@@ -33,4 +35,8 @@ FILES_${PN}-utils = "${bindir}/bond2team \
 "
 
 RDEPENDS_${PN}-utils = "bash"
+RDEPENDS_${PN}-ptest = "python"
 
+do_install_ptest() {
+	install ${S}/scripts/team_basic_test.py ${D}${PTEST_PATH}/
+}
-- 
2.8.1


