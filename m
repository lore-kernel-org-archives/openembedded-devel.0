Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9644C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:14:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.191217.1673939634574582891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=LjMopea3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939632; i=@fujitsu.com;
	bh=ozeAK5J9b2UfFffApmozjqgyGHgJDMqOlPcnj1z/Mzk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=LjMopea3MWiyQEnJBAeajIE16+w5t5N9qmeOj5OPGnLT7hxRlM4pgQpuqNdVjA7fP
	 YH+OPm2PGP+yUL/nxWrn+jh+ibRbJhJiWjz8jFdhP2KH75LW5ef02o25+l/s+MwaMG
	 zGqPNMJN7SgGET0D/fkDVFD6bHilj5764BOg/kkqBu8A4cwmLkzneVRMN+kOo/TtOD
	 x/KEqwp+vdSQHWEUvwQcdYn88j0K50AWbVIMO+/cy7ZP4IZEQdNHmSLfqWvuzLS+IK
	 s3x98EaSLNF7CuFsMvkilUR1KxH9uSIGIHtf4tIxc8W2ZX43YfpkTeL3mqdxeFy102
	 lgOCKKUNPITIw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8OxWXe917F
  kg53TdS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1owDfz8xFVzjqNj7so+tgfEvexcjF4eQwANG
  icnP9kI5V5gklv9+ywTh7GWUWLNjHpDDycEmICVx4/5/NhBbREBfYunsPcwgNrOAisSL3z3sI
  LawgL/E8r57YDaLgKrEupc3WEBsXgEnifVzmhlBbAkBBYkpD98zQ8QFJU7OfMICMUdC4uCLF8
  wQNYoSsy83s0DYlRKtH35B2WoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpGuolFWWmZ5T
  kJmbm6CVW6SbqpZbq5uUXlWQApRLLi/VSi4v1iitzk3NS9PJSSzYxAsMxpTiZfQfjmyV/9A4x
  SnIwKYnynjQ9lizEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgtfLHSgnWJSanlqRlpkDjA2YtAQHj
  5IIb7glUJq3uCAxtzgzHSJ1ilGX4+qVK3uZhVjy8vNSpcR5V3sCFQmAFGWU5sGNgMXpJUZZKW
  FeRgYGBiGegtSi3MwSVPlXjOIcjErCvE88gKbwZOaVwG16BXQEE9ARHiVHQY4oSURISTUwKbn
  M5+AXZoz6VpfNzrFP6d3eVU4MVzfGicikbF4dLb3R8dHH5GNL3OaV7FCwdL7Cayvnf/Ft8InN
  vVMbAyzcqwVXZjVezXpSt+LC3anyN5L5sh+u/L8qtT9gu/QH4fNysUmfzE9opV6sOiEivVv16
  pruG87fJ1cZdDhND+Jj3TOBc3V/gmznWv4ZX99zLgs/uWxOZvfCvg/SOzf1qQXflGCdqissIs
  GwOXUfu9qhp5wr3s+0+L6Fx9FOL74qu0KKT/yzeo6Vc1lBcGySJafhxWTnou66xTcWuf8RN5y
  5KunzlWqec84XE5n4a19L79wf6b1UqPP67bRJu7feymW78tdcpfqalluICvvDB+eVWIozEg21
  mIuKEwGkBH13TgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1673939631!378450!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10790 invoked from network); 17 Jan 2023 07:13:51 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:13:51 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 3256A7C
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:13:51 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2646173
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:13:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:13:49 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 6.0.20230108.0 -> 6.0.20230115.0
Date: Tue, 17 Jan 2023 15:13:33 +0800
Message-ID: <1673939617-20032-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:14:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100594

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.0.20230108.0.bb => ctags_6.0.20230115.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.0.20230108.0.bb => ctags_6.0.20230115.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230108.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230115.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.0.20230108.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.0.20230115.0.bb
index 60579ede0..adae87664 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.0.20230108.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.0.20230115.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "dfdabb5ba13b3db2c278a732b4cc1d51f1d9bcf8"
+SRCREV = "c39ff7a753a286d9bd7460a1a1e092746d592fbd"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


