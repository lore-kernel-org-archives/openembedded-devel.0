Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9069C021B9
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.46462.1739178118915531523
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sduGNyVX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178127; x=1770714127;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+PTWALg/ueMNOH6x3CInKCqZGmUK4zwK4LmwGFtV2/U=;
  b=sduGNyVX5TN+KzMk5hDAJsEMCQsttJSFW5Im60tUvK6MCnd06jQUftwe
   A1G6yLsF3QTDtXEQC9fOa5d+uGj4bcldCePPC1njT1fJRN0UeNWFIO8SS
   wWbPmfppsMhYQRsU6CQ5quKoj8V+7jAE1PPquLyFmWc7AR6SXD00aYS5C
   w2ddzdc9ok/q5Fn7XMLejOVjc9rRvkslvS8iVLKqtROEUIuAQPyMr2wd/
   hFiKd04xlo4G80cuYgmC4UHns3oXme2rU35mLzKCZpXZMUuPOfXLQVl1r
   B19zVKsCwutrRpA6YrMPnKoFh4gT5OrhID50wwBFJBJSjvwZwGVMS2roc
   A==;
X-CSE-ConnectionGUID: VzMR/iiXRK28YYroXtP13g==
X-CSE-MsgGUID: jO0fNW3TRVWw9+MGzJHYYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189493102"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189493102"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:06 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BDF6E8521
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 519ECD5081
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:03 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E955F1A006C;
	Mon, 10 Feb 2025 17:02:02 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/66] python3-lz4: upgrade 4.3.3 -> 4.4.3
Date: Mon, 10 Feb 2025 17:01:16 +0800
Message-Id: <1739178095-26432-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115373

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- fix(doc): Install command missing a parameter
- docs/lz4.block.rst: fix typo
- Update CI to newest actions and Python 3.13
- Revert artifact renaming
- Disable aarch64 builds due to compiler failure

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lz4_4.3.3.bb => python3-lz4_4.4.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_4.3.3.bb => python3-lz4_4.4.3.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb b/meta-python/recipes-devtools/python/python3-lz4_4.4.3.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-lz4_4.4.3.bb
index 7bbe59e8b7..d29166079b 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.4.3.bb
@@ -9,7 +9,7 @@ DEPENDS += " \
     python3-pkgconfig-native \
 "
 
-SRC_URI[sha256sum] = "01fe674ef2889dbb9899d8a67361e0c4a2c833af5aeb37dd505727cf5d2a131e"
+SRC_URI[sha256sum] = "91ed5b71f9179bf3dbfe85d92b52d4b53de2e559aa4daa3b7de18e0dd24ad77d"
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


