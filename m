Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 358B1C369A3
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.43041.1744017452424980640
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N6C4cTiI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017453; x=1775553453;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cb6H7TgdsEF6aXDtVER8COIzwa4fZRm15W0prXLfO2o=;
  b=N6C4cTiI+WiCRXGUaQ+W9RNaLAWFdBB/m8U2rvO+hrFbW16FUSG7iLFK
   BzCOdgNgJJzPA55KsJfYsSuR/4yix7g/hHrem9eURhQsQf5CExKA/ZNPl
   NwrdJMPKBP88GR61fdn00WEiOhx/CWcq/FutQ7VnFVBfabS/WJnAsgYT9
   BXHt2QZn8MdJ4iYBM5GXE32S45AUzuRic7/Ooe4+DoTudHTsAihv8ijIp
   vMfSZU3je63WXgIEsO1FCK+0l532MucPUC5eKNhxUNk2K0R9s4U58QJke
   MRw6vIfmbFE3hbvs+7Egto1KNQft8k7/oLOQBZlxytn/dz9tMSFnAhX6x
   w==;
X-CSE-ConnectionGUID: VF8IgPsUSWufJJdHKWO58A==
X-CSE-MsgGUID: HhqoAk5OToKx+4lC4K06Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195986455"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195986455"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D36DD6EA5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2F5E0D5086
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:29 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AEF151A00A1;
	Mon,  7 Apr 2025 17:17:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/30] python3-virtualenv: upgrade 20.29.3 -> 20.30.0
Date: Mon,  7 Apr 2025 17:17:09 +0800
Message-Id: <1744017431-22217-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116653

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.29.3.bb => python3-virtualenv_20.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.29.3.bb => python3-virtualenv_20.30.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.29.3.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.30.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.29.3.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.30.0.bb
index f60c0ba8f6..4d259bc9df 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.29.3.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.30.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "95e39403fcf3940ac45bc717597dba16110b74506131845d9b687d5e73d947ac"
+SRC_URI[sha256sum] = "800863162bcaa5450a6e4d721049730e7f2dae07720e0902b0e4040bd6f9ada8"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


