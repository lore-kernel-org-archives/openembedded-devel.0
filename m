Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBBBC43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:30:37 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.25538.1655429433259205734
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:30:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=b54ihsU3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429431; i=@fujitsu.com;
	bh=Y1A6euvDD6ew2x6PbduAXk10i4Ln29/vX3Ei5/+eXeE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=b54ihsU3UdPHIlIvDZiSb+yFaIhtnQ03fxk7gWPnLfHVHNp+FjQGuYvbKqpNflRX9
	 EVBCfBkSHyjGrCURV/7w4kx29j55ErPu7E7AMiJt+Zy8sV5ikLTosHibUKLClX2Pti
	 /gWsktpNC0Eo1U3cf5whQBxGFqlDhX1m07RRJeJJa5U62UkddUcKMLWY23RFVEzi9Q
	 gRPyt3LyF4F0UL5ZRMhqNxnCaObxjkYx+1hjtHrWR7fDb5D3xY1xtKfHRMFv7L4kY3
	 krAa4QiZGVsZry+cHcFxP1iPFCQtD1pzd8B7CsfLfIURWMyVnX135tIQN7NpmAtS0/
	 j27gQwd6HLOTg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrCIsWRWlGSWpSXmKPExsViZ8OxWdfs5uo
  kgysTZCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oz9hz+zFMzjqpj14jhLA+Mezi5GLg4hgYeM
  Et8OzGXvYuQEcs4ySUy7mwGROMAosePxSlaQBJuArsSLH4tZQGwRAX2JpbP3MIPYwgL+Eq2Ht
  4A1swioSszs/QBWwyvgIXFmcgsTiC0hoCAx5eF7Zoi4oMTJmU/AapgFJCQOvngBFOcAqlGUmD
  1dHqK8QuL14UvMELaaxNVzm5gnMPLNQtI9C0n3AkamVYy2SUWZ6RkluYmZObqGBga6hoamENr
  SXC+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwAFOKU47uYDy275feIUZJ
  DiYlUV6t46uThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwOlwFygkWpaanVqRl5gCjASYtwcGjJ
  MJrfxkozVtckJhbnJkOkTrFqMsx82vbAWYhlrz8vFQpcd4P14GKBECKMkrz4EbAIvMSo6yUMC
  8jAwODEE9BalFuZgmq/CtGcQ5GJWFe8RtAU3gy80rgNr0COoIJ6IjGfStAjihJREhJNTDl72v
  Mz5nRov/JpZXla+X6z40vBPxLvx0OdD4777J+bOzVTNOgswG+Jk1yF2TXHW5mz8/xvlu1WPwF
  46aYJXvE6/cf+ihnWMM8076kfpLUK+UtIqer5GYLvm1WuPBh060zi+a/m9+/WFkmbdHhfDen8
  y7852WVbVam7LH213l98SafX5HNn2mWnP02Qhn3b7frWB6bHPtq8WZfmR1fBM8GCDXaKxq9mF
  +jdlJoy5XmqPCw7tBZbFoL7eNWZUa+u9tRPt93spZHx5UFfiJPA1KEHtjtiSyax/Qt9/eh1La
  s60UrYo+Z8e/028l8e9cnp3kH7rlfTUyLk/QW43kYz+Pp0hJ/a9lEw6vL64J6U5VYijMSDbWY
  i4oTAWovVPhHAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-732.messagelabs.com!1655429430!51833!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10175 invoked from network); 17 Jun 2022 01:30:30 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-14.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:30:30 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id D9FDD153
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:30:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id BE48D150
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:30:29 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:30:22 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 1.11.1 ->
 1.11.2
Date: Tue, 14 Jun 2022 17:14:24 +0800
Message-ID: <1655198064-24246-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Jun 2022 01:30:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97525

Changelog:
==========
Fix 'replace_existing' argument usage in XsdElement.get_binding method
Add Russian full translation

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...{python3-xmlschema_1.11.1.bb => python3-xmlschema_1.11.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.11.1.bb => python3-xmlschema_1.11.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.11.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.11.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.11.2.bb
index 9f0944a9f..e687c0cd9 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.11.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "9232b3e3d967b956c5f96f3dcd82f1157f88aad18939d1b8f26c870bc15c5938"
+SRC_URI[sha256sum] = "0706c84de20686c940fa07e2b88425cff1471c89544a49e9365b9636236ccd2f"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.25.1


