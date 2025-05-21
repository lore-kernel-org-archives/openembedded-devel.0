Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1FEC61CE7
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.6712.1747817995798020955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t7QQI5Hg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817997; x=1779353997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E72fIUYDcCemTV2AonbF41yMD8ybFHXWhu++vvF0eFQ=;
  b=t7QQI5Hgd520KBtKmdGsJyjvYvBaNYwj/7nXIQDJ8LI2zhMRaTtf1dy8
   28b7iSa8N52VElbPirouchxz4bbp7RVJNqAu7yabAq/mAX2K8+nqW8xnh
   chLmIOG4eXmUaJoqOjmI2lbr3Ar0fUE3HVWm1RoLFCC8BVR0lYVFL2mhK
   KXQRIIt2l1F+GjJD1H1WVaSLRtqH/nEPqF/LT25+Gx1fvzTJ938ynfdYO
   jitx2y5lYd5OyGmRQEmr8rnKhoxlex0PBMdSzC/SWVir2O9ALAP7CSLi5
   5YSbbdTRV14D18vBbh1swj8vqwBUrHeEc8VMKf+mIt/qjg3jUUiFTCJzG
   w==;
X-CSE-ConnectionGUID: tLaXQ0cpSs+n9NNtYiG6TQ==
X-CSE-MsgGUID: 4MNrT3ZNQda2bE8JIhy7sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="179669862"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="179669862"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:55 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 06187E8FE4
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BB999D8C1F
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4F3D41A0078;
	Wed, 21 May 2025 16:59:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 08/43] python3-cmake: upgrade 4.0.0 -> 4.0.2
Date: Wed, 21 May 2025 16:58:57 +0800
Message-Id: <1747817972-28874-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117533

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix: use version range and don't error of no macOS version is set
- update pre-commit hooks
- bump actions/create-github-app-token from 1 to 2 in the actions group
- update pre-commit hooks
- bump astral-sh/setup-uv from 5 to 6 in the actions group
- update pre-commit hooks
- bump the actions group with 2 updates
- update pre-commit hooks

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_4.0.0.bb => python3-cmake_4.0.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_4.0.0.bb => python3-cmake_4.0.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_4.0.0.bb b/meta-python/recipes-devtools/python/python3-cmake_4.0.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_4.0.0.bb
rename to meta-python/recipes-devtools/python/python3-cmake_4.0.2.bb
index b2450cd46f..a0d249a962 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_4.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_4.0.2.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "b929ab7d2ebd6b9a81018b0248ea75edb3dc4ad69367e8c75fb0f6774bb6e962"
+SRC_URI[sha256sum] = "d6ce25b2cbebc073344d38b603ba223f8e633a07335f8056375f397a0f0027e5"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


