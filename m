Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25D37C3600B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:39 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.4171.1741683337729522614
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Xvb66vFm;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683337; x=1773219337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i2fx/YqTAKKb6aLh0jtuOjJn4QrGTSHjsm29LKl4Q7o=;
  b=Xvb66vFmS+RwWw8YXrh+JKq6a0kV2jP686Lgqh+zak+beqgB4SQYSmis
   bw2hic57esf9VCE0iv0jxi/nmtAiRtPBqNFBzHBTLMatg64NkxrXyx6XO
   dI2a/LoZ/TIQwLfLRIOlAEQ0jeNTt3VDXD77rFQl/O0EEQiLRrYYWetqs
   Xa2YF+cha3hwV+xWsIstZg6TOfaFXkyhafwew6MWW4oKx8dj3fB03FptR
   J+MMPKRS4PtfTWQWBgQuZmWul08KwRSXgAAkqd4RA5iJJOCSrGfwSbSmu
   bFk3DUz67Guo3Pa7HSpM7Gcr0STGhOkIqitJ6/Sgn6UzSWvnRRdOgMZ4m
   A==;
X-CSE-ConnectionGUID: heJYd4F0TS2RVyNg9YrX9A==
X-CSE-MsgGUID: mHVg1YmbTYqUH8lcS5uI9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="171563524"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="171563524"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:35 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 95FABE428A
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 56F92CF7E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:33 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E6A281A0071;
	Tue, 11 Mar 2025 16:55:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/36] python3-tzlocal: upgrade 5.3 -> 5.3.1
Date: Tue, 11 Mar 2025 16:55:06 +0800
Message-Id: <1741683310-8681-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115885

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Now only warns bout /etc/timezone if it is actually conflicting with
  other timezone configurations.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tzlocal_5.3.bb => python3-tzlocal_5.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_5.3.bb => python3-tzlocal_5.3.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_5.3.bb b/meta-python/recipes-devtools/python/python3-tzlocal_5.3.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-tzlocal_5.3.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_5.3.1.bb
index eaa80e83f7..3d27588cd1 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_5.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[sha256sum] = "2fafbfc07e9d8b49ade18f898d6bcd37ae88ce3ad6486842a2e4f03af68323d2"
+SRC_URI[sha256sum] = "cceffc7edecefea1f595541dbd6e990cb1ea3d19bf01b2809f362a03dd7921fd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


