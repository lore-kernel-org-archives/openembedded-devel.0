Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 131416B076
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 08:31:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,274,1569254400"; d="scan'208";a="77943202"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Nov 2019 16:31:50 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 7E33C4CE1A1F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 16:23:47 +0800 (CST)
Received: from G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 6 Nov 2019 16:31:50 +0800
Received: from localhost.localdomain (10.167.225.35) by
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Wed, 6 Nov 2019 16:31:51 +0800
From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Nov 2019 20:11:35 +0800
Message-ID: <1573042295-43383-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
	G08CNEXJMPEKD02.g08.fujitsu.local (10.167.33.202)
X-yoursite-MailScanner-ID: 7E33C4CE1A1F.AB624
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-oe][PATCH] lvm2/libdevmapper: 2.03.05 -> 2.03.06
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
X-List-Received-Date: Wed, 06 Nov 2019 08:31:50 -0000
Content-Type: text/plain

1) Remove five patches for they have been merged in new version.
   0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch
   0001-configure-Fix-setting-of-CLDFLAGS-default.patch
   0001-activation-add-synchronization-point.patch
   0002-activation-extend-handling-of-pending_delete.patch
   0003-snapshot-always-activate.patch

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 ...configure-Fix-setting-of-CLDFLAGS-default.patch |  78 -------------
 ...evmapper_2.03.05.bb => libdevmapper_2.03.06.bb} |   0
 meta-oe/recipes-support/lvm2/lvm2.inc              |   3 +-
 ...0001-activation-add-synchronization-point.patch |  82 --------------
 ...ve-unsupported-OPTIONS-event_timeout-rule.patch |  39 -------
 ...ivation-extend-handling-of-pending_delete.patch | 124 ---------------------
 .../lvm2/lvm2/0003-snapshot-always-activate.patch  |  40 -------
 .../lvm2/{lvm2_2.03.05.bb => lvm2_2.03.06.bb}      |   4 -
 8 files changed, 1 insertion(+), 369 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
 rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.05.bb => libdevmapper_2.03.06.bb} (100%)
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-activation-add-synchronization-point.patch
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0002-activation-extend-handling-of-pending_delete.patch
 delete mode 100644 meta-oe/recipes-support/lvm2/lvm2/0003-snapshot-always-activate.patch
 rename meta-oe/recipes-support/lvm2/{lvm2_2.03.05.bb => lvm2_2.03.06.bb} (91%)

diff --git a/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch b/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
deleted file mode 100644
index 07cb88f..0000000
--- a/meta-oe/recipes-support/lvm2/files/0001-configure-Fix-setting-of-CLDFLAGS-default.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 4a3e707402032788e09282e0f54fdf82c8a0f8fc Mon Sep 17 00:00:00 2001
-From: Marian Csontos <mcsontos@redhat.com>
-Date: Mon, 19 Aug 2019 14:54:43 +0200
-Subject: [PATCH] configure: Fix setting of CLDFLAGS default
-
----
- configure    | 6 +++---
- configure.ac | 6 +++---
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-Upstream-Status: Backport [https://sourceware.org/git/?p=lvm2.git;a=commit;h=4a3e707402032788e09282e0f54fdf82c8a0f8fc]
-Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
-
-diff --git a/configure b/configure
-index ff3a59b6b..4c8476502 100755
---- a/configure
-+++ b/configure
-@@ -3077,7 +3077,7 @@ if test -z "$CFLAGS"; then :
- fi
- case "$host_os" in
- 	linux*)
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"} -Wl,--version-script,.export.sym"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"} -Wl,--version-script,.export.sym"
- 		# equivalent to -rdynamic
- 		ELDFLAGS="-Wl,--export-dynamic"
- 		# FIXME Generate list and use --dynamic-list=.dlopen.sym
-@@ -3098,7 +3098,7 @@ case "$host_os" in
- 		;;
- 	darwin*)
- 		CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
- 		ELDFLAGS=
- 		CLDWHOLEARCHIVE="-all_load"
- 		CLDNOWHOLEARCHIVE=
-@@ -3111,7 +3111,7 @@ case "$host_os" in
- 		BLKDEACTIVATE=no
- 		;;
- 	*)
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
- 		;;
- esac
- 
-diff --git a/configure.ac b/configure.ac
-index 5da694631..830edb8da 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -30,7 +30,7 @@ AC_CANONICAL_TARGET([])
- AS_IF([test -z "$CFLAGS"], [COPTIMISE_FLAG="-O2"])
- case "$host_os" in
- 	linux*)
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"} -Wl,--version-script,.export.sym"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"} -Wl,--version-script,.export.sym"
- 		# equivalent to -rdynamic
- 		ELDFLAGS="-Wl,--export-dynamic"
- 		# FIXME Generate list and use --dynamic-list=.dlopen.sym
-@@ -51,7 +51,7 @@ case "$host_os" in
- 		;;
- 	darwin*)
- 		CFLAGS="$CFLAGS -no-cpp-precomp -fno-common"
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
- 		ELDFLAGS=
- 		CLDWHOLEARCHIVE="-all_load"
- 		CLDNOWHOLEARCHIVE=
-@@ -64,7 +64,7 @@ case "$host_os" in
- 		BLKDEACTIVATE=no
- 		;;
- 	*)
--		CLDFLAGS="${CLDFLAGS:"$LDFLAGS"}"
-+		CLDFLAGS="${CLDFLAGS-"$LDFLAGS"}"
- 		;;
- esac
- 
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.05.bb b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.06.bb
similarity index 100%
rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.05.bb
rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.06.bb
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 41bf78a..01c9df4 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -15,9 +15,8 @@ SRC_URI = "git://sourceware.org/git/lvm2.git \
            file://0001-Avoid-bashisms-in-init-scripts.patch \
            file://0005-do-not-build-manual.patch \
            file://0006-start-lvm2-monitor.service-after-tmp.mount.patch \
-           file://0001-configure-Fix-setting-of-CLDFLAGS-default.patch \
            "
-SRCREV = "60bd9e8406ac28a04aa5e8165149f7a5d4f3265a"
+SRCREV = "b9391b1b9f0b73303fa21f8f92574d17ce4c2b02"
 S = "${WORKDIR}/git"
 
 inherit autotools-brokensep pkgconfig systemd license
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-activation-add-synchronization-point.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-activation-add-synchronization-point.patch
deleted file mode 100644
index a864f1e..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-activation-add-synchronization-point.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From f8466749dd73f5b0ccf4fc86c8a7585c4140b3f9 Mon Sep 17 00:00:00 2001
-From: Zdenek Kabelac <zkabelac@redhat.com>
-Date: Fri, 16 Aug 2019 23:49:59 +0200
-Subject: [PATCH 1/3] activation: add synchronization point
-
-Resuming of 'error' table entry followed with it's dirrect removal
-is now troublesame with latest udev as it may skip processing of
-udev rules for already 'dropped' device nodes.
-
-As we cannot 'synchronize' with udev while we know we have devices
-in suspended state - rework 'cleanup' so it collects nodes
-for removal into pending_delete list and process the list with
-synchronization once we are without any suspended nodes.
-
-Upstream-Status: Backport
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- WHATS_NEW                  |  9 +++++++++
- lib/activate/dev_manager.c | 20 ++++++++++++--------
- 2 files changed, 21 insertions(+), 8 deletions(-)
-
-diff --git a/WHATS_NEW b/WHATS_NEW
-index 3a58de5f9..0b48e032b 100644
---- a/WHATS_NEW
-+++ b/WHATS_NEW
-@@ -1,3 +1,12 @@
-+Version 2.03.06 - 
-+================================
-+  Synchronize with udev when dropping snapshot.
-+  Add missing device synchronization point before removing pvmove node.
-+  Correctly set read_ahead for LVs when pvmove is finished.
-+  Remove unsupported OPTIONS+="event_timeout" udev rule from 11-dm-lvm.rules.
-+  Prevent creating VGs with PVs with different logical block sizes.
-+  Fix metadata writes from corrupting with large physical block size.
-+
- Version 2.03.05 - 15th June 2019
- ================================
-   Fix command definition for pvchange -a.
-diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
-index 981f4674a..7101ffa12 100644
---- a/lib/activate/dev_manager.c
-+++ b/lib/activate/dev_manager.c
-@@ -3558,13 +3558,6 @@ static int _clean_tree(struct dev_manager *dm, struct dm_tree_node *root, const
- 	const char *name, *uuid;
- 	struct dm_str_list *dl;
- 
--	/* Deactivate any tracked pending delete nodes */
--	dm_list_iterate_items(dl, &dm->pending_delete) {
--		log_debug_activation("Deleting tracked UUID %s.", dl->str);
--		if (!dm_tree_deactivate_children(root, dl->str, strlen(dl->str)))
--			return_0;
--	}
--
- 	while ((child = dm_tree_next_child(&handle, root, 0))) {
- 		if (!(name = dm_tree_node_get_name(child)))
- 			continue;
-@@ -3585,10 +3578,21 @@ static int _clean_tree(struct dev_manager *dm, struct dm_tree_node *root, const
- 		if (non_toplevel_tree_dlid && !strcmp(non_toplevel_tree_dlid, uuid))
- 			continue;
- 
--		if (!dm_tree_deactivate_children(root, uuid, strlen(uuid)))
-+		if (!str_list_add(dm->mem, &dm->pending_delete, uuid))
- 			return_0;
- 	}
- 
-+	/* Deactivate any tracked pending delete nodes */
-+	if (!dm_list_empty(&dm->pending_delete) && !dm_get_suspended_counter()) {
-+		fs_unlock();
-+		dm_tree_set_cookie(root, fs_get_cookie());
-+		dm_list_iterate_items(dl, &dm->pending_delete) {
-+			log_debug_activation("Deleting tracked UUID %s.", dl->str);
-+			if (!dm_tree_deactivate_children(root, dl->str, strlen(dl->str)))
-+				return_0;
-+		}
-+	}
-+
- 	return 1;
- }
- 
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch b/meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch
deleted file mode 100644
index 5a6db4b..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From e48f8328f9d35f23a24e5b27237e8ebf1dbfa269 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 10 Oct 2019 22:38:00 -0400
-Subject: [PATCH] udev: remove unsupported OPTIONS+="event_timeout" rule
-
-The OPTIONS+="event_timeout" is Unsupported since systemd/udev version 216,
-that is ~5 years ago.
-
-Since systemd/udev version 243, there's a new message printed if unsupported
-OPTIONS value is used:
-
-  Invalid value for OPTIONS key, ignoring: 'event_timeout=180'
-
-Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1740666
-
-Signed-off-by: Peter Rajnoha <prajnoha@redhat.com>
-
-Upstream-Status: Backport [https://github.com/lvmteam/lvm2/commit/125f27ac37bc9b93cc96f64052b9681b3d479ee1]
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- udev/11-dm-lvm.rules.in | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/udev/11-dm-lvm.rules.in b/udev/11-dm-lvm.rules.in
-index 91cb991..7c58994 100644
---- a/udev/11-dm-lvm.rules.in
-+++ b/udev/11-dm-lvm.rules.in
-@@ -37,8 +37,6 @@ ENV{DM_SUBSYSTEM_UDEV_FLAG0}!="1", ENV{DM_NOSCAN}=="1", ENV{DM_UDEV_DISABLE_OTHE
- 
- ENV{DM_UDEV_DISABLE_SUBSYSTEM_RULES_FLAG}=="1", GOTO="lvm_end"
- 
--OPTIONS+="event_timeout=180"
--
- # Do not create symlinks for inappropriate subdevices.
- ENV{DM_LV_NAME}=="pvmove?*|?*_vorigin", GOTO="lvm_disable"
- ENV{DM_LV_LAYER}=="?*", GOTO="lvm_disable"
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0002-activation-extend-handling-of-pending_delete.patch b/meta-oe/recipes-support/lvm2/lvm2/0002-activation-extend-handling-of-pending_delete.patch
deleted file mode 100644
index e307315..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0002-activation-extend-handling-of-pending_delete.patch
+++ /dev/null
@@ -1,124 +0,0 @@
-From d06ad77b47f4dfd25bc3da88c0621ac073ad8ce5 Mon Sep 17 00:00:00 2001
-From: Zdenek Kabelac <zkabelac@redhat.com>
-Date: Fri, 23 Aug 2019 13:08:34 +0200
-Subject: [PATCH 2/3] activation: extend handling of pending_delete
-
-With previous patch 30a98e4d6710a543692d40d11428ae4baea11b7b we
-started to put devices one pending_delete list instead
-of directly scheduling their removal.
-
-However we have operations like 'snapshot merge' where we are
-resuming device tree in 2 subsequent activation calls - so
-1st such call will still have suspened devices and no chance
-to push 'remove' ioctl.
-
-Since we curently cannot easily solve this by doing just single
-activation call (which would be preferred solution) - we introduce
-a preservation of pending_delete via command structure and
-then restore it on next activation call.
-
-This way we keep to remove devices later - although it might be
-not the best moment - this may need futher tunning.
-
-Also we don't keep the list of operation in 1 trasaction
-(unless we do verify udev symlinks) - this could probably
-also make it more correct in terms of which 'remove' can
-be combined we already running 'resume'.
-
-Upstream-Status: Backport
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- lib/activate/dev_manager.c | 24 +++++++++++-------------
- lib/commands/toolcontext.c |  8 ++++++++
- lib/commands/toolcontext.h |  1 +
- 3 files changed, 20 insertions(+), 13 deletions(-)
-
-diff --git a/lib/activate/dev_manager.c b/lib/activate/dev_manager.c
-index 7101ffa12..7a7689291 100644
---- a/lib/activate/dev_manager.c
-+++ b/lib/activate/dev_manager.c
-@@ -3591,6 +3591,7 @@ static int _clean_tree(struct dev_manager *dm, struct dm_tree_node *root, const
- 			if (!dm_tree_deactivate_children(root, dl->str, strlen(dl->str)))
- 				return_0;
- 		}
-+		dm_list_init(&dm->pending_delete);
- 	}
- 
- 	return 1;
-@@ -3717,25 +3718,22 @@ out_no_root:
- int dev_manager_activate(struct dev_manager *dm, const struct logical_volume *lv,
- 			 struct lv_activate_opts *laopts)
- {
-+	dm_list_splice(&dm->pending_delete, &lv->vg->cmd->pending_delete);
-+
- 	if (!_tree_action(dm, lv, laopts, ACTIVATE))
- 		return_0;
- 
--	/*
--	 * When lvm2 resumes a device and shortly after that it removes it,
--	 * udevd rule will try to blindly call 'dmsetup info' on already removed
--	 * device leaving the trace inside syslog about failing operation.
--	 *
--	 * TODO: It's not completely clear this call here is the best fix.
--	 *       Maybe there can be a better sequence, but ATM we do usually resume
--	 *       error device i.e. on cache deletion and remove it.
--	 * TODO2: there could be more similar cases!
--	 */
--	if (!dm_list_empty(&dm->pending_delete))
--		fs_unlock();
--
- 	if (!_tree_action(dm, lv, laopts, CLEAN))
- 		return_0;
- 
-+	if (!dm_list_empty(&dm->pending_delete)) {
-+		log_debug("Preserving %d device(s) for removal while being suspended.",
-+			  dm_list_size(&dm->pending_delete));
-+		if (!(str_list_dup(lv->vg->cmd->mem, &lv->vg->cmd->pending_delete,
-+				   &dm->pending_delete)))
-+			return_0;
-+	}
-+
- 	return 1;
- }
- 
-diff --git a/lib/commands/toolcontext.c b/lib/commands/toolcontext.c
-index 1e03ea235..0a9355361 100644
---- a/lib/commands/toolcontext.c
-+++ b/lib/commands/toolcontext.c
-@@ -1734,6 +1734,8 @@ struct cmd_context *create_toolcontext(unsigned is_clvmd,
- 	cmd->current_settings = cmd->default_settings;
- 
- 	cmd->initialized.config = 1;
-+
-+	dm_list_init(&cmd->pending_delete);
- out:
- 	if (!cmd->initialized.config) {
- 		destroy_toolcontext(cmd);
-@@ -1922,6 +1924,12 @@ int refresh_toolcontext(struct cmd_context *cmd)
- 
- 	cmd->initialized.config = 1;
- 
-+	if (!dm_list_empty(&cmd->pending_delete)) {
-+		log_debug(INTERNAL_ERROR "Unprocessed pending delete for %d devices.",
-+			  dm_list_size(&cmd->pending_delete));
-+		dm_list_init(&cmd->pending_delete);
-+	}
-+
- 	if (cmd->initialized.connections && !init_connections(cmd))
- 		return_0;
- 
-diff --git a/lib/commands/toolcontext.h b/lib/commands/toolcontext.h
-index 6e4530c8a..54ddec320 100644
---- a/lib/commands/toolcontext.h
-+++ b/lib/commands/toolcontext.h
-@@ -237,6 +237,7 @@ struct cmd_context {
- 	const char *report_list_item_separator;
- 	const char *time_format;
- 	unsigned rand_seed;
-+	struct dm_list pending_delete;		/* list of LVs for removal */
- };
- 
- /*
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2/0003-snapshot-always-activate.patch b/meta-oe/recipes-support/lvm2/lvm2/0003-snapshot-always-activate.patch
deleted file mode 100644
index 953e4ad..0000000
--- a/meta-oe/recipes-support/lvm2/lvm2/0003-snapshot-always-activate.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9143445478871b47ba28b41f5e88d4c415f8205b Mon Sep 17 00:00:00 2001
-From: Zdenek Kabelac <zkabelac@redhat.com>
-Date: Mon, 26 Aug 2019 15:13:55 +0200
-Subject: [PATCH 3/3] snapshot: always activate
-
-Drop the 'cluster-only' optimization so we do resume ALL device
-before we try to wait on cookie before 'removal' operation.
-
-It's more correct order of operation - alhtough possibly slightly
-less efficient - but until we have correct list of operations
-'in-progress' we can't do anything better.
-
-Upstream-Status: Backport
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- lib/metadata/snapshot_manip.c | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/lib/metadata/snapshot_manip.c b/lib/metadata/snapshot_manip.c
-index 5ccf251c7..65d8dbd13 100644
---- a/lib/metadata/snapshot_manip.c
-+++ b/lib/metadata/snapshot_manip.c
-@@ -361,13 +361,7 @@ int vg_remove_snapshot(struct logical_volume *cow)
- 			return 0;
- 		}
- 
--		/*
--		 * For merged snapshot and clustered VG activate cow LV so
--		 * the following call to deactivate_lv() can clean-up table
--		 * entries. For this clustered lock need to be held.
--		 */
--		if (vg_is_clustered(cow->vg) &&
--		    merging_snapshot && !activate_lv(cow->vg->cmd, cow)) {
-+		if (merging_snapshot && !activate_lv(cow->vg->cmd, cow)) {
- 			log_error("Failed to activate %s.", cow->name);
- 			return 0;
- 		}
--- 
-2.21.0
-
diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.05.bb b/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
similarity index 91%
rename from meta-oe/recipes-support/lvm2/lvm2_2.03.05.bb
rename to meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
index b80f1fd..e2b551b 100644
--- a/meta-oe/recipes-support/lvm2/lvm2_2.03.05.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.06.bb
@@ -3,10 +3,6 @@ require lvm2.inc
 SRC_URI += " \
             file://0001-dev-hdc-open-failed-No-medium-found-will-print-out-i.patch \
             file://0001-fix-command-bin-findmnt-bin-lsblk-bin-sort-not-found.patch \
-            file://0001-udev-remove-unsupported-OPTIONS-event_timeout-rule.patch \
-            file://0001-activation-add-synchronization-point.patch \
-            file://0002-activation-extend-handling-of-pending_delete.patch \
-            file://0003-snapshot-always-activate.patch \
            "
 
 DEPENDS += "autoconf-archive-native"
-- 
2.7.4




