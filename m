Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E56EEC6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:26:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.191362.1673940403892318726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:26:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cZlXyQUQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940402; i=@fujitsu.com;
	bh=UANKyp9EqEq/jI9QLIqaiMqIr1AfHuag3mzRCA9TPxU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cZlXyQUQ60l4z54y5Cw6xDetqAFP4RAdQamjqdki6Z+fF6+ABbx8DtbNh/Jy/1c/J
	 BTyFOSKgILqzh2P/2TWOEkbHGBZIMKAcHDFv78r9m1V/lEdKxIuXaUyfaWj0gxI0W3
	 X9BpDfzw30t7conF+Xv57qHMu7AMcmz0Br3eKMMyykYBctBgLJV63Id4ioHlZpNkHg
	 EdQNY7KfsKkKdrhxX6B3H6Zar8UpilOMSqNEt8VcNfScgcfrOBlL7FErePlCE5baFE
	 OKsdi/xVgQV8nDPWCIz3DQjpwZ4jXPbwpE9A3omCs9HojIlVSYONjweNrQU9gBJVD6
	 r62olWJsvL2LQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpLvR91i
  ywaJ2U4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePz2qVsBe95KtZNOcDWwNjE3cXIxSEk8JBR
  YsWfr0wQzlUmietLfzJDOHsZJRrer2TsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAVmLH2U4WEJtFQFXixOQNrCA2r4CTxLazq8F6JQQUJKY8fA/WyyngLNE09xyYLQRUs2
  zqa2aIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMZsWpRWWpRbqGJnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgeGbUqzSvoPx07I/eocYJTmYlER5T5oeSxbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  XvKCygnWJSanlqRlpkDjCWYtAQHj5IIb7glUJq3uCAxtzgzHSJ1ilFRSpz3sDdQQgAkkVGaB9
  cGi99LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5HUGm8GTmlcBNfwW0mAlosUfJUZDFJYk
  IKakGJrYrW/6t016x3+OyB+POlW27Xk3O5UwNzFjbIXTIxaKn6n6pxNcEh1jJFRZ/GnaeWXpz
  7QGJ7F9fze3eTG6r9Fjdu6fi5fayhm1fdfwdFyRvu/fozA+Tg0JKK2Wmfdq6xPKb3oS5HI86m
  yaqrBdKvv3oE/dmzWWWInruW7PiY78tCsmW+/CU4Ui1UMhtOT0Dje3rLfuiqt7a7922+b81o6
  QDe8nKupV+Puo3/r2cc5hFerlFrcbbufanlkU94hT/5fF63grVF0tu7X+03Vc2LXFX3gfWGCV
  H11nnHXvq3z69NPna1O5/bjLXVN9ZGyQuid/C2zrRd2fPoVU/mJM3We0zkRHzlmoP+Sy/NPBa
  8yklluKMREMt5qLiRABZHAcZWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1673940401!383029!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1212 invoked from network); 17 Jan 2023 07:26:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:26:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 931261AF
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:41 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 873E31AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:26:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] uftrace: upgrade 0.12 -> 0.13
Date: Tue, 17 Jan 2023 15:26:16 +0800
Message-ID: <1673940378-20528-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
References: <1673940378-20528-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:26:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100627

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* new options
  -L/--loc-filter option to filter by source location  (#1395)
  --mermaid option for uftrace dump  (#1511)
  --no-sched-preempt option to disable preempted schedule events  (#1587)

* new features
  make -Z/--size-filter option work in general  (#1600)
  optionally spawn a background agent to talk using a socket  (#1543)
  add "size" field for uftrace report  (#1495)

* bug fixes
  handle different tracefs mount points  (#1476)
  fix timestamp parsing for external data  (#1549)

* other changes
  add clang-format support
  change to use Github actions
  test both GCC and LLVM/clang  (#1523)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uftrace/{uftrace_0.12.bb => uftrace_0.13.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/uftrace/{uftrace_0.12.bb => uftrace_0.13.bb} (95%)

diff --git a/meta-oe/recipes-devtools/uftrace/uftrace_0.12.bb b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb
similarity index 95%
rename from meta-oe/recipes-devtools/uftrace/uftrace_0.12.bb
rename to meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb
index 111e94866..a429f7948 100644
--- a/meta-oe/recipes-devtools/uftrace/uftrace_0.12.bb
+++ b/meta-oe/recipes-devtools/uftrace/uftrace_0.13.bb
@@ -10,7 +10,7 @@ DEPENDS:append:libc-musl = " argp-standalone"
 
 inherit autotools
 
-SRCREV = "46d536709451609e5e99099216d9dcf567ceeaca"
+SRCREV = "53ec12d40701cf73ddcf5db8cff63b54736d0eda"
 SRC_URI = "git://github.com/namhyung/${BPN};branch=master;protocol=https \
            "
 S = "${WORKDIR}/git"
-- 
2.25.1


