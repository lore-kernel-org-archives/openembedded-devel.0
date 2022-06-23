Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1F1CCA47F
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:09:56 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web12.4538.1655968193816034506
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cn+qklHR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968192; i=@fujitsu.com;
	bh=X2iSLugmrOwD4PuSJ9pT9FHCVp4jJ8Rd+9l1TOErfq4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=cn+qklHRBloGUFRCmXXF6lwe0DL0sI9wgnK5ixjl4VdM8Zu4hScb55KV64lIFJMmI
	 cZ8bcOtyw/GLLi818suhG1c8J2qI9Twh6MNP9TmNF0+xhnX7FwMuO4Y6esZTJ3wbK2
	 kxxCc04YbFLpJFKlbTMw8fUAhNuYhO+qmmT9sep7FA5kWvnSIh4ubKM0YTGUMrND4h
	 BgTNcboZZmOSuouERQ4VBcbMtmuX3qZopo+ZiwV5J1YDU7njC+dBPXD4MPj9V0+ZKR
	 n63BM7/ufjg1yGrYMPJ2ED6k/pRRVii8Sq1dywltQT6le2JojatBTiaymHd7xG9XoB
	 B1NZe8LLlhr5Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8ORpLtfcEu
  SwZODOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bRy7vYC05wVqy/eJGpgfEjRxcjJ4eQwENG
  iXP3LLsYuYDsW0wS6898Y4ZInGSUmL/VAsRmE1CXeHzzNSOILSKgL7F09h6wGmYBVYnui2vYu
  xg5OIQFgiQury0CCbMAhX9dfcQCYvMKuEvcPD6DFcSWEFCQmPLwPVgrp4CHxJFNK1ghVrlLXL
  jSyQhRLyhxcuYTFojxEhIHX7xghuhVkjix4iMThF0h8frwJai4msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMVklFmekZJbmJmTm6hgYGuoaGproGukYmxnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIEBnFLM8HkH44K+n3qHGCU5mJREeZ/xbkkS4kvKT6nMSCzOiC8qzUktPsQow
  8GhJMF7iR8oJ1iUmp5akZaZA4wmmLQEB4+SCO8ckDRvcUFibnFmOkTqFKMlx9TZ//YzcywHkz
  O/th1gFmLJy89LlRLnbWADahAAacgozYMbB4v4S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJW
  EeX1B1vJk5pXAbX0FdBAT0EFPlm8AOagkESEl1cDksfHMPdY9ClHzVwhfN9by/JQZYLl6smSm
  +PO3x1VfvfEP3C2yOuyW6ebAl+5lsaYOqx4IXgvZx1df3vc84TDzhHk5p2p//zA92XC0szvj0
  q2PrbqMPNus9SbuOeLJde7Wq/uHP6w55/L/toD1yi12abfqRDdmej/atvpp+wMj3c9c/9xntv
  pdX+Me3ihtdCdFfup7hWsqt46sVFncnDY19tHP2oQdHwtyucPvTfz2ZzmP/n/2PQdttkqWPXW
  4ktS7LNj7imHs0e0up0PE37xcmJles31h4gOh8gfnAov51NvUdsxubFxbctfmxaq3U+Vj2ov1
  7/ArvL0QefHn+Y0103Qt/d9KdCx/p3OFQ7zKW4mlOCPRUIu5qDgRANAcv3hzAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-585.messagelabs.com!1655968191!41088!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3978 invoked from network); 23 Jun 2022 07:09:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-23.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:09:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 4DF211AD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 42DE11AB
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:09:51 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:09:49 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 12.1.2 ->
 12.1.3
Date: Thu, 23 Jun 2022 15:09:34 +0800
Message-ID: <1655968177-15916-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1655968177-15916-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:09:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97580

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...n3-pychromecast_12.1.2.bb => python3-pychromecast_12.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_12.1.2.bb => python3-pychromecast_12.1.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_12.1.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_12.1.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_12.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_12.1.3.bb
index c8686ab52..bbed92150 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_12.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_12.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "6be626e5ba2f6ffaefbc13ddced84e8b60a9ef1b012f71039fc0f7a0bcb4bda6"
+SRC_URI[sha256sum] = "edd67b6d23d5d064a56c97cd90ea661fa8ffd76720bf199b5a126c6869f81e01"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1


