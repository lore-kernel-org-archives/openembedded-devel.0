Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0E8C77B76
	for <webhook@archiver.kernel.org>; Mon, 17 Apr 2023 07:48:41 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.48505.1681717711249598704
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Apr 2023 00:48:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=dv6FAuI4;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681717709; i=@fujitsu.com;
	bh=rWvooL3a64fuFMZmzQhYA4xSLF5yXuhYxakLz33IBcA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=dv6FAuI4wplD9JM3SAcz75PY4rGlFoqhL+9kkWG6ifSh6p38KEomN6zclXTP1nFZB
	 mQQ8hqIErKZdlXbVhE75f3hpIP4DB7gQP3Pk1cOAQTBm39b3oiiSboCqTBVpLjkFJm
	 sMpfKAaolF0+3hann2bFQEMYoIQnPkXbKiCJ+ZdXiH8rhNhCKrhQeARHvHqPgnGAvb
	 RtpFnB3KgsZXL5KeaXnWvk22CghKfQzMtH1EqKLkVFI//DVfq5LW0WXDF70o2KWAeF
	 xtmb2C3JC1srrA7fIboBuMYhBlHMFM6hhCVR4fxNZUMtmvQjE16ctbXI7vvM3Jg2u9
	 /yd69GU+fCVyw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8MxSffMT5s
  Ug7/PrC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oynN3ezFWzlrliw/yFLA2MzVxcjF4eQwBNG
  iWcHbjJDODeYJBrPdbBCOHsZJXZcfc3YxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAtUTvoZlg9SwCqhLzNz8Ei/MKOEn0Hl7LBGJLCChITHn4HqyXU8BZYvGr72D1QkA1H6
  ZvhKoXlDg58wkLxHwJiYMvXjBD9CpKzL7czAJhV0q0fvgFZatJXD23iXkCo+AsJO2zkLQvYGR
  axWhWnFpUllqka2iul1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6iXWF6sl1pcrFdcmZuck6KX
  l1qyiREYvinFzOU7GLf3/dU7xCjJwaQkyvsi1TpFiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv+
  W82KUKCRanpqRVpmTnAWIJJS3DwKInwGj8DSvMWFyTmFmemQ6ROMSpKifP6fwdKCIAkMkrz4N
  pg8XuJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvpB9AU3gy80rgpr8CWswEtFhOCWxxSSJ
  CSqqBia9+nVrDha8cLv1HnsxUNdvyP3Gyn8GmU0t97oZdmMdh7GhenzJn/9EzNsWz3v88/I83
  rfde8VZTqbMvGP9YXPriPe3jY5k3nJxbVLY5bakVnn4tQiT1al9AXES+y9WJdgfnbe+Lk38o6
  rfHsuzqI5srbDliW+ZFzK92ifI+b/r+1uTV3x77bNW7yLrp20Qv2z/qfSfM6tYu2NT7aHeswM
  QY65IADrfL1d1Lcv9PMV+9b9qsJPsFV4Jliuxjor+fYk1qE/wbmXo650bT8+npIn7HLEMzj73
  5aM4dfbtZrKDk0L7V07fKnPyyMv5G+HvjpxMKJmhILNHYZbwkx6Q3oZbd6NVcno+luW+PzEmR
  iVRiKc5INNRiLipOBABZDMA8WgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1681717708!740350!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 343 invoked from network); 17 Apr 2023 07:48:28 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Apr 2023 07:48:28 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 934E41000FE
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:48:28 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 871DA1000FC
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 08:48:28 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 17 Apr 2023 08:48:27 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] sip: upgrade 6.7.7 -> 6.7.8
Date: Mon, 17 Apr 2023 15:47:44 +0800
Message-ID: <1681717665-19231-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
References: <1681717665-19231-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Apr 2023 07:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102120

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  - The latest version of ABI v13 is v13.5.0.
  - The latest version of ABI v12 is v12.12.0.
  - The 'wheel-includes' value of the 'tool.sip.project' section of
    pyproject.toml now supports the use of absolute file patterns.
  - Replaced the use of the 'toml' package with the standard library 'tomllib'
    package for Python v3.11 and later, and the 'tomli' package for earlier
    versions of Python.
  - Bug fixes.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/sip/{sip_6.7.7.bb => sip_6.7.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/sip/{sip_6.7.7.bb => sip_6.7.8.bb} (83%)

diff --git a/meta-oe/recipes-devtools/sip/sip_6.7.7.bb b/meta-oe/recipes-devtools/sip/sip_6.7.8.bb
similarity index 83%
rename from meta-oe/recipes-devtools/sip/sip_6.7.7.bb
rename to meta-oe/recipes-devtools/sip/sip_6.7.8.bb
index 5e361d972..01000f59c 100644
--- a/meta-oe/recipes-devtools/sip/sip_6.7.7.bb
+++ b/meta-oe/recipes-devtools/sip/sip_6.7.8.bb
@@ -11,6 +11,6 @@ LIC_FILES_CHKSUM = "file://LICENSE-GPL2;md5=e91355d8a6f8bd8f7c699d62863c7303"
 inherit pypi setuptools3 python3native
 
 PYPI_PACKAGE = "sip"
-SRC_URI[sha256sum] = "dee9c06fa8ae6d441a401f922867fc6196edda274eebd9fbfec54f0769c2a9e2"
+SRC_URI[sha256sum] = "7e7186a36818c9d325c82e59ac5b049d9022c2d5783942c38d49497ac8a94c8f"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


