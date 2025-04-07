Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9FAAC369B2
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.42478.1744017446860559298
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k/LFhrJw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017449; x=1775553449;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=bdyTkfH4XhaZKHbTJiK54h4qaIzJqWkQ3M19SjOLDPQ=;
  b=k/LFhrJwtPldpDoenBQtPRYJs0+CdskvDfX3tBNd9DP6DXmAM9AZammx
   A6+XC92/GE/DS5hnb1MOJE5Bz8zx0CLt/l13UM63qhVOWFXsM6Da1zBtD
   HO84CLCi0Th6b6uFlL5KGX1pNsi6CJ7OP3q6kmu3sbyMOTzb969Z6D0gG
   rlCm1nkNwTZ6CkiwuHactoAlhoJAlRzn/XdFagIO0FOdOdjptmCPOCpnC
   L/ubWoLbRBP9pqSvQYVtHPqjIIygjP4tY8ik+qQdyweo2ZLAKQu0A1D/7
   0jA/9/qXz253VE8aJvC17a9SBto+/QJkEL3dTEYmYvKcMjgyym38o2lTt
   Q==;
X-CSE-ConnectionGUID: tLhYfCQiSNaOLZYrbpBOFw==
X-CSE-MsgGUID: tawWr3NoQDONfE+foXEVJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="184053189"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="184053189"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:27 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AF404C2264
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FBFED4C36
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F234A1A009A;
	Mon,  7 Apr 2025 17:17:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/30] python3-fsspec: upgrade 2025.3.0 -> 2025.3.2
Date: Mon,  7 Apr 2025 17:16:54 +0800
Message-Id: <1744017431-22217-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116637

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fsspec_2025.3.0.bb => python3-fsspec_2025.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fsspec_2025.3.0.bb => python3-fsspec_2025.3.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-fsspec_2025.3.0.bb b/meta-python/recipes-devtools/python/python3-fsspec_2025.3.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-fsspec_2025.3.0.bb
rename to meta-python/recipes-devtools/python/python3-fsspec_2025.3.2.bb
index 7c713d5caa..623f0a7ed0 100644
--- a/meta-python/recipes-devtools/python/python3-fsspec_2025.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-fsspec_2025.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/fsspec/filesystem_spec"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b38a11bf4dcdfc66307f8515ce1fbaa6"
 
-SRC_URI[sha256sum] = "a935fd1ea872591f2b5148907d103488fc523295e6c64b835cfad8c3eca44972"
+SRC_URI[sha256sum] = "e52c77ef398680bbd6a98c0e628fbc469491282981209907bbc8aea76a04fdc6"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


