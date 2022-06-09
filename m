Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C4F7C43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:18:41 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web12.7563.1654759117144004920
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PKNtfo0n;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654759115; i=@fujitsu.com;
	bh=5iipAG+5G3izRBBCtom/zHoLBJkYDARWu/lo2LABIdM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PKNtfo0nuTTKlEm4zPke1dFhSq40Cpqr3Kd2P3MWdzy+Io3Yo2hE+CgPr03iuARr/
	 yQ6Yjm6TyEaDVFZEUnKOv+rCau4zhOxRM6YRMYHdvRggO7rF2VBAHJh6eHtx2x64eE
	 DVk2iXbPI2S2KrDnwxU941Zv0U2WbJy81SgQl9VzdRVIg43pgJeroU9BNJ2g9Bxw2U
	 fdo1qpwqGqStUInTlHgbRzYVRkW1yQ7MqnppHyUxyB2s+UIHZweAkuxlwoIQz++BYI
	 HFn0hrbYfwDADAxzFIw/ht5WFUFnSj1abdx5FiWmjzNQVJjoh9kOCPiiw5FVIj8WoY
	 KdUbWqEpp4ngw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8ORqHtq3sI
  kg+V/bCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyzry6wFszmruhbtYGtgXECVxcjF4eQwBNG
  iecLrzFBOBeYJPa+2skI4exnlDjy/AxzFyMnB5uArsSLH4tZQGwRAX2JpbP3gMWFBXwkdrw7y
  QpiswioSPzY8hKshlfAQ2L5zkOMILaEgILElIfvmSHighInZz4Bq2EWkJA4+OIFUJwDqEZRYv
  Z0eYjyConXhy8xQ9hqElfPbWKewMg3C0n3LCTdCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhqa6hp
  b6BoameslVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjlpZZsYgSGX0qxWv0Oxhcrf+od
  YpTkYFIS5T2XujBJiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTv3llAOcGi1PTUirTMHGAswKQlO
  HiURHivzgFK8xYXJOYWZ6ZDpE4xWnJMnf1vPzPHcjA582vbAWYhlrz8vFQpcd51c4EaBEAaMk
  rz4MbB4vUSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHepSBTeDLzSuC2vgI6iAnooF9XFoA
  cVJKIkJJqYFo6WTz0p+EDy9Utx/J2R8q1JSu/bV0uFpoWacxvuEJG3I45YvqmroTV399mmcod
  Xsqyy4n9aXFyWZ/i5N7rU5KzLCw2C5pWVnyRK/rw8a2TUNfV9feaRCRjXpXb+8RJ5ubVvhcK6
  JBZsTYpWySscMfqt0+/f/hW6SVb9SXlxpmONpOI+y9t5ymeSYqSD5Wy4jg2Y9554WOZ3v/8+M
  5Pu3C/stq4eZ3Eo1mnzEuehz3jrH36ND3F9t6yx/e+zzwZeey15AVfV6fAGssq8atTHb5vWVR
  rI6QU8Dftq2fZWddyu7YfegZRdpFdB4xUKq8wL/fdWvk0PWztqYuZDB9S99xtffR7/4w/PFP/
  Vz1yUGIpzkg01GIuKk4EAKTlsA5SAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-571.messagelabs.com!1654759114!72051!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27879 invoked from network); 9 Jun 2022 07:18:34 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-2.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:18:34 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 9C23D10019E
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:18:34 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 837F1100195
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:18:34 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:18:30 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-crc32c: upgrade 2.2.post0 -> 2.3
Date: Thu, 9 Jun 2022 15:18:22 +0800
Message-ID: <1654759102-11018-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:18:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97452

Changelog:
==========
*Improved macro definition logic and platform detection to enable building
 universal2 binary wheels for macOS, alongside arm64 and x86_64 ones;
 added step to GitHub Actions to generate and publish them (#28).
*Mention explicit support for Python 3.10.
*Fixed minor compilation warning in ARM64 builds.


Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-crc32c_2.2.post0.bb => python3-crc32c_2.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-crc32c_2.2.post0.bb => python3-crc32c_2.3.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
rename to meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
index 4f6a3aba9..203256895 100644
--- a/meta-python/recipes-devtools/python/python3-crc32c_2.2.post0.bb
+++ b/meta-python/recipes-devtools/python/python3-crc32c_2.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
     file://crc32c_adler.c;startline=9;endline=24;md5=c60e6e55d0e5d95effa6fad27db0711a \
 "
 
-SRC_URI[sha256sum] = "3d058e7a5e37e4985d1a7ad4cb702bca56b490daa658d4851377d13ead8b435e"
+SRC_URI[sha256sum] = "17ce6c596ad0d53df52dcd72defb66984aeabd98fbefea7ba848a6b6bdece36a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


