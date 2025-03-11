Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7228EC35FF5
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.4168.1741683334176062147
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LVQvPPj0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683335; x=1773219335;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CzNhzmrBOPq9iWYOa9qw1SR6kUG+DemuPUNTkJXHsOM=;
  b=LVQvPPj009QCTd9JJKspb3NGojA3mDWilYjzJh34y7z60JmwleIiu9EW
   FGePTvnd2KIprAgKXDlaf7S5kt5e0mKk58XDQJUuoaLYP51i0KqCJJyUT
   +egGUWkpfrs0x8+14co77e4j4roMnBL76DVHEdLUVB4c1N325SGAr54Do
   T4EaSeDulwvphGfR+TBACGcEoddCWfwuX6KFzLxd2ooWddLC661JEtY4Q
   TrgSL5kgGcr88CojQljQvhncx/ONtbMK/eaJTpbd7hz/rCaVOK///yKbT
   0F3HoHvWG+lT5F58JvcIQbNlUsFd3Qqch5noFoUumtZNOtWpP9m6I9r3k
   w==;
X-CSE-ConnectionGUID: YQikE+TBTcq0r+zKU/ZGLw==
X-CSE-MsgGUID: svCIyQLdTFis6P3LQjM6NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="181074427"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="181074427"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:33 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90D93C2260
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5774BD729C
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:31 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EA1FD1A0071;
	Tue, 11 Mar 2025 16:55:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/36] python3-pdm-build-locked: upgrade 0.3.4 -> 0.3.5
Date: Tue, 11 Mar 2025 16:55:00 +0800
Message-Id: <1741683310-8681-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115878

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Proper support for VCS and URL requirements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-build-locked_0.3.4.bb => python3-pdm-build-locked_0.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-build-locked_0.3.4.bb => python3-pdm-build-locked_0.3.5.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
index 5dbd2b0edd..c0eee4e97d 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-build-locked_0.3.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "pdm plugin to publish locked dependencies as optional-dependencies"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=19382cdf9c143df4f00b9caa0b60c75a"
 
-SRC_URI[sha256sum] = "46dd94f6134e351a8885754ffef95a395e774f1f338348b763f9a208fd19efd7"
+SRC_URI[sha256sum] = "ab2f381e00d79841d46be2e6909c265038b9fa951de2bf551ca6adb7f6844201"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


