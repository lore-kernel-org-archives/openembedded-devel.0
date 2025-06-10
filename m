Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9CCC7115C
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.78439.1749526433911033951
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ky/h9D6U;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526435; x=1781062435;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bWaPJrIxYZ5S0SoI+HgtnjyxFIUYhPD7j82oZFJrAJo=;
  b=Ky/h9D6UDdR2rF3fB26/TWe2c39OnD4bprYOG280T2HZkCmGg8NluUcz
   mizXbFcwXyZlf30RW6sDhYzrFypwHYWrfPGk1DrLkgiyE2NiGpTFtAI7F
   wrEbppRpsw8mdk3aTLRyyeXe4fyEMqu0hizVi97SvzYkZSXo1NuuKTR+U
   +zl7l71T+HUef0/fxt2lA4TM2LXnxOizRlrvDE5x9AeV9EIvGEpVb4OS/
   ndlmi4wnmzQsvNsMLiUPX/KaoSQquhIqhdYMmL/L2ayRLuBCJ3cJ7DSUg
   YPgj+dm6qwqVykgIMhiQRf0J3h2ahsKNjIIXBrHUAirS343JfL8VX8l7v
   A==;
X-CSE-ConnectionGUID: UJ5ZgBgnQjmIFD82i3RxRQ==
X-CSE-MsgGUID: mIylAshfTtaMFSo08v9mgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202196194"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202196194"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:52 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B860D5004
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EDA71D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:48 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7B9401A009B;
	Tue, 10 Jun 2025 11:33:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/64] python3-inflate64: upgrade 1.0.1 -> 1.0.3
Date: Tue, 10 Jun 2025 11:33:06 +0800
Message-ID: <20250610033330.924-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117834

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- Add readthedocs manual page.
- Publish Python 3.13 wheels.
- Fix GitHub Actions CI/CD script for aarch64.
- Published to PyPI using GItHub Actions as a trusted publisher
- Add GitHub Actions CI/CD script
- Drop Azure Pipelines CI/CD

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-inflate64_1.0.1.bb => python3-inflate64_1.0.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inflate64_1.0.1.bb => python3-inflate64_1.0.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-inflate64_1.0.1.bb b/meta-python/recipes-devtools/python/python3-inflate64_1.0.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-inflate64_1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-inflate64_1.0.3.bb
index 841c9239a5..a6f0c67ab8 100644
--- a/meta-python/recipes-devtools/python/python3-inflate64_1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inflate64_1.0.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 inherit python_setuptools_build_meta pypi
 
-SRC_URI[sha256sum] = "3b1c83c22651b5942b35829df526e89602e494192bf021e0d7d0b600e76c429d"
+SRC_URI[sha256sum] = "a89edd416c36eda0c3a5d32f31ff1555db2c5a3884aa8df95e8679f8203e12ee"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.43.0


