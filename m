Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1142AE728F0
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:10:06 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.27959.1696018200836532284
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:10:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EjHEMrEU;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-41807974fc1so77545451cf.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 13:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018200; x=1696623000; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HZjlMlYXB4wLMxoyAjQF4ae8JCfFqZiPGbgeXUtby2M=;
        b=EjHEMrEULqE/HECrjTBExBvudPZv7CqdR2HHczPrHZve6QPnjZUCdP93i506hojaTU
         KPXthpNsCN2OYdwAKobs+rDhh5zr616Ekx8dT7vZMVgxnwI6fK0+vUYFoXSZH1Hrle9W
         nWpZady8O1AzCsV9Ba+LnwmXLAR/WemYKfkHh2/Ta7l/RJ2LCdrYRjDT0UVWzC6cIZeL
         bemCGX+YyPcHKBtIWg/67HOGIl+pcaryJlCxJXY5RSfecf4N7YmV1Kko/Y4HT5hCNtVY
         qSnazERaMU3xeanO5OUwig+fDA+zn1AWd8oW2aRBZEF6gSG80JUmATgbmjURBx7lbS3Q
         jjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018200; x=1696623000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZjlMlYXB4wLMxoyAjQF4ae8JCfFqZiPGbgeXUtby2M=;
        b=MaLmeQxMvOBmDd4DbSmiDiij6SBZDfhXAmFcMFiibC8XGU4vwrORigxJUVN/Z+EySi
         y4eQeYSE2XRk3jYLDm4CzpoVBOb5uMm82GicKlhzN7thA2pOF2iqcoe/igbJYZ1thLvr
         guZj4ntBmW/azVZuEloVLHEEsqMSp9E1NDCMRjZjSOMjRiOdT19HqI6KksXk+nqcvYAd
         fJlH75zzXHCmWD25cvUKH8dstWeijhxn8uUSHA2LhSgjPlDci2786jUm7nE6R0fQ5DFp
         kgBx84IMmSqR/JZVngJHBk2PGv93EDazL0f6B+CIQz8BX9ehd5vclaRyonRbJrOJ7znq
         Tu3g==
X-Gm-Message-State: AOJu0YxCXOVtMV+5obs6J7BDKzUL/RrWBIbd7lY3r6n0FQhd/IuOG/qA
	mFyE81vhHKj/yJsFy5fYO34lZYlyg+RSjw==
X-Google-Smtp-Source: AGHT+IEo4EJIWKKykvNyL54VUGAVcyeDGNoHYkngZSMMDXb4M9WyWoSv8zKMyCNa4bkjXi02suRGNQ==
X-Received: by 2002:a05:622a:15c6:b0:417:dae9:b3d0 with SMTP id d6-20020a05622a15c600b00417dae9b3d0mr6011792qty.60.1696018199547;
        Fri, 29 Sep 2023 13:09:59 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id iv2-20020a05622a6f0200b004109086e54bsm4724497qtb.38.2023.09.29.13.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:09:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [PATCH 1/2 v2][meta-oe][meta-filsystems] zfs: update to v2.2.0-rc4
Date: Fri, 29 Sep 2023 16:09:56 -0400
Message-Id: <20230929200957.3516503-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 20:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105265

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Building against the 6.5+ kernel and headers resulted in a build failure
due to missing detected features. We can fix the issues by bumping to
2.2.0-rc4

Bumping zfs to version zfs-2.2.0-rc4-35-g229ca7d73, which comprises the following commits:

    739db06ce Tag 2.2.0-rc4
    4da8c7d11 Intel QAT 1.7 compatibility
    32949f256 Relax error reporting in zpool import and zpool split
    79ac1b29d ZIL: Change ZIOs issue order.
    7dc2baaa1 ZIL: Revert zl_lock scope reduction.
    5a7cb0b06 ZIL: Tune some assertions.
    400f56e3f dmu_buf_will_clone: change assertion to fix 32-bit compiler warning
    63159e5bd checkstyle: fix action failures
    7eabb0af3 Try to clarify wording to reduce zpool add incidents
    c65aaa838 Avoid save/restoring AMX registers to avoid a SPR erratum
    e99e684b3 zed: update zed.d/statechange-slot_off.sh
    1b696429c Make zoned/jailed zfsprops(7) make more sense.
    084ff4abd tests/block_cloning: rename and document get_same_blocks helper
    ab999406f Update outdated assertion from zio_write_compress
    d19304ffe zed: Add zedlet to power off slot when drive is faulted
    92f095a90 copy_file_range: fix fallback when source create on same txg
    645a7e4d9 Move zinject from openzfs-zfs-test to openzfs-zfsutils
    95649854b dracut: support mountpoint=legacy for root dataset
    895cb689d zfs_clone_range should return a descriptive error codes
    6bdc7259d libzfs: sendrecv: send_progress_thread: handle SIGINFO/SIGUSR1
    1e488eec6 linux/spl/kmem_cache: undefine `kmem_cache_alloc` before defining it
    c418edf1d Fix some typos
    df8c9f351 ZIL: Second attempt to reduce scope of zl_issuer_lock.
    bb31ded68 ZIL: Replay blocks without next block pointer.
    c1801cbe5 ZIL: Avoid dbuf_read() before dmu_sync().
    ffaedf0a4 Remove fastwrite mechanism.
    02ce9030e Avoid waiting in dmu_sync_late_arrival().
    0ae7bfc0a zpool_vdev_remove() should handle EALREADY error return
    bd1eab16e linux: zfs: ctldir: set [amc]time to snapshot's creation property
    b3c1807d7 readmmap.c: fix building with MUSL libc
    b5e245633 Check the return value in clonefile test
    c47f0f441 linux/copy_file_range: properly request a fallback copy on Linux <5.3
    12f2b1f65 zdb: include cloned blocks in block statistics
    4a104ac04 Tag 2.2.0-rc3
    c24a48063 BRT should return EOPNOTSUPP
    36d1a3ef4 zts: block cloning tests
    2768dc04c linux: implement filesystem-side copy/clone functions for EL7
    3366ceaf3 linux: implement filesystem-side clone ioctls
    5d12545da linux: implement filesystem-side copy/clone functions
    a3ea8c8ee dbuf_sync_leaf: check DB_READ in state assertions
    0426e1327 dmu_buf_will_clone: only check that current txg is clean
    8aa4f0f0f brt_vdev_realloc: use vmem_alloc for large allocation
    7698503dc zfs_clone_range: use vmem_malloc for large allocation
    b9aa32ff3 zed: Reduce log noise for large JBODs
    571762b29 Linux 6.4 compat: META
    991834f5d Remove zl_issuer_lock from zil_suspend().
    41a0f6627 ZIL: Fix config lock deadlock.
    c79d1bae7 Update changelog for OpenZFS 2.2.0 release
    70232483b Tag 2.2.0-rc2
    c5273e0c3 shellcheck: disable "unreachable command" check [SC2317]
    685ae4429 metaslab: tuneable to better control force ganging
    81be809a2 Adjust prefetch parameters.
    8a6fde821 Add explicit prefetches to bpobj_iterate().
    b6f618f8f Don't emit cksum_{actual_expected} in ereport.fs.zfs.checksum events
    51a2b5976 Don't emit checksum histograms in ereport.fs.zfs.checksum events
    8c81c0b05 zed: Fix zed ASSERT on slot power cycle
    b221f4394 Fix zpl_test_super race with zfs_umount
    e037327bf spa_min_alloc should be GCD, not min
    1a2e486d2 Don't panic if setting vdev properties is unsupported for this vdev type
    d8011707c Ignore pool ashift property during vdev attachment
    f5f5a2db9 Rollback before zfs root is mounted
    83b0967c1 Do not request data L1 buffers on scan prefetch.
    73ba5df31 Linux 6.5 compat: disk_check_media_change() was added
    1bc244ae9 Linux 6.5 compat: BLK_STS_NEXUS renamed to BLK_STS_RESV_CONFLICT
    931dc7055 Linux 6.5 compat: intptr_t definition is canonically signed
    5299f4f28 set autotrim default to 'off' everywhere
    f917cf1c0 Fix the ZFS checksum error histograms with larger record sizes
    56ed389a5 Fix raw receive with different indirect block size.
    e613e4bbe Avoid extra snprintf() in dsl_deadlist_merge().
    b4e630b00 Add missed DMU_PROJECTUSED_OBJECT prefetch.
    bf6cd3079 FreeBSD: catch up to __FreeBSD_version 1400093
    1266cebf8 FreeBSD: Fix build on stable/13 after 1302506.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2: fixed subject for patch 1/2

Khem,

With 6.4 going EOL upstream, I'm rushing in a bump to v6.5 for OEcore.

This is a bump for btfs that solves issues in my tesing.

Bruce

 meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
index a62a8a39b..db6f725b6 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE ="https://github.com/openzfs/zfs"
 
-SRCREV = "009d3288dea524c7ad373b04b65bee8bb6f0bfea"
+SRCREV = "229ca7d738ccbf4c55076977467ee93e20b6f01b"
 SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.2-release \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
            file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \
-- 
2.34.1


