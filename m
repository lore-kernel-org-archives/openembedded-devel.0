Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7CDC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 06:26:56 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.8754.1638944815147096445
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 22:26:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Zog48ZJB;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1638944808; i=@fujitsu.com;
	bh=J8ihNXg3f9SU9jaL7heaa70jE8K8yYmKDcs3lflcS1M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Zog48ZJBEehH86plwWxDTaRinYw/OfrIwFY0woaf5vNNfHPIKzqKcC68CYKkKV/ED
	 ty39eGdZ7cGM5DfiLI9YPgnJueyl5BwJEtG63M/rMPFhtM/GXCrrT6YVRxOsKY1kvW
	 49puddnxWmSLr0IqP5bb7IHim/qFj5/gdUUBToK0Yoskh5dL3joyI53M86NZRYs+Js
	 VMw7ONhEwW/VNQVJILoRsyaVtajktifhmhyyOuZlU2Hfwfr2jHktq2Zu4aWn0eBCFY
	 ySJCJSD8oWe4y57lZYcdAPmCrbhUKZMmmsf2yKiBTCYIezUMt3Wi3BoIavxmK7s0jU
	 T6GF8Zju3VKFw==
Received: from [100.115.66.58] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 41/FF-07141-72050B16; Wed, 08 Dec 2021 06:26:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRWlGSWpSXmKPExsViZ8MxRVc9YEO
  iwbcuQYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPO/yfsBXd5KhY+WcLSwLidu4uRi0NIYAaT
  xJ+b01ggnBOMEqcWz2DqYuTkYBNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviGnYQW1jAVeLU7
  3dg9SwCKhIXjh5nAbF5BdwkTq7pBauREFCQmPLwPTNEXFDi5MwnLBBzJCQOvnjBDFGjJHFixU
  cmCLtC4vXhS8wTGHlnIWmZhaRlASPTKkbbpKLM9IyS3MTMHF1DAwNdQ0NTXTMTXWMTvcQq3US
  91FLd5NS8kqJEoKxeYnmxXmpxsV5xZW5yTopeXmrJJkZgqKUUOyjtYDzb91PvEKMkB5OSKO8h
  pw2JQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4+32BcoJFqempFWmZOcCwh0lLcPAoifDe8QNK8
  xYXJOYWZ6ZDpE4xKkqJ87o4AyUEQBIZpXlwbbBYu8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1
  FJmHcTyHiezLwSuOmvgBYzAS12blkPsrgkESEl1cDEKntFi+vzBmfT5w+2zpiikTbp/5HNGVp
  FJz2sv3lEHK17dPFtBwfr2TsTyqNNmHidPi+6ctbiHvexZ/ckN6qxLBWYceKVUKHzxNBrt86l
  urOtFT28eolzYtfc5UIZVb8crXMqnU7pHa97VyVup+l8I/2Swfvo2ov+30KvPYnSttvnLa0ZV
  3R07f3DivV30iY+lnx93vx/2ff9XD1a96dx1LXtOdd0eOLrpb25ToHPvI3+RFzZ73ko6L7VUz
  07i5KzzFt+7c5ITgoL0v13RyoyOUU6yNfdJi49ZFrhhOftolw/t/PLCzQrO/zs+TE7YHbxJ2M
  Ox+rvswIrBcIVFgpn+k195nxsht2H3OvnUm4qsRRnJBpqMRcVJwIAs5YTFTADAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-528.messagelabs.com!1638944806!42054!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31910 invoked from network); 8 Dec 2021 06:26:47 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 8 Dec 2021 06:26:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1B86Qeo6007926
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Dec 2021 06:26:46 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 8 Dec 2021 06:26:38 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rsa: upgrade 4.7.2 -> 4.8
Date: Wed, 8 Dec 2021 14:26:07 +0800
Message-ID: <1638944767-1957-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Dec 2021 06:26:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94248

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
================================================================

- Switch to Poetry for dependency and release management.
- Compatibility with Python 3.10.
- Chain exceptions using raise new_exception from old_exception (#157)
- Added marker file for PEP 561. This will allow type checking tools
in dependent projects to use type annotations from Python-RSA (#136).
- Use the Chinese Remainder Theorem when decrypting with a private key.
This makes decryption 2-4x faster (#163).

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-rsa_4.7.2.bb => python3-rsa_4.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-rsa_4.7.2.bb => python3-rsa_4.8.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
rename to meta-python/recipes-devtools/python/python3-rsa_4.8.bb
index 4a9b9a9d3f..d0a18f92e5 100644
--- a/meta-python/recipes-devtools/python/python3-rsa_4.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-rsa_4.8.bb
@@ -4,7 +4,7 @@ AUTHOR = "Sybren A. Stuvel"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
 
-SRC_URI[sha256sum] = "9d689e6ca1b3038bc82bf8d23e944b6b6037bc02301a574935b2dd946e0353b9"
+SRC_URI[sha256sum] = "5c6bd9dc7a543b7fe4304a631f8a8a3b674e2bbfc49c2ae96200cdbe55df6b17"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.25.1


