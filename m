Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1070DC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 01:15:57 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.1777.1666055743245309927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 18:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l31TwkTh;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666055741; i=@fujitsu.com;
	bh=yYQLzfhLF6KiK4gIHmYcaCHrfQPrDXfChE/bRwsaLzg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=l31TwkThL+ZUVdd8A+ttuOpBNUyqyALWQqdWmbvnA1H/EQF2hsJAcDw++HQmDw40D
	 fWLLjgXt/fGI/05Slwr7St2MWT0bHry5zadR3GgarFw1ObDV4g9xdA4i4ksg9x1U/1
	 YFU8pccb7tz151DCmsJWJQ2ucBiEQdatMoCKb289I4TTyH5iw6ydJ3rrfRGzGyQVqN
	 C2Pe2VbyDtld+zXHlle8cWap04OU/C7mpiYFdwleda/dYNRbUe4zHYkO6chNm+OIuH
	 DnhhzLKpRjXPR5bnF/Blno5yQ3Oqt8agh8/1rgzwm83da9uKG/H06Cuf2bnpDh/ph7
	 x+DoW6Nh9Mq+A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpGvzzzf
  Z4M1MVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaN5+mm2glmcFRPv72NtYDzO0cXIxSEk8JBR
  4uiG1cwQzhUmidtLjzJBOAcYJeb37QFyODnYBHQlXvxYzAJiiwjoSyydvYcZxBYW8JW43DyZD
  cRmEVCV+LW/gR3E5hVwl7jy+TcriC0hoCAx5eF7Zoi4oMTJmU/A5jALSEgcfPECKM4BVKMoMX
  u6PER5hcSsWW1MELaaxNVzm5gnMPLNQtI9C0n3AkamVYzmxalFZalFuobmeklFmekZJbmJmTl
  6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgWGXUpz6egfjsWV/9A4xSnIw
  KYnydszwTRbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwav1BygnWJSanlqRlpkDjAGYtAQHj5IIb
  9QZoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpcR5z4LMEAApyijNgxsBi8dLjLJSwryMDA
  wMQjwFqUW5mSWo8q8YxTkYlYR5OUCm8GTmlcBtegV0BBPQERn7vUCOKElESEk1MG3i/BK7c/+
  21VYf/2e9skvfOVfkRPU/hYdrm32kWeNyty94c7/vB7/f6YxvRlee7Fzu/kjicqvBTN78MrE/
  m6/e5rLyVF2j05t1/+ZE7SVWIf1/dedz+s5yMRV9YFM3YXtVp4/nxTW/zB2M3xnU/NZY0Z//c
  /n0ar/3Tmc+3DstVSlqLbysgWVtU4GmZbGRZnvoUy6TQ3NFeltknAJf/2beJly1bMa9X/cONW
  1n1XsR+m/V3Dt180VSjFpb+RYfLvxs2rfxiemfGZ/OBgktvjXds9N7VnbBGeszlwxY6sti582
  cvmjm5HvXRb78Mt0xoY9RXt3T+1F3YwfTLvZb+WuOR7g4H3uY3cjhNF/19BQlluKMREMt5qLi
  RABc7vXIQgMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-728.messagelabs.com!1666055740!50835!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9347 invoked from network); 18 Oct 2022 01:15:40 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Oct 2022 01:15:40 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0D7141AE
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:15:40 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 024241AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 02:15:40 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 18 Oct 2022 02:15:38 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-stevedore: upgrade 4.0.0 -> 4.0.1
Date: Tue, 18 Oct 2022 09:15:30 +0800
Message-ID: <1666055730-2392-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Oct 2022 01:15:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99226

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-stevedore_4.0.0.bb => python3-stevedore_4.0.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_4.0.0.bb => python3-stevedore_4.0.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb
index 46c6d831aa..70c43f3ace 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_4.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "f82cc99a1ff552310d19c379827c2c64dd9f85a38bcd5559db2470161867b786"
+SRC_URI[sha256sum] = "9a23111a6e612270c591fd31ff3321c6b5f3d5f3dabb1427317a5ab608fc261a"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.25.1


