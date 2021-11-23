Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D02DC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 07:52:03 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.8553.1637653921579217411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Nov 2021 23:52:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h5Zx7kXT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1637653919; i=@fujitsu.com;
	bh=kSS/QN+smHvRERs0wIjxmnR6SiKV/rL3Ti/OT5OLeDE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=h5Zx7kXTK/ZBPfZob1vF1HWgjTTPnrUSR1jCDXZbOyEwA/1ANd9MxQacab2aZF1Fm
	 O9uI7MwCWnfwUirI0KhCh489yw7EbMegU0oLYvzm3uMA0YlWLKqlWjNuqRPRCEvIy9
	 ZzkwzjgNFHaR6CuFOhVD1PJnbgnPhZKoyjnJX5LYMLm9keoRLioNhm8qcUNLSnyfLC
	 mASjv3CTWD3yzuxJ4Z4eGo/CyYB7QKmEF5KntvA9OuDV/cCggNxhSLTWBRZalapNrE
	 SPPb42Kdjiu+l4xbkRuselj4Gcwjj03iH/JivQVHuhoX2WjFF0g6vovfTiALeRjQod
	 Zg/1VsC+BRb4w==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-2.aws.ess.symcld.net id D6/37-02703-F9D9C916;
 Tue, 23 Nov 2021 07:51:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSXfe3Dm
  JBgceWlhcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBkTJtxhLTguUPFz0U3mBsYTfF2MnBxCAk8Y
  JWbfTOhi5AKyLzBJLHiwnR3COcko8fvjRUaQKjYBdYnHN1+D2SIC+hJLZ+9hBrGZBVQlui+uY
  QexhQV8JB6dfQ9Uw8HBAhQ/1GkEEuYVcJN4sWkVG4gtIaAgMeXhe2aIuKDEyZlPWCDGSEgcfP
  GCGaJGSeLEio9MEHaFxOvDl6DiahJXz21insDIPwtJ+ywk7QsYmVYxWicVZaZnlOQmZuboGho
  Y6BoamuoaW+oaWprqJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To5aWWbGIEBmVKsfrh
  HYxvLn3TO8QoycGkJMqbFDAnUYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr+hsoJxgUWp6akVaZ
  g4wQmDSEhw8SiK80+YApXmLCxJzizPTIVKnGBWlxHmFpgElBEASGaV5cG2wqLzEKCslzMvIwM
  AgxFOQWpSbWYIq/4pRnINRSZj3Nch4nsy8Erjpr4AWMwEt7t0zG2RxSSJCSqqBKdQmJmZayt3
  ymbnOdtwzDebfiPc4cmC7gWNom4TMhfm9c+vqvKr8rM/bdEkqcoqITL1ye9dbTe2y5bsuH+HR
  P6H7O2vlAaG9044f2dj//4mUkO0+i7ez7/TsypRz6MgPmbzrUe6rGanVLxIt1lQE7Z14wZ15b
  clb0ZIL7rP0f4cefTtDIdz2pRznhZVr1O1mrv3ym42Xk1U5ZN+S370/lPdWXH5Z9zGmjPGuBa
  e05M4NE/037fh75RTn8ZNcWnny6z7W927wcJa1/rd8X/M7/3dnZu7s/MllJ1O8XGnZB6dL+Uw
  JDelFD+6fnX08X3GJTgan5XLeBUG33AQX6vTVT6vMv7S/9mRJ+89Gz//7A5VYijMSDbWYi4oT
  Aez7zlBFAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1637653918!649225!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12816 invoked from network); 23 Nov 2021 07:51:58 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Nov 2021 07:51:58 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7B41610046F
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 07:51:58 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 6C6FB100463
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Nov 2021 07:51:58 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 23 Nov 2021 07:51:45 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-websockets: upgrade 10.0 -> 10.1
Date: Tue, 23 Nov 2021 15:51:36 +0800
Message-ID: <1637653896-2629-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Nov 2021 07:52:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94106

From: Xu Huan <xuhuan.fnst@fujitsu.com>

New features
Added a tutorial.

Made the second parameter of connection handlers optional. It will be 
deprecated in the next major release. The request path is available in
 the path attribute of the first argument.

If you implemented the connection handler of a server as:

async def handler(request, path):
    ...
You should replace it by:

async def handler(request):
    path = request.path  # if handler() uses the path argument
    ...
Added python -m websockets --version.

Improvements
Added wheels for Python 3.10, PyPy 3.7, and for more platforms.

Reverted optimization of default compression settings for clients, mainly 
to avoid triggering bugs in poorly implemented servers like AWS API Gateway.

Mirrored the entire Server API in WebSocketServer.

Improved performance for large messages on ARM processors.

Documented how to auto-reload on code changes in development.

Bug fixes
Avoided half-closing TCP connections that are already closed.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-websockets_10.0.bb => python3-websockets_10.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-websockets_10.0.bb => python3-websockets_10.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-websockets_10.0.bb b/meta-python/recipes-devtools/python/python3-websockets_10.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-websockets_10.0.bb
rename to meta-python/recipes-devtools/python/python3-websockets_10.1.bb
index 004d3beb17..6dd29a9ff6 100644
--- a/meta-python/recipes-devtools/python/python3-websockets_10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-websockets_10.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=78c2cc91e172ca96d6f8e4a76c739ec6"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c4fc9a1d242317892590abe5b61a9127f1a61740477bfb121743f290b8054002"
+SRC_URI[sha256sum] = "181d2b25de5a437b36aefedaf006ecb6fa3aa1328ec0236cdde15f32f9d3ff6d"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


