Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3C6C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:20:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.191050.1673939995038187810
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:19:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=nr6bMsJG;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939993; i=@fujitsu.com;
	bh=bOjq9Z97L+ZkLzefUKstm3Cr5ZYYozNUZmq9kSM1Byo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nr6bMsJG42pypxb1lrVvDjNkkXiF7kJx52jDlZoFn4+dwbaI4/S0Gu8XaE5CPxvVU
	 Tf9vtHATAI2mbASDplFwMyTWEBKkLhpbuuK79dlwJF3g7KROqEzsTxb8p1UH4DbRki
	 QKJt5ZpOjVov+2q4LSH67u/ThiejBhRoQ0JUeR7BrLSTpmlcX9bmWTRPIeLd6/eSCc
	 uJ9BX7rMZhPrcYPURRnrEK8iqsAeKOpdMiLzGwM86QyVHiSU3xqNjw7HzJH2zt+93o
	 8ruXTjutNGFdA3Tvklajo7ErQBFM1W3Wr4jYBfpwGukq8PoRkYDWkcSn98vVNkhgY0
	 f+mKTRPG4mCLg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSVfC51i
  ywZ0FKhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b3X69YCg5zVXxczdbAeJ6zi5GLQ0jgCaPE
  ou8nWSGcG0wSbe9mskM4exklLl2dxdTFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi989Q
  A0cHMICPhLN50pBwiwCqhK/109mBAnzCjhJrLlhDxKWEFCQmPLwPVgnp4CzxMPb98EmCgGV/G
  tfzAhi8woISpyc+YQFYrqExMEXL5ghehUlZl9uZoGwKyVaP/yCstUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQvTi0qSy3SNTTUSyrKTM8oyU3MzNFLrNJN1Est1c3LLyrJ0DXUSywv1kstLtYrrsxN
  zknRy0st2cQIDN2U4lTzHYzfl/3RO8QoycGkJMp70vRYshBfUn5KZUZicUZ8UWlOavEhRhkOD
  iUJ3lNeQDnBotT01Iq0zBxgHMGkJTh4lER4wy2B0rzFBYm5xZnpEKlTjIpS4rzXQPoEQBIZpX
  lwbbDYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmPeJB9AUnsy8Erjpr4AWMwEt9ig5CrK
  4JBEhJdXAxCB6mPn9jznn15mId6zz+mEktU99rm747F/rdCLKPB7cSdA8WM/D47nLS+bBp/2m
  yvfXPs20rA/0FntmINO8PGKV48p/GmL2QqayTTlW3vJFUuo68Wsc5D/dj1Hgu83x6IpcZX3mF
  cm0/qPnOJY99llpEOSXtf/Z3+JFcdXfj86M1jbaGnXD9IrC5H1BharX90fzzboz9+3kt5VZ27
  NZtrhbno/R2nZ5z5GqgE25T9JW5/44G/Eql2nuRu2U64fft9Ye+DEzy6MpftI2gYulHC8K82y
  evyos+Dat93Q35+6o7REhr/USrEJXhVv0zLpx1aaEUerXq9+L1b84+lncEhWZu6NpFt+mA0v+
  it09ocRSnJFoqMVcVJwIAJt9VdhYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-732.messagelabs.com!1673939992!161005!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24969 invoked from network); 17 Jan 2023 07:19:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:19:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0B11E1000F5
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:52 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F37C81000D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:19:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:19:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.0.4 -> 7.0.5
Date: Tue, 17 Jan 2023 15:19:28 +0800
Message-ID: <1673939970-20246-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
References: <1673939970-20246-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100611

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Fix: On Python 3.7, a file with type annotations but no from __future__
import annotations would be missing statements in the coverage report.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.0.4.bb => python3-coverage_7.0.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.0.4.bb => python3-coverage_7.0.5.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.0.4.bb b/meta-python/recipes-devtools/python/python3-coverage_7.0.5.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.0.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.0.5.bb
index 1fe99a92c..98f0f191c 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.0.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "f6c4ad409a0caf7e2e12e203348b1a9b19c514e7d078520973147bf2d3dcbc6f"
+SRC_URI[sha256sum] = "051afcbd6d2ac39298d62d340f94dbb6a1f31de06dfaf6fcef7b759dd3860c45"
 
 inherit pypi setuptools3
 
-- 
2.25.1


