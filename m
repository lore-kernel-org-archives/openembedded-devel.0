Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2354CC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:10:28 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.111337.1669615827514769668
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:10:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TCMGlTpV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615826; i=@fujitsu.com;
	bh=S8UtjbgapWmxlkXdnsTGiE/ymarPgy1SX2vUEVy8FEw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TCMGlTpVtXl0OL3cqXlA7ctzaIHmB8Xp7pzGfeYoqoDT07/00JNLrCgOCvFCX4mSA
	 Aio5sqm79uNkspGH4Ov1Ib17fAaC7VQEU6A3cJ9utT3HsMdf1jagJWGtgxYDQB3cnw
	 SE2Fo7hQdjBisHjLCuWohepokANjlhAbvxSIOa/dDtABZD9qVzKOgijazx8fM7vRsz
	 LxKuT0VQIem/N0xv7NTMZEhDnpnnBM/PxeNPnyYrHRFw3/YawIQFqGg0rWfHrDgDbP
	 jWzjdEGmQsJ7XjaoDuOTS9d4Y4zY2vfyysN4PmBqnUJ7ZN+ZqNYMop7N4UruJaIWNb
	 D8INk+rfR40/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWfdiQEu
  yQc8cGYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePrpZKCXZwV78+/ZW1g3MXRxcjFISTwgFFi
  26bdrBDOZSaJF1s2sEM4exgllh78wdzFyMnBJiAlceP+fzYQW0RAX2Lp7D1gcWYBFYkXv3uAG
  jg4hAXcJQ7M4AcJswioStzoApnDycEr4CTx58YbRhBbQkBBYsrD92CtnALOEnsenWAFsYWAak
  49bmOEqBeUODnzCQvEeAmJgy9eMEP0KkrMvtzMAmFXSMya1cYEYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWhWnFpUllqka2iql1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuc
  k6KXl1qyiREYuinFCpd2ML5Z9kfvEKMkB5OSKO/CS03JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR413u2JAsJFqWmp1akZeYA4wgmLcHBoyTCu9geKM1bXJCYW5yZDpE6xagoJc57zh8oIQCSyC
  jNg2uDxe4lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK820Cm8GTmlcBNfwW0mAlo8SbFJpD
  FJYkIKakGJusu9toUnQvNQulBSUsNQhj2aFqXWoU5ZJ8R+jjbU+DPTtN0Ba8rMwXY/k5bOOeY
  OJuysWaHlW/u/ln3ra7zffxT5ymvy9zZzBLN7zR9v2Cj5Q3BuY5e943vM9dW7rks9cd155c9r
  p+tjKN5T1mcVzBiFdoR/8ixJpf9l41N6r7bqk15YQaeer9m6AjXvk/rO7pN528a33qeFTwnZv
  lnRbefty2/f/TdGscnuyX2Pf5geuMZc0H5hAjF24c4bl/wasmYL75/rkXyB9PCX2+E5v/ySZx
  mZaQqJTx19pfrd0WUKx/+t970y+La9Qm27NaPe4WDszqFEvlWKeQZPOGcx1acJTKt7f3sMx6N
  HAFKLMUZiYZazEXFiQCqWK/MWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1669615825!291650!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2492 invoked from network); 28 Nov 2022 06:10:25 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:10:25 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 329EF7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2665473
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:10:23 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] lldpd: upgrade 1.0.15 -> 1.0.16
Date: Mon, 28 Nov 2022 14:09:44 +0800
Message-ID: <1669615786-13094-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
References: <1669615786-13094-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99793

From: Wang Mingyu <wangmy@fujitsu.com>

Fix:
======
    Do not use 00:00:00:00:00:00 as chassis ID.
    Do not busy loop when an interface with a neighbor disappears.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/lldpd/{lldpd_1.0.15.bb => lldpd_1.0.16.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/lldpd/{lldpd_1.0.15.bb => lldpd_1.0.16.bb} (96%)

diff --git a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
similarity index 96%
rename from meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
rename to meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
index c7237d74b..45425561f 100644
--- a/meta-networking/recipes-daemons/lldpd/lldpd_1.0.15.bb
+++ b/meta-networking/recipes-daemons/lldpd/lldpd_1.0.16.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     file://run-ptest \
     "
 
-SRC_URI[sha256sum] = "f7fe3a130be98a19c491479ef60f36b8ee41a9e6bc4d7f2c41033f63956a3126"
+SRC_URI[sha256sum] = "e3b391650c7ba67cea2fe84d67fdb4d7fc8aa1ec5cf86eb8bb984711df8465a9"
 
 inherit autotools update-rc.d useradd systemd pkgconfig bash-completion github-releases ptest
 
-- 
2.25.1


