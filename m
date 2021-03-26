Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [])
 by mx.groups.io with SMTP id smtpd.web08.9137.1616742770474929310
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Mar 2021 00:12:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=iUrIrh9v;
 spf=neutral (domain: fujitsu.com, ip: <nil>, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616742775; i=@fujitsu.com;
	bh=bI+8qLLXS+yCSNgY6oJiDnGD72rzjQvbBoz0Gxia09M=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=iUrIrh9vq3cYpavu+RMpGBvl144gFMNOLsbf9h/DGt0e+GFjch+iemkr7jKX+RL5M
	 6brcrTasvPqRbMz/YxLBaT6TkUZJ8+7eKUmDSerqFYOmTeQK8wFAtV2jyI+jovcEe7
	 zU89YmrCPBSyhxqt2plX4lQ0SlitPy1mulH4YZbRJy934lgWD2xa3oQrV/hVwpK5F4
	 +HAJ4aip5JiGbgi+3i/NLGI7v335rK53FhRcP8XetJRG2mduZ1vNsPSwBMWi6Gwz8f
	 taWsViqTSj9f9A1E1NWYAmlEys+r0oALaSgFg2LupNo89EBq1gk68GEeWe6fw9ZPSY
	 O3NZtF37zb9TQ==
Received: from [100.113.1.157] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.symcld.net id F3/7E-03420-6798D506; Fri, 26 Mar 2021 07:12:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqlvWGZt
  gsGe+tsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtH/5ClrwT7OijdXWpgbGJ9xdDFycQgJbGGS
  mLGriRHCOcEocW71GfYuRk4ONgEdiY4X3SwgtoiAvsTS2XuYQWxhgUCJsy8usXYxcnCwCKhKX
  DxuDhLmFXCXePW7hxHElhBQkJjy8D0zRFxQ4uTMJ2BjmAUkJA6+eMEMUaMosX3nGRaQMRICVR
  JHZqpNYOSZhaRjFpKOBYxMqxgtk4oy0zNKchMzc3QNDQx0DQ2NdQ11jYzN9BKrdBP1Ukt1k1P
  zSooSgbJ6ieXFesWVuck5KXp5qSWbGIFhlFLI+GYH49fXH/QOMUpyMCmJ8h46EZMgxJeUn1KZ
  kVicEV9UmpNafIhRhoNDSYK3uyM2QUiwKDU9tSItMwcY0jBpCQ4eJRHefy1Aad7igsTc4sx0i
  NQpRkUpcd4okD4BkERGaR5cGyyOLjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5v3ZDjSFJz
  OvBG76K6DFTECLN/6IBFlckoiQkmpgms1U2OO10dRvD1fUzqlWusEr+8uXFMm1Lk5bIuK+ZgE
  /91ZTnv8bNN+lz1uwoTVr9ymZT1VCtVauXua/llw0mjbrhuGG46t375N47bGwawWTjqQr00u3
  bZ1xLgaMu/rFDvU+1lmvfufnp7r1QkoGWsse3fziayxU6fKyVbnwpI6AYkrzXt4e7dYZXRrTb
  u07HvQ5c9XxuONemy5FtDrnsSs+SXELNl12ePHB5D+xIk8adzaxNGy84udQobdnvj1z6wOLmq
  vLppScqXW969YgqPfm7Mn5WxJNP00vrNL0eJs6i+fC0sBDEWobTXn7S+v9HEynfihlqPnHkvz
  suUin+8EAhZ2OEvOS4h37FCcosRRnJBpqMRcVJwIAST1Gxx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-228.messagelabs.com!1616742774!112288!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31944 invoked from network); 26 Mar 2021 07:12:54 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-17.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 07:12:54 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q7CsNV017916
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 07:12:54 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 07:12:52 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-zopeinterface: upgrade 5.2.0 -> 5.3.0
Date: Fri, 26 Mar 2021 15:12:46 +0800
Message-ID: <1616742766-29899-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-zopeinterface_5.2.0.bb => python3-zopeinterface_5.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zopeinterface_5.2.0.bb => python3-zopeinterface_5.3.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb b/meta-python/recipes-devtools/python/python3-zopeinterface_5.3.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-zopeinterface_5.3.0.bb
index 48bb80d57..5da5a88b9 100644
--- a/meta-python/recipes-devtools/python/python3-zopeinterface_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zopeinterface_5.3.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e54fd776274c1b7423
 PYPI_PACKAGE = "zope.interface"
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "8251f06a77985a2729a8bdbefbae79ee78567dddc3acbd499b87e705ca59fe24"
+SRC_URI[sha256sum] = "b18a855f8504743e0a2d8b75d008c7720d44e4c76687e13f959e35d9a13eb397"
 
 PACKAGES =. "${PN}-test "
 
-- 
2.25.1

