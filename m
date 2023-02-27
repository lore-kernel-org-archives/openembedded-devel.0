Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DEBC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:04:31 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.85490.1677485060881841527
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:04:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OKO79s4n;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485059; i=@fujitsu.com;
	bh=BSpDCLtaehWJIacsmKubquTrWvnNGikP7QrADhG3IT8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=OKO79s4nmoWa5hp+kvgQi8UWadjoCC5zsPnh4Wd8QHk9/cUvH/HT0dshCQpIoaTPf
	 r5XgDi3h4jN/jNqqLLt3uYjfSbFn2Z2avqlwGT+e4G60SfgWuyty0ClBFBUJ8qW8/A
	 1gqhs93Q4YWWC+HkQ5sajPFxn9kZrqTj5ueSaMURuXKRBZp4QH9w3MuA6pRdlgMYxq
	 Q52lZ6pn2W9cE6kDhU5mkgX4uyBx56dU8b2cbT74lRFxH7bT3kPda8rBFc/k7FXgbl
	 PbWEBc+e7ztCcoobi8Nj+3b2WDx2Jtp33aI1WYPzq6mwy9AVZhiqtNZ8+1Lx1EU3gf
	 krC659w91O7Cg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpMuU8if
  ZYOsDLYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNL23H2gkVcFT27L7A1MG7m7GLk4hASeMgo
  sWPlDiYI5yqTxJ/569kgnL2MEkcezgfKcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLOArcW3+E7AaFgFViYfHD4PFeQWcJA5O/sAIYksIKEhMefgerJdTwFni4qU5YDVCQDXPX1
  5hg6gXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka6SXVJSZnlGSm5iZo5dYpZuol1qqm5dfVJKha6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvinFyZ92MK7r/at3iFGSg0lJlHeR059kIb6k/JTKjMTijPii0pzU4kOMMhwcShK8B
  5OAcoJFqempFWmZOcBYgklLcPAoifAyGwGleYsLEnOLM9MhUqcYFaXEefkSgRICIImM0jy4Nl
  j8XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzBuVADSFJzOvBG76K6DFTECLtz/8AbK4JBE
  hJdXAZP22s4NNxjzvvL3Xnb+pnqI5KgL3bRjaXrr7NGWuO3P9sX+gYuy5HdVLLbhLN6ydNi3V
  ZO4hhdMKOT/nT5WJvfXpo+6y68YBadOYJBpW7K3u1c83yM4U1j0ofWRp1uoLXn29h2zXh/Gtc
  TcoKD0vovShR87S8rGVfUSY2b6H93ke+j+ffPLXhr+3FzLOuLKthuuEa3lkY5zvw9vnjq/4wV
  +qtFwm9mxyeHad4/LzRzK3vN9s+fDjxlP2s2aamLGnbLlXUxk8+VmsxOEJHM9Omk3aneUR9Xs
  O9/NYpbCs3/1+cyf9N5Od75zx7+qrpe83KzGV8zZZC6q9LauSufbuY2DHhY3FJfKzGmp2GTG3
  K7EUZyQaajEXFScCAAF2u6BaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-732.messagelabs.com!1677485058!211909!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31523 invoked from network); 27 Feb 2023 08:04:18 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-18.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:04:18 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 16E651B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:18 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0AF841B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:04:16 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-astroid: upgrade 2.14.1 -> 2.14.2
Date: Mon, 27 Feb 2023 16:03:41 +0800
Message-ID: <1677485021-11417-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
References: <1677485021-11417-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101267

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 '_infer_str_format_call' won't crash anymore when the string it analyses are uninferable.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_2.14.1.bb => python3-astroid_2.14.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_2.14.1.bb => python3-astroid_2.14.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_2.14.1.bb b/meta-python/recipes-devtools/python/python3-astroid_2.14.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-astroid_2.14.1.bb
rename to meta-python/recipes-devtools/python/python3-astroid_2.14.2.bb
index e59d1d999..e8b86071a 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_2.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_2.14.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "bd1aa4f9915c98e8aaebcd4e71930154d4e8c9aaf05d35ac0a63d1956091ae3f"
+SRC_URI[sha256sum] = "a3cf9f02c53dd259144a7e8f3ccd75d67c9a8c716ef183e0c1f291bc5d7bb3cf"
 
 SRC_URI += " \
     file://0001-pyproject.toml-Replace-with.patch \
-- 
2.34.1


