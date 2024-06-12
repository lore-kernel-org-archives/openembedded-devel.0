Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4358AC27C78
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:46 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.2430.1718161117886735695
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UT/tYkBz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161118; x=1749697118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=q+fFlj12Xx1kO7qEgid/+K9U/bC55cTAWfuaG9OnRVA=;
  b=UT/tYkBzPcAH4CPY7bpshrX/VVc4XCUpN9qKUufv91LPYnvER518ZOQe
   rY5Wldy45lSMSfiV5t0BdNYIlmsuH2IlBxQAuxjmHtQfhA0C3ya4jJu5J
   XgHVRwcZ2rh7Z9FOOu64oRivPwjx2DruvT2TnzmuvwhQ9SuaHVYy6yey8
   9w12B6WOY12tIZXJ6P5aeY0DbNUYIq9h+6aMCWXLtRnp2n3761a/gbAHi
   BrxNtvcWx5TpBgHFgyQ9PvNmnl9dJSjDVKfc+Knz4J8nOeEsRk0SwaFiD
   /EDQ1nwMzdnQ3eVNqnA0TJ8+i9B4AAOlxSDbPpG93gsIFAzO1Lc9MOHMV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="151034547"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="151034547"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E4C38C68E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B8FDD3F18
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CC23F20071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7AB181A0002;
	Wed, 12 Jun 2024 10:58:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 02/43] python3-autoflake: upgrade 2.2.1 -> 2.3.1
Date: Wed, 12 Jun 2024 10:57:35 +0800
Message-Id: <1718161096-29710-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-0.456400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mryiKgKtIyB4ofIGCZubTsxJgU
	Ly4zAbFB9ivkWUXLO/sNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w78pq
	Voev3Dxk/REBtWQnQqzwi0y4JwM8bJ6z1b/Zzl4KOMyxtDR1WxMIbkuqhOlm0d0FwKp6dGduCjH
	ZJYpG2jSUZmrX9dPbSCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110839

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Update pre-commit config
- github/workflows/main: use pre-commit/action
- Always set encoding when reading setup.cfg

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-autoflake_2.2.1.bb => python3-autoflake_2.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-autoflake_2.2.1.bb => python3-autoflake_2.3.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-autoflake_2.2.1.bb b/meta-python/recipes-devtools/python/python3-autoflake_2.3.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-autoflake_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-autoflake_2.3.1.bb
index 7b7430866..0a44d751f 100644
--- a/meta-python/recipes-devtools/python/python3-autoflake_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-autoflake_2.3.1.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=88246be6a34c1496c253f58599f3db85"
 
-SRC_URI[sha256sum] = "62b7b6449a692c3c9b0c916919bbc21648da7281e8506bcf8d3f8280e431ebc1"
+SRC_URI[sha256sum] = "c98b75dc5b0a86459c4f01a1d32ac7eb4338ec4317a4469515ff1e687ecd909e"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


