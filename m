Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBD8C54764
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:59 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.37324.1708333370023497256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VfdmSaRB;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333371; x=1739869371;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6bmc1SSPHTXi3vgOojqNmh//EixJG7JIlYD251cEY2k=;
  b=VfdmSaRB8uto5h20v4QihQ1+zX9iKFXk6WdyuGc60n/bmL3Ce285UwRU
   ++4tFTvqTGGAOM+2ySTM4h7QHRXT0aUcH7WQOKOJ42n9t/rlDFmiz6JIK
   AF1tRHWQjV6Ls99bWeKc+KAO3pW4MrZiQZuuqBHgsRaDwZPLYC+VBnJio
   KjU6V54eX4rYu+7EAUTUo2+2n0Zfs/cmjHodur7VFYoct/AMA1GwkFbxH
   RnjC9pmtTrG4I8ALDUr7XSg+UcEm3fO1blsJiLMB3/8Zr8G60axyU+pi4
   oZbjMmg237+tV1mTdbZd6E6k9YvY31I7gV8k0Lgy5iCktOM7KtC7kKm1k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="137396507"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="137396507"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:50 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4E5901440EA
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:48 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AF10CFA5B
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A618202DFF43
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C14DB1A006B;
	Mon, 19 Feb 2024 17:02:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/23] python3-dnspython: upgrade 2.5.0 -> 2.6.0
Date: Mon, 19 Feb 2024 17:02:23 +0800
Message-Id: <1708333346-17704-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-1.880300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOeKNmNNd29Xuce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4ewSz8fXAzKym3QfwsVk0UbvqwGfCk7KUs0UEhvWXN0C31262+Dl9UeXMY4
	xEIhB5OjXkeeLo/bs3fwUM8ba7mL7gj27Rq7HQ1o0KEfqEvXlBBXBeUJqt5UlFMMhwwgbYdIgep
	pQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108867

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dnspython_2.5.0.bb => python3-dnspython_2.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.5.0.bb => python3-dnspython_2.6.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.6.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.6.0.bb
index 6b7212b9b..b1275820b 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "a0034815a59ba9ae888946be7ccca8f7c157b286f8455b379c692efb51022a15"
+SRC_URI[sha256sum] = "233f871ff384d84c33b2eaf4358ffe7f8927eae3b257ad8467f9bdba7e7ac6bc"
 
 inherit pypi python_hatchling ptest
 
-- 
2.34.1


