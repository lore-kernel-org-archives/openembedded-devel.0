Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D139C636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:11:35 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.3794.1675843891983965051
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ie3Dw4pM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843890; i=@fujitsu.com;
	bh=KbxhLDjv8eK7JrSvsK1EnXGbg5JQdAZ5M1qz5sxAL44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ie3Dw4pM2KlM2otRPTSl8YwXloww1Dm8FrLa4SQLPQm7ke+GMlbR5uwS1529LyzGV
	 UdKY06ciC84/Zv/QfEPgXHUtlk26+xNAKAMJTtvtKc1SRrsgkLrBralwtMKJImAv/R
	 Nz5HRxYBiTwoPGuq+Q0kGoBxRQoEDsDXwjyo6bkWw3GvlrVII4gdgnQBQN0k5mu7od
	 l4BAhw7miX0AaR6N3M11pZ+dQzUinxHFZHiu5dL2qMfL6DzkqNcFjwEnBJsfyZfMfP
	 tJO+taMGf+/vdpURHuB2n7K5X8xbMpIds7bg4sDQj+xIPD9gy6ODAZ/YjXGmGl6EHn
	 XhACdDH8BPv6A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8OxWdcw8nG
  ywde3GhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bPTy0sBcu4Kn4d62VvYNzP2cXIxSEk8JBR
  ovfkWWYI5yqTxP/Tn1ggnD2MEm+fPWfsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAS+L/wzlgNSxA8bXrL4HFeQWcJN48PApmSwgoSEx5+B6sl1PAWaLt0zRWEFsIqGbHrg
  PMEPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZebWSDsSonWD7+gbDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGM2KU4vKUot0LfSSijLTM0pyEzNz9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5NzUvTy
  Uks2MQLDN6U4+ccOxl19f/UOMUpyMCmJ8nqKPU4W4kvKT6nMSCzOiC8qzUktPsQow8GhJMEbE
  Q6UEyxKTU+tSMvMAcYSTFqCg0dJhDcyFCjNW1yQmFucmQ6ROsWoKCXOexWkTwAkkVGaB9cGi9
  9LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5A8KApvBk5pXATX8FtJgJaHGI6kOQxSWJCCm
  pBqYg7+zgzTaXftsIGvz9UDOf/1VKcrr2M03JJwcLz4XrXozPWns9f8aGyd3BjZdOvDz5MfrW
  ir0n3NZ8TXS8nXDouKC4aFlKkOMUEWtemb/1rNai9TbNjdKCE+IYEpaGeDK6CIpcNvxsfpdjx
  sWICRblie+TnunfttR5cMR03+L6vvSqSWvMts/SSGljtTUpvzTTR9ij7YTP85wXqjF7qo8FWZ
  dsfMVXe8Szf5XB1Sk5jyqM5CJfB+1aG/4ryP3VV+Hv5y/vmnq/dYfk+0/2yk4nchLyYtqbMhQ
  5A36+bP3T/6hd5fs0sWO955WtndQbOzoXflzBkN7mre7mGLj4jbnBO172oNvvRRX2VWeYK7EU
  ZyQaajEXFScCACGy0sJaAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-732.messagelabs.com!1675843889!395091!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15093 invoked from network); 8 Feb 2023 08:11:29 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:11:29 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 15A3E15C
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:29 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 0498D151
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:11:29 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:11:27 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-evdev: upgrade 1.6.0 ->  1.6.1
Date: Wed, 8 Feb 2023 16:11:14 +0800
Message-ID: <1675843877-11285-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
References: <1675843877-11285-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100979

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-evdev_1.6.0.bb => python3-evdev_1.6.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-evdev_1.6.0.bb => python3-evdev_1.6.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-evdev_1.6.0.bb b/meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-evdev_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb
index 659a86dae..c091040c5 100644
--- a/meta-python/recipes-devtools/python/python3-evdev_1.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-evdev_1.6.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python evdev lib"
 HOMEPAGE = "https://github.com/gvalkov/python-evdev"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=18debddbb3f52c661a129724a883a8e2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0ff275b442f45fc06287544cf713016f"
 
-SRC_URI[sha256sum] = "ecfa01b5c84f7e8c6ced3367ac95288f43cd84efbfd7dd7d0cdbfc0d18c87a6a"
+SRC_URI[sha256sum] = "299db8628cc73b237fc1cc57d3c2948faa0756e2a58b6194b5bf81dc2081f1e3"
 
 inherit pypi setuptools3
 
-- 
2.34.1


