Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E7CC4332F
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 04:32:10 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.3027.1669782727345999150
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 20:32:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pto0p71U;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669782725; i=@fujitsu.com;
	bh=T7XWkUuSABRJzoWJ+IIMvo8sse6YeQlGqYiaCRRzSdg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pto0p71UpAjhgW1/xaJ+J0p2iNhV1DtBh4JLKkOjqeVctYFVfKM80esxyFY7ym9D8
	 NWBknKYf7YTtiTTBaFyIqhVwyQsFleM3+FmlnV0Oy/lx7QEYi53RHZsCtykLwuoOUg
	 HiaoxnXXC1Y2/mjF1kalGYH7X326hAkSypCcl4nsnJyBgRH2+LfcShdMCNXGducf4J
	 8Yl7yigrxwR1+udN7XhlxScqRDr//DR2D/YRKz6/UN6wC5QTc72slYwb8EyA7liK+m
	 IvOC/xeuTNbiRj3zceuiVf6gejv4onYxVJ81XLdugFNYs71i02KD2VwmqLDpCcyc4J
	 OygVaWIv5nzww==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxSffInbZ
  kg6trrS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyTB1qYCvZxV+y79pGtgXEHVxcjJ4eQwBNG
  iSnfjLsYuYDs60wSixe1MkMkDjBK3HiSCGKzCShILNx6hhXEFhHQl1g6ew9YjbCAr0TD4v/sI
  DaLgKrEi4NrWEBsXgEPib1HzoPVSwD1Tnn4nhkiLihxcuYTsBpmAQmJgy9eAMU5gGoUJWZPl4
  cor5CYNauNCcJWk7h6bhPzBEa+WUi6ZyHpXsDItIrRrDi1qCy1SNfQQC+pKDM9oyQ3MTNHL7F
  KN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdFLy+1ZBMjMOBSilX6djC+XfZH7xCjJAeTkijv
  1aNtyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeMVvAOUEi1LTUyvSMnOAwQ+TluDgURLh3QrSy
  ltckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd6MW0BFAiBFGaV5cCNgkXiJUVZKmJeRgYFBiK
  cgtSg3swRV/hWjOAejkjDvNJBLeDLzSuA2vQI6ggnoiEgxsCNKEhFSUg1MR+2CLwWyH/jJyRm
  /OZBFo8ZP5rGTsE58lqkaj/WWlz/3Lld6eEBUbeUOYaGaVbPv3P7U+0H0Qt20k1tXvuGe1nKl
  jIP/7gxm/1dNl+/NsVE7EPNpuef8Y0ottpx/Crb9YPrevmhm2sN23cv3a+0FqpnUb8x1q26pN
  G5XnSxemzPr5PVIscPKzx6ssEzgfcSffSjaL0hcNzXjeXntzB+7XZ+qJT+5UPzLuM1Mmu8qg+
  yOzeEJjxd3Gc1ZferDqmSj7iLvmsYKs/27VW15Ys54PYmwXSjp/OhV06m8qDU+u5w1HvE3qS4
  7+v3t06QEnm9htovenk9+4N52VcfyobVGRty1CjvuHfx1PTauYXxKLMUZiYZazEXFiQAbyQqG
  PwMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-11.tower-571.messagelabs.com!1669782724!412422!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19338 invoked from network); 30 Nov 2022 04:32:04 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 Nov 2022 04:32:04 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id ADDE41000D7
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:32:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A15BB1000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:32:04 +0000 (GMT)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 30 Nov 2022 04:32:03 +0000
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-twitter: upgrade 4.10.1 -> 4.12.1
Date: Wed, 30 Nov 2022 12:32:02 +0800
Message-ID: <1669782722-12021-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 04:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99855

Changelog:
=============
* Add 1 second buffer to API v2 streaming timeout (51a5d61)
* Default AsyncBaseStream to abort closed SSL transports (#1904)
* Warn when Tweet data is missing default edit_history_tweet_ids field (3dea0df, #1994)
* Change initial network_error_wait to 0 for streaming (b18c1a6)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-twitter_4.10.1.bb => python3-twitter_4.12.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twitter_4.10.1.bb => python3-twitter_4.12.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb b/meta-python/recipes-devtools/python/python3-twitter_4.12.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb
rename to meta-python/recipes-devtools/python/python3-twitter_4.12.1.bb
index b283aef56..addbe16e0 100644
--- a/meta-python/recipes-devtools/python/python3-twitter_4.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-twitter_4.12.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python module to support twitter API"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=9;endline=9;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[sha256sum] = "310193775d7fc381abd6f37021a9af27f7e9edfcce5ec51bd73ea5f30c21fa61"
+SRC_URI[sha256sum] = "5e4c5b5d22f9e5dd9678a708fae4e40e6eeb1a860a89891a5de3040d5f3da8fe"
 
 PYPI_PACKAGE = "tweepy"
 
-- 
2.25.1


