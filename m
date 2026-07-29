Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E248C54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 06:05:03 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5337.1785305102214838605
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 23:05:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VeiZsKwW;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e3617ba36so666034a91.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 23:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785305101; x=1785909901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QaJSEBKMzzT0xMNuDQRFjq0R6pYmDdhpuH4XdHys8GY=;
        b=VeiZsKwWOK0pPqoMfBnT2zbc0PqEuRfFl4X4LgXjKY83TjlYHkxBhyckhGZeDbXf6e
         6MlIY4P3bYOda8ZVqYIEkPiTdw3EnVeZqc3/ZLh2OGXB9zanupm8bgFDxCYdIqy6cS4l
         FuvnykzhAuK61+lYNnFVdQ3PvW0pHpNpzMFHgaYEaN2QaShcRzK3UVbbWoEKHCygRiZd
         Yrjj38PyrjO4G7E6+IAlEoVItNFlHzo4lX40R4u4rKNV7nN05f6aW+6MBRUYzgiu/Jf7
         EK7TSMFqpVPcOoCLKxAmZ4Dti+9EkZ2+Rel9Rqx2YKUZ0hJ6QVqM+G09ncdQLb2bHBrw
         VgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785305101; x=1785909901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QaJSEBKMzzT0xMNuDQRFjq0R6pYmDdhpuH4XdHys8GY=;
        b=J9BzWO/Hl5/mq930gwshDAyxRVBs8chW5Q6qFsMcsRzFpF1TLW3Gq5mLvr8btvlIbi
         KyTm6eV7Xei0VGMxNTZnDhd3V5GgyizawcS1qhbIAjmwPl6rXjxjjc9JvMJrNeseVUoU
         JZTTFnPf8ZJvoBx0NoeeTi3u3v3XzrmEhzikilDNDmsp8fOKlEDmrR42Fj1CzMPjaE6z
         wia9dIctGG7WNRv8h2//dXdFtTvlpM8H8MGGXr6UxEdpPvyR4SpCVTAr3Ic7lN8aN/HZ
         r3nEvj5nxLKYfE/y1jQfhwtRaqDhqnd7orFUYm74NneYaIbf7Sxtk5nS0ycuET3OE8cY
         gvng==
X-Gm-Message-State: AOJu0Yx5K05rrMjVp6VlvzZWyzDHtmqbtVBOi9YftwlS7D69zSrR1hQd
	5/RhF45SSDEZDiXbexTdW8THkZGGuX/Y/m1p0ZHUZa+bBAfctvERfvYdRwrtdE+4
X-Gm-Gg: AR+sD12LL7Rp3LR3Qm2z4OLb1PeahVG2WSQ1ddGzRToDLSzw1EgbcAxC3dsroQSwWyL
	2gzKfsj0en1P7JyfFt/+j7Vr/geCYil/Ovu2SrUtBqqpNwahDfY3VSPKp8l7pJ4Rcx2sX2nvtSl
	UG7sDHLUyKcaGVwIsYGVOINY05lVkcNePC72nxIIoGA5iyZqW65fcNk/JxQZy6cwm5EpV3dMBC7
	cLav8sXySk2j0++5td0INH7Wx9OigthhY03yLrAVHvt25q+PYmzvyijH5cMJkjj4tBJX/G6ZmRz
	RgjJQFqSFE/MAAJQzJ/7JWWYnju4YFx4Ko8xhs7DzAqF5U8DKG0gWhz1XJ9wTL7Lk1aUWDiBrv1
	LD5UUkf/77kVUsKSvpJKoq4OipqoM1HScaEEa7bDZ8ZLt74gi37tqOSFQa/pnokkBBCmZkb2y65
	z7kYoyE/N7Ve7RICS138lOTvPW5xLc7F80CFONSjM/Nxkw9K6bMetGWTmmdF4F9aPFHwk/LwWmy
	rho8+QNjV2mep70JnKbMwkK3fos0lGD7VSk9BukqkWxSD0uX0u341jU2tUFRfZq5By+i7Hbz0Gm
	VidO0iqHyYW3pF1r/IxOgt2xtJQhrCYRtUd06e8BUUV1fbfjVZ6isXgrMjNKqxRMqrniPcvabnX
	lyLFe4QF3UwlJ
X-Received: by 2002:a17:90b:3808:b0:38e:c0f5:7c4 with SMTP id 98e67ed59e1d1-38f6a484d10mr5468077a91.30.1785305101436;
        Tue, 28 Jul 2026 23:05:01 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412a92bsm2278342a91.5.2026.07.28.23.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 23:05:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 3/5] nilfs-utils: upgrade v2.2.11 -> v2.3.1
Date: Tue, 28 Jul 2026 23:04:53 -0700
Message-ID: <20260729060455.3993973-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
References: <20260729060455.3993973-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 06:05:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128546

Move from the v2.2.y stable branch to the v2.3.y line (tag v2.3.1,
2026-06-19). v2.3.x carries all v2.2.6..v2.2.16 backports plus the
2.3.0 rework.

Security:
 * CVE-2026-55392: validate s_log_block_size in nilfs_sb_is_valid().
   A crafted NILFS2 image with s_log_block_size > 6 caused oversized
   shifts / huge allocations in nilfs-tune, dumpseg and any tool
   reading a device.

2.3.0 highlights:
 * Utilities (lscp, lssu, nilfs-clean, ...) accept file/directory
   arguments and auto-resolve the backing device.
 * cleanerd: cap segments per cleaning step by free segments (avoids
   stalling near ENOSPC) and against 32-bit size_t overflow; clean
   SIGINT exit, SIGUSR1 state dump.
 * Library refactor with an API/ABI break: obsolete APIs and internal
   structs removed from public headers, new segment I/O / resize /
   freeze-thaw APIs, types unified to uint32_t/uint64_t/bool.
 * mkfs.nilfs2 sets the block-count read-only-compat flag by default.

Packaging-relevant build-system changes:
 * Soname bump libnilfs/libnilfsgc 2 -> 3; libnilfscleaner is no longer
   a shared library (now an internal convenience lib), so
   libnilfscleaner.so.* correctly disappears from the runtime package.
 * New pkg-config producer files (nilfs.pc, nilfsgc.pc) land in
   ${libdir}/pkgconfig -> require inherit pkgconfig.
 * LT_INIT([disable-static]) means static libs are no longer installed.
 * The old --with-base-sbindir knob was replaced upstream by an
   --enable-usrmerge=(no|sbin|bin|auto) mechanism. Drop the local
   0001-configure.ac-Add-knob-to-define-base-sbindir.patch and select
   the hierarchy explicitly from DISTRO_FEATURES, because the "auto"
   default probes the build host and is wrong when cross compiling.
   LDCONFIG=true is still required.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...e.ac-Add-knob-to-define-base-sbindir.patch | 35 -------------------
 .../nilfs-utils/nilfs-utils_v2.2.11.bb        | 16 ---------
 .../nilfs-utils/nilfs-utils_v2.3.1.bb         | 18 ++++++++++
 3 files changed, 18 insertions(+), 51 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils/0001-configure.ac-Add-knob-to-define-base-sbindir.patch
 delete mode 100644 meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
 create mode 100644 meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.3.1.bb

diff --git a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils/0001-configure.ac-Add-knob-to-define-base-sbindir.patch b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils/0001-configure.ac-Add-knob-to-define-base-sbindir.patch
deleted file mode 100644
index e53d2bdc8b..0000000000
--- a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils/0001-configure.ac-Add-knob-to-define-base-sbindir.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 1b8f420ec8852355580dd925c0316798d4fa7449 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 3 Jul 2025 19:32:12 -0700
-Subject: [PATCH] configure.ac: Add knob to define base sbindir
-
-This helps when distros use converged directories with usrmerge
-set --with-base-sbindir=DIR accordingly so it respects the
-distro policy
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 9a2f5ff..ce2c853 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -186,7 +186,14 @@ AC_SYS_LARGEFILE
- AC_PREFIX_DEFAULT([/usr])
- test "x$prefix" = "xNONE" && prefix="/usr"
- test "x$exec_prefix" = "xNONE" && exec_prefix="${prefix}"
--AC_SUBST([root_sbindir], [/sbin])
-+
-+AC_ARG_WITH([base-sbindir],
-+    [AS_HELP_STRING([--with-base-sbindir=DIR],
-+        [specify root system binary directory @<:@default=/sbin@:>@])],
-+    [root_sbindir="$withval"],
-+    [root_sbindir="/sbin"])
-+
-+AC_SUBST([root_sbindir])
- AC_SUBST([sbindir], [${exec_prefix}/sbin])
- AC_SUBST([sysconfdir], [/etc])
- AC_SUBST([localstatedir], [/var])
diff --git a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
deleted file mode 100644
index b68f68a02e..0000000000
--- a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.2.11.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "nilfs-utils is a set of utilities for managing the NILFS filesystem."
-HOMEPAGE = "https://nilfs.sourceforge.io/"
-
-LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=385034ac639a62b8415db9814582ee98"
-SRC_URI = "git://github.com/nilfs-dev/nilfs-utils.git;protocol=https;branch=v2.2.y;tag=${PV} \
-           file://0001-configure.ac-Add-knob-to-define-base-sbindir.patch"
-
-SRCREV = "507064bb3604d0fd88f5e3f6422d9ade73a26120"
-
-DEPENDS = "util-linux util-linux-libuuid"
-
-inherit autotools
-
-# make install is trying to run ldconfig, not suitable for cross builds
-EXTRA_OECONF += "LDCONFIG=true --with-base-sbindir=${base_sbindir}"
diff --git a/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.3.1.bb b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.3.1.bb
new file mode 100644
index 0000000000..be9442c5e1
--- /dev/null
+++ b/meta-filesystems/recipes-utils/nilfs-utils/nilfs-utils_v2.3.1.bb
@@ -0,0 +1,18 @@
+SUMMARY = "nilfs-utils is a set of utilities for managing the NILFS filesystem."
+HOMEPAGE = "https://nilfs.sourceforge.io/"
+
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=385034ac639a62b8415db9814582ee98"
+SRC_URI = "git://github.com/nilfs-dev/nilfs-utils.git;protocol=https;branch=v2.3.y;tag=${PV}"
+
+SRCREV = "805edb2a35178dc1d3d64a553af607fb500ab21d"
+
+DEPENDS = "util-linux util-linux-libuuid"
+
+inherit autotools pkgconfig
+
+# make install is trying to run ldconfig, not suitable for cross builds.
+# The UsrMerge hierarchy is autodetected by probing the build host, which is
+# wrong when cross compiling, so select it explicitly from DISTRO_FEATURES.
+EXTRA_OECONF += "LDCONFIG=true \
+                 ${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '--enable-usrmerge=sbin', '--enable-usrmerge=no', d)}"

