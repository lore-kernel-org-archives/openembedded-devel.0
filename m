Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555ADD49C76
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 08:33:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6371.1769762035805158554
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jan 2026 00:33:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bETQLKjU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1769762036; x=1801298036;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=p6gcMdMuD3UqxJOXOwiaIKeMzsAeXGcD2j4FWyI5GWM=;
  b=bETQLKjUVjVGHPj9XCeJcsCUAJryfSOSJcLGWuBosE/3c+bCtotkaF4o
   Zm8H4B+z0+Pygztki8zf6lyc5k3GDsf/B8QdgckU4G7NiKku8S/NwD2L+
   nKj2uknAWOtrMQqQ3LGkvWfBMm1leyfbgpWvXHFfMvjsZDr2vXVWCiqNl
   o8dPOHbRVhNSEmXJOPzxVZ1KZYN7NprPMsZjZ7Bucbot537FXbTrTzG49
   mWAz/nkhGrsWgwUOScsv36676jBN2aRZPPDS9k+buFTy4GbVzRE4hUbLW
   XEc6zQ6chOmWwNi3BzALHcZvpZTkFg9UvkzYEmxR6fldJHbGSbQXV6ysW
   w==;
X-CSE-ConnectionGUID: UDTmQQAFS6q3R0izqebxpg==
X-CSE-MsgGUID: tI8nMELsSGOiBSYJHyz/5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="216467424"
X-IronPort-AV: E=Sophos;i="6.21,262,1763391600"; 
   d="scan'208";a="216467424"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 17:33:54 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1F1BCC00555
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:54 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id CFA02140736B
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:53 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id A8612404682
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:51 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] minizip-ng: 4.0.8 -> 4.0.10
Date: Fri, 30 Jan 2026 16:33:49 +0800
Message-ID: <20260130083349.11311-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Jan 2026 08:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124005

1.Changelog:
  https://github.com/zlib-ng/minizip-ng/releases/tag/4.0.10

2.Remove 0001-crypt.h-Remove-register-keyword.patch as it was merged upstream.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...0001-crypt.h-Remove-register-keyword.patch | 35 -------------------
 ...nizip-ng_4.0.8.bb => minizip-ng_4.0.10.bb} |  3 +-
 2 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
 rename meta-oe/recipes-core/minizip-ng/{minizip-ng_4.0.8.bb => minizip-ng_4.0.10.bb} (91%)

diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch b/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
deleted file mode 100644
index c471b098d4..0000000000
--- a/meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 469beab0747549599959a30188deb3b27df3a346 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <mingli.yu@windriver.com>
-Date: Wed, 2 Apr 2025 11:19:54 +0800
-Subject: [PATCH] crypt.h: Remove register keyword
-
-Fixes:
- | In file included from /buildarea/tmp/work/core2-64-poky-linux/minizip-ng/4.0.8/git/test/test_compat.cc:17:
- | /buildarea/tmp/work/core2-64-poky-linux/minizip-ng/4.0.8/git/compat/crypt.h:62:9: error: ISO C++17 does not allow 'register' storage class specifier [-Wregister]
- |    62 |         register int keyshift = (int)((*(pkeys + 1)) >> 24);
- |       |         ^~~~~~~~
- | 1 error generated.
-
-Upstream-Status: Submitted [https://github.com/zlib-ng/minizip-ng/pull/853]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- compat/crypt.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/compat/crypt.h b/compat/crypt.h
-index 41c6454..ccdd83a 100644
---- a/compat/crypt.h
-+++ b/compat/crypt.h
-@@ -59,7 +59,7 @@ static int update_keys(unsigned long *pkeys, const z_crc_t *pcrc_32_tab, int c)
-     (*(pkeys + 1)) += (*(pkeys + 0)) & 0xff;
-     (*(pkeys + 1)) = (*(pkeys + 1)) * 134775813L + 1;
-     {
--        register int keyshift = (int)((*(pkeys + 1)) >> 24);
-+        int keyshift = (int)((*(pkeys + 1)) >> 24);
-         (*(pkeys + 2)) = CRC32((*(pkeys + 2)), keyshift);
-     }
-     return c;
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb
similarity index 91%
rename from meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
rename to meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb
index cf98c0cf2e..2e7f438821 100644
--- a/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.8.bb
+++ b/meta-oe/recipes-core/minizip-ng/minizip-ng_4.0.10.bb
@@ -7,11 +7,10 @@ LICENSE = "Zlib"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=36964f044224efeedd694983c34e716f"
 
 SRC_URI = "git://github.com/zlib-ng/minizip-ng.git;protocol=https;branch=master \
-           file://0001-crypt.h-Remove-register-keyword.patch \
            file://run-ptest \
 "
 
-SRCREV = "55db144e03027b43263e5ebcb599bf0878ba58de"
+SRCREV = "f3ed731e27a97e30dffe076ed5e0537daae5c1bd"
 
 
 RCONFLICTS:${PN} += "minizip"
-- 
2.43.0


