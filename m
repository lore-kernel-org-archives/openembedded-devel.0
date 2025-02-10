Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2660C021B8
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46455.1739178111260815299
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=daYO3Ayp;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178120; x=1770714120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qUTkfGvkr5eSi4ule/30XusjGj5f9fQrTrdwoiFgJSI=;
  b=daYO3Ayp10QJaiphSMLyFS/1je8L0+GbcLh/yekNh4McDFCrFoy7LqnG
   keZ+jcKLVKRglhq+Ciwu1wse7Fhf1MJWb8BSmeQrLHfnpQWFlt+nJo6s1
   q9egqi9uYCujT4wN7nMXdqwnQrP0fSKRe5AK4HII6Ra/OeWRKUwlZyDZU
   vlegvGO1bhQWajJ2d1zvD60kcS17uIEyELbZ1B9+rP8KXGHWysulWZSTV
   w2wJ8sjwin1zZ0H+ugIxHhBMhCy9wYuoWTQu2yK9KO6QjiNr763eycGzE
   gr4BbO1fdO37MCOSRYDfFjEPqDJtbjfW8I/J984uAj7sgdCYdE3d4+21U
   A==;
X-CSE-ConnectionGUID: sqnSGNkmRlqaBn0xha4ZQg==
X-CSE-MsgGUID: nwdL++G6RFGgVwMHoLgWyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189712431"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189712431"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E80CE3E19
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C53EE10361
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:53 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 66AA31A000B;
	Mon, 10 Feb 2025 17:01:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/66] nss: upgrade 3.107 -> 3.108
Date: Mon, 10 Feb 2025 17:00:50 +0800
Message-Id: <1739178095-26432-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115355

From: Wang Mingyu <wangmy@fujitsu.com>

0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
refreshed for 3.108

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...dd-a-configure-option-to-disable-ARM-HW-cryp.patch | 11 ++++-------
 .../nss/{nss_3.107.bb => nss_3.108.bb}                |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/nss/{nss_3.107.bb => nss_3.108.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index 5debd13488..63f822be25 100644
--- a/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta-oe/recipes-support/nss/nss/0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -1,4 +1,4 @@
-From 781a21fa9b0d8d8d6df0de45e3c9dc3f3e74be8f Mon Sep 17 00:00:00 2001
+From 459ee39104228a958a0999e1a7d4c43e4e6fe4f0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 18 Dec 2019 12:29:50 +0100
 Subject: [PATCH] freebl: add a configure option to disable ARM HW crypto
@@ -36,7 +36,7 @@ index 0ebfc92..3ee7623 100644
  ifeq (,$(filter-out WINNT,$(OS_TARGET)))
  ifndef USE_64
 diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index d728867..8b4de1d 100644
+index a2f63a6..743158e 100644
 --- a/nss/lib/freebl/gcm.c
 +++ b/nss/lib/freebl/gcm.c
 @@ -18,6 +18,7 @@
@@ -53,8 +53,5 @@ index d728867..8b4de1d 100644
  #endif
 +#endif
  
- /* Forward declarations */
- SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
--- 
-2.25.1
-
+ #if defined(__ARM_NEON) || defined(__ARM_NEON__)
+ #include <arm_neon.h>
diff --git a/meta-oe/recipes-support/nss/nss_3.107.bb b/meta-oe/recipes-support/nss/nss_3.108.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.107.bb
rename to meta-oe/recipes-support/nss/nss_3.108.bb
index 23e046b0a9..0c42f40bb0 100644
--- a/meta-oe/recipes-support/nss/nss_3.107.bb
+++ b/meta-oe/recipes-support/nss/nss_3.108.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "7f7e96473e38150771a615f5d40e8c41ba3a19385301ae0c525091f2fc9d6729"
+SRC_URI[sha256sum] = "a0f6fcb5dbadc1635b43827517a979e3a6d005d0788527802a6b31e2c5f66eec"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


