Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20BDD29F93
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.40132.1730874681833914631
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O+m2aLXE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874682; x=1762410682;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=jabp2U7qR5BXmfZfXraE1g+9mhJmWXDECfQEifETDdI=;
  b=O+m2aLXEPgIFWpIFquYA34VWszTbrgwWAf8sAdrYFnye/CZQzlwHj7U5
   zRRTwkicnuifxiiwf6Pl7t4zLLTNKAjkq+U4/M9euH7m00w7KFfrR1wtH
   6SRsCtYJuGlZ6IwtBeEbwZf1RY+8fBybixeYGeUqPH38G+fua/mI4xJR/
   8gQotj7W9ZsUnK3gAmlBDQyou2IW/Or7T5hr0dEpHJD3Lh+5Csp/SgBEK
   XticcUK499XERonF5AAmae93yIhEhFuPuj300m+ai3bb39Yu4HiaO8M6d
   V6xhdkqzpKg3IEny2NN7eK/9wFdKpD53lPwhP/RNwEJ+02U2VsAvRT2Nt
   A==;
X-CSE-ConnectionGUID: lG+4zVEHRCKGyKFX3V/oZg==
X-CSE-MsgGUID: CAbQZNx7ThSQDcqhCu1y8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158171259"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158171259"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:19 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C95A3E8521
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 10682D3F10
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9C3F920071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4BEAA1A000A;
	Wed,  6 Nov 2024 14:31:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/46] python3-elementpath: upgrade 4.5.0 -> 4.6.0
Date: Wed,  6 Nov 2024 14:30:34 +0800
Message-Id: <1730874660-2364-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--1.185300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyt7c1y+5T8A/4dG
	5Deyz2OthUq0VzKnAqO4VxGFQBNJeO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1AYUFsN5WfiFlwV2iaAfSWcURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO28bR
	Ued1HGAk5EuEYqTXIBSaPDnPP0XMzCA0nFc0ubKzSVUev62farPrm3hosyme+oNXNVChZA/S/PY
	wyHC4Dm1xXxgSbOJSRVtUpMiiBMFvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113705

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix XsdAttributeGroupProtocol
- Improve Unicode support with installable UnicodeData.txt versions
- Extend names disambiguation with a fix for issue
- Refactor tree builders to fix document position of tails

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.5.0.bb => python3-elementpath_4.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.5.0.bb => python3-elementpath_4.6.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.6.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.6.0.bb
index 937d96860..e4bb375a6 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "affdc8de95af1a4c10d1d2ed79c6fa56b59c26c7fce64b73497569e9dea46998"
+SRC_URI[sha256sum] = "ba46bf07f66774927727ade55022b6c435fac06b2523cb3cd7689a1884d33468"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


