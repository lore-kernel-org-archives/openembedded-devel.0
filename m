Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29141C61DA4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 09:54:00 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.9608.1678355633457047287
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Mar 2023 01:53:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=uT3n2u09;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678355626; i=@fujitsu.com;
	bh=jtejTBrY2pGxHW02VBA83Ay4JL4+MYnRJJHR98QK5pk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=uT3n2u09MyXgmWtCBJp50LKtxfy9jMGSKRwetiLjrKD+gZTRR0D3XtxACLyoeSo4c
	 Ogi/tKNwTqAR5D76vUKRsnrf98PPaIjGRETsqnqpbbEQLa1YUanyoHUo4cmTzypLsG
	 NddLweeaz2+YCQNAHwtAtF8dI2XZg/XCKr0zivS8ewGzj8mZCNZITWxsdHiprfB07v
	 PbC4DA5/FYByJTUsXyWpF/70RIy7JtB0ucPqMDwH1TNxYzWeQRDHOPX7RuIYyIZ+Z3
	 rBUmTPVjFK18rRwKROJoo/kLVfxWPYD58QdeTJqehMnKdeESwTfE6oh2iE+REJI73e
	 kCyRpLj1NH/8g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxSXflGs4
  Ug9evmS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyz/Z8YC+ZyVqxc2MTawHiUo4uRi0NI4Amj
  xLvZy5kgnBtMEkdu/GCGcPYwSrw4383WxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECAxKPLv1hBbBag+Nx/J8DivAIOEqsaJ4LZEgIKElMevmeGiAtKnJz5hAVijoTEwRcvmC
  FqFCVmX25mgbArJVo//IKy1SSuntvEPIGRfxaS9llI2hcwMq1iNCtOLSpLLdI1NNFLKspMzyj
  JTczM0Uus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J0ctLLdnECAzHlGKVFzsYn/X91TvE
  KMnBpCTK283GmSLEl5SfUpmRWJwRX1Sak1p8iFGGg0NJglduFVBOsCg1PbUiLTMHGBswaQkOH
  iUR3v7ZQGne4oLE3OLMdIjUKUZFKXFem9VACQGQREZpHlwbLB4vMcpKCfMyMjAwCPEUpBblZp
  agyr9iFOdgVBLmXbESaApPZl4J3PRXQIuZgBbv2sIBsrgkESEl1cBkN+FKe949x2VJri/uBy6
  1yJWbesF+RcGTFY3Xb/2e3a4e07FNIy8xemquVlNK1PmmqzJCrA/b8ua/5jMtf/TA3drzgYla
  37qk4992+85bHvbcxfp/SxxTf7rb1FeF8cuV3syYr6wl+nPdhxMC/w5cv2UV+VKea87kuOsWZ
  e3cEvzzTtUUXhNqsjjOq5qhGxwqbXT88uLoYw+WHz2+T0Q5SuTHz1WxM+dxMdbfqxcuPM2qzD
  UvRcaM31tlSb+fXfnnX3P+X/CaeXJxRVxtnGaUFduhNbU+/+r4VHckO/xtvtpgwHzyq3Bz+CP
  j0NSF/qpzjmR6eOx/tqHwyHPB9tZ+jmc521UcLbxOMc/SeaLEUpyRaKjFXFScCAB/kNm+QgMA
  AA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-565.messagelabs.com!1678355624!176333!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32278 invoked from network); 9 Mar 2023 09:53:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-17.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Mar 2023 09:53:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B62891000DC
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:53:44 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id AA5321000DB
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Mar 2023 09:53:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 9 Mar 2023 09:53:43 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/11] python3-pywbem: upgrade 1.6.0 -> 1.6.1
Date: Thu, 9 Mar 2023 17:53:34 +0800
Message-ID: <1678355614-363-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Mar 2023 09:54:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101456

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pywbem/{python3-pywbem_1.6.0.bb => python3-pywbem_1.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.6.0.bb => python3-pywbem_1.6.1.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.0.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.6.0.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
index cbf2a7a33..71af06881 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.0.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.6.1.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "e26ab0324475ee5329d74971f942b4b315b6ac0edaf278e70e16b5603278ef98"
+SRC_URI[sha256sum] = "abdbd6ce08b6c597cdd6c7730e6b49a842d913f2f6b3cc62b585c58ec3ee7945"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.34.1


