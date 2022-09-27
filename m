Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30EFC54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:22:02 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.8241.1664266915793459232
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tNv8yjM1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664266913; i=@fujitsu.com;
	bh=FgKN9UD73phEhj9PU1NBnjRy+DKA6QH9y6u0ibQo2dw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tNv8yjM1Wm76aiVqP5rbkmoelb1VHnkDoJZTHnqrD+1yhPKbr6xySRuHiCqtCSjmq
	 FBPNCKYGoawtIn8e4scu+nT8oDiD19u1vLBUgfyFUGHTKfbjRJkZFd7SLG+ZkYa6/i
	 F03ivh42UQhCtca44HT7pF9X/WVYI8eIg/5lCaqsxCR0PotEfTD1gIgM6nn200r3LF
	 FtY7UsuOczA97niyW2Of0fxEUPOJLGTa8afDhQJluf0jl5TgULv5KDChzmagghaEJc
	 wTHnCvz2645hK3XOPh3SFSA97WQPokotYN18ykoM2ynLE7ga+a4lkdvwPy6XE8nwux
	 Q+4wrZDeX6nmA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRWlGSWpSXmKPExsViZ8ORqLtgk1G
  ywbGZVhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bkn0/ZCvazVfS8XMzYwPiNtYuRk0NI4Amj
  xN3egC5GLiD7OpPE54fX2SCcPYwSnY3/mUCq2ATUJKbfugHWISKgL7F09h5mEJtZQEXixe8ed
  hBbWCBAYs/p7SwgNouAqsSri21gNbwCjhJn9/xmBLElBBQkpjx8DxbnFHCSmHT7FjvEFY4Se1
  dNg6oXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AqPgLCTts5C0L2B
  kWsVok1SUmZ5RkpuYmaNraGCga2hoqmtppmtoYqGXWKWbqJdaqpuXX1SSoWuol1herJdaXKxX
  XJmbnJOil5dasokRGMgpxQlTdjAe3vdL7xCjJAeTkiiv/SKjZCG+pPyUyozE4oz4otKc1OJDj
  DIcHEoSvEzrgXKCRanpqRVpmTnAqIJJS3DwKInwrlsClOYtLkjMLc5Mh0idYlSUEueduREoIQ
  CSyCjNg2uDRfIlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8S9cCTeHJzCuBm/4KaDET0GI
  7Pn2QxSWJCCmpBqak1/b72HJ2hbNINOhZ6M1oUfXaZWH5VF9z2r3YbXa8DS+47TvWvNszadpP
  R3/RXwUfQ6cqTXh9Y/b0ZJEpoSVTDh85rn3GhOv+NSHpf8nVC5nPy5ca7+dbmBibmPXulvsm2
  bqLX/rXfbz49ZeQzsbIqTFWQY78nywqy/dpa8kuUrPN+l549t1+oZjdtwOTNgjNyNqs3uQ+6/
  /SF80pt2LbXQ669TdLHAuZHmy5+9icP0bHZN8+sFSZred/KfR2RcX/5xvPTU2f7rf3nD1vS9F
  17pDvHBb9E4IzD7DuaVj3zcH81rI3y/N+xO6q5eI8yH3lpuf7FWf6jlkvYWSZskJF5eHEF+WT
  DVcK9pZvD1RSYinOSDTUYi4qTgQAbo3Phl8DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-745.messagelabs.com!1664266912!973!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29223 invoked from network); 27 Sep 2022 08:21:52 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:21:52 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 61706100195
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:52 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 556B0100191
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:21:52 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:21:50 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] opencl-headers: upgrade 2022.05.18 ->
 2022.09.23
Date: Tue, 27 Sep 2022 16:21:21 +0800
Message-ID: <1664266883-2234-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
References: <1664266883-2234-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:22:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98966

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-core/opencl/opencl-headers_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-headers_git.bb b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
index 4ecb8fc7d5..8ad7d9d10b 100644
--- a/meta-oe/recipes-core/opencl/opencl-headers_git.bb
+++ b/meta-oe/recipes-core/opencl/opencl-headers_git.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "base"
 
 S = "${WORKDIR}/git"
-PV = "2022.05.18"
-SRCREV = "def8be9d35fda35492b72f54a94515f7df8d1e9f"
+PV = "2022.09.23"
+SRCREV = "5e2f8c66476bcf60eb8c2921807e34efb30294ee"
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-Headers.git;branch=main;protocol=https"
 
 do_configure[noexec] = "1"
-- 
2.25.1


