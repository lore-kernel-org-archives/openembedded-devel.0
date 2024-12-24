Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4210AE7719E
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.30363.1735032444358993975
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iGy2EmXf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032445; x=1766568445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bzUm/721DP7Ie8l538A+AL8iphObEUCIUydew6/QVDM=;
  b=iGy2EmXfamCprl8vf1r5sXc0MWDVuNYDPviP6jfzspgtYbHeuwG5lLXH
   YLzEqKc2Kg+gqOqyoPHgVCkAKV6BUJzuPNbnCM4vKgnCt8Ia0XRXHop9v
   fAQ1gqi+patCx33kR3Fbz5t9gSiOwmjLcPnrA6ASkGijsuGzaQW1OY1ER
   Ed3l6318Iii86FPhKk8/9bGRnuOVDQZfYRDsQHk+6y7WceR1XRCZBT41w
   rjkRmqmJj6BT2ezGPBCN/iXtSRXSQr5kPku6E63aVM5OMNLjJkSmOm3K8
   TP92ta/UkYVtgx4iAx3ncNWzrzDmIIDIE+meGtiDJymfeOxFrAsy77Emp
   g==;
X-CSE-ConnectionGUID: gquN9lwDTfuMyvOx8tsaWg==
X-CSE-MsgGUID: 0Dw48BPETvyK6KzTvw2bbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184746895"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184746895"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id ADB3DD500C
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A416D5096
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 105466BB64
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CAFEA1A006C;
	Tue, 24 Dec 2024 17:27:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/67] python3-haversine: upgrade 2.8.1 -> 2.9.0
Date: Tue, 24 Dec 2024 17:26:26 +0800
Message-Id: <1735032421-13513-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10-0.442400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrWfgivgcUPZPuebKrFNJkRb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXLvPo0obgJYvNulS/sYdqNrciMpVIo8dhllTs
	oszS6PlM0a7IcW/Kkeb9hXMDTSbtB3T80ohgUf9nUkufRQWXVib19QEuBlzUv+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114504

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Adding option to normalize output of inverse_haversine
- add normalize_output to inverse_haversine_vector

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-haversine_2.8.1.bb => python3-haversine_2.9.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.8.1.bb => python3-haversine_2.9.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb b/meta-python/recipes-devtools/python/python3-haversine_2.9.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.9.0.bb
index 5fd5ddd71c..2dfb3356a7 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.9.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=20a52d2c688975e989fcbee3e6c8d1a1"
 
-SRC_URI[sha256sum] = "ab750caa0c8f2168bd7b00a429757a83a8393be1aa30f91c2becf6b523189e2a"
+SRC_URI[sha256sum] = "1103d7e1f0f108c25b31b63452c54d9d6f29389a70de7dd75fd4b908329b6fcf"
 
 inherit pypi setuptools3
 
-- 
2.43.0


