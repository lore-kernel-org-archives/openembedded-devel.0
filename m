Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBF8C369BA
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:53 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.14430.1744794163805344746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b2aEVGoo;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794164; x=1776330164;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=AlzCM6U4fPAsC4NhwEEYU44ZnTlFe0QysfrX/CUEAC8=;
  b=b2aEVGoo0NvMMAuDy6BdqRtygvVDIr8BqyHvEsqX4St0JQO8O6FUiZUf
   XHybnJKI1tc7AQ4628PszQnwqmBULhPcKS+Lv1HeO/Glrw34gBuaH0H9N
   +hYeT0pPC/rvnL30F3PAp3NkaII1xxNIgpl5DSP6d4RIQbz3pUuSag12m
   oKwhJpTopZ0qccBa1bJZz1I5UzsOQSkB9rKf72iU3TuDLBDXC0zBGzeIO
   klpb6cIRJ5yPT/axIjxlVR4WCjUBahNuiKl7N2XyfywDSja9D3jayJB4c
   YXSju0eLnBg1AuIpkXikwM7RqG61eV/Fxi4MoypUwbMSMn7OwbNxgH8Ce
   A==;
X-CSE-ConnectionGUID: ajLylEKiS8ms26s6EID5Jg==
X-CSE-MsgGUID: FQPsWq+wTDy8yDD7E9dgdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="199436266"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="199436266"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 04ED096741
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id BB182D50F6
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7523C1A00B0;
	Wed, 16 Apr 2025 17:02:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/31] python3-asyncinotify: upgrade 4.2.0 -> 4.2.1
Date: Wed, 16 Apr 2025 17:02:00 +0800
Message-Id: <1744794136-908-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116899

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-asyncinotify_4.2.0.bb => python3-asyncinotify_4.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-asyncinotify_4.2.0.bb => python3-asyncinotify_4.2.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-asyncinotify_4.2.0.bb b/meta-python/recipes-devtools/python/python3-asyncinotify_4.2.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-asyncinotify_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-asyncinotify_4.2.1.bb
index 839d325966..f95dadff90 100644
--- a/meta-python/recipes-devtools/python/python3-asyncinotify_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-asyncinotify_4.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitlab.com/Taywee/asyncinotify"
 LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f75d2927d3c1ed2414ef72048f5ad640"
 
-SRC_URI[sha256sum] = "dac1d75e16a4919c6eab84a90ff51218db622c5524a84a5c501a0b62ea7ec7ea"
+SRC_URI[sha256sum] = "8078b0b0d81c19043141ab0fc5654e89a4d3023dc3e4486aaa245b1ff5f5ddc9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


