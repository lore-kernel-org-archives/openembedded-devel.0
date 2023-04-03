Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E7BC77B62
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 10:04:24 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.66272.1680516259031558802
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Apr 2023 03:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FyJCs+tO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1680516257; i=@fujitsu.com;
	bh=ia0kEAP1Q8LolEQLkI11o6WONfwpusCvnIijzrT1Mig=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FyJCs+tODgKOjPnR8Y5BG0R2EWzSsApKm2jh4NFqAFPefBMd5KiezZEkQr9TqwxdZ
	 X4PxKJ1ZeDa1Rg0JF8sONynLxBAdR7bbKUpAM73iClTjJsKFfDC6fXilIU0YzXYBNd
	 uiYJIuLRnKctY+vHvxVoJM464KBGR30rzod8tZoyt6nailYSOBJHXVI5l+GQjEptRr
	 i/BmKuVYE9whXcBbcOcL07w7Hz0nxt51E2ur3mE2tJYowuV7VhRcqwpr85ZXD+y+a+
	 rJMbFWxocCqT7vcdF+M2eR4iOrRDX+l7u/+3NaP4l+SOw4GsM//TaRPPB7ucIyBXOI
	 LrggUxpvGm4CA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORqLtgiVa
  Kwe5WS4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePc8Va2glvcFQdObWBsYLzB1cXIxSEk8IRR
  4sHTo6wQznUmicmzJzNDOLsZJdZe+cfSxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAv8S9TZ1gNSxA8QVLb4HZvAJOEnceXWMEsSUEFCSmPHzPDBEXlDg58wkLxBwJiYMvXj
  BD1ChKzL7czAJhV0g0Tj/EBGGrSVw9t4l5AiP/LCTts5C0L2BkWsVoVpxaVJZapGtoopdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGI4pxYwMOxif9/3V
  O8QoycGkJMorWK+VIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCd94ioJxgUWp6akVaZg4wNmDSE
  hw8SiK8iguA0rzFBYm5xZnpEKlTjIpS4rynQfoEQBIZpXlwbbB4vMQoKyXMy8jAwCDEU5BalJ
  tZgir/ilGcg1FJmFdsMdAUnsy8Erjpr4AWMwEtbo3SAFlckoiQkmpgYjAWvSh4v/w8z/8WXbe
  nT6dN0bh7KSvfdNPSSTI+DdL/d79cXfO2f2O6kFtW4pS2/EXlT2ZyVF6Zf3HNtpsfeWz2l+o3
  RumJ8ppIny74uL4qpuGBgWuz3+pbNTHP1D4kc52MFW4v3/X16VP+7YlcU9/0sPL08YQE62/rE
  XoodT2Ecb3WyicHbxyP6bp0p3jeee+DT/qt9u3UF7gz6ZZTV2iDUr7a60/xvRmBPy9bf1r6+r
  HGNoXC/RcsPkzp2hUo6s2y5/Mu/ihRSf6dT5/dPb5AY/f84k12Vn9ctOVDnfInBL38tPvnxK+
  BE7glJaOdo/dtmHHxoNPp7446H/iOF4lyKLvu23OZi0+9MXN6hBJLcUaioRZzUXEiADb/+qBC
  AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-591.messagelabs.com!1680516256!1459729!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30103 invoked from network); 3 Apr 2023 10:04:16 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-20.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Apr 2023 10:04:16 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 85DC31001B3
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:16 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 797ED10019A
	for <openembedded-devel@lists.openembedded.org>; Mon,  3 Apr 2023 11:04:16 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 3 Apr 2023 11:04:15 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-elementpath: upgrade 4.0.1 -> 4.1.0
Date: Mon, 3 Apr 2023 18:04:00 +0800
Message-ID: <1680516244-30936-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Apr 2023 10:04:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101914

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Refactor XPath function call (context=None only as keyword argument)
 Add external function support (issue #60)
 Some fixes to string representation and source property of tokens
 Extend documentation and tests
 Clean XSD datatypes hierarchy

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.0.1.bb => python3-elementpath_4.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.0.1.bb => python3-elementpath_4.1.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.0.1.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.0.1.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb
index 22de9d434..5b8560782 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "1162e4c8e5501bd36291b668f4449b8125fea5ef64a26da8d71da31126725aa5"
+SRC_URI[sha256sum] = "dbd7eba3cf0b3b4934f627ba24851a3e0798ef2bc9104555a4cd831f2e6e8e14"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


