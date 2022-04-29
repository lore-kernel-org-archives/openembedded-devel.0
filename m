Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EE3C433F5
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:34:43 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.29270.1652085279553883281
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:34:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YG7aPZIr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652085277; i=@fujitsu.com;
	bh=qkjaxuMX1R+UDuPcWXMGICiKpmJGl21PxOKuA8Rp1Go=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YG7aPZIrpt1OjkvUcPL/3i4uQ08Wl6cEsD8sSShQVwzX/HtcRe25Oz+5UHShwbu/D
	 Ir/r5PCPYN3LLcuWzgRZ0kbCeqicoqlGi63EQYj93ok9k8n2o6r5QHPsirGAKIxldG
	 QKlPi+MICCZROqm7vGqHW6mXIitsTYDrRhXuQUvKCC+SOA+eMommNlt4wZU43mijGU
	 pSNeGkQnoCoBTXgccnqoUibr8PzPrJ69ld/JvfTBDi3YRpFmQKmNId0sdSnQG8NOyW
	 4BIK628eXkV649cmW5Gv4C7nT56SCi3F9iDJnJEGouiNvS3wghXxWRkPs+OsYFQtAK
	 i292Hh26lsbGA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8MxSVf2UkW
  Swcz1qhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aFFfPZCiZxVDSd/sXUwLiOvYuRk0NI4Amj
  xKSegC5GLiD7ApPElB+zWSGc3YwS86ZeYgOpYhNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvH
  qBJHBzCAo4Sbw+4gIRZBFQlmo5dB1vAK+AkMfPxbxYQW0JAQWLKw/dgrZwCzhK3b29khTjCSe
  JaywpWiHpBiZMzn7BAjJeQOPjiBTNEr6LE7MvNUHMqJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYrROKspMzyjJTczM0TU0MNA1NDTVNbbQNTQx0Eus0k3USy3VLU8tLtE10kssL9ZLLS7W
  K67MTc5J0ctLLdnECAzilGK1nh2MJ1b91DvEKMnBpCTKW9lUkSTEl5SfUpmRWJwRX1Sak1p8i
  FGGg0NJgjfkHFBOsCg1PbUiLTMHGFEwaQkOHiUR3rsngNK8xQWJucWZ6RCpU4y6HHcX7t3LLM
  SSl5+XKiXOe+oCUJEASFFGaR7cCFh0X2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzFtzEWg
  KT2ZeCdymV0BHMAEd8TGgFOSIkkSElFQDk1U9H9+/3ywTtDfPP+yc6nDC0GXBll9S7dcLFt/N
  blH/Nr/tmfeWimVH8rw8y2fb5TWZ3mH5N8lGa7k4t05pQMlFO+Ptrc5OocXM+g4TI/rm87A6v
  3nb3ti33Nh6od0tdh1fhftmZ9W3zdvxM3Hp7OWHvu/mORB59bzPWvmQF5+sLX4LMnp7hu16ez
  HGReOpxayeTL5W8WDVluUbItcoOZizTgr+O6/v9mutl0u9rb4yHNBmNdR4eWg9911L06nHvnG
  L1C9N/B+ezT9RLfihfNr8lP3z5ddnVso+3Xfly8OTEyNOKb6YUxQix+0oe6Q0YLWbvU/4PaZD
  6Zerc/f395a0za1dX7F996f9Qq4xSizFGYmGWsxFxYkAfybhvmkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1652085277!173780!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13173 invoked from network); 9 May 2022 08:34:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:34:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 43BBB1000FF
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2945010044A
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 09:34:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:34:34 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] xmlsec1: upgrade 1.2.33 -> 1.2.34
Date: Fri, 29 Apr 2022 16:16:35 +0800
Message-ID: <1651220195-27553-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
References: <1651220195-27553-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:34:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97009

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xmlsec1/{xmlsec1_1.2.33.bb => xmlsec1_1.2.34.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/xmlsec1/{xmlsec1_1.2.33.bb => xmlsec1_1.2.34.bb} (96%)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.34.bb
similarity index 96%
rename from meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
rename to meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.34.bb
index 0cca2fe77..3e8772ed6 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.33.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.2.34.bb
@@ -22,7 +22,7 @@ SRC_URI = "http://www.aleksey.com/xmlsec/download/${BP}.tar.gz \
     file://ensure-search-path-non-host.patch \
     "
 
-SRC_URI[sha256sum] = "26041d35a20a245ed5a2fb9ee075f10825664d274220cb5190340fa87a4d0931"
+SRC_URI[sha256sum] = "52ced4943f35bd7d0818a38298c1528ca4ac8a54440fd71134a07d2d1370a262"
 
 inherit autotools-brokensep ptest pkgconfig
 
-- 
2.25.1


