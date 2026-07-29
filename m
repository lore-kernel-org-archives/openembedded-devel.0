Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F146FC53200
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 06:05:02 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5336.1785305099901961573
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 23:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=APiuPJbn;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so648204a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 23:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305099; x=1785909899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dZR/G+8b8J1WgNCy4H2Qt5OJEdp/rNx/v0W5U1yS8Wk=;
        b=APiuPJbnBCYvdhXJyr3ksjn68DJgO4rrHRxoGEVDvK8CFb2yuFC5085EoL+6zxCZ6X
         IRCi2pUkFpaG6fRzPCwV/VYtonT9RPh7NNrDbLxP0WJlD2R1LjmPmgYmMwVE2LLwCwQ8
         NI3Cy4xkzlRWJ2UVT58geMyLFxDGVl4vSBogBIyUUYXN6JY3LIUlSxmzR+yzlXMEcbRk
         n4g+LLRG/Enjc/f1rdZerGOU7YUgm/D/D6SaZ3h+EPvTaIe3gMobs+4VPd/TdlVkjZ16
         bH5niw9vqOMoPoy4mGGzDrjdZEADcqaEDgBzWUmq4H4EYSMfE0WT2+fxIdsMCnWOFysv
         FMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305099; x=1785909899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZR/G+8b8J1WgNCy4H2Qt5OJEdp/rNx/v0W5U1yS8Wk=;
        b=sXTEXvYMna/e1LQS5En8Ou7rgQxuxJzdjf6qJjV561pijUNDDfDqkT04/fpgTsZZRD
         Y3h9+S0hfD8s/LwV4WUAuO6vEYb9mBpP+sQZEsLtkevQkQvtBbFlnk0WbZp/ms14qugT
         AXSauFqU21N81vUi6Ii4V9DCoF7I3FCumrP2MX/87E6ruSE1aLJDYBYkbZhpMCSR+plb
         VQr7Umn6YX/jcUC73ltC5J38oZNG+8nBs+WVhYw9wvgkynNINji63iHVbVom4BRmmGts
         Uz+Qxx7gmcMnGMKWjDUKRYl+YzxAci5HyLNGBSUiWShT0vXs0bq2wmnDZsrg0Jt/JQ6Z
         cNgg==
X-Gm-Message-State: AOJu0Yx/uqqM8felZ5QbpshX23qxsrlLcbrG3vbRQV7UIfhQNjz89q4U
	hk70bFyC4JJ3F4TzDGpnU6N6quJG8SFjYzbsCGNslG8BLQ97W7kqsUGrOxDT3s6x
X-Gm-Gg: AR+sD13v1VctOpkIJ+I2CGP5LCZskgKfv4zvUPwnCtiVzAxBH7S/wExSyuJnsxeO1k/
	7OxEXGVpTIhWDXluPQgXXhuj5/nfcgBUVDRsy9SnbFHlNGIvTi2iba+zm5DMMMnlileNGuJg0LT
	KJzSwquxP/FRTNRsctoZC3MbEXYejkuTZVaoG4JBtnBC9DumC/QQcBLjheMJq2L6LHCfnXKNuwc
	M+oYCO+Lq1lXjWuV3sMwIyywE9+3vOfLjHAPMCMXfYtsZ1DdqN9BEnebqjlEOLa9et8krwEc7EB
	NEshhbMtqcRqdP65oIpeQKa0O19zqRE676xx860+jdsUSoODRf5wwQnIuw92ZSRaPUBIdw7Fev9
	pbpGKrh8M5xTukI1x//a/gd+VwdaG76rj7t6LYSu+qUEv3TotrwjpS3MSSV5k7gE5tVMzyAkYuB
	5zqkSsO63uyBynUgayTsRQMKuR00x+Rr4hB3EJ8712H1p/7GUYeE31jJVsTOL6Wlm8JbrWgAmQn
	chXCjfYM/bSDafw4LKBVcWk76chLCgXEWE7gMKe3zcfbtl0eF491reEMaQXaGt3A5Sg08ZekVZf
	Cdy5tXvk1ic810bwgj87t9UE59a98XBlbLeiAU6YXUIuqI+TRO/Q0gEDs77DsswrWfNB4UT7A91
	LDg==
X-Received: by 2002:a17:90b:3b4a:b0:38e:7297:a931 with SMTP id 98e67ed59e1d1-38f6a4d6efdmr5374644a91.43.1785305099075;
        Tue, 28 Jul 2026 23:04:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412a92bsm2278342a91.5.2026.07.28.23.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:04:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 1/5] zfs: upgrade 2.4.1 -> 2.4.3
Date: Tue, 28 Jul 2026 23:04:51 -0700
Message-ID: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 06:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128544

Two upstream stable point releases. The "2.4.99" that the automated
version checker reports is the OpenZFS development/META tag on master,
not a real release; 2.4.3 is the newest 2.4.x stable.

2.4.2:
 * Linux mount API rewrite: a new fs_parse-based mount-parameter parser
   replaces the legacy options parser and zpl_parse_monolithic; support
   for the old mount API is removed and the build now refuses to build
   without fs_context. vfs_t lifetime is tied to fs_context.
 * Linux 7.0/7.1 compatibility: fs_context shims, explicit setlease
   handler (also for directories), posix_acl_to_xattr() allocation,
   blk_queue_nonrot()->blk_queue_rot(), removal of the minimum kernel
   version check.
 * dRAID fixes: checksum errors after rebuild with degraded disks,
   import failure after disk replacement, data corruption after disk
   clear, sequential-resilver reads from degraded vdevs.
 * Data-integrity fixes: read corruption after block-clone-after-
   truncate, range-tree corruption race in dnode_sync(), a
   use-after-free in dmu_write_direct_done(), "kernel BUG at
   mm/usercopy.c".
 * New feature: POSIX_FADV_DONTNEED support.
 * Build: SPDX tags + spdxcheck enforcement, "make dist" uses pax tar,
   objtool taken from $kernelbuild.

2.4.3:
 * Security/robustness hardening: enforce exact decompressed length for
   lz4/gzip/zstd, validate size fields/strings and reject un-terminated
   strings in packed nvlists, sharenfs invalid-character check, extended
   zfs_ioc_set_prop() secpolicy, key lookup failures always return
   EACCES, ZVOL encryption-key check for block cloning, and removal of
   /etc/sudoers.d/zfs.
 * Correctness: double free for blocks cloned after DDT prune, off-by-
   one in the redaction handler dropping the last block, several
   lock-ordering/lockdep fixes, FreeBSD cache_vop_rename panic fix.
 * Linux: properly apply ro/rw mount option to the superblock, Linux 5.6
   fs_parse API mismatch fix, spl_kvmalloc strips __GFP_COMP before
   vmalloc().
 * aarch64 build failure fixed by removing earlyclobber.

Supported kernel range is now 4.18 - 7.0.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../recipes-filesystems/zfs/{zfs_2.4.1.bb => zfs_2.4.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.4.1.bb => zfs_2.4.3.bb} (98%)

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.1.bb b/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.3.bb
similarity index 98%
rename from meta-filesystems/recipes-filesystems/zfs/zfs_2.4.1.bb
rename to meta-filesystems/recipes-filesystems/zfs/zfs_2.4.3.bb
index 5c02d58242..241ae19209 100644
--- a/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.1.bb
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.4.3.bb
@@ -4,7 +4,7 @@ LICENSE = "CDDL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
 HOMEPAGE = "https://github.com/openzfs/zfs"
 
-SRCREV = "1c702dda346a59e05cfd3029569bbb1d5d91c54b"
+SRCREV = "83020cf8259d057d4cc9102010c05f07ffdfc136"
 SRC_URI = "git://github.com/openzfs/zfs;protocol=https;branch=zfs-2.4-release;tag=${BP} \
            file://0001-Define-strndupa-if-it-does-not-exist.patch \
            file://aaf28a4630af60496c9d33db1d06a7d7d8983422.patch \

