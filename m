Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E383775FB5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jul 2015 03:11:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6H3BhuX020248
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jul 2015 20:11:43 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 16 Jul 2015 20:11:42 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 17 Jul 2015 11:10:02 +0800
Message-ID: <1437102603-25983-4-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
References: <1437102603-25983-1-git-send-email-kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 3/4] lvm2: upgrade from 2.02.97 to 2.02.125
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
X-List-Received-Date: Fri, 17 Jul 2015 03:11:43 -0000
Content-Type: text/plain

Upgrade lvm2 to 2.02.125:

* drop 3 backported patches
* remove PR and INC_PR

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |  6 +---
 ...ace-CPPFunction-with-rl_completion_func_t.patch | 33 ----------------------
 .../lvm2/0001-snapshot-check-snapshot-exists.patch | 29 -------------------
 .../lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch  | 31 --------------------
 meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb      |  4 +++
 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb       |  6 ----
 6 files changed, 5 insertions(+), 104 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 34fec99..f518884 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -4,15 +4,11 @@ DEPENDS = "udev"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r4"
-
 
 S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
-           file://0001-Replace-CPPFunction-with-rl_completion_func_t.patch \
-           file://mlock-ignore-vectors-gate_vma.patch \
            file://lvm.conf \
-           file://0001-snapshot-check-snapshot-exists.patch"
+          "
 
 PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
deleted file mode 100644
index 98c21fd..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-Replace-CPPFunction-with-rl_completion_func_t.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From e2484e179c389b98366c8b66b451d9d2ba8f35e8 Mon Sep 17 00:00:00 2001
-From: Zhenhua Luo <zhenhua.luo@freescale.com>
-Date: Tue, 25 Mar 2014 17:39:43 +0800
-Subject: [PATCH] Replace CPPFunction with rl_completion_func_t
-
-lvm2 depends on readline, CPPFunction has been replaced by rl_completion_func_t
-in recent readline,
-
-Upstream-Status: Inappropriate [configuration]
-The change depends on the build environment, it is required by OpenEmbedded env 
-due to readline upgrade. 
-
-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
----
- tools/lvm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/lvm.c b/tools/lvm.c
-index e002a76..5fa35d2 100644
---- a/tools/lvm.c
-+++ b/tools/lvm.c
-@@ -186,7 +186,7 @@ int lvm_shell(struct cmd_context *cmd, struct cmdline_context *cmdline)
- 	char *input = NULL, *args[MAX_ARGS], **argv;
- 
- 	rl_readline_name = "lvm";
--	rl_attempted_completion_function = (CPPFunction *) _completion;
-+	rl_attempted_completion_function = (rl_completion_func_t *) _completion;
- 
- 	_read_history(cmd);
- 
--- 
-1.9.1
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch
deleted file mode 100644
index 8f0da79..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c46d4a745dc8c5cb4cfc0c94863e555387e9af75 Mon Sep 17 00:00:00 2001
-From: Zdenek Kabelac <zkabelac@redhat.com>
-Date: Mon, 16 Jun 2014 12:41:30 +0200
-Subject: [PATCH] snapshot: check snapshot exists
-
-Return 0 if the LV is not even snapshot.
-
-Upstream-Status: backport
-Adapt the patch for backporting to an older version.
-Signed-off-by: Li Zhou <li.zhou@windriver.com>
----
- lib/metadata/snapshot_manip.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-Index: LVM2.2.02.97/lib/metadata/snapshot_manip.c
-===================================================================
---- LVM2.2.02.97.orig/lib/metadata/snapshot_manip.c
-+++ LVM2.2.02.97/lib/metadata/snapshot_manip.c
-@@ -68,8 +68,9 @@ struct lv_segment *find_merging_cow(cons
-
- int lv_is_merging_cow(const struct logical_volume *snapshot)
- {
-+	struct lv_segment *snap_seg = find_cow(snapshot);
-	/* checks lv_segment's status to see if cow is merging */
--	return (find_cow(snapshot)->status & MERGING) ? 1 : 0;
-+	return (snap_seg && (snap_seg->status & MERGING)) ? 1 : 0;
- }
-
- /* Given a cow LV, return the snapshot lv_segment that uses it */
diff --git a/meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch b/meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch
deleted file mode 100644
index 3105136..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/mlock-ignore-vectors-gate_vma.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Subject: [PATCH] fix: mlock ignore [vectors] gate_vma
-
-Upstream-Status: Pending
-
-linux kernel has a new commit f9d4861f for [vectors] vma on ARM
-"ARM: 7294/1: vectors: use gate_vma for vectors user mapping".
-
-mlock()/munlock() on a gate_vma would cause NOMEM error, so add
-[vectors] to _ignore_maps[], as other gate_vmas [vdso]/[vsyscall]
-did.
-
-Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
----
- lib/mm/memlock.c |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/mm/memlock.c b/lib/mm/memlock.c
-index 8c631bf..a6b1955 100644
---- a/lib/mm/memlock.c
-+++ b/lib/mm/memlock.c
-@@ -84,6 +84,7 @@ static int _default_priority;
- static const char * const _ignore_maps[] = {
-     "[vdso]",
-     "[vsyscall]",
-+    "[vectors]",
- };
- 
- /* default blacklist for maps */
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb
new file mode 100644
index 0000000..8e464d2
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.125.bb
@@ -0,0 +1,4 @@
+require lvm2.inc
+
+SRC_URI[md5sum] = "2d24ba982c8a85e8c837210f087a6a51"
+SRC_URI[sha256sum] = "0e6da28465752cc2db7e7e6fc7b012a0146a98d717ac5dea1c900d4bc32bedb1"
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb
deleted file mode 100644
index 2de17cf..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2_2.02.97.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require lvm2.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "d18bd01334309db1c422b9bf6b181057"
-SRC_URI[sha256sum] = "edda82012e8a9e1f0b00ba5a331468d3e0201992be14c0dbea71bf564a51fc2b"
-- 
1.9.1


