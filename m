Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A1BC433F5
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 01:16:15 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.2536.1653614169118937250
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 May 2022 18:16:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=q6zTeUC7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653614167; i=@fujitsu.com;
	bh=KwlU08K1VV8oy1hVjPVRdxgK2pOwN+Ty7KC9Y6CaM2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=q6zTeUC7xwtqNjG3xEQjsS9s2lQCDc4RCbztTVuZaFyQrDfFd4Nd+I8fPsIteDZdL
	 e9crvVtOvoQbQGWlgzn9PAAufMJsndR7R17v9LfGoNpGE0DpADsL96WRN7uSYZHwGM
	 P1N/OJ9N8O2T0JUaWzJlqUf9hf4ZoQcRZb1xsq+fWJyABp+b8t2FPqXYonWVBHw3m9
	 x5RrzV4rGyKh4hTl0bCDWcrLRPIjvQcrnW+A6QdUvHVz32pQfi9bi3rizflikyKvhA
	 CSczPQpYvQTAHmcps6HGGHMZGYo+QXumFA9nUE8AjkfqGs/arl8N7vCBjlCHLrgrRG
	 wil9WDk7FowIA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRWlGSWpSXmKPExsViZ8ORqBumNiH
  JYM4nbYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWP1vU0sBd84Kjas2czawDiPo4uRk0NI4Amj
  xL5J4l2MXED2BSaJj42f2SGck4wSJ7fvZAGpYhNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviG
  nYQW1jAR+L9lausIDYLUHzW3m62LkYODl4Bd4mVTwxBwhICChJTHr4Ha+UU8JA4c+cKI8QR7h
  JrzkwCW8UrIChxcuYTFojxEhIHX7xghuhVkjix4iMThF0h8frwJai4msTVc5uYJzAKzkLSPgt
  J+wJGplWM1klFmekZJbmJmTm6hgYGuoaGprrGFrpGhkZ6iVW6iXqppbrlqcUlukBuebFeanGx
  XnFlbnJOil5easkmRmAQpxSrXdnBuGfVT71DjJIcTEqivJn3+pOE+JLyUyozEosz4otKc1KLD
  zHKcHAoSfDOUpqQJCRYlJqeWpGWmQOMKJi0BAePkgivkgxQmre4IDG3ODMdInWKUVFKnPeJCl
  BCACSRUZoH1waL4kuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHl7lYGm8GTmlcBNfwW0mAl
  ocT5vL8jikkSElFQDU01ww6zJDBtFjv/8l29n6hrhfLD1/a+p5YtKMyW/aXRw9nX9lny3+nDV
  70WG2v6zztq/8v33t4XlmJP1Be3+lPbGjvjWXsHO9DuCpQxFhQVz23f9WOTZZHbNzEnF/WWhT
  /2JS793WRo17+KrZN58dfX+6c5nWuKS21kMr/g0XHQV85v60lltFnfQBY1tv8X8/5gfUi3R/3
  l80XveqpiX8+qtFasr00Jd1l+cJv1kMS/jLWX3/1ccZFyt21/q1+2ZOTPg1MQIs3XXgkKOybs
  4rHOp6fpt76jTPVdjxfFnO7dzWqWIeQSHspy7d/je89zFWYn7k4KYrnbM6pRUvv7s/84FRYuL
  2XQPpSSr5ZsosRRnJBpqMRcVJwIAw0AWx10DAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-548.messagelabs.com!1653614166!10958!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30559 invoked from network); 27 May 2022 01:16:06 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 May 2022 01:16:06 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 5161B10018C
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2EE37100196
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 May 2022 02:16:06 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 27 May 2022 02:15:55 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-croniter: upgrade 1.3.4 -> 1.3.5
Date: Fri, 27 May 2022 09:15:31 +0800
Message-ID: <1653614132-27735-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1653614132-27735-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 May 2022 01:16:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97284

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-croniter_1.3.4.bb => python3-croniter_1.3.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_1.3.4.bb => python3-croniter_1.3.5.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb b/meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
rename to meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
index 4158dbe7c..92962c0f4 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_1.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_1.3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "3169365916834be654c2cac57ea14d710e742f8eb8a5fce804f6ce548da80bf2"
+SRC_URI[sha256sum] = "7592fc0e8a00d82af98dfa2768b75983b6fb4c2adc8f6d0d7c931a715b7cefee"
 
 inherit pypi setuptools3
 
-- 
2.25.1


