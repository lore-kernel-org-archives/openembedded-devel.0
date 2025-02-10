Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926B3C021AF
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.46463.1739178119900890855
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JjYAFTEb;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178120; x=1770714120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DZSsLqXgT9AuN2WfrRDn+TMb1goYMwDvTUzw3iaSP4w=;
  b=JjYAFTEbgcFg48s2d/bNU1HwHX2q6hsT+X3dqcSUzbyclw7/MuBIf9qs
   TMWbSkBXgi4G7JFBiuHD0XWlZnusHsO7jZSRVGB2tH4Qr+pKHvLDI4G+Z
   G5U6WvQbYOy1vw3S3sQC0KxWr4UUvHLkPAqgan2Mfv6ZPP6e05Lbd2faL
   GqqxzJ6160WisEfQbE7jT/g+jpCoG44hSYaPIGYRd6pgUoP8CvMC6lo7L
   lHTwWKJG9GNytzBYVt03Dij2OQS4PnXGFOWfDWtpV15J+GHPoEkzJO3DF
   NaXTEfgEnj47eYDGi2YPfzlYyh5uwInjPDSW+s+mZovwzU5NYYmRtj9me
   w==;
X-CSE-ConnectionGUID: 7W4T4d/FQuikzHonXj4h7A==
X-CSE-MsgGUID: U6BWONotTmqx6D9dcPaa2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177845826"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177845826"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29365F2A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E50A4D5089
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:55 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 869B91A000B;
	Mon, 10 Feb 2025 17:01:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/66] python3-cantools: upgrade 40.1.1 -> 40.2.0
Date: Mon, 10 Feb 2025 17:00:57 +0800
Message-Id: <1739178095-26432-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115354

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 monitor: container supports singleline formatting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-cantools_40.1.1.bb => python3-cantools_40.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_40.1.1.bb => python3-cantools_40.2.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_40.1.1.bb b/meta-python/recipes-devtools/python/python3-cantools_40.2.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-cantools_40.1.1.bb
rename to meta-python/recipes-devtools/python/python3-cantools_40.2.0.bb
index 0267e895e1..e80ee2be39 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_40.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_40.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "b1731da5e6997661084c6019d6cdcb3773868c035ed8a728126cf8c6f31a2368"
+SRC_URI[sha256sum] = "fc75f9fe5b37ef992fafdf981ff822087e1baf18162bbbb35d8b0b1321ed72df"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.43.0


