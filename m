Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BE7CD1297
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.39354.1711983090747217291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C903kaPw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983094; x=1743519094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o769jL+EuF5VOzO1rGc03WrB+aRXdY70xc43PSl1UjA=;
  b=C903kaPwLVahaE0cngl7WcwXgtV2Y8a3BN+3hZS0dr0phOkk3NN9Nlj6
   7jFUcOl225RYwrgi8+i87LTHnLftXT1e+EklEIJbEGXOCo9QM9r+w3Bo/
   AW8EGf1bBmPIaREVk1X7tJk4VfJvLVgGZuleHHzOTTxmfmfVRH4ysmkII
   4filxEH1FlnBMBp1G7e5zrmMgR49SUNN5YimpMGpJEEPTr2c3mmdh8yer
   8X9Pr8/gDL7gi9sEe6rA0NBQ8OKTLyW7Y/EroigfKHqUyU2zuzoYqZk5L
   w0P0M6Q/31evkMaKwtmQy04vJF2G9pLoJH8QmLMDvgib6rqOX4TOs5aAN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133563978"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133563978"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:33 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id BD56ED5162
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:30 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id F0876CF7C2
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8019620093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 35EED1A000A;
	Mon,  1 Apr 2024 22:51:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/47 v2] python3-asgiref: upgrade 3.7.2 -> 3.8.1
Date: Mon,  1 Apr 2024 22:50:43 +0800
Message-Id: <1711983079-16849-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-2.255600-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrWq/snXbxpCDUlVJM/QT13mvd
	ltQYL4qHA9dmUDS4LC23Ur9R5VHeqB2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFtPmTjXcK+VO9HTxRE6QQB1XgGeVUh3WdmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1f9BF7aY0uRtD5uu5a6gsKBsagDn5JaE/SDtL0Feb6cMHpY6g6Pbgkjtk8
	k2q1MP2S2hrb2TxBNcfJnFyYKLLCXhdrJ95SZc/BDlYzH+FaIxTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109728

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fixes a regression in 3.8.0 affecting nested task cancellation inside
  sync_to_async.
* Adds support for Python 3.12.
* Drops support for (end-of-life) Python 3.7.
* Fixes task cancellation propagation to subtasks when using synchronous Django
  middleware.
* Allows nesting "sync_to_async" via "asyncio.wait_for".
* Corrects WSGI adapter handling of root path.
* Handles case where `"client"` is "None" in WsgiToAsgi adapter.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asgiref_3.7.2.bb => python3-asgiref_3.8.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.7.2.bb => python3-asgiref_3.8.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
index b7fa9f036..3b90eda5b 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.8.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 SRC_URI += "file://run-ptest \
 	    "
 
-SRC_URI[sha256sum] = "9e0ce3aa93a819ba5b45120216b23878cf6e8525eb3848653452b4192b92afed"
+SRC_URI[sha256sum] = "c343bd80a0bec947a9860adb4c432ffa7db769836c64238fc34bdc3fec84d590"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.34.1


