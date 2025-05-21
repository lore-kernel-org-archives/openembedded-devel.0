Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8B2C5AE59
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6713.1747817996313122889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jPMZgFkP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817998; x=1779353998;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JPNBVRaSn7oD1L7SL29Pj81ojSKm0CguiugQX1hDkSo=;
  b=jPMZgFkPVcZDl9dN6PtRKNTDoPZs0p28ehKpRQmG5oRXbMXOa6XikVkR
   hb+98coC1Y5jCAPeyUOfdQYTUPZ3HK19nFEDXQ2Ka/iql1OZTqHcEugZL
   q80xc5dsQ/5riPn00x+CKPY2bZHPeEmxHrno8px8LWJKTjidJKjqppnqD
   4m65TjxcH2VzD2xO8ndaqHN/ZFWv1w9zflrKYIu4X3wFK5XsPj3v1m6Pv
   JYA07YB7CHQ4Y5iUeLyfum0hXR75/lbDzkoxaeywYtAxtwaSO8u71rNkn
   Vo/chvVKg2YxR9zF/+jedWgCUqdNYxYMfztL5f3sVRR66DMO9ec0+CHNl
   g==;
X-CSE-ConnectionGUID: FTqn0yQPTaOrYM0Qxy6wMQ==
X-CSE-MsgGUID: 5JS5tjzJR3WJaLNqOjxobw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188581264"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188581264"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:56 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F3D61E8FE0
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5D7AD8B94
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 728021A009A;
	Wed, 21 May 2025 16:59:53 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/43] python3-google-auth: upgrade 2.39.0 -> 2.40.1
Date: Wed, 21 May 2025 16:59:01 +0800
Message-Id: <1747817972-28874-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117539

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Disable logging response body for async logs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.39.0.bb => python3-google-auth_2.40.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.39.0.bb => python3-google-auth_2.40.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.39.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.40.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.39.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.40.1.bb
index 58ac26d239..04207c607b 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.40.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "73222d43cdc35a3aeacbfdcaf73142a97839f10de930550d89ebfe1d0a00cde7"
+SRC_URI[sha256sum] = "58f0e8416a9814c1d86c9b7f6acf6816b51aba167b2c76821965271bac275540"
 SRC_URI += " \
         file://run-ptest \
 "
-- 
2.43.0


