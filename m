Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB7FC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 02:30:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web08.7353.1663641035168315333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 19:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=cGc00zl+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663641033; i=@fujitsu.com;
	bh=0K1q+j+MedD/wrPl3LzZ43NI1zLkWSmlx7ALxhcWcnM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=cGc00zl+QMMzU1gxvCEf2iPdoeVZCpsJWjvoLUo7kLn3niyViH7vmeNpDWXkZa88T
	 gX7gtQnDN4CY71yR3U1xYSIlcEoSSeePOslT+FHnyMsfMGnNPQ/OYiFD135ilX5TG9
	 nFeRZAd/+k0Fw8LJtG74rVivyVqv7EL6xzF7UQVHvZ4vv8Yq3Ysm8EQYHwia/9+kSJ
	 oEtPOIsnJjfwKoycrVDCN8BKNDkJGHebqz5D6INL0Cn6bAx3GXCCuxTUsHoSwc5n29
	 P/naiR2Qxp9uDuQeGUpuSvSH8JAduZ7JGDndfh9wl7eHorxCS5fJfLDlGdckhrGgIK
	 SATySBH3AWYQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGIsWRWlGSWpSXmKPExsViZ8ORpHtCVTP
  ZoPu5vsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrG6eQNTwSKOivkHtzM2MF5k72Lk4hASeMgo
  0bT1BRuEc4VJonXbByYI5wCjxJ/daxm7GDk52AR0JV78WMwCYosI6Essnb2HGcQWFvCSaP49n
  RXEZhFQlZh5uw8szivgLtHdfoMdxJYQUJCY8vA9VFxQ4uTMJ2BzmAUkJA6+eAEU5wCqUZSYPV
  0eorxConH6ISYIW03i6rlNzBMY+WYh6Z6FpHsBI9MqRqukosz0jJLcxMwcXUMDA11DQ1NdY2N
  dcxO9xCrdRL3UUt3y1OISXSO9xPJivdTiYr3iytzknBS9vNSSTYzA4EspVvTawfhqxU+9Q4yS
  HExKorxcdRrJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR47QU1k4UEi1LTUyvSMnOAkQCTluDgU
  RLhlVMBSvMWFyTmFmemQ6ROMSpKifNagiQEQBIZpXlwbbDou8QoKyXMy8jAwCDEU5BalJtZgi
  r/ilGcg1FJmJdTGWgKT2ZeCdz0V0CLmYAW31BRB1lckoiQkmpgmsguemp69zmdg31uvJe2bBN
  TexvAqKghMq26+dWDSWVBWRe/nZEPUfOqS1Nzc2BQnPiJVTH8oaJ21uuXeqsuBuz6Pc884t6n
  t/qrWzYbaZo5ZHnvfeLi8sV99qoihzmcke/Vc9Nkdq6+9j/q9v6qKdymTcbLWKe7ZjJIBjOxi
  bx1uX7K9IbhUdtnCUekte7y3HX7Ofm0XEtv3brKSa87Q102Bx58XWPZujlX+z4v47ZpqTwmrR
  t7muep3qzkWecjvv+I8ee15onzzBavcJPb0Xjw9rwlCU2aS7/ciIvq3bom7UL5bofFK2feYva
  ffMdVZf7preLab7Pl5T2nqUkHflsw50z4O8NpqVebT+0+r8RSnJFoqMVcVJwIAEBCXy85AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-548.messagelabs.com!1663641032!21676!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25668 invoked from network); 20 Sep 2022 02:30:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-16.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Sep 2022 02:30:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 7E9CB1AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:30:32 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 73A6B1B0
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 03:30:32 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 20 Sep 2022 03:30:31 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pyproj: upgrade 3.3.1 -> 3.4.0
Date: Tue, 20 Sep 2022 10:30:23 +0800
Message-ID: <1663641023-2500-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 02:30:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98895

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-pyproj_3.3.1.bb => python3-pyproj_3.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.3.1.bb => python3-pyproj_3.4.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.3.1.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.3.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb
index 6085e48b3a..62eceb2c09 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.4.0.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "pyproj"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b3d8e14d91cc95fb3dbc03a9d0588ac58326803eefa5bbb0978d109de3304fbe"
+SRC_URI[sha256sum] = "a708445927ace9857f52c3ba67d2915da7b41a8fdcd9b8f99a4c9ed60a75eb33"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-certifi proj"
 
-- 
2.25.1


