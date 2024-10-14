Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233FACFC53F
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:25 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.50496.1728896174505859974
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gb3DDPvO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896177; x=1760432177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ufubo7Zntl7JdEHegGJJAd436bRf7LaJxJc3fU7R6J4=;
  b=gb3DDPvOJvcJ5Y0FJF/bsidS9wVSt4wkxe7q44Lil+RzyoZNbpJNXvst
   aBIT6uF2piagMFTC0VQ6yH7QXfRFQxN0A6Xp6JZk/dvU73MgEVnCYYXm+
   JZ2/7O4yobVs1VtBs5NiCT9l8EYm/cZIeKN8GZlsfx4ViGL4wP4BVDx2J
   5qou5TzJVCXLEkMI01W0IjYU1V4okvgI23miXP2QRhfiVBfuYFWzFo7Q+
   4ZV02dilCl8n14RZMHOWBfBKEBfzwFSwXmmInukUFHqafpTyKEVqFHyuR
   eABg3aGGiqirqJe/p7C5Np+DRQgwZasc80VKzucMPym+ywAcD1BgMt4tW
   A==;
X-CSE-ConnectionGUID: 8Eo9cG1CQaCdeGwOJtzmTg==
X-CSE-MsgGUID: RNDN423mQ5Sa3E+QvqMcPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="176693006"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="176693006"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:15 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C7A95D4F55
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 25245D5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AB2D520071A2A
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 75A1D1A01ED;
	Mon, 14 Oct 2024 16:56:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/54] python3-types-python-dateutil: upgrade 2.9.0.20240906 -> 2.9.0.20241003
Date: Mon, 14 Oct 2024 16:55:07 +0800
Message-Id: <1728896115-2944-46-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--1.688300-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrczQnRrpmbEmU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v9uTKBinxl/upjmdWmKHGLD4Yy
	coNpBJWDYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzMls0FUK/RbWc/b
	GyYwJjYNw2NKXRsC1tGfCgg59/aVrpfFanXq7uvahWCfsBNiNwu+Jy7gNnUNDw6GHMsQBXsq016
	Ii3uWjDiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112896

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 dateutil: Enable failing test

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...40906.bb => python3-types-python-dateutil_2.9.0.20241003.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-python-dateutil_2.9.0.20240906.bb => python3-types-python-dateutil_2.9.0.20241003.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240906.bb b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240906.bb
rename to meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
index 5c3a47743..09d919dd8 100644
--- a/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20240906.bb
+++ b/meta-python/recipes-devtools/python/python3-types-python-dateutil_2.9.0.20241003.bb
@@ -3,6 +3,6 @@ HOMEPAGE = "https://github.com/python/typeshed"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=c2d9643b4523fdf462545aeb1356ad23"
 
-SRC_URI[sha256sum] = "9706c3b68284c25adffc47319ecc7947e5bb86b3773f843c73906fd598bc176e"
+SRC_URI[sha256sum] = "58cb85449b2a56d6684e41aeefb4c4280631246a0da1a719bdbe6f3fb0317446"
 
 inherit pypi setuptools3
-- 
2.34.1


