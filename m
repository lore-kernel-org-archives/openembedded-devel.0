Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9986C4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 11:18:58 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web10.101925.1670066332288211643
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Dec 2022 03:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Oh58glpP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670066330; i=@fujitsu.com;
	bh=j3758NEbnoZuR3w7Ca/ASjxvXwYWB4J2JxlWJ0iybKI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Oh58glpP/QDRdyK2e7QyHgTcryKhG/djib1vDPHLYmUVb1wrZ7PGX9Rhz9Ct+AVYn
	 fx7BzwZAecXk/sFoSR+UjhaD3b9lFmeqoI994A+cSydr4bG1bBQQj/7OsRKd8RQ/Sv
	 Z7dGmkmAxTu3FkmKtGlbOlEqsNt2F9+6wDVibtRu8km6unJvDt1DeXua1BTwjpChFZ
	 t4ehs8gqaFu7ZdTOpRyxWm9oK5JkUsizt/fmXOLIunp7J3qiE+t1PRy7VvOrVznr8r
	 edk3G/A57A1IS6gBg36cCNDJUnzMv1TFA3rVf+QYB5bOzQg49cqXhJauKS7DlIq/3L
	 +6Pjk4VPqMw4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSXemQXe
  ywY8HIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bGJ9IF7TwVW3avZGpg/MnVxcjFISTwhFHi
  fPc6VgjnOpPEyif97F2MnEDObkaJmfuZQGw2ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O4Bq
  xcWCJXY/74VrIYFKP7owiGwOK+Ak8T5nS/B6iUEFCSmPHwPZnMKOEt8aWtmhtjlJHH/3m1miH
  pBiZMzn7BAzJeQOPjiBVSvosTsy80sEHaFxKxZbUwQtprE1XObmCcwCs5C0j4LSfsCRqZVjGb
  FqUVlqUW6hkZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWb
  GIGhm1LMnryD8f+yP3qHGCU5mJREeY+FdSUL8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuAN1O9OF
  hIsSk1PrUjLzAHGEUxagoNHSYS3SxUozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcV4lkB
  kCIEUZpXlwI2AxfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMK+YHtAUnsy8ErhNr4COYAI
  6YiN/F8gRJYkIKakGJp42rU2v4rQ+C3sKMl7Z4HffN2Lpqf5XjmbtP79zLBLMaAo87fQjz7Jc
  6VyM0/L2vZMPtm+8K1Iq/u8yG6fSz7D3zypqPxYtPcymnGVklOPSvFyuYPYKBUGrV/MDIlmPC
  vovy/q84OfOn9d0V09Y+6HJ08n7wmPtc3b3vBuiha41LD6wZyr//SUH/14pF9utpZa2krfJ/V
  b6puyvseKSriuK13M7Stzti2I5+eVG/bE1liJu9wy6f5y7Ff/TxbXk5Y4H79cnmHLLf44495D
  j92qpWJNNy/RYy7LaVk+VVXY4cufv9ANyggvr5tivnse/u/29/tfVX16+ln90Q3r+ZrNoy43N
  a+V3MsxS6UziPKrEUpyRaKjFXFScCABxTbxTZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-585.messagelabs.com!1670066329!185692!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26166 invoked from network); 3 Dec 2022 11:18:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Dec 2022 11:18:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id F1E8C1000D7
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:48 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E52751000C1
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 11:18:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 3 Dec 2022 11:18:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.10.2 -> 2.11.0
Date: Sat, 3 Dec 2022 19:18:14 +0800
Message-ID: <1670066295-24879-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
References: <1670066295-24879-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 11:18:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99934

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Features
---------
  Add support for Python 3.11 (#466) (ff379e3)
  Allow representing enums with their unqualified symbolic names in headers (#465) (522b98e)

Bug Fixes
--------
  Major refactoring of Polling, Retry and Timeout logic (#462) (434253d)
  Require google-auth >= 2.14.1 (#463) (7cc329f)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.10.2.bb => python3-google-api-core_2.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.10.2.bb => python3-google-api-core_2.11.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.10.2.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.11.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.10.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.11.0.bb
index b2e48ccdd..439358d05 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.11.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "10c06f7739fe57781f87523375e8e1a3a4674bf6392cd6131a3222182b971320"
+SRC_URI[sha256sum] = "4b9bb5d5a380a0befa0573b302651b8a9a89262c1730e37bf423cec511804c22"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


