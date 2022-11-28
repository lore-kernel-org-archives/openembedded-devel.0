Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21012C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:12:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.111374.1669615958996270496
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:12:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RR4ovjYR;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615956; i=@fujitsu.com;
	bh=T3zUI7LKBsmWs0gpNpE0bBF6n6EL6bHqqzXRWFNaRaQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=RR4ovjYRilUwm+WnxOdXPv7OriFDv6eGfET1QxOCon2ekWpJ7p27/pTx7Ji+x+cOo
	 DTrruYfbc5yqkkUBqAZC9s7oreEy0oAKUtXMlBlgY3TPuobW1Q6ZCgtRLSGXeLNVSd
	 RpGTD5sxiBC8q3p1oHn0gnzLNHyxVuF+VN6JT+DvNKwbRjZSjbN2pTQTO7hUqACaVx
	 OhZS5JOYZok3ZboBKyb8oZ7TRugFerwEOdV0RdloLni8MprWErILyCIQUxbVXFMv84
	 BteazcMOkiLYDwK/rbHijiCdBqGheKWL2T/RSfJc8ZoTRl+WIuECLJe03/LGg3DVLp
	 Y3ZsyBvXjb+zQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPIsWRWlGSWpSXmKPExsViZ8ORqBsS2JJ
  s0HlRwOLi4aXMDowe5zauYAxgjGLNzEvKr0hgzVi6dS5bwU/eipfnO1gbGO/xdDFycggJPGGU
  OPdUoYuRC8i+ziQxa+1JJghnD6PE6mXPmUGq2ASkJG7c/88GYosI6Essnb0HLM4soCLx4ncPO
  4gtLBAqcf7aWxYQm0VAVeLhtjNgNbwCThLnHtwAi0sIKEhMefgeLM4p4Cwxbf12ZogrnCS2rp
  zOCFEvKHFy5hMWiPkSEgdfvGCG6FWUmH25GWpOhcSsWW1MELaaxNVzm5gnMArOQtI+C0n7Aka
  mVYzmxalFZalFuoZGeklFmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkp
  enmpJZsYgeGbUpx8dwdj5/I/eocYJTmYlER5F15qShbiS8pPqcxILM6ILyrNSS0+xCjDwaEkw
  bvesyVZSLAoNT21Ii0zBxhLMGkJDh4lEd7F9kBp3uKCxNzizHSI1ClGS46ps//tZ+ZYDiZnfm
  07wCzEkpeflyolznvOH6hBAKQhozQPbhws3i8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub
  dBjKFJzOvBG7rK6CDmIAO2qTYBHJQSSJCSqqBKdGJ7/mc91nBmqJlJq9UJfNa1XfYFoRceCao
  7PYv9/vdR57FfVN/v1EtCDpbtV3l2X7polB2/1V2nrFJmkm3F5vM/hLFLqjWwND1b9GhRTOLX
  /HM31MpMHOJ1LcNDEDlH2wnTJX1+njQp97BdOtx5w+mpdfqHXlfO3NNepp5YM9sjuTW8hUb3p
  X8W+jYYWy7fe478zlrXVjzVtpFP4iN2e0ncGnrKYnNbV5LU15e/1fSKP7/TOmF/VeF2xXf5v3
  9e6wqjflXNdPClQpXItL6y5n9F6rUaV75WJXcfO7JzDdLSw32aRTZbgzYMindQ9o0t//25jVH
  zurN7JlY1F+o37nH58kKxt6z2+vW9HYqsRRnJBpqMRcVJwIAOZ4XzHIDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-728.messagelabs.com!1669615955!10043!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15171 invoked from network); 28 Nov 2022 06:12:36 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-22.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:12:36 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id AE20B100197
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:35 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A2031100195
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:35 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:12:33 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-matplotlib-inline: upgrade 0.1.2 -> 0.1.6
Date: Mon, 28 Nov 2022 14:12:06 +0800
Message-ID: <1669615929-13134-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
References: <1669615929-13134-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99797

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 0.1.6

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-matplotlib-inline_0.1.2.bb             | 8 --------
 .../python/python3-matplotlib-inline_0.1.6.bb             | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.6.bb

diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.2.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.2.bb
deleted file mode 100644
index f060f9333..000000000
--- a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.2.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-SUMMARY = "Inline Matplotlib backend for Jupyter"
-HOMEPAGE = "https://pypi.org/project/matplotlib-inline/"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=c2728819a4288030f51c594327977be0"
-
-SRC_URI[sha256sum] = "f41d5ff73c9f5385775d5c0bc13b424535c8402fe70ea8210f93e11f3683993e"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.6.bb b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.6.bb
new file mode 100644
index 000000000..13210b906
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-matplotlib-inline_0.1.6.bb
@@ -0,0 +1,8 @@
+SUMMARY = "Inline Matplotlib backend for Jupyter"
+HOMEPAGE = "https://pypi.org/project/matplotlib-inline/"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d4692a0eb42ca54892399db2cb35e61e"
+
+SRC_URI[sha256sum] = "f887e5f10ba98e8d2b150ddcf4702c1e5f8b3a20005eb0f74bfdbd360ee6f304"
+
+inherit pypi
-- 
2.25.1


