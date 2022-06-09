Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3AECCA473
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:57:51 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.7945.1654761461446163601
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uJmDHu7c;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654761459; i=@fujitsu.com;
	bh=p5W5vBHrDcf0Yf3NLb4h3pGSUYux+1EhHTXwenaZFQI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uJmDHu7csrAdmhdvibuekAQz6NebXNTBDeixCyok/kGaVEjLPHNa7cKi3hPXaob8L
	 1SzNdY7Omw5NaJllmoy08+7rKPKevigvzn450PpPZr0Y0He9k6zPGZ6jBCT27Y6FvW
	 oJ6uc944LZcbvUCex07vvi393SA195ihCjrdz4ZV+339FmcBHd9G9EqtifpVXhvb/1
	 Hv4PQD/FBDNw8DzFQn7vP/yChAM+uiLn1adSXqscPPmxwvkXAhgtDqIZtzqTOW6Qb5
	 VOJoDWIOtdxAJkEmTVbo89UlNpjU/8H36AuCb6lyc/Bv1RorLvEc0oSRTCJBqB1xMw
	 5gInepqDHAuew==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLIsWRWlGSWpSXmKPExsViZ8OxWffz8oV
  JBofb2SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz3vUYF9/kqVt8obWB8wdPFyMUhJPCQUWLC
  5LXsEM5ZJonFfxuhnN2MEt+29rB2MXJysAmoSUy/dQPMFhHQl1g6ew8ziM0soCLx4ncPO4gtL
  OAn0XN+HpjNAhQ/fmsKG4jNK+Ak0XRwHlivhICCxJSH75kh4oISJ2c+YYGYIyFx8MULZogaRY
  nZl5tZIOwKiRkztrFB2GoSV89tYp7AyD8LSfssJO0LGJlWMVolFWWmZ5TkJmbm6BoaGOgaGpr
  qAkkjY73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMCQTClmqN7B+L/3p94h
  RkkOJiVR3pMLFyYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuCduQQoJ1iUmp5akZaZA4wPmLQEB
  4+SCK/tMqA0b3FBYm5xZjpE6hSjLsfMr20HmIVY8vLzUqXEeVNAigRAijJK8+BGwGL1EqOslD
  AvIwMDgxBPQWpRbmYJqvwrRnEORiVh3ukgU3gy80rgNr0COoIJ6IhfVxaAHFGSiJCSamCKWag
  uV3CrKcNQ8vMn4W5PVnNHk+feoWEs04yl5p4R/T+F89zDovT06bvu7nkjErB0EZegioZD5uwn
  nQe9uFwE25YY2z/dJ+M9u/3ewS+v1z/tfdg2+XNd7k8djcQlc7ncH4TsEr82X/VerJAuxxTbH
  3NeP7ebzcfCXWQd2nnQ6Ln3/aeekdr5LxdMjLq1dUO2EoO7KicTW2jjTGOlyoQ3EUyKL2xarn
  icVInqrOT8zVV2wvsh19wTM5unX8v6N/WJyc6neuetebb07DyaF7LOne95yJeEN2Kbcm0L0xd
  au24xm342PTzEKFtxX+q66/z2STETGZxWbuF4v/nA1+XH93uIuYf2H7p2jaPz6gwlluKMREMt
  5qLiRADM8WygUAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-11.tower-587.messagelabs.com!1654761458!76534!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27145 invoked from network); 9 Jun 2022 07:57:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-11.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:57:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A27B881A
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:57:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 8390B814
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:57:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:57:17 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-cantools: upgrade 37.0.7 -> 37.1.0
Date: Thu, 9 Jun 2022 15:56:58 +0800
Message-ID: <1654761421-29641-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:57:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97457

Add dependence asyncio.

Changelog:
==========
    Parse SPNs in SYM Files
    Miscellaneous smaller fixes
    Implement support for AUTOSAR secure on-board communication
    Distribute & expose type annotations per PEP 561
    Add more type annotations
    Improve encoding performance
    Add Support for Dumping Database as SYM File
    Fix SYM file bugs
    Fix parsing of referenced data in CDDs
    implement decoding of partial messages
    Use floating point scaling in encoding
    Small improvements after #417
    minor bug fixes and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_37.0.7.bb => python3-cantools_37.1.0.bb} | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_37.0.7.bb => python3-cantools_37.1.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_37.0.7.bb b/meta-python/recipes-devtools/python/python3-cantools_37.1.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-cantools_37.0.7.bb
rename to meta-python/recipes-devtools/python/python3-cantools_37.1.0.bb
index c179071af..1af1310ab 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_37.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_37.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "e603a7e1e40f5b4963c4c64cf4b013264afa009e232a878c73d31c29942e4466"
+SRC_URI[sha256sum] = "9f2449e94a7698bd44bb50d9b464788053a0bf070faa09a132535c3aa07e7e6a"
 
 PYPI_PACKAGE = "cantools"
 
@@ -16,6 +16,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-textparser \
 	${PYTHON_PN}-typing-extensions \
 	${PYTHON_PN}-diskcache \
+        ${PYTHON_PN}-asyncio \
 "
 
 CLEANBROKEN = "1"
-- 
2.25.1


