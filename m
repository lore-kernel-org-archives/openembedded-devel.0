Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C0E71783EB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Jul 2017 15:19:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v6UFJO5O022681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 30 Jul 2017 16:19:25 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dbq04-0001b5-LQ; Sun, 30 Jul 2017 16:19:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Jul 2017 16:19:19 +0100
Message-Id: <1501427963-6097-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Sun, 30 Jul 2017 16:19:25 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 1/5] rm_work: Improve handling for addto_recipe_sysroot
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
X-List-Received-Date: Sun, 30 Jul 2017 15:19:27 -0000

Rather than requiring each user to handle this individually, handle
addto_recipe_sysroot in the core class. As well as preserving the
sysroot directory, this also ensures the stamp is preserved rather
than rerunning the task every time as currently happens.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/rm_work.bbclass                       | 32 ++++++++++++++--------
 .../qemu/qemu-helper-native_1.0.bb                 |  1 -
 .../systemtap/systemtap-native_git.bb              |  1 -
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index badeaeb..2a4e808 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -35,22 +35,12 @@ do_rm_work () {
         fi
     done
 
-    cd ${WORKDIR}
-    for dir in *
-    do
-        # Retain only logs and other files in temp, safely ignore
-        # failures of removing pseudo folers on NFS2/3 server.
-        if [ $dir = 'pseudo' ]; then
-            rm -rf $dir 2> /dev/null || true
-        elif ! echo '${RM_WORK_EXCLUDE_ITEMS}' | grep -q -w "$dir"; then
-            rm -rf $dir
-        fi
-    done
-
     # Need to add pseudo back or subsqeuent work in this workdir
     # might fail since setscene may not rerun to recreate it
     mkdir -p ${WORKDIR}/pseudo/
 
+    excludes='${RM_WORK_EXCLUDE_ITEMS}'
+
     # Change normal stamps into setscene stamps as they better reflect the
     # fact WORKDIR is now empty
     # Also leave noexec stamps since setscene stamps don't cover them
@@ -79,6 +69,12 @@ do_rm_work () {
                 i=dummy
                 break
                 ;;
+            *do_addto_recipe_sysroot*)
+                # Preserve recipe-sysroot-native if do_addto_recipe_sysroot has been used
+                excludes="$excludes recipe-sysroot-native"
+                i=dummy
+                break
+                ;;
             # We remove do_package entirely, including any
             # sstate version since otherwise we'd need to leave 'plaindirs' around
             # such as 'packages' and 'packages-split' and these can be large. No end
@@ -101,6 +97,18 @@ do_rm_work () {
         done
         rm -f $i
     done
+
+    cd ${WORKDIR}
+    for dir in *
+    do
+        # Retain only logs and other files in temp, safely ignore
+        # failures of removing pseudo folers on NFS2/3 server.
+        if [ $dir = 'pseudo' ]; then
+            rm -rf $dir 2> /dev/null || true
+        elif ! echo "$excludes" | grep -q -w "$dir"; then
+            rm -rf $dir
+        fi
+    done
 }
 do_rm_work_all () {
     :
diff --git a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
index 27d5315..d86b155 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-native_1.0.bb
@@ -20,6 +20,5 @@ do_install() {
 	install tunctl ${D}${bindir}/
 }
 
-RM_WORK_EXCLUDE_ITEMS += "recipe-sysroot-native"
 DEPENDS += "qemu-native"
 addtask addto_recipe_sysroot after do_populate_sysroot before do_build
diff --git a/meta/recipes-kernel/systemtap/systemtap-native_git.bb b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
index c3da77c..19cc1cf 100644
--- a/meta/recipes-kernel/systemtap/systemtap-native_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
@@ -3,5 +3,4 @@ require systemtap_git.bb
 
 inherit native
 
-RM_WORK_EXCLUDE_ITEMS += "recipe-sysroot-native"
 addtask addto_recipe_sysroot after do_populate_sysroot before do_build
-- 
2.7.4


