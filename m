Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0061C54792
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9263.1708419297154672221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XG+i/b0n;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419302; x=1739955302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YMLsmFLYLETWz5nfO0njTHIZ/SygJwRDX8oj0T/J4+0=;
  b=XG+i/b0nq48g2CsqMzI/tNZ61odOkn3cFRV6fXypvp87agfBSqg9ecfL
   bfrbUbnk6hVWB2XPD4OUWwE1FuDc+v5URC7Nv9BPG+o7FIjLRae0L4EOH
   fbqrFmfG5bXaUk9JuDzZiPT+vUnLUh1kSdTD00zgasegVKTK98Ejw8ENG
   OcopmwmG26eAU81v7UuX970rt7AaDGRoXdEuY7zpu1Hh8RjypwxUwPUo1
   2xHJK60qQs4PWOzK3iAHgEfyMKrsQ8kHsx7sP59lH///pz8YytOY53eXD
   GL9qMP6ZX1WVKiatB7xUmix8yfk+9QF97FPLMCp5zTo6BaK++pevTIt32
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149352035"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149352035"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:55:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E0647D3EAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:57 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 30C2CCF7D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BFA262009954D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:56 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 709981A006B;
	Tue, 20 Feb 2024 16:54:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/26] python3-pytest-asyncio: upgrade 0.23.4 -> 0.23.5
Date: Tue, 20 Feb 2024 16:54:32 +0800
Message-Id: <1708419281-26047-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--5.982000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytCz3ENTRseZgYz
	GYtVtarB+HFUiys+kAANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl5GUF3NhJu3iVvB
	81KWQR0qUjc7YpOhRdpg+xMERr0NZeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibIAcCikR3vq8eYb0HQYKDvKqWVeympD5wm9BRAfULHHuI7v6rUhogpafpN
	m5D5a7a
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108935

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Declare compatibility with pytest 8
-Fix typing errors with recent versions of mypy
-Prevent DeprecationWarning about internal use of asyncio.get_event_loop() from affecting test cases

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-asyncio_0.23.4.bb => python3-pytest-asyncio_0.23.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.23.4.bb => python3-pytest-asyncio_0.23.5.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.4.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.5.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.4.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.5.bb
index 6def54187..2eda16f93 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.5.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "2143d9d9375bf372a73260e4114541485e84fca350b0b6b92674ca56ff5f7ea2"
+SRC_URI[sha256sum] = "3a048872a9c4ba14c3e90cc1aa20cbc2def7d01c7c8db3777ec281ba9c057675"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


