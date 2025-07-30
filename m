Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE770C87FD9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.49379.1753918176016481252
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bt+7N1nl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918176; x=1785454176;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kb2gpsOOGBQ9Vvt2JfIKl6ZwsPabgk5QmIAdqlyQOpo=;
  b=bt+7N1nlsj6Dr9OnZTuHsGkCgUflJFJrjZs2mzXLNRwYA4VO/nyB6hfL
   e6fNMjgMiXx36gjuYE+LjoAUKMrELgzaKU/Pa/2RZ8l0/eGO3r+3Kbbmn
   bnAdAYpMZL531D2WG2QgF4JVcppwe0EEXUinitzx3gPi2H+PlWmFZFP57
   x6U4oumpV11ffCO94hHg5cEitWY169nU3S5DthoY6MZEw6ixch7hDSsE7
   8/hmC8qbE4GHkrUdQrwWTYtEc1p2ogAnxn2vyIlRqRw/2lhr5qpQ+h+zH
   7rBUEWXzvf+m5L/D81QAYyREtBT+8PaUDrH0T5PYZyK2Z06zQqF0/iZ5k
   Q==;
X-CSE-ConnectionGUID: TKEObaSaS8OBLh6+OT9qVg==
X-CSE-MsgGUID: 40FxPblFQvyHQ7AhJP1pvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="208478071"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="208478071"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:34 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 590D51002B8F
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id BC6F714003E7
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 57FD91A008F;
	Thu, 31 Jul 2025 07:29:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/40] python3-rich: upgrade 14.0.0 -> 14.1.0
Date: Thu, 31 Jul 2025 07:29:15 +0800
Message-ID: <20250730232923.522-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118809

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Removed typing_extensions from runtime dependencies
- Live objects (including Progress) may now be nested
- Added padding property to Syntax which returns a tuple of four integers
- Fixed extraction of recursive exceptions
- Fixed padding applied to Syntax
- Fixed Panel title missing the panel background style
- Added TTY_INTERACTIVE environment variable to force interactive mode off or on

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_14.0.0.bb => python3-rich_14.1.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_14.0.0.bb => python3-rich_14.1.0.bb} (88%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_14.1.0.bb
similarity index 88%
rename from meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_14.1.0.bb
index 8a4d6b843e..e68f280c82 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_14.0.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_14.1.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "82f1bc23a6a21ebca4ae0c45af9bdbc492ed20231dcb63f297d6d1021a9d5725"
+SRC_URI[sha256sum] = "e497a48b844b0320d45007cdebfeaeed8db2a4f4bcf49f15e455cfc4af11eaa8"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


