Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B18C636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 13:35:05 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.8992.1676122495537472196
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 05:34:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fgXx6OTY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676122493; i=@fujitsu.com;
	bh=qRmsozBvcSjWDJEVtWaC6T+fCjPJ4TXBhlw7oT2VeKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fgXx6OTYAHuMyBfXV9L0w4F16qLjrzQ9+wBLmPkDfF70WafqIltobKM+GF21MoIJ1
	 WQLYJbbYi5tf6KAvDjU1sSSVbwaz34lMo5A12qWBFM+8ax2uqXvOdWhQOJZrKbzKVE
	 oE9WXy2xf4B8M9sBxbSrGAXvs/1NbsIGUuzsixsxaWOPP1djtMYAmmfY8j2p+1RYB5
	 uUMUIC1oqWkawBW4gQCSYlH+WzSmsAay041fI0IZD9S8pQwp/HM5mC+WwTZrKWsO70
	 xDzaAqH3Km9ALakR9mNm+VuqoKRoe/v2fQiOcHpQM3agelXvflGfmtAcw9FwxZtQ+/
	 nv9R4b0cYrzeQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWbdm5vN
  kg+PHxC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyFvxuZC5ZzV0yfvZ+pgXELVxcjF4eQwENG
  icl7lrNDOFeYJGZ+vcAG4exllDg04yBjFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MICIRLHnlxjAbFZBFQlmndcYwWxeQUcJf7ePgRmSwgoSEx5+B6sl1PASeJx90ywXiGgmr
  n7NjND1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJVo//IKy1SSuntvEPIFRcBaS9llI2hc
  wMq1iNCtOLSpLLdK10EsqykzPKMlNzMzRS6zSTdRLLdXNyy8qydA11EssL9ZLLS7WK67MTc5J
  0ctLLdnECAzflOLkHzsYd/X91TvEKMnBpCTKu2zz02QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rzLJj5PFhIsSk1PrUjLzAHGEkxagoNHSYS3ezpQmre4IDG3ODMdInWKUVFKnPciSJ8ASCKjNA
  +uDRa/lxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ806dAjSFJzOvBG76K6DFTECLGaSegiw
  uSURISTUwLV+xrzHeufP2C74NNo4C834xTtZ3MXsm6PLcM6tuV9ZsP8OpisGRTjlSM86VzbVO
  vZjKKsn3fU7zrQUF/fb+xzYpHrhgythq9e3y7I27p/tMXfd+gRFb+vz3u14VpU6Zobay0i1u3
  tpwg2Idfh8tx38rsp2Yjy+fKrCdi1Wl+nWu+4uXtRyTef9WCC8yqNsh8yeoxtNp/rEPZwKKlV
  avXq6h909zYYqYQ+ipB/5GEX/6FkWVT1ZartBwhKnS1uznOQs3Gzn1xvjHnUH1Pbsj/p7cJKI
  XuHSTapmtz+PQ4JQ9nLy5Tz9k8PWmFDHxVzK+s3cPvv1o4yGGXE3tSLUCuw17thZd/3DfiudU
  4hslluKMREMt5qLiRACekA8pWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1676122492!642731!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20612 invoked from network); 11 Feb 2023 13:34:52 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Feb 2023 13:34:52 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D1705155
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:34:51 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id C50F473
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:34:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 11 Feb 2023 13:34:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-asyncio: upgrade 0.16.0 -> 0.20.3
Date: Sat, 11 Feb 2023 21:34:39 +0800
Message-ID: <1676122479-6002-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676122479-6002-1-git-send-email-wangmy@fujitsu.com>
References: <1676122479-6002-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 13:35:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101028

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Delete redundant blank lines in the LICENSE.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...est-asyncio_0.16.0.bb => python3-pytest-asyncio_0.20.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.16.0.bb => python3-pytest-asyncio_0.20.3.bb} (61%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.20.3.bb
similarity index 61%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.20.3.bb
index 1dfeab633..24b807822 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.20.3.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python, for testing asyncio code with pytest"
 
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "7496c5977ce88c34379df64a66459fe395cd05543f0a2f837016e7144391fcfb"
+SRC_URI[sha256sum] = "83cbf01169ce3e8eb71c6c278ccb0574d1a7a3bb8eaaf5e50e0ad342afb33b36"
 
 inherit pypi setuptools3
 
-- 
2.34.1


