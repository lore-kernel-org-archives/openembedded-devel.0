Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FF7C4332F
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:45:25 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.15803.1668843921982624639
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vVuL8+UV;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843920; i=@fujitsu.com;
	bh=omrzzJdj0Sdy9O7fYiCRZLl5nnDy0Z2BiK4X0uln/64=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=vVuL8+UVTOfwNAsk8iWll1P/m3g+G9Azr6KIDP7QE5T1AaBmBCSTCy16zwF+T7kn4
	 jg7oLZIboujffDs/zfSCZSj0x7xtFoTsBFXCaqMmWUWqOwL9FWm1L7yTRJF3HOxjOb
	 8TdQcRlt3RuyRc/wFqRXub46xsNli/3ahNv4eEJApV7ec3jbEfTqJEGMPQmne+brRv
	 tJJorEob2YrNUO+B4q42tuWsKWeWDL+O/f2zg/qaJoGcNmGnUeOLtxEtUIN6FybYnu
	 iEzj74u1TRplF4Hd6T58yOqLjNY0CUMi7mK/132n/hrtl6iFwMHonx9BKGNotnT3Fd
	 BknGc64ctqqVg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqNvfWZF
  ssO+tgsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnHpyTeWgh0cFWf6T7A3MN5n72Lk4hASeMIo
  MXfePxYI5zqTxPFlk5ghnD2MEm/uTAcq4+RgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8es
  BphAQ+Jx+smM4HYLAKqEs9WzGcEsXkFHCUu7OoF65UQUJCY8vA9WC+ngJPE+WXXwGqEgGr2HP
  3ABlEvKHFy5hMWiPkSEgdfvGCG6FWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyFpX8D
  ItIrRrDi1qCy1SNfQSC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdIL7G8WC+1uFivuDI3OSdF
  Ly+1ZBMjMHxTipWadzD+XfZH7xCjJAeTkijv3vbyZCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  HFtFclCgkWp6akVaZk5wFiCSUtw8CiJ8Ir4AKV5iwsSc4sz0yFSpxgVpcR569uBEgIgiYzSPL
  g2WPxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMexRkCk9mXgnc9FdAi5mAFuc4l4EsLkl
  ESEk1MBmt9D0efVC27srS2eGTvc6JHjh0VLqlr6aFb/KNoJ7OGnYN49d/HcMlT3u2aiuGfC44
  tn6a5uoI34ZHR1aoTWMXSj2ys2+CybZ6dW5/z5oQjm/Oc6ZdivwQ8fC5iuc920kd0jJi2S/8+
  tMmrBK3ejf30XaprT9Yau+dmblz1o0zQqejRCw07grqdxx1/1He/X5m1acJm2PUDXJS/Z4W2i
  mL9WfMktn8IbWr7dvFc10xRZeXuN1SNc+btU7Y4+jjo1P/L5/eWyvW9/Bs+wOnSVz3N13oz1u
  l3J10v1+xwIYzwn7mp5sPRLrXMzOs+8h36twMCYf8Qv9NqwseN0rtM37czKXGtLVsz3f1Y4xv
  hZRYijMSDbWYi4oTAYc7Z/BaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-571.messagelabs.com!1668843919!64803!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14227 invoked from network); 19 Nov 2022 07:45:19 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:45:19 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 431EB106EF5
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:19 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 37338106EF4
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:45:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-django: upgrade 4.1 -> 4.1.3
Date: Sat, 19 Nov 2022 15:44:54 +0800
Message-ID: <1668843897-3019-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
References: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99632

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-django_4.1.bb => python3-django_4.1.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-django_4.1.bb => python3-django_4.1.3.bb} (58%)

diff --git a/meta-python/recipes-devtools/python/python3-django_4.1.bb b/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
similarity index 58%
rename from meta-python/recipes-devtools/python/python3-django_4.1.bb
rename to meta-python/recipes-devtools/python/python3-django_4.1.3.bb
index 44ea5394d..6d800982a 100644
--- a/meta-python/recipes-devtools/python/python3-django_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-django_4.1.3.bb
@@ -1,7 +1,7 @@
 require python-django.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "032f8a6fc7cf05ccd1214e4a2e21dfcd6a23b9d575c6573cacc8c67828dbe642"
+SRC_URI[sha256sum] = "678bbfc8604eb246ed54e2063f0765f13b321a50526bdc8cb1f943eda7fa31f1"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-sqlparse \
-- 
2.25.1


