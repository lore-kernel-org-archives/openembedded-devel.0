Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web08.5415.1632471587693185286
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Sep 2021 01:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=V2xoO5CN;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1632471580; i=@fujitsu.com;
	bh=pJRJYlmzUB97JspcSx3vklPjSvB+ZAyW4HiCtGdQ3p4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=V2xoO5CNOnQtagftRc1akXEtxLHgK4qd0yoMbxmk2UDqogriNJvAwSdNEkM+iOSM3
	 fEKZof4Aistf+k9pyrVLPTWKlBem0vL5px+femuEJtJC8CAQss69Rtw3dMKsP8zmdf
	 J/gyYe8rQKp1gA6NaFnQJISeU6DN2iDgaXB8GW66TPQlLAAQJrYptKpx6Xwg1mQpM/
	 RYNPxRthmwPBqc7iVuFIglsTn7qmCM9DM/2rdm3NvudUEX4nRkGg1q9UFEqpvoQtLV
	 M2pUg2j7g2INotP/n61TC+zO2eAietyjXNtpHHgxr7UN//FjvsPJmfb1OMPyIKths7
	 ZlXjbzFPvLX2g==
Received: from [100.112.195.149] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id 4A/91-01625-C1A8D416; Fri, 24 Sep 2021 08:19:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqivT5Zt
  oMCHH4uLhpcwOjB7nNq5gDGCMYs3MS8qvSGDNONe/ia3gFE9Fc+tM9gbGjdxdjFwcQgKzmSRe
  nT3NDuGcYJRY1jaPrYuRk4NNQEei40U3C4gtIqAvsXT2HmYQW1ggQGLj6+3sIDaLgKrE8he/w
  Op5Bdwkzh14CmZLCChITHn4nhkiLihxcuYTsDnMAhISB1+8YIaoUZTYvvMMC4RdIfH68CXmCY
  w8s5C0zELSsoCRaRWjRVJRZnpGSW5iZo6uoYGBrqGhka6hpbGukbGJXmKVbqJeaqlueWpxia6
  hXmJ5sV5xZW5yTopeXmrJJkZgGKUUHHy1g3Hlmw96hxglOZiURHn1O30ThfiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwvmgCygkWpaanVqRl5gBDGiYtwcGjJML7ugMozVtckJhbnJkOkTrFqCglz
  vutFSghAJLIKM2Da4PF0SVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrynQMbzZOaVwE1/Bb
  SYCWjx87k+IItLEhFSUg1ME30nrFWesKwt88Rdud21LPZ9CZqnP9nsm3vAo+1ed+B75b89U+I
  6Oq+5FN5vzBBluPpoouBqIz5mzhCTJK3gb6WXDt6ct48hwILJb86fwtjC7Stsjb/0m52wNMq6
  HWtr8i/3taLuLu5DjqtWFNzP421zesb+8eSK238N3ac+z+M4yy/nEzZJjSe7esEfW/EvbYc+R
  O5eHF955MnUYzfT/JdbZN94vCAwKUfIfYZTg2yu75TodRP40sI28vcsf1HyRurCHh9Rvi9vbC
  WvrUzg2fhww93XcyqfxrT5PXrg6hd1/0Oi5vHrHWc6Zkw2k3RctzW7zUts4dPlqX8110Tq+gv
  2/zh0SPrOpea7t7tdlFiKMxINtZiLihMBNLWxRx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-267.messagelabs.com!1632471579!188817!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2627 invoked from network); 24 Sep 2021 08:19:39 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-12.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Sep 2021 08:19:39 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 18O8JXgq002645
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Sep 2021 09:19:39 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Fri, 24 Sep 2021 09:19:32 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 9.2.0 -> 9.2.1
Date: Sat, 25 Sep 2021 04:19:26 +0800
Message-ID: <1632514766-4433-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

What's Changed
Avoid deadlock in Youtube controller
Remove unnecessary app launch in quickplay
Bump black from 21.7b0 to 21.9b0
Bump pylint from 2.9.6 to 2.10.2
Bump pylint from 2.9.5 to 2.9.6
Bump pylint from 2.9.3 to 2.9.5
Bump black from 21.6b0 to 21.7b0
Add force_launch option to BaseController.launch
Bump pylint from 2.9.1 to 2.9.3
Bump pylint from 2.8.3 to 2.9.1
Adjust to pylint 2.9.0
Bump black from 21.5b2 to 21.6b0

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...hon3-pychromecast_9.2.0.bb => python3-pychromecast_9.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_9.2.0.bb => python3-pychromecast_9.2.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_9.2.0.bb b/meta-python/recipes-devtools/python/python3-pychromecast_9.2.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pychromecast_9.2.0.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_9.2.1.bb
index c1f52881af..1fd76ed39d 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_9.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_9.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "6d34593575cf77565df47af4c75dd47c6a65831ec18a8c10b5367b2f1c172f0a"
+SRC_URI[sha256sum] = "883d6e836ff5f1068a8bd00364a15b4c9854293086495e9fd9cacd9b4d54c0bf"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.25.1

