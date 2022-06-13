Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D55BBCCA47F
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 08:52:35 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.3645.1655110351430101482
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 01:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=HX+sbSql;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655110349; i=@fujitsu.com;
	bh=T72EaQbWp/02Wm7Gx8A74jvQEYUJBMXVa1T+oqVwUEo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=HX+sbSqlEIHh1jUbheLwYFfjNsqfKlNow5Jqq/f8ZtngrSrw+YKWC2nGCkxbGW4IY
	 42jRofcqxpK7RlFKyXcurWTkprLl1LyQp353Bh3JVfcz2IPDfMK8F0UL8TUxHe+M/O
	 uf2AN4eYNB+Fje/FKH5r3JCwNwUIjjthNgdIsf/bbqKlx1he6KBPv+rYjje3b3+Vbr
	 ZSy7Tfy2e+BxH+S1rBtbIRDAFfvKAcGTveOyRPO8dHck0IZbppX/DsEG3+/vx6CqVG
	 gZQfFjGnhhx6qF5xo4Wtuu+OoMnZimaR1ytRKSElcar1RJA2IZR/gilvEgrQuXW+PL
	 hEVRm9Jk8rWWg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqHv217I
  kg/OT+CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxvfVfYC9ZxVGw/9YC9gfEWexcjF4eQwBNG
  iXn/9rF0MXICOReYJGY+UIGw9zBKTJ3oAmKzCahJTL91gxXEFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOAvcedgG1gNi4CqxO+XvYwgNq+Ak8ST55fB5ksIKEhMefgerJdTwFni65uXbBC7nCQWLT
  zFClEvKHFy5hMWiPkSEgdfvGCG6FWUmH25GWpOhcSMGdvYIGw1iavnNjFPYBSchaR9FpL2BYx
  Mqxitkooy0zNKchMzc3QNDQx0DQ1NdYGkqYleYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5y
  TopeXmrJJkZgCKcUM8zawTir76feIUZJDiYlUd69X5YlCfEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgffQVKCdYlJqeWpGWmQOMJ5i0BAePkgiv33egNG9xQWJucWY6ROoUo6KUOK/NT6CEAEgioz
  QPrg0Ww5cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfN+BJnCk5lXAjf9FdBiJqDFG08uAVl
  ckoiQkmpgWrxHfJbj846mSCm2A/dl1tkcqrqhFc203JLnxrYz8cy7pR0n9mrPDdESj7SMmWi/
  QTTGfC3vNuvzD5+UzU6JKukwsUl4czTX0ut2xMkzfMxaLDEmeU+uO0s+2bxfxD7/nvHbUmNDQ
  5kcZUFNDjaxR7e2fv3S8rDbOr6PIYtrxZ5fFw6vZrt8QWHj9oQtLomBLxinGgp9tnzenpxV+9
  AgSyzdt2JxcvSO9dMaFhU+/vDw1JIpjqsTHyZ9eKt2SlZohsP11FniLh5fGpWOuO2XaV0e++/
  Z7+DLXxlYWWd+j9k9xV51T5dNEJPuZHHJX28vnrEWijm2VjN+yvT1F0o70x3ePxCbeaP/+Vum
  N7+TlViKMxINtZiLihMBTgb0e1wDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-591.messagelabs.com!1655110348!364100!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6510 invoked from network); 13 Jun 2022 08:52:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-17.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Jun 2022 08:52:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 944A91001A8
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6D9E5100191
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 09:52:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 13 Jun 2022 09:52:12 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ctags: upgrade 5.9.20220529.0 ->
 5.9.20220605.0
Date: Mon, 13 Jun 2022 16:51:52 +0800
Message-ID: <1655110315-25174-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
References: <1655110315-25174-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jun 2022 08:52:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97482

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_5.9.20220529.0.bb => ctags_5.9.20220605.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_5.9.20220529.0.bb => ctags_5.9.20220605.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220529.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220605.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_5.9.20220529.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_5.9.20220605.0.bb
index 1ec8d0e13..099b9bdea 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_5.9.20220529.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20220605.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "fff389b94b8e3fb53bdb59789dabc2693c534804"
+SRCREV = "4e9f5df52498777d46360cb610f63d7af1f4b771"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


