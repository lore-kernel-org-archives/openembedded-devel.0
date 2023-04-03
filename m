Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269BDC761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:08:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.66342.1680516532157172111
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:08:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=eNYjE2Sf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516530; i=@fujitsu.com;
	bh=vHrbMhpC51puGSjx0MYqdUDv6rF/80M775/mfP0/VBM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=eNYjE2SfV00r9hNoxIoiShzYF5aw5HwZhfdFH9wlYUHrRp+oMcNz4KB510RYxBKFY
	 ub8XIAy+UMosQ2whigH+z0IghUCCAW16TN17DBwLXCiTUxm4Hoh5DADmnwSTXBsKGn
	 4AKghPoLxMFqbNAwCeSSzeGIAGkDSwWqd23BNzryG9d+SuWPgvRSy+cbj4zHqs+v5c
	 tcAzDSWQ5uiW5FJRUE5/yEds88muv8u5qh7RX1OtFTx+qRUqeqV94eS7sGzYBCJUWX
	 22es+cckeZSdM9ayLq1KNLKre0YCPZvYO+Ekcpwkvkmxmyw+Xpm5u5zHJExH1S+81p
	 lg8/h7DlTTOMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSXfjUq0
  Ugws3TSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyej39ZCn5xVyzvnMzSwPiaq4uRi0NI4Amj
  ROfrBYwQznUmiQMnfrFDOLsZJc4c6AXKcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLBAgcbW5A6iGg4MFKN66JBAkzCvgJPHy8yVWEFtCQEFiysP3YK2cAs4Sbf2tYOOFgGpaVp
  1jgagXlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVoVpxaVJZapGuol1SUmZ5RkpuYmaOXWKWbqJdaqpuXX1SSAZRKLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM3pTixNs7GJf3/tU7xCjJwaQkyitYr5UixJeUn1KZkVicEV9UmpNafIhRhoNDSYJ33
  iKgnGBRanpqRVpmDjCSYNISHDxKIryKC4DSvMUFibnFmekQqVOMilLivHFLgBICIImM0jy4Nl
  j0XmKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzCu2GGgKT2ZeCdz0V0CLmYAWt0ZpgCwuSUR
  ISTUwbb27aolc7CVLvdCFT3ZrXa9k1mVncZV5YLM2wURLjOvAuvUJQsXSZdb7eX2O1270ff3X
  SoF5chhny5l2pncavfbz+9IWxlRznezU4Fua0WsglqrGeffR3K6W9ykS0w3vrjBqM1t7+mKrj
  fCP1+UbGWQ2VPsHnp1w5/RlE7VFj1xWCHCbShz74Mmabtl2ZPmt75vX7jkiWp/1REzc45vYTU
  XGm5p5507lJW2qYbS7mevpy3JhRW/C+rZkuZ9FRkle013etCXMyddVan/9JrfvWeidqdMP294
  MerRw279Dmx/pO20QX7nsTZbHAgWvvsSNbdWciz0Nz8pYzlE2uXz2aYmQnNHr53MZexuEgoOU
  WIozEg21mIuKEwHzVftAWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1680516529!458060!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30066 invoked from network); 3 Apr 2023 10:08:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:08:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 48C5F1009B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:49 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3C2311000FB
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:08:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:08:46 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.17.0 -> 1.18.0
Date: Mon, 3 Apr 2023 18:08:08 +0800
Message-ID: <1680516490-31075-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
References: <1680516490-31075-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101931

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Updated denylist to include other widely used cookies/headers (#1972)
Forward all sentry- baggage items (#1970)
Update OSS licensing (#1973)
Profiling: Handle non frame types in profiler (#1965)
Tests: Bad arq dependency in tests (#1966)
Better naming (#1962)
New: Implement EventScrubber (#1943) 
New: Added new functions_to_trace option for central way of performance instrumentation (#1960) 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.17.0.bb => python3-sentry-sdk_1.18.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.17.0.bb => python3-sentry-sdk_1.18.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.17.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.18.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.17.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.18.0.bb
index c0a180ad1..add255d5b 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.17.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.18.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "ad40860325c94d1a656da70fba5a7c4dbb2f6809d3cc2d00f74ca0b608330f14"
+SRC_URI[sha256sum] = "d07b9569a151033b462f7a7113ada94cc41ecf49daa83d35f5f852a0b9cf3b44"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


