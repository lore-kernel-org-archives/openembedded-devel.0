Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3101EC3601E
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.61525.1742893329607333293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JdFbZ3Sv;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893342; x=1774429342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=A3rw9XS4GAeMVV93MeIVFdj/XsTchrSoFMG6GQ6DRSo=;
  b=JdFbZ3SvZGubKpU7x7POTb+fKI14+KuTqaoBngUs1RbOHOgFMI0QNBFa
   /SfE4buSA6mQYvjBkl0rc2pgAZiMHMOpotNwh6447l7qESiuGU1UieMo6
   Uj/reoxB/f4MvBE1cy3SvETaosJUX7G4S9brYSnxCWscC17jIX48eikZt
   Kq85JbA6WS5K8uXc9cSWy0EpWFpuGZPOXFGhZObW3KbRWB0IUM7Si8qhq
   IeSEoaRUgd44tUpJ1dYDXVRebiqp21mw5KShnEaMLNMX0r9GGofoP01R9
   7KhXqvDz8iz8z3yUY4YwrpSCFg28uHqRxweOpDLNt38vr3M4HIIY1R6Tr
   A==;
X-CSE-ConnectionGUID: dPhKMhgzSXC+yn51KY+58Q==
X-CSE-MsgGUID: y+6nYo9qQuWi1vokBRMYxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182576328"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182576328"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 316FEE8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E2846D50E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A319C1A00A2;
	Tue, 25 Mar 2025 17:02:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/45] python3-inline-snapshot: upgrade 0.20.5 -> 0.20.8
Date: Tue, 25 Mar 2025 17:01:38 +0800
Message-Id: <1742893312-3809-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116255

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Do not skip snapshots in conditional marked xfail tests.
- Tests with failed snapshot comparisons now always result in a pytest Error,
  even if snapshots have been fixed or created.
- inline-snapshot now also works if you use --no-summary

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.20.5.bb => python3-inline-snapshot_0.20.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.20.5.bb => python3-inline-snapshot_0.20.8.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.5.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.8.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.5.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.8.bb
index 0e4807b856..9b63a40fa6 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.5.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.20.8.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "d8b67c6d533c0a3f566e72608144b54da65dc3da5d0dba4169b2c56b75530fb5"
+SRC_URI[sha256sum] = "52373c15b63097215d1136f292962553f325a5e966957b489fe4326d6fbc77c0"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


