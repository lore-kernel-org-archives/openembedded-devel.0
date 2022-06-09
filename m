Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B3CC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:17:10 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web09.7668.1654759016615767555
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tuogJHhz;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759014; i=@fujitsu.com;
	bh=x0eudGQ8TfjZUexnYfKhOtaK9mSDUnwA1PqB3zpEQ/I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=tuogJHhzSspz9ED2Nm1jQXQtidE52Ju67SH07xbms0EBDcwPMti00ZYXk3A68RTnL
	 Ks81nWfyyhCEMpwtMaT6FsLSog7FK+FxP4gKuii9Ev5jweJJL8/pGK2wjjWg5YGvkg
	 OmfXoZ92zSKJ8QOFGWNGlaIKfUoBj2uogxXHaKbTgxWTOB/3i+UgyPqxPLrdRHWpkj
	 nSihpM6Wi1sy/eFZb+nQW0A3u4RglDWKF8iBsio/1Y4dWyU/jWcvMr52DI1eM+wO2T
	 qxi6B1M0Bc1UmwjXvU9D/80Yicy0cWsZ4wOeBkyVlRERccV7ZgkAKDrxTnJ1aaFWxw
	 yoWsHiT2YIQeQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8OxWTdt3sI
  kg9b7jBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aGORuYC3bwVExsOsTUwNjH3cXIxSEk8JBR
  4uvcfUwQzlkmiTUrj7JDOCcYJc6vvcDaxcjJwSagLvH45mtGEFtEQF9i6ew9zCA2s4CqRPfFN
  ewgtrCAh8SCH9/AbBYBFYn5tzeygdi8Au4Sj/Y1gPVKCChITHn4HqyXE6h+zdOFLCC2EFDN8i
  /noeoFJU7OfMICMV9C4uCLF8wQvUoSJ1Z8ZIKwKyReH74EFVeTuHpuE/MERsFZSNpnIWlfwMi
  0itEqqSgzPaMkNzEzR9fQwEDX0NBU11DXyNBcL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMIxTihlv7mBs7fupd4hRkoNJSZT3XOrCJCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvHtnAeUEi1LTUyvSMnOAMQWTluDgURLhvToHKM1bXJCYW5yZDpE6xWjJMXX2v/3MHMvB5M
  yvbQeYhVjy8vNSpcR5180FahAAacgozYMbB4v7S4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJW
  EeZeCTOHJzCuB2/oK6CAmoIN+XVkAclBJIkJKqoFpWR5r4uSEOBZPiy6Pd1oV//f+0ZnHZseQ
  zCLQvIqnce3rvsojrw7KrPnt8DZv2ZFVJ/vfKAk+TzZykYrofz396FaW7dMiJFVm/3heXSfz8
  OxeFp67Crl5i42FTYPDpKS+pX25O6nsfLrmXj9L15mLz194Wctrd397acXD5hcfmv5uXnW28d
  6+kkeRjLqp/kseBfFveaH8Pi9rwTOLdR9WbHSd+PFQxbOJBdGzExLNT3ldWZpvsErg5tGuz3p
  7AwpWO1ypZanzuRr+PnZK6bR3fAmc7EtqPVYfLrggIOJd1vLOvybm9Z00Ye1rYSGTthaWn3KU
  fZ62VvvWzChNM5Wma9I7HwcYhhg/VQhLedqrxFKckWioxVxUnAgA85iFZnYDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-587.messagelabs.com!1654759013!70931!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4970 invoked from network); 9 Jun 2022 07:16:54 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:16:54 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 874358A2
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:16:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 6ED5E815
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:16:53 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:16:37 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-lxml: upgrade 4.8.0 -> 4.9.0
Date: Thu, 9 Jun 2022 15:16:18 +0800
Message-ID: <1654758981-32219-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1654758981-32219-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:17:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97448

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
=========
Bugs fixed
----------

* GH#341: The mixin inheritance order in ''lxml.html'' was corrected.
  Patch by xmo-odoo.

Other changes
-------------

* Built with Cython 0.29.30 to adapt to changes in Python 3.11 and 3.12.

* Wheels include zlib 1.2.12, libxml2 2.9.14 and libxslt 1.1.35
  (libxml2 2.9.12+ and libxslt 1.1.34 on Windows).

* GH#343: Windows-AArch64 build support in Visual Studio.
  Patch by Steve Dower.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-lxml_4.8.0.bb => python3-lxml_4.9.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.8.0.bb => python3-lxml_4.9.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb b/meta-python/recipes-devtools/python/python3-lxml_4.9.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.9.0.bb
index c4d4df383..74c5e480a 100644
--- a/meta-python/recipes-devtools/python/python3-lxml_4.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-lxml_4.9.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "f63f62fc60e6228a4ca9abae28228f35e1bd3ce675013d1dfb828688d50c6e23"
+SRC_URI[sha256sum] = "520461c36727268a989790aef08884347cd41f2d8ae855489ccf40b50321d8d7"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.25.1


