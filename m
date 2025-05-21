Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C640C5B556
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.6713.1747817996313122889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IPEj3HOP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817997; x=1779353997;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=y64J7YFzZF68iOFieiabJP7r2NoDW4Q/LOsW5FkeX2k=;
  b=IPEj3HOPc2Jesw5RyYYWa2e+4I34XXMxljs0EoO5xPZECtfUZjwioRJW
   I2S4L6YMxKaTvAzbJIWzxAQ8GdifFoMVIxj3qpiHZv3njANR3y/kxGTXv
   uD9Bea84QRTXh/iyyQTd3ojkB/3X7aF1U0NmGncrSJARtvBs7UUIy7/4p
   5/tBCnN3PwA+ApE4cJd5bslPei85mFxbbI71+E+rgkDnJ8ezOH6PP3qYt
   Uss0Pffrag46RMniAF7CElYQ1Lu6MlQ1iPVJrUpw/v4gUX9T1kKrZhsix
   Va3IdGlyns6PWi2koYDlxRpoE64KjP/MDA7q8MwyG37Xy5salCqyaOJeZ
   g==;
X-CSE-ConnectionGUID: OphvSt0ISk253nCCSU4s8Q==
X-CSE-MsgGUID: ZSlyUBvTQAK3lEplL8fH3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="188581262"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="188581262"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:55 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CDE0D8E64
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D2A95BDCBC
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:52 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9217A1A009A;
	Wed, 21 May 2025 16:59:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 09/43] python3-elementpath: upgrade 5.0.0 -> 5.0.1
Date: Wed, 21 May 2025 16:58:58 +0800
Message-Id: <1747817972-28874-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117537

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix XDM type labeling with element and xsi:type substitutions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_5.0.0.bb => python3-elementpath_5.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.0.0.bb => python3-elementpath_5.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.0.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb
index e13faad4e3..71ccec5719 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "932ff1087120eaddf38bc82c6345d547cd29b32c293718cbdd36485c704df861"
+SRC_URI[sha256sum] = "d3e4807b7e38e190e382eefef93f35ce6f71adf63b33e3f01d0e11f22e5d5cc7"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


