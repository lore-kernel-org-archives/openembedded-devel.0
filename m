Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web12.3595.1617256487506562972
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 22:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vrq1mO6X;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1617256485; i=@fujitsu.com;
	bh=Rk6Pw32o05rvciqiuhHF3qNaTA6/FDo1gCBLMMdoKOo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=vrq1mO6Xn1uerBXNXi8aFZF7LTZ8b9EyGNUuKpZuoVea9uQjx81WP5c7dbpLdSbLC
	 ciDq2q7jmE7h3MtBrVxW7FdILy2GXwuQOGJNWiiX7G8zwTvU6NMXsZTrQCcS+CwEyh
	 nsw09h/LiQmUaSp/sCO+vUhfCEcUrf4igE/JH5Ekpw/4dKhkcDgU4FSAMhDuSPdiI7
	 QSvNdO8HCH0jgla04Raqpsi/DcuLsLohUVf5Uv7FSu778n3ODjx8/G2mGEmDY43zbf
	 UnZplTLLhJ6hdTXk/Vj5WLNMeZ5c+s/Yzgxs1F1E5kzUyRMFrqf8D+s7zdseSaPnTU
	 ZVWInMVGprXeA==
Received: from [100.113.0.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id F0/9E-38244-52065606; Thu, 01 Apr 2021 05:54:45 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRWlGSWpSXmKPExsViZ8MxVVc1ITX
  B4PktTouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP8lovsBW85K9o2NDA1MH7n6GLk4hAS2Mok
  0XVhAzuEc5xR4s3Vb4xdjJwcbAI6Eh0vullAbBEBfYmls/cwg9jCAs4S06fPZgKxWQRUJM5fP
  wlWwyvgJvH6yXZ2EFtCQEFiysP3zBBxQYmTM5+A1TALSEgcfPGCGaJGUWL7zjMsEHaVxNnZX5
  gmMPLMQtIyC0nLAkamVYyWSUWZ6RkluYmZObqGBga6hobGukDS2EAvsUo3US+1VDc5Na+kKBE
  oq5dYXqxXXJmbnJOil5dasokRGEophQxNOxjfvfqgd4hRkoNJSZR3yrSUBCG+pPyUyozE4oz4
  otKc1OJDjDIcHEoSvOmxqQlCgkWp6akVaZk5wLCGSUtw8CiJ8DKApHmLCxJzizPTIVKnGI05L
  l+ft4iZY/PcpYuYhVjy8vNSpcR5beKBSgVASjNK8+AGweLtEqOslDAvIwMDgxBPQWpRbmYJqv
  wrRnEORiVhXnuQKTyZeSVw+14BncIEdMqVR4kgp5QkIqSkGpg2GW5eMk34elHLoqiT8y0bikN
  4t/8v+sK3ZpLKop86iyvk9Z88iYxiNmEwm1le+TJt9W9R9oPZYlXVV8+z+sbKeX5fuLa83Syu
  hXtP/gnF2D2ijoeXpBW7qcUpetQ6zHmYVOMSo9VSe/HP1hV3qzi1725zeioz+wOfZ0P8ckmF0
  69l9KfbbPn28s6qpW9k99+QEmavEUiYKH+kvW23fflz+ekyNww2yKsLid42+zdT9vXh0ClCof
  8Yb/lfClD+8N5faYZvTbxTZeyaIpnL67PvccUeetR3rmTJnt2nskI8G9frZbeGMRfX2wnlJLd
  yMnxuqTxT5D9VdLIqY8zH6/vaN86b1vFpfUj+ossm6UosxRmJhlrMRcWJABuKY1wyAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-232.messagelabs.com!1617256484!545808!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18306 invoked from network); 1 Apr 2021 05:54:45 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Apr 2021 05:54:45 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1315sctx011401
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Apr 2021 06:54:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 1 Apr 2021 06:54:37 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH v2] libxaw: upgrade 1.0.13 -> 1.0.14
Date: Fri, 2 Apr 2021 01:54:28 +0800
Message-ID: <1617299668-4458-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.13.bb => libxaw_1.0.14.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
index cb1ffcd8c..773b24a50 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.13.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.14.bb
@@ -5,10 +5,10 @@ DEPENDS += "xorgproto virtual/libx11 libxext libxt libxmu libxpm libxau xmlto-na
 LIC_FILES_CHKSUM = "file://COPYING;md5=1c65719d42900bb81b83e8293c20a364"
 
 PE = "1"
-PR = "r2"
+PR = "r0"
 
-SRC_URI[md5sum] = "e5e06eb14a608b58746bdd1c0bd7b8e3"
-SRC_URI[sha256sum] = "8ef8067312571292ccc2bbe94c41109dcf022ea5a4ec71656a83d8cce9edb0cd"
+SRC_URI[md5sum] = "c1ce21c296bbf3da3e30cf651649563e"
+SRC_URI[sha256sum] = "76aef98ea3df92615faec28004b5ce4e5c6855e716fa16de40c32030722a6f8e"
 
 do_install_append () {
     ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-- 
2.25.1

