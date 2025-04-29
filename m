Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BFDBC369CB
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:16:04 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.7618.1745900153105853057
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KjO3/CR7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900154; x=1777436154;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=LZvHLTTTtJwS9CiYVrNR8szd7JW6ysm3cSRxoWhfvw8=;
  b=KjO3/CR77UARJj1+GRFSwdcY2IKOrUTd5egZkEC90z60iBlBBhfLFbjo
   FRs+SJYPyLfXcUyZiPTdi2yl2t0qZbh5AkKRBUth4786ysY7cx2rd9hEz
   iP1k4f41fdFQe+7BCfXbUZam73QEqW0TL/gjf02plU8f9FGrEgwLTU2wm
   VbveHGY3L73Wkaz34cGDIckKSlvGcWouCBaE10MSK5urJOEooR+GJdHBn
   SAI2uD9Bj0rxnvp1QxEfdn7ThUyrSRMMSOhELEB05hlLYZFSwScV5JIHs
   xaVxs7hLKpfYjFTUA22cLkgqDmNGXzGKcmFCQgFTY7co2r9l6FNkIhelZ
   w==;
X-CSE-ConnectionGUID: oEoQmXncTxOyRjPtY+JWxw==
X-CSE-MsgGUID: P6r9Un5+RwOmZggYEcdubw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="176882990"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="176882990"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B262C2264
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DAA9FD88A9
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9AE701A009A;
	Tue, 29 Apr 2025 12:15:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/23] python3-mypy-extensions: upgrade 1.0.0 -> 1.1.0
Date: Tue, 29 Apr 2025 12:15:36 +0800
Message-Id: <1745900138-26424-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:16:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117222

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...y-extensions_1.0.0.bb => python3-mypy-extensions_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mypy-extensions_1.0.0.bb => python3-mypy-extensions_1.1.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb
index cda1eb0533..9c8cb5533d 100644
--- a/meta-python/recipes-devtools/python/python3-mypy-extensions_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_1.1.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0fe3219e2470a78c0d1837019b8b426e"
 PYPI_PACKAGE = "mypy_extensions"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "75dbf8955dc00442a438fc4d0666508a9a97b6bd41aa2f0ffe9d2f2725af0782"
+SRC_URI[sha256sum] = "52e68efc3284861e772bbcd66823fde5ae21fd2fdb51c62a211403730b916558"
 
 BBCLASSEXTEND = "native"
-- 
2.43.0


