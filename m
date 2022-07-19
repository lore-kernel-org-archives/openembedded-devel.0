Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B69C3F2D4
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 06:15:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.37590.1658211351225070218
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 23:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TOVGjAit;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658211349; i=@fujitsu.com;
	bh=5sGEShzLliY4CjqztJ0tPYYy0QAOEKxVNZg4AoUQK98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=TOVGjAitMl/BlQ99hPOaC1s9Pdm67vgm8+BwPjBjCvyv5rsNLWtcDprXPLmiQcI37
	 /JHm36Egni+aXRrPUZ+AB2oZ+WAej/fICygo7X4LZa2xv6XXeoT0Nh47yD+fKuVPql
	 XRPpeHNKDkU7/yqslAg7PtUq+/wV7rDmbgKv5pgN9kaybtPgCBNAsSWJBcrCxubTpB
	 VI0hM0nuKCP4RJdO5JeuVgQm7oSaNEduGAGmRfcKvqhq1mrzPA3QDnM/PZfz2AvYPI
	 EoFU2+mvDABZ/Dm/iKap7pUr+bnwbXMFB2ejftshy8loFF5xhxW97wvvY494krLqid
	 Y0GdGOLY0Atug==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpCvqcy3
  J4OwPfouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePIzLKCNxwVPacPMTYwtnF0MXJxCAk8ZJS4
  uWg+G4RzmUmiddJfdghnD6PEim/bmboYOTnYBNQkpt+6wQpiiwjoSyydvYcZxGYWUJF48buHH
  cQWFnCWOPV3BlgNi4CqxPGZH4BqODh4BRwl/j4tAQlLCChITHn4HqyVU8BJ4tW2PywgthBQye
  IDy8FW8QoISpyc+YQFYryExMEXL5ghehUlZl9uZoGwKyRmzNjGBmGrSVw9t4l5AqPgLCTts5C
  0L2BkWsVonVSUmZ5RkpuYmaNraGCga2hoqmtsrGtobqmXWKWbqJdaqlueWlyia6SXWF6sl1pc
  rFdcmZuck6KXl1qyiREYxCnFipt3ME5c+VPvEKMkB5OSKO9UzWtJQnxJ+SmVGYnFGfFFpTmpx
  YcYZTg4lCR4L3gC5QSLUtNTK9Iyc4ARBZOW4OBREuFNcwZK8xYXJOYWZ6ZDpE4x6nLM/Np2gF
  mIJS8/L1VKnLfQC6hIAKQoozQPbgQsui8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuatApn
  Ck5lXArfpFdARTEBHTHK6AnJESSJCSqqBqUS7nPXqRi8n4eNLeto+t+qVRu6SOHqR3cfzqNXr
  YAHXXxWek/8sDGReprflXl8wY6bLpUmv+vR7hBQ72wM5q16e15p5b6rRKf86wXmrTi32iVzIV
  GZkzl1Ts/ycbvnTbQoxrvebJydOvmx442nO0fKdxTv1WxUD9iQe/ee6ljs/WnTuW5HIdxczBQ
  RdDX9o3EywjxIqrpnw6tQExnnNT9rnmJfb2F2r3X+gpOiSJ5/Fgfa8LTX/vvKtP5gndXPBI4k
  gwVbhlglKkg786zxY308WEn4S/C143f1Jd092HLePX+AeVm1V9Gz+502PuF8XhoWHbpBhKBdZ
  NlkxhMevnG+P2Oe7a17Me/pYnvGVEktxRqKhFnNRcSIAJcpf92kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1658211349!60186!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7968 invoked from network); 19 Jul 2022 06:15:49 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 Jul 2022 06:15:49 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F31E51AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:48 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E84897C
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Jul 2022 07:15:48 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 19 Jul 2022 07:15:47 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] PATCH] logcheck: upgrade 1.3.23 -> 1.3.24
Date: Tue, 19 Jul 2022 14:15:27 +0800
Message-ID: <1658211328-2951-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
References: <1658211328-2951-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Jul 2022 06:15:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97894

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../logcheck/{logcheck_1.3.23.bb => logcheck_1.3.24.bb}       | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-perl/recipes-extended/logcheck/{logcheck_1.3.23.bb => logcheck_1.3.24.bb} (96%)

diff --git a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb b/meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
similarity index 96%
rename from meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
rename to meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
index b40d52ab94..ea3dd5a4c9 100644
--- a/meta-perl/recipes-extended/logcheck/logcheck_1.3.23.bb
+++ b/meta-perl/recipes-extended/logcheck/logcheck_1.3.24.bb
@@ -14,9 +14,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c93c0550bd3173f4504b2cbd8991e50b"
 SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz \
            file://99_logcheck \
 "
-SRC_URI[sha256sum] = "a2188ba549fff4412c82074b271884ff66d25f3fdb2a41916e817ce676855b29"
-
-S = "${WORKDIR}/${BPN}"
+SRC_URI[sha256sum] = "5e304adf2880967c3b155bcf98e4f0809417a16bf91adb372fa065f38ab2c0cf"
 
 inherit useradd
 
-- 
2.25.1


