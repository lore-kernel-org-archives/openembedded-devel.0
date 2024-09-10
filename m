Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C345EDE99D
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:03:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.18592.1725959007143197041
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:03:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gnmTgY/J;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725959015; x=1757495015;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=do7fMUFwLKuCoApJiTHpJmOITy8/eJwG1Oaf+CrVuYU=;
  b=gnmTgY/JjqGf9LvEX8WJ3BNDvtjrrDVzWCxDGHRkJkzJA4HvsHb9Lw7P
   cASzSSvmpOavq1JS9rUGCKnj5bE8uhSgWZta7PPBDPahfJhBzkgEEiJyk
   mFMg91wbvpQNNGffEut73VJ2rieCTeQPKW+nEgjvV2tzELuX+JJiTnPP2
   sun54fWgSKCDPtgoR1Y4dNXTmWJKR/IsLXVManLDv1f0YPxswcwALlh+W
   kwTqo2QRW3dnieUQ17WwRP7HajPHRD5XcaBTkcX6UH/YG8E+f7uWVdURB
   dE8Dq56QpI/V1yaHTFVdWyPR85u2IS5Url8VIhIrh3Sc3WJZja+VkTSkb
   g==;
X-CSE-ConnectionGUID: qq6oWNPGSvGIic1vwH1Rqg==
X-CSE-MsgGUID: kqnzgg9KSCK6rhZMhP2lcA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="152689882"
X-IronPort-AV: E=Sophos;i="6.10,216,1719846000"; 
   d="scan'208";a="152689882"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 18:03:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E9F76D8008
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3466EBF49C
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C543F200894AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 18:03:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77D2F1A01E9;
	Tue, 10 Sep 2024 17:03:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/42] python3-types-python-dateutil: upgrade 2.9.0.20240821 -> 2.9.0.20240906
Date: Tue, 10 Sep 2024 17:03:01 +0800
Message-Id: <1725958990-5719-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
References: <1725958990-5719-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28654.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28654.006
X-TMASE-Result: 10--0.168300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/upjmdWmKHGLD4Yy
	coNpBJWDYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzaE3fyyLv8rQY4L
	Cx6vTKcYeGsAigTcXtEkAOwUFjIe5aSr1iWJ2MsuJ5lRji1q7Z/DvahOiq1Ay8n6lL/YsfisXpi
	0kH8717iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 09:03:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112219

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 [python-dateutil] Add dateutil.parser.UnknownTimezoneWarning.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...40821.bb => python3-types-python-dateutil_2.9.0.20240906.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-python-dateutil_2.9.0.20240821.bb => python3-types-python-dateutil_2.9.0.20240906.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240821.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240906.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240821.bb
rename to meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240906.bb
index f79edaaaf..5c3a47743 100644
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240821.bb
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240906.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "https://github.com/python/typeshed"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
 
-SRC_URI[sha256sum] = "9649d1dcb6fef1046fb18bebe9ea2aa0028b160918518c34589a46045f6ebd98"
+SRC_URI[sha256sum] = "9706c3b68284c25adffc47319ecc7947e5bb86b3773f843c73906fd598bc176e"
 
 inherit pypi setuptools3
-- 
2.34.1


