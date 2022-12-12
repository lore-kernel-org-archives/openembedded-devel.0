Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79440C10F31
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:40:18 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web10.37749.1670830811322960025
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:40:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=rSzKW4VG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830809; i=@fujitsu.com;
	bh=4FU+RiwcoJCWQDpV7uBy16jgNALCgWe6sn299eweWCE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=rSzKW4VGwcpIR07Mu7O7ubsqZVj7TNFqiD9SC0yRWWieegP1uTywXWRsLruBbBT9W
	 OJNMLUmacwZEfMTEfFSdeyxuygpwnS0FURsbdzhd68xkZ6jnG9P52PcGdgOiSVGlT6
	 mbFco+TIqdkByXll5iY/4jgIh2BGBks+5V+se/jBumJ/v4x2Da3MZc4uIdw3CRoMDP
	 N+gXqcZoHH3qs2yzctjMfwXM9lVs1JSzZBTGbfnQCN3b7EAbP3IgTyk8yrc306RuEa
	 mRh0d70jSHCkRgVvqxX9xE9cKdhECJwL26uTSkd4gxRBZ5Kedpze9xVbDKhbhfRM2+
	 gGPDny1QkKqSA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSffmrWn
  JBv+uC1tcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBlT5m9jKVjGWdGwqI+lgfEoRxcjF4eQwBNG
  iQmNN9ggnOtMEismPmWEcPYwSkz7uo69i5GTg01ASuLG/f9sILaIgL7E0tl7mEFsZgEViRe/e
  4BqODiEBTwkviyQAgmzCKhK7Nh5BaycV8BR4sPaC0wgtoSAgsSUh+/BWjkFnCS2d81lBbGFgG
  pWvNwHVS8ocXLmExaI8RISB1+8YIboVZSYfbmZBcKukJg1qw1qpprE1XObmCcwCs5C0j4LSfs
  CRqZVjGbFqUVlqUW6hmZ6SUWZ6RkluYmZOXqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5
  KXp5qSWbGIHBm1LM9HwH49llf/QOMUpyMCmJ8lZemZYsxJeUn1KZkVicEV9UmpNafIhRhoNDS
  YL34E2gnGBRanpqRVpmDjCSYNISHDxKIrwqwGgS4i0uSMwtzkyHSJ1i1OWY+bXtALMQS15+Xq
  qUOO9akBkCIEUZpXlwI2BRfYlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC8vyCqezLwSuE2
  vgI5gAjoi6uVUkCNKEhFSUg1My+IjOOozSiKdZ16dyvFaJcCe28i/nrHZV6J27eY5Rg7tzLZ2
  gZl9Aj9ubPT+wm+kb7mT61HEiyPy7Y9KJr++ma4anbXS9scZvn/LVcwm539mjVhxKS971/FpI
  rO+3XaZtP7I9Ic27Avn69aefxF1zO9GcbPODtkV7TP1WAJOZV2bl6r32lDv8mlDdT2uQ6EWOb
  ueF7t6251WlDs+8896+fRYa6/pnamzdS5a3v4WE8e4PiFrWbeFg2bvbK/prfs3SIT8jawsYkk
  6fUlU25Rd8oWRfVW+7EYG8Y0cnVcOzgvQWPqeT7d817WnS042uB7N/HPbM2J2osQFhcm82RcY
  pjU/CF/kfH0b25eXGn1KLMUZiYZazEXFiQDEzeJKZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-585.messagelabs.com!1670830809!315853!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10947 invoked from network); 12 Dec 2022 07:40:09 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:40:09 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E11601000D7
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:08 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D4EC81000C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:08 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:40:07 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-yarl: upgrade 1.8.1 -> 1.8.2
Date: Mon, 12 Dec 2022 15:39:36 +0800
Message-ID: <1670830778-3178-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830778-3178-1-git-send-email-wangmy@fujitsu.com>
References: <1670830778-3178-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:40:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100056

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Add support for python3.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.8.1.bb => python3-yarl_1.8.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.8.1.bb => python3-yarl_1.8.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-yarl_1.8.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-yarl_1.8.1.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.8.2.bb
index 66ee46b44..6f6f85d78 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.8.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e581798a7b985311f29fa3e163ea27ae"
 
-SRC_URI[sha256sum] = "af887845b8c2e060eb5605ff72b6f2dd2aab7a761379373fd89d314f4752abbf"
+SRC_URI[sha256sum] = "49d43402c6e3013ad0978602bf6bf5328535c48d192304b91b97a3c6790b1562"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.25.1


