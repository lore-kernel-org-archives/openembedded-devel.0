Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7DBBC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.30503.1735032439305966671
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jfh5GMZZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032441; x=1766568441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mlevwg4w799VYaRYA5WvXGpYQvPkP8hAs3Is9zTQ/Ew=;
  b=jfh5GMZZTRP4Chew7ajFTHK+njN1Qqds3kSwyBO0sheGyqnlRb5jmnnz
   tAep+MdffOlGBnfZCAVSI9ADyrc0Ch28iE0q2tS4qx1QiDcmTiV2KoqrA
   o6Ej7jq4/1Q5BSh8x6htstpbt81lQ7f5msAKdwWBN4qqu2elLii9hm8cd
   h1J8riHW6zW40wM/+CirDLkd6VVnqZcX4mDCmySGbwqLtoEcbmJLJqzYk
   M4NyUT0qxZUsC3WnjTfpc6pv0dXWEWnRa33kc/GzJl96r5/rqsBWVVw8O
   zh5hhhIHY2elwNrG4d86SOQ+sY0KLbXW7zpcz5U+Gealbahb8Oa5OanQG
   g==;
X-CSE-ConnectionGUID: LUQ1CIO8T5SJKGAIKkrgiA==
X-CSE-MsgGUID: 5wukIwp8SCSwoOMwLgYgjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="184807080"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="184807080"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:19 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 69530C2264
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38A6CBDC92
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CCC0B6B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 758FF1A0071;
	Tue, 24 Dec 2024 17:27:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/67] python3-cmake: upgrade 3.31.1 -> 3.31.2
Date: Tue, 24 Dec 2024 17:26:08 +0800
Message-Id: <1735032421-13513-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--2.955800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrKN7GDwhYtfV4YeSlHZYFoqB8
	tGwEqygaEoEzw0Rp53UScHHX0rLXBO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ2uX
	Hvx4h0c1l76kpJqmyroAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzV6+mPpULvbGSNi
	a2JCsDiRitbBFz/y5YuL3vLoGl5kptHC7/Cl5BSadLh6wQFgbU/73VRZoMk54q5nnCwo8TI4Sz1
	Hd/igkJiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114481

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- [Bot] Update to CMake 3.31.2
- fix: tests
- chore: align minimum cmake version with the one of scikit-build-core
- fix: bootstrap build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.31.1.bb => python3-cmake_3.31.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.31.1.bb => python3-cmake_3.31.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.31.1.bb b/meta-python/recipes-devtools/python/python3-cmake_3.31.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_3.31.1.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.31.2.bb
index 5e75246ecf..2c2cd02627 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.31.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.31.2.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "45e09ef6fc5a0d3d4cac11bfee43ba3f9925f301660630d3d1e5457fbe12ecdf"
+SRC_URI[sha256sum] = "16a323fcbb86cf8a10aea82cd4deecb33edb3ed7e8907be8a06933ce04f6e6d1"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


