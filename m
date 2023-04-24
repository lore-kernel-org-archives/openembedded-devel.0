Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E64C6FD18
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 03:25:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.43136.1682306698583203416
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Apr 2023 20:25:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=r4VeneGB;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1682306699; i=@fujitsu.com;
	bh=mzi6za0FUZ61sq7j/TO7XXc2MVnCtd/7/hVh3VJ4uBs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=r4VeneGBr3iEknMStGQj8zqFoVlnk0IBWtNjRwYfEMGWi2pr6pqvUzQpJH3FXgYRT
	 coUke9YxrT5Iu0/J2csBzx+2pOzQ+QRfzQ7aAXiuFfmfSxWNAEtAA+KpBG9iHZvGS5
	 WBSs1ri92fZIUzkjfKv8ebuwEHePdcRf/U9+iHlCGa1IjPNKI70xoIMreK9Yza674/
	 bxik61APS6K261irKOEV4qT+BAKTPJW1HZmHmP72VmnQDLr6elBrlcdflIopF11NTj
	 dxS2ppkcMC1zZwwxQq9eGNxWNQg57hCqqXN91NJUM7iOtQa69BQPWmj/DMtlzBeD7D
	 dfSPddsMM+uDA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpNv1zTX
  FYN5SXYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePn9I2MBY+4Kt5tPsXawHiNs4uRi0NI4CGj
  xKRf+xkhnKtMEjd6V7BAOHsZJS6duMfUxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAh8TPex/BbBYBVYklKz6xgti8Ak4SXWumg/VKCChITHn4HqyXU8BZ4ljvLTBbCKjm+Y
  VrbBD1ghInZz5hgZgvIXHwxQtmiF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYx
  MqxhNi1OLylKLdE30kooy0zNKchMzc/QSq3QT9VJLdctTi0t0jfQSy4v1UouL9Yorc5NzUvTy
  Uks2MQKDN6VYqWMH4/Wdf/UOMUpyMCmJ8i7Z4JIixJeUn1KZkVicEV9UmpNafIhRhoNDSYK36
  JNripBgUWp6akVaZg4wkmDSEhw8SiK8y74ApXmLCxJzizPTIVKnGBWlxHklvgIlBEASGaV5cG
  2w6L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhX8gPQFJ7MvBK46a+AFjMBLd7F7QKyuCQ
  RISXVwLT48o8bobseys+bladygo3RcYvLtKi0eEbVro/Syz59/TLVpjZM2kdvzeUr80qK5xzX
  uZyx1XnDc2+f9M7LmgY5so8vxE73ZX7debN7SgLntpwS6xcfFRxZnmcxye/Zt5/vvnTMM/tfT
  29pFS1WWPuTR4Q7sqyTN/LVz7eTqrVnscy8/vqgwqtAo+Y0+z/Hd8V8uhRWLBWWXjE7sWb//G
  /ln9mPi1zvkN+xYvbc56tzl7Gn5l/YX3s6ZUtItx5Lh0HNhtzVyb4fn53ZIcqqybTgRGBvgZx
  k8aNtebFaZx96FYp8MV4659V5dReDWOfKb4+Pha0oKKzR2WNZcsZ0xh4P9c0he5XNlLPnLeia
  LKbEUpyRaKjFXFScCABLhZzQWQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1682306698!214414!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19828 invoked from network); 24 Apr 2023 03:24:58 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Apr 2023 03:24:58 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 736861B5
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:24:58 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 67ACC1AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 04:24:58 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 24 Apr 2023 04:24:56 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mock: upgrade 5.0.1 -> 5.0.2
Date: Mon, 24 Apr 2023 11:24:34 +0800
Message-ID: <1682306676-11881-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
References: <1682306676-11881-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Apr 2023 03:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102166

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 gh-102978: Fixes :func:'unittest.mock.patch' not enforcing function signatures for methods decorated with @classmethod or @staticmethod when patch is called with autospec=True.
 gh-103329: Regression tests for the behaviour of unittest.mock.PropertyMock were added.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mock_5.0.1.bb => python3-mock_5.0.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-mock_5.0.1.bb => python3-mock_5.0.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-mock_5.0.1.bb b/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-mock_5.0.1.bb
rename to meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
index b916a7b4e..633b6f277 100644
--- a/meta-python/recipes-devtools/python/python3-mock_5.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mock_5.0.2.bb
@@ -13,4 +13,4 @@ RDEPENDS:${PN} += "${PYTHON_PN}-prettytable \
             ${PYTHON_PN}-pep8 \
             ${PYTHON_PN}-pyflakes"
 
-SRC_URI[sha256sum] = "e3ea505c03babf7977fd21674a69ad328053d414f05e6433c30d8fa14a534a6b"
+SRC_URI[sha256sum] = "06f18d7d65b44428202b145a9a36e99c2ee00d1eb992df0caf881d4664377891"
-- 
2.34.1


