Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3480DC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:57:51 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.7771.1654761461194939363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sjEnk5+n;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654761459; i=@fujitsu.com;
	bh=5ggGbqV5cPCLpupe0fJQ6xoMRYjM3dDvfxlfaXNlDR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sjEnk5+nOiSgK37fRAyzGsOUAQAthqKECur+lnfUQYE9tCuqCrA28IYUdYDi1hq2v
	 jGW+ynYVeLUhyX1vuKqrHIEomT1pnm5RRgP9laU24Tk2t4a9k232wEkczTXgMGPcHK
	 J94JYin3I9gZv7R1VzgTm4xClH6L5yxpDm1ZHpBIbwOylCRl6dUhhDEYMq1JIwhV2G
	 GMJGYCt9ZqOZENCY6PtLaYrd9yXR0ojgF/bJt/si9AoE962w77drKgMGfbwGAjUNMU
	 U2ZLo98HHVxDdgXIYUy10eiD+CsgYneHIJTS6pd1T1J1kLfEcHHWJb/QznjoZU0zPJ
	 Ck8uRM3nOu7Mw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWffz8oV
  JBnf3sVtcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBk9f98zFtznqHj2+ApjA2MXRxcjF4eQwCNG
  ieNnnrFAOGeZJGbNeM8O4exmlNjWuYK1i5GTg01ATWL6rRtgtoiAvsTS2XuYQWxmARWJF7972
  EFsYYEAiatHL4DVsADFd079D2RzcPAKOEm828IBEpYQUJCY8vA9WCungLPEybPTwFqFgEo2TT
  rACGLzCghKnJz5hAVivITEwRcvmCF6FSVmX25mgbArJGbM2MYGYatJXD23iXkCo+AsJO2zkLQ
  vYGRaxWidVJSZnlGSm5iZo2toYKBraGiqa2yka2hkppdYpZuol1qqW55aXKJrpJdYXqyXWlys
  V1yZm5yTopeXWrKJERjGKcUKdTsYr638qXeIUZKDSUmU9+TChUlCfEn5KZUZicUZ8UWlOanFh
  xhlODiUJHhnLgHKCRalpqdWpGXmAGMKJi3BwaMkwmu7DCjNW1yQmFucmQ6ROsWoyzHza9sBZi
  GWvPy8VClx3hSQIgGQoozSPLgRsPi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdzrIFJ7
  MvBK4Ta+AjmACOuLXlQUgR5QkIqSkGph4f5mqu358a/Yknb34Ts75Wl1BkYhGpZMP09dPbNfu
  VN83ebfqk79387q3Kf39ZMV+jUP912HmX7Hf7O/dz7qwSyfhfMa2Mwe/xbK9ruWKCfRasury4
  dgZoRfcsr+EZ6hodoocThVyz26z3p322ij3qUbjSpnytS59vy2qxa9cMTzammH+WOr131y1lI
  dP+GL/TLYWPLa1KnXzI2edq+oyTFcubX/s8S6dLSA5V81NSWpfHOsM9fdXOq1qpsn2CFT9W78
  59pTKjMTcewWR+t8/7XyR/fTsyhSZtFvlUTZmXyJ9lhrFWZxUc9nbe0I94cippz/6XduXzF1S
  Ijy97p7auQPi75fMaN/Zfqk196kSS3FGoqEWc1FxIgA4/tvJagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1654761458!42122!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30048 invoked from network); 9 Jun 2022 07:57:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:57:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id ABE782CA5
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:57:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8625D815
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:57:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:57:20 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2022.4.24 ->
 2022.6.2
Date: Thu, 9 Jun 2022 15:56:59 +0800
Message-ID: <1654761421-29641-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654761421-29641-1-git-send-email-wangmy@fujitsu.com>
References: <1654761421-29641-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:57:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97456

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2022.4.24.bb => python3-regex_2022.6.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.4.24.bb => python3-regex_2022.6.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.4.24.bb b/meta-python/recipes-devtools/python/python3-regex_2022.6.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.4.24.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.6.2.bb
index 28e16001a..3067c0df3 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.4.24.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.6.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "92183e9180c392371079262879c6532ccf55f808e6900df5d9f03c9ca8807255"
+SRC_URI[sha256sum] = "f7b43acb2c46fb2cd506965b2d9cf4c5e64c9c612bac26c1187933c7296bf08c"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


