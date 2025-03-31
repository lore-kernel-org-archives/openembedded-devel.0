Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4850C369A7
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.47785.1743412323595887987
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GNkz/9K3;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412323; x=1774948323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/bifhdpBgpJ0Bp5/2a+57ebBeN0iXEH5bwbwedAYk/M=;
  b=GNkz/9K3NvOTswXM1YY5QT+URlyWa+xi97Zq0Up03yEHrzX4k0+x3B6Y
   aChWLnAT5CYh/xQ1ltWTjDpTC88B3MVbDrJajbE/AqnyZfyUeIcUcNXN9
   gdyidF0YhvmhScP5rvOoFC1SQqFZPhibfGXT/MvB98UtcB3GvN/Hqdsip
   mwW7fwQcYHaRZaVWvChkCR2glfTGlngBPN1PJDsvXv5qfofr8DlgBSMz7
   zYMvEpPM/U4zkCYu9T4kLy1iIPZkc1Mi7hCs5TFXyJLyr8DYgHc3DrB5s
   eXNPqyvQon1qyGxNA2jyMKnKNfloCxqk1KK373GOGVy5qKEVfTJDyeNjU
   A==;
X-CSE-ConnectionGUID: ycQ9Av1gQti25pk6oyVOHw==
X-CSE-MsgGUID: qoZzZEf9QsKBcVwQfvySMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="173852153"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="173852153"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:00 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D00AD6EAD
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50C78F310
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 111A21A0078;
	Mon, 31 Mar 2025 17:11:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/26] python3-inline-snapshot: upgrade 0.20.8 -> 0.21.1
Date: Mon, 31 Mar 2025 17:11:35 +0800
Message-Id: <1743412308-21887-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116414

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.20.8.bb => python3-inline-snapshot_0.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.20.8.bb => python3-inline-snapshot_0.21.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.8.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.21.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.8.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.21.1.bb
index 9b63a40fa6..eb22ec5a3f 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.8.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.21.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "52373c15b63097215d1136f292962553f325a5e966957b489fe4326d6fbc77c0"
+SRC_URI[sha256sum] = "00416168403740b439d5030f7a769373375a5ebe718cbbf25f909b9b89c505ca"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


