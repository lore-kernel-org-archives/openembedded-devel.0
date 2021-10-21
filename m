Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDD1DC433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 09:19:21 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.4])
 by mx.groups.io with SMTP id smtpd.web12.6819.1634807960847568508
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 02:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AaPERLmv;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634807958; i=@fujitsu.com;
	bh=XKmOMIixmalyxKp/JShRMLBjtgYKnYhZia+xDmqmz2E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AaPERLmvxfJRsU8pR9HUxMa9tKC4Y5AAZoCM9ObWQMoWOsqzO5pxM5bGFZadIIEGv
	 lALzSiSXjgFWAec8r5N6w3L161MoDcRmqWXGYf0u7/nmL8KRFGeFSvyQ67fy0vTnqt
	 Ii3xdBcIZDY/Z8LcginU9UztAAektHgWZw2KhVw7946Dp1mkh7W3iWjoVmRcsSe7yQ
	 e2EFemPtGkx+YH3kyrWErhlFnq4RFgPAii5JQSZjsCDhUWRkNlYBHKPgXYATfKTKHG
	 ER068K/aCF2a/dsB0EKndhtn5RCmPIbShdMFkLz1V+DQimZq7TURINfnFecY2h8NUE
	 zf9j01GIplsBg==
Received: from [100.113.3.109] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id A2/37-09980-69031716;
 Thu, 21 Oct 2021 09:19:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MxSXeaQWG
  iQc8EYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPHsYdMBfM4K15t38PUwHiKo4uRi0NI4Amj
  xLLu2WxdjJxAzgUmid0z0iESexgl/uzZywKSYBPQlTj3eC07iC0ioC+xdPYeZhBbWCBA4syyO
  WBxFgFViTVbzzGB2LwCHhI/7t5nBLElBBQkpjx8zwwRF5Q4OfMJ2ExmAQmJgy9eAMU5gGoUJW
  ZPl4cor5B4ffgSM4StJnH13CbmCYx8s5B0z0LSvYCRaRWjZVJRZnpGSW5iZo6uoYGBrqGhsa6
  hrpGBuV5ilW6iXmqpbnJqXklRIlBWL7G8WK+4Mjc5J0UvL7VkEyMw8FIKGc/vYJz65oPeIUZJ
  DiYlUV6dXwWJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4d6oXJgoJFqWmp1akZeYAowAmLcHBo
  yTCO0kPKM1bXJCYW5yZDpE6xagoJc6rCIwdIQGQREZpHlwbLPIuMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLm7dIFmsKTmVcCN/0V0GImoMUFFgUgi0sSEVJSDUxbeEu0/sZeflFeeNl4/aq
  /J84yawS0Wym9WJj1aG/v9b8Pun32Fn9bsdnjgqDC5Ln8Pnfs5/u7BLq+Mvb5Vl8kmub1VHry
  vpTy+CpzllK9WWbNyV/E+Kc9O3hB9uWTD4W+m1+dLCoO4LbWVIlcu+eJUPqb75LXY3VzBJYen
  qXFePCbbEtQz93D1hvvGQU3rDs143evkP7i1CrxONsbT+aLRmzntrlTcI+5/0l//K+Pm7jO8Z
  /uOKV0dH+q0U2v1kju7hOdN19MYd555VPf3kMfec48DHfgcU8IX7KwO1R7f67zyd/fzSe0pEe
  ZNU5f//9aVFn8j9Vxhdudbgd3fmFoYHxv5hF4VWMbSw3LlwdKLMUZiYZazEXFiQBeZo3jNwMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-232.messagelabs.com!1634807957!3179431!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24241 invoked from network); 21 Oct 2021 09:19:18 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-20.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 21 Oct 2021 09:19:18 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B71A610046B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:19:17 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A8DE4100458
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Oct 2021 10:19:17 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Thu, 21 Oct 2021 10:19:03 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.23 ->
 1.4.26
Date: Fri, 22 Oct 2021 02:18:06 +0800
Message-ID: <1634840286-44159-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Oct 2021 09:19:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93519

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.23.bb => python3-sqlalchemy_1.4.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.23.bb => python3-sqlalchemy_1.4.26.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.26.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.26.bb
index 4bfaf656d..e00015629 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.23.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.26.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3359ed561ac16aaa25b6c6eff84df595"
 
-SRC_URI[sha256sum] = "76ff246881f528089bf19385131b966197bb494653990396d2ce138e2a447583"
+SRC_URI[sha256sum] = "6bc7f9d7d90ef55e8c6db1308a8619cd8f40e24a34f759119b95e7284dca351a"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


