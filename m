Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE1FDC46CD4
	for <webhook@archiver.kernel.org>; Sat, 30 Dec 2023 03:16:02 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.175328.1703906160397805895
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 19:16:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIDb1NBs;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-427f5cc49afso13252281cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703906159; x=1704510959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8g6yR1YvrQfaOw3M8HGKOYTRDYjmBWbTHycMnKiRU9M=;
        b=TIDb1NBsvIQS+qCEllYeHTqG3diynEsgaHEWxlfQ2As+RlUz4X1TQDmlTevHpREc4i
         8sZhk56acgaQfqv7r6YuvwC9ku2kVHq3QqFRHku4U7+OQirqhhzTigi2BtGlcAHT04B8
         bOt2J3q0FF/cAtEu1gnoUPEQ4MnwFScjrklkjJk3AsFuPA1UjoUuHzl2XcC1r/8klyrG
         91BpSFJV1tfKAZWlVHMi04ugb6JeYmS09bL0puwmLLIbxP3H1hdfEOS2mndvr+mEG6Mk
         /SJT2eaV1KnWi7NXpi86rZuoz2VI5ZqO/HthNK59rSr6LBT7yfjLh1vIxOeFVGL/jqad
         RjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703906159; x=1704510959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8g6yR1YvrQfaOw3M8HGKOYTRDYjmBWbTHycMnKiRU9M=;
        b=JZNNVYYUy9TtuKb2iCJLmN3C9w/uEAfCdCUWg9Ovy80qUZOzc9DDt96tPrfiX9beOl
         MemHR0yhWya0Uzqbiekkz8vO81+2gg0XhxVRE97qAUBani2XjJOHQadbfObD7krqG6qI
         e9+RjHm8pjqceXcCNrPPauw4TprhFyU/kImy3QE3yBEqjJ7fJNC/ixwcScptfJJOZS3A
         CAkG2sXcjMa7eVJnYIZbOgT7bk2cyMRWic8OcRV5wR5p3dlDv9Q5FBMvFWbE+5bSnyFh
         /DT2H7O6p9aBUs0y2dKZrkE4udohBKyr1uXQ1NDrAp5HMEpPDzv2Y7Dhg97O3mRF6bXg
         Q0vA==
X-Gm-Message-State: AOJu0Yw8K48WpgWrLpSigSRsvL1oDLC6KlAEcs19lYpBiOZQ/Be5u/oB
	5rtaEU4NaOtGi7jGHf2tRlylEW7q6YzFBQ==
X-Google-Smtp-Source: AGHT+IEPfEUV9FO1RKf4mY8nH++IB/Y0Rj6+Zve9Nq6BIFs4E6gCVcptx1qpczDt4KwDOsX9oeuoyg==
X-Received: by 2002:ac8:5f8c:0:b0:425:8a27:4bef with SMTP id j12-20020ac85f8c000000b004258a274befmr21129416qta.34.1703906158986;
        Fri, 29 Dec 2023 19:15:58 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id cp10-20020a05622a420a00b00427cd0b90c8sm6541016qtb.53.2023.12.29.19.15.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 19:15:58 -0800 (PST)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] zfs: update to 2.2.2
Date: Fri, 29 Dec 2023 22:15:57 -0500
Message-Id: <20231230031557.1915729-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Dec 2023 03:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107905

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In addition to the zfs upstream commits:

  - This fixes the build against libc-headers/kernel 6.6+
  - adds bash-completion packaging, as 2.2.2 has support

Bumping zfs to version zfs-2.2.2, which comprises the following commits:

    494aaaed8 Tag zfs-2.2.2
    522414da3 FreeBSD: Fix ZFS so that snapshots under .zfs/snapshot are NFS visible
    a8c256046 ZIL: Call brt_pending_add() replaying TX_CLONE_RANGE
    eb34de04d zdb: fix printf() length for uint64_t devid
    d813aa853 Linux 6.6 compat: fix configure error with clang (#15558)
    3b267e72d zfs-dkms: fix shell-init error message
    349fb77f1 FreeBSD: Fix the build on FreeBSD 12
    2a953e0ac dmu_buf_will_clone: fix race in transition back to NOFILL
    e4985bf5a zdb: Fix zdb '-O|-r' options with -e/exported zpool
    e96675a7b zdb: show BRT statistics and dump its contents
    d702f86ea brt: lift internal definitions into _impl header
    41c4599cb ZTS: Fix zfs_load-key failures on F39
    56a2a0981 ZIL: Do not encrypt block pointers in lr_clone_range_t
    9b9b09f45 dnode_is_dirty: check dnode and its data for dirtiness
    89fcb8c6f Revert "Tune zio buffer caches and their alignments"
    55dd24c4c Tag zfs-2.2.1
    78287023c ZTS: Fix 'could not unmount datasets' on Alma 9
    479dca51c zfs-2.2.1: Disable block cloning by default
    87e9e8286 Add a tunable to disable BRT support.
    0733fe2aa Packaging: Auto-generate changelog during configure (#15528)
    fd836dfe2 Linux 6.6 compat: META
    e92a680c7 Workaround UBSAN errors for variable arrays
    f1659cc78 ZTS: Test for all known zpool feature sets
    f863ac3d0 Update zpool-features.7 for grub2 compatibility list updates
    f6d2e5c07 Workaround to allow openzfs-zfs-dkms install on Ubuntu
    f2fe4d51a Linux: reject read/write mapping to immutable file only on VM_SHARED
    76663fe37 Fix accounting error for pending sync IO ops in zpool iostat
    44c8ff9b0 Linux 6.6 compat: fix implicit conversion error with debug build
    f0ffcc3ad Remove obsolete_counts from grub2 compatibility list
    e534ba5ce Fix dkms installation of deb packages created with Alien.
    1c7048357 Add all read-only compatible zpool features to grub2 compatibility
    3ec4ea68d Unify arc_prune_async() code
    bd7a02c25 Tune zio buffer caches and their alignments
    e82e68400 DMU: Do not pre-read holes during write
    3f67e012e Linux 6.6 compat: fsync_bdev() has been removed in favor of sync_blockdev()
    21875dd09 Linux 6.6 compat: generic_fillattr has a new u32 request_mask added at arg2
    fe9d409e9 Linux 6.6 compat: use inode_get/set_ctime*(...)
    7aef672b7 Read prefetched buffers from L2ARC
    f9a9aea12 Add mutex_enter_interruptible() for interruptible sleeping IOCTLs
    8ba748d41 Revert "zvol: Temporally disable blk-mq"
    e860cb020 zvol: Remove broken blk-mq optimization
    86c3ed40e "ARC prefetch metadata accesses:" appears twice in the output.
    6e41aca51 Trust ARC_BUF_SHARED() more
    79f7de575 Remove lock from dsl_pool_need_dirty_delay()
    0ef1964c7 run-zts test procfs/pool_state failed with uncorrectable I/O failure
    eaa62d995 Properly pad struct tx_cpu to cache line
    8ca95d78c Fix typo in  tests/zfs-tests/tests/functional/cli_user/misc/misc.cfg
    edebca5df FreeBSD: taskq: Remove unused declaration
    1cc1bf4fa Set spa_ccw_fail_time=0 when expanding a vdev.
    0bcd1151f Fix ZED auto-replace for VDEVs using by-id paths
    78fd79eac Add zfs_prepare_disk script for disk firmware install
    6d693e20a Large sync writes perform worse with slog
    b76724ae4 FreeBSD: Improve taskq wrapper
    459c99ff2 Fix block cloning between unencrypted and encrypted datasets

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-filesystems/zfs/{zfs_2.2.0.bb => zfs_2.2.2.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.2.0.bb => zfs_2.2.2.bb} (96%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
similarity index 96%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
index db6f725b6..d3ea6797e 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.2.bb
@@ -4,7 +4,7 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE ="https://github.com/openzfs/zfs"
 
-SRCREV = "229ca7d738ccbf4c55076977467ee93e20b6f01b"
+SRCREV = "494aaaed89cb9fe9f2da3b6c6f465a4bc9f6a7e1"
 SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
            file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
@@ -16,7 +16,7 @@ S = "${WORKDIR}/git"
 # Using both 'module' and 'autotools' classes seems a bit odd, they both
 # define a do_compile function.
 # That's why we opt for module-base, also this prevents module splitting.
-inherit module-base pkgconfig autotools
+inherit module-base pkgconfig autotools bash-completion
 
 DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl curl"
 
-- 
2.39.2


