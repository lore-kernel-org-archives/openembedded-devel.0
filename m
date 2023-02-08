Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8FFC636D3
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 08:13:05 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.3820.1675843985112784425
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Feb 2023 00:13:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iO9RpaSA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1675843983; i=@fujitsu.com;
	bh=E1IJHshmWkinaraRfghc2sruHpLv/ymeaF/FIlZ+UzI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=iO9RpaSArkbp1MzSfqeoJl40s/jlVLRZBADrZyxmUyrBgYX/w/Y0+wqYwbjFWyein
	 N7UbgNT0+gtRXXonEzq2G7AHFur48GiQJOuGsiKkx+etwVyH337W9nqEbsPAHm82Hd
	 sK9D7XYWmyjFGg38o+lVI0MjwHaR6gOX+isiKQrHbi22HIq+nPMo/I+YXMQAgSaHlV
	 8uOCrUQT1fPAyX0TEHm02a1i8116uYHDmSa+/17OEEztSIhg+j8XW7iDB2EMbvPAeP
	 Qp0UhOEhZwrSI2A29yJt/N/XQw2OJOFSLvUsTD64WyjiABnNxI/cD6bEwjnCLykc3o
	 x2hxYXJQAV7rg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWbc/8nG
  yQcstbouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePF4eiCezwVR2+tZ21gPMHdxcjFISTwkFHi
  +dbljBDOFSaJ2b+XMEE4exglrm25wNzFyMnBJiAlceP+fzYQW0RAX2Lp7D1gcWYBFYkXv3vYQ
  WxhAT+JC1sfsoLYLEDxl3/es4DYvAJOEgc2PWQEsSUEFCSmPHwP1ssp4Cxx92knWI0QUE1T60
  cmiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2pUTrh19QtprE1XObmCcwCs5C0j4LSfsCRqZ
  VjKbFqUVlqUW6pnpJRZnpGSW5iZk5eolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmp
  JZsYgaGbUqy2awfjhL6/eocYJTmYlER5PcUeJwvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4I0IB
  8oJFqWmp1akZeYA4wgmLcHBoyTCGxkKlOYtLkjMLc5Mh0idYlSUEue9CtInAJLIKM2Da4PF7i
  VGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrwBYUBTeDLzSuCmvwJazAS0OET1IcjikkSElFQ
  D0yb/6WsTD2ZvCOV9F+278NJJRq6wI3sbLDat7unYsiF7nXmhwxO/Pcu0dmQw7YkwYFg2obO9
  bNHvxncn+P70LE4s2XHRu3vKjgk9vhXJfY9VjCYtKLgybZHX17gXTvtt0oOmbFof63Z/jWt+k
  E/fmnM7Tkyf8LHxv9pO/9qoGwZps+uvvd3+5G6/7WxRV65sm/tcrgfuVi7aKJrNeV545+s3rj
  ePOk11bbiX/nuZ012xomk9z1c9ipLsDikSO6S3oTzlaeEmDrFs8bmef2bo7dU70K27fsGvz58
  fdD1maJ+6vuzlw56q0qIDudoX+dLqHhamuETlsHM1RE7bsKN27oy7qSmhX4qZXn86xCR+rFiJ
  pTgj0VCLuag4EQBU5onrWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-565.messagelabs.com!1675843983!620720!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9324 invoked from network); 8 Feb 2023 08:13:03 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-9.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Feb 2023 08:13:03 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id E22E3142
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:13:02 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D54E57C
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Feb 2023 08:13:02 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 8 Feb 2023 08:13:01 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-luma-oled: upgrade 3.9.0 -> 3.11.0
Date: Wed, 8 Feb 2023 16:12:43 +0800
Message-ID: <1675843963-11324-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
References: <1675843963-11324-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Feb 2023 08:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100987

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
===========
* Add support for SH1107 greyscale OLED
* Fix SSD1322 NHD initialization and encode each pixel as 4bit+4bit
  identical nibbles

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...python3-luma-oled_3.9.0.bb => python3-luma-oled_3.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-oled_3.9.0.bb => python3-luma-oled_3.11.0.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-oled_3.9.0.bb b/meta-python/recipes-devtools/python/python3-luma-oled_3.11.0.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-luma-oled_3.9.0.bb
rename to meta-python/recipes-devtools/python/python3-luma-oled_3.11.0.bb
index 4d34fbb01..7ce3570b6 100644
--- a/meta-python/recipes-devtools/python/python3-luma-oled_3.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-oled_3.11.0.bb
@@ -4,11 +4,11 @@ A small library to drive an OLED device with either SSD1306 , SSD1309, SSD1322,
 SSD1325, SSD1327, SSD1331, SSD1351 or SH1106 chipset"
 HOMEPAGE = "https://github.com/rm-hull/luma.oled"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=20adf60219f02398b350b8bfbdad7a58"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5ec447eb69733e20a55838de7e8cb991"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e51c2ce5b88d591f9c64ab49d6bd5abd26759b87180706d615fec796569b6f6b"
+SRC_URI[sha256sum] = "81583e77ecb1d3ae04a641b3311082719b7a3149c15a5f2577d9b93b243e9331"
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


