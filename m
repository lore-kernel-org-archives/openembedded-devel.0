Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780DDC00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 17:35:22 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.1469.1659980120261647672
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aNQYVNrC;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id w6so6996822qkf.3
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=lSnObpr0gHE3gEKShcUIBEbfLtYOa3tXciNF+SAtgds=;
        b=aNQYVNrC8/KGoKUB8WrnOkQmCQtRbi8NJoYdF1O4g2mncDDZkH1EPiBeDOUGY/cpuZ
         5HzEfnLrZNJzCQyb7IpYcmObcj4XlrVGs10D+pw6Bl5VTGfcaJXVNrUui40t7zUqkEgP
         2ovxMYuITeMN09LSdEtWLmuq9xsUOjgj/6TDXWsMTVOZc8ZitsUJJDSMKpCxqinkgeD0
         UsBDWsbXhSU2tf3YIIaMiiUNx44qwVok5LqR+w6DmLaT/n9clc0aerF1Jlg1GYy1OPoK
         YBtvTrXQhFSbxpcUV9kmEKQ9HUd50ZHC4KgByEnGqy6IAKlZakfLknoy8DbojZVWMSYr
         rRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=lSnObpr0gHE3gEKShcUIBEbfLtYOa3tXciNF+SAtgds=;
        b=5/2lzWcdfSOTLQ1KZ5SYHChzaMCXxSNKmqkz+Qwmk6mt9a9+5VYzDZPO82wWfjQQm3
         tdhsup0iXmipejWm0qXte+QwJ/GeThdgODcd9a+2GNmkAZMbCVBKHp7W1wQ5lyYrrgbh
         CmtvaW5SuWHhqA3f2XgbEirhlQ5br4ggHT5IBDNZqyrKF62dxr7rP2MaoQHfLap0MwHo
         K8NpZE/MkuFsAqrHEYTXGzwZPsxonvIHmegMqwtnxA/4CtwUIK2BIL51YpfatTLHSyMK
         uw59NU456WyrUrNm671ehPVx5XP3LbN43phldfvuG6Gf+5MkB8gpTSybB2nyv7gA55ei
         2MEg==
X-Gm-Message-State: ACgBeo3CfhdlEtsopm1SVVPK+rY1KVRi4toajHNkID4BBwpzxHe26Df6
	pzkMw43Md78vZ4VbFAq6mKRhqcIbwaRfqg==
X-Google-Smtp-Source: 
 AA6agR4KuU3RaAVm10pYk4v1QdszxsZYej0ZVZeqf+3VXC3zAzCYkhpOOP6fA0h7G8aX2k46y0BqwQ==
X-Received: by 2002:a37:ea14:0:b0:6b9:4292:32e8 with SMTP id
 t20-20020a37ea14000000b006b9429232e8mr5918849qkj.196.1659980119121;
        Mon, 08 Aug 2022 10:35:19 -0700 (PDT)
Received: from localhost.localdomain ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 s18-20020a05620a29d200b006b58d8f6181sm10434368qkp.72.2022.08.08.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 10:35:18 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: raj.khem@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH][meta-filesystems] zfs: update to v2.1.5
Date: Mon,  8 Aug 2022 13:35:17 -0400
Message-Id: <20220808173517.871084-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 17:35:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98174

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to 2.1.5 primarily for kernel 5.19+ support. We refresh
one patch, and pick up the following changes:

Changes
  - Remove install of zfs-load-module.service for dracut #13574
  - FreeBSD: Silence clang unused-but-set-variable
  - Improve sorted scan memory accounting #13537
  - Corrected edge case in uncompressed ARC->L2ARC handling #13375
  - Remove wrong assertion in log spacemap #13486 #13513
  - libzfs: Fail making a dataset handle gracefully #13077
  - libzfs: mount: don't leak mnt_param_t if mnt_func fails #12968
  - Reject zfs send -RI with nonexistent fromsnap #12574 #12575
  - Linux 5.18 compat: META #13527
  - autoconf: AC_MSG_CHECKING consistency #13529
  - Linux 5.19 compat: asm/fpu/internal.h #13529
  - Linux 5.19 compat: zap_flags_t conflict #13515
  - Linux 5.19 compat: bdev_start_io_acct() / bdev_end_io_acct() #13515
  - Linux 5.19 compat: aops->read_folio() #13515
  - Linux 5.19 compat: blkdev_issue_secure_erase() #13515
  - Linux 5.19 compat: bdev_max_secure_erase_sectors() #13515
  - Linux 5.19 compat: bdev_max_discard_sectors() #13515
  - Linux 5.18 compat: bio_alloc() #13515
  - Silence unused-but-set-variable warning #13507
  - zed: support subject as header in zed_notify_email() #13440
  - rpm: Keep debug symbols if configured with '--enable-debuginfo' #13500
  - FreeBSD: libspl: Add locking around statfs globals #13484
  - Standardize RHEL version check in packages #13501
  - Modified ncompress requirement in RPM to exclude RHEL9 #13480 #13490
  - zed: Take no action on scrub/resilver checksum errors #13499
  - zdb: Fix handling of nul termination in symlink targets #13482
  - automake: don't install /e/d/zfs or /e/z/zfs-functions +x #13496
  - Multiple dracut module install script cleanups #13010
  - Remove absolute paths to udev rules and binaries for dracut #13010
  - Make dracut fail if essential files cannot be installed #13010
  - Make better use of dracut functions when building initramfs #13010
  - Fix compiler warnings about zero-length arrays in inline bitops #13463 #13465
  - Add missing AC_MSG_RESULT(no) to configure #13454
  - abd_os: remove redundant refcount creation for abd_children #13429
  - Fix functions without a prototype #13421
  - FreeBSD: use zero_region instead of allocating a dedicated page #13406
  - autoconf: Fail when __copy_from_user_inatomic is a non-GPL symbol #13389
  - PPC get_user workaround #11958 #12590 #13367
  - Adding ZERO_PAGE detection #13199
  - autoconf: Pretend CONFIG_MODULES is always on
  - kbuild: unify modules(_install) for in-tree and external modules #10832 #13361
  - Strengthen Linux kernel capabilities detection #13351
  - zvol_wait: Ignore locked zvols #10662
  - FreeBSD: Implement hole-punching support #12458
  - module: zstd: check we don't leak symbols; regenerate symbol map #12988 #13209
  - man: zpool-import.8: -d -or -c #13437
  - Reduce dbuf_find() lock contention #13405
  - contrib: dracut: remove getargbool polyfill #13291
  - Add dracut.zfs.7 #13291
  - contrib: dracut: zfs-needshutdown: don't list #13291
  - contrib: dracut: zfs-{rollback,snapshot}-bootfs: order after key loading #13291
  - contrib: dracut: don't require essentials to be under the same encroot #13291
  - contrib: dracut: inline single-use import_pool, move single-use ask_for_password #13291
  - contrib: dracut: zfs-lib: remove find_bootfs #13291
  - contrib: dracut: zfs-lib: simplify ask_for_password #13291
  - contrib; dracut: flatten zfs-load-key, simplify zfs-env-bootfs #13291
  - contrib; dracut: centralise root= parsing, actually support root=s #13291
  - contrib: dracut: parse-zfs: stop pretending we support FILESYSTEM= #13291
  - contrib: dracut: parse-zfs: drop initqueue-finished for i/f #13291
  - contrib/dracut: zfs-lib: export_all: replace with inline zpool export -a #13093
  - Remove REMAKE_INITRD #12781
  - Python 3.10 fixes, part 2 #12045 #12673
  - Silence unused-but-set-variable warnings
  - module: zfs: freebsd: fix unused, remove argsused #12844
  - FreeBSD: remove unused variable
  - zvol: remove unused variable #12917
  - fm: remove unused variables #12917
  - zvol: remove unused variable #12917
  - module/zfs: vdev_removal: spa_vdev_remove_thread: remove unused variable #12187
  - module/zfs: vdev_indirect: vdev_indirect_repair: remove unused variable #12187
  - module/zfs: dbuf: dbuf_read_impl: remove unused variable #12187
  - module/zfs: arc: arc_hdr_realloc_crypt: remove unused variables #12187
  - libzfs: zfs_send: remove unused variable #12187
  - libzutil: zpool_find_config: remove unused variable #12187
  - Skip spacemaps reading in case of pool readonly import #9095 #12687
  - zfs: holds: dequadratify #13372 #13373
  - Linux 5.18 compat: replace __set_page_dirty_nobuffers #13325 #13380
  - Fix O_APPEND for Linux 3.15 and older kernels #13370 #13377
  - Linux 5.18 compat: kobj_type.default_attrs replaced with default_groups #13357
  - FreeBSD: Fix translation from ABD to physical pages.
  - Corrected oversight in ZERO_RANGE behavior #13329 #13338
  - Document zfs inherit -S's interaction with noninheritable properties #11894 #13335
  - Linux 5.17 compat: GENHD_FL_EXT_DEVT / GENHD_FL_NO_PART_SCAN #13294 #13297
  - FreeBSD: Return Mach error codes from VOP_(GET|PUT)PAGES #13311
  - FreeBSD: Parameterize ZFS_ENTER/ZFS_VERIFY_VP with an error code #13311
  - libzfs: import: zpool_clear_label: actually fail if clearing l2arc header fails #13304
  - libzfs: sendrecv: always cancel progress thread in zfs_send_one() #11560 #13284
  - Linux 5.18 compat: use address_space_operations->readahead #13278
  - Linux 5.18 compat: blkg_tryget is moved to private headers #13278
  - Linux 5.18 compat: replace genhd.h with blkdev.h includes #13251
  - Linux 5.18 compat: 4-argument bio_alloc() #13251
  - FreeBSD: Use NDFREE_PNBUF if available #13277
  - Export minimal zfs_refcount interfaces #12613
  - Default to zfs_dmu_offset_next_sync=1 #12746
  - etc/systemd/zfs-mount-generator: serialise, handle keylocation=http[s]:// #12138
  - libzfs: diff: stream_bytes: use fputc, %hho formats chars #12829
  - zfs, libzfs: diff: accept -h/ZFS_DIFF_NO_MANGLE, disabling path escaping #12829

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 ...01-Define-strndupa-if-it-does-not-exist.patch | 16 +++++++---------
 .../zfs/{zfs_2.1.4.bb => zfs_2.1.5.bb}           |  2 +-
 2 files changed, 8 insertions(+), 10 deletions(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.1.4.bb => zfs_2.1.5.bb} (95%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch b/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch
index 8bb8b9479..80955b3ca 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs/0001-Define-strndupa-if-it-does-not-exist.patch
@@ -1,4 +1,4 @@
-From 54883e714b7fd1e7f4ce47eb1fc09adff35d561e Mon Sep 17 00:00:00 2001
+From cc0cd6f71f6ef96fca2d7b730a3f0f6722fec696 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 May 2022 12:15:22 -0700
 Subject: [PATCH] Define strndupa if it does not exist
@@ -7,17 +7,18 @@ musl e.g. does not supply strndupa, unlike glibc
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  etc/systemd/system-generators/zfs-mount-generator.c | 9 +++++++++
  1 file changed, 9 insertions(+)
 
 diff --git a/etc/systemd/system-generators/zfs-mount-generator.c b/etc/systemd/system-generators/zfs-mount-generator.c
-index b806339..592d2f9 100644
+index f4c6c26..255bee4 100644
 --- a/etc/systemd/system-generators/zfs-mount-generator.c
 +++ b/etc/systemd/system-generators/zfs-mount-generator.c
-@@ -47,6 +47,15 @@
- #define	STRCMP ((int(*)(const void *, const void *))&strcmp)
- #define	PID_T_CMP ((int(*)(const void *, const void *))&pid_t_cmp)
+@@ -193,6 +193,15 @@ fopenat(int dirfd, const char *pathname, int flags,
+ 	return (fdopen(fd, stream_mode));
+ }
  
 +#ifndef strndupa
 +#define strndupa(s, n) \
@@ -29,8 +30,5 @@ index b806339..592d2f9 100644
 +#endif
 +
  static int
- pid_t_cmp(const pid_t *lhs, const pid_t *rhs)
+ line_worker(char *line, const char *cachefile)
  {
--- 
-2.36.0
-
diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.5.bb
similarity index 95%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.1.5.bb
index dd676c945..6aa674c79 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.5.bb
@@ -7,7 +7,7 @@ HOMEPAGE ="https://github.com/openzfs/zfs"
 SRC_URI = "https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
 "
-SRC_URI[sha256sum] = "3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6"
+SRC_URI[sha256sum] = "1913041e5c44ff07ca384346ad8145aeedf77e77cd1cea9ec5d533246691e10c"
 
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
 # define a do_compile function.
-- 
2.25.1


