Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3967C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 06:12:52 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.7003.1670479966389368942
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 22:12:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EadoGPXm;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1670479964; i=@fujitsu.com;
	bh=Nt+RU4bpqm2l3ytTl5FeiU5yJDeCC4TlWnGTG6Giiy4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EadoGPXmjQp9ZkU1jDcOgw7vIQ4k5zArDa+zxZXO625TNV9Dqc5KMwGJNjmIw5/j4
	 AULPoBm7qRKhnzK7gUipn7uKE6FVOu0qaE6BoNsqTIKaOjl2mClAbInX/XLYpH0odD
	 t21v5gePDxUSLliXb5g11Rg8Bz+VXQE2Uh0nH3o3ExgVsIoaewBBVfolMxeuAiZ/rE
	 mftJWRWlzr3RaOdkKIwopQNsf7fVwJp6sXbZ36eoJAXUwWNqtc2/Q/i26zJDjlNLhm
	 T4wmwBHbyMifEmLDiH25tjYXkBscL/6dj/zsyTWdIL4xHh/YCuLeetFNI8ncGKbS9N
	 uC3R2N073jCKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8ORpBvdMDH
  ZYNE5VYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePlug7mgqccFQd3PmZsYOzh6GLk4hASeMgo
  8ablFzOEc4VJovl/K5Szm1Hi6upZLF2MnBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC3hJ/P96BKyeBSj+cv5qVhCbV8BRYv+Nu2A1EgIKElMevgfr5RRwkjh5/BDYTCGgmrdbzr
  FA1AtKnJz5hAVivoTEwRcvmCF6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNoXMDK
  tYjQrTi0qSy3StdRLKspMzyjJTczM0Uus0k3USy3VzcsvKsnQNdRLLC/WSy0u1iuuzE3OSdHL
  Sy3ZxAgM35Ti9NwdjJeW/dE7xCjJwaQkyvuiuj9ZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvh
  cqJyUKCRanpqRVpmTnAWIJJS3DwKInw+tYCpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc
  67rg6oSACkKKM0D24ELK4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmrQOZwpOZVwK36RX
  QEUxAR9z73wtyREkiQkqqgalJinXzNv1Xqpu/mNt+krq6sX7ZkY3n1Z6yMbCLTJoeUxLV8dXM
  xuM34yomafHrvXMWckqzNl4MXL3gWHJIzeH2S3zR7/SOrLkkyt960uqaoJmw5q/r/ukhMWs7X
  bcm+lXHHXLt/GrL7if/bBZfJOv/nwEXv30TZ9+0rK7x87qKU8EpFV/PLeGKU7TbMXnXu+iHq5
  u/H5lSOVOTx3bm/XUuPH7Pd7Lo5pofvDWltSW0KXm/yw8tj7+X2GOVv9lM0Hx6YOvlxkMBJln
  zf7PwBGmEee0pDlvYxmfX6RqoW/nEQkKHUXBzT5FN54wM5kUnN8WnbFe+aRC5Wq1k9iMJo202
  52olHwQE1alI2NzQV2Ipzkg01GIuKk4EAEgf3O9mAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1670479963!142017!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18930 invoked from network); 8 Dec 2022 06:12:43 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Dec 2022 06:12:43 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 15A331B4
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:43 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0A7871B3
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Dec 2022 06:12:43 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 8 Dec 2022 06:12:41 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-web3: upgrade 5.31.1 -> 5.31.2
Date: Thu, 8 Dec 2022 14:12:07 +0800
Message-ID: <1670479927-1286-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
References: <1670479927-1286-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 06:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99990

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_5.31.1.bb => python3-web3_5.31.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_5.31.1.bb => python3-web3_5.31.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_5.31.1.bb b/meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
rename to meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
index 587d34f00..486cf08b8 100644
--- a/meta-python/recipes-devtools/python/python3-web3_5.31.1.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_5.31.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1dc2732bdc5e50382737979791cbb3b7"
 
-SRC_URI[sha256sum] = "74732fbd4b2e2baff9d0ac61f268b3e7b25b09ca6572d619390a9d782c2289f2"
+SRC_URI[sha256sum] = "fc27ef2acacb9375e1d486ce7b0f4188c5e543d65f7bb8692f8b969f408bfa9b"
 
 inherit pypi setuptools3
 
-- 
2.25.1


