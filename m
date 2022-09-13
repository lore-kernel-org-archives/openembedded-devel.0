Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D39E2C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:19:58 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.3073.1663064394465784198
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=T1GJgFwL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064392; i=@fujitsu.com;
	bh=ixTtre4Ll6ucV36Ood1nUFS/e0t31PVcTurRsw/Yht4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=T1GJgFwLhl329nYf8n3xE2Wv00nDckI3IllEn87Q2jzfA7Niimu4qRbkq3fO1usoc
	 yQuqk7QPVIPpWx+SB686diTgcTpSknKoyCxO4E8DaE20Qr6gB50FSABV90VbO6tB7S
	 9ycBeInLJC6vfKApAB9RIiupi+x21by/D8vm7WT7mWyuS0Q3egnhE6kByiEk9QbfBn
	 YyEbDLadO7V/JtYzvNr3pYrTfdC7Z+3JX1o/yaE6RPmJc1A8mARUHU9cDnBSQTE5Ne
	 laU8QjIqlTiMI4nsWc/ffsxhJ3/puagipEsMWjCnClasRq6o6jK7bhhKVHGHmoXumD
	 755yVGGGgE+pw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRWlGSWpSXmKPExsViZ8ORqOsRqZB
  s8L9f3uLi4aXMDowe5zauYAxgjGLNzEvKr0hgzbi16TljQR9nxbXPvewNjBs4uhi5OIQEnjBK
  zF+8hB3Cuc4ksfv5BCYIZw+jxPKXB9m6GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7h
  x3EFhbwkVg4A6KeRUBVYv2iXhYQm1fAUeLjnadg9RICChJTHr4Hsjk4OAWcJL502oOEhYBKvs
  98C1UuKHFy5hMWiPESEgdfvIBqVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWlfwMi
  0itEqqSgzPaMkNzEzR9fQwEDX0NBU10DXyNBUL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIhTihmu72Cc2PdT7xCjJAeTkihvpJdCshBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3vgQoJxgUWp6akVaZg4womDSEhw8SiK8PMFAad7igsTc4sx0iNQpRkuOqbP/7WfmWA4mZ3
  5tO8AsxJKXn5cqJc470xuoQQCkIaM0D24cLOovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBL
  mlQgDmsKTmVcCt/UV0EFMQAcZWcuDHFSSiJCSamCSibm6kXvpkWkbDK0D7e/3Tf2+zvRnCM/P
  M+of/6plJS4RXTxt7aqEY5e2K+5OzHupMfN6wYSZjEFxpxKftG8/3vQ4aOHfg06muz92CWmFm
  C9/PsdvUiDXCiPFyNClv9awTZq5I3/OmQN1F5Z//e2jrvNZ7rTo2/IsW3uuhy0lF8yW8Cgu1Q
  pcrd5jy9MvpK3THsDLrvbvgbWc4yeLl0tT/lcUTmF4ueP9WfnU3Yf6LqRuXLnsd+rJ4yonq6T
  vWK+8JCOrJm+4S1qJmX399q1bbp92ulqRz7V117v9KtwxcmqcIsb3AyVftDe8zpoZ1Z/6KF11
  2ZrfC2642dwsatm0/VaL30HzhG0ymjunXLLLUWIpzkg01GIuKk4EACJzYYF1AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-587.messagelabs.com!1663064392!815495!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13670 invoked from network); 13 Sep 2022 10:19:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:19:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2290C10018D
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:52 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 16E8F100043
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:19:49 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymetno: upgrade 0.9.0 -> 0.10.0
Date: Tue, 13 Sep 2022 18:19:04 +0800
Message-ID: <1663064344-3276-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
References: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:19:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98781

Changelog:
==========
Add get_forecast range arguments

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymetno_0.9.0.bb => python3-pymetno_0.10.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymetno_0.9.0.bb => python3-pymetno_0.10.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.10.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-pymetno_0.10.0.bb
index 50b202b042..c5ab635927 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
 
 SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
-SRCREV = "3b18971fb882deaaebb9aa511627c5fc6fb97526"
+SRCREV = "5fc18d7c5d627a9d9b2529db98d4e7e01a37dbf9"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.25.1


