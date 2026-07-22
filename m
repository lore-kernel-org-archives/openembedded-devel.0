Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39E3C4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:23:59 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44610.1784715829603876586
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l+6FBYFN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715829; x=1816251829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7WreCeRUV66/U8eP7o+RmMLIvpR1cw+7rDzGPFY+vgc=;
  b=l+6FBYFNVzTc3U0hITU33+XfRZPRHMG7yVQXDvoOAizWUj3xlDzdCGsQ
   DHuasq+Q6nipIT8JCZVKk1JmPFtHBSdWs39MXtsfEnZuwtlBLZ/lgcO1+
   xUpjElqhYU5nyI+tc9n8E8re7ZwjG95vL/nnp+UPMnzFF1YubqgihY2s3
   dt52zyMeL0TsrOU5koNWDVfIQ1nKy9dwxqhSOYljvj/8sAKgBARdeLZ7e
   WrXsk0A+WBzeHBlZJbQzrx9HVloWJsDjfc5QvuSJ1uPWP/+hclwdp6ark
   TmbeWxzk0FoUp24np/oouZwzaorXntojCBKfWBVE3qkRetwWJ4qOX/Bwj
   w==;
X-CSE-ConnectionGUID: RdX2hFdVRASmHwQv70qKJg==
X-CSE-MsgGUID: wnqv976pSxSBrSci44EtnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="227106876"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="227106876"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:47 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CF8E7C0182E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:47 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 82872C06D5D
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id A5C994064B2;
	Wed, 22 Jul 2026 10:23:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-filesystems] [PATCH 12/37] ntfs-3g-ntfsprogs: upgrade 2026.2.25 -> 2026.7.7
Date: Wed, 22 Jul 2026 18:22:55 +0800
Message-ID: <20260722102320.1019-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128382

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- (ntfscat) Fix heap memory corruption when processing a corrupt or maliciously
  crafted filesystem. (CVE-2026-42616)
- Fix heap memory corruption when copying index data from root to an index
  block in a corrupt or maliciously crafted filesystem. (CVE-2026-42617)
- Fix single-byte heap buffer overflow when decompressing maliciously crafted
  compressed file data. (CVE-2026-42618)
- Fix heap buffer overflow when copying the tail data of an index block to a
  freshly allocated block. (CVE-2026-46569)
- Fix out-of-bounds read when processing symlink reparse data in a corrupt or
  maliciously crafted filesystem. (CVE-2026-46571)
- Fix heap memory corruption for maliciously crafted or corrupt index data
  descending to an out-of-bounds tree depth. (CVE-2026-46570)
- Fix heap buffer overflow for maliciously crafted or corrupt index data during
  a node split. (CVE-2026-46572)
- Fix heap buffer overflow when building inherited ACL data. (CVE-2026-56135)
- Fix out of bounds access when clearing an index root in maliciously crafted
  or corrupt index data. (CVE-2026-56136)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-3g-ntfsprogs_2026.2.25.bb => ntfs-3g-ntfsprogs_2026.7.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/{ntfs-3g-ntfsprogs_2026.2.25.bb => ntfs-3g-ntfsprogs_2026.7.7.bb} (97%)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.7.7.bb
similarity index 97%
rename from meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb
rename to meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.7.7.bb
index 94ec32dba1..083c135b83 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.2.25.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2026.7.7.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 SRC_URI = "git://github.com/tuxera/ntfs-3g;protocol=https;branch=edge;tag=${PV} \
            file://0001-libntfs-3g-Makefile.am-fix-install-failed-while-host.patch \
            "
-SRCREV = "d1cb9e825d059ef5db0ccd30d5bce202edbd69dc"
+SRCREV = "d327833ec1d5eb1358b6f2c37139f10a3460944d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


