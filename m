Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F258AC3DA6E
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:20:42 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.48691.1671538841801029238
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=joPUcLzC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538840; i=@fujitsu.com;
	bh=SKlAn6hdpOqtTYhUBBXzrcHuvn7xMf9z3Xj0sKNXCwc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=joPUcLzCchZ4GTLQS7lB+BqS5dg7fAbpoI/E62/p2FpZ4Y8R10XewNUiVpRKuWaXZ
	 A1oMPvGORJz2eaJxSaqHra9U5H0kwvKUOjc2Ev3j2yUAx08HGIGhK5AeTdZJc52F+t
	 g/LBob/0EvaxuLTVa7ANOrLJerK6CqW2J4xAlJ4nnSrI77tv4s9NwbzTdrufTz5Y+Z
	 dvc7O8OVgV9xauDTjah5W3bitjvyUpiyTfMc/GAWD513991uKM9qRW6wS6Ig4sHMzs
	 PmGxHmt0R6NUpZESNWFoveKgbCfS7AMSG1BU9YPIN994ndQqdQN98ZUCsLuTIe0hpr
	 YgDKX3u4Hkkxw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRWlGSWpSXmKPExsViZ8OxWXf6ioX
  JBr9eKVlcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmXX79lL3jBWdHZ0MPWwNjP2cXIxSEk8JBR
  Ys6lfywQzhUmiTdH50I5exglLn46B+RwcrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0sECCxYcsrpi5GDg4WAVWJ7t1iIGFeAUeJRc9fgLVKCChITHn4HqyVU8BJYt+9tewg5UJANY
  83OUGUC0qcnPmEBWK6hMTBFy+YIVoVJWZfbmaBsCskZs1qY4Kw1SSuntvEPIFRcBaS9llI2hc
  wMq1iNC1OLSpLLdI110sqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknR
  y0st2cQIDNyUYsbcHYw7l/3RO8QoycGkJMobFr4wWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  4xFQDnBotT01Iq0zBxgFMGkJTh4lER4e2YDpXmLCxJzizPTIVKnGBWlxHlfLAdKCIAkMkrz4N
  pgkXuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjCvEcgUnsy8Erjpr4AWMwEtPnRpLsjikkS
  ElFQDU0H11p8P71/y573zLmDrUy63knfvpqqcvix9dpHNvfCpb3d1L6wz+/PhrblVic2xytwi
  zbvnmrJCtCOXdu9xNFIR++/YzL6j+cg6b2U7xSVHfv3VcTPru3ktpPtVwZ4LAQ+U77WsVjT91
  CTp4+b/tNZe1XFr/BzOdxLzcyzsT5X882MLl1sbofZZVMLWr6a34cE1jWLTA555M78vCO+XLn
  dfaW7xY6GfXq3LRB/5K7fr1Np+Xft879vN4IdH5/2KFiqN8Q3YPEeCLTq+fLbKEz3j/Or7Jbz
  n7xmc+yrwRkCyKdiK8c+EVQovbDR/TWv/HeAR9TqAk0MrsmiOxLKUqKl1N+tXHP/yQWGvE9Nk
  JZbijERDLeai4kQAdLRrZlcDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-587.messagelabs.com!1671538839!13701!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26392 invoked from network); 20 Dec 2022 12:20:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:20:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 33CC1150
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:39 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 274C2142
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:39 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:20:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 4.21.11 -> 4.21.12
Date: Tue, 20 Dec 2022 20:19:48 +0800
Message-ID: <1671538789-7206-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
References: <1671538789-7206-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:20:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100143

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-protobuf_4.21.11.bb => python3-protobuf_4.21.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_4.21.11.bb => python3-protobuf_4.21.12.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_4.21.11.bb b/meta-python/recipes-devtools/python/python3-protobuf_4.21.12.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_4.21.11.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_4.21.12.bb
index 9d44c161e..5e2fe151e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_4.21.11.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_4.21.12.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2c6a4d13732d9b094db31b3841986c38b17ac61a3fe05ee26a779d94c4c3fb43"
+SRC_URI[sha256sum] = "7cd532c4566d0e6feafecc1059d04c7915aec8e182d1cf7adee8b24ef1e2e6ab"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1


