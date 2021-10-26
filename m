Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E8EC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 01:18:39 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web10.6194.1635211110305000391
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 18:18:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IKfdE6dO;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635211108; i=@fujitsu.com;
	bh=AISvV5RGSQSqK3xMk48RJ1V57vGcAQ95M64hFYvIpYE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IKfdE6dOTmID3Dky6D8pG9HI8VZ8oYcr/JZRU3juK38W2lN4t4SEqk7yJ+tcU1MBv
	 TMLoe9UzHY30psX6GfTxOKwdhnz6WYVXXXaW3i3aZtXfMnX34iCcOmBGLcE37pVvt5
	 +1+tVdnGCn8KHHHQjthd25TIO4HD7NNIXE/Uh7alPhU0m/X56XdTHlqr9SBiK1G6Uj
	 t02QKJVdS13PCHBR7fQoIu/scxWvu2p9f8QeCTVCadp9ar+sWilnR9UobTNtRkCkAQ
	 iawKm1cZ5cpVQFyMFx4q2FVzwHELjt5A1k6RM/EUPoudedp/8SAlpkTH5Bj5RLfqgL
	 CoINxyWOmq5ug==
Received: from [100.113.3.109] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id 0E/01-11692-36757716;
 Tue, 26 Oct 2021 01:18:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYopsUXp5
  o8P+uqcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrF76g2mgjthFRPmTmNpYFzq3cXIySEkMJtJ
  4vFzpi5GLiB7D6PExWk7mUESbAK6Eucer2UHsUUE9CWWzt4DFOfgEBZwk7jzjgckzCKgKrG7b
  xYTiM0r4CHRd6mXBcSWEFCQmPLwPTNEXFDi5MwnYHFmAQmJgy9egI2REFCUmD1dHqK8QuL14U
  vMExh5ZiHpmIWkYwEj0ypGy6SizPSMktzEzBxdQwMDXUNDY11jXUNLE73EKt1EvdRS3eTUvJK
  iRKCsXmJ5sV5xZW5yTopeXmrJJkZgEKUUMh/awfjk9Qe9Q4ySHExKorzLz5YlCvEl5adUZiQW
  Z8QXleakFh9ilOHgUJLg5QorTxQSLEpNT61Iy8wBBjRMWoKDR0mEd3MIUJq3uCAxtzgzHSJ1i
  lFRSpzXD6RPACSRUZoH1waLokuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHlDQKbwZOaVwE
  1/BbSYCWixn24JyOKSRISUVANTU9WFPZozM9yEFFYuOWhQovz61DwJw/Mt11iyKuPsBNe4bj7
  794r0guh6s3USL40dTfu53isnZ/eEsnu7nhafMXfVhdaKa3o5STvDdGe4x/NzPLFRfdIcbBXB
  9Nvhwo208vb8QL7PeiaRK5ff/68vr5meHim/5afPtjaum/OYVb4fO+sYb6uiesBEUfdGgnt2Q
  pP6Re2cA4b9SS0+acc/5f/4v8nL4Ueijdsde+E7fKu3Taju3D1vw+ekzz95hKc9lPg3K+jEn1
  3fFq3wefFJQ8BcaKnuf2MGL+eTGRNeJdSpn5eYP/uoNOP9NEazzQ3PTujzLmS+7Xlsq+T1qx+
  mL3K+cdd78uKakpW3Vx9TYinOSDTUYi4qTgQA44akdB0DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-226.messagelabs.com!1635211106!5883!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27806 invoked from network); 26 Oct 2021 01:18:26 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Oct 2021 01:18:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19Q1IQ2A031887
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 02:18:26 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Tue, 26 Oct 2021 02:18:25 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] autofs: upgrade 5.1.7 -> 5.1.8
Date: Tue, 26 Oct 2021 09:18:08 +0800
Message-ID: <1635211088-45995-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 01:18:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93582

autofs-5.1.8 changelog:
- add xdr_exports().
- remove mount.x and rpcgen dependencies.
- dont use realloc in host exports list processing.
- use sprintf() when constructing hosts mapent.
- fix mnts_remove_amdmount() uses wrong list.
- Fix option for master read wait.
- eliminate cache_lookup_offset() usage.
- fix is mounted check on non existent path.
- simplify cache_get_parent().
- set offset parent in update_offset_entry().
- remove redundant variables from mount_autofs_offset().
- remove unused parameter form do_mount_autofs_offset().
- refactor umount_multi_triggers().
- eliminate clean_stale_multi_triggers().
- simplify mount_subtree() mount check.
- fix mnts_get_expire_list() expire list construction.
- fix inconsistent locking in umount_subtree_mounts().
- fix return from umount_subtree_mounts() on offset list delete.
- pass mapent_cache to update_offset_entry().
- fix inconsistent locking in parse_mount().
- remove unused mount offset list lock functions.
- eliminate count_mounts() from expire_proc_indirect().
- eliminate some strlen calls in offset handling.
- don't add offset mounts to mounted mounts table.
- reduce umount EBUSY check delay.
- cleanup cache_delete() a little.
- rename path to m_offset in update_offset_entry().
- don't pass root to do_mount_autofs_offset().
- rename tree implementation functions.
- add some multi-mount macros.
- remove unused functions cache_dump_multi() and cache_dump_cache().
- add a len field to struct autofs_point.
- make tree implementation data independent.
- add mapent tree implementation.
- add tree_mapent_add_node().
- add tree_mapent_delete_offsets().
- add tree_mapent_traverse_subtree().
- fix mount_fullpath().
- add tree_mapent_cleanup_offsets().
- add set_offset_tree_catatonic().
- add mount and umount offsets functions.
- switch to use tree implementation for offsets.
- remove obsolete functions.
- remove redundant local var from sun_mount().
- use mount_fullpath() in one spot in parse_mount().
- pass root length to mount_fullpath().
- remove unused function master_submount_list_empty().
- move amd mounts removal into lib/mounts.c.
- check for offset with no mount location.
- remove mounts_mutex.
- remove unused variable from get_exports().
- add missing free in handle_mounts().
- remove redundant if check.
- fix possible memory leak in master_parse().
- fix possible memory leak in mnts_add_amdmount().
- fix double unlock in parse_mount().
- add length check in umount_subtree_mounts().
- fix flags check in umount_multi().
- dont try umount after stat() ENOENT fail.
- remove redundant assignment in master_add_amd_mount_section_mounts().
- fix dead code in mnts_add_mount().
- fix arg not used in error print.
- fix missing lock release in mount_subtree().
- fix double free in parse_mapent().
- refactor lookup_prune_one_cache() a bit.
- cater for empty mounts list in mnts_get_expire_list().
- add ext_mount_hash_mutex lock helpers.
- fix amd section mounts map reload.
- fix dandling symlink creation if nis support is not available.
- dont use AUTOFS_DEV_IOCTL_CLOSEMOUNT.
- fix lookup_prune_one_cache() refactoring change.
- fix amd hosts mount expire.
- fix offset entries order.
- use mapent tree root for tree_mapent_add_node().
- eliminate redundant cache lookup in tree_mapent_add_node().
- fix hosts map offset order.
- fix direct mount deadlock.
- add missing description of null map option.
- fix nonstrict offset mount fail handling.
- fix concat_options() error handling.
- eliminate some more alloca usage.
- use default stack size for threads.
- fix use of possibly NULL var in lookup_program.c:match_key().
- fix incorrect print format specifiers in get_pkt().
- add mapent path length check in handle_packet_expire_direct().
- add copy length check in umount_autofs_indirect().
- add some buffer length checks to master map parser.
- add buffer length check to rmdir_path().
- eliminate buffer usage from handle_mounts_cleanup().
- add buffer length checks to autofs mount_mount().
- make NFS version check flags consistent.
- refactor get_nfs_info().
- also require TCP_REQUESTED when setting NFS port.

0001-Do-not-hardcode-path-for-pkg.m4.patch refreshed.
autofs-5.1.7-use-default-stack-size-for-threads.patch
removed since it is included in 5.1.8.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...0001-Do-not-hardcode-path-for-pkg.m4.patch |   7 +-
 ...7-use-default-stack-size-for-threads.patch | 110 ------------------
 .../{autofs_5.1.7.bb => autofs_5.1.8.bb}      |   3 +-
 3 files changed, 6 insertions(+), 114 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.7-use-default-stack-size-for-threads.patch
 rename meta-networking/recipes-daemons/autofs/{autofs_5.1.7.bb => autofs_5.1.8.bb} (95%)

diff --git a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
index d5ea417fb2..f18f237d98 100644
--- a/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
+++ b/meta-networking/recipes-daemons/autofs/autofs/0001-Do-not-hardcode-path-for-pkg.m4.patch
@@ -1,4 +1,4 @@
-From a27217a5437da313d251b4a765bf7cb60ffaa62d Mon Sep 17 00:00:00 2001
+From d7a34bb388e33d16260b67275cdb58f9c877d324 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Tue, 27 Nov 2018 15:27:47 +0800
 Subject: [PATCH] From 6d24365f0828185fd1bb4d199209ca07eb95c41d Mon Sep 17
@@ -11,14 +11,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 update patch to version 5.1.6
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
 ---
  configure.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
+diff --git a/configure.in b/configure.in
+index 07c2051..e85d718 100644
 --- a/configure.in
 +++ b/configure.in
 @@ -12,7 +12,7 @@ define([AC_CACHE_SAVE], )dnl
- AC_INIT(.autofs-5.1.7)
+ AC_INIT(.autofs-5.1.8)
  
  # for pkg-config macros
 -m4_include([/usr/share/aclocal/pkg.m4])
diff --git a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.7-use-default-stack-size-for-threads.patch b/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.7-use-default-stack-size-for-threads.patch
deleted file mode 100644
index b21e7c03bf..0000000000
--- a/meta-networking/recipes-daemons/autofs/autofs/autofs-5.1.7-use-default-stack-size-for-threads.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-autofs-5.1.7 - use default stack size for threads
-
-From: Ian Kent <raven@themaw.net>
-
-autofs uses PTHREAD_STACK_MIN to set the stack size for threads it
-creates.
-
-In two cases it is used to reduce the stack size for long running
-service threads while it's used to allocate a larger stack for worker
-threads that can have larger memory requirements.
-
-In recent glibc releases PTHREAD_STACK_MIN is no longer a constant
-which can lead to unexpectedly different stack sizes on different
-architectures and the autofs assumption it's a constant causes a
-compile failure.
-
-The need to alter the stack size was due to observed stack overflow
-which was thought to be due the thread stack being too small for autofs
-and glibc alloca(3) usage.
-
-Quite a bit of that alloca(3) usage has been eliminated from autofs now,
-particularly those that might be allocating largish amounts of storage,
-and there has been a lot of change in glibc too so using the thread
-default stack should be ok.
-
-Signed-off-by: Ian Kent <raven@themaw.net>
----
- CHANGELOG          |    1 +
- daemon/automount.c |   29 -----------------------------
- daemon/state.c     |    6 +-----
- lib/alarm.c        |    6 +-----
- 4 files changed, 3 insertions(+), 39 deletions(-)
-
---- a/daemon/automount.c
-+++ b/daemon/automount.c
-@@ -92,7 +92,6 @@ static size_t kpkt_len;
- /* Attributes for creating detached and joinable threads */
- pthread_attr_t th_attr;
- pthread_attr_t th_attr_detached;
--size_t detached_thread_stack_size = PTHREAD_STACK_MIN * 144;
- 
- struct master_readmap_cond mrc = {
- 	PTHREAD_MUTEX_INITIALIZER, PTHREAD_COND_INITIALIZER, 0, NULL, 0, 0, 0, 0};
-@@ -2617,34 +2616,6 @@ int main(int argc, char *argv[])
- 		if (start_pipefd[1] != -1) {
- 			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
- 			close(start_pipefd[1]);
--		}
--		release_flag_file();
--		macro_free_global_table();
--		exit(1);
--	}
--
--#ifdef _POSIX_THREAD_ATTR_STACKSIZE
--	if (pthread_attr_setstacksize(
--			&th_attr_detached, detached_thread_stack_size)) {
--		logerr("%s: failed to set stack size thread attribute!",
--		       program);
--		if (start_pipefd[1] != -1) {
--			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
--			close(start_pipefd[1]);
--		}
--		release_flag_file();
--		macro_free_global_table();
--		exit(1);
--	}
--#endif
--
--	if (pthread_attr_getstacksize(
--			&th_attr_detached, &detached_thread_stack_size)) {
--		logerr("%s: failed to get detached thread stack size!",
--		       program);
--		if (start_pipefd[1] != -1) {
--			res = write(start_pipefd[1], pst_stat, sizeof(*pst_stat));
--			close(start_pipefd[1]);
- 		}
- 		release_flag_file();
- 		macro_free_global_table();
---- a/daemon/state.c
-+++ b/daemon/state.c
-@@ -1173,12 +1173,8 @@ int st_start_handler(void)
- 	status = pthread_attr_init(pattrs);
- 	if (status)
- 		pattrs = NULL;
--	else {
-+	else
- 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
--#ifdef _POSIX_THREAD_ATTR_STACKSIZE
--		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
--#endif
--	}
- 
- 	status = pthread_create(&thid, pattrs, st_queue_handler, NULL);
- 
---- a/lib/alarm.c
-+++ b/lib/alarm.c
-@@ -270,12 +270,8 @@ int alarm_start_handler(void)
- 	status = pthread_attr_init(pattrs);
- 	if (status)
- 		pattrs = NULL;
--	else {
-+	else
- 		pthread_attr_setdetachstate(pattrs, PTHREAD_CREATE_DETACHED);
--#ifdef _POSIX_THREAD_ATTR_STACKSIZE
--		pthread_attr_setstacksize(pattrs, PTHREAD_STACK_MIN*4);
--#endif
--	}
- 
- 	status = pthread_condattr_init(&condattrs);
- 	if (status)
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
similarity index 95%
rename from meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb
rename to meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
index 3fc574fd0a..c41d0e6b93 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.1.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.1.8.bb
@@ -26,9 +26,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.gz \
            file://0001-Do-not-hardcode-path-for-pkg.m4.patch \
            file://0001-Bug-fix-for-pid_t-not-found-on-musl.patch \
            file://0001-Define-__SWORD_TYPE-if-undefined.patch \
-           file://autofs-5.1.7-use-default-stack-size-for-threads.patch \
            "
-SRC_URI[sha256sum] = "a18619e5ad18960fe382354eef33f070e57e4e5711d484b010acde080a003312"
+SRC_URI[sha256sum] = "0bd401c56f0eb1ca6251344c3a3d70bface3eccf9c67117cd184422c4cace30c"
 
 UPSTREAM_CHECK_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/"
 
-- 
2.25.1


