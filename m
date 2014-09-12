Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by mail.openembedded.org (Postfix) with ESMTP id 5BBFF65E2B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Sep 2014 17:55:26 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBS00G06V3PUP00@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	12 Sep 2014 12:55:12 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B34D92001F; Fri,
	12 Sep 2014 13:55:00 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Sep 2014 13:55:00 -0400
Message-id: <1410544500-20781-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] ltp-ddt: keep do_make_scripts as separate task to lock correctly
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Sep 2014 17:55:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb
index d0b84ad..db62ac6 100644
--- a/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb
+++ b/meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.5.bb
@@ -13,7 +13,7 @@ inherit autotools-brokensep module-base kernel-module-split
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "088356602220dd8b48aeb138d4976c05c0879574"
+SRCREV = "903f70a11eb77cbad62d7ecbe7dcbaf61be8ff99"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH} \
@@ -67,10 +67,6 @@ do_configure() {
 
 kmoddir = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/ddt"
 
-do_compile_prepend () {
-    do_make_scripts
-}
-
 do_compile_append () {
     oe_runmake modules
 }
@@ -83,3 +79,8 @@ do_install() {
     rm -rf ${D}${LTPROOT}/share/
     mv ${D}${LTPROOT}/testcases/bin/ddt/*.ko ${D}${kmoddir}
 }
+
+# do_make_scripts should be a separate task for the lock to work
+addtask make_scripts before do_compile
+do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
+do_make_scripts[deptask] = "do_populate_sysroot"
-- 
2.0.4


