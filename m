Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E3CC87FD5
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.49375.1753918172614626073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nVwDOPhf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918175; x=1785454175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3I28jlg5q6HmndU4j2C3vLiROKdwxQK1IBdGo1bglyI=;
  b=nVwDOPhfO6FQzbLpbqo0gkACGgcb2cZ3i6a6pAUFTXdKnX4dO7iK7Nfp
   NiKqudPd3aZ8jvABjjfCd0r+iQDp9DXMMrWgqLwZidiuQ1c2mTx7ZrZGu
   vgXhuKeJMJXLXMypqExPCMdqN4bze/eMOY0lYN5lzwK+HgdGaZU1Ab6a0
   9aqyRrrGTsWILzKJ5Zg+ywLvdeMV+asxutjbouE2xxy+AulxCCU/L3iu+
   dlP/9/BhFgLmbVAy1oxtKERndmYS8e6qr3WDBsPpmldou4+TOvz/6A/wJ
   ntQ+qgNUHQUdwDgicpaKmMYY6O19M4pP8+M75Qhn3tsfgrhc9r+CK7Ajg
   w==;
X-CSE-ConnectionGUID: AXn7ZgpcSV6Fzc7rBUB8ZQ==
X-CSE-MsgGUID: Hwpny4AmStmjTPkmlrQKvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="195354480"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="195354480"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:34 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 7AD241C00086
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:34 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id D43D710001F7
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A7C551A0090;
	Thu, 31 Jul 2025 07:29:28 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/40] python3-snagboot: upgrade 2.3 -> 2.4
Date: Thu, 31 Jul 2025 07:29:16 +0800
Message-ID: <20250730232923.522-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730232923.522-1-wangmy@fujitsu.com>
References: <20250730232923.522-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118805

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- treewide:
  - modernize and expand CI tests
  - drop support for Python 3.8
  - use importlib API to fetch resources
- snagflash:
  - fastboot-uboot: support comments in command file
  - correct parsing logic for "fb-size" parameter
- snagrecover:
  - add support for i.MX91 platforms
  - add support for Intel Keem Bay platforms
  - support HABv4-closed i.MX SoCs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-snagboot_2.3.bb => python3-snagboot_2.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_2.3.bb => python3-snagboot_2.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_2.4.bb
index dc57dfc105..9c6c776685 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.4.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "c6a97ea0c83a2d7eea639741b2f667c75e95d50278eeb6a8adbce5d1a7cf65fa"
+SRC_URI[sha256sum] = "651e9bcc2e43d3fc67cc1cff5b812e3bfb4ed132f4fd7fc1dc5e3fea31a7406d"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


