Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0371FC36018
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.61111.1742893337893207711
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QW/dLnqj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893343; x=1774429343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=MCDSqTv0v5h/RggnZ4iaMj3u4FAXNh2ZBepBoSgIYs0=;
  b=QW/dLnqj+/79EMOp17H6sUk21IsUM93HfSOiCiInLr713rLudn2TkdEU
   s0h757HpIO8T42sUzt2o5hwIh4ElahuQln6cUhn1CCMg5GVXIlrSpvRcf
   u5GGgkDUEWibSinx1X9yWa+i36BcHgig2sdU/JQ8Ta64gS6E2xO0L+1HH
   PXOLEA2pez1Ox1HK7Eu5sXcHX4M7qe6rkIqHWKOgV+YdmRGLPJIuSdZH7
   PDedIyhu3yuWWtRlFedca4dXUq/XNSHeVnhwm5WvEPDYfOXKfA99kzySx
   6/XmXXy0Lsu1WMiv8rSKQHk86tm5+9aN+dTFTy7QOWTD62LMP+JMRTRkF
   A==;
X-CSE-ConnectionGUID: hPnBWrHVTx+6XlCxoNXDLw==
X-CSE-MsgGUID: +n8gFSDYR2mm4sr6z9NA7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="193368505"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="193368505"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80BE8E8523
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3D0E3D50E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id F20561A00A2;
	Tue, 25 Mar 2025 17:02:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/45] python3-responses: upgrade 0.25.6 -> 0.25.7
Date: Tue, 25 Mar 2025 17:01:44 +0800
Message-Id: <1742893312-3809-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116260

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Added support for python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-responses_0.25.6.bb => python3-responses_0.25.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-responses_0.25.6.bb => python3-responses_0.25.7.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-responses_0.25.6.bb b/meta-python/recipes-devtools/python/python3-responses_0.25.7.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-responses_0.25.6.bb
rename to meta-python/recipes-devtools/python/python3-responses_0.25.7.bb
index ae34f300e4..31ead072fc 100644
--- a/meta-python/recipes-devtools/python/python3-responses_0.25.6.bb
+++ b/meta-python/recipes-devtools/python/python3-responses_0.25.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0e601511a8517f4daf688a8eb95be7a2"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "eae7ce61a9603004e76c05691e7c389e59652d91e94b419623c12bbfb8e331d8"
+SRC_URI[sha256sum] = "8ebae11405d7a5df79ab6fd54277f6f2bc29b2d002d0dd2d5c632594d1ddcedb"
 
 RDEPENDS:${PN} += " \
 	python3-mock \
-- 
2.43.0


