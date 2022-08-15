Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 786B2C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 06:12:39 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.13492.1660543950289878287
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Aug 2022 23:12:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vfuBxEfN;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660543948; i=@fujitsu.com;
	bh=5JUIFxQVMCi76cd0K46hjNQplaiB7gV2/cWRsrlchBw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vfuBxEfNjz2yqaA+g9ivyHUDmZUJsoidHoiuyozLLaC/MBxd6idy9+EbSJkjIM8s0
	 +HDpj4P3A6ZnrejhmsxdTqBbjvPi4yyIJOrzwXcf5GDLqCJm5gwFgPWR1qS5VAJaG4
	 y5FG6dbg0N5kU7NwmAoEYvGSN74dLHolmvih27hWFZ2FGTs61oAt+iH2CmPK6tG6rj
	 +UPLppdVzHVBYVmL6GqZG1NJlEVyQy7zdqpYLvXyVZIMaC2xHr07ziIOhnWe0PdHyn
	 SVTBprwxiN1yQjn0BY1lZUMwwKph6lM7lCBi+RCeWI9oIfTmXYk0L7aumQpdPBA6aS
	 /wkPrSrzGEHnw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRWlGSWpSXmKPExsViZ8ORqHv68c8
  kgzNzjC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozd7xYyFpzkrDh39gJ7A+N9ji5GLg4hgSeM
  Et/m3GSCcK4zSfSuvs8C4exhlDg74Td7FyMnB5uAmsT0WzdYQWwRAX2JpbP3MIPYzAIqEi9+9
  4DVCAu4S9xcuYsRxGYRUJW4emITWD2vgKNEw+MlYHEJAQWJKQ/fg/VyCjhJXLy3E6xGCKjmx7
  azjBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJGTO2sUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iYVZaZnlOQmZuboGhoY6BoamgJpY11DEyO9xCrdRL3UUt28/KKSDF1DvcTyYr3U4mK9
  4src5JwUvbzUkk2MwGBOKU7v28G4cd8vvUOMkhxMSqK81y7+TBLiS8pPqcxILM6ILyrNSS0+x
  CjDwaEkwWsGjA8hwaLU9NSKtMwcYGTBpCU4eJREeBfcBkrzFhck5hZnpkOkTjHqcsz82naAWY
  glLz8vVUocYoYASFFGaR7cCFiUX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzOv+CGgKT2Z
  eCdymV0BHMAEdoXf3O8gRJYkIKakGJiXDDc+1lE9c+JTbzW2yKL0yL1362wo5mVvr+8S63duO
  TH4eYcywaFNL8Az3351FHzcGXI2bE+KgnHTd8fOez6WPdxu+vZfBmim4jLXj8f9z17h8d1TO8
  WRYMiMiTsIq3fjuZf/YP7NCN29bZrEgJeB18Y6fGSfqp/2P6Zv0uJrhyOysR2l/5u8QLNpysm
  TfJevr7tZ/1/18ErB64uHiUxHRb7dZVJrqHGvs1vu0STnawnGe0naxPe7LLd7aKKtGdd3JmZ5
  iYh1dnaTJfj+WNWvurQeXsstMtyfdYV3n/d3q5b0TJZ9ELA6+uqy9hLd8YhtrVfAm3YKeFrfg
  SzoH7mTJ1YmefJ8seup89sRNLkosxRmJhlrMRcWJAAHdpGNtAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1660543947!125780!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23855 invoked from network); 15 Aug 2022 06:12:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Aug 2022 06:12:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 3B05F100193
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:27 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2F8E910018D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 07:12:27 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 15 Aug 2022 07:12:25 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] htpdate: upgrade 1.3.5 -> 1.3.6
Date: Mon, 15 Aug 2022 14:12:04 +0800
Message-ID: <1660543925-1319-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
References: <1660543925-1319-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Aug 2022 06:12:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98238

Fix when correcting large time offsets (bug introduced in 1.3.5)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../htpdate/{htpdate_1.3.5.bb => htpdate_1.3.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/htpdate/{htpdate_1.3.5.bb => htpdate_1.3.6.bb} (92%)

diff --git a/meta-networking/recipes-support/htpdate/htpdate_1.3.5.bb b/meta-networking/recipes-support/htpdate/htpdate_1.3.6.bb
similarity index 92%
rename from meta-networking/recipes-support/htpdate/htpdate_1.3.5.bb
rename to meta-networking/recipes-support/htpdate/htpdate_1.3.6.bb
index 08255ae846..a4389ce7e8 100644
--- a/meta-networking/recipes-support/htpdate/htpdate_1.3.5.bb
+++ b/meta-networking/recipes-support/htpdate/htpdate_1.3.6.bb
@@ -14,7 +14,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://htpdate.c;beginline=26;endline=30;md5=2b6cdb94bd5349646d7e33f9f501eef7"
 
 SRC_URI = "http://www.vervest.org/htp/archive/c/htpdate-${PV}.tar.gz"
-SRC_URI[sha256sum] = "a8734d4f1d84d0608d045508608f2d29d8b968da269f83120aaac67709b1bd03"
+SRC_URI[sha256sum] = "3cdc558ec8e53ef374a42490b2f28c0b23981fa8754a6d7182044707828ad1e9"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-- 
2.25.1


