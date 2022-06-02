Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B835CCA473
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 01:38:47 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web09.1722.1654133920405905869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jun 2022 18:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=il5nXKby;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654133918; i=@fujitsu.com;
	bh=attd/AymQYZGyklVEeUzsOHJqOXU4zVCIWYSQjxXWbI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=il5nXKbyAIVXD69dQj/EyLZwt0nDwL7s42l8adJpTMK4bxFIw9XnK4WkhDd+zJJvl
	 Jecxp8CqDmuTOh85xoh9PS9xLoHgcP0yTLO7jNMIrEXsv4u1ctWRWWzU26moVLW92X
	 32Y1B2NkzUXQwK4VcRVAXD+D3gd4bG/+zum4V1f68uYHFQmOQsURp7i1qkTEZVDowr
	 7wEfnppzoQAV1x6XDLKjcTBAyLNi8OvpA7MWWYv47gfSl1rnMKc8G1mlS8AJOZERZy
	 v9pg+5g9MmXBOom0guR/Z2jR84OVldnXxGJuDMq0xVuxPn6sDspxq6kOg6b973obfO
	 YWaKS1UUYiL6A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORpDtXZEa
  SweJeeYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP56gdsBZ84KxasYmlgnMvZxcjFISTwkFFi
  3t+v7BDOWSaJ7vXfmLoYOYGc/YwS2y9UgNhsAroSL34sZgGxRQT0JZbO3sMMYgsLxEncenWPF
  cRmEVCR2Hp0I1icV8BDYtbbm2BxCQEFiSkP30PFBSVOznwCNodZQELi4IsXQHEOoBpFidnT5S
  HKKyReH77EDGGrSVw9t4l5AiPfLCTds5B0L2BkWsVok1SUmZ5RkpuYmaNraGCga2hoqmtppmt
  oaayXWKWbqJdaqpuXX1SSoWuol1herJdaXKxXXJmbnJOil5dasokRGHwpxQkHdzCu2PdL7xCj
  JAeTkijvTsfpSUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeD2EZyQJCRalpqdWpGXmACMBJi3Bw
  aMkwpvHCJTmLS5IzC3OTIdInWLU5Zj5te0AsxBLXn5eqpQ47yWQGQIgRRmleXAjYFF5iVFWSp
  iXkYGBQYinILUoN7MEVf4VozgHo5IwbzjIFJ7MvBK4Ta+AjmACOuLatykgR5QkIqSkGpj4w+d
  IJWREc+1LvN8SOovHdfOWh08vLendo/b0AV+sl3btr08cIe4TX+48sFYo/N60+4veNGrHGnM+
  TNwZvWq5y9PP+W5ejTW3l0gbWqhm56gs2RiToHLyhoGxuU/6lK0qF3eEsrHPNG+8UuJSW3ky8
  xmf1OwVdXGXyictmx6TOPHzgVxlW4EJZ1iXLG59PSd+y7nsL3HdL6Y0M5akaNZpTZ5SbfnP1u
  /GxE8rxIs47HezmCuYbXh0+Pz68426kn3n+mY+aXpbcCwx52DTrJjGQ/MUXW5M4Cq8s+dPKM+
  XIuPKDXOeVId/cLmy+mAb483tlXarV13oz5cxePvp9/ZrhlzLDh0I2CB5e+LnEPb1SizFGYmG
  WsxFxYkAlPukzUUDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-728.messagelabs.com!1654133917!431853!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5179 invoked from network); 2 Jun 2022 01:38:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-20.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Jun 2022 01:38:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E897F251
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:38:36 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CF5E7D77
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  2 Jun 2022 02:38:36 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 2 Jun 2022 02:38:28 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-googleapis-common-protos: upgrade
 1.56.1 -> 1.56.2
Date: Thu, 2 Jun 2022 09:38:20 +0800
Message-ID: <1654133900-29485-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 01:38:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97376

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...tos_1.56.1.bb => python3-googleapis-common-protos_1.56.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.56.1.bb => python3-googleapis-common-protos_1.56.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.1.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.1.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.2.bb
index 171649ffb..78b899ef1 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.1.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.56.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6b5ee59dc646eb61a8eb65ee1db186d3df6687c8804830024f32573298bca19b"
+SRC_URI[sha256sum] = "b09b56f5463070c2153753ef123f07d2e49235e89148e9b2459ec8ed2f68d7d3"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-grpcio \
-- 
2.25.1


