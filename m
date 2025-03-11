Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBFE8C35FFF
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.4206.1741683333059517772
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BrpDmYus;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683333; x=1773219333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ee33KB9M1SF0TtoqWdDCmUsa849UGUCEzh/leKtR8vo=;
  b=BrpDmYusM3yfrmyifoC4WylbnTX270ZoB8ekpaXZMhhtkKDpbDISKgHN
   b20sjhXxlINJrypIj7gveBU1HJ6SM64ZlhSNr423CPkjRDg1qBe24gclv
   pV4OUrjTDOkwimSF2bvwGqqOfsoA/RAZLZ6GrL9EY2a/8/nbqYwKzWEhL
   cHwUqskZxyW3AhI+bwbqRv1bXijTQLkU3I67HM+PSIOFfUEr6EaQQ/pzm
   dSRL9c9VBLpUA1+sgCCuv3AbjgJ2HnlGgdXzhIIUqhN3c9QYIwyM/RF3j
   dFue4jb4KmHC65JMt7zvsVVijX46W7KV/zn98YGlCkagQzrXg1q6Gep2z
   g==;
X-CSE-ConnectionGUID: Ll6y6BWaT+W4MirsrCfV1Q==
X-CSE-MsgGUID: o/ztTpaJR9SC+aY5/XHUiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192723759"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192723759"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id BD63DC2266
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A955BDC81
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1ACDB1A0071;
	Tue, 11 Mar 2025 16:55:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/36] python3-dbus-fast: upgrade 2.33.0 -> 2.39.3
Date: Tue, 11 Mar 2025 16:54:51 +0800
Message-Id: <1741683310-8681-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115869

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.33.0.bb => python3-dbus-fast_2.39.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.33.0.bb => python3-dbus-fast_2.39.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.33.0.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.39.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.33.0.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.39.3.bb
index b180526d1c..5eb7672d0a 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.39.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "da2f3a2f2e10092c67a911578135c2244d04b52ec87dda80997bf65e78f79251"
+SRC_URI[sha256sum] = "84b4ff23bcadfa794842e8d3eccb521907f7c6cb8d6534c895995840306512aa"
 
 PYPI_PACKAGE = "dbus_fast"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


