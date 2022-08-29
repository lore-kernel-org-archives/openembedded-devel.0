Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17689ECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:38:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.67657.1661755093143337999
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CHPYlrTY;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661755091; i=@fujitsu.com;
	bh=ZUU1A/RFhIi17kxTFdTL4+E4HQXCYtZGw2lcUodtcN4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CHPYlrTYND28BH7GF7Xps2rYJHJX221T9/38j0z+3d6ggjNemFNra0E8QU+EWnry7
	 lKLnuwlblajH1R8kQHfOvvLNh8wQIwGN9SqHI9ASutiJbOhWQR5uB8oW5rvdI6iqzL
	 sxPV6t8/FXzungtDjeOUhdo3jcB5p8kz7UVbK1181EQ0CwmFcjvE0a/o3H6wsk30dv
	 b1fAz7w4LnCz4uoP6+lgQjaQJ5PDLJOQFvJKw3oXdPtqoMTLRUYkchgN17jJMUIKGJ
	 q8s8/H9KJ+b8sytDGTbIH9r32fCoaj9F9hhpCSVmQ6iz1pLXIBkIwm+LDQOtpFkz9e
	 DLqyQ2Ce2X3dg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8MxSfdSHE+
  ywe29OhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bcGbEF09grOi7tYGxgPMLWxcjFISTwhFHi
  yK2PLBDODSaJBatXQTl7GSUePVzA3MXIycEmoCYx/dYNVhBbREBfYunsPWBxZgEViRe/e9hBb
  GEBa4k/XyeB2SwCqhJ/dv9hA7F5BRwlTnxZywhiSwgoSEx5+B6sl1PASaJ950KwGiGgmsW3Pr
  BD1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJfbM6meCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrROKspMzyjJTczM0TU0MNA1NDTVNTbRNTK00Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAzjlGKlWzsYN6z6qXeIUZKDSUmU18ScJ1mILyk/pTIjsTgjvqg0J7X4EKMMB
  4eSBK9jLFBOsCg1PbUiLTMHGFMwaQkOHiUR3gsgad7igsTc4sx0iNQpRmOOq1eu7GXmmPm17Q
  CzEEtefl6qlDgvOzBahQRASjNK8+AGwWL9EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVhXn6
  QKTyZeSVw+14BncIEdMrDJdwgp5QkIqSkGpiyfwm8+1jds/ruGv6jxzQvvlpkPGNV89JVc6MW
  Toi3ejLn1yUel/BDr2dLfBHmbJp38OCZukuB8dqCQde+Z394tqX38hqunGutunOtvBz5H/o8L
  Vea1rlpTQ7rmd3WYketwp9ZTykPEVHVuc7Pc+DiUWHffXGXVuntFejmqr24buL/FUGdUZXHJx
  qsP9/NLH1XTfgT59XS8w391zjFn7NKbXXIevgj+qpOwoumlwle7ouyZ85YPrvl1Ra/+j1hVl5
  XBfftKtn4x1TU6/K11tdMJ7/OOdvT4u/5X8Yjde45rht69SeqTXb1auW8OJDOZ87xriAmwXr9
  fjm/q8E1pfp+RneaeC4HL6yP3FHy5WO9EktxRqKhFnNRcSIAeEdX1HADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-565.messagelabs.com!1661755090!336740!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14935 invoked from network); 29 Aug 2022 06:38:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:38:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7109F1000CC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:10 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 58F53100078
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:10 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:38:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] fmt: upgrade 8.1.1 -> 9.1.0
Date: Mon, 29 Aug 2022 14:37:37 +0800
Message-ID: <1661755059-4785-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:38:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98507

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fmt/{fmt_8.1.1.bb => fmt_9.1.0.bb} (90%)

diff --git a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb b/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
similarity index 90%
rename from meta-oe/recipes-support/fmt/fmt_8.1.1.bb
rename to meta-oe/recipes-support/fmt/fmt_9.1.0.bb
index c53dd38901..34896153c2 100644
--- a/meta-oe/recipes-support/fmt/fmt_8.1.1.bb
+++ b/meta-oe/recipes-support/fmt/fmt_9.1.0.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=af88d758f75f3c5c48a967501f24384b"
 
 SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https"
-SRCREV = "b6f4ceaed0a0a24ccf575fab6c56dd50ccf6f1a9"
+SRCREV = "a33701196adfad74917046096bf5a2aa0ab0bb50"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


