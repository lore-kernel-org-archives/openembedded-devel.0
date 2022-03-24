Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C750C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 09:18:34 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.8787.1648113512519119973
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 02:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vXVee1IU;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648113510; i=@fujitsu.com;
	bh=1UJqhNkzUt/JmzktwB2rldyQAdQNTFEWi4DB6dYVp9w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vXVee1IUv7Rr8xHpqXAmc/oFjSOOA2E1hXlPWVnGu3M1q+Cv907FfnwMorL98Y0xw
	 1PDteQfJCDnbUGUEO28aLCgXXd8dAXwGlBpIRK6SWskxC2u9ctW6ehkgXn6j8vA070
	 Ta05J+BTIGwX49Y577FbAWPOQCInPtfLUPpgQiEZ6FbS5jk7Ry8hcN6V3Mj/ewzHft
	 LkitmRWB1Ta90jwl4B5gNGhDcVzej2LMZWooHL9Qb8kA9Di3xZrxdCy02tjjcED2ds
	 cPRND64bjXlz5faPMx1bsR53fEVTYRJOCFotpkmrbgqj2kL6YsFXmYQZO9FO1A+I6g
	 Hl7GIvR0jJ2/g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8MxSTfN3Cb
  JYMJfOYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWNL22f2grdcFbc62lgaGL9ydjFycQgJPGGU
  uHrtBiOEc4FJYv2n+1DOSUaJu6eXAjmcHGwC6hKPb74Gs0UE9CWWzt7DDGIzC6hKdF9cww5iC
  wtESZxq/w5mswDF92z4AFbPK+AucWv2XbB6CQEFiSkP3wPZHBycAh4SX96bg5hCQCW/FkdCVA
  tKnJz5hAViuoTEwRcvoDqVJE6s+MgEYVdIvD58CSquJnH13CbmCYyCs5C0z0LSvoCRaRWjdVJ
  RZnpGSW5iZo6uoYGBrqGhqa6xha6hiYFeYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTope
  XmrJJkZgEKcUq/XsYDyx6qfeIUZJDiYlUd7PxjZJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4d
  xkB5QSLUtNTK9Iyc4ARBZOW4OBREuGtMQRK8xYXJOYWZ6ZDpE4xKkqJ88aaASUEQBIZpXlwbb
  AovsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcUZApPZl4J3PRXQIuZgBY//2kJsrgkESE
  l1cDU1KeYFimkGcs+f82jC1fj8rTXXvJsPbta8ukcidUqF4R3b8tK9GVi4nzMdcx/ukSR1UZ3
  RdGHk89n/t/yxdrB76fPKm5ThpqLdVJ/NvKysf4psigSTk3sdVFyOPSnTlxOwXOfRurR8+yrd
  UXCQ3irK4P+7tr0ZLXq4ev5DOUVsUu0rhq+Obh+3+VX147a29aqWv+7zXLusc73Bb1S/dcfKR
  8rXH2z68MK7+Cn983O3ItsCLMqfJ+x8dGUP7oLftTaXBTc8SNk36cr7kmfdd7VKTi9/aX95N7
  deVqNS62cpVNXMUTWTTqbphvx9smOb+WnVZ/+v825tuXz5xrpHdyegmv/cJ/yaP/Q8qMs+ZeZ
  EktxRqKhFnNRcSIA4Fn4hl0DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-565.messagelabs.com!1648113510!182287!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1759 invoked from network); 24 Mar 2022 09:18:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Mar 2022 09:18:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2751110045F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:18:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1AC1E10032A
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:18:30 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 24 Mar 2022 09:18:10 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 4/5] [oe] [meta-python] [PATCH] python3-cantools: upgrade
 37.0.1 -> 37.0.7
Date: Thu, 24 Mar 2022 17:17:59 +0800
Message-ID: <1648113480-29846-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 09:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96188

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...{python3-cantools_37.0.1.bb => python3-cantools_37.0.7.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_37.0.1.bb => python3-cantools_37.0.7.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_37.0.1.bb b/meta-python/recipes-devtools/python/python3-cantools_37.0.7.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-cantools_37.0.1.bb
rename to meta-python/recipes-devtools/python/python3-cantools_37.0.7.bb
index 9642bc5287..c179071afa 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_37.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_37.0.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "5852ad9fd17ddd7b1a1ce87b21b000e7f5716b358cdac4fdaca13b3e292f4c99"
+SRC_URI[sha256sum] = "e603a7e1e40f5b4963c4c64cf4b013264afa009e232a878c73d31c29942e4466"
 
 PYPI_PACKAGE = "cantools"
 
@@ -14,6 +14,8 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-bitstruct \
 	${PYTHON_PN}-core \
 	${PYTHON_PN}-textparser \
+	${PYTHON_PN}-typing-extensions \
+	${PYTHON_PN}-diskcache \
 "
 
 CLEANBROKEN = "1"
-- 
2.25.1


