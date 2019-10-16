Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4F6E67F3D5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:42:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x9G9gHTX025582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Oct 2019 02:42:18 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Wed, 16 Oct 2019 02:42:17 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Wed, 16 Oct 2019 17:42:15 +0800
Message-ID: <1571218935-22690-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [master/zeus][meta-oe][PATCH] lvm2/libdevmapper: 2.03.02 -> 2.03.05
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
X-List-Received-Date: Wed, 16 Oct 2019 09:42:19 -0000
Content-Type: text/plain

1. Change to git repo

2. Backport three patches to fix the following issue:
While commit [cd735ab1df systemd: upgrade to 243] applied in oe-core,
lvmremove hung as following steps:
...
dd if=/dev/zero of=./p0 bs=1M count=100
dd if=/dev/zero of=./p1 bs=1M count=100
losetup /dev/loop20  ./p0
losetup /dev/loop21  ./p1
pvcreate -y /dev/loop20 -ff
pvcreate -y /dev/loop21 -ff
vgcreate rootvg /dev/loop20 /dev/loop21
lvcreate -v -y -L 50 -n rootlv rootvg
mkfs -t ext4 /dev/rootvg/rootlv
mkdir -p ./lv
mount /dev/rootvg/rootlv ./lv
lvcreate -v -L 50 -s -n backup /dev/rootvg/rootlv
lvconvert -v --merge -i 1 /dev/rootvg/backup
umount  ./lv
vgchange -v -an
vgchange -v -ay

lvremove -f /dev/rootvg/rootlv
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...tart-lvm2-monitor.service-after-tmp.mount.patch |  16 +--
 ...evmapper_2.03.02.bb => libdevmapper_2.03.05.bb} |   2 -
 meta-oe/recipes-support/lvm2/lvm2.inc              |   8 +-
 ...0001-activation-add-synchronization-point.patch |  82 ++++++++++++++
 ...ivation-extend-handling-of-pending_delete.patch | 124 +++++++++++++++++++++
 .../lvm2/lvm2/0003-snapshot-always-activate.patch  |  40 +++++++
 .../lvm2/{lvm2_2.03.02.bb => lvm2_2.03.05.bb}      |   5 +-
 7 files changed, 258 insertions(+), 19 deletions(-)
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.02.bb => libdevmapper_2.03.05.bb} (88%)
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-activation-add-synchronization-point.patch
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0002-activation-extend-handling-of-pending_delete.patch
 create mode 100644 meta-oe/recipes-support/lvm2/lvm2/0003-snapshot-always-activate.patch
 rename meta-oe/recipes-support/lvm2/{lvm2_2.03.02.bb => lvm2_2.03.05.bb} (94%)

diff --git a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
index e5ad4ea..9f9383e 100644
--- a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
+++ b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
@@ -1,6 +1,6 @@
-From 24a2c47fd01dde1710f1fa66f5c30ce7010c5956 Mon Sep 17 00:00:00 2001
+From e213ed33a28704f6f538df41a91b7ce95594a4f8 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 21 Sep 2017 15:28:10 +0800
+Date: Tue, 15 Oct 2019 18:12:54 +0800
 Subject: [PATCH] start lvm2-monitor.service after tmp.mount
 
 The lvm2-monitor.service reqires the existence of locking_dir
@@ -9,18 +9,14 @@ So start lvm2-monitor.service after tmp.mount
 
 Upstream-Status: Inappropriate [oe specific]
 
+Rebase to v2_03_05
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-
-Update context for lvm2 2.03.02.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
  scripts/lvm2_monitoring_systemd_red_hat.service.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in b/scripts/lvm2_monitoring_systemd_red_hat.service.in
-index 7ec4e4e..3282a95 100644
+index 4bf744a..46766cb 100644
 --- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
 +++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
 @@ -2,7 +2,7 @@
@@ -29,9 +25,9 @@ index 7ec4e4e..3282a95 100644
  Requires=dm-event.socket
 -After=dm-event.socket dm-event.service lvm2-activation.service
 +After=dm-event.socket dm-event.service lvm2-activation.service tmp.mount
- Before=local-fs-pre.target
+ Before=local-fs-pre.target shutdown.target
  DefaultDependencies=no
  Conflicts=shutdown.target
 -- 
-1.8.3.1
+2.7.4
 
diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.05.bb
similarity index 88%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.05.bb
index 32bc13d..be558ce 100644
--- a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.05.bb
@@ -3,8 +3,6 @@
 # generates package libdevmapper
 require lvm2.inc
 
-SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
-
 DEPENDS += "autoconf-archive-native"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 6c95bfd..41bf78a 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12713b4d9386533feeb07d6e4831765a \
 
 DEPENDS += "libaio"
 
-SRC_URI = "https://sourceware.org/pub/lvm2/LVM2.${PV}.tgz \
+SRC_URI = "git://sourceware.org/git/lvm2.git \
            file://lvm.conf \
            file://0001-implement-libc-specific-reopen_stream.patch \
            file://0002-Guard-use-of-mallinfo-with-__GLIBC__.patch \
@@ -17,10 +17,8 @@ SRC_URI = "https://sourceware.org/pub/lvm2/LVM2.${PV}.tgz \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
            file://0001-configure-Fix-setting-of-CLDFLAGS-default.patch \
            "
-SRC_URI[md5sum] = "5fc07da5461a3794a751dcfc355827d5"
-SRC_URI[sha256sum] = "550ba750239fd75b7e52c9877565cabffef506bbf6d7f6f17b9700dee56c720f"
-
-S = "${WORKDIR}/LVM2.${PV}"
+SRCREV = "60bd9e8406ac28a04aa5e8165149f7a5d4f3265a"
+S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig systemd license
 
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-activation-add-synchronization-point.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-activation-add-synchronization-point.patch
new file mode 100644
index 0000000..a864f1e
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0001-activation-add-synchronization-point.patch
@@ -0,0 +1,82 @@
+From f8466749dd73f5b0ccf4fc86c8a7585c4140b3f9 Mon Sep 17 00:00:00 2001
+From: Zdenek Kabelac <zkabelac@redhat.com>
+Date: Fri, 16 Aug 2019 23:49:59 +0200
+Subject: [PATCH 1/3] activation: add synchronization point
+
+Resuming of 'error' table entry followed with it's dirrect removal
+is now troublesame with latest udev as it may skip processing of
+udev rules for already 'dropped' device nodes.
+
+As we cannot 'synchronize' with udev while we know we have devices
+in suspended state - rework 'cleanup' so it collects nodes
+for removal into pending_delete list and process the list with
+synchronization once we are without any suspended nodes.
+
+Upstream-Status: Backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ WHATS_NEW                  |  9 +++++++++
+ lib/activate/dev_manager.c | 20 ++++++++++++--------
+ 2 files changed, 21 insertions(+), 8 deletions(-)
+
+diff --git a/WHATS_NEW b/WHATS_NEW
+index 3a58de5f9..0b48e032b 100644
+--- a/WHATS_NEW
++++ b/WHATS_NEW
+@@ -1,3 +1,12 @@
++Version 2.03.06 - 
++================================
++  Synchronize with udev when dropping snapshot.
++  Add missing device synchronization point before removing pvmove node.
++  Correctly set read_ahead for LVs when pvmove is finished.
++  Remove unsupported OPTIONS+="event_timeout" udev rule from 11-dm-lvm.rules.
++  Prevent creating VGs with PVs with different logical block sizes.
++  Fix metadata writes from corrupting with large physical block size.
++
+ Version 2.03.05 - 15th June 2019
+ ================================
+   Fix command definition for pvchange -a.
+diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
+index 981f4674a..7101ffa12 100644
+--- a/lib/activate/dev_manager.c
++++ b/lib/activate/dev_manager.c
+@@ -3558,13 +3558,6 @@ static int _clean_tree(struct dev_manager *dm, struct dm_tree_node *root, const
+ 	const char *name, *uuid;
+ 	struct dm_str_list *dl;
+ 
+-	/* Deactivate any tracked pending delete nodes */
+-	dm_list_iterate_items(dl, &dm->pending_delete) {
+-		log_debug_activation("Deleting tracked UUID %s.", dl->str);
+-		if (!dm_tree_deactivate_children(root, dl->str, strlen(dl->str)))
+-			return_0;
+-	}
+-
+ 	while ((child = dm_tree_next_child(&handle, root, 0))) {
+ 		if (!(name = dm_tree_node_get_name(child)))
+ 			continue;
+@@ -3585,10 +3578,21 @@ static int _clean_tree(struct dev_manager *dm, struct dm_tree_node *root, const
+ 		if (non_toplevel_tree_dlid && !strcmp(non_toplevel_tree_dlid, uuid))
+ 			continue;
+ 
+-		if (!dm_tree_deactivate_children(root, uuid, strlen(uuid)))
++		if (!str_list_add(dm->mem, &dm->pending_delete, uuid))
+ 			return_0;
+ 	}
+ 
++	/* Deactivate any tracked pending delete nodes */
++	if (!dm_list_empty(&dm->pending_delete) && !dm_get_suspended_counter()) {
++		fs_unlock();
++		dm_tree_set_cookie(root, fs_get_cookie());
++		dm_list_iterate_items(dl, &dm->pending_delete) {
++			log_debug_activation("Deleting tracked UUID %s.", dl->str);
++			if (!dm_tree_deactivate_children(root, dl->str, strlen(dl->str)))
++				return_0;
++		}
++	}
++
+ 	return 1;
+ }
+ 
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-activation-extend-handling-of-pending_delete.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-activation-extend-handling-of-pending_delete.patch
new file mode 100644
index 0000000..e307315
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0002-activation-extend-handling-of-pending_delete.patch
@@ -0,0 +1,124 @@
+From d06ad77b47f4dfd25bc3da88c0621ac073ad8ce5 Mon Sep 17 00:00:00 2001
+From: Zdenek Kabelac <zkabelac@redhat.com>
+Date: Fri, 23 Aug 2019 13:08:34 +0200
+Subject: [PATCH 2/3] activation: extend handling of pending_delete
+
+With previous patch 30a98e4d6710a543692d40d11428ae4baea11b7b we
+started to put devices one pending_delete list instead
+of directly scheduling their removal.
+
+However we have operations like 'snapshot merge' where we are
+resuming device tree in 2 subsequent activation calls - so
+1st such call will still have suspened devices and no chance
+to push 'remove' ioctl.
+
+Since we curently cannot easily solve this by doing just single
+activation call (which would be preferred solution) - we introduce
+a preservation of pending_delete via command structure and
+then restore it on next activation call.
+
+This way we keep to remove devices later - although it might be
+not the best moment - this may need futher tunning.
+
+Also we don't keep the list of operation in 1 trasaction
+(unless we do verify udev symlinks) - this could probably
+also make it more correct in terms of which 'remove' can
+be combined we already running 'resume'.
+
+Upstream-Status: Backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lib/activate/dev_manager.c | 24 +++++++++++-------------
+ lib/commands/toolcontext.c |  8 ++++++++
+ lib/commands/toolcontext.h |  1 +
+ 3 files changed, 20 insertions(+), 13 deletions(-)
+
+diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
+index 7101ffa12..7a7689291 100644
+--- a/lib/activate/dev_manager.c
++++ b/lib/activate/dev_manager.c
+@@ -3591,6 +3591,7 @@ static int _clean_tree(struct dev_manager *dm, struct dm_tree_node *root, const
+ 			if (!dm_tree_deactivate_children(root, dl->str, strlen(dl->str)))
+ 				return_0;
+ 		}
++		dm_list_init(&dm->pending_delete);
+ 	}
+ 
+ 	return 1;
+@@ -3717,25 +3718,22 @@ out_no_root:
+ int dev_manager_activate(struct dev_manager *dm, const struct logical_volume *lv,
+ 			 struct lv_activate_opts *laopts)
+ {
++	dm_list_splice(&dm->pending_delete, &lv->vg->cmd->pending_delete);
++
+ 	if (!_tree_action(dm, lv, laopts, ACTIVATE))
+ 		return_0;
+ 
+-	/*
+-	 * When lvm2 resumes a device and shortly after that it removes it,
+-	 * udevd rule will try to blindly call 'dmsetup info' on already removed
+-	 * device leaving the trace inside syslog about failing operation.
+-	 *
+-	 * TODO: It's not completely clear this call here is the best fix.
+-	 *       Maybe there can be a better sequence, but ATM we do usually resume
+-	 *       error device i.e. on cache deletion and remove it.
+-	 * TODO2: there could be more similar cases!
+-	 */
+-	if (!dm_list_empty(&dm->pending_delete))
+-		fs_unlock();
+-
+ 	if (!_tree_action(dm, lv, laopts, CLEAN))
+ 		return_0;
+ 
++	if (!dm_list_empty(&dm->pending_delete)) {
++		log_debug("Preserving %d device(s) for removal while being suspended.",
++			  dm_list_size(&dm->pending_delete));
++		if (!(str_list_dup(lv->vg->cmd->mem, &lv->vg->cmd->pending_delete,
++				   &dm->pending_delete)))
++			return_0;
++	}
++
+ 	return 1;
+ }
+ 
+diff --git a/lib/commands/toolcontext.c b/lib/commands/toolcontext.c
+index 1e03ea235..0a9355361 100644
+--- a/lib/commands/toolcontext.c
++++ b/lib/commands/toolcontext.c
+@@ -1734,6 +1734,8 @@ struct cmd_context *create_toolcontext(unsigned is_clvmd,
+ 	cmd->current_settings = cmd->default_settings;
+ 
+ 	cmd->initialized.config = 1;
++
++	dm_list_init(&cmd->pending_delete);
+ out:
+ 	if (!cmd->initialized.config) {
+ 		destroy_toolcontext(cmd);
+@@ -1922,6 +1924,12 @@ int refresh_toolcontext(struct cmd_context *cmd)
+ 
+ 	cmd->initialized.config = 1;
+ 
++	if (!dm_list_empty(&cmd->pending_delete)) {
++		log_debug(INTERNAL_ERROR "Unprocessed pending delete for %d devices.",
++			  dm_list_size(&cmd->pending_delete));
++		dm_list_init(&cmd->pending_delete);
++	}
++
+ 	if (cmd->initialized.connections && !init_connections(cmd))
+ 		return_0;
+ 
+diff --git a/lib/commands/toolcontext.h b/lib/commands/toolcontext.h
+index 6e4530c8a..54ddec320 100644
+--- a/lib/commands/toolcontext.h
++++ b/lib/commands/toolcontext.h
+@@ -237,6 +237,7 @@ struct cmd_context {
+ 	const char *report_list_item_separator;
+ 	const char *time_format;
+ 	unsigned rand_seed;
++	struct dm_list pending_delete;		/* list of LVs for removal */
+ };
+ 
+ /*
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0003-snapshot-always-activate.patch b/meta-oe/recipes-support/lvm2/lvm2/0003-snapshot-always-activate.patch
new file mode 100644
index 0000000..953e4ad
--- /dev/null
+++ b/meta-oe/recipes-support/lvm2/lvm2/0003-snapshot-always-activate.patch
@@ -0,0 +1,40 @@
+From 9143445478871b47ba28b41f5e88d4c415f8205b Mon Sep 17 00:00:00 2001
+From: Zdenek Kabelac <zkabelac@redhat.com>
+Date: Mon, 26 Aug 2019 15:13:55 +0200
+Subject: [PATCH 3/3] snapshot: always activate
+
+Drop the 'cluster-only' optimization so we do resume ALL device
+before we try to wait on cookie before 'removal' operation.
+
+It's more correct order of operation - alhtough possibly slightly
+less efficient - but until we have correct list of operations
+'in-progress' we can't do anything better.
+
+Upstream-Status: Backport
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ lib/metadata/snapshot_manip.c | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/lib/metadata/snapshot_manip.c b/lib/metadata/snapshot_manip.c
+index 5ccf251c7..65d8dbd13 100644
+--- a/lib/metadata/snapshot_manip.c
++++ b/lib/metadata/snapshot_manip.c
+@@ -361,13 +361,7 @@ int vg_remove_snapshot(struct logical_volume *cow)
+ 			return 0;
+ 		}
+ 
+-		/*
+-		 * For merged snapshot and clustered VG activate cow LV so
+-		 * the following call to deactivate_lv() can clean-up table
+-		 * entries. For this clustered lock need to be held.
+-		 */
+-		if (vg_is_clustered(cow->vg) &&
+-		    merging_snapshot && !activate_lv(cow->vg->cmd, cow)) {
++		if (merging_snapshot && !activate_lv(cow->vg->cmd, cow)) {
+ 			log_error("Failed to activate %s.", cow->name);
+ 			return 0;
+ 		}
+-- 
+2.21.0
+
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.05.bb
similarity index 94%
rename from meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.03.05.bb
index 875709c..b80f1fd 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.02.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.05.bb
@@ -1,11 +1,12 @@
 require lvm2.inc
 
-SRCREV = "913c28917e62577a2ef67152b2e5159237503dda"
-
 SRC_URI += " \
             file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
             file://0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch \
             file://0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch \
+            file://0001-activation-add-synchronization-point.patch \
+            file://0002-activation-extend-handling-of-pending_delete.patch \
+            file://0003-snapshot-always-activate.patch \
            "
 
 DEPENDS += "autoconf-archive-native"
-- 
2.7.4


