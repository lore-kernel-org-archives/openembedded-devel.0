Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BD7C3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.47547.1743412325210251063
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XRyxVfuO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412328; x=1774948328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Pnr+g5As3Qy3Nlv8/zV0t70Y47J0DJSv1KcT0KglgOE=;
  b=XRyxVfuOVH7c4uEkDDYiG+7Mc7rFD5kXZgTI3P0wPH9mNSoIfZ647w34
   pNBYTZicxnosB0Jj1zOwZWnNblVd43VlIYGAB4JYCBW7Z5JfwfQN7aNpR
   0gOv9LD2Mj0w7RsKrk3yyDURSKTwH0P37t76C5qUiPt+8uAaHnporwcOH
   fGzPX+ZHg8jYU7RpJItMHEgrCm+JgHt/j03uaSKOG0Vw8PX4GT+phhcry
   W2aMhvn2EfoB48OgXqENbQkiff11ImHwtGuzWe51FaMJ/WmuHz/HKJekC
   ZNI9yMC4MxcK+u5QIkZxiBmpddTGn6iO2utCFUBhfxLRyPOJXvFl+5Ro5
   A==;
X-CSE-ConnectionGUID: LNaWaX8nQo+KDhUwe8bSQg==
X-CSE-MsgGUID: BKACXVu8TDm1H8aA9XecnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194950098"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194950098"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:05 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56AD1D5020
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 18A34D5093
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CD7A71A009A;
	Mon, 31 Mar 2025 17:12:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/26] python3-web3: upgrade 7.9.0 -> 7.10.0
Date: Mon, 31 Mar 2025 17:11:48 +0800
Message-Id: <1743412308-21887-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116424

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_7.9.0.bb => python3-web3_7.10.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_7.9.0.bb => python3-web3_7.10.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_7.9.0.bb b/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_7.9.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
index 3b740329f4..e9f067aa96 100644
--- a/meta-python/recipes-devtools/python/python3-web3_7.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_7.10.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d34d9701a1461e4bd71a904ac4cf7be"
 
-SRC_URI[sha256sum] = "3c4487a7ac57e0a187bd7ee03db455d94f354d15cca45f097f15f7281ad1a01f"
+SRC_URI[sha256sum] = "0cace05ea14f800a4497649ecd99332ca4e85c8a90ea577e05ae909cb08902b9"
 
 inherit pypi setuptools3
 
-- 
2.43.0


