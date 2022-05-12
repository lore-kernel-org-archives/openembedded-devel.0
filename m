Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DDBBC4332F
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:21:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.2091.1652347273155137779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NVT3Yum3;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347271; i=@fujitsu.com;
	bh=PZcnz6JhGMRSOux2XgfOYGjTK0cRYslHuIt80L3QoAw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NVT3Yum3VRMmENYkDd28DH+lWLFraUxI3a9EybXKvq6Q5ZFOJhdAgduCrjZTYB/vn
	 mvCynGq65GYZlHoaWAAnDCDT3H4rD0lXFpbV7lSoTXoHJEe77/wsb5z0p9BD16oUP1
	 iToJtzgonfSFKtNP1BKrrPdS8xJ+oPLJhL8wU3d9n2aTH1N3UwzSHYx2j3lzmI9OzJ
	 9n6NUc87bVZAJvQjg1H5wFokuTBW7id8x+qzSyAs7R+yydRaSTzpPRbOww6mj7fp/+
	 f7G2ktHfJMaVp69HjBjbvoXCFfDda2bki6hN2Pmz3A7VpZONuNcRwPetmygE3GSA8l
	 kPDWctjptdxbA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqNt+sSb
  J4NsLVouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP7Y9uCZVwVmzc+ZG1g3MTZxcjFISTwhFHi
  /KqvTBDOBSaJf58esEE4Jxklpjw6wNLFyMnBJqAu8fjma0YQW0RAX2Lp7D3MIDazgKpE98U17
  CC2sICnRNeqXrA4C1D87YaFTCA2r4CbxNaGu2C2hICCxJSH78FqOAXcJW5fbQDrFQKqOfzjGg
  tEvaDEyZlPWCDmS0gcfPGCGaJXSeLEio9QcyokXh++BBVXk7h6bhPzBEbBWUjaZyFpX8DItIr
  ROqkoMz2jJDcxM0fX0MBA19DQVNfYAsi01Eus0k3USy3VLU8tLtE10kssL9ZLLS7WK67MTc5J
  0ctLLdnECAzjlGK13B2MU1b+1DvEKMnBpCTKe+58TZIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d6d54BygkWp6akVaZk5wJiCSUtw8CiJ8BaDpHmLCxJzizPTIVKnGBWlxHm9gJEoJACSyCjNg2
  uDxfElRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8uy8ATeHJzCuBm/4KaDET0OL9rpUgi0s
  SEVJSDUxrFTtczN9t8jnx0UZH3DNOJfDHWxebh5f73uQlzuBXmqb2d53yrlnVZ30fSDnHW650
  6Jw/+ZonA8d/secsM9vKRcr0dMqSdS4/Ork9+n0Ec6fjLb0/J1eXxC6LUlyy/ajNlrvpyX2/n
  qZ5SgfJ5ddsj84q9Dj+un92V1OgW8Latn1Gu1V83awPSYR/NVDRj636sNTz/7Mog1KxctmDp3
  +tCK/YrGvwR9zjrKXiqfy+xOrId4tdHaX1Qg+tuzZhkzpbzSGPFy67pX+nOL9K+Bw/OVZpyfT
  y+AkNsukX+q8tPZu3gy1pxnnDDJ6nPbnaPFHT/4var9ijfvPDt6ACraUa9f4iKlrOF3bEF1tU
  KLEUZyQaajEXFScCAFgt8dNeAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1652347270!445339!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 21555 invoked from network); 12 May 2022 09:21:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:21:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A1DB21001A7
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:21:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 940A4100199
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:21:10 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:20:52 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-flask: upgrade 2.1.1 -> 2.1.2
Date: Thu, 12 May 2022 17:20:33 +0800
Message-ID: <1652347241-2533-3-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652347241-2533-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652347241-2533-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97073

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
Fix type annotation for json.loads, it accepts str or bytes.
The --cert and --key options on flask run can be given in either order.

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-flask_2.1.1.bb => python3-flask_2.1.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-flask_2.1.1.bb => python3-flask_2.1.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-flask_2.1.1.bb b/meta-python/recipes-devtools/python/python3-flask_2.1.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-flask_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-flask_2.1.2.bb
index 24a704770..7d290a4fe 100644
--- a/meta-python/recipes-devtools/python/python3-flask_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask_2.1.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=ffeffa59c90c9c4a033c7574f8f3fb75"
 
-SRC_URI[sha256sum] = "a8c9bd3e558ec99646d177a9739c41df1ded0629480b4c8d2975412f3c9519c8"
+SRC_URI[sha256sum] = "315ded2ddf8a6281567edb27393010fe3406188bafbfe65a3339d5787d89e477"
 
 PYPI_PACKAGE = "Flask"
 
-- 
2.25.1


