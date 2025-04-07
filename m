Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 763C2C369AA
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.42482.1744017450122620264
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RtcsyKS0;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017452; x=1775553452;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FQBM5QFQLkqhdm6KDfG/tMp10QNnEnSrO2AT4vlC6ak=;
  b=RtcsyKS0kaj8syCkDoCtEdXS1ksrZKhypIYkF10bd4PDJ8Tzgr4KNOaO
   24L+e4IYTZ6LqjvyDHHFMaKoKxGDAsCIiyx2QO6vlQ3/Pkg4NM5EmKXnf
   a3aDTOC+WMxhNvHjiJS3ETJ/Op/H4Xe9xCUWh6LoEORyakXHXKzZW82Nn
   3SKbRdzr1FsCx7Q7Va9FgQ1/LIGBqKyDLqrH23EDBYx4PxwtMJN3xZvjo
   dkTm7fScOJ+kfAqx+GizIgfIqEu8srjBLQsj3JXQYVGa/NBeYb74IjeD9
   LTzxGtfXSl/jnpQsMcGw8/KgNES85nydCoFkWgUa0Ae3N87k7X5enQyTf
   g==;
X-CSE-ConnectionGUID: k5hsMz/4RPab5TQUqWwf+Q==
X-CSE-MsgGUID: vI0vLDzXTEiyLsDWyMvqmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195668935"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195668935"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E78F5DBB81
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id ACF95D4C39
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6A7B61A0071;
	Mon,  7 Apr 2025 17:17:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/30] python3-pycares: upgrade 4.5.0 -> 4.6.0
Date: Mon,  7 Apr 2025 17:17:00 +0800
Message-Id: <1744017431-22217-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116645

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pycares_4.5.0.bb => python3-pycares_4.6.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycares_4.5.0.bb => python3-pycares_4.6.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pycares_4.5.0.bb b/meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pycares_4.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb
index c6a6f7d2ec..aa87112c88 100644
--- a/meta-python/recipes-devtools/python/python3-pycares_4.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycares_4.6.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/saghul/pycares"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1538fcaea82ebf2313ed648b96c69b1"
 
-SRC_URI[sha256sum] = "025b6c2ffea4e9fb8f9a097381c2fecb24aff23fbd6906e70da22ec9ba60e19d"
+SRC_URI[sha256sum] = "b8a004b18a7465ac9400216bc3fad9d9966007af1ee32f4412d2b3a94e33456e"
 
 PYPI_PACKAGE = "pycares"
 
-- 
2.43.0


