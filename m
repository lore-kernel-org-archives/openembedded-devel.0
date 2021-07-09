Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.114])
 by mx.groups.io with SMTP id smtpd.web09.5312.1625794326520687687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Jul 2021 18:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PxhNZHer;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.114, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625794324; i=@fujitsu.com;
	bh=9m4TY6+/Z9fgMBJw1c6EVqG+okzXpXCz9fKGG55BLxU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PxhNZHerdYGof+JIPyIN/rbHSTD1hGNjXG05yCp9Si9gDuuwnBhdjTTgomUX4ajVH
	 qEKZA1LgICWEI7Ka+oeOYyTaRc6P23SEEJGgEVIYxfUifjKiLbFknjParBnm6xa+ZB
	 t3Lv8N90kq42pGfDKmWIYUgIf7LXuWzLPQBWzoaaPoOnKmxdZteRQ6Jpj6cO1qJvYD
	 X5CUpNUdAeerdJbSR6L1gAwgOMY8MtbB040pA5L+F00eClouNcA5JgM72abQIDB7vq
	 rTcP38ChFk9kvOjlJ3lf5rpfMAGYQ7tZnE4BVnY6hDPvQhPVJ2/2aEfyXMMB/7+L5r
	 yY9nsZ+qx7sUw==
Received: from [100.113.4.179] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.eu-central-1.aws.symcld.net id 13/5A-07695-317A7E06; Fri, 09 Jul 2021 01:32:03 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI1RVe/jz
  BoOGcgsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFn2RbGgiaeip+zN7E2ML7n6mLk4hASmMUk
  sW76XXYIZzejxJ9JJ4EcTg42AV2Jc4/XgtkiAvoSS2fvYQaxhQX8JA4efgIU5+BgEVCRmLCJE
  STMK+Ap8eT4M7ByCQEFiSkP3zNDxAUlTs58wgJiMwtISBx88YIZpFVCQFFi9nR5iPIKiRkztr
  FNYOSZhaRjFpKOBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2Ndc11jUyN9BKrdJP0Ukt1k1PzSoo
  SgbJ6ieXFesWVuck5KXp5qSWbGIFhlFLI/mcH4/XXH/QOMUpyMCmJ8mrNeJ4gxJeUn1KZkVic
  EV9UmpNafIhRhoNDSYL3yBKgnGBRanpqRVpmDjCkYdISHDxKIryci4DSvMUFibnFmekQqVOMi
  lLivJpLgRICIImM0jy4NlgcXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzHsdZApPZl4J3P
  RXQIuZgBYzHH4KsrgkESEl1cC04wuDl4bddOGY5XcjxL3frFbhDfSPO7B0YZOBlpXOpslCh/3
  6WM9piEhfYntcqX9UWWfmauaKF3HvC1YrHZfhPOY2vy8iP1dqqvLHZ1qrqhxae8STfANuqtZz
  H6lxc/3HdqK5u2Yl938Zzu6or7sdDjVcej7fPXZZUabAJLtVwjM2ey7gtDhb9vf4WYV3kT2ff
  BiPn+F1UliYaDxDx5lBcurzqEkn9ynyL9yoL7204G76wfY/NybHvvq+xKExcx37UYl9u4zTlc
  KTWxnmuvycZ7wx4J91WYxQ1tKceKbz6qwa+9KD+I+LG/xIT40+dLEqmLuKlTX8Sel5fc4pFk8
  07/ue8G8sXcFxdPl6cSWW4oxEQy3mouJEAOKIe9UeAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-238.messagelabs.com!1625794322!341414!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17626 invoked from network); 9 Jul 2021 01:32:03 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-5.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jul 2021 01:32:03 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1691W2Ik004367
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jul 2021 02:32:02 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 9 Jul 2021 02:32:00 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.1.0 -> 1.2.0
Date: Fri, 9 Jul 2021 09:31:53 +0800
Message-ID: <1625794313-102950-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Fix for AWSLambda Integration to handle other path formats for function initial handler 
Fix for worker to set deamon attribute instead of deprecated setDaemon method 
Fix for bottle Integration that discards -dev for version extraction 
Fix for transport that adds a unified hook for capturing metrics about dropped events 
Add Httpx Integration 
Add support for china domains in AWSLambda Integration 

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-sentry-sdk_1.1.0.bb => python3-sentry-sdk_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.1.0.bb => python3-sentry-sdk_1.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.1.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.1.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.2.0.bb
index 89c659dba3..e86ff46be4 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.2.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c79f8d3c91fc847350efd28bfe0a341"
 
 RDEPENDS_${PN} += "python3-urllib3"
 
-SRC_URI[sha256sum] = "c1227d38dca315ba35182373f129c3e2722e8ed999e52584e6aca7d287870739"
+SRC_URI[sha256sum] = "9907adbdd30a55b818914512cc143e6beae0bb3ba78b2649f4b079752eb0e424"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1

