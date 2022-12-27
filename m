Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D1BFC10F1B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:39:05 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web11.153519.1672123143080241507
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:39:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=es3oo3OY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123141; i=@fujitsu.com;
	bh=ZQOLQaUdg0Bo0VYmmz+QXEGjpCIE0bBiwHa67fYNaag=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=es3oo3OYZb/6iI9H/6OYzAh6d4jBWxOes5F27ks9/8cdic1dRsoOzPIKjwUupE7cy
	 o+OlLpNig5Wjo+1u7Do1B3/hRCF+v1gIYf8d/hAyA+reLQqAPM+gM8bin2Ph3Mk9h+
	 fhWhYQpq+ftxPCE7HdigLyXLwpfcTsYzwEvgjp2fbhW6z+2RdUv0i6XtWWntHhJw5R
	 38i/9tvsWC84HresQZXABwKf1twW+vcPuMj92NPCwQQkvmDKQcGaNLZNyw2aTNaH3R
	 WM8XHE5sKq/De1v/1zF+pvlf0Wy1BaPCKG+bPiSJKyUEoCSLyTIJNWW6nV7m7uQbJt
	 iH2KgaF6zVG/A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSZdl8qp
  kg39TNS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxFy/cxFWwVqXj3pIm1gfG+YBcjF4eQwBNG
  iXMHj7FCONeZJPbtPcMO4exhlNj9dzVjFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7CD2MIC3hKH+k+D2SwCqhKNrxaD9fIKOElsmvGaFcSWEFCQmPLwPVgvp4CzROfGX2BxIaCaI5
  3dLBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7AqJWbPamCBsNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYTYtTi8pSi3TN9JKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECgzelmL1gB+PMZX/0DjFKcjApifJKda9KFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBW
  zoJKCdYlJqeWpGWmQOMJJi0BAePkghEK29xQWJucWY6ROoUo6KUOG8iSJ8ASCKjNA+uDRa9lx
  hlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ86qDjOfJzCuBm/4KaDET0OIPh1aCLC5JREhJNTA
  FeobcDmlg/GW1bjOP9SfDI/6msVcurJ75oCGuOFnNePJ05p8O9V9Mq8X4FHzimKdu3thW9DOk
  uCVbXkuu88KNrDsLeSf+VzY7ksG6OPWTXj1770/WxJ7YC/+8NfebTSyPf3W2qfTctHkVOzc8P
  bpaNiA+6y3vKRPr+bK3NvLt7urZtu/Uu9M8LpIvRb8/jn6/7q+H+JeprtFiHw4fbtF/ECAl4D
  NzicrBNfPtWQ6yWUyLz9qvzxtmMveJvuanm4kHueVtmpyVNe9Ktru68F4WKbx8YvZT6cWBYas
  j2z4Jeu+XXXd8359HdxrWLUlbecK8/5XFx/X/KiwluDfW1UbbyOxhOri96agfA9v+LXxKLMUZ
  iYZazEXFiQDidzRiWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1672123140!181233!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11308 invoked from network); 27 Dec 2022 06:39:00 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:39:00 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 47FFB1000D5
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:39:00 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3B97C1000D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:39:00 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:38:58 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-asgiref: upgrade 3.5.2 -> 3.6.0
Date: Tue, 27 Dec 2022 14:38:18 +0800
Message-ID: <1672123098-31844-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
References: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100264

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Two new functions are added to the "asgiref.sync" module: "iscoroutinefunction()"
  and "markcoroutinefunction()".

  Python 3.12 deprecates "asyncio.iscoroutinefunction()" as an alias for
  "inspect.iscoroutinefunction()", whilst also removing the "_is_coroutine" marker.
  The latter is replaced with the "inspect.markcoroutinefunction" decorator.

  The new "asgiref.sync" functions are compatibility shims for these
  functions that can be used until Python 3.12 is the minimum supported
  version.

  **Note** that these functions are considered **beta**, and as such, whilst
  not likely, are subject to change in a point release, until the final release
  of Python 3.12. They are included in "asgiref" now so that they can be
  adopted by Django 4.2, in preparation for support of Python 3.12.

* The "loop" argument to "asgiref.timeout.timeout" is deprecated. As per other
  "asyncio" based APIs, the running event loop is used by default. Note that
  "asyncio" provides timeout utilities from Python 3.11, and these should be
  preferred where available.

* Support for the "ASGI_THREADS" environment variable, used by
  "SyncToAsync", is removed. In general, a running event-loop is not
  available to `asgiref` at import time, and so the default thread pool
  executor cannot be configured. Protocol servers, or applications, should set
  the default executor as required when configuring the event loop at
  application startup.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-asgiref_3.5.2.bb => python3-asgiref_3.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asgiref_3.5.2.bb => python3-asgiref_3.6.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-asgiref_3.5.2.bb b/meta-python/recipes-devtools/python/python3-asgiref_3.6.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-asgiref_3.5.2.bb
rename to meta-python/recipes-devtools/python/python3-asgiref_3.6.0.bb
index 860479199..ac3353ce0 100644
--- a/meta-python/recipes-devtools/python/python3-asgiref_3.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-asgiref_3.6.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 SRC_URI += "file://run-ptest \
 	    "
 
-SRC_URI[sha256sum] = "4a29362a6acebe09bf1d6640db38c1dc3d9217c68e6f9f6204d72667fc19a424"
+SRC_URI[sha256sum] = "9567dfe7bd8d3c8c892227827c41cce860b368104c3431da67a0c5a65a949506"
 
 export BUILD_SYS
 export HOST_SYS
-- 
2.25.1


