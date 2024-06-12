Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EEFC2BD08
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:58 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2438.1718161129563991551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K+u1JzxL;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161129; x=1749697129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Xs10hu6F2XTc9GafZJWwif28bzkW/8MHcExFEShsceU=;
  b=K+u1JzxL7Fhu8GeEzJhuMm9qwzUIcDF51RD+3gL80wKJle6/uNJYzczC
   yJE3jaBvvJvtCzRPAvi4u/Td8qC+/JW62kTA5mJhSczhcmaV8GfBtP5a9
   CuyEUcy/YKSEcbcLTyh6UGN42rOsV9msB55SEyrb5UWJFaMJprGlWgcyk
   OSc6PyPMCgd2udGrXaou7Fo078eD5bdCfRhha85WRct7gMP+W5Fcp18iC
   jRrgbQr3LvfWOHdPuY6I/UERILmBissAe3ICqY9OWdt57prDjHFfmeiY7
   T+vX5EmwbjbDDwpaMhGXjKy7NXxR7ZQ1N+RD601araHxheXwbk7EOfg2k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="151034582"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="151034582"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:47 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E99BDAE08
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50F3B11C5B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7EA720071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B5321A000C;
	Wed, 12 Jun 2024 10:58:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/43] python3-pymongo: upgrade 4.6.1 -> 4.7.2
Date: Wed, 12 Jun 2024 10:57:57 +0800
Message-Id: <1718161096-29710-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-0.516900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr5sPqcQkI8puU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN71Wx2uUbPLduTKBinxl/umAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jFnjKVTYbDMDEQdG7H66TyHEqm8QYBtMOmbc6SM3NYwj9yj
	S7iAV3Y/B8gOleGMAh0cUXUxo8+ULKmxz9pkhKwvPLg6UNXKUrhmvrROivzrzez2v/Tc21rn2Qy
	hyXpidIgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110862

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Fixed a bug where PyMongo could not be used with the Nuitka compiler.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.6.1.bb => python3-pymongo_4.7.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.6.1.bb => python3-pymongo_4.7.2.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.7.2.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.7.2.bb
index 260e134cd..2951f8f85 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.7.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "31dab1f3e1d0cdd57e8df01b645f52d43cc1b653ed3afd535d2891f4fc4f9712"
+SRC_URI[sha256sum] = "9024e1661c6e40acf468177bf90ce924d1bc681d2b244adda3ed7b2f4c4d17d7"
 
 inherit pypi setuptools3
 
-- 
2.34.1


