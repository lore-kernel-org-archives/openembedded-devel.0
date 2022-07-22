Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFEAC04A68
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 10:17:09 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.17908.1658917026752636021
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 03:17:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=npbtu6FS;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658917025; i=@fujitsu.com;
	bh=2lyzpszaa4rEY26NZf7aQzHaIIy7LK815az4YJAC9gg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=npbtu6FSXkLYMmWwqasIr5HOLD7bskcUHPW52rBuHOkLpPIDPh0jIsnZvq/7soJD2
	 7KjLxbrulfPJrFPVS2tFDOaSTriK8NMEJws8l9Hf88j5kwXHDbA7yRWlhPDxxf5XP2
	 vIB1S+Jp92RIX1eE4/wF46RGLORXr98gB/8GKMjaZv8h3pvKHPweDNmqgjze9M+Pr8
	 kFI2elTRe24dajoIkKoJS1vLZFjXY7fNYYgF8iDKiOY8UG6VVaopREzgj92OTnWaVy
	 rv69P0DKRs7G4K5JWykwlBfbqpyvQTXcUfh8GgMmY/38NHzjxeixkXxmYjcjicWeex
	 OjoqV77Vn6Kag==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8ORqLtA4GG
  SwfxP8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b0h3+ZCu5xVNzufsjUwNjJ0cXIxSEk8IRR
  YtLdrawQznUmiWdTDzBCOAcYJfqmb2LrYuTkYBPQlXjxYzELiC0ioC+xdPYeZhBbWMBH4sTRp
  4wgNouAqsSzi39ZQWxeAQ+JT2umgfVKCChITHn4nhkiLihxcuYTsDnMAhISB1+8AIpzANUoSs
  yeLg9RXiHx+vAlZghbTeLquU3MExj5ZiHpnoWkewEj0ypGq6SizPSMktzEzBxdQwMDXUNDU10
  TXSNjS73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMDgSylmeb+Dsanvp94h
  RkkOJiVRXve3D5KE+JLyUyozEosz4otKc1KLDzHKcHAoSfDu5XiYJCRYlJqeWpGWmQOMBJi0B
  AePkghvMi9Qmre4IDG3ODMdInWK0Zjj7sK9e5k5Zn5tO8AsxJKXn5cqJc4bwwdUKgBSmlGaBz
  cIFqGXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzzuYHmsKTmVcCt+8V0ClMQKdsUXgAckp
  JIkJKqoEp8NwVp0p3t6dbvwbyXzj1JW7b/xXXLqnwTbNnTTEskOrYvvPu8dN+mpYVNdOYS4LX
  xgiyNVg8PMCW+Ktq1qIDD14aavE1Tbwew/H7ZIn4y6tFyqvfeCft7zacyLWG0/xoitqbcPFaS
  f9GsXn7GvgrRPINHy+6Obli0dm/MalxHX+eWO7etlG00Oylx6obXjNcGK67M9+8Uv974po9zb
  W/5zjvv3sm54/V24yVXAs/z6h8GG3mdyTwsQHH3ZBLhWyvvVfnp7EckhDOyGW8vvMR86Wc8xH
  yqmumf2JNyPrJ5Vr4XIf53+voHVzmgh21TvVhIqVS71YfWPJiscqXuizm5bwOz4zLVKyCg9Y9
  jRBXYinOSDTUYi4qTgQA/ICUQksDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1658917024!218239!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11491 invoked from network); 27 Jul 2022 10:17:04 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jul 2022 10:17:04 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2692E100190
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:17:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1A795100043
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jul 2022 11:17:04 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 27 Jul 2022 11:17:02 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-eth-hash: upgrade 0.4.0 -> 0.5.0
Date: Fri, 22 Jul 2022 12:03:31 +0800
Message-ID: <1658462611-26124-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Jul 2022 10:17:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98010

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-eth-hash_0.4.0.bb => python3-eth-hash_0.5.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-hash_0.4.0.bb => python3-eth-hash_0.5.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-hash_0.4.0.bb b/meta-python/recipes-devtools/python/python3-eth-hash_0.5.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eth-hash_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-hash_0.5.0.bb
index 317bcd5286..73072706e0 100644
--- a/meta-python/recipes-devtools/python/python3-eth-hash_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-hash_0.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "ae8ba88c1c2f0074e5e169bc0c08318c063054532809aa1bfc8367962b1b7088"
+SRC_URI[sha256sum] = "ea0fd4e264c97c8aa739ae1cea7199db2e1f3bdf387cc9b81ef03c660f871335"
 
 inherit pypi setuptools3
 
-- 
2.25.1


