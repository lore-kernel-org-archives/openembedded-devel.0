Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF86C47093
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.6730.1649901403189031267
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 18:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Gs9hp+gu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1649901401; i=@fujitsu.com;
	bh=ZjTOwsiS9J8a7EU15JD0ELVNc9Q1PhQhNSfp9uFp/Oc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Gs9hp+gubW/Gc+zbsJ5fdjZX6rbM2PtBfuVhmq5B+NJ0AI3IyPpWWhDXsCzRBebv5
	 VN69Lm+PQJu/7W8loChycMYiyAkx8FBW9wi+ptyp/H+zHD3Kr1IqN+2umbXLNghVs4
	 6WRGmfgq+wvur+XLvuYpb7PWfyKLv8jNRmWvz683PvHZ2CpT7cQhXrrjHfnNPJpDRa
	 KA/4R9WTl/eMObSV38cvqSwIbjt5CPf932eS2E+ntI2Cl0RgCs6zRO61abU4xRrGPx
	 s6Wc+Kf3a9Ini8T3jYuYiR0F1SLgeGQx27TqyKMxuwm7+kP6d2PCCd4jmaqWATCOwy
	 qojohgjzmL3og==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MxSTe8Pjz
  J4O1deYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeN0/xXWghlcFa0HP7E1MB7j7GLk5BASeMIo
  sXlrQRcjF5B9gUli7qozTBDOAUaJHYueMIFUsQnoSrz4sZgFxBYR0JdYOnsPcxcjB4ewQJzEs
  QVgYRYBVYndl7Ywg9i8Ah4SJ/53gcUlBBQkpjx8DxUXlDg58wlYnFlAQuLgixdgYyQEFCVmT5
  eHKK+QeH34EjOErSZx9dwm5gmMfLOQdM9C0r2AkWkVo1VSUWZ6RkluYmaOrqGBga6hoakukDQ
  y1kus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAy8lGKG6h2M/3t/6h1ilORg
  UhLlzTIMTxLiS8pPqcxILM6ILyrNSS0+xCjDwaEkwZtSB5QTLEpNT61Iy8wBRgFMWoKDR0mEt
  6kGKM1bXJCYW5yZDpE6xagoJc7rANInAJLIKM2Da4NF3iVGWSlhXkYGBgYhnoLUotzMElT5V4
  ziHIxKwrzTQabwZOaVwE1/BbSYCWjxt1WhIItLEhFSUg1MM9Kry6x3J+9T/Oq89/TnZ84GH0I
  jImZfcI3OsNHqC4mSUv+Tv4jzghDH5KuvmEv49e3WaSRH1T7cfu5w7720BSb7HnE2v+vQldPT
  Uvwpr3V21nXp+IOn1Au/dSy6VJP8zL1P+GHU2TI5U5Pd5ZfEJxk9CGgRf9yynM/sgt3dR8mrj
  S8EV/hJ1V1oNrm1KWzVauHYMvcHre0pCvdrdGKfzedftce6PfnLA6vu26vVn/+pvDZlleHc+s
  WJDhfiNMV3Jq7VZb0xY+4FH1kp/amr+/do3JH0eBzw3/KVB2/3+3fS7yX/tb568SZv7q35Ur0
  ex+PDJUIO5AiHO4cyXpb7lv/aeMU5bvH02TMuXPdUYinOSDTUYi4qTgQAWM0h7zcDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-21.tower-591.messagelabs.com!1649901399!20755!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15342 invoked from network); 14 Apr 2022 01:56:39 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-21.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Apr 2022 01:56:39 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 11E0010046B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:56:39 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 031C6100445
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Apr 2022 02:56:39 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 14 Apr 2022 02:56:18 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.42.0 -> 2.43.0
Date: Thu, 14 Apr 2022 09:56:06 +0800
Message-ID: <1649901366-13804-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96629

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.42.0.bb => python3-google-api-python-client_2.43.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.42.0.bb => python3-google-api-python-client_2.43.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.42.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.43.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.42.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.43.0.bb
index 8fcf669952..b6456869f2 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.42.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.43.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "7bf58b665b635d06adb47797a9a4f73482e739e02ed036cd960dc7c183361f67"
+SRC_URI[sha256sum] = "ccd16b3aa92070d3777c4b188669820aacdd70695a87cfc8dbb330f6be9578f7"
 
 inherit pypi setuptools3
 
-- 
2.25.1


