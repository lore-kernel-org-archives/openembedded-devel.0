Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A483EC35FFA
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4201.1741683325664021609
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F4xKYmbP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683330; x=1773219330;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=djm2zquW8dICYbhRYDua0aiRSDDBC7PJ0fQtIO1KMgs=;
  b=F4xKYmbPmva1FFmTAAmm9n2KCUQICYUzHuMzWvzqh/il2TDWAXDcx63o
   c5boj3e+8PqwMXfix/8nBcL324THp5UnLuXzKE5zAtVCnYk0m3AadrEiC
   aoMuBAUqCiQPnCpssNPTWjlmZTStjmZhd5pdhqim7+hVwNXcjon/gwIFA
   w0uDIbJaT+5Mda7C0i3JriBi9952unT546azIPRxzjAavJK8lfkMq+fVo
   0PoNS852bX/6+dSXGCD0ifFQYMIC9i3SPcxI0bX9k+HxccIUAQ5IMM3WC
   b21fXLAvL8dNe+tU3VHYUXhs2SHgS56pxl6/eMPoh6M20XASBnLjxdgzD
   w==;
X-CSE-ConnectionGUID: PCT1oh9MQ7+S4WjoPcbkPg==
X-CSE-MsgGUID: iG3r816LT1mu2vvHIXnM1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="171563512"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="171563512"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:28 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D2AB7E8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96F4FE0C20
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:26 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2EF7D1A00A0;
	Tue, 11 Mar 2025 16:55:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/36] python3-aiohappyeyeballs: upgrade 2.4.6 -> 2.5.0
Date: Tue, 11 Mar 2025 16:54:47 +0800
Message-Id: <1741683310-8681-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115864

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Add callback for users to customize socket creation
- Close runner up sockets in the event there are multiple winners
- Resolve warnings when running tests

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...happyeyeballs_2.4.6.bb => python3-aiohappyeyeballs_2.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohappyeyeballs_2.4.6.bb => python3-aiohappyeyeballs_2.5.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.6.bb b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.5.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.6.bb
rename to meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.5.0.bb
index f66ff61302..a24434d85f 100644
--- a/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.4.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohappyeyeballs_2.5.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohappyeyeballs"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 
-SRC_URI[sha256sum] = "9b05052f9042985d32ecbe4b59a77ae19c006a78f1344d7fdad69d28ded3d0b0"
+SRC_URI[sha256sum] = "18fde6204a76deeabc97c48bdd01d5801cfda5d6b9c8bbeb1aaaee9d648ca191"
 
 inherit pypi python_poetry_core
 
-- 
2.43.0


