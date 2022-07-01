Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A84C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 00:22:14 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.32819.1656634932081621409
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 17:22:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CrpS++5/;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1656634930; i=@fujitsu.com;
	bh=T4WKgZa89SE2yfv7E50hk/zsupUOtEMrCtJMO4MYhxI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CrpS++5/aPYvJ36SV7zy+DuZ6ZdKht0Ev/vQRSvTwSSjSK1z6bL9HDB2JxrW1FCHk
	 /NLQA868nO2TFAo5Cfgv8eTav34/eoOvXSgEKnPS1qFwPyG7ATWww73lY7mtUtphTL
	 SPXDgWIzA0RMgN1pdlPfST2Y+GP7Zg1H9wc+yg0icCG5RDuy8LqqWEheDscwiClslD
	 VdUilAEWIYrGoQACUYlRVkTsVNB2IF1firMyRgpMfOfBcrOdIJcQY1YyvQj8nDpMoX
	 9n80KwtNBamicnjOzv6MSYOxqVrai4hl025kToEmbzLvk/VTUlJ1htvSwBO6u0AZwI
	 WCCncukuz283A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCIsWRWlGSWpSXmKPExsViZ8ORpGtoty/
  JoHWNlsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnG3bxt7wR2OisUb6xoYuzi6GLk4hAQeMko8
  2jiHEcK5zCSxeu02NghnN6PE8Q/dQBlODjYBNYnpt26wgtgiAvoSS2fvYQaxmQVUJF787mHvY
  uTgEBbwkuhv1QIJswCFb2//ywwS5hVwkng7MxgkLCGgIDHl4XuwTk4BZ4kPf5rAbCGgknntU1
  hAbF4BQYmTM5+wQEyXkDj44gUzRK+ixOzLzSwQdoXEjBkgZ4LYahJXz21insAoOAtJ+ywk7Qs
  YmVYxWiUVZaZnlOQmZuboGhoY6Boamuoa6xpaWuolVukm6qWW6panFpfoGuollhfrpRYX6xVX
  5ibnpOjlpZZsYgQGcEox8/EdjFP6fuodYpTkYFIS5Y08tzdJiC8pP6UyI7E4I76oNCe1+BCjD
  AeHkgSvqM2+JCHBotT01Iq0zBxgNMGkJTh4lER4y0DSvMUFibnFmekQqVOMuhwzv7YdYBZiyc
  vPS5US540CKRIAKcoozYMbAYvsS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEefNApvBk5pX
  AbXoFdAQT0BE7p+0BOaIkESEl1cC0K/JyUlHqO49FRmviIpfsEAmPf1bg5yR8O3m+LCPLzuIJ
  50L6T4QLn/D7+ObijSSeT6/igpldn0ywPTUhe+Hh6sU95zvbI/cwHJfX2bXyrsibR80LTk6/O
  bEgY2Hw7QLDwpv1Nl2/MqbXhnxQDV3qZJB7KGFvTHFVnjFDd9dONi35xbMu8bBlC9xw0VG7ar
  v912eT3TfDeu8adjecOHG0QzCHV/mbwq7VIWHz610MDd+z7biesESrxTHmsNnsfu0LypcY7Ld
  OkCxcvv591M9Fj8uU26VCtbf852w1Ydk2ybNnX3CrkNqFPfMnvHq/3kj1HtvL6VmPrPK8v/wN
  PvPreegDBV+mjkoOK+81H2SVWIozEg21mIuKEwGM59atZwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-585.messagelabs.com!1656634929!16346!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19470 invoked from network); 1 Jul 2022 00:22:09 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Jul 2022 00:22:09 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 509841AB
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:22:09 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 44E687C
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  1 Jul 2022 01:22:09 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 1 Jul 2022 01:22:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.4.2 -> 1.4.3
Date: Fri, 1 Jul 2022 08:21:26 +0800
Message-ID: <1656634887-17192-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
References: <1656634887-17192-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Jul 2022 00:22:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97648

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pandas_1.4.2.bb => python3-pandas_1.4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.4.2.bb => python3-pandas_1.4.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.4.2.bb b/meta-python/recipes-devtools/python/python3-pandas_1.4.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.4.3.bb
index 6d0f669d5..2d3333c3e 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.4.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "92bc1fc585f1463ca827b45535957815b7deb218c549b7c18402c322c7549a12"
+SRC_URI[sha256sum] = "2ff7788468e75917574f080cd4681b27e1a7bf36461fe968b49a87b5a54d007c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


