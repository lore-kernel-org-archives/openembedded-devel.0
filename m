Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2FE5C00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 04:17:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.1111.1659586618932306924
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Aug 2022 21:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cCWJDx7M;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659586617; i=@fujitsu.com;
	bh=/PAZXfhknbQoB4DFt6zTXVOOTi/S9J0WqmDY0vJX1XA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cCWJDx7M9MddZq3eYA4EotQtCyqbfxneGN2FJKs3dKdadm14CZKXhjaVS/rXip6Xw
	 tIS+tK58Rd+IKG3+J6WlxHCWz7DnN2P3GPiJlUAznAdOlWZQkE/TxCC8Bf70ksECmY
	 iuS8rr7blPSiPt0V8UUqQgbP5Sh1iDCoNI3r3h59HgxP0Fgk5w1hP1QCdtiRWO7qDS
	 fj2smI4SWKeyQxCNrH6n2c4/5Cyp47iIRBr3GJd+7N+b+ue32dx9wTp2rmAlxmpRvM
	 Z62/YFH2honW4hQtqWK4HreeYue1xRrrpcPkEMn1n1LET+ho+/zABorqQu1calT6I1
	 KmefP7gZgGRbw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRWlGSWpSXmKPExsViZ8MxSdfC43W
  SwY776hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bpuYtYCz5xV3y/P4u9gfEUVxcjF4eQwBNG
  if0P97JCONeZJE7sWMII4exnlLh3bBuQw8nBJqAr8eLHYhYQW0RAX2Lp7D3MILawgK/E3K5lT
  CA2i4CqxOyNHUA1HBy8Ah4Sl/+FgYQlBBQkpjx8D1bOKyAocXLmE7AxzAISEgdfvGAGKZcQUJ
  SYPV0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjNZJRZnpGSW5iZk5uoYGBrqGhqa
  6xka6hhaWeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsYgcGXUqywdwfj5ZU/
  9Q4xSnIwKYnyyrq9ThLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwXvLFCgnWJSanlqRlpkDjASYt
  AQHj5IIryhIK29xQWJucWY6ROoUozHH3YV79zJzzPzadoBZiCUvPy9VSpzXzR2oVACkNKM0D2
  4QLEIvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmfeYKNIUnM68Ebt8roFOYgE7R4XoBckp
  JIkJKqoFJSf5Z0WKtRQ6xq62ftwknn43VYPA8F9Zn3xFnxbr8okDJnyUxBzYyv010qgjsiOn/
  XVIzP7lkts2862f2LUyb/nLjCaH+P7yK02T7+iSNds8+p3X2E3vWs1Npmy/yaTgp+c+JXK70T
  nv1uccWz6bZ+VvJP5ooqKYn/n/23KUCPzpOFdzQdotmkYjqsSr5c6R+O8PEwK4rc7Y8DpqnvO
  rpcsaKxy6fhA9EaJgdPRPquMDy0L0LVpFXPiRtK+0tvr3u0GbH7HNqDTcNC6ovXFrw89XHH9x
  1wrcamDymy96N42mf9P3qp501O5iqbtz/FF0zb4lqw46DBavmLVqQErzl91K3Z1oPFdcUMb6d
  7rgsQ4mlOCPRUIu5qDgRAJFWHsVLAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-571.messagelabs.com!1659586616!182094!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16656 invoked from network); 4 Aug 2022 04:16:56 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 4 Aug 2022 04:16:56 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5D59F1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:16:56 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 501041000C1
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  4 Aug 2022 05:16:56 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 4 Aug 2022 05:16:55 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.19.5 -> 2.21.0
Date: Sat, 30 Jul 2022 06:03:24 +0800
Message-ID: <1659132204-15999-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Aug 2022 04:17:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98122

Changelog:
==========
Fix

    Write single TIFF page for single RGB image (#851) (0f04bc9)

Feature

    Add is_batch kwarg to pillow (#845) (21d5c73)

Other

    Add a migration note about pillow squeezing (#850) (7c55a55)
    Add missin option to imwrite type hints (#848) (6da4a42)
    Ignore exclude_applied on legacy plugins (#844) (f082dde)
    Remove unneeded CD steps (#847) (0d99c51)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-imageio_2.19.5.bb => python3-imageio_2.21.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.19.5.bb => python3-imageio_2.21.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.19.5.bb b/meta-python/recipes-devtools/python/python3-imageio_2.21.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.19.5.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.21.0.bb
index 6fa43930de..21a8c4f37a 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.19.5.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.21.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "eb3cd70de8be87b72ea85716b7363c700b91144589ee6b5d7b49d42998b7d185"
+SRC_URI[sha256sum] = "a5d19c3c787d5b4920356d85999a24fcff32be8941950dc2409ec1513993952d"
 
 inherit pypi setuptools3
 
-- 
2.25.1


