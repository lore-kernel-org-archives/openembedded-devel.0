Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1608BC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:09:23 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web08.3350.1658455759562640692
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 19:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=B6E9PLbs;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658455758; i=@fujitsu.com;
	bh=qo0aKeUnbZiglRZgh7fN9kVo1QQ+PrrYahBcFDB+ty8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=B6E9PLbsi00tqCaAGY0kpFBwXXuvhwZ7m5tLFre9YWAKv3+JhTpUq5BxjUFi1Ejgt
	 8tbvA/C2N94sNxtH4So88C9LUMWeepSWcWGR1i1zeliODUYHZpV+5aOQTr5EFnMqA9
	 gCwu5/0PHpuN53iDHqQV76BtNCVuVU4EL/f3wU8N40RN4gyyw3ykFmhhyWahQBWLEl
	 E5IpvnFP48m3vN8ZIclGdL5lF3HmtEKPFV2KGQTD3lz4AMWRWaNIvRihUF2CEBI16x
	 7qdnz+92BI/cz+4NX+w5Phhs0UDEV5UVk0MbL9B1idVy2rliQtXkJQDIcdnKHKzHbp
	 3BcY7WA7vAmyw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8OxWfcs260
  kgz27eC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxvi1azFszhrDg46wlrA+Mpji5GTg4hgQeM
  Emv+FXUxcgHZl5kk3j5exQrh7GGU+PdxETtIFZuAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  4DVCAv4Sdz7dZAJxGYRUJXYt/szmM0r4CRx63EfWL2EgILElIfvwWxOAWeJmy/+MUFc4SSx4k
  QjVL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtCYsaMbWwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjNZJRZnpGSW5iZk5uoYGBrqGhqa6xha6RoZGeolVuol6qaW65anFJbpAbnmxXmpxsV5xZW5y
  TopeXmrJJkZgGKcUq13Zwbhn1U+9Q4ySHExKorz7Jt1MEuJLyk+pzEgszogvKs1JLT7EKMPBo
  STBe4X5VpKQYFFqempFWmYOMKZg0hIcPEoivBZfgFp5iwsSc4sz0yFSpxgVpcR51VmB+gRAEh
  mleXBtsDi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYt40FaApPZl4J3PRXQIuZgBabm98
  AWVySiJCSamDiTPy38vTnNU5LXVxnnvnSEeRRdIS3pituzslDB0Xfrr2V/eAot3bNTJW3q6aK
  nxUIt12/yvRp7IQL9wQD1r6zvLIuO9xqZZvMYfnJdryujRcrjiYcOrmtZu7L3n/9XlEnlt6Ly
  dzYq6s+5cF/XrVSGVvXZyennuIwSWJRqWTpSb79fdV3u32vNbflSudvcbymEFgyMXuXmUDY6b
  azzUsTFIwsI+1mT9p23vPug0kTP89WNm75Vbak+IT6A03pxQKtSt/YTjZl39acwC83ZUaMiN/
  vC6n7HIMlX6xwurosksUtNC/gV5g8g5w/v/b0gLl+C1bYeZj7Mod4zjy18P6CFbffFm2eF+ib
  ctaHx32DEktxRqKhFnNRcSIAJwjFBV4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-548.messagelabs.com!1658455757!11935!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20310 invoked from network); 22 Jul 2022 02:09:17 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 02:09:17 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E5A237B
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:16 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D922273
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:09:16 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 03:09:15 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyfanotify: upgrade 0.1.3 -> 0.2.0
Date: Fri, 22 Jul 2022 10:08:54 +0800
Message-ID: <1658455737-26848-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
References: <1658455737-26848-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 02:09:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97937

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyfanotify_0.1.3.bb => python3-pyfanotify_0.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyfanotify_0.1.3.bb => python3-pyfanotify_0.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb b/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb
index a7c8f958ec..d887901443 100644
--- a/meta-python/recipes-devtools/python/python3-pyfanotify_0.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfanotify_0.2.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=636a36c9df04efcfacf839b8866d9a37"
 
 SRC_URI += "file://0001-ext-define-FNM_EXTMATCH-if-not-already-defined.patch"
-SRC_URI[sha256sum] = "0efa73922fd705b4e8f8f0b51cb88198ceef66cc309e1de21674ef44c879029d"
+SRC_URI[sha256sum] = "1ec1c61fba9dea96cf8eac7f1a0cca2517613da20d156b7da2a06f9d63c77aca"
 
 inherit pypi setuptools3
 
-- 
2.25.1


