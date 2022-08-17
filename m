Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299A7C28B2B
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 02:58:12 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.24456.1660705088620302917
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Aug 2022 19:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=v8cdKJz7;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1660705087; i=@fujitsu.com;
	bh=GeWXGm4DJiJdKfLCNWSaUmiVQlAQJwyodU1hW9iPB2M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=v8cdKJz7DmOLAxLERiK7loaOCu2rMamdYURz1DYpchxpZISgjOPjW+IO0AzSinjp+
	 gLiCm2BFTwDvuT2wHA6xiYvSGBQDUJ2k5rqbCnypF5xdFJdACxc6plwRBvR2oaZ5aT
	 v2ahs7ePBSD8hXrXFJSoS5e0n44sW8rfId7P8gRPd0jqGtcSk3r5pChfx90zA1jHsc
	 uT8F5o4ZPR/P79HBnq3n2KE4JQ3qmV22lB+OlSyxlF02NGRIGafuwvYVbu+DdJX2iq
	 IxBUqqfIoqHy8nWHr4mFV7+pSkSSGUjR8J/2PhktQyENa6D56TyHdPoeteYWXTpR1V
	 509GPgGUqwOOg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8OxWdcu8k+
  SQUujvMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnH8zWLmgvXcFa82/mZvYLzA1cXIxSEk8JBR
  YumBvUwQzmUmiaPrbrBCOHsYJfrbbjB3MXJysAmoSUy/BZLg5BAR0JdYOnsPWJxZQEXixe8ed
  hBbWCBdYuOVrywgNouAqsSZJ68ZQWxeASeJX6+awXolBBQkpjx8D9bLKeAs8W32TrYuRg6gZU
  4Sc6eaQ5QLSpyc+YQFYryExMEXL5ghWhUlZl9uZoGwKyRmzNjGBmGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVonVSUmZ5RkpuYmaNraGCga2hoqmtspGtoYamXWKWbqJdaqlueWlyia6SXWF6sl1pc
  rFdcmZuck6KXl1qyiREYxinFCnt3MF5e+VPvEKMkB5OSKG8/058kIb6k/JTKjMTijPii0pzU4
  kOMMhwcShK838KBcoJFqempFWmZOcCYgklLcPAoifDKBgCleYsLEnOLM9MhUqcYdTlmfm07wC
  zEkpeflyolzvvWB6hIAKQoozQPbgQsvi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub9DnI
  JT2ZeCdymV0BHMAEdcezib5AjShIRUlINTDyv1k5MUPJ0EK6+s6jkVuv3S+8TGlq/K9pZJl7z
  DdOYzVMXtP/CfDlmE7agh9/XHGTV1gvzzHv3RbZE2Mx3qk7i9vT5R7XtjJ5p+pZKBInqvLO6d
  qiI227fWaO7u74evTM9uWTKpt57dfEVf63+nf+w94yJeJ+HiRFDiwXTzy+bX889IPJn0hGZrU
  32Ib6BOvMS1ZZcTQ77WC/25HRz/BU96++tbM+FL+np2aZwn3Nxl9PaLT5F3187u11olpRqqsX
  TzrYGgWB32c7u/Z8ktqpf19bYNbdZJ9qz2y1/v/fV6L2/l21pNxec+CcyZtWvTCP5fUsrtjtL
  M6hd3Xn4k49MikKWW6sk433d1dlKLMUZiYZazEXFiQBvameOagMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1660705086!214293!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24884 invoked from network); 17 Aug 2022 02:58:06 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Aug 2022 02:58:06 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 39C5214C
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:58:06 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2BF6673
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:58:06 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 17 Aug 2022 03:58:04 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH]
 python3-setuptools-declarative-requirements: upgrade 1.2.0 -> 1.3.0
Date: Wed, 17 Aug 2022 10:57:38 +0800
Message-ID: <1660705060-17241-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
References: <1660705060-17241-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Aug 2022 02:58:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98281

Changed
-------
    Ignore lines that start with -i.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ....bb => python3-setuptools-declarative-requirements_1.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-setuptools-declarative-requirements_1.2.0.bb => python3-setuptools-declarative-requirements_1.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.2.0.bb b/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.2.0.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
index 9628656ad6..82bb3415be 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-declarative-requirements_1.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/setuptools-declarative-requirements/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "d11fdb5ef818c65b20bc241e0f5ef44905a5640b681dae21ba1ac1742dab1fd1"
+SRC_URI[sha256sum] = "57a5b9bb9ad350c278e8aa6be4cdebbcd925b9ba71d6a712a178a618cfb898f7"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


