Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1295BCD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17450.1777546208953946453
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KASakafW;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546211; x=1809082211;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=msls59KkWeHsgR2DJjW+G/DBuF/S50ckwOIpTogYAkU=;
  b=KASakafWJILrL+RF9lSrsdAfyecJN4NsmUpfwpNj0/6G29GYinugXF5D
   ql04rJ3f59J5ykCbMPJR/xYpKg7AOrJG+VkrFaIaDs+uDuQSyBM1Tdmzu
   w3q0DpZ2WfveTxvJM7sibGxlDXVTGcL6PaT3GDR0amp19f8TIPQ2eOOjp
   mpLY6WOvXi5bFbCeGDOLLynVp+uepqPbKIdec/pQ9W45QEDR6WHFMEXVJ
   cSDSWXTpuJia4b8KpxizSUwx27TbNLmm27pZPSyZN5+YOkWQSruwtndJm
   TO8dKgqV9ptF6Kj5AYa78K1HowORIZUZfdW96LQRwLGpLAKHBcWZTdpOP
   Q==;
X-CSE-ConnectionGUID: 34DSv8+oQ7mgoQsIlDW8sw==
X-CSE-MsgGUID: s7Vzv7ZMSAqLxETL4OT91Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226540707"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226540707"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:10 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 4BA3742A33C
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:10 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E8DB4C0023A
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6B9DD1801545;
	Thu, 30 Apr 2026 10:50:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 26/64] ntfs-3g-ntfsprogs: upgrade 2022.10.3 -> 2026.2.25
Date: Thu, 30 Apr 2026 18:48:45 +0800
Message-ID: <20260430104924.1106-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126691

From: Wang Mingyu <wangmy@fujitsu.com>

0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
removed since it's included in 2026.2.25

Changes:
===========
- Fix bashism in configure script causing errors in non-bash shells.
- (mkntfs) Enable microsecond-level volume creation time.
- Fix two instances of an invalid errno state when encountering NULL in strings.
- Fix a crash when a reparse tag could not be found in the index.
- Fix incorrect MFT free records value when bitmap is expanded.
- Fix 'extras' manpages being installed when extras are disabled.
- Fix various instances of use-after-free conditions in the library and tools.
- Fix typo in NTFS hibernation message. Thanks to Anil Kumar for the report/fix.
- Escape commas in the fsname when libfuse 2.8 or higher is used.
- (ntfsclone) Allow adjusting the sector size in the NTFS boot sector for the target device when restoring images.
- Remove libdl dependency when building without external plugins.
- (ntfsinfo) Show information about the logfile state when dumping metadata.
- (ntfsinfo) Fix displaying crowded directories or indexes.
- (ntfsinfo) Fix displaying the security descriptor list in ntfsinfo.
- Fix heap buffer overflow when POSIX ACLs were enabled (CVE-2026-40706). Thanks to Andrea Bocchetti for the report.
- (ntfsusermap) Fix overflow when constructing backup filename.
- Fix two time-of-check-time-of-use conditions.
- Fix missing malloc/sscanf return value checks.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...use-after-free-in-ntfs_uppercase_mbs.patch | 42 -------------------
 ...10.3.bb => ntfs-3g-ntfsprogs_2026.2.25.bb} |  5 +--
 2 files changed, 2 insertions(+), 45 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2022.10.3.bb => ntfs-3g-ntfsprogs_2026.2.25.bb} (92%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
deleted file mode 100644
index 3160f56880..0000000000
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7b6210c5be46e5120b42c09f910e8f104bf3edf1 Mon Sep 17 00:00:00 2001
-From: Erik Larsson <erik@tuxera.com>
-Date: Tue, 13 Jun 2023 17:47:15 +0300
-Subject: [PATCH] unistr.c: Fix use-after-free in 'ntfs_uppercase_mbs'.
-
-If 'utf8_to_unicode' throws an error due to an invalid UTF-8 sequence,
-then 'n' will be less than 0 and the loop will terminate without storing
-anything in '*t'. After the loop the uppercase string's allocation is
-freed, however after it is freed it is unconditionally accessed through
-'*t', which points into the freed allocation, for the purpose of NULL-
-terminating the string. This leads to a use-after-free.
-Fixed by only NULL-terminating the string when no error has been thrown.
-
-Thanks for Jeffrey Bencteux for reporting this issue:
-https://github.com/tuxera/ntfs-3g/issues/84
-
-Upstream-Status: Backport [https://github.com/tuxera/ntfs-3g/commit/75dcdc2cf37478fad6c0e3427403d198b554951d]
-CVE: CVE-2023-52890
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
----
- libntfs-3g/unistr.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libntfs-3g/unistr.c b/libntfs-3g/unistr.c
-index 5854b3b..db8ddf4 100644
---- a/libntfs-3g/unistr.c
-+++ b/libntfs-3g/unistr.c
-@@ -1189,8 +1189,9 @@ char *ntfs_uppercase_mbs(const char *low,
- 			free(upp);
- 			upp = (char*)NULL;
- 			errno = EILSEQ;
-+		} else {
-+			*t = 0;
- 		}
--		*t = 0;
- 	}
- 	return (upp);
- }
--- 
-2.34.1
-
diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb
similarity index 92%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb
index 3a7dd783b9..b3193d27b3 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb
@@ -8,9 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV} \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
-           file://0001-unistr.c-Fix-use-after-free-in-ntfs_uppercase_mbs.patch \
-"
-SRCREV = "78414d93613532fd82f3a82aba5d4a1c32898781"
+           "
+SRCREV = "d1cb9e825d059ef5db0ccd30d5bce202edbd69dc"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


