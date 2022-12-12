Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67745C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:36:38 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.37616.1670830586243081015
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Dec 2022 23:36:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=c93k4mIO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670830588; i=@fujitsu.com;
	bh=YWesA8QS9ftYHQL3soYRplyRR5qufXv6N2wTTEnbkbk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=c93k4mIO08OGCLx4lqGgmVGe/9fzHP6JBOTvoLFthaO2Iuwv8D9lHbNMkr5Ol83ND
	 g33V4uxhnO8MN5jLAqmZWVGLDuiZ+BXVuVTL/PeTE4HYJNrtG0S8cAjir3cfKYhwy9
	 9WhtRKTTy7Gkv0sSjY/Wk9lSrSMukUecW0DTE/tZm8dxMzjQzC0QIOkEu9xMnFRl7y
	 b5AdXzHNEGf0f/K/k3cPoHvviOXP23fFWuKeBp+iC7mYDrX+spdvZDWdcYl30RSRcP
	 6r+XJtvLRRXuZRXCpVZPznuMaa1V92gaot9JY+aRiMYP22WMNYfyALripg308/6iXu
	 WtU+OQT7bO/4g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8MxSff3zWn
  JBmebbS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxHE58zFzzjr5g7o5OxgfEPbxcjF4eQwBNG
  iV1zG9ghnOtMEq/29jFCOHsYJZYtO8vSxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAp0Tf3xWMIDaLgKrExJZ+MJtXwFHixJJbTCC2hICCxJSH78F6OQWcJO5t7gazhYBqmv
  ZvgKoXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0jMmtUGNVNN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbT4tSistQiXSO9pKLM9IyS3MTMHL3EKt1EvdRS3fLU4hKgTGJ5sV5qcbFecWVuck6KXl5q
  ySZGYPCmFCt838HYvfSP3iFGSQ4mJVHeyivTkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8G64B
  pQTLEpNT61Iy8wBRhJMWoKDR0mE1w2klbe4IDG3ODMdInWKUZdj5te2A8xCLHn5ealS4rzsN4
  CKBECKMkrz4EbAovoSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFem+tAU3gy80rgNr0COoI
  J6Iiol1NBjihJREhJNTA5M06dsquoXs7Lvfqg/68FKTsrF1w+r+eiIyP4IPvV/OT2TXfkltc6
  tywrOZT19ZaxxesTnidLsxdtmmi/9MgxbU79tOpJ/Y2rjt16VPKr98DBA7IpWx1m7759zdk9+
  0XtgzM2jutlHA5Ht9l8e1bwvO70g4ityeIHP6+zV/p2mMG1Usdm6/2Vjas/BExet0Tx3V9TyY
  kSN05ci72n7rrkbMmn7orasKRti47/SJRqmyHpyL1Q0okv5l8LW+eUj0uO9loZlQRuk73ocH6
  rY3Dm51X/w15W8Ves/fK4eqKQbkbt+z239/yM3eR7ada+RMPo5799sr5VTBJhuWch9cqC5WjR
  hOP7jufe33Bk/5xdTUosxRmJhlrMRcWJAKUu5mVlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-565.messagelabs.com!1670830587!285337!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15043 invoked from network); 12 Dec 2022 07:36:27 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-11.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Dec 2022 07:36:27 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B38021000D5
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A6F031000D2
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 12 Dec 2022 07:36:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.3.5 -> 4.4.0
Date: Mon, 12 Dec 2022 15:35:47 +0800
Message-ID: <1670830548-3059-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
References: <1670830548-3059-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100043

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update:
 Copyright year updated to 2022
 format of LICENSE changed

Changelog:
==========
New Features
-------------
    Async clusters: Support creating locks inside async functions (#2471)

Bug Fixes
----------
    Async: added 'blocking' argument to call lock method (#2454)
    Added a replacement for the default cluster node in the event of failure. (#2463)
    Fixed geosearch: Wrong number of arguments for geosearch command (#2464)

Maintenance
-----------
    Updating dev dependencies (#2475)
    Removing deprecated LGTM (#2473)
    Added an explicit index name in RediSearch example (#2466)
    Adding connection step to bloom filter examples (#2478)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.3.5.bb => python3-redis_4.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.3.5.bb => python3-redis_4.4.0.bb} (68%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.3.5.bb b/meta-python/recipes-devtools/python/python3-redis_4.4.0.bb
similarity index 68%
rename from meta-python/recipes-devtools/python/python3-redis_4.3.5.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.4.0.bb
index f6dcebb16..a9ff015c5 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.3.5.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.4.0.bb
@@ -2,9 +2,9 @@ SUMMARY = "Python client for Redis key-value store"
 DESCRIPTION = "The Python interface to the Redis key-value store."
 HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=51d9ad56299ab60ba7be65a621004f27"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1db1f331d351900707368237cc4880cf"
 
-SRC_URI[sha256sum] = "30c07511627a4c5c4d970e060000772f323174f75e745a26938319817ead7a12"
+SRC_URI[sha256sum] = "7b8c87d19c45d3f1271b124858d2a5c13160c4e74d4835e28273400fa34d5228"
 
 inherit pypi setuptools3
 
-- 
2.25.1


