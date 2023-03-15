Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EBDC76195
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:09:20 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.9012.1678889359996061137
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:09:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EfdUIizF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889358; i=@fujitsu.com;
	bh=0ADu2+9Bb0wiGzP/8ImwHJWiznu+57nZnKwPkgmBS0c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EfdUIizF2COEaw43w9/3WmoOpi1mxcAGKqxWOffKtbwtkoNqeUemLdtp5Uzf1yG5f
	 Rasgo9TkO7JQe5sVg/VhK+GPA/9ZuXRGim2+L6ShhwsYSZ7wPshup9T1Lul7rXpft0
	 xCk/iN+rysldorX+4odGkwdI2k4tq3WBlvAg0fTE9Fc3OHFXjqRDzn9iIJBsmjohQG
	 KXg8Hp8u48Y+OX1+L278nJ2DheN0M+QC82qdNzEztBGYoKT5cXcgwpK00jxlw1Sm26
	 f8KTzUh3p39dM41dd19MQFFae5Q9CDuabHjF3OqmuC5mgS4GpkuhySiDcf09nUVgUN
	 Gmq7u7LPN669A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSbf3omC
  KQctGLYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPtxiHmghmcFbd+P2RvYNzN0cXIxSEk8IRR
  4kPLbEYI5zqTxKTPE5kgnD2MEk8ObGTuYuTkYBOQkrhx/z8biC0ioC+xdPYesDizgIrEi9897
  CC2sIC3xKqXFxlBbBYBVYmN2zaA1fMKOEnsfrgHzJYQUJCY8vA9WC+ngLPEtevPWboYOYCWOU
  kcuFsHUS4ocXLmExaI8RISB1+8YIZoVZSYfbmZBcKukGicfogJwlaTuHpuE/MERsFZSNpnIWl
  fwMi0itG8OLWoLLVI19BUL6koMz2jJDcxM0cvsUo3US+1VDcvv6gkQ9dQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHxTilPkdjBe6furd4hRkoNJSZT3zxqBFCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvP/OCKYICRalpqdWpGXmAGMJJi3BwaMkwpt6HijNW1yQmFucmQ6ROsWoKCXO+xckIQCSyC
  jNg2uDxe8lRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8y0C282TmlcBNfwW0mAloMe88AZD
  FJYkIKakGpupTB91LDl9/cmnZr7Q5q3bPYpsp7HzKbKqYzp2Wfxa/T/L3JR87oNxQeDm2doGm
  inG93aJjaXZK/uZiZ3bVGTj/042v0/a9ycEeu9lClONR4k/1KTcnyb7v2XLms1uX3vZoCV2VZ
  aFfzff5XZdKcfI+KDE90Iw947PWtMPiMXtvXRXavXqFzsRwwXiFRC6NIxV7YnT92X/UHphhGt
  HwLb5/7p3wrjP9z7QKamYJPuy1Yb6TtX4uL/uO/VN0N73KOm71evbC8yEPVlz8fMmT01GSee3
  rJX3Sb86G1S73Ush5s2QJ9/SKia/m9H4yuJ5y9zNjt1f87fsPJ31fscXWIExv0ibVSwnHa0Sc
  bbItbimxFGckGmoxFxUnAgBMPBk6WgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1678889357!51710!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7936 invoked from network); 15 Mar 2023 14:09:17 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:09:17 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 11AF91000DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:17 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 055271000D7
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:17 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:09:15 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-unidiff: upgrade 0.7.4 -> 0.7.5
Date: Wed, 15 Mar 2023 22:08:37 +0800
Message-ID: <1678889317-20778-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
References: <1678889317-20778-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101557

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-unidiff_0.7.4.bb => python3-unidiff_0.7.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-unidiff_0.7.4.bb => python3-unidiff_0.7.5.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.7.4.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-unidiff_0.7.4.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
index 3f6d2850f..690acf863 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.7.4.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.7.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[sha256sum] = "2bbcbc986e1fb97f04b1d7b864aa6002ab02f4d8a996bf03aa6e5a81447d1fc5"
+SRC_URI[sha256sum] = "2e5f0162052248946b9f0970a40e9e124236bf86c82b70821143a6fc1dea2574"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


