Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A832BC3ABAA
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:53 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7616.1745900152223001330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jVX6IGpk;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900152; x=1777436152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9ZJaXtHqki4bK2b8WHNW7tLLYOPhmWXW2IWXcYKiBbg=;
  b=jVX6IGpku/CoQReJu55kb46diP4HH5aFa215T3UtYYiM/w69mtUNH3te
   WVFmHiStJs09j6WcLMuLt+oAMlyJyvzu4fw+iojVVMDziSEfLG25qpgdr
   LKZ9tAqeL+Y4xsMsdujX3c8261ZC5W5iItKI2g9gHNUP7jZQeXGGhmJ15
   1DMpAUwPrtpfS6PEjhTEiZVnqEyOXWDGx5PJfXQIExoNEEHu849mT3ZJk
   +WMEEkRuYf5KO+qxa1UsKUJf9n4qn/taBkh0A9r5z8JxTq7O2thS823Jn
   Jl0eXudmDoElDg2Goo6vDXjVHGBrPSkIAkQ755zhHkCKKnacGGx1vYstj
   w==;
X-CSE-ConnectionGUID: NtfpOWK+TNq6S0zW7Ne6GQ==
X-CSE-MsgGUID: +URAeIp3QY+IrQ3/nSzB6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="186390923"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="186390923"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E350DC2264
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9EEDCBF4AB
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5E6921A00A0;
	Tue, 29 Apr 2025 12:15:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 07/23] nbdkit: upgrade 1.42.1 -> 1.43.5
Date: Tue, 29 Apr 2025 12:15:22 +0800
Message-Id: <1745900138-26424-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117211

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.42.1.bb => nbdkit_1.43.5.bb}          | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.42.1.bb => nbdkit_1.43.5.bb} (92%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.42.1.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.5.bb
similarity index 92%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.42.1.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.43.5.bb
index e1292db6e4..52a388e6f6 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.42.1.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.43.5.bb
@@ -9,9 +9,10 @@ HOMEPAGE = "https://gitlab.com/nbdkit/nbdkit"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26250adec854bc317493f6fb98efe049"
 
-SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=stable-1.42;tag=v${PV} \
-           file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch"
-SRCREV = "14de71af1bd13e5c781d83959bdeb7ebbe759d6f"
+SRC_URI = "git://gitlab.com/nbdkit/nbdkit.git;protocol=https;branch=master;tag=v${PV} \
+           file://0002-plugins-Avoid-absolute-buildpaths-in-binaries.patch \
+           "
+SRCREV = "05705a45b1945be69e43b32205412cbf02d99656"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


