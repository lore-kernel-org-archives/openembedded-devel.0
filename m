Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346ECECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:38:04 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.67717.1661755075529507261
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wsWsbJGo;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661755073; i=@fujitsu.com;
	bh=4sG/uJ3GE7sdmDjDBSD/h414M8selDSCVHpjQ/auDs8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wsWsbJGogg6rpah0j63zxMw8JIJDXjrroyCJNoIOPP4b+lgeIDY1WBFeRLc5kcY1N
	 0+MybAKgvpqCXeF23g5Avz6I6GGRWD+fYBy43hVjhwiD1jOzZbKvT3X1tX3H+/bqPi
	 BNfc8BZUk3kpNUqclaHvem2pVJOscE7m7l/X90TTcVA1TiGKksf9qzgZOXphdvD3tp
	 KoL/O/uihUBEXaBh6DT+jO7SaTqKCDKU29lrfzkAC5sQfeM7GOjd0o2kaz5tf03U7Q
	 2GzcMxwC5y/3LUPLl7ct6M70a3CxgmELIaLhSrp9ROd0V1Cybmccek9Ow6hQtCsQOW
	 HK1/hDN9biFOQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORpHsgjif
  Z4P5pJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNxx1PmgstcFX8vHmFtYLzM2cXIySEk8JBR
  4sBKUQj7KpPE+h2BXYxcQPZeRonGDT8YQRJsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCzhKLGjaD2azCKhKrP54hQnE5gWKT/27C8yWEFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDF
  GjKDH7cjMLhF0psWdWP1SvmsTVc5uYJzDyz0LSPgtJ+wJGplWMNklFmekZJbmJmTm6hgYGuoa
  GprqWZrpGhgZ6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgWGZUpxwaQfj
  un2/9A4xSnIwKYnympjzJAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4HWMBcoJFqWmp1akZeYAY
  wQmLcHBoyTCewEkzVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcV52YMQJCYAUZZTmwY2Axe
  slRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8V0BW8WTmlcBtegV0BBPQEQ+XcIMcUZKIkJJ
  qYCreaN8zme2V7EJBAd57pm23bm4vf7qcc3GGjMPTtbUXFtea5LGJqf30nruTZV+kr7f4g7wt
  UU45QcubPpm/zj1xMyegIrwpfY3Rlln5hWwdBpE5l9TjpWJa7YwX3FzY28HrzsEtKKUS/D1Fu
  Ov+i5Bz8QoS/lpc18XkA3zDNz+cs3HHZ5Hfu+WFs4x55bsl/P9v2f4sfWMzX/6j6X9Pmdv61k
  50PupRcGCCjHK4r1D3MY3fB36cm5Go8uX70Rix7D18gmc1YpLOxtu761cEsrWIPbH3+MJ9sc9
  ut+u7nEvL0hRK+3VuJB+IfD9RrCNNc8eBb10uhnWstfvSznTGnT18/KVE1B3Ls/umL85QYinO
  SDTUYi4qTgQAndZIA1IDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-732.messagelabs.com!1661755072!191202!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31352 invoked from network); 29 Aug 2022 06:37:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:37:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E87E81AD
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:37:51 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id DD0351AB
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:37:51 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:37:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] babl: upgrade 0.1.94 -> 0.1.96
Date: Mon, 29 Aug 2022 14:37:35 +0800
Message-ID: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:38:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98505

0001-meson-Do-not-run-git-rev-parse-during-configure.patch
removed since it's not available in 0.1.96

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-gimp/babl/{babl_0.1.94.bb => babl_0.1.96.bb}    | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-gnome/recipes-gimp/babl/{babl_0.1.94.bb => babl_0.1.96.bb} (76%)

diff --git a/meta-gnome/recipes-gimp/babl/babl_0.1.94.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
similarity index 76%
rename from meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
index 7161356c11..85cc7793cc 100644
--- a/meta-gnome/recipes-gimp/babl/babl_0.1.94.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.96.bb
@@ -14,9 +14,7 @@ DEPENDS += "lcms"
 CFLAGS:append:toolchain-clang:mipsarch = " -ffp-exception-behavior=ignore "
 CFLAGS:append:toolchain-clang:riscv64 = " -ffp-exception-behavior=ignore "
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz \
-           file://0001-meson-Do-not-run-git-rev-parse-during-configure.patch \
-           "
-SRC_URI[sha256sum] = "b6a8b28f55e0c17f5031fb7959e72ffe0fbf8196d1968ad6efc98d1b492c3bbe"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
+SRC_URI[sha256sum] = "33673fe459a983f411245a49f81fd7f1966af1ea8eca9b095a940c542b8545f6"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


