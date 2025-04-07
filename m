Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC543C369B1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.42478.1744017446860559298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p5ybNqSS;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017452; x=1775553452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MDNfGwy9exAo8kJUPxX3NOhm7IjbrLR1x4pshqkt4cY=;
  b=p5ybNqSSf1qUd2LDIKSAGVJGR8o3Izu16JkSLl5N+X0w+dIPIYa7D8ps
   5rgCo6ABjEC4/mR+Hum0CcuD5zzMmr0kbvTIzeX/3P25GR0BrjwORi9c3
   FB/3rsQDgFGs86MtdEt6PN+xDwojhZdDZnzCK2Ie/q1GO0zlB9hgTBq5G
   GmQo7ar44FZU6wA5rVf0/CgGkQEV3LDBwnFjknNG39j2PnXFYK+jwCfil
   OA+mJHByx55n7+2sDFYQmDWMOEdOV8aH/LyM2QsptRJ3kZ3vmuXoxEPNE
   MryLOaDBNARdJqa2Ezfq9Vp/Ufrcy+CF/D+WwjWIrOCM6xwjJRDqdPpQe
   w==;
X-CSE-ConnectionGUID: +bjBT7E+QKGCaxqzvBn1nQ==
X-CSE-MsgGUID: 6ck+xqAURFSUNBFjDtfGgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="184053190"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="184053190"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:30 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 683C2D4F55
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2AAB2D9687
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A0F2E1A0071;
	Mon,  7 Apr 2025 17:17:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/30] python3-qrcode: upgrade 8.0 -> 8.1
Date: Mon,  7 Apr 2025 17:17:05 +0800
Message-Id: <1744017431-22217-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116647

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-qrcode_8.0.bb => python3-qrcode_8.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-qrcode_8.0.bb => python3-qrcode_8.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-qrcode_8.0.bb b/meta-python/recipes-devtools/python/python3-qrcode_8.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-qrcode_8.0.bb
rename to meta-python/recipes-devtools/python/python3-qrcode_8.1.bb
index dcd92cfe9d..e37c6bcdea 100644
--- a/meta-python/recipes-devtools/python/python3-qrcode_8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-qrcode_8.1.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4b802d2a65df4626623c79757f486af9"
 
-SRC_URI[sha256sum] = "025ce2b150f7fe4296d116ee9bad455a6643ab4f6e7dce541613a4758cbce347"
+SRC_URI[sha256sum] = "e8df73caf72c3bace3e93d9fa0af5aa78267d4f3f5bc7ab1b208f271605a5e48"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


