Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 213A2C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:13:18 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.65386.1679548394696580381
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mfF9Sz33;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548392; i=@fujitsu.com;
	bh=1vZgxQgaZXfpgC9NmmgTC9pEYSluPzdc4K8P8vzck2E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=mfF9Sz33HUfuKtROfPhEEhQIszxaph9mNOPS0AuK/X6x9i84zBPsTVIwqJV5sDzp6
	 GLctWtEDSE7Yx9yfcfHMGDd7onKhVhX1jZaXI7n151h7eEmUFOKEH9clfGz8Gg+tAF
	 SfWbnZqFuO9XesiEpCRXeYwY25JY0ur0U70zfjx0n68iJEPsw/KL3QSkdqaTU6/KHJ
	 TAdn6hanEXMbsoTGQs3n8X+vqjMW9uaj6jMCfZQBfgYD4e4lu7jN0WIAT9ShBq9ucK
	 yY6tsMxJ3v8cO9sYUBiFJFpLBEFnAPWwVlRU2dlk/uCFYjz+ltn1NiBUZHPUrIathS
	 012iwe0wctTPQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORpPv8vnS
  KwaX12hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bcpwfZCmZxVrz69JOlgfEARxcjJ4eQwENG
  iTMTvboYuYDsK0wSnx/OZ4Fw9jBKNJydwQRSxSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  exdjBwcwgJBEpOPO4KEWQRUJTrOzmYHsXkFnCSW3L4DVi4hoCAx5eF7Zoi4oMTJmU9YIMZISB
  x88QKqRlFi9uVmFgi7QqJx+iEmCFtN4uq5TcwTGPlnIWmfhaR9ASPTKkbT4tSistQiXTO9pKL
  M9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBATClmuLGDcU7f
  X71DjJIcTEqivBKh0ilCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgF7gDlBItS01Mr0jJzgFEBk
  5bg4FES4Z17ECjNW1yQmFucmQ6ROsWoKCXOu/weUEIAJJFRmgfXBovES4yyUsK8jAwMDEI8Ba
  lFuZklqPKvGMU5GJWEeXVApvBk5pXATX8FtJgJaHHcDAmQxSWJCCmpBqb6YpH76bIJnvMnblq
  5p6cmxXKt9e3aDIvYAybdScxlCTvXhT5lD/q3c8Oi3rh18u2pXZ2n43OV5/I89puWP7ctbuU9
  vwBvWf/e691fkhzt3bt/1heYhK9iWH/1C2uSW/H1uWuPKq5w+rP20UaraU6qKQ+Dqzn0dWob3
  PV8/sbfy67zKzl5dFLh1KbpOye+Oqr6+4PYfpbsjN+KJ45VNcld4mvOST+3hWOd0sL5a46w8k
  nnTl93b9pSqxOiMVOX+pnpOJ9OEZ+vzip34dYlK3PF+hbZOxvcVz44+sjznW7U7YnPRBZOiU7
  OqUgtKFlv/ZD1+5H9Ubu/PlgexPxk3scJevlR6h912pb75t8R+arEUpyRaKjFXFScCABgmOYT
  PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-587.messagelabs.com!1679548391!141144!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27031 invoked from network); 23 Mar 2023 05:13:11 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:13:11 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4FEEE1B4
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:11 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 44E071B0
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:13:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask-socketio: upgrade 5.3.2 -> 5.3.3
Date: Thu, 23 Mar 2023 13:12:50 +0800
Message-ID: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101652

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-flask-socketio_5.3.2.bb => python3-flask-socketio_5.3.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask-socketio_5.3.2.bb => python3-flask-socketio_5.3.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.2.bb b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-flask-socketio_5.3.2.bb
rename to meta-python/recipes-devtools/python/python3-flask-socketio_5.3.3.bb
index b7ba80991..0327d0d8c 100644
--- a/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-socketio_5.3.3.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "Flask-SocketIO"
 
-SRC_URI[sha256sum] = "11d1d78b8805cda351b27828a110b88c74a573be62b07f7f5a519fb67fae0a58"
+SRC_URI[sha256sum] = "8f47762dd1b76916cbc01f4f8661dd4670dbeb418ca0e1aaedab909b85efee5d"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-flask \
-- 
2.34.1


