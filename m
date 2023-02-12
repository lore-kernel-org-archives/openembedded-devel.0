Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8769EC636D3
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 10:02:14 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.8255.1676196131491780305
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 02:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=t7ztUJsG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676196129; i=@fujitsu.com;
	bh=SpcVC7NleEwlIQKaUxdbOnKjOdRdKSsYo2G9LULDpD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=t7ztUJsG+fTXEqJrQaqhuCB3HcGfKUuhJTd3OxvTdnRL7dWnxZLXzwU9P6TZZh+K+
	 X3F1zl/zAD5pFRqTS/0HrGdvH5qEFSdU8i5HU2RDvi8+pJlJ8QDKMfzPlKdUksP1Yc
	 bvq8rrGfAIdPhOd+J7RT+aYqr+VbNFPEO/imQxZWK4yqADE+Be+zx1g3aHP5eq39fm
	 OnjUVauvsLL6Umn83lU8MXk6AUNYIMnH8MIBCjWOA9j7XLbHOyNYywdvebHpEC3cj8
	 U+LkAsp7BIDSsGUfxGIzmvyb6Aj84Zk3tR99hLryLiJ6Vhr/2QiZM8Dm+jYoZUeA8t
	 9h9RRMbPciLDg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpKuw80W
  ywfIF5hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bqRddYCw7yVkw58YuxgXE6TxcjF4eQwENG
  if0dPUwQzhUmiYtnl7BDOHsZJZY032DrYuTkYBOQkrhx/z+YLSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBE4uPivYxdjBwcLAKqEtMW24OEeQWcJJasmg5WIiGgIDHl4XuwVk4BZ4kZZ74zgthCQD
  Xb+7tYIOoFJU7OfMICMV5C4uCLF8wQvYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0
  LGJlWMZoVpxaVpRbpWuolFWWmZ5TkJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibn
  pOjlpZZsYgQGb0px8tkdjEf7/uodYpTkYFIS5V22+WmyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneG9tfJAsJFqWmp1akZeYAIwkmLcHBoyTCK74OKM1bXJCYW5yZDpE6xagoJc77AaRPACSRUZ
  oH1waL3kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnfbwGawpOZVwI3/RXQYiagxQxST0E
  WlyQipKQamDJ1jW80vewocnqckthx8JiB9/ut9kpf5lXzz4nm3JBzeN13gx+2pjI5K/5rrzpV
  1a22ZtrZ4PN6qZGStYG7HfYWftl8bL7Zj4UFPFV/Xty154uTcfL56XeIzeh30/TN7D7S5tK9M
  7o7LC+WsGr3Vdvc5tthM/nEP0/TcuWIRvdLH9iyBfpW/Qx+0TrnjZCk41U7A7+4M9ZhBafq9/
  8pWLi6PbrbRjWdU+2IaXjHjcolFbZx5fmuFwXcRUr/FKwREJ8ywzmOTePR8v03RRkfNm3fMCe
  Xmav6WzL7kjqz9vffZzp//HT7xbfC8JmdJoc0GqvjZvNcvfda5cGW+fGzz20L295/8X56967y
  4vPhSizFGYmGWsxFxYkAICpqCFkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1676196128!618133!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25210 invoked from network); 12 Feb 2023 10:02:08 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 10:02:08 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 5E5EA1B4
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:08 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 52E0E7B
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 10:02:06 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websocket-client: upgrade 1.4.2 -> 1.5.1
Date: Sun, 12 Feb 2023 18:01:49 +0800
Message-ID: <1676196111-13722-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
References: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101050

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  - Fix logic bug that can cause disconnects (#893)
  - Refactor and improve ping/pong logic to resolve several issues, including
    an infinite loop issue during reconnect (#862)
  - Fix issue where `skip_utf8_validation = True` is ignored (#886)
  - Fix issue where sslopt `is_ssl` is ignored (#875)
  - Downgrade "websocket connected" message from logging.warning to logging.info (#888)
  - Update github actions to newer versions (669fe1b)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...socket-client_1.4.2.bb => python3-websocket-client_1.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websocket-client_1.4.2.bb => python3-websocket-client_1.5.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-websocket-client_1.4.2.bb b/meta-python/recipes-devtools/python/python3-websocket-client_1.5.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-websocket-client_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-websocket-client_1.5.1.bb
index ab88af4bf..41d469cf1 100644
--- a/meta-python/recipes-devtools/python/python3-websocket-client_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-websocket-client_1.5.1.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://github.com/websocket-client/websocket-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b969e9612325987c823fc0737063ebc8"
 
-SRC_URI[sha256sum] = "d6e8f90ca8e2dd4e8027c4561adeb9456b54044312dba655e7cae652ceb9ae59"
+SRC_URI[sha256sum] = "3f09e6d8230892547132177f575a4e3e73cfdf06526e20cc02aa1c3b47184d40"
 
 inherit pypi setuptools3
 
-- 
2.34.1


