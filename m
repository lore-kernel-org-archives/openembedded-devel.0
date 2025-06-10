Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5147BC71149
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.77949.1749526421447129700
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fbHw7fLJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526421; x=1781062421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GT8tvY2xJ5bLfnrIvNaYpggZ1Thx5Pg0YkjEu0YdK84=;
  b=fbHw7fLJPROot+6zS4vBt7ywex+0TWPmsBGz8dPTHCuLI6i5aoKA4vo6
   rsZ0NP0SkT/k6hLPCSYTgFjScpI9sSsldAnpKNcANhwMqU3lEK2kzra0C
   +OPodq4PjLhQUz3uwsSVF1BVlZ3u+Mb6pffQl7lA0bIsVGvh09dAhYunv
   aVBckb0K39XDFXnq2sm0j4Qj/Z8UuASg4eIl/89Jvp6C27z3bLMdw0qmi
   O3UxctoBU5iJy2ih4mKXYP79Q4Ou1P3a3rnjx6YV94IfU+TMibLJ4TBou
   FXcpfv2d9rvXf0BqojOZ1G9ANzClI6n4UhKHEE8UKwqdXJnqVhb+8+d5y
   w==;
X-CSE-ConnectionGUID: vv+EEXwIQ02d1c2TIw79pQ==
X-CSE-MsgGUID: XQjaIdG8Ttmw9hr/Rj/xqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181135303"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181135303"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:39 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 01F4E16408
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ABC1D4C19
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:36 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2A78E1A009B;
	Tue, 10 Jun 2025 11:33:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/64] cxxopts: upgrade 3.2.1 -> 3.3.1
Date: Tue, 10 Jun 2025 11:32:30 +0800
Message-ID: <20250610033330.924-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117800

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Added missing version bump
- Added missing header for GCC 15
- Fix some CMake packaging problems

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../cxxopts/{cxxopts_3.2.1.bb => cxxopts_3.3.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cxxopts/{cxxopts_3.2.1.bb => cxxopts_3.3.1.bb} (90%)

diff --git a/meta-oe/recipes-support/cxxopts/cxxopts_3.2.1.bb b/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
similarity index 90%
rename from meta-oe/recipes-support/cxxopts/cxxopts_3.2.1.bb
rename to meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
index 6077220151..8df707b86f 100644
--- a/meta-oe/recipes-support/cxxopts/cxxopts_3.2.1.bb
+++ b/meta-oe/recipes-support/cxxopts/cxxopts_3.3.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8de00431559a76a1b43f6fd44f8f6689"
 
 SRC_URI = "git://github.com/jarro2783/cxxopts.git;protocol=https;branch=master"
-SRCREV = "4bf61f08697b110d9e3991864650a405b3dd515d"
+SRCREV = "44380e5a44706ab7347f400698c703eb2a196202"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


