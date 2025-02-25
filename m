Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80F9C28B23
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.2206.1740525900980157654
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XbRCwezD;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525905; x=1772061905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X4pSzjKHRzQLq0IwKq09oSdJeFTbqLKJAg6Vy60rKHg=;
  b=XbRCwezDV2FCxElYsmRZqkjfKlDggkyXh96a+SrR/hLHyVGhR6m9uXqb
   r9TBqdvPDexBaMO8qZ7lf1Y6aTcX3shfbe2eZ7TWIWw21+fZt657qCWAj
   e27Itowx5aGYIdYOSJRgBEELhHthLutNkJNfDCqlSF8j8LkeZM/SP8MQ1
   WZHWaQnQoiWoeUkhE2sFXL9AhxV3FgbHJRyZmttduc1MWWvmVC233xB33
   kdb7jFUAAXgcjHYNtxlOP9+9FTD6FVItSIhEtsr8ra4yW4RoNxgMfE4Or
   uJTq5X88tluSth9E/L8THtwOn9tVWmUqfT0E2M03XskUjetK/IypA5pKc
   g==;
X-CSE-ConnectionGUID: exX2yqzJQAuYask65GkIYA==
X-CSE-MsgGUID: +tOhhhrgSXOgQNhREc5QkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191419390"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191419390"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:04 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FE5C96741
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 08623CF7C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C1BA51A006C;
	Wed, 26 Feb 2025 07:25:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/51] python3-zeroconf: upgrade 0.143.0 -> 0.145.1
Date: Wed, 26 Feb 2025 07:24:37 +0800
Message-Id: <1740525881-21103-47-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115642

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Hold a strong reference to the AsyncEngine setup task
- docs: Enable link to source code
- Non unique name during wheel upload
- Add a helpful hint for when EADDRINUSE happens during startup
- Wheel builds failing after adding armv7l builds
- Add armv7l wheel builds
- Make no buffer space available when adding multicast memberships forgiving

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.143.0.bb => python3-zeroconf_0.145.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.143.0.bb => python3-zeroconf_0.145.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.143.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.145.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.143.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.145.1.bb
index 470cbb0847..08f53ab8ff 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.143.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.145.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9fe712b1bc27c5c4e9ecd7f31d208900"
 
-SRC_URI[sha256sum] = "35f9390e4b862789f2d62da864bbf6ac26ad1d6dc8cf1e64a4d3554c85a05002"
+SRC_URI[sha256sum] = "3acb6146595597cfe6e314f8a4d530e659fcd9f9028cc9603a00518c98e57dd2"
 
 inherit pypi python_poetry_core cython
 
-- 
2.43.0


