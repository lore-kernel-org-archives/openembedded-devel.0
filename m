Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A25C369A1
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.42484.1744017453068265870
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=d8cS/Fxe;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017454; x=1775553454;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pjO4P7HyDJzzGCnrPU1hGVSMA/29+X8hH+8cOF5RFlI=;
  b=d8cS/FxeP0ezCkZ/9AzjBDO8uMps/6A8imGfD/vDSFS40UYocn04AO5D
   cEJeZGU0KttynETMdKd2i+rlIxrhLgWWkeqHMEz2/nafKmjPLYwh3Em2S
   LeKay9bc1zAUilTWruac+3dBR13/pRunA6otxZR5Wre6vJ0gsnxIv5h/s
   Cs+aLz1hpDqnqE2vrfknHs+lOy1GWOxBw65aAFkUy3xa6F9wCAgltEq4H
   mRthyQPSPXC+svRQQC7wEQ+otbhsxrHgyCuJDW1rlvhkY0/XHD+t0yi6r
   UOirhuyM9L4/6GmTCZ66ZWbXH7EZXfpmLrjo4sGeZGSwOasDk9nXhZ1eh
   g==;
X-CSE-ConnectionGUID: pXOTSBL3TmyqckUsMCawpw==
X-CSE-MsgGUID: 0XBZYKG5T4Oh+83N0S+gIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="175116333"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="175116333"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:31 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 044B3DBB80
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 75846D4C39
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 32DD41A00A0;
	Mon,  7 Apr 2025 17:17:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/30] python3-snagboot: upgrade 2.2 -> 2.3
Date: Mon,  7 Apr 2025 17:17:07 +0800
Message-Id: <1744017431-22217-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116655

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-snagboot_2.2.bb => python3-snagboot_2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_2.2.bb => python3-snagboot_2.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
index 07b9a5208c..dc57dfc105 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_2.3.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "00f4933cb52fb73dcf61a0723d77d9d6bc509affb7cd5d5dcd875d2c333e8b08"
+SRC_URI[sha256sum] = "c6a97ea0c83a2d7eea639741b2f667c75e95d50278eeb6a8adbce5d1a7cf65fa"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


