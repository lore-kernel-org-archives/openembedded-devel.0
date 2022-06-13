Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B553EC43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 09:01:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3704.1655110870106396430
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 02:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mr2KhIZ/;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110868; i=@fujitsu.com;
	bh=Njl5wZeGNGaQ/UKDZW2bWLirv/SQZ+/myb7bDalyBCg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mr2KhIZ/uCYtZH7CV2R71Ym24bRqPLkvEZuGMuSyRVoDcBQBX5/MhaMRsnnwqBvYj
	 NBdUCPdnFKAJ71SxxWl14Rf4cohT9g1swLSsITCnQTJWulZaTqTCOct+MN9+gTjXas
	 fI9vMZu68/vN1Ut0cA/sE+2/e1K+DMUqszTlkFdRTE13jTMwt/KuGRvDuUB+mv1xdt
	 dS/mHJdxxm9wJnrTPdVbcvrFwTAjSXzhJzuLX26An100P1DSUBLqIGD9ya0drCKKBl
	 WgRfzkReKudHh3ZivkYp9sHFQiftsA/rep4pm48c59o/o9pEs/tSwWTfDxjuVFEdIT
	 8piUhmVwKrnVA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrHIsWRWlGSWpSXmKPExsViZ8ORpHv2z7I
  kg58bGS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyD1xexFzRxVCw/fIK9gXExexcjF4eQwENG
  ibn35rFAOGeZJM5N3soM4exhlJi1ahdrFyMnB5uAmsT0WzfAbBEBfYmls/cwg9jMAioSL373s
  IPYwgIeElN37GAEsVkEVCX6ut+B1fMKOEm0Nr0CsyUEFCSmPHwP1ssp4CxxdftqNhBbCKjm/9
  0dLBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWicVZaZnlOQmZuboGhoY6Boamuoam+oaWpjoJVbpJuqlluqWpxaX6BrpJZYX66UWF+sV
  V+Ym56To5aWWbGIEBnJKsTLQe22rfuodYpTkYFIS5d37ZVmSEF9SfkplRmJxRnxRaU5q8SFGG
  Q4OJQleh19AOcGi1PTUirTMHGBUwaQlOHiURHiP/QZK8xYXJOYWZ6ZDpE4xGnNcvXJlLzPHzK
  9tB5iFWPLy81KlxHnXgZQKgJRmlObBDYJF+yVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrz
  TQabwZOaVwO17BXQKE9ApG08uATmlJBEhJdXAFJR/feW/55cu64db1ciU97K6f7z1LvhRk4mD
  Xc366LIXzqX8N1K5Vn9adYp/ttkzk/f9HWldLNJeqXaLgpLmWgdcPHdz92nhrCfGH96GKe/4o
  buI746b/pliQ5VHPGd+2XreEr4jwcf1veKW/KsvvgHSt3n6sw+t9/u3ySS+wd29YrnCqoYtkt
  qzHlucCFlg1B3WsO/g7F8N0vy+i+QmrJfJDHKzyn0jZ8s848pe7y2dMtyJJ3jmTS/9acn1Su2
  tgPa1He3nNu68aFCxa2GqzqTLJ3fZb2PVuMXX/49z4tNZfxxfz9BQbbDvDn4j8abW5CiPz6cP
  31btjGHqczLz3uZ3f9ZaQdklu1MMV2uyKrEUZyQaajEXFScCACq5amdxAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1655110860!119410!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13354 invoked from network); 13 Jun 2022 09:01:01 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 09:01:01 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 881D91B6
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:01:00 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 796911AD
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 10:01:00 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 10:00:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.31.7 -> 1.31.8
Date: Mon, 13 Jun 2022 17:00:18 +0800
Message-ID: <1655110819-25250-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655110819-25250-1-git-send-email-wangmy@fujitsu.com>
References: <1655110819-25250-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 09:01:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97488

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.31.7.bb => nbdkit_1.31.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.31.7.bb => nbdkit_1.31.8.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.7.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.8.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.31.7.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.31.8.bb
index 2de32cc1e..2008816c5 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.31.7.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.31.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
 
-SRCREV = "7c0e2d19d30eb0bd2e079febb5a2c31f65e5023d"
+SRCREV = "c96f025b39a3581405845004e1fcceb5dfa04583"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


