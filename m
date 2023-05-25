Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3535AC7EE39
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.6062.1684997791627073561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="106117503"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="106117503"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:27 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BD8A7F0880
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EC3E2BF4BA
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80D482007CA80;
	Thu, 25 May 2023 15:56:24 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH] f2fs-tools: upgrade 1.15.0 -> 1.16.0
Date: Thu, 25 May 2023 14:56:09 +0800
Message-Id: <1684997777-2061-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--15.136400-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/ySrLqyE6Ur/jkdS3kPlaZyXkABvhO7aBvq4r
	mQIDoB6SvEI4haRugcR2t4ExqAa6y9n4coLx5Mxq93bduyx/IZwFeeAjqMW+l54Q+L3BXIWuUvT
	+tdwmjxsqqtDuUtwyfC38M+247Q7B3Nkas/vriw78dMpK2wMYwnIa+KQSxiLwB/FMznsE8cO/BR
	68O365bjSAa8O4E9d0L/8yUNGojyb1Ht3BefL9t/7FEhWgo0y82FA7wK9mP9c0VxbuzzsaAGNok
	eyvFnLMe+eZU8eiw0b5Rta4My43k1xLdJTZK3jfOwpfLMeBwRs+wYb6RCy8qK/aWd+Bakc1A6JU
	WkXudIl/AGK4wInBMrVijUdnqQBW3wMRFjEYq7yeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+ICq
	uNi0WJHPehz6R3EgM0W76dDpGz0qaP/T5MK+7LMP9lKA7Jk5aftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102810

From: Wang Mingyu <wangmy@fujitsu.com>

0001-f2fs_io-Fix-out-of-tree-builds.patch
removed since it's included in 1.16.0

Changelog:
==========
relax zone size of power of 2
fix # of total segments
Remove deprecated f2fstat
define HAVE_CLOCK_GETTIME properly
support F2FS_IOC_START_ATOMIC_REPLACE
give less overprovisioning space
set host-aware zoned device similar to host-managed one
fix build error on lz4-1.9.4
use F2FS_BLKSIZE instead of PAGE_*_SIZE
fix cannot get bdev information
do not use SG_IO in Android
move android_config before defining them

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-f2fs_io-Fix-out-of-tree-builds.patch | 27 -------------------
 ...s-tools_1.15.0.bb => f2fs-tools_1.16.0.bb} |  3 +--
 2 files changed, 1 insertion(+), 29 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.15.0.bb => f2fs-tools_1.16.0.bb} (83%)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
deleted file mode 100644
index aa243bd9c..000000000
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs_io-Fix-out-of-tree-builds.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From f110e34d7a4929cdea647b98fa177cf1bccf8b1e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 21 Dec 2022 18:21:42 -0800
-Subject: [PATCH] f2fs_io: Fix out of tree builds
-
-Relative path does not work when searching for include files
-when srcdir != builddir
-
-Upstream-Status: Submitted [https://lore.kernel.org/linux-f2fs-devel/20221222022830.976309-1-raj.khem@gmail.com/T/#t]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/f2fs_io/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/f2fs_io/Makefile.am b/tools/f2fs_io/Makefile.am
-index 6c17db1..bc4f9d0 100644
---- a/tools/f2fs_io/Makefile.am
-+++ b/tools/f2fs_io/Makefile.am
-@@ -1,7 +1,7 @@
- ## Makefile.am
- 
- if LINUX
--AM_CPPFLAGS = -I../../include
-+AM_CPPFLAGS = -I$(top_srcdir)/include
- AM_CFLAGS = -Wall
- sbin_PROGRAMS = f2fs_io
- f2fs_io_SOURCES = f2fs_io.c
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
similarity index 83%
rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb
rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
index 5da059f73..997fa1240 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.15.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.16.0.bb
@@ -7,9 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=362b4b2594cd362b874a97718faa51d3"
 # to provide libuuid
 DEPENDS = "util-linux"
 
-SRCREV = "64f2596142800c215cb40a658ebd5793ed37c936"
+SRCREV = "06c027abc6153c4a97cba5317844e8dcaaee3cf7"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git;branch=master \
-           file://0001-f2fs_io-Fix-out-of-tree-builds.patch \
            file://0002-f2fs_io-Define-_FILE_OFFSET_BITS-64.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


