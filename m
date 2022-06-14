Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27DCCC433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:30:57 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web12.25829.1655429453308073083
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=McY4dlPf;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429451; i=@fujitsu.com;
	bh=K6F65mVKy93qC188mXi6Jok9Iu5W8oyBzLzktt91IoA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=McY4dlPfZhQYuRR3U89R0I74ra8PWPnI3oWd3bqXYnQHINiOYcaqQGqAtLffkYkdM
	 6v5kVa8f9UO/LQYuCCtq4fAoEbDJZI6lAdbf4QrAmdrh5zo6c5zFA3hyHDBoc0QmS1
	 4nSrAuB3RNDzUwp7/DSfgwziBJtz5qS0dCjrgh3mmp8BUB4auMMuTHHPPOXcmE1N+R
	 heiZL7fW5t/VvLdBfZU+fBmD+VSBeSxhIZZFlh4Xrod0wJS6YWqI/D5ZIjeoQLsJCr
	 jtVLVHdzZaqwcdvfd8UTGpO6TvW1rZI3PKcFQ3vb+HvMdOUu3voJtNmlym9yE6z0wG
	 i5ANZs5nCTc/Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORpOt1c3W
  SwbUtZhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bphW/YCto5KxatEGpg3MrRxcjJISTwkFGi
  5SljFyMXkH2WSeLC86VMEM4BRomv606wgFSxCehKvPixGMwWEdCXWDp7DzOILSzgL/Hu0EOwO
  IuAqsSydxuZQGxeAQ+JHR/a2EBsCQEFiSkP3zNDxAUlTs58AlbPLCAhcfDFC6A4B1CNosTs6f
  IQ5RUSrw9fYoaw1SSuntvEPIGRbxaS7llIuhcwMq1itE4qykzPKMlNzMzRNTQw0DU0NNU1ttQ
  1MjTWS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknRy0st2cQIDL2UYvWrOxg3r/qpd4hR
  koNJSZRX6/jqJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvA5XgXKCRanpqRVpmTnAOIBJS3DwK
  Inw2l8GSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSpz3w3WgIgGQoozSPLgRsJi8xCgrJc
  zLyMDAIMRTkFqUm1mCKv+KUZyDUUmYV/wG0BSezLwSuE2vgI5gAjqicd8KkCNKEhFSUg1M3qb
  vvWQF+gqu55sXiZiacP1s8Po2q005beq/h+LJusuuqIg2Cv6evLpSwemYSd/xwLvJAnxTD+if
  bFI6OX9qTNfisKlXsm47WDU8f2YfUODo/0FNXMsh14NVpWhuAfOFyp9RP5cna/286FG8KO14f
  5HG410L1oVbnf7KwZgQ0+hyrC9st6qIxspnu7SD8g1Nv1WqR30pMZxy+NHZ4CnMU/5/nLBNUH
  r6nT9n1Gry393f9CPq92KNhbI1iRK6LXy9tl1XMzfmRu6q3XFxWuys+Ikb4mxFPn1YofnYw2O
  bhZJdgX7p+orPQdtudf/zU3Djvi39X8g2drZ57s1HXHZHTnC8r9h7YuXj1p8hqW+VWIozEg21
  mIuKEwEAuMNVRAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-571.messagelabs.com!1655429450!305121!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29789 invoked from network); 17 Jun 2022 01:30:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:30:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 87FF81B0
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:30:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 7988B1AE
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:30:50 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:30:46 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-bitstruct: upgrade 8.14.1 ->
 8.15.1
Date: Tue, 14 Jun 2022 17:14:52 +0800
Message-ID: <1655198092-24323-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 01:30:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97527

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-bitstruct_8.14.1.bb => python3-bitstruct_8.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstruct_8.14.1.bb => python3-bitstruct_8.15.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstruct_8.14.1.bb b/meta-python/recipes-devtools/python/python3-bitstruct_8.15.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-bitstruct_8.14.1.bb
rename to meta-python/recipes-devtools/python/python3-bitstruct_8.15.1.bb
index 77ef98570..fe3aeb7b5 100644
--- a/meta-python/recipes-devtools/python/python3-bitstruct_8.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstruct_8.15.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/bitstruct"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "d38131bd447b6af5b8f464c4878797c87a5d9da1c95b9357e071c424fde5f055"
+SRC_URI[sha256sum] = "6fa6adbfb8f3b8cb68c21b13aa65d23eb2c3ac32419ab926f3fd1fff717a9125"
 
 PYPI_PACKAGE = "bitstruct"
 
-- 
2.25.1


