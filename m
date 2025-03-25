Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91B3C3600E
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:29 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.61525.1742893329607333293
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Af8GYmeJ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893344; x=1774429344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zy9AdufsN4/I+UwJOqNf6lOiZmitOEhRl4lGfEOhsBg=;
  b=Af8GYmeJR0IBfjwEUhN3rnlQ/ZAZqVsW/Bjuu3AJRtaOAIVqhwYYAFgY
   meT8wZbp92MT5VF2oOh3rgZRb+wtiaR+lj6iv12ZlepRds+73VFRjHDuY
   k305dikNj0jcJNxBxe8+V3N4xWqcYp422zMZAH2HXOO2mgLIgduKMckNa
   yrAa+dbeVNXhrVrPph2twlRtL4VjudVTnrHcmcAupDtLTYSI1v7wHDvaK
   Ku1PKfmz0dB65T1R9PfCP42RUmeEWoCE9UpZCKflWI7Q3AMuD8L01vzXt
   nitmB7Xa1+SjHzLKiRuaXh8zFLJK5V4bFRRsDA7iIvXOmJnVOcWdFniWk
   A==;
X-CSE-ConnectionGUID: 6eSsaLgaSQqEQMLokhQ72Q==
X-CSE-MsgGUID: u+La+uTfS12a6ZzEolG8ZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182576346"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182576346"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 00C64E6887
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B8F7AD72B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:20 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7E55E1A009B;
	Tue, 25 Mar 2025 17:02:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 44/45] thingsboard-gateway: upgrade 3.6.3 -> 3.7.2
Date: Tue, 25 Mar 2025 17:01:51 +0800
Message-Id: <1742893312-3809-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116266

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hingsboard-gateway_3.6.3.bb => thingsboard-gateway_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_3.6.3.bb => thingsboard-gateway_3.7.2.bb} (96%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.6.3.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.2.bb
similarity index 96%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.6.3.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.2.bb
index 9fc7d781a7..6b440e00f2 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.6.3.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_3.7.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[sha256sum] = "a5ccad7d6940d194f9f39cc7fc22ab72b3d124066837cde27d92d090ce458a88"
+SRC_URI[sha256sum] = "b0d1df1af62afe36f5bc9c6cc13604ccba48a7bba1c33fe7288fc5ce72496d1e"
 
 inherit pypi setuptools3
 
-- 
2.43.0


