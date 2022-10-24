Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C489DC38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 05:53:45 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.16218.1666590816493561195
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 22:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Y4zSviKg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666590814; i=@fujitsu.com;
	bh=aoV0wUwyR64KP7S/p+0NsNbAgh7OUREkTbXTamZLmKo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Y4zSviKghyOmnbfx2U6/+KjC6GIlpJfQfr4SHfBzINtknxy3f9248GrIyxEiFV+DE
	 doizMBvrsAGyN/Z+/iyVUKNKrfo1mu9IePedtUg/g+xUkL5BXP2Q4ysNJUTD+Milcw
	 dkr+BA7vhCktCZdB/Q9lET29V1Ck9tU5oj7XHYnV8Ma1nYZo69Yn2g1oodymO9avgU
	 3TbQRirwYKajrD3ByPeTF+1DC7TT2rXh7BzbfzOzCTlLUu5yw8bIEqvwMC9jo7b3Eq
	 pK63mgZ/FfO+YI6S1X77X5tDWble6svytp/vg0QrQgZhWaZoTVW653g+wkqMCqz+lf
	 QFrvWy1HPPWGg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSTdOIyz
  ZYP4tWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPq/s0sBZvYKu7fvsbawHiHtYuRi0NI4Amj
  xIlHj9khnOtMEq87J7JBOHsYJdacfw2U4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphARuJNWcOM4HYLAKqEi19j1hBbF4BJ4mT9/sYQWwJAQWJKQ/fM0PEBSVOznzCAjFHQuLgix
  fMEDWKErMvN7NA2BUSs2a1MUHYahJXz21insDIPwtJ+ywk7QsYmVYxmhanFpWlFuka6yUVZaZ
  nlOQmZuboJVbpJuqlluqWpxaX6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmNKMVv1Dsa3S//o
  HWKU5GBSEuVlEA9LFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBe1IZKCdYlJqeWpGWmQOMDJi0B
  AePkgjvRZA0b3FBYm5xZjpE6hSjJcfU2f/2M3MsB5Mzv7YdYBZiycvPS5US5z2rAtQgANKQUZ
  oHNw4WvZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfPOB5nCk5lXArf1FdBBTEAHXVoRBHJ
  QSSJCSqqBScF4fu924Q2MrHKiiSXecS2fwmr0n2h0iFrbPlYrWBV5K89yk4TkMy8njt2F0ypT
  8hIWHg/Nt/r+7tb9as7SVBtOkY51IgUGsYttvFbVPZbY2rVAWndPbHfE7js/Ni1sl3M6Jdy90
  P7Ba+stQbO2JkW8/LegRvws+9ePpg80Z7HuOHT2W9B+L7bvOznrbOJ2fuVbzHFD+8rz/x7FzS
  KKuw1D685XLj/Ielr02sp9ASc5hN59ecYZEWCg9Wvv1bk2nhp7P6708Xwve+bOxbOfUh4+qhE
  N6lisbpZ0ztRPZ+NfrejYSce+7jl88Hy+TP9Z1jdaD+Tbdq34d2mxcXBqe+2pf7wObqVrO0oj
  LrdtVWIpzkg01GIuKk4EAIdaGYdZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1666590814!194067!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18579 invoked from network); 24 Oct 2022 05:53:34 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 05:53:34 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 246EF1000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:53:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 17E931000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:53:34 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 06:53:32 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] bats: upgrade 1.8.0 -> 1.8.2
Date: Mon, 24 Oct 2022 13:53:16 +0800
Message-ID: <1666590796-27907-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 05:53:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99265

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-test/bats/{bats_1.8.0.bb => bats_1.8.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/bats/{bats_1.8.0.bb => bats_1.8.2.bb} (95%)

diff --git a/meta-oe/recipes-test/bats/bats_1.8.0.bb b/meta-oe/recipes-test/bats/bats_1.8.2.bb
similarity index 95%
rename from meta-oe/recipes-test/bats/bats_1.8.0.bb
rename to meta-oe/recipes-test/bats/bats_1.8.2.bb
index 4b90dcc579..74e683e589 100644
--- a/meta-oe/recipes-test/bats/bats_1.8.0.bb
+++ b/meta-oe/recipes-test/bats/bats_1.8.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "\
   "
 
 # v1.7.0
-SRCREV = "e9b286bb39ad7b0cb7b7d2e819d44d1aff387522"
+SRCREV = "e8c840b58f0833e23461c682655fe540aa923f85"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


