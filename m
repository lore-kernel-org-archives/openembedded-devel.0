Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D87CC3601F
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.47784.1743412322650854718
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZF3GA2ja;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412323; x=1774948323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=hWgBFjE9ML1C2ZbxeSVc0oXHqLBOuIGFWe1cmerju6o=;
  b=ZF3GA2jaQanmeF+7ZIhNg/l1XiPeUaz5mHWQHhAFsTKBtjtSHat+9yRm
   KyFGUIctdJfUuTcugXSmgokkP+cTsEQvddMgnXpgh8t8qfQyUgvLjdauh
   TdmNm6btCOi6Mscvfzp4kcQpYug6vbc0zlSgRXkpFIzFpt4TPYtZWrtFX
   MYLOiAEie6fKF+gwS8/dwhjLqvmXQ2a++HlcquU5pRPSzR/CzW9PT4Gz2
   SIqMA0+BKHpC1tdK/vl0oxY3cPpZLt0OPkWiJyVzGs8jm7TJjEW9UCCxl
   +xPsYi2U6kjhZOnaEFJTGLW4ObVyhxQV9ioC15QexjqDmOGqyByboi7BB
   A==;
X-CSE-ConnectionGUID: Q5lBcc5aTJOIwL9uZg9Qzg==
X-CSE-MsgGUID: 1aYZZ3jERWKJYOjYlYAgHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="195278861"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="195278861"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:01 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 40A32D5011
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EEC15D5086
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ACC1F1A009B;
	Mon, 31 Mar 2025 17:11:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 16/26] python3-nanobind: upgrade 2.5.0 -> 2.6.1
Date: Mon, 31 Mar 2025 17:11:38 +0800
Message-Id: <1743412308-21887-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116413

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-nanobind_2.5.0.bb => python3-nanobind_2.6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-nanobind_2.5.0.bb => python3-nanobind_2.6.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.5.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.6.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-nanobind_2.5.0.bb
rename to meta-python/recipes-devtools/python/python3-nanobind_2.6.1.bb
index e37421caaa..a48c17c57c 100644
--- a/meta-python/recipes-devtools/python/python3-nanobind_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.6.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/wjakob/nanobind"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
 
-SRC_URI[sha256sum] = "cc8412e94acffa20a369191382bcdbb6fbfb302e475e87cacff9516d51023a15"
+SRC_URI[sha256sum] = "e05c6816a844aa699e46408add3bff8c743af9fd3d38eafa307a73633fddf94e"
 
 inherit pypi python_setuptools_build_meta cmake lib_package
 
-- 
2.43.0


