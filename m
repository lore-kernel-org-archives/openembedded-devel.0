Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BF2C6FD19
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 06:15:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.13477.1678428955508293535
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 22:15:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YGZyNYd+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678428953; i=@fujitsu.com;
	bh=YztXBfrtGKux10jkbCGxOLqoGtjLbyNeRbzqil6XGtU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YGZyNYd+i4E0texbSvkr8mIjpnJFctOBE+UQbNbOgA9YFnb1ypJEqSE4PqD4VI+s+
	 WA8onSN8L8ajThdRNu97tsI+VvTal9khB1T2+gQj3B4TQlAVRpj8RVKQmXz21zh9V9
	 LojZ289zJcmR8LgV6Hs3Z2lwEsUhRmqM8yJnMowm4OvcWMN+kqF6ULfj9aTs+QqRQ8
	 sLAH8Ea33cPlBANpBcMfz6s+muaJcGUuK+btVNP4Rvs3MjOWt3WAiwRJFgHGlAwyDr
	 c22gL4M6h6+C2NR8BNV3Ks1r9zWCQ3JuImzkfN9PqzE/k5IM1hB9LfNo5d3bTPymlB
	 6TJG1PhC969kg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSVfyNFe
  KwaIbrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bL7cnsBds4K56sv83awLiSo4uRi0NI4Amj
  RO/rK6wQznUmiSfnVzJDOHsYJX7++cDexcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  WA1wgKeEqeaT4PFWQRUJZovTQSL8wo4SnxY+48VxJYQUJCY8vA9WA2ngJPE3bd9LCC2EFDN7y
  eLoeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKN0w8xQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFqcWlaUW6VroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgQGb0qx2uMdjFv7/uodYpTkYFIS5VVO5UoR4kvKT6nMSCzOiC8qzUktPsQow8GhJMG79
  wRQTrAoNT21Ii0zBxhJMGkJDh4lEV7WHUBp3uKCxNzizHSI1ClGRSlxXtbjQAkBkERGaR5cGy
  x6LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5pUA2c6TmVcCN/0V0GImoMW7tnCALC5JREh
  JNTBVZoTLy005de1xRnn3pE+75j5VT4pw23lDzPH3vqqFb8XVOxN4r/MclJF7+cwlxfVVyZVJ
  DQsz1xWubj2z0ntSf8bdX/tmpK8ulYr+8r0vfLWk2b6uHUkGzlXr/gk5JG3/ME1Zf/KTW5dZg
  j41GC5Tq2rcGH/6wyz+lsCHwhPKPv967OjhcrNhZn+p2cc9CaabszrqE9dzKS2+an1FtcK0af
  uxoBcXP+4/Ffjz/tHTnw+UZnT67k08dDrodgSzranhhfD/x0RD6oSVXnOvnnnY4bqV24/Tijd
  +LA6xuRmds2/6orX78zucjjtyXtok2zLn7dnoyW5mHWb6FkWK67XOPzOaKLXc0WkG66sZV12v
  KrEUZyQaajEXFScCAH8UVGVZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1678428952!647075!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6036 invoked from network); 10 Mar 2023 06:15:53 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 06:15:53 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id C937B10033F
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:52 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id BCABA1000FB
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 06:15:51 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/11] poppler: upgrade 23.02.0 -> 23.03.0
Date: Fri, 10 Mar 2023 14:15:34 +0800
Message-ID: <1678428937-7700-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
References: <1678428937-7700-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Mar 2023 06:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101479

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* PngWriter: Fix potential uninitialized memory use

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_23.02.0.bb => poppler_23.03.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_23.02.0.bb => poppler_23.03.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_23.02.0.bb b/meta-oe/recipes-support/poppler/poppler_23.03.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_23.02.0.bb
rename to meta-oe/recipes-support/poppler/poppler_23.03.0.bb
index 3752c901a..165e155ec 100644
--- a/meta-oe/recipes-support/poppler/poppler_23.02.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_23.03.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://basename-include.patch \
            file://0001-cmake-Do-not-use-isystem.patch \
            "
-SRC_URI[sha256sum] = "3315dda270fe2b35cf1f41d275948c39652fa863b90de0766f6b293d9a558fc9"
+SRC_URI[sha256sum] = "b04148bf849c1965ada7eff6be4685130e3a18a84e0cce73bf9bc472ec32f2b4"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.34.1


