Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 409B0E6689A
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 00:17:10 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.8211.1733185024254837601
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Dec 2024 16:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iLGcRPP8;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733185025; x=1764721025;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6oiXskB9qX2NnnFpDHbk07FhchZ2fAgyG/Sk8PQ7M8Y=;
  b=iLGcRPP8Z9deSJZ0uEZfdzAal9HG+IcfrcogrmklTFd4aixDSMRpe0hy
   rrP1jOP8Jnr5Xx5/qtsduJqmwngTpFZIlrgxBaIOG+Iat/ze4xZgodULb
   wgnxpGmHyvqmIKGS9kn7zoa0NEpxOmnKiypYvul41CQP5Afb3ZWacVOf7
   meQL1HM/flYooi13daoLlV1RkZ9EROJFCtvTgAe7zCMyqBHiiPpGhen+D
   WpGBITWrvg1RcLFn1UjshCRu1t7YmBFTMKUpjLPlOUfcro/rzTxzZTJ4N
   pt8yi6kz7hIEhzgQf8ODWDELlVIqa43FqQtKbPFYYajty2RNx9r5Jll6m
   Q==;
X-CSE-ConnectionGUID: Qn8USIIWT6OVq4jMiFY6bA==
X-CSE-MsgGUID: mu3n8mKJRAqCJ0DCwwTpVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="184689088"
X-IronPort-AV: E=Sophos;i="6.12,203,1728918000"; 
   d="scan'208";a="184689088"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 09:17:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 09618E8520
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:17:00 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D1DBDCF7D9
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FC2320071A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Dec 2024 09:16:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1109F1A0003;
	Tue,  3 Dec 2024 08:16:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/34] python3-pdm: upgrade 2.20.1 -> 2.21.0
Date: Tue,  3 Dec 2024 08:16:28 +0800
Message-Id: <1733184999-27041-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
References: <1733184999-27041-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28834.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28834.003
X-TMASE-Result: 10--2.821200-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yfCCu8kVj0TR2FA7wK9mP9fyUa6YiGECyLbS
	c9DZ5nsJMBFzTiIIGJqfpS8fdiMxuaT4BhrRHlF4KsurITpSv+PKrKWVfpQkiwvrbFcH4G2rBDR
	H0loVrhr6ganpwg6AoA3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbaH62
	gsspfBEYGQRIwjTl3i64sVlliWKx8fE8yM4pjsDwtuKBGekqUpIG4YlbCDECseyhETYMxMRiU1p
	prmpxMV6mHs32z29xYcFFuC6liHopZRBw2zJZslXo69kkzsQt2x5ON8VTawZ980lVThcnmO8oun
	BvwKO90c4+mblHAFrYgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Dec 2024 00:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114166

From: Wang Mingyu <wangmy@fujitsu.com>

Features & Improvements
=======================
Pass original working directory as env variable to pdm scripts (#3179)
Output similar commands or script command when the input command is not correct (#3270)
improve readability of Python interpreter validation message (#3276)
Print task name by default when using pdm run (#3277)
Make OrderedSet.__contains__ run in O(1) (#3280)
Emit post_lock after writing pyproject.toml and pdm.lock in add/update (#3285)
Drop support of Python 3.8 (#3298)

Bug Fixes
=============
Fix the name normalization issue for optional dependency groups. (#3271)
Don't use uv when installing plugins in project. (#3283)
Fix the bug that pdm plugins are invalid after installation on ubuntu system python. (#3289)

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../python/{python3-pdm_2.20.1.bb => python3-pdm_2.21.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.20.1.bb => python3-pdm_2.21.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.20.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.21.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.20.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.21.0.bb
index a043b4b352..d323ae3c69 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.20.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.21.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "5348e9d33de381f998904a63ab18efdd6d1cf6377d45572e8b996d58dfc5b996"
+SRC_URI[sha256sum] = "9c928d6db62d104ab86318fe09aaf9bdfc6f616176af407e4df00f59e001930f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


