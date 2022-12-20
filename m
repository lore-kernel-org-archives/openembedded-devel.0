Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 145A9C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:23:13 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.48906.1671538991609030039
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CYiEaMBh;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538990; i=@fujitsu.com;
	bh=On6ZmxuxB7zQRkOGpy+AINTpgr7WHQO1VgFnxuZ1h6I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CYiEaMBhossc3/FNSrKagx2MVhNZtycoWM4um8LkYyGr/UL+T3PG9NyIbNJx57xFs
	 PkBRFJuDsshtwmjXzU4LQAuyj6Va1aNGlaezWLCDU191PcSyusjZ+lYsp5sgaoSSSG
	 MZGdqaWbQoM6yp2Fm5rNL/ZsxrXB8FyH663VXv5r07Fa5B8WrwXE8OtAyEpDWrDZQj
	 hRgt0B6nknSPeUpsmUKtGk9/4FdYb/Ag7n7Eege5YovbW05JxPTQbY1mFpsaWfT2xb
	 NE+q3OTTJlNtGGPQ24k2vh4auGVlnPxwvpxlsAz4wdhVOMTo1eAkEqxMKLzRGvCSJo
	 5Rljz/MPO/fJg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqKu7cmG
  yQcseDYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPFxblMBZO4KuYdWMDWwNjI2cXIxSEk8IRR
  ouPSFTYI5zqTxMqLP6CcPYwS8y7dY+pi5ORgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBHYub392A1LAKqEr+nvgSzeQUcJSYtX8AIYksIKEhMefgerJdTwEli05m5LCC2EFDNwT
  kHWCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhanFpWlFuka6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To
  5aWWbGIEBm9KseqhHYyvlvzRO8QoycGkJMobFr4wWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  4xFQDnBotT01Iq0zBxgJMGkJTh4lER4e2YDpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc
  77YjlQkQBIUUZpHtwIWFRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMawQyhSczrwRu0yu
  gI5iAjjh0aS7IESWJCCmpBiZDjqDWM9ZmU+//mWLrF+RxXr9iWoGquJL9NeGVS9Nqwt7vaNDS
  L1/qJxUq/u3lfMVO9qWX+DdXbwt0n7WF91qR1aRMZb3m20uqS0/ppxtzbWRiD99g86xB1l6hK
  P/mD623x/Z5HeSpjqyIdXdq3uTWkrB0etyJLQpc+gHeDsr6hbtuLSz60zE386xQ4YK7Ij+2bt
  iqczJiM1NaJYfD776U2cebfltnm7spXMy7XGro+ebwhqiGN2cCG68+lI+aWXvWmfGslPaj+AL
  pNdu+LP1yIa7xJ8up5lt8un4f55T5vi6LrZx7e+MhhRnTruVp3zn7ds7LTs+Ut1NELnMV+11q
  60oPlnP7qm+49LDUMiWW4oxEQy3mouJEAPoywABlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1671538989!392703!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28236 invoked from network); 20 Dec 2022 12:23:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:23:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5C69E10019A
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:09 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 4F3A6100191
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:23:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycurl: upgrade 7.45.1 -> 7.45.2
Date: Tue, 20 Dec 2022 20:22:26 +0800
Message-ID: <1671538949-7267-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
References: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100146

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
This release fixes several minor issues and adds support for several libcurl options.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycurl_7.45.1.bb => python3-pycurl_7.45.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycurl_7.45.1.bb => python3-pycurl_7.45.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
rename to meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
index 407c26484..fb2a41d26 100644
--- a/meta-python/recipes-devtools/python/python3-pycurl_7.45.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycurl_7.45.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING-LGPL;md5=4fbd65380cdd255951079008b364516c \
                     file://COPYING-MIT;md5=be42e1b1e58c8d59c2901fd747bfc55d \
                     "
 
-SRC_URI[sha256sum] = "a863ad18ff478f5545924057887cdae422e1b2746e41674615f687498ea5b88a"
+SRC_URI[sha256sum] = "5730590be0271364a5bddd9e245c9cc0fb710c4cbacbdd95264a3122d23224ca"
 
 DEPENDS = "curl"
 
-- 
2.25.1


