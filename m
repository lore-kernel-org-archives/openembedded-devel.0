Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31115C36009
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:39 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4162.1741683327332887572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=o0r3y+Jz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683339; x=1773219339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=s1jxxswqD1KqzAJp7H+KytXkdhCARVmH3DWgA140NcI=;
  b=o0r3y+Jzar6izC+dq0vHRcTrL7eqdqEwXvjCm8z2BcL91/2MJJ6NQg8G
   DDS0RfO0yIZ+8TiflIW6Rhbaij3e/91s4MR0j2I9zXYf51sXze5LvSQj8
   NjL6DDYsAi8bANvuSLBSmoxb1b47pFNlssxW2r3gMoBPZiNfH+WweTo1n
   WBtLySMeEWTAAR5KpKe9//+GBE9gFRzWivGtxnsS1ryMhGa3DmuJE3T7E
   RMBh56Z7EcusRohfT6GU2OZx4jvWX1DYOmBscZylamgovAXu3wUkghZJm
   jU1YsdbrJSZYH5Tlh67GDsSZmAcdHCezX8UvGvUx0H7WQXe4M1Zx8uaBf
   Q==;
X-CSE-ConnectionGUID: a1J4U6tfR/6DbMV+xGEVQA==
X-CSE-MsgGUID: 2dxQZQyrTbC5Y6AcBGv1Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192660326"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192660326"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 75BC4E0767
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 39A87D50B5
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:34 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C8EDB1A009B;
	Tue, 11 Mar 2025 16:55:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 35/36] udpcast: upgrade 20230924 -> 20250223
Date: Tue, 11 Mar 2025 16:55:09 +0800
Message-Id: <1741683310-8681-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115886

From: Wang Mingyu <wangmy@fujitsu.com>

0001-include-stddef.h-for-ptrdiff_t.patch
refreshed for 20250223

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../udpcast/0001-include-stddef.h-for-ptrdiff_t.patch     | 8 +++++---
 .../udpcast/{udpcast_20230924.bb => udpcast_20250223.bb}  | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/udpcast/{udpcast_20230924.bb => udpcast_20250223.bb} (91%)

diff --git a/meta-networking/recipes-support/udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch b/meta-networking/recipes-support/udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch
index e3d65db734..3255a3fad0 100644
--- a/meta-networking/recipes-support/udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch
+++ b/meta-networking/recipes-support/udpcast/udpcast/0001-include-stddef.h-for-ptrdiff_t.patch
@@ -13,15 +13,17 @@ Signed-off-by: Enguerrand de Ribaucourt <enguerrand.de-ribaucourt@savoirfairelin
  1 file changed, 1 insertion(+)
 
 diff --git a/receivedata.c b/receivedata.c
-index 9a68f67..0aa797f 100644
+index a5ed7e8..b3b2640 100644
 --- a/receivedata.c
 +++ b/receivedata.c
-@@ -1,4 +1,5 @@
+@@ -1,6 +1,7 @@
+ #include "config.h"
+ 
  #include <assert.h>
 +#include <stddef.h>
  #include <sys/types.h>
  #include <unistd.h>
  #include <stdlib.h>
 -- 
-2.34.1
+2.43.0
 
diff --git a/meta-networking/recipes-support/udpcast/udpcast_20230924.bb b/meta-networking/recipes-support/udpcast/udpcast_20250223.bb
similarity index 91%
rename from meta-networking/recipes-support/udpcast/udpcast_20230924.bb
rename to meta-networking/recipes-support/udpcast/udpcast_20250223.bb
index 3dea7e2ef6..b3861ce7c5 100644
--- a/meta-networking/recipes-support/udpcast/udpcast_20230924.bb
+++ b/meta-networking/recipes-support/udpcast/udpcast_20250223.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e3cf524a29c8476be354bb329d36ff80"
 SRC_URI = "http://www.udpcast.linux.lu/download/${BP}.tar.gz \
            file://0001-include-stddef.h-for-ptrdiff_t.patch \
            "
-SRC_URI[sha256sum] = "17b5cd8b1e54f7e2e53357ac02ee86e4198bf704096987a03a3b5c402a0ecea1"
+SRC_URI[sha256sum] = "cefd7554c877e1bc76987d2b96b23f7699a2e5340c254454f61b6e0dae370aa7"
 
 # Installation of rateGovernor.h fails without brokensep
 inherit autotools-brokensep manpages
-- 
2.43.0


