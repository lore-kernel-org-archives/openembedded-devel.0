Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E2CC3601B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.61534.1742893342203871676
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nCMCCfVO;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893342; x=1774429342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FtaHtk3uyRlIgC0EkuLAZPxkN24fS9E6jfdSst6cB8I=;
  b=nCMCCfVO46C4nqU7JBzZKWYLrEaYupty26DrqCgTPnOTBDge19JgtKxz
   SbjUyXbXnuo+Sp/0E/jW/X9vx2ey+VwSJsK0gF29eG+yYtOKqbxwYKNub
   MiAiTawlOjLsJ2okoLIogmwaG9vh4fql9ygn7yTd3gLNBySZcpkV+/3WF
   TIxgcU3eWHQ8uoM9KcajnBKO/TK+mL44G4eJJ1bymoZRfj3rO9bKydQFe
   Ku3UBKfYttAsnFXkhv8ACiozBDzPltQzyRkkhzBIKjW7uHu9invuswSzX
   /j0yyaHos4kKjPPN2NPM3qm2ci0c1DjIPwwrswD51k7HRNyP4bvp5TVTS
   A==;
X-CSE-ConnectionGUID: UQAI9UhnRSaMLjQT7S4bsw==
X-CSE-MsgGUID: E9nWT2NRTV6UAvQ7GG0sQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="173063661"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="173063661"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:20 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 367A5E68B1
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F11BABDCAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6CC701A00A1;
	Tue, 25 Mar 2025 17:02:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/45] python3-huey: upgrade 2.5.2 -> 2.5.3
Date: Tue, 25 Mar 2025 17:01:37 +0800
Message-Id: <1742893312-3809-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116256

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add support for a new SIGNAL_ENQUEUED.
- Use FOR UPDATE SKIP LOCKED when supported by the database in the sql_huey storage engine.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_2.5.2.bb => python3-huey_2.5.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.2.bb => python3-huey_2.5.3.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.5.2.bb b/meta-python/recipes-devtools/python/python3-huey_2.5.3.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.5.2.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.5.3.bb
index 7829555b90..cb033712d9 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.5.3.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "df33db474c05414ed40ee2110e9df692369871734da22d74ffb035a4bd74047f"
+SRC_URI[sha256sum] = "089fc72b97fd26a513f15b09925c56fad6abe4a699a1f0e902170b37e85163c7"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


