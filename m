Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98679C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:10:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.3755.1675843813038199944
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:10:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JN+6zhD6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843811; i=@fujitsu.com;
	bh=++IdvsEw82Xmf8CVMBYC+Fm/w5qkpInOnk6nIqJWKj8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JN+6zhD6BcSdaj/SRwKX0Ny8EatD55cd98oPdiMoZM+n8m/PgqnUYuvC3Zj/wvzB9
	 Z7CYHjrvCIotW7ry4bONrR2UBP0X/G4H1fYCAghhlVkGjBkHy3gJfAYrzdzHFz/JXo
	 WzyFJ38e76PWKKO4xdMLldqz14XMwtDk0GlWOVbxz4IdhrvRtvjQvz2VuCh2EFhyCp
	 jNBmTjAFb54/DBJ/WbPaVph+/spuIKbzKcRwxbXkUnWAiLkIyJGa2x1lnM5R6r8wC8
	 GxswMDOykodLavi8CVNjdEttwa64Q6NdCbBY1mUX2EoBnzYTnAVenOKKAp/xeXwt+k
	 vui2FnFeuLO3w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORqPso4nG
  yQfNzZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePPkfnsBfu5K95vL2xg3MzVxcjFISTwhFHi
  1Y6zbBDODSaJ+Us3sUA4exgl7u5dCeRwcrAJSEncuP+fDcQWEdCXWDp7DzOIzSygIvHidw87i
  C0s4CPxY3s7WJwFKD7p9k+wel4BJ4nTU1aB1UgIKEhMefgerIZTwFni1ZspYDVCQDWtn08xQ9
  QLSpyc+YQFYr6ExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNoXMDKtYjQ
  vTi0qSy3SNTTQSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxNzknRy0st
  2cQIDN+U4sT5Oxgv9/3VO8QoycGkJMrrKfY4WYgvKT+lMiOxOCO+qDQntfgQowwHh5IEb0Q4U
  E6wKDU9tSItMwcYSzBpCQ4eJRHeyFCgNG9xQWJucWY6ROoUo6KUOO9VkD4BkERGaR5cGyx+Lz
  HKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5g0IA5rCk5lXAjf9FdBiJqDFIaoPQRaXJCKkpBq
  Y8g8mb5w3aemz3PUSlo9OTv08O7Dc70RDt8XFlI0evW941q/j3ttZyecT2ykVe/TZfMk5q1ed
  l/RrWbwroFBNuKbhT3Gk197jRSU2V07/b43Q0Lv4auKml3qfFSQa110xjf34t4Jf/8HfK3Pfd
  efWrLyrGurwhe2QfOic8J+Kv0PMvkwq39K23njevhfh00J2Xt992EnIsDTnzuLXB04wfVow4e
  EK3cAOtRXnIowX5PxU8f1299Wfq3nT5ApCt73Vzhc8KnVhy9HXC8OnfLq+4A3/UpbOh2+lz3Z
  kdfcLl5g8jHwV6DRJi4+Hz9LLY8GajNW+cblX70gcuMc7PdD8XivLZzOfH3zvWOZrP5xTp6nE
  UpyRaKjFXFScCABJV7sRWgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-728.messagelabs.com!1675843810!375765!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17819 invoked from network); 8 Feb 2023 08:10:10 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:10:10 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 08600100188
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:10 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id EFD6F100043
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:10:09 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:10:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.0.5 -> 7.1.0
Date: Wed, 8 Feb 2023 16:09:52 +0800
Message-ID: <1675843794-11226-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
References: <1675843794-11226-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:10:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100975

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added: the debug output file can now be specified with [run] debug_file in
  the configuration file. Closes issue 1319.
- Performance: fixed a slowdown with dynamic contexts that's been around since
  6.4.3.
- Typing: all product and test code has type annotations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.0.5.bb => python3-coverage_7.1.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.0.5.bb => python3-coverage_7.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.0.5.bb b/meta-python/recipes-devtools/python/python3-coverage_7.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.0.5.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.1.0.bb
index 98f0f191c..358a0ec19 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "051afcbd6d2ac39298d62d340f94dbb6a1f31de06dfaf6fcef7b759dd3860c45"
+SRC_URI[sha256sum] = "10188fe543560ec4874f974b5305cd1a8bdcfa885ee00ea3a03733464c4ca265"
 
 inherit pypi setuptools3
 
-- 
2.34.1


