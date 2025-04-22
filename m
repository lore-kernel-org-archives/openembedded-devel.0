Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B35C369D7
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.35402.1745311780878626397
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Tu8PPORv;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311779; x=1776847779;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/B32QbFhkU15df3kC2sTVAB2r3OX7wxRyjYhgBhttAY=;
  b=Tu8PPORvZ8zEbHidRxV85iGmWpxmJY7pdsjJChXheuWZdCs7uOk87Irp
   k3QxJz7PgN1RTmeNbzMFErtLKQ6NU1u+zuVHtzam4woOLdE96UGjbM2nX
   qK56fISTGYhN6pldztFE0wLo/fhLjilHoBVH8PHtc22WexQlfkHzHZYgI
   mHdfZ24qjMV2G4qswshhLquEZb4AY7GrDteFoiNGxueI0nbSgQC1HPjiK
   evug+EUmD1CLq1Q9wRsQpLIbfPCfE4IpozKU4lQEaiR9+f3xjWmXE/uOh
   8Uwwg8eaJ/SgS2UlYJRzDfKyCxrn7f6fXdfshEGXzslrudzgf+3fmBhBG
   g==;
X-CSE-ConnectionGUID: n0RLxnJwSumVWqW7RrFOfQ==
X-CSE-MsgGUID: ZUPiYBCyQae30rCrre0JJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="197650130"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="197650130"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:32 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EDB0FE8520
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AE568D3F36
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D19D1A009A;
	Tue, 22 Apr 2025 16:49:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/30] python3-google-auth: upgrade 2.37.0 -> 2.39.0
Date: Tue, 22 Apr 2025 16:49:07 +0800
Message-Id: <1745311761-1912-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117044

From: Wang Mingyu <wangmy@fujitsu.com>

Features
- Adding domain-wide delegation flow in impersonated credential
- Adds GA support for X.509 workload identity federation

Documentation
- Add warnings regarding consuming externally sourced credentials

Bug Fixes
- Add impersonated SA via local ADC support for fetch_id_token
- Add missing packaging dependency for feature requiring urllib3
- Add request timeout for MDS requests
- Explicitly declare support for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.37.0.bb => python3-google-auth_2.39.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.37.0.bb => python3-google-auth_2.39.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.39.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.39.0.bb
index fa7e94a7e5..58ac26d239 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.37.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.39.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "0054623abf1f9c83492c63d3f47e77f0a544caa3d40b2d98e099a611c2dd5d00"
+SRC_URI[sha256sum] = "73222d43cdc35a3aeacbfdcaf73142a97839f10de930550d89ebfe1d0a00cde7"
 SRC_URI += " \
         file://run-ptest \
 "
-- 
2.43.0


