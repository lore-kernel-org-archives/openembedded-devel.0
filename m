Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD30EC433EF
	for <webhook@archiver.kernel.org>; Mon,  4 Jul 2022 09:07:59 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.70274.1656925672801604043
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Jul 2022 02:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XoaCbKiv;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656925671; i=@fujitsu.com;
	bh=nS8+03Ao/w8DRIbc/I8wFBi+WNWiE6q4Rjbci8UYSmo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XoaCbKivOD9cI8XfZKQEF9tYH/yE3mrDPznCRzsQtjfZzxfYSVFqEjikjbuwEkkVW
	 EvR3SaDCtJEaOBYKpk1gzMT9JP+bbj6fPygTieDpmT24tNhLNi3gIC8ghSRPeRoE38
	 cYu8V2zuecdVNcGYSOO5uGxULzwHAApgkfMdEPhagQ7j64/SqzSLuFc3OKzcq5f0YV
	 sQrMooikc5IlWruRjIhcUY0IWjiTPTxSFb6f9VRVMl25Yh6UJF7oX+7fr7LF+YAA6V
	 AkqQk9JeDjkw+8achy+Pfoe7pRJVbCIC03PZg3piuYq9Ta6Twq07omS0Kz1793NHrE
	 HonM6HM1Czg1w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8ORqPts7aE
  kg4f/ZC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxla5awFKxjr7iw/gVTA+NVti5GLg4hgSeM
  EsuPtEE515kkXtyazQzh7GaUuPF4KmMXIycHm4CaxPRbN1hBbBEBfYmls/cwg9jMAioSL373s
  IPYwgI2Et82PwGrZwGKnzjXwQJi8wo4SnReugzWKyGgIDHl4XuwXk4BJ4mnDVOZuhg5gJY5Sk
  yfqwhRLihxcuYTFojxEhIHX7xghmhVlJh9uZkFwq6QmDFjGxuErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1VSUWZ6RkluYmaOrqGBga6hoamuqa6RsbFeYpVuol5qqW55anGJrqFeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgEKcUs77cwTi976feIUZJDiYlUd6ptYeShPiS8lMqMxKLM+KLSnNSiw8xy
  nBwKEnwOq0GygkWpaanVqRl5gAjCiYtwcGjJML7dRFQmre4IDG3ODMdInWK0Zjj6pUre5k5Nu
  3rOsAsxJKXn5cqJc67dg1QqQBIaUZpHtwgWKRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCT
  MmwIyhSczrwRu3yugU5iATrlRdQDklJJEhJRUA9OsZZXvWGdrbjkf0B+xv3Z7gLveTMbMx23/
  z4qWeM/bsEydYQp7ksCd9deFjTfw8/J/vvzkZ+jDh0nKf8PqE258Nyo4d2mFY9OEFlc//YKMd
  gl11e328iueZ3a8je1RTuFaHb7g9+TTc18tKuLXTtr+TT9O84brluIv/2vnL4s6sU5s3bnDXI
  +dniT47f/tXxfLfTCwTTj+1FuPz0/flDrtrHp2+tWfAwszi74Jmi+V/PQ0dLuj06cUuQhGxzk
  3kw2e26z5cKvVKKdgeVnm8pOMl5v4jX5KBJfGdG0pmBbOpyW8/MH2RUnTVn9lEcoqyW1R6m7f
  l/xgXw7LtFOlV4Sm3Nz5/VjJRumPVUz1zlVKLMUZiYZazEXFiQAskjEsbwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-591.messagelabs.com!1656925670!129161!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20980 invoked from network); 4 Jul 2022 09:07:50 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Jul 2022 09:07:50 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1EB51100199
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  4 Jul 2022 10:07:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 12F96100043
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  4 Jul 2022 10:07:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 4 Jul 2022 10:07:48 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bats: upgrade 1.6.1 -> 1.7.0
Date: Mon, 4 Jul 2022 17:07:21 +0800
Message-ID: <1656925643-8143-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
References: <1656925643-8143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Jul 2022 09:07:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97683

Changelog:https://github.com/bats-core/bats-core/releases/tag/v1.7.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.6.1.bb => bats_1.7.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-test/bats/{bats_1.6.1.bb => bats_1.7.0.bb} (94%)

diff --git a/meta-oe/recipes-test/bats/bats_1.6.1.bb b/meta-oe/recipes-test/bats/bats_1.7.0.bb
similarity index 94%
rename from meta-oe/recipes-test/bats/bats_1.6.1.bb
rename to meta-oe/recipes-test/bats/bats_1.7.0.bb
index 7d72a5198..56b47959d 100644
--- a/meta-oe/recipes-test/bats/bats_1.6.1.bb
+++ b/meta-oe/recipes-test/bats/bats_1.7.0.bb
@@ -10,8 +10,8 @@ SRC_URI = "\
   git://github.com/bats-core/bats-core.git;branch=version/1.6.x;protocol=https \
   "
 
-# v1.6.1
-SRCREV = "1977254c2a7faa2e0af17355856f91dc471d1daa"
+# v1.7.0
+SRCREV = "410dd229a5ed005c68167cc90ed0712ad2a1c909"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


