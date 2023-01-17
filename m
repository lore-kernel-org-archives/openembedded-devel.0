Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C52C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:22:22 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.191078.1673940138205040103
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kaKftgRL;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940136; i=@fujitsu.com;
	bh=+O8cFlc+PWPSAIeVNi6pCPB/XOp0NnXrA1lIiN9OKMI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kaKftgRLKZAMO963LD6OzkmRw4Dl8VYxzYH9Mi5hHEiaDd7yYq3AMPIg01CiKpJLx
	 FokxBCnWXVaifwSr9xINMGjcC+burQxQFnqEFx0ARcvb5RXo71MeuXApYCyUmVjUTL
	 cknd9ELssgdRv6BpIQJ24SM33h9cIq0sd55KjGTaLZmHbSHpFlKQEJFTwDeGBDfVjt
	 ldDJS1OicQB1KMlfNZVtlTxn/jQdhstmW6fbU+IjoLrbGZVOHhX378GsURmwaEVNsT
	 BAvqenpnaHa2nmHjMpFwx6M7ktcX5W6F9DhiaRyDQnl+a+LxF+1xISnLZNBjF2Wc/E
	 YQb3FefnhyYwQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWXe5z7F
  kg4XX5CwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oxZzz6zFCzgrDi8aQFTA+Nxji5GTg4hgYeM
  EjfmxnUxcgHZV5gkHrWdZ4Vw9jJK/N04gwmkik1ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  9hBbGEBX4mW9ydZQGwWAVWJya8/s4LYvAJOEn17r4LZEgIKElMevmeGiAtKnJz5hAVijoTEwR
  cvmCFqFCVmX25mgbArJVo//IKy1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdK11Esqykz
  PKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J0ctLLdnECAzGlOL03B2Ml5b9
  0TvEKMnBpCTKe9L0WLIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd5TXkA5waLU9NSKtMwcYGTAp
  CU4eJREeMMtgdK8xQWJucWZ6RCpU4yKUuK8h72BEgIgiYzSPLg2WDReYpSVEuZlZGBgEOIpSC
  3KzSxBlX/FKM7BqCTM6wgyhSczrwRu+iugxUxAiz1KjoIsLklESEk1MIUe/WozayrDicka4Wo
  HZ8S7S63gTn7lGqnHN8MyKHhGRV1Vsk7ESnbpx0YfzcUe7fheZHmH3U5uxu6FWYWKutaTb2+Y
  /GUh88Qij+a617+33lz5Uuik3Urzhh0VomVv1H8l/lK0ijFq0xLw+FV6XnCO3fnntyX7rayUK
  vw3zC3f8Z95+fQFLnOvvhWTDKhfnaJqGNCT/XNGhNPipawPNHrZYr4VlcYYTXpTpLx2xrOXik
  0HvTd82WzdLMdoIDKLabI0527Jo8qFOg5B6iGB3u/PyB/gXLL/4GuubNH17Yplf6y2i8rN2Rn
  +5Os5X+XQ38HWzw39zdkFbzn6vXRiCOl4p8BnnGz+5JLzwoBXSizFGYmGWsxFxYkAHypYVUED
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-732.messagelabs.com!1673940135!161206!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8673 invoked from network); 17 Jan 2023 07:22:15 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:22:15 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E7B36150
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:14 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id DC0C273
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:14 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:22:13 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dnspython: upgrade 2.2.1 -> 2.3.0
Date: Tue, 17 Jan 2023 15:22:00 +0800
Message-ID: <1673940124-20377-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:22:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100614

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dnspython_2.2.1.bb => python3-dnspython_2.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.2.1.bb => python3-dnspython_2.3.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.2.1.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.3.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.3.0.bb
index 67158fbda..3d1dc8d3a 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "0f7569a4a6ff151958b64304071d370daa3243d15941a7beedf0c9fe5105603e"
+SRC_URI[sha256sum] = "224e32b03eb46be70e12ef6d64e0be123a64e621ab4c0822ff6d450d52a540b9"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.25.1


