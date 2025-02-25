Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF98AC1B087
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.2203.1740525898314938418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XVO0hHzE;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525901; x=1772061901;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hxnWRKjabLGtcD8hHtNbxT4DtAR2m0dmLYtj6po8x4s=;
  b=XVO0hHzEK3/QSpHArrF2gm3XmvmL8QTsyFOWFqKCw1pW1zTgwuUze7gH
   TBp7uidB0/kuHNtWY+4TwO1uo8QP9tr+A5/QK9cKhu1wJayHQKC52sDBq
   GneO2aKfr2X3MDtVVtePTy8mVGY6KwgBilxe5Cw6J8M0NzWhndpeKdjVZ
   EBtycGsUlxcGpSvXxravsuWwuVeBeQbskKxyhgSFnafxDhAot+zwyVmN8
   9M1lZKpPKwECWN1x6JQSAKwAwUjCl20uNOd/bcvZMKBKQ/E51EbxL2Ev7
   pjrPCSZgxBGljgGvISW11E3nvPmYBjFxEw3k9xGpKwhm40aUGzZU24xml
   Q==;
X-CSE-ConnectionGUID: WF0y8pOVSKa2Ur2rdiy9ZA==
X-CSE-MsgGUID: mCR8DVInQl6L6qUSAZ7n4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="179142886"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="179142886"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:59 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5312D2AE1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FEB7D7731
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:57 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 444EA1A000B;
	Wed, 26 Feb 2025 07:24:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/51] python3-cachetools: upgrade 5.5.1 -> 5.5.2
Date: Wed, 26 Feb 2025 07:24:17 +0800
Message-Id: <1740525881-21103-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115626

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2025.

Changelog:
============
- Reduce number of @cached lock/unlock operations.
- Improve documentation.
- Update CI environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-cachetools_5.5.1.bb => python3-cachetools_5.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.5.1.bb => python3-cachetools_5.5.2.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb b/meta-python/recipes-devtools/python/python3-cachetools_5.5.2.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_5.5.2.bb
index 6c49844f3e..d2b65b3d29 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_5.5.2.bb
@@ -6,7 +6,7 @@ Python 3 Standard Library @lru_cache function decorator."
 SECTION = "devel/python"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=539275e657c6b7af026bb908356f7541"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e21bbe53b2730bfe1911cf381b81821e"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "70f238fbba50383ef62e55c6aff6d9673175fe59f7c6782c7a0b9e38f4a9df95"
+SRC_URI[sha256sum] = "1a661caa9175d26759571b2e19580f9d6393969e5dfca11fdb1f947a23e640d4"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


