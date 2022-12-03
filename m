Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7EFC4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:20:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.101813.1670066425139589476
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fdbgqoRx;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066423; i=@fujitsu.com;
	bh=GChNWAuS7r3RGuRZ/jPM9AyUIz+VzBQcHAYTZqm4NIU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fdbgqoRxcpp4MwdiOZJaZxlOkqLEvxhRXxk2ve/OU4aiI/syCgt7w9OobWJYXPmDa
	 oq1GTAT6qcFD7jqKAI5cWxBmdhGL45Lr8V3wZjkEotvMlYVHtzZkDsO7uFo7LMMs4K
	 2CF7hFYCml7HrtY2fnV3FBeVBH/kMsS5zDjtL4xTg3B/kq+Fx1K4I9xyHrErzO4UYr
	 MhBMw9aC7gb5VLMtNc/ACSLKONUKurOqj+YLKNr03rrRiGUYO0X9XIZGGHLEdeWmON
	 ZIxJTZRQBEld3Wu7r7QgiOvyncHt2fYkFlEQmqXB72EeFJfIF/wp8xSGFDPVTemnxz
	 KxvdE1qxzhcBg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8ORpPvNoDv
  ZoGWThcXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvGq4TVTQSdPxYk1FQ2MD7m6GLk4hAQeMkos
  X3OcrYuRE8i5zCSxbm48RGI3o0THgmvsIAk2ASmJG/f/gxWJCOhLLJ29hxnEZhZQkXjxuwesR
  lggUGLS341MIDYLUHzOgkcsIDavgJPEowMbGEFsCQEFiSkP3zNDxAUlTs58wgIxR0Li4IsXzB
  A1ihKzLzezQNgVErNmtTFB2GoSV89tYp7AyD8LSfssJO0LGJlWMZoVpxaVpRbpWuglFWWmZ5T
  kJmbm6CVW6SbqpZbq5uUXlWToGuollhfrpRYX6xVX5ibnpOjlpZZsYgSGYkpxivsOxuPL/ugd
  YpTkYFIS5T0W1pUsxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3UL87WUiwKDU9tSItMwcYFzBpC
  Q4eJRHeLlWgNG9xQWJucWY6ROoUoy7HzK9tB5iFWPLy81KlxHmVQGYIgBRllObBjYDF6CVGWS
  lhXkYGBgYhnoLUotzMElT5V4ziHIxKwrxiekBTeDLzSuA2vQI6ggnoiI38XSBHlCQipKQamFK
  5J/9unZuyrXFp1P2W0iLm74tNW/ueNyh+9N59/KfT/MkB8hIBjVUX/zwMdeVuVzwtxCno/kVA
  wNVzZdytiexKlS/XH68qOWxlzOQ/cb/SwYhvFmvimB86OL2pfvark2dmzWVOc+l1Yt1dqwokt
  Yurr5udTXe6MD/yMHPV5B/lq88wCtU8zDl2/GDBufiTqdKpcftMytgW67m/WPZ84rXPvGHznB
  atWmPF91Svad8RUW8J1kNTxRawrZ54zybxf4Ry2Y5KI0uXH40if468Y7xw8x17+pqn8i+aZSM
  Xrt7Vcbbhq+IsjaMHV/xbwbb2bcY8mzM3NZV4LAqnnjX/Kvv92sJZy5Yc/ag/e+mv5c1KLMUZ
  iYZazEXFiQAYks41TAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1670066422!41368!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22355 invoked from network); 3 Dec 2022 11:20:22 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:20:22 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 63F351AD
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:22 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 58B7D7B
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:20:22 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:20:20 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.14.1 -> 2.15.0
Date: Sat, 3 Dec 2022 19:19:52 +0800
Message-ID: <1670066396-24989-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99936

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Features
---------
    Add api_key credentials
    Introduce a way to provide scopes granted by user

Bug Fixes
---------
    Allow mtls sts endpoint for external account token urls.
    CI broken by removal of py.path
    Ensure JWT segments have the right types
    Updated the lower bound of interactive timeout and fix the kwarg

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.14.1.bb => python3-google-auth_2.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.14.1.bb => python3-google-auth_2.15.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.14.1.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.15.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.14.1.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.15.0.bb
index 68651bb92..315d0aa8a 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.15.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ccaa901f31ad5cbb562615eb8b664b3dd0bf5404a67618e642307f00613eda4d"
+SRC_URI[sha256sum] = "72f12a6cfc968d754d7bdab369c5c5c16032106e52d32c6dfd8484e4c01a6d1f"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


