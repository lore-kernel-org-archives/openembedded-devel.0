Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1PsR1E-0000j0-0x
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Feb 2011 03:33:28 +0100
Received: from gandalf.denix.org ([unknown] [71.251.49.88])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LH3002FMLKVCB81@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	23 Feb 2011 19:31:49 -0600 (CST)
Received: from elrond.denix.org (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 11E7614AF6A; Wed,
	23 Feb 2011 20:31:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Feb 2011 20:31:41 -0500
Message-id: <1298511101-5170-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] busybox: fix udhcp check for NFS rootfs for new style /proc/mounts
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Feb 2011 02:33:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Newer kernels change the format of /proc/mounts slightly when rootfs is
mounted over NFS.

* Old style:
/dev/root / nfs <options> 0 0

* New style:
<server>:<mount> / nfs <options> 0 0

* The regexp in grep can be simplified and rolled into one, but may become
less strict...

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../busybox-1.13.2/udhcpc-new-nfsroot.patch        |   16 ++++++++++++++++
 .../busybox-1.18.3/udhcpc-new-nfsroot.patch        |   16 ++++++++++++++++
 recipes/busybox/busybox_1.13.2.bb                  |    2 +-
 recipes/busybox/busybox_1.18.3.bb                  |    2 +-
 recipes/busybox/busybox_1.1x.inc                   |    1 +
 5 files changed, 35 insertions(+), 2 deletions(-)
 create mode 100644 recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
 create mode 100644 recipes/busybox/busybox-1.18.3/udhcpc-new-nfsroot.patch

diff --git a/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch b/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
new file mode 100644
index 0000000..46aaab9
--- /dev/null
+++ b/recipes/busybox/busybox-1.13.2/udhcpc-new-nfsroot.patch
@@ -0,0 +1,16 @@
+diff -uNr busybox-1.13.2.orig/examples/udhcp/simple.script busybox-1.13.2/examples/udhcp/simple.script
+--- busybox-1.13.2.orig/examples/udhcp/simple.script	2011-02-23 00:30:32.000000000 -0500
++++ busybox-1.13.2/examples/udhcp/simple.script	2011-02-23 17:05:37.873381763 -0500
+@@ -10,7 +10,12 @@
+ 
+ # return 0 if root is mounted on a network filesystem
+ root_is_nfs() {
++	# old style mounts
+ 	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
++	if ! $? ; then
++		# new style mounts
++		grep -qe '^.*:.* / \(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
++	fi
+ }
+ 
+ case "$1" in
diff --git a/recipes/busybox/busybox-1.18.3/udhcpc-new-nfsroot.patch b/recipes/busybox/busybox-1.18.3/udhcpc-new-nfsroot.patch
new file mode 100644
index 0000000..46aaab9
--- /dev/null
+++ b/recipes/busybox/busybox-1.18.3/udhcpc-new-nfsroot.patch
@@ -0,0 +1,16 @@
+diff -uNr busybox-1.13.2.orig/examples/udhcp/simple.script busybox-1.13.2/examples/udhcp/simple.script
+--- busybox-1.13.2.orig/examples/udhcp/simple.script	2011-02-23 00:30:32.000000000 -0500
++++ busybox-1.13.2/examples/udhcp/simple.script	2011-02-23 17:05:37.873381763 -0500
+@@ -10,7 +10,12 @@
+ 
+ # return 0 if root is mounted on a network filesystem
+ root_is_nfs() {
++	# old style mounts
+ 	grep -qe '^/dev/root.*\(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
++	if ! $? ; then
++		# new style mounts
++		grep -qe '^.*:.* / \(nfs\|smbfs\|ncp\|coda\) .*' /proc/mounts
++	fi
+ }
+ 
+ case "$1" in
diff --git a/recipes/busybox/busybox_1.13.2.bb b/recipes/busybox/busybox_1.13.2.bb
index ef20c62..fca3e93 100644
--- a/recipes/busybox/busybox_1.13.2.bb
+++ b/recipes/busybox/busybox_1.13.2.bb
@@ -1,5 +1,5 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 SRC_URI += "\
   file://busybox-1.13.2-awk.patch \
diff --git a/recipes/busybox/busybox_1.18.3.bb b/recipes/busybox/busybox_1.18.3.bb
index 633b70b..f85de86 100644
--- a/recipes/busybox/busybox_1.18.3.bb
+++ b/recipes/busybox/busybox_1.18.3.bb
@@ -1,5 +1,5 @@
 require busybox_1.1x.inc
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRC_URI += " \
 	http://busybox.net/downloads/fixes-1.18.3/busybox-1.18.3-buildsys.patch;name=patch01 \
diff --git a/recipes/busybox/busybox_1.1x.inc b/recipes/busybox/busybox_1.1x.inc
index 7623944..aefa57f 100644
--- a/recipes/busybox/busybox_1.1x.inc
+++ b/recipes/busybox/busybox_1.1x.inc
@@ -5,6 +5,7 @@ SRC_URI = "\
   file://fdisk_nios2.patch \
   file://udhcpscript.patch \
   file://udhcpc-fix-nfsroot.patch \
+  file://udhcpc-new-nfsroot.patch \
   file://B921600.patch \
   file://get_header_tar.patch \
   file://busybox-appletlib-dependency.patch \
-- 
1.7.0.4



