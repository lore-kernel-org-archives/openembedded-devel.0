Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB8CC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 06:05:13 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5338.1785305103235799848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 23:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZdH29V9M;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-381216921aaso526963a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 23:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305103; x=1785909903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WrNgSz7sPIle6GTsAbgVgiztK5Mz+y5ugEX9PG2ZLHE=;
        b=ZdH29V9M2jORQXGh8PNt2T63RsY+bCXyYmFxIFMUYXVGIVAo2bjepj8YVxJ90hI7AG
         doq6NUaahm9JhPmrpihiAuJIlmvhsw7Nix2mVoMUS/Bn33Ia1ckkgvTykWNLKFT4Q3U4
         0XSm6y9FD5uyGlk23p6u4z5l253/IcSWnzsQYRWpsUV1k17x1J/EB7Me/Yfb8UYGCHfy
         ttXDocotJ4Hv9qzuRtHVO2to4/G41AeqWmW6uI3Tns5N61qBJKQJHFFbCXYFfUxBjfFw
         vMmutQYymRBzUxcU3StFaXTaokT034isLnl/N3DrNMCy1HMNOOEkS9fYJdx9CiRcwxYG
         ByVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305103; x=1785909903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WrNgSz7sPIle6GTsAbgVgiztK5Mz+y5ugEX9PG2ZLHE=;
        b=IAB71FPfYeWEtOomt/QX6A9LBI6UYhw64NktznuuVW0ZLa8cI8wrNygo02jKwusN00
         64dT08IXeujlVtaLp4Zvx9POssUZjlF278AlkXzpChG9SRlGvTV8WFOqVTWu9pELbEgk
         K0gEEDjpCPGR4Dfw1lARq3wuSQhmLVovQm79kblVxAEQaBeUm7rLqHXtcH82S30FRYzm
         FN3pMhLMc6L76GPnWLNhEQjj5c1VdCv5/dSjFAiULASIDn8El94/MoWV7e+U6rSvX9+U
         fbMVSK5TecwucMBpyl/ArDSOOor6+vo6190pXFAtdRjKFUMnzmUluGJKTq7SGwrUE9mJ
         yAZw==
X-Gm-Message-State: AOJu0YyXNbwo3fvBo7Zc9ETN9L8hT1Foys/ls5XeyqPehClfOoxN6Yhj
	bugvz2aRF+sI2DZa2bqsA49z3KWXmgb3+tyW7Waq/gT+vHIHQFHIb+IT8JLqVS4s
X-Gm-Gg: AR+sD12JZT9jXFya4T92cRu/uOu6vI4OzdF15XQtGcgE0pjBRgiNxuipOXf0U9KDxVv
	q9CwsZHnJuDnCOWjP4HgsGjKiggYBWYIaJ8g57+fAcfpOtL2SdLWf7HqwEI2M1Ah6AvQdJHBf17
	xQ1mLZwyG+Os2SK8lEiH9ozmSrvDuzvJk9Li0sPS7ajSfLbXKyDj+CU++t2CuBmPlw03JKGdAul
	yYU1ehDijpOQgkpNOaK5oK2AFBh2J2HsGnbx0CW8VM4L0RF4NHlB+1lZHE0NRWxch0VOjqgEmYH
	Nh5iT6q6rR7wPEKs6uhK5aAAzJSrPe67O314gWh1/6kFS7pR/kVWGPS4Xi3Yi3ssTBJnUBvFsas
	ia9Aq/da+qtBJMeIMEIF8M5K+qmqj5rL8b8KaKFhCb74GmTKG+nBaQlVMcBtBzJGWR7/Rof8u84
	sx8/6pk3+mGK4criMrAY01eGmunbPPlX4BCO8jbxTuCsA7B9xeVPWv+4k8lmfF7LacmVvYf/WEN
	n/EmNQ4puB255pACwxRGM622k6FmdvNS6DNf6WbO3AtvsoR0vVQUbTW7fMOv4t19mTxMO4r7D2c
	1KGEOgwa0Axsh5g5HtQWCoeBZzyn/ttFfiRTGPSj1fCFhTPs+bddIJBofEkwfPNM/EgYjv4IWoK
	N2w==
X-Received: by 2002:a17:90b:4ad0:b0:38e:8050:e63a with SMTP id 98e67ed59e1d1-38f6a30cf17mr4828584a91.6.1785305102457;
        Tue, 28 Jul 2026 23:05:02 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412a92bsm2278342a91.5.2026.07.28.23.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:05:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 4/5] xfstests: upgrade 2025.04.27 -> 2026.07.21
Date: Tue, 28 Jul 2026 23:04:54 -0700
Message-ID: <20260729060455.3993973-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
References: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 06:05:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128547

387 commits across 21 fortnightly releases (739 files changed,
+16397/-2042). 114 new tests added (xfs x44, generic x32, btrfs x16,
f2fs x14, ext4 x3, overlay x2, selftest x2, ceph x1) and one removed
(xfs/539).

Major themes:
 * Multi-block atomic writes: new common/atomicwrites, fio atomic-write
   helpers, fsx atomic-write support, and O_[D]SYNC / sudden-shutdown /
   bigalloc / hardware-AWU atomic tests.
 * XFS zoned / RT-device work: common/zoned with zloop helpers, zoned
   growfs, zone-alignment mkfs checks, zone GC low-space, external and
   internal realtime device support.
 * New xfs_healer test family (background repair service).
 * file_getattr(2)/file_setattr(2) support (new src/file_attr.c,
   AC_HAVE_FILE_GETATTR probe), VFS delegation tests, and a new
   fsnotify/fanotify error-reporting helper (src/fs-monitor.c).
 * Infrastructure: treewide $MOUNT_PROG -> _mount conversion, temp
   files moved to $TMPDIR, systemd-coredump collection in check.

Build-system: configure.ac gains AC_HAVE_FILE_GETATTR and a
btrfs_ioctl_received_subvol_args type check; src/Makefile adds
unlink-fsync, truncate, rw_hint, fs-monitor, btrfs_ioctl and a
conditional file_attr target. No new link libraries, so no DEPENDS
change is needed. LICENSE checksum unchanged.

Recipe patch changes:
 * Drop 0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch:
   its rationale (glibc sys/mount.h vs linux/mount.h clash reached via
   src/vfs/utils.c) no longer applies because utils.c no longer includes
   sys/mount.h, and the src/Makefile hunk no longer applied anyway.
 * Add 0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch:
   glibc 2.43 defines F_GETDELEG/F_SETDELEG but neither glibc nor the
   kernel UAPI declares struct delegation, so tying the struct to the
   "#ifndef F_GETDELEG" guard leaves it undefined and locktest fails to
   build with "variable has incomplete type 'struct delegation'".

Also bump the bundled unionmount-testsuite by one commit
(dir-weird-open-dir.py adjusted to the upstream kernel).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...tie-struct-delegation-to-the-F_GETDE.patch | 52 +++++++++++++++++++
 ...unts_propagation-and-remove-sys-moun.patch | 31 -----------
 ...s_2025.04.27.bb => xfstests_2026.07.21.bb} |  6 +--
 3 files changed, 55 insertions(+), 34 deletions(-)
 create mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
 delete mode 100644 meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2025.04.27.bb => xfstests_2026.07.21.bb} (93%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
new file mode 100644
index 0000000000..4139b9fd94
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
@@ -0,0 +1,52 @@
+From 784139a16a03cd0c6486e4b587b995e9d5ab21dd Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Wed, 29 Jul 2026 05:10:29 +0000
+Subject: [PATCH] locktest: do not tie struct delegation to the F_GETDELEG
+ guard
+
+glibc 2.43 added F_GETDELEG/F_SETDELEG to <bits/fcntl-linux.h>, but it
+does not declare struct delegation and neither does the kernel UAPI.
+
+locktest.c defined struct delegation inside "#ifndef F_GETDELEG", which
+assumes that any libc providing the fcntl commands also provides the
+struct. On glibc 2.43+ the guard is taken, the struct is never defined
+and the build fails:
+
+  locktest.c:1065:20: error: variable has incomplete type 'struct delegation'
+  locktest.c:1365:23: error: variable has incomplete type 'struct delegation'
+  locktest.c:1615:20: error: variable has incomplete type 'struct delegation'
+
+Keep the F_GETDELEG/F_SETDELEG fallbacks guarded, but define the struct
+unconditionally since no libc declares it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/locktest.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/locktest.c b/src/locktest.c
+index 54ee1f0..e24a0fe 100644
+--- a/src/locktest.c
++++ b/src/locktest.c
+@@ -80,13 +80,18 @@ extern int h_errno;
+ #ifndef F_GETDELEG
+ #define F_GETDELEG	(1024 + 15)
+ #define F_SETDELEG	(1024 + 16)
++#endif
+ 
++/*
++ * glibc 2.43 added F_GETDELEG/F_SETDELEG to <bits/fcntl-linux.h> but it does
++ * not declare struct delegation, and neither does the kernel UAPI. Therefore
++ * the struct definition cannot be tied to the F_GETDELEG guard above.
++ */
+ struct delegation {
+ 	uint32_t d_flags;
+ 	uint16_t d_type;
+ 	uint16_t __pad;
+ };
+-#endif
+ 
+ static char	*prog;
+ static char	*filename = 0;
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
deleted file mode 100644
index 9fdf69ff46..0000000000
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 340e708f79b824816aacfa74e330d8acdafc5129 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 14 Aug 2022 13:33:05 -0700
-Subject: [PATCH] Drop detached_mounts_propagation and remove sys/mount.h from
- vfs/utils.c
-
-with glibc 2.36+ sys/mount.h conflicts with linux/mount.h and here
-linux/mount.h is included via xfs/xfs.h header and we need sys/mount.h
-for the mount() API prototype. Until thats resolved lets not build this
-testcase
-
-Upstream-Status: Inappropriate [Libc specific Workaround]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 6ac72b36..5472ba66 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -34,7 +34,7 @@ LINUX_TARGETS = xfsctl bstat t_mtab getdevicesize preallo_rw_pattern_reader \
- 	dio-invalidate-cache stat_test t_encrypted_d_revalidate \
- 	attr_replace_test swapon mkswap t_attr_corruption t_open_tmpfiles \
- 	fscrypt-crypt-util bulkstat_null_ocount splice-test chprojid_fail \
--	detached_mounts_propagation ext4_resize t_readdir_3 splice2pipe \
-+	ext4_resize t_readdir_3 splice2pipe \
- 	uuid_ioctl t_snapshot_deleted_subvolume fiemap-fault min_dio_alignment
- 
- EXTRA_EXECS = dmerror fill2attr fill2fs fill2fs_check scaleread.sh \
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2026.07.21.bb
similarity index 93%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2026.07.21.bb
index 9e86b77c5e..e03290aaa0 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2025.04.27.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2026.07.21.bb
@@ -2,17 +2,17 @@ SUMMARY = "File system QA test suite"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"
 
-SRCREV = "92c428db1fe3fa4f7bd2593788bc9b71403d59ae"
-SRCREV_unionmount = "c6ab621ac19f2b96d34cd98f244e611750e2bb23"
+SRCREV = "f8833996b76765e9f1e5650fc77470e92fcf8a82"
+SRCREV_unionmount = "f48a57d2a7db5f86ff3dbc4444c3c3041e182d7d"
 SRCREV_FORMAT = "default_unionmount"
 
 SRC_URI = "git://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git;branch=master;tag=v${PV} \
            git://github.com/amir73il/unionmount-testsuite.git;branch=master;protocol=https;name=unionmount;destsuffix=unionmount-testsuite \
            file://0001-add-missing-FTW_-macros-when-not-available-in-libc.patch \
-           file://0002-Drop-detached_mounts_propagation-and-remove-sys-moun.patch \
            file://0001-include-libgen.h-for-basename-API-prototype.patch \
            file://0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch \
            file://0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch \
+           file://0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch \
            "
 
 

