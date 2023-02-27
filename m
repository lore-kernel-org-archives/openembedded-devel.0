Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C28FC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:08:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.85522.1677485266985704106
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:07:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=XgXs/bqR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485270; i=@fujitsu.com;
	bh=hrFCZEy1O0qDfP0vCOLoZh5HFnYp6XMCPTzM+xbza2g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=XgXs/bqRLTZqC2CWB6SK160UER+ZuWZWKGO7Sjxv6b00dU6p8A6c39u56zBHggR6a
	 CfZO3jowqSi0DWS/XD+dETbdFjyuK1ebCPpdwzBUTbcgWcsN1uWwFdYCIo+Qv82LEq
	 NcmhbbepcnokY0iDjkLPW45ETNC7jKcWAShcE1bks5F3TaQ7ljqJK3UYmEjogGnBO9
	 8pXopsFSIVCdaZbO7dBTKuARUEXSyJCApU1aCovHUnG009keswm4oV2r189ucDvxSd
	 PjPHMnc8Q8r6b9t3I9EDVorqb/BeDUX2DMO3ATJo/hguNKKSBDZS38IToqyyMvyJ3T
	 +Oa74byIzu2zQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8OxWfdayp9
  kg+X7RSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1ox7bxtYC75wVWz5Ope9gfEXZxcjF4eQwANG
  iZ3zJrJCOFeYJLYu7meDcPYySrR3HGbpYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  vYuRg4OYYFAibunzUHCLAKqEmc7+8DKeQWcJCbubWEEsSUEFCSmPHwP1sop4CxxtaWbHcQWAq
  rZfPAME0S9oMTJmU9YIMZLSBx88YIZoldRYvblZhYIu1Ki9cMvKFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkaz4tSistQiXUNjvaSizPSMktzEzBy9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzk
  nBS9vNSSTYzA4E0pVm/dwfiz76/eIUZJDiYlUd5FTn+ShfiS8lMqMxKLM+KLSnNSiw8xynBwK
  EnwHkwCygkWpaanVqRl5gAjCSYtwcGjJMLLbASU5i0uSMwtzkyHSJ1iVJQS5+VLBEoIgCQySv
  Pg2mDRe4lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG9UAtAUnsy8Erjpr4AWMwEt3v7wB8j
  ikkSElFQD09TjBlKX/vZHJ9+p0N6jIMUsLVM/O9JhyQG1lZunf1/Ee9+Xwcz25IGG6oV9D6/Y
  2pRdEus4uFcg5bBoS7m53VWnpbejbF41PslcurH62OfPC/4ICrVYah1qyLBWDHrH6tfmuGrtT
  qV0Vr4Fm7uNl7Z4fb30Yfau2XWT40o70010Hhx+/ve07Nu1exxm+C2+G8slIvWgNoP/qEP8zY
  rtN0Qm1IaIS7l6WGY+3JKffkjiwCOJ44ZVa17m5+3w+esdnyyVkhU/82ZI9cM5X9LLHn/2bM8
  62DVrVt+jeiEe/8j5s2Ntji9V6Lyxckmx2rfEubON+Z8+WZMoft1o+4R56af6mEyDV3PN1c9I
  9LVjUWIpzkg01GIuKk4EAJqhQN1ZAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1677485270!303641!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9083 invoked from network); 27 Feb 2023 08:07:50 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:07:50 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 1194E7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:50 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 059CC73
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:07:50 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:07:48 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-auth: upgrade 2.16.0 -> 2.16.1
Date: Mon, 27 Feb 2023 16:07:32 +0800
Message-ID: <1677485254-11554-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
References: <1677485254-11554-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101275

From: Wang Mingyu <wangmy@fujitsu.com>

Bug Fixes
=========
 Add support for python 3.11 (#1212) (1fc95e3)
 Remove 3PI config url validation (#1220) (8b95515)
 Update the docs generator interpreter to unblock documentation build (#1218) (9d36c2f)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.16.0.bb => python3-google-auth_2.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.16.0.bb => python3-google-auth_2.16.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.16.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.16.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.16.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.16.1.bb
index 07dc8d045..c70abb047 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.16.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "ed7057a101af1146f0554a769930ac9de506aeca4fd5af6543ebe791851a9fbd"
+SRC_URI[sha256sum] = "5fd170986bce6bfd7bb5c845c4b8362edb1e0cba901e062196e83f8bb5d5d32c"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.34.1


