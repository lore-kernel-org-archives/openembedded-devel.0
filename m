Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D13C369D3
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.14424.1744794155551803557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AUiq9ygj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794156; x=1776330156;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f0shtcKGajI7xOvYcDBqHrtbKX9ATyd9xUzPOPqY3Gw=;
  b=AUiq9ygjRZ5Zs2B4XEt/ITUvwhiDaGrgJgjjpJizElAbe0WpsiEql7kI
   zlcExDJItGnuh+JCYdN4S55ZKIEPLHWlx3US9SHVD634pVTB1CMbB9BgZ
   +M0HZ8sjZp+APzTzoDjQtxJsRhh260JBIjNmACPetyFx2Ly05l2n/bKDs
   u9Cryw8M2768r6Mm3BUcoRDCOM4anqs4fGQgW7sUTsdsuD11g1i7Bz5cy
   Z58lox6iyO2UbhltO2+W33w6HebS2gTPEe05uXVq+YGyM4e7pk27/Pl71
   nSKdXdlSpktX/60GugezK3OFCsoP14CxKp32x/oJw6Jq5zp942ElQP2wg
   w==;
X-CSE-ConnectionGUID: l1rGlWr7RX+TUeBuRHJ8Cg==
X-CSE-MsgGUID: wLsEWp62TXOPZqOMnjA1hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="195806408"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="195806408"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 40F97D4808
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1A73D6FE5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 84D861A00A2;
	Wed, 16 Apr 2025 17:02:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/31] python3-pymodbus: upgrade 3.8.6 -> 3.9.1
Date: Wed, 16 Apr 2025 17:02:08 +0800
Message-Id: <1744794136-908-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116888

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.8.6.bb => python3-pymodbus_3.9.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.8.6.bb => python3-pymodbus_3.9.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
index 200e75748d..d969165a54 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.9.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/riptideio/pymodbus/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eba8057aa82c058d2042b4b0a0e9cc63"
 
-SRC_URI[sha256sum] = "7689b56cc3ad05a594e1486e772abb9d9646c01737935df492db04455680baf6"
+SRC_URI[sha256sum] = "ec6216f218dd7e370fa43692535ee5268adb6b1cf7037dda6c78ac92c9a43a84"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


