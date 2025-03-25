Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A681BC3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.61111.1742893337893207711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fhKtg4vs;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893340; x=1774429340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=oW1yv+AoThvAyP8JbbCLOzF7Q0ofs39FYCuWUiAI8sQ=;
  b=fhKtg4vsI+dC6eiKUMsmqpXFUJ83dEBk0VFg1SAY91l6X4QZKrh5t2OW
   lBpfODe8NbsmJ2brwlfkB+hw2o2LCiNBFc3O85ZzI24WNP/NEsBHaaqRV
   q0GEaxGoOqrlBMwQw6rDTcr85l8LbTa1cu094RNENjO9/QH1GtMi99zEV
   qN85kCLzXzcwvp5uSpMBSKpD8uzhLskfsDFyIWSruo+wjwergu2bniY/i
   /bUVUEkhnBqlF0/rUbAS8jvU0uC0C4Jf14pmP3tuV3yk/n0zPksa17WMh
   1zctZfuRw0KFYN0f3c1eHd7Bwd5LAgzFilLFb8ghbqSb6KJ63foOZ0HV+
   g==;
X-CSE-ConnectionGUID: iZpjxyS3Swe/axeaYelhAg==
X-CSE-MsgGUID: 6PH0v8HSQ+qF/l/0rJFy/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="193368474"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="193368474"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1785DC2267
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D0DD231BC2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:15 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6BF691A0078;
	Tue, 25 Mar 2025 17:02:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/45] python3-aiohttp: upgrade 3.11.13 -> 3.11.14
Date: Tue, 25 Mar 2025 17:01:28 +0800
Message-Id: <1742893312-3809-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116242

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed an issue where dns queries were delayed indefinitely when an
  exception occurred in a trace.send_dns_cache_miss
- Fixed DNS resolution on platforms that don't support socket.AI_ADDRCONFIG
- The connector now raises :exc:aiohttp.ClientConnectionError instead of
  :exc:OSError when failing to explicitly close the socket after
  :py:meth:asyncio.loop.create_connection fails
- Break cyclic references at connection close when there was a traceback
- Break cyclic references when there is an exception handling a request
- Improved logging on non-overlapping WebSocket client protocols to include
  the remote address
- Improved performance of parsing content types by adding a cache in the same
  manner currently done with mime types

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.11.13.bb => python3-aiohttp_3.11.14.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.11.13.bb => python3-aiohttp_3.11.14.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.13.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.14.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.11.13.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.11.14.bb
index ad1275e201..8a3ec3cc33 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.11.13.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.11.14.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "8ce789231404ca8fff7f693cdce398abf6d90fd5dae2b1847477196c243b1fbb"
+SRC_URI[sha256sum] = "d6edc538c7480fa0a3b2bdd705f8010062d74700198da55d16498e1b49549b9c"
 
 inherit python_setuptools_build_meta pypi
 
-- 
2.43.0


