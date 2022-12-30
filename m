Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DBAC4708D
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 03:41:49 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.3745.1672803699990329651
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 19:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hBWPO80z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672803698; i=@fujitsu.com;
	bh=UHm4WHpOzKJYXXIrGudjUU/pRVDqNuNLogi+WVr7fL4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hBWPO80zBJMIXuNBTlvUzLUOzbq2pJNZWwOv9/0IfsCvmRRiF3E27bVTE/A27Noah
	 N/DtDxCXIGvJ12/RoGYwckpK92RrUEO4O7ZoQMamFUXJ5kiPVIC+Xb80Y3asmGJZwy
	 +1rUwZI4JfWzI49fVbG+i87nG2kkjA8tFfctquQNH2wFrHtBKKUvtuKfT0KrtQDaD0
	 A2K2+tzsfbXNoRVanc/gS4EC8cUEG0VhXJzt7HOPJ/A3ya8cSLH3g3BwAqR9ldhDCT
	 lEq6id2cpMqT1EC0XQfhoCXWalQBtoulJ9kHUpIEwHZ7USvGW/S6XLqytR9SjWCsXK
	 802phlc/l9WIw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORqFv4dUu
  ywbEXLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bWE4+ZClp5Knp2X2BrYPzN1cXIxSEk8IRR
  YsXrO4wQznUmibm/VkM5uxklVi5sYuti5ORgE5CSuHH/P5gtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwE/ixOU1rCA2i4CqxPFLT8FqeAWcJP6f/w9mSwgoSEx5+B7I5uDgFHCW6GoTAAkLAZU0f2
  xmgSgXlDg58wkLxHgJiYMvXkC1KkrMvgxRIyFQITFrVhsThK0mcfXcJuYJjIKzkLTPQtK+gJF
  pFaNZcWpRWWqRrpGBXlJRZnpGSW5iZo5eYpVuol5qqW55anGJrqFeYnmxXmpxsV5xZW5yTope
  XmrJJkZg8KYUM07Zwdiz7I/eIUZJDiYlUd6Sz1uShfiS8lMqMxKLM+KLSnNSiw8xynBwKEnwq
  n8CygkWpaanVqRl5gAjCSYtwcGjJMKbBdLKW1yQmFucmQ6ROsWoy3F34d69zEIsefl5qVLivK
  5fgIoEQIoySvPgRsCi+hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd7VIKt4MvNK4Da9Ajq
  CCeiIpDUbQY4oSURISTUwGf75lX2xmekx00rN+xNZAh82qO5xrlxj3BosVl1j21JbI7DwBaNn
  a9N0SbG1rzd/KVm0ZabtrAu37xybsbV6ub7slV8in+q2LY935+lMm7vQXD3M07TA8jPz8y+Wd
  1qu36nqy19ppRfPOOdY3q6ow5qfW6dLv1K4c8/50ZYcqbAUff8rVd/YnE/YvVkp8Ynx2nmvA7
  a6XvGTlD+ddytkFNrs0CsTuOz+lK7pv5hNrV/W+x91eyWkdFhzx7Gfs5bXdbj/LNpQ+cLXNeR
  Cu51K8Wt/u8TqyKiHtY+2qa78/fnobe/lfXGnBJY/DxdKMdq64tjld1cP7i1bNed5/KyIju79
  KxcJzwx+dnKvuUbeHCWW4oxEQy3mouJEAKt9YfplAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-591.messagelabs.com!1672803696!960685!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11762 invoked from network); 4 Jan 2023 03:41:37 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Jan 2023 03:41:37 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AEB19100192
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:36 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A2E5F100182
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 03:41:36 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 4 Jan 2023 03:41:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dateparser: upgrade 1.1.4 -> 1.1.5
Date: Fri, 30 Dec 2022 12:58:00 +0800
Message-ID: <1672376281-25331-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
References: <1672376281-25331-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 03:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100379

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Parse short versions of day, month, and year (#1103)
Add a test for "in 1d" (#1104)
Update languages_info (#1107)
Add a workaround for zipimporter not having exec_module before Python 3.10 (#1069)
Stabilize tests at midnight (#1111)
Add a test case for French (#1110)
Remove the requirements-build file (#1113)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dateparser_1.1.4.bb => python3-dateparser_1.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.1.4.bb => python3-dateparser_1.1.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.1.4.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.1.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.1.4.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.1.5.bb
index 74d7b50f0..d61189bfd 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.1.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "73ec6e44a133c54076ecf9f9dc0fbe3dd4831f154f977ff06f53114d57c5425e"
+SRC_URI[sha256sum] = "107f3cc87a60770e10d111349adc1504224a6b60753a47a64b0ec842ab85b5a9"
 
 PYPI_PACKAGE = "dateparser"
 
-- 
2.25.1


