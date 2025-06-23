Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED5FC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.13879.1750662721143003785
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O/jjUuSz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662721; x=1782198721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UGfSwp4i7QeJfDv9wCr/YCqhT9xyF0ATEyvnUE5E6us=;
  b=O/jjUuSzxWPP4ZDNYYWAbrFnGakU2o0WYPW7l+aAbF6XcNhp9zRcUyjI
   M+YRJ7+VKiKsbjuSYIDCLb8BJ2QW2oVx4NQ/8rC233Q4JStTPGhV45a3C
   DlpPJk5ymqQLMhYyriS4K94Y3rCWn9IHHF5WxsfpBFjOY90d3hB2rvQIq
   fwiZukqmSZXtJ9WBGEvovLPXyGSiPCkZcONZLX8rWNkdnD1/rft+d6mm/
   VwicGb+abl+p7WEWjXIPu9GgYskmC9ZYjnrPXPgpzV222rWUt0xjo2PsT
   lLxlJllN64712uRMQ0zHUbe/iSO/5coY7BJ4YB9AGJIgWnOOLFuzUwXLv
   g==;
X-CSE-ConnectionGUID: jsTeNuzLQ2SUruBBvn8fcA==
X-CSE-MsgGUID: gbaoQ60+TCOcb58j8tqhpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="203567344"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="203567344"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:59 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B972CE495E
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77832D88D9
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:56 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E6F871A0071;
	Mon, 23 Jun 2025 15:11:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/30] python3-uswid: upgrade 0.5.1 -> 0.5.2
Date: Mon, 23 Jun 2025 15:11:35 +0800
Message-ID: <20250623071138.402-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118058

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-uswid_0.5.1.bb => python3-uswid_0.5.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uswid_0.5.1.bb => python3-uswid_0.5.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-uswid_0.5.1.bb b/meta-python/recipes-devtools/python/python3-uswid_0.5.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-uswid_0.5.1.bb
rename to meta-python/recipes-devtools/python/python3-uswid_0.5.2.bb
index 32eeeca585..3e6ec88a8e 100644
--- a/meta-python/recipes-devtools/python/python3-uswid_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-uswid_0.5.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause-Patent"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3636dfe71e94cc72918423cec0d1971"
 
-SRC_URI[sha256sum] = "92b48a8f6601687c1cc556878571abf9ddb0bdbaf244713b7ff838c48fcb68b3"
+SRC_URI[sha256sum] = "1d6c53acf160edc9b42e4ba535343b3567f2f341d289b9e63ca6a84372c2c518"
 
 inherit setuptools3 python3native pypi
 
-- 
2.43.0


