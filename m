Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83124C4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:35:08 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.37602.1670830504522837078
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:35:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QhuUw5w0;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830502; i=@fujitsu.com;
	bh=iSq5DS7i3pibblA5+ZjgzDpW7qrUUYW322nz2r7wE6U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QhuUw5w0sGRR3/deixbp3ktE6H3f6GGzY4L32VpXvvq8PEI1etDVhCQ4ggPa1gosJ
	 pQlGacitPnTDMyjem5q4Qu3ChqztIVpc7sLK7hf2rwJC96jQhw/WygSZDBZs3Dchwn
	 RQb4sfT4/NAX4KLQLASz4h3NVrbLBF6GS/6Z5ruduyO8R5Le5HQlunwjZM6izJEQHZ
	 RDMXbPwxyAs6p3abuGBXqbRnS9SzDwlZtwiG2lZ+DWwkKFlvhT9nBLDf3YFX6AgcR5
	 wBNC7HaBShZnvuytwEFT5h30zaWfP/HJSlXvzxI4GryzrlaANGY+lqvVmsJIWSeiBN
	 K8JMAeNPRTakA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxSXfZzWn
  JBl0HeCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ozmaS9ZCjo5KyZ0tbE2MC7j6GLk4hASeMIo
  0dW4jamLkRPIuc4kMes2F0RiD6PE/6O32EASbAJSEjfu/wezRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC/hL7Hz4GayGRUBVoudWI1icV8BR4umNr2D1EgIKElMevmeGiAtKnJz5hAVijoTEwRcvoG
  oUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1iNC9OLSpLLdI1NNRLKspMzyj
  JTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHLSy3ZxAgMx5TiVPMdjN+X/dE7
  xCjJwaQkylt5ZVqyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQneDdeAcoJFqempFWmZOcDYgElLc
  PAoifC6gbTyFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqcl/0GUJEASFFGaR7cCFicXmKUlR
  LmZWRgYBDiKUgtys0sQZV/xSjOwagkzGtzHWgKT2ZeCdymV0BHMAEdEfVyKsgRJYkIKakGppA
  NlR2JVi4qohcakjI8Fj7ZOG/bzetVGX8X+XF8Dqtnmpp19uQhHtGUW+Fvpq6ZlLfd17Kpc/1K
  hSSzSlamqcZBfYLTXnXW1swul9mynmfZzOOnU+IX7FG2DOaRT97W8uywvmfx5A/6/Tvc8qrUJ
  zA6+CTNbos0OTzdwv553PaUaa5igcoBa15tWXv/wk7XVJ+9uhwb7rdZZtVmKsX77mq8WnjG9L
  WjDUvC1hjm/W4nTkjNvpJ/p+bzJFbNl1rXKnq4vupeX+Fg8pnfdZbnHeauk/0fLtkECjH0JZo
  dzuE/qRAp235OnDVch6/+ytVXmb0yhQlxs1et+Lb3wP26T+GfVsg9UZE7ePNA2ZkkJZbijERD
  Leai4kQAHl1ihE4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1670830501!138640!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13377 invoked from network); 12 Dec 2022 07:35:02 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:35:02 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9BA361000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:01 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8EB521000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:01 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:34:59 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20221127.0 -> 5.9.20221204.0
Date: Mon, 12 Dec 2022 15:34:27 +0800
Message-ID: <1670830471-3000-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:35:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100035

From: Wang Mingyu <wangmy@fujitsu.com>

docs(man): write more about how to make a release

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20221127.0.bb => ctags_5.9.20221204.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20221127.0.bb => ctags_5.9.20221204.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221127.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221204.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20221127.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221204.0.bb
index 6646b57dc..a3720b56c 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20221127.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221204.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "30df9f6e5154f89a73fb59a95362a62fd8c7abdf"
+SRCREV = "60cc214ba5f24feb6921087389fe1c53e241aba9"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


