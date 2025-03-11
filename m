Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF5AC35FF4
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4162.1741683327332887572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=i711jL6G;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683336; x=1773219336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=99oVBVXBOiy+pAKwL9kQkZ96VKz7AuBjUeUUTJr8GdU=;
  b=i711jL6GFqzadRnrBP0plZZw07cz2kv7gi5eI4nNLKW9he0xoYUSCD9Y
   fzXaZG2+KKGV0yGTdx5d46q83lD/wpcNTbr8/fN84z1AcRb06G5igtM0R
   3zzblQifDp00V27FpMLIaziZsDXEAoNkgWmUgzpcPYOoR3SaerOlGMYQl
   DnJJOzTJ0jmLTuaKaBMd18dpo1W+oWooiqpbBGaXAGyjq5YGtGK9q7Q6K
   Z5R9C+dqmMwyiX1uSMbH9/xPXaKSloksUe/tUM9vzkmr++oRI6f4JRhWz
   I2RtFpPkixcIpQPTf4T1WgXmjf8Pl4NEOys6BlJkbXKOlT6JpLinHsu2N
   Q==;
X-CSE-ConnectionGUID: sw29rct0Qfad3T6c3DpPBA==
X-CSE-MsgGUID: hGSvYpsOQMiEgV1j4kKedw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192660320"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192660320"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:34 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0594AD4C33
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id BF85ED8B31
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:31 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 845BD1A0071;
	Tue, 11 Mar 2025 16:55:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/36] python3-pywbem: upgrade 1.7.2 -> 1.7.3
Date: Tue, 11 Mar 2025 16:55:02 +0800
Message-Id: <1741683310-8681-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115877

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pywbem/{python3-pywbem_1.7.2.bb => python3-pywbem_1.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbem/{python3-pywbem_1.7.2.bb => python3-pywbem_1.7.3.bb} (94%)

diff --git a/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.2.bb b/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
similarity index 94%
rename from meta-python/recipes-extended/pywbem/python3-pywbem_1.7.2.bb
rename to meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
index 1fdcc98ca7..ead376827c 100644
--- a/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.2.bb
+++ b/meta-python/recipes-extended/pywbem/python3-pywbem_1.7.3.bb
@@ -16,7 +16,7 @@ HOMEPAGE = "http://pywbem.github.io"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fbc093901857fcd118f065f900982c24"
 
-SRC_URI[sha256sum] = "dc3b785840017f5fcb6381c56682598cebbfc8451851768f85e2318a84e06b68"
+SRC_URI[sha256sum] = "d1f0a2ebd4ffedef8d067af3855216db5190c7f6f27c8d2dcd467e09701c90b0"
 
 inherit pypi setuptools3 update-alternatives
 
-- 
2.43.0


