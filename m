Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CF4DC433FE
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:02:48 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.6184.1640012567103589715
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=U8hJCi12;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012564; i=@fujitsu.com;
	bh=fMv58X7ypm8GieeeHcKJEaFV6jBbT50gD4h+s2fCfJQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=U8hJCi12Z0HxnvMhJHWIK+hX1TPdF5q0QveVaxXeMk77JVB8tCi+QSBelLI2PqO+e
	 yzeC2P5djIB2Ea2aF6BLrLVy0PxgzTFKJppwkec7XWt8JsIaCLrWno3RVmhK69ixip
	 VS25ymg1tSko1TtIqXoaeKrsCB3+zNYmCXsCeNDV/ae7gr9xoywuW8nkMKRc9uFqlp
	 RLKrDBEhibS9P+sWPGjSgM6xxo3BvQKUkuC0ZoAIpMyJdI26FNye0cP0+OoE1oXUzg
	 OfL1j8bAzliKt+c5CwLJ4XXeid+7KGXkzO0FNfrbYGgu5XNs+QiEqZ1KHkKjsdF5JE
	 Cngd4dvZRj65w==
Received: from [100.115.69.209] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 68/51-31213-41B90C16; Mon, 20 Dec 2021 15:02:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MxSVd49oF
  EgxWXzS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozuf9PYC25yVqza+pCxgfEjRxcjF4eQwBNG
  ifd7ZrF2MXICOReYJF4s14JInGCUuPTvJDtIgk1ATWL6rRtgRSIC+hJLZ+9hBrGZBVQkXvzuA
  asRFnCX2PLoAhuIzSKgKrFq6UEwm1fAUWL5pMVgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxjtkooy0zNKchMzc3QNDQx
  0DQ1Ndc1MdQ0tjPQSq3QT9VJLdZNT80qKEoHSeonlxXqpxcV6xZW5yTkpenmpJZsYgcGZUuy4
  bQfjqb6feocYJTmYlER5+X0PJArxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4P05AygnWJSanlqRl
  pkDjBSYtAQHj5IIbxNImre4IDG3ODMdInWKUVFKnDduFlBCACSRUZoH1waLzkuMslLCvIwMDA
  xCPAWpRbmZJajyrxjFORiVhHnTQabwZOaVwE1/BbSYCWixUvh+kMUliQgpqQYmO/X3EgYXDn2
  xVP16eKvUk3OLS3f5nVx96CEzW9WHRRHv1OvzkzfX9zxr8Ws+cXZdTELFY3Xeb2dP7KpS5yr4
  UbT1W1TOsuk7rrwrVEp5tEbQrLYt51r56fU3NgXP4XvN+zsxmruw4f7Kt+v2Wh/h7iz++NJ9m
  dXJn81HJ+91WMPw5fyeHLkPdpV9DJ+vn8tWyry75t68lzcm7vvBEm//aqu42KviCxUL2IK1d7
  jlGS0/tYujVvJ/PFN10BTf+sWfz249vTyQa2nuBIGrSzfM/f8wU93IkKvl8akdRSLxLBpPe/P
  07BTZ6/trDWZOTFw46V++kfXjmvakcEnjgishzClLmedqLnVM2ph8eXNDrRJLcUaioRZzUXEi
  AE21H4ZJAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-31.tower-528.messagelabs.com!1640012563!5340!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 945 invoked from network); 20 Dec 2021 15:02:43 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-31.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:02:43 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 61235100353
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 5411A1000FC
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:02:43 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:02:29 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] redis-plus-plus: upgrade 1.3.2 -> 1.3.3
Date: Mon, 20 Dec 2021 23:02:20 +0800
Message-ID: <1640012542-3632-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:02:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94449

Changelog:
=========
Fix async interface related bugs
Fix example and test problems
Fix Windows compilation problem

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{redis-plus-plus_1.3.2.bb => redis-plus-plus_1.3.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.3.2.bb => redis-plus-plus_1.3.3.bb} (90%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.2.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb
similarity index 90%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.2.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb
index 5c4c0aaff..c135105f9 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.2.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.3.bb
@@ -5,7 +5,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI = "git://github.com/sewenew/redis-plus-plus;branch=master;protocol=https"
-SRCREV = "e29c63db54653a660d7a0f556f670b7a6fce0a78"
+SRCREV = "389ffdf9e72035ea2096b03cda7f4a6809ae6363"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


