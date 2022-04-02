Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31322C54EC5
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 17:24:49 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.2690.1649137235913560496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Apr 2022 22:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GGRCiJIz;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649137234; i=@fujitsu.com;
	bh=9G+m/nnzikTg/SVWHKmkGgbiikaZRQaBjEdTT26XUmc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GGRCiJIzr2VxA0OfAgmFk/P30iYvgWJ8/Rdn+w6FyWZOlYrpNQnH8jLldn6/mmYX6
	 oT8qR8IxxRYsx6+ukGYLJwnv9OYenrRv+4hdpnPYrZVAaum/Li9H+GJqY05H/3BeOL
	 tjHq1tJcYLPtGyn5YZ1uLfpdrP1+PSr6HA09gxk/3Y6w91HlN28azmv18Meku8HOuY
	 B83CI31bcH0z5bWD9MfMAgJ/4ySl45cwfWMoM76oBQA/YetYjJAOb2cTyCLEX4vTvb
	 uxJ1fxKLQLk3jbCOkcNVg+TbXcwkPd2v/Wh/oKYSdlvszL7h45thpI4phbq+SR5Wz7
	 xZsw5GhgEWQkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqBt4zTv
  JYNJ2A4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePqxyNMBQs4KyY/X8TSwHiOo4uRi0NI4Amj
  xLpV29khnAtMEh/ab0A5uxklZk4/x9zFyMnBJqAmMf3WDVYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhgSCJvYs3gtksQPE/HWfBangFnCS272hnBLElBBQkpjx8DxbnFHCWeL7jPROILQRUc+b+b6
  h6QYmTM5+wQMyXkDj44gUzRK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJGplW
  MdklFmekZJbmJmTm6hgYGuoaGprpmJrpGJqZ6iVW6iXqppbrJqXklRYlAab3E8mK91OJiveLK
  3OScFL281JJNjMBwTil2+LqD8XjfT71DjJIcTEqivGdcvZOE+JLyUyozEosz4otKc1KLDzHKc
  HAoSfCePAuUEyxKTU+tSMvMAcYWTFqCg0dJhPfIRaA0b3FBYm5xZjpE6hSjopQ4780rQAkBkE
  RGaR5cGyyeLzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5uUBmcKTmVcCN/0V0GImoMXvzni
  CLC5JREhJNTBt4Vzo56C+ofqQyGqfggdFF4IZr8e91DZ13HWL4+zS+7+N/986wDrX02+ba8a5
  gKdBy0rZcrPKWRavufh6++XuQ5++MjzkeGvyqadjwaPQBxflTwXE3maLNJaekJvt+SnUzfn+t
  v02T91DCr9ldFd0Sbk94Ny3w2DRHqkw3WWvrv9s4bXNzJ2/5FboF9W689sMBQu3h6//+kO6hU
  Pd8yPfsiqTSbVybwVTb4p8s6wMuHuUx1s9bV/67j/HeTY16Sy/8TN2Kf9WdQ1d+faoVb+ddpq
  JvDUMO/p/6/5Z282YD6toOS6vDzuffSfyrvYp1r+cynfsNaTiLJdL/haZtTK1MfONaHBkkolN
  k9Q1pUQlluKMREMt5qLiRAAgYFE0YgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-545.messagelabs.com!1649137233!320243!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24784 invoked from network); 5 Apr 2022 05:40:33 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-12.tower-545.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 5 Apr 2022 05:40:33 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2CDB71001A7
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:40:33 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 023D510019B
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  5 Apr 2022 06:40:33 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 5 Apr 2022 06:40:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 10.3.0 ->
 11.0.0
Date: Sat, 2 Apr 2022 20:36:46 +0800
Message-ID: <1648903009-19854-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
References: <1648903009-19854-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 17:24:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96410

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_10.3.0.bb => python3-pychromecast_11.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_10.3.0.bb => python3-pychromecast_11.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_10.3.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_11.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_10.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_11.0.0.bb
index 43ba3a9dd0..f556963731 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_10.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_11.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "4eb107446fdbed876f48c83202b6212b221286168a55c16b3eb8edf4200f10a1"
+SRC_URI[sha256sum] = "151723b178110052b673b8765a120c85d16eae8c22d75575dceebe2be1eb1ef6"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


