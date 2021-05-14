Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web08.3565.1620958467030539501
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 19:14:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iic0Y0eg;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620958465; i=@fujitsu.com;
	bh=095ITSGKaWsEt5DyrcZLbh7GqbqjgMsin1jAq4TAUSc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iic0Y0eggxn8NWxiT/EjbKb7Meuh3hZIMy6Tzg9tIhdnDsKB8uIPhWVuVX8yfUMQi
	 vIqnCPNNtCIqoKMMdGMOYA7tTqGfyw0ljI0Co3XHaGJS02ibiSPcB2VuyAeo2FckC5
	 2W5IJY7KqAfsc0CYNDen462+qC5wsMch56msjdomPTOmls7b4gWcj9ZeWoqTILNO4+
	 Ff2fHZ14hfaqCoP/9zc7FM7cA7qTTHQPfioJ8zHRjnIPiCIXQMLx8/EyY1OiLR8jdE
	 F5dZxyHzCwJqqvb3hxJf09YRxrOczho7O+D7nhw6rA4JQZS2QM7snjs3GKP9HyYex/
	 LoQcOWgIfcd+w==
Received: from [100.112.192.143] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 0C/DA-45475-00DDD906; Fri, 14 May 2021 02:14:24 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8MxRZfh7tw
  EgzlvNC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1ozDB38zFXRwVcxd9Y6tgXEFZxcjF4eQwGwm
  ieXHl7JDOMcZJfatXsDaxcjJwSagI9HxopsFxBYR0JdYOnsPM4gtLGAl8WrRbcYuRg4OFgFVi
  fObtUDCvAJuElduLwZrlRBQkJjy8D0zRFxQ4uTMJ2BjmAUkJA6+eMEMUaMosX3nGRYIu0Jixo
  xtbBMYeWYhaZmFpGUBI9MqRoukosz0jJLcxMwcXUMDA11DQyNdQ0sgNjLTS6zSTdRLLdUtTy0
  u0TXUSywv1iuuzE3OSdHLSy3ZxAgMo5SCA3U7GB+8/qB3iFGSg0lJlPek5+wEIb6k/JTKjMTi
  jPii0pzU4kOMMhwcShK832/NTRASLEpNT61Iy8wBhjRMWoKDR0mE9w9Imre4IDG3ODMdInWK0
  ZXj2doli5g5NsxbCiT/370LJPsXHFzNzHGz/dBqZiGWvPy8VClxXuHbQM0CIM0ZpXlwo2HxeI
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO9VkBN4MvNK4C54BXQcE9BxN6bPAjmuJBEhJdX
  AVPNI6/D8nS03DCYFbrywTVdsbq8OV1/w5E6ro5pJLeJM+g8FjI46z0hnkOre90j//Psz5xPn
  65lXWcUWeaeaH9nIGHvEt5PHTWaN8sO+fSevTbSSmzf7wv6lre+ExE9tn2a+IeT1lsKoGfqeZ
  7JWVj1/bN8Q/yaz0mvZmyAR6/Pn0+UOa82f6/6T/V5Kt8c7P++5TGlx3x+cm64jNd1Xvs9my2
  SD3Ro/Mwp7FohWndyo3HepyEbvhfi0z7Of/LsVl/Wq/PHhFdyWUqfk7rTcdeu4MTvxjv4ufu2
  9X/dl8dwPdvr49Mbemjdpj69/lwjLUxfZEjFRd47NHevM9fMZ/R6ZNPo/VWC5yOTxfeOlKCWW
  4oxEQy3mouJEAD3R4KVCAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-265.messagelabs.com!1620958464!350994!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2461 invoked from network); 14 May 2021 02:14:24 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-12.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2021 02:14:24 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14E2EOGW010700
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 03:14:24 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 03:14:22 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] cloc: upgrade 1.88 -> 1.90
Date: Fri, 14 May 2021 10:14:16 +0800
Message-ID: <1620958456-8102-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../recipes-devtools/cloc/{cloc_1.88.bb => cloc_1.90.bb}    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/cloc/{cloc_1.88.bb => cloc_1.90.bb} (67%)

diff --git a/meta-oe/recipes-devtools/cloc/cloc_1.88.bb b/meta-oe/recipes-devtools/cloc/cloc_1.90.bb
similarity index 67%
rename from meta-oe/recipes-devtools/cloc/cloc_1.88.bb
rename to meta-oe/recipes-devtools/cloc/cloc_1.90.bb
index b6a4ae773f..d34f8c98dc 100644
--- a/meta-oe/recipes-devtools/cloc/cloc_1.88.bb
+++ b/meta-oe/recipes-devtools/cloc/cloc_1.90.bb
@@ -5,9 +5,9 @@ AUTHOR = "Al Danial"
 LICENSE="GPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
 
-SRC_URI = "https://github.com/AlDanial/cloc/releases/download/${PV}/${BP}.tar.gz"
-SRC_URI[md5sum] = "9f12f29c824ef61c5eaba6cf2dd6e183"
-SRC_URI[sha256sum] = "e4e30f083bf4e4a5efbe29efa0f6cefa223ba4e841ad1337653ad1f52702dc6f"
+SRC_URI = "https://github.com/AlDanial/cloc/releases/download/v${PV}/${BP}.tar.gz"
+SRC_URI[md5sum] = "e2364c2c9c9eda1d20890c19911c51fb"
+SRC_URI[sha256sum] = "152502a61d4bae4a406a05a01bf52489b310ec03dbd8c645d0bb051fa4717ddb"
 
 UPSTREAM_CHECK_URI = "https://github.com/AlDanial/${BPN}/releases"
 
-- 
2.25.1

