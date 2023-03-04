Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37E7C64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:05:34 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.6854.1677927933487862491
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:05:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ttV9VvWf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677927931; i=@fujitsu.com;
	bh=lxJM4jZudFFps8okszr/kATBjFSKv5m9l8b8uSlrQbQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ttV9VvWfc2KXXDZFaLW47CV7csJW/2Kslrt9vet70zeUFdYX/3qruPBzLF3611oe/
	 Eswd85Ei3U1a+KcgiaycV9AB8bb1mUbLGzSHGEpUHbbv1Gcf3od6y0/dJUdUERPjsh
	 LOLkLYeOIaBRmh3T8s8himS0VG4CkqTxwsxs6zSpLy6zLxGgLfruhTk4laPEV7GoX4
	 mYWv5PnBtwv7M2UdMhHM5YZjEVmqSwlqYP4sUJ14mjWgfKycLr+4Y77uLHOIx1Fi/Z
	 j2UFASXga07+4Xi5ivc2eEFzDETDkPPXlwaOaoS1NNoslhJGSdsH84YBGFtOqxr4Kj
	 WoTzUPtOlduYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJIsWRWlGSWpSXmKPExsViZ8MxSfeXKnO
  KwbnZFhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bFLSuZC96xVzybc5qtgXEGexcjF4eQwBNG
  iS8fO5ggnBtMEq+2/QXKcAI5exgl7n6PBLHZBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48bsHq
  J6DQ1jAXuLQfg+QMAtQ+PLia4wgNq+Ak8TRu2fBRkoIKEhMefieGSIuKHFy5hMWiDESEgdfvG
  CGqFGUmH25mQXCrpRo/fALylaTuHpuE/MERv5ZSNpnIWlfwMi0itGsOLWoLLVI11wvqSgzPaM
  kNzEzRy+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwFFOKUzl3MK7s+6t3
  iFGSg0lJlHcSK0OKEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQleGWBwCwkWpaanVqRl5gDjAiYtw
  cGjJMK7RQQozVtckJhbnJkOkTrFqMtx9cqVvcxCLHn5ealS4rwCykBFAiBFGaV5cCNgMXqJUV
  ZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvFhWgKTyZeSVwm14BHcEEdITGaQaQI0oSEVJSDUx
  s4sx96/LXLKkvOGPh7snSv+xYVNCbZaGXui94f1h8RK/iusSTVVa92z8durRLvJKdbSFX6GOW
  V4lvLy74+mTfszRh4cPhEx5x+a9yf/bm2lvTL9Fy0qVsAtP3LtvQKr8+ZD2/2VeHn7vmzZkqy
  GO25MaLatvMKK5s77ZlT2JOZWaxzzYvyHNTKt8dFixce885qnv9lErRyos566Vlbep3ZfM8Xd
  nAaWR+6ElKsfzGu5HuFbn3Dtm5B/5d7bP4nVtGqfRSgSlOR/1KwieFynVfnX3u9inV5VLXhFr
  yCvPPi+rbbb58Ql6QeX//npPHSrI3CU01DhOpjVafce+tJusfnZJ2bSXhqwt2Tr38ik+JpTgj
  0VCLuag4EQA32gvETAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1677927930!583519!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31960 invoked from network); 4 Mar 2023 11:05:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:05:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 572171000F5
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:30 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3EA131000D2
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:05:30 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:05:28 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cukinia: upgrade 0.6.0 -> 0.6.1
Date: Sat, 4 Mar 2023 19:05:15 +0800
Message-ID: <1677927919-22891-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101361

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/cukinia/{cukinia_0.6.0.bb => cukinia_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/cukinia/{cukinia_0.6.0.bb => cukinia_0.6.1.bb} (92%)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb b/meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb
similarity index 92%
rename from meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb
rename to meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb
index 229aee6d7..9bd2301c8 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.0.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.1.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=master"
 
-SRCREV = "3fd9db9838ef3de20965aa5f7657c363b679a995"
+SRCREV = "b074be54a1379ae1243ae1187f892aeb39b7c083"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


