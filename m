Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6779CD13DF
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:13 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17476.1777546267994460443
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hYyk6Bql;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546268; x=1809082268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cqly2R35Vh0tvUcExCJ/xPdg3CxCsfOuS6Omb8OCrQQ=;
  b=hYyk6Bqlt4TGJQd42cxMNebiR7ckwJYjrsBvnaKtsrZdqW7f7DWr+RnY
   9zGdKQwA+mQ4FLZy0dxrhYv9csdIM6tKIYp9eoWRUZHFwUMSSLd49Sk1d
   B/MJobuvzAL6Y5FO6s+WUhgkzuDVvJi3W20LQ0ZqOkm8sRv508RxV+KIa
   VosvklcsdCIkuKy1vN4VRG4rHkmRYZq1KxbSd3YrCNiMlERI2CJRI6yU7
   akGC27HfonztiirjQCwkjHUvPTqMMh3I60lYF+W67tLD7dnZIgxgq8pt0
   JGIGLGI5UjkQm3qVFql6DVlIMZVnMAWQHtxXZAWn4Gw9gSnlXumudtQiu
   A==;
X-CSE-ConnectionGUID: NgOjOQszSN6AxHvUPvyMaA==
X-CSE-MsgGUID: rcnI0fQxR3eBSfnvRBukpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="226540781"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="226540781"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:06 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 684821000142
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:06 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 08DB71C00107
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 86D2F1801137;
	Thu, 30 Apr 2026 10:51:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-initramfs] [PATCH 61/64] ubi-utils-klibc: upgrade 2.3.0 -> 2.3.1
Date: Thu, 30 Apr 2026 18:49:20 +0800
Message-ID: <20260430104924.1106-61-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126731

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch | 0
 .../0001-make-Add-compiler-includes-in-cflags.patch           | 0
 .../0003-Makefile.am-only-build-ubi-utils.patch               | 0
 ...04-mtd-utils-common.h-no-features.h-for-klibc-builds.patch | 0
 .../{ubi-utils-klibc_2.3.0.bb => ubi-utils-klibc_2.3.1.bb}    | 4 ++--
 5 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc-2.3.0 => ubi-utils-klibc-2.3.1}/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch (100%)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc-2.3.0 => ubi-utils-klibc-2.3.1}/0001-make-Add-compiler-includes-in-cflags.patch (100%)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc-2.3.0 => ubi-utils-klibc-2.3.1}/0003-Makefile.am-only-build-ubi-utils.patch (100%)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc-2.3.0 => ubi-utils-klibc-2.3.1}/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch (100%)
 rename meta-initramfs/recipes-devtools/mtd/{ubi-utils-klibc_2.3.0.bb => ubi-utils-klibc_2.3.1.bb} (96%)

diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-make-Add-compiler-includes-in-cflags.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0001-make-Add-compiler-includes-in-cflags.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0001-make-Add-compiler-includes-in-cflags.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0001-make-Add-compiler-includes-in-cflags.patch
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0003-Makefile.am-only-build-ubi-utils.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0003-Makefile.am-only-build-ubi-utils.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0003-Makefile.am-only-build-ubi-utils.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0003-Makefile.am-only-build-ubi-utils.patch
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
similarity index 100%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.0/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc-2.3.1/0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch
diff --git a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.0.bb b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.1.bb
similarity index 96%
rename from meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.0.bb
rename to meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.1.bb
index 3fcda333c9..564463462e 100644
--- a/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.0.bb
+++ b/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_2.3.1.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 inherit autotools pkgconfig klibc
 
-SRCREV = "4594fc1f4496a0ed55cabd31fbeba4e3fbf05602"
-SRC_URI = "git://git.infraroot.at/mtd-utils.git;protocol=https;branch=master \
+SRCREV = "053ee1038e5dedae61a88cadfb7bdfe9894d8bb6"
+SRC_URI = "git://git.infraroot.at/mtd-utils.git;protocol=https;branch=master;tag=v${PV} \
              file://0001-libmissing.h-fix-klibc-build-when-using-glibc-toolch.patch \
              file://0003-Makefile.am-only-build-ubi-utils.patch \
              file://0004-mtd-utils-common.h-no-features.h-for-klibc-builds.patch \
-- 
2.43.0


