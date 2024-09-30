Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6270CF64A6
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.49299.1727682215530101543
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ORAo8Qkd;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682215; x=1759218215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=1sInmomBg96qFXUXQAI7ZLpFatDvNXY16spsAcciDbE=;
  b=ORAo8QkdfUKKF85mLYY0mXVB6EACpmn12vUabwI/RfVojHIjGgRY/xBR
   68wo46pE4fin6zAT7e0FuumQmwygheFTt6VBa5AQ2qfAPvPD44iBxBneV
   CWsXue5mEA71Qz7CDiCyIZAtlIkZSoch41GJdOt1sI/R6jxIm6ndzFkbc
   vvP5gtVWBXH6hn/cyshpV4cYScR3jKwqTGU15ibrj8FTfTtzPXPBfIEwR
   ONXEt/rZtsXerjME6WbficULtlHKwxUQkRoRZTpt6lMyvQ4haIwB1+3Y5
   9VTRv3JNV5yIVPn51Xg9Bm/z7AD7I4FmyFd2nhEfyw6YEPCfXorWT2Hmc
   w==;
X-CSE-ConnectionGUID: hUzcUQ4fQBOBbLzfM+JcgQ==
X-CSE-MsgGUID: n3xn2B77T0OfXBXSw4T8ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175267969"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175267969"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:33 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 54646D6EEF
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 89803D506E
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2398D6B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C78701A000A;
	Mon, 30 Sep 2024 15:43:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/40] python3-aiohttp: upgrade 3.10.5 -> 3.10.8
Date: Mon, 30 Sep 2024 15:42:36 +0800
Message-Id: <1727682185-12664-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--0.172300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjTcUw8L9AtVr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzmltEimV4PqmSgl
	eDIOFjd7Fkl3eGfbcrn0mGsbGf7lqnQPG087iI3WF5eiFsdSPQ1UwoGXcRrcs5cxP1OEu0XejS3
	BIo0aTMiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112568

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed cancellation leaking upwards on timeout

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.10.5.bb => python3-aiohttp_3.10.8.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.10.5.bb => python3-aiohttp_3.10.8.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.5.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.8.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.10.5.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.10.8.bb
index f167b9d6e..e762eca52 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.10.8.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "f071854b47d39591ce9a17981c46790acb30518e2f83dfca8db2dfa091178691"
+SRC_URI[sha256sum] = "21f8225f7dc187018e8433c9326be01477fb2810721e048b33ac49091b19fb4a"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


