Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97A6C30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.166859.1719305835097827565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CogEzX7b;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305839; x=1750841839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LVyEKyy3UTA/kwGMohzQu3JLWvydj4QmA0NXIeW3HV0=;
  b=CogEzX7bzRTgWoMXw3PregKSggURc43scPZm6DGEaCU/2vPn3OSv7bmr
   NX02iipVLZLGxpFvstiDXzmLJCtFIYSbaBsomWu9FTkS6qMPh8xYItGyT
   cRr+cezNGzWeAkbzm03u/oaOIBL9Ke0WrmRtZ+7O9Wm4bCcJTtiobDVxf
   CsJtzXbAX+dqvEcuuUF4uVkHeEI8XDqt9mRPNJsXH0yZzAU7/pdrX5YEv
   Qc58TUGcFyfemYKScud46RLV2NcCFy7+SVbLMZDh6UWLOYul4V0JWKz04
   6Kmj9frILcDacaULRv5EqQ4xcf3swVf1OJLKOc1MUPDbgSWZ59LdFtL1O
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164869289"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164869289"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D6300D8008
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2E403D8AFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id BAFD7E2A0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 690C61A0002;
	Tue, 25 Jun 2024 16:57:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/57] python3-google-api-python-client: upgrade 2.131.0 -> 2.134.0
Date: Tue, 25 Jun 2024 16:56:03 +0800
Message-Id: <1719305790-11484-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFO8Iq11UjNii+x2I7IG7QP2n2l
	q7F+PB6ntdWxddTjqmv1ZN/R2KozVAtOECgmwFLsL8yg4eMRVQan2WpUFDJSeh55F3bOEP7Ox9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111043

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.134.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.131.0.bb => python3-google-api-python-client_2.134.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.131.0.bb => python3-google-api-python-client_2.134.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.131.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.134.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.131.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.134.0.bb
index 91889fa4e..4d8c30861 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.131.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.134.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "1c03e24af62238a8817ecc24e9d4c32ddd4cb1f323b08413652d9a9a592fc00d"
+SRC_URI[sha256sum] = "4a8f0bea651a212997cc83c0f271fc86f80ef93d1cee9d84de7dfaeef2a858b6"
 
 inherit pypi setuptools3
 
-- 
2.34.1


