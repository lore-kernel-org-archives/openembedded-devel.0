Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5292C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 08:42:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.1206.1667810534186880906
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 00:42:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=G9kzPj7y;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667810532; i=@fujitsu.com;
	bh=mXcXOcAIHGhCbUE3Zum/pNNaET7YZHEOn5y0QjCOtHY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=G9kzPj7yTmXFbhSIU3pKtA3K3DpglfICVIsaTfygCEtM0XBE2K2h021ZooHA4EvmV
	 /7lJRMCc9P5S/9Yp8Q5uAKiap5JqRluV+SCDSKPfhm63IwB9o4eru8ga46a/EYv4y3
	 IftUbMcwAvZxO+Pg74KQgPDFsKfSJOVBomure3bRpxm2hgdc2Ms+Yf22MsqmtfRQ7Q
	 hXYxdVE4hvtRpt7s7FtTg4TRCtSerZ7zwF+pbrNdBMN2PRomwkm+JHioBoTLL1VmSV
	 KkrrPgBpD+j1t2pnrc1roY9z2gcRPRc8rVYW2bQK7ajGiwYpzX+XN68it8dBopnZEz
	 AgVybNAPJ2fxw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8ORpPvkSEa
  ywYe3bBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bO77PYCu5zVjx4PpepgfEPRxcjF4eQwENG
  ic+fFjNDOJeZJO6uWs4C4exmlFhx/z9rFyMnB5uAlMSN+//ZQGwRAX2JpbP3MIPYzAIqEi9+9
  7B3MXJwCAsESaz7rw8SZgEKf99yiR3E5hVwkpjZtQWsXEJAQWLKw/dgNqeAs8SDs9NZQGwhoJ
  pHv5awQdQLSpyc+YQFYryExMEXL6B6FSVmX25mgbArJGbNamOCsNUkrp7bxDyBUXAWkvZZSNo
  XMDKtYjQrTi0qSy3SNTTSSyrKTM8oyU3MzNFLrNJN1Est1S1PLS7RNdJLLC/WSy0u1iuuzE3O
  SdHLSy3ZxAgM3pRipeYdjH+X/dE7xCjJwaQkyvt7eUayEF9SfkplRmJxRnxRaU5q8SFGGQ4OJ
  QneGxuBcoJFqempFWmZOcBIgklLcPAoifCaAKNJiLe4IDG3ODMdInWKUZdj5te2A8xCLHn5ea
  lS4rzXdgMVCYAUZZTmwY2ARfUlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK81iCreDLzSuA
  2vQI6ggnoiOqCNJAjShIRUlINTAbiIS2b4zwv5T1+o2yey15hb8KhPOu3c7qO5Mnr7Met1s3q
  knlgfvPXzsuOwUfuhHQ/s+V2nFsTZOh8TiPrxKVnhpJJX67NVi2VuqHIfHzjxaePVG/0MCc4y
  2taO97SWnuUWf1m1OK85BlCXzrvvm+b9yJfpkBn3nYBh4Tp93J6P73W3Pbn516BgilhpdEvLX
  eFzM5ryr1+wOOBx0fZ4qQF2soSfJyvDI6mPa2TX3rb/1jnbrnNv1y84iucpXskZkfEiPPesZ3
  74OZF+xuizOt5Hs2pfX/lw9zGOboCx17IfjIJX9ncdvSQu+SX3NWeyndvLAle8N7vv8sexqKH
  /27rC5k+z/DOc2HOiZkUo8RSnJFoqMVcVJwIAPRS66VlAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-6.tower-548.messagelabs.com!1667810531!168237!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6739 invoked from network); 7 Nov 2022 08:42:12 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-6.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Nov 2022 08:42:12 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id B0B3A1AD
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:42:11 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id A59A87B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 08:42:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 7 Nov 2022 08:42:10 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-regex: upgrade 2022.9.13 -> 2022.10.31
Date: Mon, 7 Nov 2022 16:41:52 +0800
Message-ID: <1667810514-31107-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667810514-31107-1-git-send-email-wangmy@fujitsu.com>
References: <1667810514-31107-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 08:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99468

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Updated text for supported Unicode and Python versions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-regex_2022.9.13.bb => python3-regex_2022.10.31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-regex_2022.9.13.bb => python3-regex_2022.10.31.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-regex_2022.9.13.bb b/meta-python/recipes-devtools/python/python3-regex_2022.10.31.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-regex_2022.9.13.bb
rename to meta-python/recipes-devtools/python/python3-regex_2022.10.31.bb
index 886acd738..19fc153d5 100644
--- a/meta-python/recipes-devtools/python/python3-regex_2022.9.13.bb
+++ b/meta-python/recipes-devtools/python/python3-regex_2022.10.31.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7b5751ddd6b643203c31ff873051d069"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f07373b6e56a6f3a0df3d75b651a278ca7bd357a796078a26a958ea1ce0588fd"
+SRC_URI[sha256sum] = "a3a98921da9a1bf8457aeee6a551948a83601689e5ecdd736894ea9bbec77e83"
 
 RDEPENDS:${PN} += " \
 	python3-stringold \
-- 
2.25.1


