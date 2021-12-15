Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCDCCC433FE
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 01:50:56 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.35218.1639533055386324900
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 17:50:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=onS1FFzm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639533042; i=@fujitsu.com;
	bh=16Ja0CQAhQWJ4cOf9OR7ZP9XWCslMrl5RzwwGcHWI58=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=onS1FFzmJ/St0o7z5NLa3NL8xxMhS7EW6FiKkSh8MEt51Dt48wF6co2v7xjCNmbnh
	 nFCOIZHCqdKvSvg1bDoPyvTyXLUOOvtWfJPtGlGn9rE4nveELjx8+PsCFX1RQL+jU6
	 qgOHKOhzJKk/pZYJWXiGeiy04I6NNqyw0V8i6x4tmEhM/kFGfPC7jkYqZkr4zy5XlC
	 N5F9K8RUIi/5f/PgN/gdqxGf08t/9pV/vq8NSOcpVcVsHFShsGkJ3rUc3tLiA+YHBM
	 ORkokod2s068Mh5cieEJwUm6c1SbZxUK0m/SMIkzcVMHE3Lu5QjfFpByXJjRthkLy3
	 PjMGK2OOHtBEA==
Received: from [100.115.6.23] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id E1/84-30341-2F949B16;
 Wed, 15 Dec 2021 01:50:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8ORqPvRc2e
  iwZ63phYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b27c3sBVvZKv4vvcTWwHidtYuRi0NI4Amj
  xJbP85ggnAtMEgtObIZy9jJKTLt0irGLkZODTUBDYvfUy8wgtoiAvsTS2XvAbGYBNYmjL3+C2
  cICMRJ91y6xgNgsAqoS2++tYgexeQVcJK6s+MEKYksIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGSeHtpDyOEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjVVJRZnpGSW5iZo6uoYG
  BrqGhqa6prpGpqV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJOil5easkmRmBYphSz/t/B
  2N33U+8QoyQHk5Ior6XIzkQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryewEAXEixKTU+tSMvMA
  cYITFqCg0dJhNcGJM1bXJCYW5yZDpE6xagoJc4r5AiUEABJZJTmwbXB4vISo6yUMC8jAwODEE
  9BalFuZgmq/CtGcQ5GJWHezR5AU3gy80rgpr8CWswEtPhY7naQxSWJCCmpBqZjogcruxw3BCZ
  0C5++ke2zc1nfcw/PlT0Sb1LlFTU2338TvyrpN8/EiYdOzH4qK+xUUHNodVSNtK5htVhIqssy
  lltTgsV0P77hVzn56mr9gmLeRXZ/PA1k9k+qSN9yiHWJslBUhpK+6XOHv6LcDxS0+VJ131q6X
  e6W3G/9gj2E1UHTTXrxWr9nC+estnKs5yr6qrh7l8DmQ17se10vrHnff9KF76pvlovS6Wnr1X
  kXRM++4vGYR8JOTfRn3fx8nlr/dwqerJFTl0vIs8yKMvlTmj7HQi2oi/1pY/zaj/HG4qoMq6x
  Wuhayt3q1v7rlv8RkitiLa1vi1acbtTa+75Pb48Wzas6F/w6PJ1XdUGIpzkg01GIuKk4EAJpr
  ybZGAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1639533041!60325!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13388 invoked from network); 15 Dec 2021 01:50:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Dec 2021 01:50:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 70BAB100235
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 01:50:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 659B810022D
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 01:50:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 15 Dec 2021 01:50:19 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] sysprof: Added json-glib into DEPENDS to
 fix build error.
Date: Wed, 15 Dec 2021 18:50:09 +0800
Message-ID: <1639565409-3527-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Dec 2021 01:50:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94362

| Run-time dependency json-glib-1.0 found: NO (tried pkgconfig)
|
| ../sysprof-3.42.0/src/libsysprof/meson.build:115:0: ERROR: Dependency "json-glib-1.0" not found, tried pkgconfig

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta-gnome/recipes-gnome/sysprof/sysprof_3.42.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.0.bb b/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.0.bb
index bb8f90c19b..9ab4d8f25d 100644
--- a/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.0.bb
+++ b/meta-gnome/recipes-gnome/sysprof/sysprof_3.42.0.bb
@@ -12,6 +12,7 @@ DEPENDS += " \
     yelp-tools-native \
     libxml2-native \
     glib-2.0 \
+    json-glib \
 "
 
 SRC_URI[archive.sha256sum] = "3c16e03efdfe5d3e71c4d239c67741ad37f72ce8971e2f7faf168dbd5e93e886"
-- 
2.25.1


