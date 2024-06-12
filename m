Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EA7C2BA16
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.2489.1718161122553454466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qml/Bq47;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161123; x=1749697123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=61Xb6H44kQJ8t7laM5khPGdu4luRsZ9Xd6oliG5+YfI=;
  b=Qml/Bq47qOzGiUqffqoChhYiN+KtDYlEcf+j9XWjnxm6UGzSE1t5HWtd
   iU78WdkyLcRLQQiS2L17N4fsWz2NayywhCpcTQZ/frveLXwToZ+NEomik
   S4reoLndzaVPRP2bspG1MpwEbUzsSaTAtI/uRwz9pHxoMfzeN4ZvS7hEd
   TjaybrjjJFgrLPeCfSamH6eb/ZPW5V+jdk2l/JQKdcLIYzz7u3g3DqOCs
   RsITe1VB8/EjLfMjH+AXnK8eB4jRUa05DNgPIDx4WdZWyQFWgLppOmmph
   HG8vkt//drA56XBKI/OaUNUloah1RqKTf8EiCDx7iaCqxh2nLTXvg+00u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="162710858"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="162710858"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0559BC68E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 51F9ACF7DB
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D9A5520071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8839B1A000C;
	Wed, 12 Jun 2024 10:58:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/43] python3-google-api-python-client: upgrade 2.130.0 -> 2.131.0
Date: Wed, 12 Jun 2024 10:57:43 +0800
Message-Id: <1718161096-29710-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
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
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110848

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.131.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.130.0.bb => python3-google-api-python-client_2.131.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.130.0.bb => python3-google-api-python-client_2.131.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.130.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.131.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.130.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.131.0.bb
index 9ba73ebd2..91889fa4e 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.130.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.131.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "2bba3122b82a649c677b8a694b8e2bbf2a5fbf3420265caf3343bb88e2e9f0ae"
+SRC_URI[sha256sum] = "1c03e24af62238a8817ecc24e9d4c32ddd4cb1f323b08413652d9a9a592fc00d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


