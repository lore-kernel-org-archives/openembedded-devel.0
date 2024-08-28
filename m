Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A0F4C54751
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.8732.1724833558265704570
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=n1C5lX2c;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833558; x=1756369558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=yj+9aOUr2c0wN3dYJkqjWmkjodNq48wGCUf/ijEZ9LA=;
  b=n1C5lX2cDZ1ii9xJKvqYAUHZuCxztz6W+G6nxQyYiSbUrJb6diwtznH/
   JVgYQxxbzkU7aQzjgTpnG+Pu6m1rDbmmaspJecgXQk8OaA09xQghPBXXE
   eqc4JuQ8/FkEmsbdNoOyE63G+KYEqtGjESCggn0Gq8inbjp7TIDhMv8qf
   +bE7zswt7vAWM+gg/HtOkgiJvoF85A2yNDe1mQ6cQWEwW0Us31kwgtLrt
   /qh8BhxTHyO04TTZJJSKSSCwps94kmzYXc5FQ+ImKh/UVxBZWhdC8/D15
   2AqrjyZ/76UszlnsNm23UZE4SqWRtpL5z+nC516Wo5Z/ya7k0Cc6IOHnA
   A==;
X-CSE-ConnectionGUID: ZZfKbWNXQ6OaPNvXz63Hag==
X-CSE-MsgGUID: J9MMFpMSSZCgnjj13KoqyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="150797873"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="150797873"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DB2FEC9324
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:53 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B0B8D50FB
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 960116BD5F
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4188F1A0002;
	Wed, 28 Aug 2024 16:25:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/46] python3-sympy: upgrade 1.13.1 -> 1.13.2
Date: Wed, 28 Aug 2024 16:25:15 +0800
Message-Id: <1724833525-2162-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10-6.602700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrrosBAIA2fPgtorPLNYrwZLK6
	GmKppGdqs/f7wiqK9vw7+KNFIOhtsz13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsO8j2/Qpcz48RY1tl9vG/AY7Cl8sx4HBG30tCKdnhB589yM15V5aWpj6C0
	ePs7A07SBYBMziildmjywPik9b4YbQhx3cWh2yWHMBZD7F6j7x0GtA2zaWECtg8ghytJtz9/jL0
	bFiIvS4dnHZtDoVrl1NYEihaupS5Ny89tVOrDil
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112015

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- An inconsistency in Float/Rational comparisons was fixed. SymPy 1.13 made it
  so that Rational(n) != Float(n) but this was inconsistent in the case of
  Rational(0) == Float(0) and Float(0) == Rational(0) which gave different
  results.
- Fixed a bug that caused LambertW to hang on specific inputs.
- A regression introduced in SymPy 1.13 in the heurisch integration routine was
  fixed. The regression prevented some integrals from being evaluated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sympy_1.13.1.bb => python3-sympy_1.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sympy_1.13.1.bb => python3-sympy_1.13.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sympy_1.13.1.bb b/meta-python/recipes-devtools/python/python3-sympy_1.13.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sympy_1.13.1.bb
rename to meta-python/recipes-devtools/python/python3-sympy_1.13.2.bb
index 41772b05f..02577964c 100644
--- a/meta-python/recipes-devtools/python/python3-sympy_1.13.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sympy_1.13.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/sympy/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ea48085d7dff75b49271b25447e8cdca"
 
-SRC_URI[sha256sum] = "9cebf7e04ff162015ce31c9c6c9144daa34a93bd082f54fd8f12deca4f47515f"
+SRC_URI[sha256sum] = "401449d84d07be9d0c7a46a64bd54fe097667d5e7181bfe67ec777be9e01cb13"
 
 inherit pypi setuptools3
 
-- 
2.34.1


