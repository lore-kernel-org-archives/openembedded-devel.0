Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B7FBC4167B
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:40:18 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.37668.1670830813432745715
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nqOeEr3s;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830811; i=@fujitsu.com;
	bh=Y0Ogm7dAsOrLI952RSICMWPSE9kKc+bqupot7l04o6M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nqOeEr3scRwKozeRBTVJ7YRvYDT3Ul3Xpev//F4Tozm2MLh42g4rRDPzUzhMLYb7C
	 UdTOwKXN9AKrzU80hLSyijRKOXejsgNNiN8waCClEQArdRmh05LWEP4lnrVGUXMww/
	 3XbejAtg29AaGNJq9t6uZj38HZ/ZMSoSrdS2KuBEaJX1qPxSfbJHS/j4yLII74Grev
	 CA6Lb1P8hL3u8XjMO8xuGb96vR7Cmu54JhxGy9BMUXrSpubkDEZMQICJnZBXFGGRcA
	 Q9n0vIaexX6uTfPvZbvxI1lYtWnsrUdlt7RDGDIxXSisBbUuWhfR7I7Ohl4qBpQfjD
	 UyWIcOOeP+GJg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWff2rWn
  JBvMXKFpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBldm7gK9nNU7N6k1sB4gr2LkYtDSOABo8ST
  vhMsEM5lJol9+3ZAOXsYJfY8bWTqYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvHnYQW
  1jAXOLDjE4wm0VAVeLtogdgNq+Ao8T5ZVNZQGwJAQWJKQ/fg/VyCjhJbO+aywpiCwHVrHi5jw
  2iXlDi5MwnLBDzJSQOvnjBDNGrKDH7cjPUnAqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gWMTKs
  YzYpTi8pSi3QNLfSSijLTM0pyEzNz9BKrdBP1Ukt1y1OLS3SN9BLLi/VSi4v1iitzk3NS9PJS
  SzYxAkM3pVj95A7GDcv+6B1ilORgUhLlrbwyLVmILyk/pTIjsTgjvqg0J7X4EKMMB4eSBO/Bm
  0A5waLU9NSKtMwcYBzBpCU4eJREeFWAsSTEW1yQmFucmQ6ROsWoKCXOuxakTwAkkVGaB9cGi9
  1LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5eUHG82TmlcBNfwW0mAlocdTLqSCLSxIRUlI
  NTOGZd3iLuI1m1ch6y5x8WDSPKer5phVy33veVmQ7qV6OrL+0KNi5eN5iO/mIy+f/RN0TZWjf
  XfVMzucn1+9Czl3GP5PlvnWFH3j98WNB1+HoVSUR6y8HVa/8yrKZe15XzULfKSJSgWLr7N9fP
  WQv/FIqKd3av1d4O/eaZTtm777IrHskq+D2HyOJ4gIhdqWJj4pW9Wy/+yhnv82yktf3fu9hT9
  t3aqvYjvw5n3eveb3uWOeiw8qJEuKa0ZxHrz57vWTegxK/6WYn1BQnn7/+4pq3LfPvkoRV+ss
  /3bKW5Red8/gXz03LbTVHVxux2tzO6dw/IZD14XSn9/7S+u4xn8oZ9y4B+jRrcfCx6z4+D5RY
  ijMSDbWYi4oTAfssjUtYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1670830811!316047!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2964 invoked from network); 12 Dec 2022 07:40:11 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:40:11 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 460AA7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 3987E73
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:40:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] tio: upgrade 2.3 -> 2.4
Date: Mon, 12 Dec 2022 15:39:37 +0800
Message-ID: <1670830778-3178-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830778-3178-1-git-send-email-wangmy@fujitsu.com>
References: <1670830778-3178-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100057

From: Wang Mingyu <wangmy@fujitsu.com>

Chaneglog:
==========
 * Add threaded input handling
 * Fix so that is it possible to quit tio in tio etc.
 * Add key command to toggle log on/off

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tio/{tio_2.3.bb => tio_2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tio/{tio_2.3.bb => tio_2.4.bb} (91%)

diff --git a/meta-oe/recipes-support/tio/tio_2.3.bb b/meta-oe/recipes-support/tio/tio_2.4.bb
similarity index 91%
rename from meta-oe/recipes-support/tio/tio_2.3.bb
rename to meta-oe/recipes-support/tio/tio_2.4.bb
index 665c8462f..548ee7c63 100644
--- a/meta-oe/recipes-support/tio/tio_2.3.bb
+++ b/meta-oe/recipes-support/tio/tio_2.4.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0e1a95b7892d3015ecd6d0016f601f2c"
 
 SRC_URI = "git://github.com/tio/tio;protocol=https;nobranch=1"
-SRCREV = "845e683fc9e2d2da686fe0c8e4b19b1245e9904b"
+SRCREV = "6b084a53b84dd7b369a6486f59f74138f6d7221a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


