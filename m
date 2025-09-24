Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40062CAC5A7
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8317.1758704441632466881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sKVGtDCV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704444; x=1790240444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3mb4Seg77K1nT2YgWjbd4+r/ApFdKoO/0Z1Z/sR2qsg=;
  b=sKVGtDCVg9jxMCxIDlnqxNbp2QPy1dx/0/ZdQXQDOr6MCVHqe5U97ZN1
   rnxNXMInrxnOT7SOZwIqkuww+4DDPUj9SnKcmRXC/bTGIAWH3SFeU2BDW
   Bnkq5DHUMn7pK30EKoRlYkuyn0FZIBt+566LsgrppXZgIQkeCmuSYNTn9
   zD425HzvrNjjiAPZk0XCh71/X6ijO+1Gi2V2h4zxROhEfM97yMIR4JjK+
   ebkDRUOWrO9LgjT83x+YVZOsX31jy+msczDn8EgdzlViNWE202E/DBG8O
   /cAGgOLpJuiuhCvBixpYEUsG7JWrHDN7KrPhIaccv6CvpAAk6e20+/T1I
   A==;
X-CSE-ConnectionGUID: 2WEgW20SRU2+cvwgpdXC7Q==
X-CSE-MsgGUID: y9ulqbcPTfWqNuOOwDlscw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="201172419"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="201172419"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:43 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 347FBC0043A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:43 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id E2175C02458
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:42 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 5FE7C10003C5;
	Wed, 24 Sep 2025 09:00:41 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 17FD01A0074;
	Wed, 24 Sep 2025 17:00:37 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/29] openjpeg: upgrade 2.5.3 -> 2.5.4
Date: Wed, 24 Sep 2025 17:00:14 +0800
Message-ID: <20250924090029.1786-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119777

From: Wang Mingyu <wangmy@fujitsu.com>

CVE-2025-54874.patch
removed since it's included in 2.5.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openjpeg/openjpeg/CVE-2025-54874.patch    | 44 -------------------
 .../{openjpeg_2.5.3.bb => openjpeg_2.5.4.bb}  |  3 +-
 2 files changed, 1 insertion(+), 46 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.3.bb => openjpeg_2.5.4.bb} (86%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
deleted file mode 100644
index 187557a35c..0000000000
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
-From: Sebastian Rasmussen <sebras@gmail.com>
-Date: Thu, 16 Jan 2025 02:13:43 +0100
-Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
-
-Consider the case where the caller has not set the p_image
-pointer to NULL before calling opj_read_header().
-
-If opj_j2k_read_header_procedure() fails while obtaining the rest
-of the marker segment when calling opj_stream_read_data() because
-the data stream is too short, then opj_j2k_read_header() will
-never have the chance to initialize p_image, leaving it
-uninitialized.
-
-opj_jp2_read_header() will check the p_image value whether
-opj_j2k_read_header() suceeded or failed. This may be detected as
-an error in valgrind or ASAN.
-
-The fix is to check whether opj_j2k_read_header() suceeded before
-using the output argument p_image.
-
-CVE: CVE-2025-54874
-Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d]
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- src/lib/openjp2/jp2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
-index 4df055a5..da506318 100644
---- a/src/lib/openjp2/jp2.c
-+++ b/src/lib/openjp2/jp2.c
-@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
-                               p_image,
-                               p_manager);
- 
--    if (p_image && *p_image) {
-+    if (ret && p_image && *p_image) {
-         /* Set Image Color Space */
-         if (jp2->enumcs == 16) {
-             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
--- 
-2.50.1
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
similarity index 86%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
index fff73ee46a..23f46c45cd 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.4.bb
@@ -7,9 +7,8 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
-           file://CVE-2025-54874.patch \
            "
-SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
+SRCREV = "6c4a29b00211eb0430fa0e5e890f1ce5c80f409f"
 
 inherit cmake
 
-- 
2.43.0


