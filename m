Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E21C3ABA4
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.35427.1745311775402904762
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IbBxz8sE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311775; x=1776847775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zOm3EU4nJx1ZAFIunDa/FrftCByBdzy/FPb98jt8tJM=;
  b=IbBxz8sE3tsafiDnc1iNQ/B4qBrpOJWLc9HChV9z86RCrAX38eNbgty/
   hleYreIJWJlAVdHxKtjyG3VzYYSn7Sn4QTlSk3mSeqSm6oyWEtvuyFnCt
   A3TLZH7+mOn0UcSufFged9o/37EVdXqAZ1HnLeIDgJdFWdURC6IobXUSp
   fs1oCqsyIArEJPi9KxfPYVThpu6vnuD0PKhaSLcSCBAhWZQhQ5WdMnl9a
   OZn6Rtkg49Qc0jVjn2Q5ISEkPYbjRHvpzV5DmkppD93Zg1dekBRsTVAaK
   4gi1VsGbM1NwFqDJSsDEP7G+9gCnBhMyUwKsk7XwmeyKPbM2W/W0y1QMu
   Q==;
X-CSE-ConnectionGUID: NApnhSQiTwe/xbEUzCPRRw==
X-CSE-MsgGUID: M8ZKTu6ISpi2ztZKq27JnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="176756778"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="176756778"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B989896741
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 77A77D3F34
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 36E161A009B;
	Tue, 22 Apr 2025 16:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/30] python3-aniso8601: upgrade 10.0.0 -> 10.0.1
Date: Tue, 22 Apr 2025 16:49:02 +0800
Message-Id: <1745311761-1912-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117028

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Moved to Codeberg: https://codeberg.org/nielsenb-jf/aniso8601
- year_range_check will only shift 0s in from the left for year strings of length 2. Since parse_date throws an IsoFormatError for year strings of lengths other than 2 or 4 this shouldn't significantly change any public API consumers.
- Specify changelog location in setup.py
- Change to Woodpecker CI
- Add a CI pipeline to test builders when a tag is pushed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-aniso8601_10.0.0.bb => python3-aniso8601_10.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aniso8601_10.0.0.bb => python3-aniso8601_10.0.1.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb b/meta-python/recipes-devtools/python/python3-aniso8601_10.0.1.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb
rename to meta-python/recipes-devtools/python/python3-aniso8601_10.0.1.bb
index 4fe18d18eb..8996c4b26d 100644
--- a/meta-python/recipes-devtools/python/python3-aniso8601_10.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aniso8601_10.0.1.bb
@@ -3,6 +3,6 @@ DESCRIPTION = "A library for parsing ISO 8601 strings."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ba35a7f4192a3ea09a01f4e8169a56bc"
 
-SRC_URI[sha256sum] = "ff1d0fc2346688c62c0151547136ac30e322896ed8af316ef7602c47da9426cf"
+SRC_URI[sha256sum] = "25488f8663dd1528ae1f54f94ac1ea51ae25b4d531539b8bc707fed184d16845"
 
 inherit pypi setuptools3
-- 
2.43.0


