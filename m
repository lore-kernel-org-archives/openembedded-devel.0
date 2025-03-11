Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5859DC35FF2
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.4210.1741683336722643074
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gl7kcSjU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683337; x=1773219337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vyUbxmYCpH2eHhFaegmVp8s2ecq8uZHA1Fs0k+XDYm0=;
  b=gl7kcSjUMVv3CanLVZLo2XbR1/zmV+vSk6LVVwku+QwCevL66YeX1iXh
   s/hKgyZwyAqixt5JMwxb3O9v8eD1TxkSx92jAWoIHMnqHxh2N9UJ4rdTb
   Fkkf8pkLV6IHwmC1kwu3xi/907ilEGQgKW7hpN71exAoCf2qCHQaIdI9/
   pC5ZTTiG6uNGsadcoGmk0i76IdvMBPEdh3kWWLG/iBHjaIzVPElS2s/vE
   7DoeKh9aAks+NuNYT/x+mm/WGDb1VD4emy3KkAapR7irRJLW7d1wtdeE5
   OoSVdzD2lfMcSiiXQvrdCUTtBaAhR9VlsXb3KA9X6xhclzhb7OHA/M9zp
   g==;
X-CSE-ConnectionGUID: xSqSVFtbSRyOqJ+SimSU1A==
X-CSE-MsgGUID: nAj6m1TsT5mgSXz6ae8HrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="180034254"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="180034254"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:34 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A4DE6D4C31
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A409D72B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:32 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 080BE1A0071;
	Tue, 11 Mar 2025 16:55:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/36] python3-starlette: upgrade 0.46.0 -> 0.46.1
Date: Tue, 11 Mar 2025 16:55:04 +0800
Message-Id: <1741683310-8681-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115881

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Allow relative directory path when follow_symlinks=True

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.46.0.bb => python3-starlette_0.46.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.46.0.bb => python3-starlette_0.46.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.46.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.46.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.46.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.46.1.bb
index 402280bdc8..f14f0eff57 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.46.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.46.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "b359e4567456b28d473d0193f34c0de0ed49710d75ef183a74a5ce0499324f50"
+SRC_URI[sha256sum] = "3c88d58ee4bd1bb807c0d1acb381838afc7752f9ddaec81bbe4383611d833230"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


