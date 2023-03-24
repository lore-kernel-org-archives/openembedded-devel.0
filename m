Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44355C77B61
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 00:28:23 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web11.89886.1679617702732339424
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Mar 2023 17:28:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=hmxS9Epe;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679617701; i=@fujitsu.com;
	bh=eWg+p7g0UnqAaYVix1Sn8VJUoDusturSpExEcm4PzKA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=hmxS9Epe/uLEqdczDWZYX9rR7oHT8c4PGMJIEYeqhAqf+HaOUZx/azboggGb8/JNB
	 YyEJzLp+BKAr9DRJjEJJ/1qGQFK9FvG75xoDjQd/lzBoA4IaLDQ90qu0lJfjTpka7J
	 fv2U2ato8yTVfsNe3L1gnDUnAZZ/YlrN4hjDwQP9Y3Gb/Fu6Mx+QSNjPcodd8OLEEK
	 sRqRD3lKfc8oENRyf87IgNOGSXlU3+R09HWIvkTbqpoDK/3K4coKhozts1NDApftA7
	 YEsXDe7QkXE8o5+qwmzW4YK82gA2Otr51JCuBRGqSybOcYYAWjxnWLDcZM27xlw5WR
	 qaqkPd3HGzK1A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpLvknUy
  KwYP/3BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8asR0vYCo5xVjyb85mxgfEWRxcjF4eQwENG
  idfvT7JBOFeYJI6cX8sM4exhlPi1cC5QhpODTUBK4sb9/2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhAReJ6+3zwGwWAVWJ47sPMIHYvAJOEi1HXzCC2BICChJTHr4H6+UUcJaY8vk9WI0QUM3TdU
  uZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYFRKN0w8xQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjGaFqcWlaUW6RrpJRVlpmeU5CZm5uglVukm6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjl
  pZZsYgQGb0oxW/cOxvW9f/UOMUpyMCmJ8kqESqcI8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuD9/
  EYmRUiwKDU9tSItMwcYSTBpCQ4eJRHeQ2eB0rzFBYm5xZnpEKlTjLocV69c2cssxJKXn5cqJc
  6b+BaoSACkKKM0D24ELKovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmFQamCCGezLwSuE2
  vgI5gAjrCuQbsiJJEhJRUA1OR2aYDJ/ae8Xq8zXh76lbO2E+xj2Y877b3DZbdvqCE/+zUjSYC
  H+q4Zmza7i4k/nHVqo6jGzSXGAb/MdzlY+C0tS10kptSy/3qH9PNfbjT2JgdbarvRvr+Wa2rk
  bX/JdPBKZa/PicZLFC5VVd87dnEEIF+5vDrx42ymrvZ9T9fmG7Ttigi4qFsgFiU/ozKI+/abR
  5m3/kT9fScWNEsrd8qWyYv1ziq6eo467wTb6n5+rVNK4J12P4pWJf9PPNzZ5Fx0fcMxbecjRM
  TIprZ9FkX8rpvELvekv1jxtsu690L9//8EZUyU2uTxZtybXb+am+rR7uulXps9EsQmynK+6+m
  re/c5ePfnzYtcWVaL6TEUpyRaKjFXFScCACHwbA+ZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-585.messagelabs.com!1679617699!516935!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22442 invoked from network); 24 Mar 2023 00:28:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-11.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Mar 2023 00:28:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C961A1B5
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:19 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id BD8381B0
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:19 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 24 Mar 2023 00:28:18 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] googletest: upgrade 1.12.1 -> 1.13.0
Date: Fri, 24 Mar 2023 08:27:49 +0800
Message-ID: <1679617669-27228-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
References: <1679617669-27228-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 00:28:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101682

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../googletest/{googletest_git.bb => googletest_1.13.0.bb}  | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-test/googletest/{googletest_git.bb => googletest_1.13.0.bb} (86%)

diff --git a/meta-oe/recipes-test/googletest/googletest_git.bb b/meta-oe/recipes-test/googletest/googletest_1.13.0.bb
similarity index 86%
rename from meta-oe/recipes-test/googletest/googletest_git.bb
rename to meta-oe/recipes-test/googletest/googletest_1.13.0.bb
index edca0bc462..2327f85d46 100644
--- a/meta-oe/recipes-test/googletest/googletest_git.bb
+++ b/meta-oe/recipes-test/googletest/googletest_1.13.0.bb
@@ -4,13 +4,11 @@ SECTION = "libs"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cbbd27594afd089daa160d3a16dd515a"
 
-PV = "1.12.1"
-
 PROVIDES += "gmock gtest"
 
 S = "${WORKDIR}/git"
-SRCREV = "58d77fa8070e8cec2dc1ed015d66b454c8d78850"
-SRC_URI = "git://github.com/google/googletest.git;branch=v1.12.x;protocol=https"
+SRCREV = "b796f7d44681514f58a683a3a71ff17c94edb0c1"
+SRC_URI = "git://github.com/google/googletest.git;branch=main;protocol=https"
 
 inherit cmake
 
-- 
2.34.1


