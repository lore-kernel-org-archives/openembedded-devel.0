Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13031.1793717616991729553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Nov 2026 06:53:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=gIHW1Vlh;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso27412465e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 06:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793717615; x=1794322415; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/AvDmAyHpqixkWNESW/a6JngcFxYic43GHt01K6Mhc=;
        b=gIHW1VlhiReQ+/YRNaDKSBtGlG0xGyeXyP9q/ZDrnITemWYykB9hVHg0LWMYl4/gu9
         dsihw/QpS3TzRCFl4Dy1Me/LMmeUA3cf/JyVIyY4Z6fLXOBCBkjwdBS4k6vGX6x0fOAB
         AbX79JQcm24Fx/kpgnls6m6w9bGS1+slSYDMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793717615; x=1794322415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3/AvDmAyHpqixkWNESW/a6JngcFxYic43GHt01K6Mhc=;
        b=CyTUQPrBW18jP10/Zik+Lvwd5ZqVCVz/b0F4ouynHEOcUo99hKlPQXEUOAEYMJdhlB
         DjoAz9FpjLPLq9182TIBD8a4R/nIvSWp3aDr5ghzgds7VhJlkRTNUFrfzNroyT6APhHy
         tlPfsANABSHJrm+AfN3ZOZZi20pldBiCHP3ekXp5/jfLTP8kGKlrzu9+CbPNMCipPKct
         JgPqicD8hXbBo53yszSxN5nGidSHyTIqKvVns7fPPtRORCloJtjA3ndbChv6m9qvk4R3
         KwCqI+94FaC8NvLlYxlU6uECR78pxgbizBAqeHaLo6sGwJ0xkGtOKX2ontbwUYPFQ8oA
         3XPg==
X-Gm-Message-State: APuU4Z8Bk4k/k1X5Q0AuwpDbDwNr36N0bVzP3Hw+OpIIi9G1SY70D+4w
	ehiuEutE8owLdaiwcjTr2wJEsoxE/8AyPAacqATHuir4PhMEFExorC8yC+Hbk7q/GJudMT9jy5/
	BP3Az
X-Gm-Gg: AYBFou1MxJK2XICKbD6Blakalv3GoFPZz9Hp+MjA/l+Ha6UHqPEbriypJEuWLbpX1bB
	dF6py4WMh3NhVGCkVdKK3KO05rv7ZyGBL8mmEAwGQ/VkDmz9ZVO0ioV96BNhoJtyyqtgY7rGYaQ
	CbH8FdGlhSpVLqSarM0RkcPdIlfLcJGNjU8J5OoF+LWvhVfkRygRNLPsmeg9NSv6EZPvXa876DP
	Whcf5dvr1zaVnabTjiO0yAZSMYJQP24Wb6avqPMEtklhk3VOVO3McYCFfvoKY3iDbUCUhGIKzkI
	rrspsgqNkkyu+IQubyb5x4I8VTeRNTh1tLxbPWPtCn27Bva44E6yt7ecSVV0xCAOo0N/Et28NcB
	eLDkMCowzqoD12UBjmBIe16EV8c8kAJpCz8Dr3DU8NZ8U2EB45nX4NYzmJUhhdHeofSDrUPdT8i
	PoUwS6TA+dgUmDodT9ktbup6NIn5VmGB7QUXNt2tooTQGtQIBqi2WR4dhupM5phQkDRUaaUSWg7
	9zt1uqsvXsS7VoTaXL5YpGG8zrs0rFCrgnJK8mFg18QnxZP35T+FYTi6AsgJGEvJ0lLUv2xpxGe
	EGePX+V8uHo2B8y1pnk4uz8fWs+06d/6ONTOJnbKcD5JtKHBT0sQ3fGRkWBBHDk2bMeDvcR0jo5
	Jnl7tXdy7j4UptHoqeh0dWRMe77mJhh6fA50Zg2b5ctelYc9G9XRwFw==
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr296702025e9.28.1793717615110;
        Tue, 03 Nov 2026 06:53:35 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab3ea6a9sm94336685e9.15.2026.11.03.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:53:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-filesystems][PATCH 2/3] xfstests: Upgrade 2026.06.21 -> 2026.09.22
Date: Tue,  3 Nov 2026 16:53:27 +0200
Message-ID: <20261103145328.1973965-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103145328.1973965-1-leon.anavi@konsulko.com>
References: <20261103145328.1973965-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 14:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131792
Content-Type: text/plain; charset="utf-8"

Upgrade to release 2026.09.22:

- generic: test bdev freeze count leak on nested thaw
- btrfs/255: add _cleanup function to kill the balance stress
  process
- common/btrfs: exercise all algorithms in _btrfs_stress_defrag()
- common/btrfs: exercise all algorithms in
  _btrfs_stress_remount_compress()
- btrfs: test that we don't create pointless compressed inline
  extents
- overlay/081: add missing _require_scratch check
- btrfs/273: add missing _require_scratch check
- common/btrfs: require scratch before checking encoded reads
- f2fs/015,016: add missing _require_scratch checks
- generic/590,735,795: add missing _require_scratch check
- common: strip attr 2.6.0 --restore safety warnings
- generic/760: enable sub-block reads
- generic/263: enable sub-block reads
- generic/091: enable sub-block reads
- min_dio_alignment: add a -r option to query read alignment
- statx.h: update to latest kernel UAPI
- generic: test corruption detection using T10 protection
  information
- generic: test I/O on devices with T10 protection information
- add a "pi" group
- common: add a _sysfs_block_integrity_path helper
- common: factor out a _bdev_disk_name helper
- common/scsi_debug: don't slow down I/O
- f2fs/009: fix race condition in orphan inode test
- common/rc: remove trailing space from _mread() default map_len
- common: fix spelling of SCRATCH_DEV_POOL
- f2fs/024: add missing execute permission

Upgrade to v2026.09.22, not v2026.10.15 because the latter's
commits are still on branch for-next and have not yet merged to
branch master.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ssing-FTW_-macros-when-not-available-in-libc.patch |  9 +++------
 ...e-uint32_t-instead-of-__uint32_t-to-fix-buil.patch |  2 +-
 ...-include-libgen.h-for-basename-API-prototype.patch |  7 ++-----
 ...-do-not-tie-struct-delegation-to-the-F_GETDE.patch |  4 ++--
 ...ing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch | 11 ++++-------
 ...onitor-include-linux-types.h-for-__s32-__u32.patch |  6 ++++++
 ...-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch |  6 ++++++
 ...{xfstests_2026.06.21.bb => xfstests_2026.09.22.bb} |  2 +-
 8 files changed, 25 insertions(+), 22 deletions(-)
 rename meta-filesystems/recipes-utils/xfstests/{xfstests_2026.06.21.bb => xfstests_2026.09.22.bb} (98%)

diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-add-missing-FTW_-macros-when-not-available-in-libc.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-add-missing-FTW_-macros-when-not-available-in-libc.patch
index 5e230e2cfb..f1346b17b0 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-add-missing-FTW_-macros-when-not-available-in-libc.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-add-missing-FTW_-macros-when-not-available-in-libc.patch
@@ -1,4 +1,4 @@
-From 5facddc332c5ff8330f93c0a7e1b7f6d7bbd24a3 Mon Sep 17 00:00:00 2001
+From eb72d9e6b07d8ec4fa934fbccd52fe5774100651 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 5 Nov 2023 08:31:21 -0800
 Subject: [PATCH] add missing FTW_ macros when not available in libc
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/src/global.h b/src/global.h
-index 49570ef1..1c247488 100644
+index e07b3703..3036b504 100644
 --- a/src/global.h
 +++ b/src/global.h
-@@ -190,4 +190,16 @@ roundup_64(unsigned long long x, unsigned int y)
+@@ -210,4 +210,16 @@ roundup_64(unsigned long long x, unsigned int y)
  	return rounddown_64(x + y - 1, y);
  }
  
@@ -36,6 +36,3 @@ index 49570ef1..1c247488 100644
 +#endif
 +
  #endif /* GLOBAL_H */
--- 
-2.42.1
-
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch
index 6ac2dd92b4..3f2b98a888 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-bstat-use-uint32_t-instead-of-__uint32_t-to-fix-buil.patch
@@ -1,4 +1,4 @@
-From c3cc5c68a297a98adb9a7046c7563d0678245243 Mon Sep 17 00:00:00 2001
+From be39c148a62cc89719604a17ed8cbccdf224dd65 Mon Sep 17 00:00:00 2001
 From: Martin Jansa <martin.jansa@gmail.com>
 Date: Sun, 27 Apr 2025 20:29:09 +0200
 Subject: [PATCH] bstat: use uint32_t instead of __uint32_t to fix build with
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch
index 1570f3131f..eaeefc0506 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-include-libgen.h-for-basename-API-prototype.patch
@@ -1,7 +1,7 @@
-From 37caab7a43da5ede0ff1eb700f0257a213ac4b18 Mon Sep 17 00:00:00 2001
+From ddfc3f99d3e423520b08d8efcc7a373c98492b7f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 25 Mar 2024 10:46:50 -0700
-Subject: [PATCH 1/2] include libgen.h for basename API prototype
+Subject: [PATCH] include libgen.h for basename API prototype
 
 basename prototype has been removed from string.h from latest musl [1]
 compilers e.g. clang-18 flags the absense of prototype as error. therefore
@@ -79,6 +79,3 @@ index c872f4e2..d9315fcf 100644
  #include <pthread.h>
  #include <stdbool.h>
  #include <stdio.h>
--- 
-2.44.0
-
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
index 4139b9fd94..bed72a6c4a 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0001-locktest-do-not-tie-struct-delegation-to-the-F_GETDE.patch
@@ -1,4 +1,4 @@
-From 784139a16a03cd0c6486e4b587b995e9d5ab21dd Mon Sep 17 00:00:00 2001
+From d298792d021059f2941822484bb989185bd02d70 Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Wed, 29 Jul 2026 05:10:29 +0000
 Subject: [PATCH] locktest: do not tie struct delegation to the F_GETDELEG
@@ -27,7 +27,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  1 file changed, 6 insertions(+), 1 deletion(-)
 
 diff --git a/src/locktest.c b/src/locktest.c
-index 54ee1f0..e24a0fe 100644
+index 54ee1f07..e24a0fe1 100644
 --- a/src/locktest.c
 +++ b/src/locktest.c
 @@ -80,13 +80,18 @@ extern int h_errno;
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch
index 20095c86ab..21473dc7b3 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0002-Add-missing-STATX_ATTR_-defines-from-musl-sys-stat.h.patch
@@ -1,7 +1,7 @@
-From 052818e91314b797d96d87672c60f6784160f935 Mon Sep 17 00:00:00 2001
+From 7762fbc23f6e0f06f055072e74759070311d6ace Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 25 Mar 2024 10:50:59 -0700
-Subject: [PATCH 2/2] Add missing STATX_ATTR_* defines from musl sys/stat.h
+Subject: [PATCH] Add missing STATX_ATTR_* defines from musl sys/stat.h
 
 These defines are not provided by sys/stat.h on musl but are
 in glibc's sys/stat.h, therefore to compile the tests on musl
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 12 insertions(+)
 
 diff --git a/src/statx.h b/src/statx.h
-index 3f239d79..12599f5b 100644
+index 0a27bf03..4cf2a964 100644
 --- a/src/statx.h
 +++ b/src/statx.h
-@@ -12,6 +12,18 @@
+@@ -20,6 +20,18 @@
  #define AT_STATX_DONT_SYNC      0x4000  /* - Don't sync attributes with the server */
  #endif
  
@@ -37,6 +37,3 @@ index 3f239d79..12599f5b 100644
  #ifndef AT_NO_AUTOMOUNT
  #define AT_NO_AUTOMOUNT		0x800	/* Suppress terminal automount traversal */
  #endif
--- 
-2.44.0
-
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch
index 74b1d42f57..59e8ece1ea 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0003-fs-monitor-include-linux-types.h-for-__s32-__u32.patch
@@ -1,3 +1,4 @@
+From 48d2f10ee9a796d1be3b587e81216858b91cb3ec Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Tue, 29 Sep 2026 02:03:26 +0000
 Subject: [PATCH] fs-monitor: include linux/types.h for __s32/__u32
@@ -12,6 +13,11 @@ unless <linux/types.h> is included directly.
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
+ src/fs-monitor.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/fs-monitor.c b/src/fs-monitor.c
+index dd91a5d7..d4cb41e8 100644
 --- a/src/fs-monitor.c
 +++ b/src/fs-monitor.c
 @@ -12,6 +12,7 @@
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests/0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch b/meta-filesystems/recipes-utils/xfstests/xfstests/0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch
index a69dd6811b..109576bf30 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests/0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests/0004-rw_hint-add-fallback-define-for-RWH_WRITE_LIFE_NOT_.patch
@@ -1,3 +1,4 @@
+From 9e4189b57d453c649defb59d9b86bf94c42956bf Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Tue, 29 Sep 2026 02:03:26 +0000
 Subject: [PATCH] rw_hint: add fallback define for RWH_WRITE_LIFE_NOT_SET
@@ -14,6 +15,11 @@ macro values.
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
+ src/rw_hint.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/rw_hint.c b/src/rw_hint.c
+index d4290e4a..4371e2b8 100644
 --- a/src/rw_hint.c
 +++ b/src/rw_hint.c
 @@ -7,6 +7,10 @@
diff --git a/meta-filesystems/recipes-utils/xfstests/xfstests_2026.06.21.bb b/meta-filesystems/recipes-utils/xfstests/xfstests_2026.09.22.bb
similarity index 98%
rename from meta-filesystems/recipes-utils/xfstests/xfstests_2026.06.21.bb
rename to meta-filesystems/recipes-utils/xfstests/xfstests_2026.09.22.bb
index f6f246332e..1733ba8914 100644
--- a/meta-filesystems/recipes-utils/xfstests/xfstests_2026.06.21.bb
+++ b/meta-filesystems/recipes-utils/xfstests/xfstests_2026.09.22.bb
@@ -2,7 +2,7 @@ SUMMARY = "File system QA test suite"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=74274e8a218423e49eefdea80bc55038"
 
-SRCREV = "acb6d4cb84205a8e3f19ca470cfcf7bf6d93a509"
+SRCREV = "22348afe338c0f6d540c0d7ef0db749eaa51b218"
 SRCREV_unionmount = "f48a57d2a7db5f86ff3dbc4444c3c3041e182d7d"
 SRCREV_FORMAT = "default_unionmount"
 
-- 
2.47.3

