Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A48CFC525
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.50342.1728896172937051476
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E9ca3h82;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896174; x=1760432174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/G+CDLDP/A40CWsgN8WnIQoYTnwnnUxpKOeLBNNEuTc=;
  b=E9ca3h82XV528OkAsTEdOqAc8AefmfqVMFHq7LIwx3m4sfnUEQbSaVxG
   2Y1cXGUAsx9s31b5eZbyYkhKl2tC7giCVep6LBBbd9yllIyAOn9+IIOJv
   pyr+b6Wz0sySKMsrRZrCH6qmJA7jHUoiV0lQPlYpVi5PsWRZp/FKwrtgU
   /2UizQMQJNsIyQ9W69Ap95udYKbWOa+zQS+JqcEWsxHYvB0PLLJpuW6Ks
   zrqkU66inHKT6jwL36W86s1/wBfZeVAhh9Ms7L8TQn1fmvGsPQgUOp/DS
   WzLpK72Pma4tTlhRWhR0XZ5bq72RrX0AVIu20antAiZcx5+6rbCSdRHeb
   A==;
X-CSE-ConnectionGUID: bNWrhToQSAGMtpJz0Wys9g==
X-CSE-MsgGUID: CtXoelJ/TtajyEj3mBaAZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="155665609"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="155665609"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:11 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E5CECD6DF
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 82BC9CFBB0
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 18ACE20071A28
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D48961A000A;
	Mon, 14 Oct 2024 16:56:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/54] python3-pdm: upgrade 2.19.1 -> 2.19.2
Date: Mon, 14 Oct 2024 16:54:51 +0800
Message-Id: <1728896115-2944-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--2.147900-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mruoYFb0nRiqNGQgIVrmBL5FAK
	yZ8B6Bt05ZHdquAwKoFRzi+uKjH4IYw/Pwahrp9dxvp0tuDMx3kEa8g1x8eqF4Ajsy+r+wvnADP
	a8EfcrDPMhUaJFwSSaUrFr2FVZxb3HY/bzRmIaZE/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bqSdDmDK09MpiExNx1Upv4V4HMSQIKmdGZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyHEqm
	8QYBtMOUWLqRZHT/uEM4w4cUHTiTuydIzMzuFSsubFZqQJdNjKhFS9Ys8KS0T4tUmxUULJIJ1l1
	fZFaI7aUc/4NKPMKJVGnnTut9dJOgr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112880

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Support installing free-threaded Python interpreters with the t suffix.
- use_uv fails to lock when there are non-ascii characters in pyproject.toml on
  Windows.
- Fix the pre_install and post_install signals receiving an exhausted generator,
  instead of a list of packages.
- Create backup file with random filename to avoid conflicts.
- Fix the logic error in the uv format marker matching.
- pdm lock --check on a lockfile generated with older PDM version has a 0 exit
  code when there's a change in pyproject.toml.
- Fixed Bash Completion suggestion so it doesn't require root privileges

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.19.1.bb => python3-pdm_2.19.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.19.1.bb => python3-pdm_2.19.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.19.1.bb b/meta-python/recipes-devtools/python/python3-pdm_2.19.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pdm_2.19.1.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.19.2.bb
index 245e76014..29c70d18e 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.19.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.19.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "7fe235a9cb27b7ec17b762dc85bc9ae71e0776e4b7a8b6f64203f24bb915aa2c"
+SRC_URI[sha256sum] = "efb39264569181d0375536ef81c556648f16b540d429a53715730490a2283567"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


