Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855D2C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 09:47:16 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.47392.1653990434152468775
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 02:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eZYgzx4y;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653990432; i=@fujitsu.com;
	bh=ZTW+ARAvpky5+34LqsYS6uou3Mrqepx1c641ngm/KLU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eZYgzx4yL1ycKjyxmMvf7x1MjF7w+1c6HQf15YRuukhAVlqDawASE8SSjsTppZnWV
	 teJaSw2FJuFqk6zrTd0tS7hHV4RnWughuVbrdwtrSyvtCnJDFbYfoIQN0g0qqKH1VU
	 Wi+p0tlKP9OszV8VxSeWB8nNdcXl2srytZV0U47luZx3JfCikDbx7gI+Tb7Tv9mIOb
	 YNqkA1pskKofazL2jAYy/aqACUSboGmmIP4qs9uG9X6v67QkzB0V9Qqm58kLhoODkT
	 BjF8iVHUpCV6BztYOqM7pXWFDIxnpVyMrXQo9ZU5rmIsUoD0dSZCawOpvGpOWD1kdT
	 ZVRGUy0KKfTzg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8ORqCv/ZGq
  SwaI1+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bt2c+YCpo4Kt4+n8TcwNjK3sXIxSEk8IRR
  YsPcPhYI5wKTxJJzm9kgnD2MEutn/2DtYuTkYBNQk5h+6waYLSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBa4sjD90wgNouAqsSRK3fAbF4BJ4klK1+B1UsIKEhMefgezOYUcJY43/oczBYCqln+ez
  c7RL2gxMmZT1gg5ktIHHzxAqpXUWL25WYWCLtCYsaMbWwQtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjDZJRZnpGSW5iZk5uoYGBrqGhqa6lma6RoYGeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIGhnFKccGkH47p9v/QOMUpyMCmJ8gZfnpokxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYJ3yWOgnGBRanpqRVpmDjCuYNISHDxKIrzuD4HSvMUFibnFmekQqVOMilLivJOvASUEQB
  IZpXlwbbBYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcXZDxPZl4J3PRXQIuZgBZf+zY
  FZHFJIkJKqoEpPPpqywE1HYuCE3JKR5/vYFWecX3mx7cBB579a7Ht4T6ybGN85/J+Dd2USYcj
  dt99uko68S/bsXXnPWY6TlplkPn74YmMgzkLGybzlp5jeLJT49GS5XyZB3X8d+05OLn88SEFC
  cHGyN2bn1Xk7OCuvT59e5FFTbD3ERnOHc6sj8WZFNaXPn1pIK8fbbTt2Xat217q97WiQlkPVk
  zzeL4823V3d/E0ln6FE4eeSdpbqeRM+OU35/YJnndHc764s653k/w/LbjKx7TK/diR/Yvfel9
  43XlHvaXV71fDI7G5kWv73FlLcp7duNy0faOf4sGMJVOkFYNrvIIPRbhMmca/46m3cfz9pZZL
  Wa7luFvUKLEUZyQaajEXFScCABeJrgFgAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1653990431!248294!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25128 invoked from network); 31 May 2022 09:47:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 31 May 2022 09:47:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 128B810018E
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:47:11 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E2DF7100181
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 10:47:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 31 May 2022 10:46:51 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] links: upgrade 2.26 -> 2.27
Date: Tue, 31 May 2022 17:46:39 +0800
Message-ID: <1653990400-31527-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653990400-31527-1-git-send-email-wangmy@fujitsu.com>
References: <1653990400-31527-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 09:47:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97348

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/links/{links_2.26.bb => links_2.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/links/{links_2.26.bb => links_2.27.bb} (79%)

diff --git a/meta-oe/recipes-support/links/links_2.26.bb b/meta-oe/recipes-support/links/links_2.27.bb
similarity index 79%
rename from meta-oe/recipes-support/links/links_2.26.bb
rename to meta-oe/recipes-support/links/links_2.27.bb
index 3c1ee4f2b..4803353a5 100644
--- a/meta-oe/recipes-support/links/links_2.26.bb
+++ b/meta-oe/recipes-support/links/links_2.27.bb
@@ -8,4 +8,4 @@ EXTRA_OECONF = "--enable-graphics \
                 --without-libtiff --without-svgalib --with-fb \
                 --without-directfb --without-pmshell --without-atheos \
                 --without-x"
-SRC_URI[sha256sum] = "f05b3577f25dbe63e491c424f0ecb31f7bfadce9b2bc2f111dfed049c004c9cb"
+SRC_URI[sha256sum] = "d8ddcbfcede7cdde80abeb0a236358f57fa6beb2bcf92e109624e9b896f9ebb4"
-- 
2.25.1


