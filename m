Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46F6C7210A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 02:59:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4Q2xYlq023224
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 19:59:34 -0700 (PDT)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 25 May 2015 19:59:33 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 May 2015 10:59:23 +0800
Message-ID: <1432609164-10740-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [meta-oe][PATCH] lvm2: fix segfault for snapshot
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
X-List-Received-Date: Tue, 26 May 2015 02:59:39 -0000
Content-Type: text/plain

Backport <commit c46d4a745dc8c5cb4cfc0c94863e555387e9af75> from lvm2
upstream <https://git.fedorahosted.org/git/lvm2.git> to solve issue:
vgchange segfault in lv_is_merging_cow function.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc              |    3 +-
 .../lvm2/0001-snapshot-check-snapshot-exists.patch |   29 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 42f6e3a..e116629 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -11,7 +11,8 @@ S = "${WORKDIR}/LVM2.${PV}"
 SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
            file://0001-Replace-CPPFunction-with-rl_completion_func_t.patch \
            file://mlock-ignore-vectors-gate_vma.patch \
-           file://lvm.conf"
+           file://lvm.conf \
+           file://0001-snapshot-check-snapshot-exists.patch"
 
 PACKAGECONFIG ??= "readline"
 PACKAGECONFIG[readline] = "--enable-readline,--disable-readline,readline"
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch
new file mode 100644
index 0000000..8f0da79
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-snapshot-check-snapshot-exists.patch
@@ -0,0 +1,29 @@
+From c46d4a745dc8c5cb4cfc0c94863e555387e9af75 Mon Sep 17 00:00:00 2001
+From: Zdenek Kabelac <zkabelac@redhat.com>
+Date: Mon, 16 Jun 2014 12:41:30 +0200
+Subject: [PATCH] snapshot: check snapshot exists
+
+Return 0 if the LV is not even snapshot.
+
+Upstream-Status: backport
+Adapt the patch for backporting to an older version.
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ lib/metadata/snapshot_manip.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+Index: LVM2.2.02.97/lib/metadata/snapshot_manip.c
+===================================================================
+--- LVM2.2.02.97.orig/lib/metadata/snapshot_manip.c
++++ LVM2.2.02.97/lib/metadata/snapshot_manip.c
+@@ -68,8 +68,9 @@ struct lv_segment *find_merging_cow(cons
+
+ int lv_is_merging_cow(const struct logical_volume *snapshot)
+ {
++	struct lv_segment *snap_seg = find_cow(snapshot);
+	/* checks lv_segment's status to see if cow is merging */
+-	return (find_cow(snapshot)->status & MERGING) ? 1 : 0;
++	return (snap_seg && (snap_seg->status & MERGING)) ? 1 : 0;
+ }
+
+ /* Given a cow LV, return the snapshot lv_segment that uses it */
-- 
1.7.9.5


