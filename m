Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0D9C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:10:17 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web12.1853.1666055411529983699
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lQ5oaKjY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055409; i=@fujitsu.com;
	bh=Xrw5ASU+vqGEnSpGDBDsjcbku7WCkyTzfZhcjWkyXr8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=lQ5oaKjYjrX9RYuB2gaBSuZEs45xWl77nHOa4D5euhCA404zI011SPV4XAxT+fpcA
	 U59rxJi2fI/sKhY9QQlmwvrveUWEfmj/nurzJNnwZJ/D7MyixW8/oz1xF1ro6Cz6q9
	 /FE1EtuDYgUS3VfNpvOYZyBi4Yt9lyfUWmy6LMCXfpMoeyQ5lSQIu9MLOMoNngEsSX
	 5CyA/84iUXBHqVlr0Ott09AnkDKXpUeAKvkB9+auTZjChWPKZZvsG+cIMw0LptQzDG
	 dEjQfnlUKVzqEH0xiOIp+U1ATmcUdcV4dMW/nZRAg0A5OEo2ciN3lM0oQi5xNynoYy
	 /dkpsxdsy9Vpg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqPvxj2+
  yQetxKYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP+g2OMBfs4Kp7fsG9gfMHexcjFISTwhFFi
  QuMUZgjnOpPEmc6LUM4eRomXmz8ydjFycrAJqElMv3WDFcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CFx5MAxsBoWAVWJ5XOWgdXwCjhKrO08DWZLCChITHn4HszmFHCSWPT7CFi9EFDN8ycL2S
  HqBSVOznzCAjFfQuLgixdQvYoSsy83s0DYFRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxiZVjG
  aFacWlaUW6VroJRVlpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWW
  bGIEBm9KcYr7Dsbjy/7oHWKU5GBSEuXtmOGbLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCt+MHU
  E6wKDU9tSItMwcYSTBpCQ4eJRHeqDNAad7igsTc4sx0iNQpRl2OmV/bDjALseTl56VKifOe/g
  1UJABSlFGaBzcCFtWXGGWlhHkZGRgYhHgKUotyM0tQ5V8xinMwKgnzpv4CmsKTmVcCt+kV0BF
  MQEdk7PcCOaIkESEl1cDk3KvsMedz7rLZtzhqntewlofZ25grZje8P6rBYyn4KfW65YeF5zeX
  zvryY5tB8enoUpUE/wtGn59OElz+qULp6afIX7riv52U5WYxdk/zmcGW/7Tra5amyW67CClRP
  ++tckfmBGzf8fLyOtWFAnyRkm2TZ0+ZebTr5yL2qSqPH0z5aK/KIMdxMSTexGfVNBvzhmU17E
  du3AlynPDTYP65/qaEHitXzUXlWfePaXF6taduqv7Gl8T97Jjuid/bwmebcF/h2WTjscpk5tl
  TDodKN/1ov9HU8/j20seP1zC5zzExdtvzoNmd7SkDi8l2mzCNYzLlCx/Wilqtb9YOmmUnZLc7
  MGGRp96W84+WZfcqsRRnJBpqMRcVJwIAvnl/SWUDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-745.messagelabs.com!1666055409!257442!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30849 invoked from network); 18 Oct 2022 01:10:09 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:10:09 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D4BA6100191
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:08 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C8FC310018D
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:10:08 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:10:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-absl: upgrade 1.2.0 -> 1.3.0
Date: Tue, 18 Oct 2022 09:09:45 +0800
Message-ID: <1666055387-8084-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
References: <1666055387-8084-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99219

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-absl_1.2.0.bb => python3-absl_1.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-absl_1.2.0.bb => python3-absl_1.3.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-absl_1.2.0.bb b/meta-python/recipes-devtools/python/python3-absl_1.3.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-absl_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-absl_1.3.0.bb
index 42b3ddc93a..b376278165 100644
--- a/meta-python/recipes-devtools/python/python3-absl_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-absl_1.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "f568809938c49abbda89826223c992b630afd23c638160ad7840cfe347710d97"
+SRC_URI[sha256sum] = "463c38a08d2e4cef6c498b76ba5bd4858e4c6ef51da1a5a1f27139a022e20248"
 
 PYPI_PACKAGE = "absl-py"
 
-- 
2.25.1


