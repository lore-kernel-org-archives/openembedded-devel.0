Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E552E728E0
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 19:50:45 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.27369.1696017039764164165
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Sep 2023 12:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M3QKGSqr;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-77575531382so308040385a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 12:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017038; x=1696621838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OfCr3VCUXOTvkidFYKysTqrHCaWibGTd6oCx87qsSG4=;
        b=M3QKGSqrbLJ3fN9SOaht5VCexGkzRRSNRwprtbd2NE/Ur+if/4TdMuNW57II5pY2Zw
         cswI/EVMar7Zfj/CkVx0EILuIjPi6pEewlTeXORdRFd1J7iw8psKH1qiJdSKyGZ+fQno
         iq7RzOxms0uzr3oV/rd9zltseOkZc09MCm3b42zkEgAkWOqCyWzLHwYLdtqR1V6fEUrO
         N9zxbGUv1zu/BWoza3NKKmw7Cgi6tajEWDtOrobjKC9TzJE2PlVywsMjlOzWTt/6O8wC
         i3iu5a1TFK5YJ/WhHhQwSzz7JIFv688FkF9iSc8RVpkcSHS9AaQZtkFS6wCRaoB7lsYM
         6uFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017038; x=1696621838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OfCr3VCUXOTvkidFYKysTqrHCaWibGTd6oCx87qsSG4=;
        b=lus9ph6Vp/aK19MEjyMm0IjHhyILvviEExE2aRfyUpHsO2sGrzM5+gb8Q4frULxskk
         +DrkcZ1xCrNngh4yZ+QHn1vED+NoWmLjbjfYzx4F0v2YZ4v3GWGmxKt5xEilam0cQEeI
         Pjmew56mtCAML7c1dfsMhoA4wm9/Hz8LacvpKa37/bw0eobU9spwr99r3yd25biOc9u4
         uxKkhcCcw3AVuaaG9Ttmmj7Y08EWYKqcRfzs8D6hZSejXR6c2dWJQFHFlrZf+zq6Qxky
         3ETMyOxwCmRfqjEd/8TfcHoKgA/q3pOiZOF7phVOqPZkmepPXF66JC0n8ZgLi1BzvX5T
         E3Dw==
X-Gm-Message-State: AOJu0YzbRmmOK4PaJECEpRgKj/JXs2QEr+h/8BEXiVt8t5/mXuT7HzGR
	lmTAeSJsebtmJwQRG5eed16teAUBjlKaug==
X-Google-Smtp-Source: AGHT+IEqEGToemeahtJYADu71FFzb+xO+vm55AmP7WFEvV5EXUf4mMggxy2YwDSvwmO0FwdZJAUerA==
X-Received: by 2002:a05:620a:1998:b0:775:6e49:3320 with SMTP id bm24-20020a05620a199800b007756e493320mr6358211qkb.54.1696017038354;
        Fri, 29 Sep 2023 12:50:38 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id x14-20020ac8538e000000b0040331f93ee0sm3283472qtp.77.2023.09.29.12.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:50:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: /home/bruce/rr.meta-oe/0002-vboxguestdrivers-fix-kernel-v6.5-build.patchFrom 2981fa9167f70444f657c53d80f23496b209b5bd Mon Sep 17 00:00:00 2001
Date: Fri, 29 Sep 2023 15:50:34 -0400
Message-Id: <20230929195035.3515540-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Sep 2023 19:50:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105261

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


