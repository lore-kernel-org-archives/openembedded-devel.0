Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A669CC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 09:18:34 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web08.8667.1648113512949974872
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 02:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=S8V+UeS0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648113511; i=@fujitsu.com;
	bh=IEZ6UaMSolxoT12q9DMuO7nsRVLZym0WXEt1fWzkmbs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=S8V+UeS0pWrtDQSuj3E1lKCA3BAEocXcAtayra52qa6sIdCdTr5N062eoaFDCdJv8
	 o50LGEwY72VfmYlbQFByP3tLCPVQmPCyaaUvixQhzfRMjTSnAzCTy0BE/o/Ik8PlhT
	 ZR/NMLCsrde6A9TFCSIK7NCBW1J+EeZVLPiioJ0wS4GFuVMcqyis8bygtP7KTiMo3c
	 hQvVC2HXf6yzRswJDnkcTL/h3cHVTUudz0rjdABqFUhs4+wWaubfbavlaRyZDygKwe
	 vsIPTf8oryDPrZPnsdnTlT4gIo/4go8LDLLsvoJ2Ne5ZZsH8Vv873gNshYQF1ggj9n
	 NdN97Ro+61B8w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8MxSTfN3Cb
  J4N0GLYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePOh062gtfCFWfmzGJtYDwj2MXIxSEk8IRR
  ou/9ISYI5wKTxJx589khnJOMEvP2fWXuYuTkYBNQl3h88zUjiC0ioC+xdPYesDizgKpE98U17
  CC2sECUxOKDk1lBbBag+OwDW8HivALuEtMaz7KA2BICChJTHr4H6uXg4BTwkPjy3hzEFAIq+b
  U4EqJaUOLkzCcsENMlJA6+eMEM0akkcWLFRyYIu0Li9eFLUHE1iavnNjFPYBSchaR9FpL2BYx
  Mqxitkooy0zNKchMzc3QNDQx0DQ1NdU11jUxN9RKrdBP1Ukt1y1OLS3QN9RLLi/VSi4v1iitz
  k3NS9PJSSzYxAkM4pZj1/w7G7r6feocYJTmYlER5PxvbJAnxJeWnVGYkFmfEF5XmpBYfYpTh4
  FCS4N1lBJQTLEpNT61Iy8wBxhNMWoKDR0mEt8YQKM1bXJCYW5yZDpE6xagoJc4bawaUEABJZJ
  TmwbXBYvgSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeUpApPJl5JXDTXwEtZgJa/PynJcj
  ikkSElFQDk1Zkusv5Jzm57XcUBF/etrhydEKb2EpT/ahZW6tf/nr/aId6BbNPxOclj54KPBV+
  fKptiQmDkRXro8dT11w+kPCMP+1/2dp3v77qmvB/VxGP0dkVzyX3qu170M9HTjPnGMzn4n7TM
  KfwFNvdiqQDRUpPMx4sCD0TI/G15eTpp0uLPmjNYpd5I7Fq7ZLEf1f3BP99ePVJ0bvni/YUPL
  q+Vf7tTcG5qxtLi2eE9HmW/V32sXgWz3emkrs5zJLi6ovuy6THezDeL9a6bPL4yRqfHV9/pGa
  zMx564iDS+mkO6zOBdz/XbHLc2Kr7t7I962yQ6PlA483r4tM2Tdp3zMzvnWagmKth5aoKsW9Z
  c/5wfQhTYinOSDTUYi4qTgQAiAtgflwDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1648113510!93419!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4156 invoked from network); 24 Mar 2022 09:18:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Mar 2022 09:18:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 20176100446
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:18:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 12E221000F6
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:18:30 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 24 Mar 2022 09:18:08 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 3/5] [oe] [meta-python] [PATCH] python3-cachetools: upgrade
 4.2.4 -> 5.0.0
Date: Thu, 24 Mar 2022 17:17:58 +0800
Message-ID: <1648113480-29846-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 09:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96190

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
-Require Python 3.7 or later (breaking change).
-Remove deprecated submodules (breaking change).

The cache, fifo, lfu, lru, mru, rr and ttl submodules have been deleted.
Therefore, statements like from cachetools.ttl import TTLCache will no longer
work. Use from cachetools import TTLCacheinstead.

-Pass self to @cachedmethod key function (breaking change).

The key function passed to the @cachedmethod decorator is now called as key
(self, *args, **kwargs).
The default key function has been changed to ignore its first argument, so
this should only affect applications using custom key functions with the
@cachedmethod decorator.

-Change exact time of expiration in TTLCache (breaking change).

TTLCache items now get expired if their expiration time is less than or equal
to timer(). For applications using the default timer(), this should be barely
noticable, but it may affect the use of custom timers with larger tick
intervals. Note that this also implies that a TTLCache with ttl=0 can no longer
hold any items, since they will expire immediately.

-Change Cache.__repr__() format (breaking change).

String representations of cache instances now use a more compact and efficient
format, e.g.LRUCache({1: 1, 2: 2}, maxsize=10, currsize=2)

-Add TLRU cache implementation.
-Documentation improvements.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-cachetools_4.2.4.bb => python3-cachetools_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_4.2.4.bb => python3-cachetools_5.0.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb
index bf225e60e0..f2974f7e34 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_4.2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.0.0.bb
@@ -27,6 +27,6 @@ do_install_ptest() {
 	cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
 }
 
-SRC_URI[sha256sum] = "89ea6f1b638d5a73a4f9226be57ac5e4f399d22770b92355f92dcb0f7f001693"
+SRC_URI[sha256sum] = "486471dfa8799eb7ec503a8059e263db000cdda20075ce5e48903087f79d5fd6"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1


