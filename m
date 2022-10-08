Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E521C433F5
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 07:52:41 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.2006.1665215553952504213
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Oct 2022 00:52:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iqXQXfpu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1665215551; i=@fujitsu.com;
	bh=lt+BmTaqsUNpjD3MgKaaJez7NmPsdfyqdfVCx/P9wz8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iqXQXfpuvGOhvTUpHfW9FmnDJCgxuOVHxZlyVfwzeAnSD85+dCsfqKhUvs9QWSdh+
	 sSnXK3H/VZKR220wktYkXGnGVYsTpHFpf6dCXY1/MSiGPaYNrtmElCnAyGZNr8dfaH
	 P1gSMbUkViusV1RYZDULsYw4PAhpzS8p4dbr2CDRknJARMrn3X0QCrlZJQdNiIUkQ3
	 rjPSYZPe9/OxGO1FvpZZZrvALHvfXeihgCYSEw/GbIJlLfan2ODil9/w/oGPPs70KQ
	 dY2iDSF/P6YDLKLWTMYTfWjhPgRlfb4LdkVUl7s8LEjMty68FT//uS3aRYwHOXnju9
	 mvi/SEJpEnbZw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8ORqGun45h
  scHiStMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmjH16UX2gg0cFXumLWBrYLzD3sXIxSEk8IRR
  4tva/6wQznUmiTVfNwM5nEDObkaJjlV5IDabgJrE9Fs3wOIiAvoSS2fvYQaxmQVUJF787mEHs
  YUF/CU+TTnECGKzAMWvrDsNVs8r4CRxb3M7mC0hoCAx5eF7Zoi4oMTJmU9YIOZISBx88YIZok
  ZRYvblZhYIu0Ji1qw2JghbTeLquU3MExj5ZyFpn4WkfQEj0ypGq6SizPSMktzEzBxdQwMDXUN
  DU10gaWqil1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGJQpxQyzdjDO6vup
  d4hRkoNJSZT36VaHZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvB2qjslCgkWp6akVaZk5wAiBS
  Utw8CiJ8AZoA6V5iwsSc4sz0yFSpxiNOa5eubKXmWPm17YDzEIsefl5qVLivLe0gEoFQEozSv
  PgBsEi9xKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYV4JdaApPJl5JXD7XgGdwgR0itVDO5B
  TShIRUlINTLM1i51War72qdW0Tbjf+atz34zF/UlqDIWHim/z7PvnLfh3wff9fOenyXlPULKf
  5/W9XuvVshXWVf+/6PtZHDqyU2oTl+iUT1scSvd/Z440ts1UncTzULlmaXW10OwefocdHt+0p
  ZOYfrz+sE29aNITnjO5ms+v8TJ+273gmKZVfHjFizVsn6Ut/xW7r2oNfLzvy4wHEm/bSt32Sa
  zdbNeytD+x/7yMYuAXv2lX95j5WaS92fbAX2ameGQZ53bxiLkZq82/n9NSXDhHe8fdST3HdL0
  fHPPmbJsbcr6J5+Tps994AiZ0xXB/eR9yOajCeuKJ7Y5rnAMXBTwQOqNaIlI9I6Kj48yMI18r
  7141WKnEUpyRaKjFXFScCACL2ug0VwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1665215550!224102!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31337 invoked from network); 8 Oct 2022 07:52:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Oct 2022 07:52:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1598310018D
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  8 Oct 2022 08:52:30 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 09045100043
	for <openembedded-devel@lists.openembedded.org>;
 Sat,  8 Oct 2022 08:52:30 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 8 Oct 2022 08:52:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220925.0 ->
 5.9.20221002.0
Date: Sat, 8 Oct 2022 15:52:11 +0800
Message-ID: <1665215534-23236-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Oct 2022 07:52:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99092

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220925.0.bb => ctags_5.9.20221002.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220925.0.bb => ctags_5.9.20221002.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220925.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221002.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220925.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20221002.0.bb
index f5bacfd961..de9e6dbe6b 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220925.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20221002.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "299fe525048358ecdfecb9ca91505333c0fb14f4"
+SRCREV = "132379f59e223696f2382a84c2e12b6e7860a7ac"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


