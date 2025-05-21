Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C18AC5B554
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6738.1747817995896623808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LMhMfJAL;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817998; x=1779353998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UEHmkN7F1OYzKTC/SntnwDrlN5ENnvGm8usxKRlMMvE=;
  b=LMhMfJALjlLF8ShRPpMyjShL1s7s3NEbo3itm0JGcEZrhQ2tav7ycdPS
   +cwiK32/Wt1rfXHtuxyrfOmcigbRd+reEkFw+a0LsuEJvAJb6BK/M+P7U
   kW+VMfHj/yg0zUunncywl3fWGceakmHk+hew/qB9SdzPcWYnsaZicmTjg
   aVgzwrcawOYifjTU4dN7ncMR2Vi346mQzHoC16mHSQ7xIY4fBCfvdMT/0
   Mk4z+g+GGJdOwovdxpNaJdb08ZR7Nq7f5hQhV9HZJxoI7NrALqpYG7VGG
   dqdGtuXv1cdrqOjK2bskIwFOnh8i/A9wYwx8ooDSuhBYcCtkGF30aNEUo
   w==;
X-CSE-ConnectionGUID: kwR9rslqQkmMpb+kJRdNwA==
X-CSE-MsgGUID: BjXgcZj4QhKvZ2D+sgfLZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152531"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152531"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:57 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4138CD8E64
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 032AED8B94
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 88E781A00A0;
	Wed, 21 May 2025 16:59:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/43] python3-humanize: upgrade 4.12.2 -> 4.12.3
Date: Wed, 21 May 2025 16:59:05 +0800
Message-Id: <1747817972-28874-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117540

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix regression in naturalsize for float and str
- Improvements for French translation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-humanize_4.12.2.bb => python3-humanize_4.12.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_4.12.2.bb => python3-humanize_4.12.3.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_4.12.2.bb b/meta-python/recipes-devtools/python/python3-humanize_4.12.3.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_4.12.2.bb
rename to meta-python/recipes-devtools/python/python3-humanize_4.12.3.bb
index d5dddce857..7b32cfba56 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_4.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_4.12.3.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "ce0715740e9caacc982bb89098182cf8ded3552693a433311c6a4ce6f4e12a2c"
+SRC_URI[sha256sum] = "8430be3a615106fdfceb0b2c1b41c4c98c6b0fc5cc59663a5539b111dd325fb0"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


