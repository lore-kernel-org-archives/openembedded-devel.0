Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFDF2C02186
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:12 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.40067.1736843352103773249
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TfQynKzi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843352; x=1768379352;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=altseZ3vcfEH+1a6UQRt14AbyK/svnvRNACLFWtetGQ=;
  b=TfQynKziu2pSJCjARitFMkkaA0dVG1j2qXjFmXDtj2X9PbJfSFiXRK6K
   e+Hjm4xtT0Alh8GjK0JZLHjcDLGFLtQbuEq2OhjhA5jL6S8QCCJJJFl8H
   vgxny4HW3h7bHynMqZkNbKs5yn5FB1/BV3S3q6EUS3jL7Q8uY6IE8KDF0
   0K0NBwwwWh8cIo6KUDEAf+jonQU20rzHfUyda0OTgizkrYVxrFy2V7q2c
   M41eyK++rVGZN3JYT4Xa5xix5g+YER9arFQuTM9YWgxFnkzD3yYfWnLW5
   a7JqjcVBihpLNQKIO43bRvJZnuUMxgn6M3a8iX4UXhyxQSe/kukTduUz7
   Q==;
X-CSE-ConnectionGUID: ncaK3LdrTGukCFrxg37Fig==
X-CSE-MsgGUID: J/ztRKQhQNa24ialZtnhKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="174471864"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="174471864"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:10 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8A1AE8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:07 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEBC6D9692
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4967C6B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EB6FA1A000B;
	Tue, 14 Jan 2025 16:29:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/30] python3-cmake: upgrade 3.31.2 -> 3.31.4
Date: Tue, 14 Jan 2025 16:28:35 +0800
Message-Id: <1736843329-4131-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--7.186000-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeUxkLdkW7C5qlE5
	i6jtS+HHD3PdJb8HFeDX3D+q3OjYee1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ2uX
	Hvx4h0c1l76kpJqmyroAy6p60ZV62yA7duzCw6dLdB/CxWTRRu25FeHtsUoHuHciODsBfjt5W80
	wsMMAVgt1T6RsFotA7BLkyFIQd6eJYKVgm72vjJg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114859

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- chore(deps): bump the actions group across 1 directory with 2 updates
- chore(deps): update pre-commit hooks
- [Bot] Update to CMake 3.31.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-cmake_3.31.2.bb => python3-cmake_3.31.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cmake_3.31.2.bb => python3-cmake_3.31.4.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.31.2.bb b/meta-python/recipes-devtools/python/python3-cmake_3.31.4.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-cmake_3.31.2.bb
rename to meta-python/recipes-devtools/python/python3-cmake_3.31.4.bb
index 2c2cd02627..2f199d7cde 100644
--- a/meta-python/recipes-devtools/python/python3-cmake_3.31.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cmake_3.31.4.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "cmake"
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
 inherit pypi python_setuptools_build_meta
-SRC_URI[sha256sum] = "16a323fcbb86cf8a10aea82cd4deecb33edb3ed7e8907be8a06933ce04f6e6d1"
+SRC_URI[sha256sum] = "a6ac2242e0b16ad7d94c9f8572d6f232e6169747be50e5cdf497f206c4819ce1"
 
 SRC_URI += " \
 	file://CMakeLists.txt \
-- 
2.43.0


