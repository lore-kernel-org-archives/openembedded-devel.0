Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web10.10548.1616406894073444054
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Mar 2021 02:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RM53zOqR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616406892; i=@fujitsu.com;
	bh=ypOaEUgNVkCOofRIOOeimvysZBAxSnIpsyIpTJd1tYg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RM53zOqRuAOcaw6bpHLd/m78VRPREdqrfrvaB0OrHe+DTsjpdeTswDqta4EEbNcHq
	 3Il4E9RPyxlMAPHCe7cu0oGVn91RXZVaGnsk+kf4U1GfH2Rkj1tSKp1ONAKtnEmS6/
	 FZTxG+mxdkCW7dlMYIa+mJKyf6ejqWw2v50r3Cx3GuoT9qKaK3RMfbkVk4R0ilw8dr
	 +oBk/4a6Je/tSR9dBfDCxPKL7NcImVvK2cZ1HA5Bf7AJci8FQXfNLaI6UO3mYhx4mt
	 XYwGF58MyYO38bQddPVcjpGB6U+NgaWAcBSnCw/JJJQHBswzv6Tb6We1EmE8WkILOp
	 EFOrrsTA0vjdg==
Received: from [100.112.193.211] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id 4E/9D-14660-C6968506; Mon, 22 Mar 2021 09:54:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqpuTGZF
  g8PwFi8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFywkPmgnVcFceOnmBqYNzL2cXIxSEksIVJ
  4tXct4wQzglGic+dC9i6GDk52AR0JDpedLOA2CIC+hJLZ+9hBrGFBZwles+dYwexWQRUJa7Nv
  AgW5xVwk1gypwWsXkJAQWLKw/dQcUGJkzOfgMWZBSQkDr54wQxRoyixfecZoDgHkF0lcWSm2g
  RGnllIOmYh6VjAyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0EjX0NJU19DUUC+xSjdRL7VUtzy1uEQ
  XyC0v1iuuzE3OSdHLSy3ZxAgMo5SCw9N3MPa/+aB3iFGSg0lJlPeZTESCEF9SfkplRmJxRnxR
  aU5q8SFGGQ4OJQneKxlAOcGi1PTUirTMHGBIw6QlOHiURHjzU4HSvMUFibnFmekQqVOMilLiv
  EfTgRICIImM0jy4NlgcXWKUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzMsBsp0nM68EbvoroM
  VMQIs/MIeBLC5JREhJNTBJJChP+vFYft6lZVc6dYxSFXftORL4vOVLHsfGMM/TDF0VB+a5al7
  uMsvRcXv1/tix/y2bPuaaNqw4Nkf6cUQag10dJ9uz40HVOYx9vqwZv89M232or3LH2e/Ho/5/
  nBWowXqhc1EZdwJbXET+3g/1N+pTM2bctnlb/FvR+75dCvvNxTYXn+8z3PV+14Y3NW8e7ekNL
  O5ps5rrtzJyae6WTQe2H3rUuPzjcaHA1/b/aoW2LBd0rXm0j6FgJqdA+raJoS/mahTviE/d+/
  R67tVZRXd3S9459fSqtbuNN8/CBfcf56Z2XTnl8OCCV0tcS/FtuUM/JR2F7N8vLbVqOLfoAlv
  SaWnljww1G+7eiHwVrcRSnJFoqMVcVJwIAKn1UwseAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-267.messagelabs.com!1616406891!335869!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16723 invoked from network); 22 Mar 2021 09:54:52 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-13.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Mar 2021 09:54:52 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12M9skCF028457
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Mar 2021 09:54:51 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 22 Mar 2021 09:54:44 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] gtkwave: upgrade 3.3.104 -> 3.3.108
Date: Mon, 22 Mar 2021 17:54:36 +0800
Message-ID: <1616406876-7844-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../gtkwave/{gtkwave_3.3.104.bb => gtkwave_3.3.108.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gtkwave/{gtkwave_3.3.104.bb => gtkwave_3.3.108.bb} (86%)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb
similarity index 86%
rename from meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
rename to meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb
index 6c22f0e04..d9b6886ec 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.104.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.108.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75859989545e37968a99b631ef42722e"
 
 SRC_URI = "http://gtkwave.sourceforge.net/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "23879689ecf7e2cdd2cd5a91c5c601da"
-SRC_URI[sha256sum] = "d20dd1a9307b908439c68122a9f81d3ff434a6bfa5439f0cb01398fec650894f"
+SRC_URI[md5sum] = "dd40f09f44d7aed937e63c29b63cd3af"
+SRC_URI[sha256sum] = "ece447340442e7ad029713789552e8392b75dd3808c882ac5193d42fce55eb3b"
 
 inherit pkgconfig autotools gettext texinfo mime mime-xdg
 DEPENDS += "tcl tk gperf-native bzip2 xz pango zlib gtk+ gdk-pixbuf glib-2.0"
-- 
2.25.1

