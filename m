Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA52C0650F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 01:41:49 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2759.1713318098760736329
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Apr 2024 18:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V7MADQZs;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713318101; x=1744854101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=IjiZJj2axR1kO3j3WYQ5RS2YOVF7T3Hgj+StoPfZ33Q=;
  b=V7MADQZs9oIuClyVKGSN2la6OLTwVKJUScZ6la1f3cZBFX/ej0T1B1tF
   esun3zvUCzEg6U60oPRZ0m8lXlyGjjOri6MF0COachUv5X44bNbaMOPV7
   kLYJc51DUJKmenx/gB2c4xESbwv5lK7ux/uZ0/Qelt2zapG0h+yqjw/1X
   WPKU74XtEgYs2AocQVSD1VH0bew1Vuu87lbxagmZJBGvE3f1zFCSshX3u
   yiNN4N6wz228lf+cLEbqrBgYvn10ubps+TVxD39JxnEMIkUe1qJtnbgyR
   GqdNM9qwsvwPXcxiDRqB+WUZgIgeuxc3HNkvIgjiJ35gkPfE8HlEsLDlV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="134609872"
X-IronPort-AV: E=Sophos;i="6.07,207,1708354800"; 
   d="scan'208";a="134609872"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2024 10:41:40 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 41C6B107D2C
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8352A11ECB
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EA60C2007473D
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 10:41:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 97E731A0002;
	Wed, 17 Apr 2024 09:41:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/49] python3-rarfile: upgrade 4.1 -> 4.2
Date: Wed, 17 Apr 2024 09:40:46 +0800
Message-Id: <1713318061-17128-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
References: <1713318061-17128-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28326.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28326.004
X-TMASE-Result: 10--4.930600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84aHE9HUMbAkMDD
	FOyfVeOua+o/S6GsElDAKInz7r5RFhAuAMSgkx+55TBV9C2UM3FUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw7cgUVP3Cp+vRCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLO/2qemOefWfLLzA
	nZDQR9c/Plh0Z6PV2DKBglGIzXsOK+1EM22HdM+EJ+d11vYbN5jDy4XCcvNTM8K2hqsv8LTyW5l
	eQcoeKCIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Apr 2024 01:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110020

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
===========
-Support unrar-free >= 0.2.0.
-Add RarFile.is_solid to check if archive uses solid compression.
-Support old multi-volume archives better where ENDARC does not contain NEXTVOL.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-rarfile_4.1.bb => python3-rarfile_4.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-rarfile_4.1.bb => python3-rarfile_4.2.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb b/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-rarfile_4.1.bb
rename to meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
index 8f5ef415c..41cff4bfc 100644
--- a/meta-python/recipes-devtools/python/python3-rarfile_4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rarfile_4.2.bb
@@ -2,11 +2,11 @@ SUMMARY = "RAR archive reader for Python"
 HOMEPAGE = "https://github.com/markokr/rarfile"
 LICENSE = "ISC"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2f31e224cbf0c29cb6c55f2bae0e165f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1916695551f7eec48dfd97db9467b831"
 
 inherit setuptools3
 
-SRC_URI[sha256sum] = "db60b3b5bc1c4bdeb941427d50b606d51df677353385255583847639473eda48"
+SRC_URI[sha256sum] = "8e1c8e72d0845ad2b32a47ab11a719bc2e41165ec101fd4d3fe9e92aa3f469ef"
 
 inherit pypi
 
-- 
2.34.1


