Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD5DC433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:47:11 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.25234.1646653626499529724
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:47:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=WqJrp8k4;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646653624; i=@fujitsu.com;
	bh=yJ36X/bnPln8h9oeoGYrC2JufkhHTnzrrdlxQWgbKnw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=WqJrp8k4savEjvVNbRUBpxX1DBscJZeli5FOPi6JlR0iuo2fehQc07R4iZfCCsqYf
	 gbi4LxKcL0pcHEhn11elEHfMKG3Jrs7QwCoZHZykk89sZCjfkiLjZZ/GEQOfv1cGrF
	 o9Rps7fDHSVCds8i98z392wTCp1Ys4onW0kv44yOfdPfuzc2Xw5CnbYpFEOX495oYr
	 psffPLYFAcAcZ7/SoANvDUIGPoyO0dlj/kdkLCcygN0uPURDuyChMtKsgQtsIDU6gm
	 J0G0gIMYdWLptJzjOPQNq9fmUt6YU7w+3ll7Q60xa5LC5w7e39jCFNxYPPgD1hONt/
	 s0CiRd/kEjYzQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqLvjg2q
  Swa/53BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bNr+dZCk7xVuw65tPAuIKni5GLQ0jgCaPE
  qodr2SCcC0wSW5uvskI4xxkljn+dDeRwcrAJqElMv3UDzBYR0JdYOnsPM4jNLKAi8eJ3DzuIL
  SzgJ9G1dgVYDQtQ/FDPKUYQm1fASeLQ3bVgcQkBBYkpD9+D9XIKOEvcPvcSrFcIqGb97GZWiH
  pBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n7AkamVYx
  2SUWZ6RkluYmZObqGBga6hoamumYWuoYmxnqJVbqJeqmlusmpeSVFiUBpvcTyYr3U4mK94src
  5JwUvbzUkk2MwGBOKXbp38F4v++n3iFGSQ4mJVHelAWqSUJ8SfkplRmJxRnxRaU5qcWHGGU4O
  JQkeD+9AcoJFqWmp1akZeYAIwsmLcHBoyTCe/wSUJq3uCAxtzgzHSJ1ilFRSpyXExiPQgIgiY
  zSPLg2WDRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMKw0yhSczrwRu+iugxUxAi6tslUA
  WlyQipKQamNx3/9qvOpf1sa7WTd/mdZeiFSe+Em9o1Dm8bP5ZIRvzpSeXxGU9WLNZI2nh7OMz
  K1KKb05V53u9/E1QnEz2kiX6hzkmmHwNvOP/k+9i9t5lU2NL6525/zOWLC3RDzO0PLtyy2L/7
  Hlu00Qdo0uX/jvqvNJdo73Jle9VvHJaybaIruOZ7xOzhLcu4AsMehbPlMsZ9zpF6sqjhnc2Ia
  WC6eFc9UbXryT6n9iefI5FYRqf/Svv7RtLjq13WjZRQPlQ2bSe5oQ5e+Y1LG05slE+xX2HfJJ
  79gVHzb+Zp4/LPM7fcnzhsh1555/EbFRZqnQ3ROSfNzvv2qJ+pz+TFb/7zbWxWZ9RVCSmI8lh
  f1V3pxJLcUaioRZzUXEiAAwf61RhAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-545.messagelabs.com!1646653623!113298!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 654 invoked from network); 7 Mar 2022 11:47:04 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-11.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Mar 2022 11:47:04 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A5626100180
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:47:03 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 77EF3100189
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  7 Mar 2022 11:47:03 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Mon, 7 Mar 2022 11:46:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyscaffold: upgrade 4.1.4 -> 4.1.5
Date: Mon, 7 Mar 2022 19:46:42 +0800
Message-ID: <1646653602-55882-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646653602-55882-1-git-send-email-wangmy@fujitsu.com>
References: <1646653602-55882-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Mar 2022 11:47:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95840

Changelog:
=========
Main Changes
------------
Add pyenv's .python-version into .gitignore, #576
Added more --very-verbose logging to make clearer what's going on, #578
Updated versions of containers in CI config, #583
Fixed coverage config template for namespaced packages, #610
Replaced internal appdirs dependency with platformdirs, #584

Documentation Changes
---------------------
Mention python -m setuptools_scm as a form of debugging, #574
Mention setting the default branch in git in docs, #577
Fix documented path to pyscaffold/default.cfg, #580

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pyscaffold_4.1.4.bb => python3-pyscaffold_4.1.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyscaffold_4.1.4.bb => python3-pyscaffold_4.1.5.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
rename to meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
index fbba75c43..cd160a69e 100644
--- a/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyscaffold_4.1.5.bb
@@ -9,7 +9,7 @@ LICENSE = "0BSD & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=14a49c74a1d91829908ac756c07e6b91"
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "46a2bbdf255ba2efc6c56ae1428249b61d56c4a3e54ef3db0d05fa97792011a5"
+SRC_URI[sha256sum] = "55f6532fd6d62b3b698d604257f7a7eda6a87557bbec22760f8c0d9549454802"
 
 inherit pypi setuptools3
 PYPI_PACKAGE = "PyScaffold"
-- 
2.25.1


