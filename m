Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6055C54E58
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:17 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.7730.1709714646761391410
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XfTUZEYO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714649; x=1741250649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qyqbUKt2NYPA+7EnZO+4w/qMnoIZ1BNnwFxv5BR5Zyc=;
  b=XfTUZEYO4mehCMSNqrTSkvvhckPc9ikebIRgHC77zvXVCWD34CaymA3m
   Y6rx4+48cqIa4VoJka4z2JoUYAP2yAD/pDtP3G46EzjVamqeFY021K+np
   H2yT/5H33Y3TZ+BE517+TVOFGV1theEmb/wWZ4m/LXNHQs5Gjq39Kpc8O
   iDTdyTKR1D8tpF+vIeNgGp0NlAipYYGGAqtvWwUSC0Pt+mjJ2MfyYHmx9
   qsMK8kjGMbaHqZl6IOj3/1z1uWaxdARl+cKWyvOYKWhaA+zVcB9Dh2iZ9
   u60aTlWvbkXULofl0C4SSKVDAjuOo79s0Kwl6OTpo1MKjXB13FpJ0cr9N
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="139397623"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="139397623"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:08 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 66646DD92F
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:06 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 915C8FD911
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:05 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31BB341182
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CDC991A006A;
	Wed,  6 Mar 2024 16:44:04 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/26] python3-astroid: upgrade 3.0.3 -> 3.1.0
Date: Wed,  6 Mar 2024 16:43:14 +0800
Message-Id: <1709714608-19296-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10-3.814200-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrDcK8n+cR7XJWCQv16moG8XMW
	fmr8UEU8ZfimYRvSI6PQSJYFqXBHH2UlOh2o2oTOutvHF25zoU9MkOX0UoduuQAFk2qcZOGgcJR
	qi+EfLTXEFeiN2zKWKYurIkNL/KkoaZUCU1XuCRf8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5APn4
	RjXbQDehab+AC2MJ3sBhQWw3lZ+IXymVDB8yZElJ4CIKY/Hg3AgeMXitxuxx2+h0rPc2cuoyq2r
	l3dzGQ12PzQw9VItc0wcl+cjfatioLrij0xbV0DPhPaMqzatrJxtAJrhiv3KxZaPbOLajdWUQFo
	EVrYTvWk0mShZ3J+0fVnbao4gM+mgHIx+/YES1tTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109152

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Include PEP 695 (Python 3.12) generic type syntax nodes in get_children(),
 allowing checkers to visit them.
-Add __main__ as a possible inferred value for __name__ to improve
 control flow inference around if __name__ == "__main__": guards.
-Following a deprecation period, the names arg to the Import constructor and
 the op arg to the BoolOp constructor are now required, and the doc args
 to the PartialFunction and Property constructors have been removed (call
 postinit(doc_node=...) instead.)
-Following a deprecation announced in astroid 1.5.0, the alias
 AstroidBuildingException is removed in favor of AstroidBuildingError.
-Include modname in AST warnings. Useful for invalid escape sequence warnings
 with Python 3.12.
-RecursionError is now trapped and logged out as UserWarning during astroid node
 transformations with instructions about raising the system recursion limit.
 Suppress SyntaxWarning for invalid escape sequences on Python 3.12 when parsing modules.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_3.0.3.bb => python3-astroid_3.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_3.0.3.bb => python3-astroid_3.1.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb b/meta-python/recipes-devtools/python/python3-astroid_3.1.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-astroid_3.1.0.bb
index b02b15113..3c68f1e58 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_3.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "4148645659b08b70d72460ed1921158027a9e53ae8b7234149b1400eddacbb93"
+SRC_URI[sha256sum] = "ac248253bfa4bd924a0de213707e7ebeeb3138abeb48d798784ead1e56d419d4"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


