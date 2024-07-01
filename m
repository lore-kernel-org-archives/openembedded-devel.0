Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 805F9C3065B
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.13620.1719816256089043092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UzZ/ybpw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816261; x=1751352261;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=o9copX22wsg4QH/PIS/sySWVesQcJGwj2AVJ2gqc724=;
  b=UzZ/ybpwld9Pjj77bE0wiVqeicO8PIUPVhLPAghV0u2isarPu06r1Spm
   YQXRgpXOQcdq8yRRiWl/6MdBAdaNn8ouSEuYo0+KswX/0SZj65yFgqWo2
   +HPGdPTIE3Sc6UAhyXcZ1DwDHg3vKtR3D/LlZEIzOq3cCf61a9GH6dvMG
   MzSDr/EaWd9EoQPvUK3ywOb6k8XmCU39EABJM6C7X1JHmbkRBMhNpDpBh
   w9/7hcxI+EuWWtFmL0IXalDszpyYCcZeTY58yqQDDkOE0vAFzTJxfYEsb
   +ERN0GKj8fThDiIdqn18J5vlcPer/dMTbeOQmLjYk2mjDaBVbhC4H8XU7
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165585917"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165585917"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:19 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F3F1ACA1E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3EBD6BF49B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CDFA5E206A
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7E7061A000A;
	Mon,  1 Jul 2024 14:44:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/25] python3-google-api-python-client: upgrade 2.134.0 -> 2.135.0
Date: Mon,  1 Jul 2024 14:43:51 +0800
Message-Id: <1719816242-11839-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFATBxkIDJvD102MsU01Umgb0zL
	s3lp7uLphRVnXrsHwu8gno4fTuCzpAtOECgmwFLsL8yg4eMRVQan2WpUFDJSeh55F3bOEP7Ox9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111179

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.135.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.134.0.bb => python3-google-api-python-client_2.135.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.134.0.bb => python3-google-api-python-client_2.135.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.134.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.135.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.134.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.135.0.bb
index 4d8c30861..2b4845603 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.134.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.135.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "4a8f0bea651a212997cc83c0f271fc86f80ef93d1cee9d84de7dfaeef2a858b6"
+SRC_URI[sha256sum] = "b552a28123ed95493035698db80e8ed78c9106a8b422e63a175150b9b55b704e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


