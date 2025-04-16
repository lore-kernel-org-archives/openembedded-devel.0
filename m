Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE3FC3DA4A
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:53 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.14435.1744794166585269245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VpdKthLX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794166; x=1776330166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BpH+MovbMP3Zg+s0XLpxPeuylSaRI5YA5/inWt7QMTM=;
  b=VpdKthLX20g2kC4ICJMWYvvP2kMl42oDbcuf5j8JyZySq66N0/zL4JTp
   5uAZIJye7mKVI9qoWWa/uHo9ehUy26z+W4vizfAkZcsFUSTdhjGAEUFAj
   6Z80n9g8OUZ9tS0ZpsevcB7xUXp/qygmDLmhdXsZ2uBLQ1YOi183RORVA
   autDzQ8FFkzDaSLYUWjn0Y75jJUJqeLdY92WqxeEheEV1jZXAmoFyVMZB
   M7ktHRZFUvNS9WJb3o5vYjD/8h9s2h/CBavA7sh0cOdzLF1yXTPd9qzi3
   je9uCi/n7c/b9V6iv6Grq3V4tY2UnlDDvjSIUWtEQMM4qJ+fewfZVe4eL
   w==;
X-CSE-ConnectionGUID: hB6Ub6p1TbeHIrmiSP4xgw==
X-CSE-MsgGUID: BEAQ9xF3SoSTwZCBj7Peeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="185014442"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="185014442"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:32 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C95C1E8523
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8952AD50F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 444931A00A0;
	Wed, 16 Apr 2025 17:02:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/31] python3-pykickstart: upgrade 3.62 -> 3.63
Date: Wed, 16 Apr 2025 17:02:07 +0800
Message-Id: <1744794136-908-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116901

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pykickstart_3.62.bb => python3-pykickstart_3.63.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-extended/python-pykickstart/{python3-pykickstart_3.62.bb => python3-pykickstart_3.63.bb} (90%)

diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.62.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
similarity index 90%
rename from meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.62.bb
rename to meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
index 9b15f957de..bd20c69980 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.62.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.63.bb
@@ -11,13 +11,13 @@ RDEPENDS:${PN} = "python3 \
                   python3-six \
 "
 
-SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=master \
+SRC_URI = "git://github.com/rhinstaller/pykickstart.git;protocol=https;branch=master;tag=r${PV} \
            file://0001-support-authentication-for-kickstart.patch \
            file://0002-pykickstart-parser.py-add-lock-for-readKickstart-and.patch \
            file://0003-comment-out-sections-shutdown-and-environment-in-gen.patch \
            file://0004-load.py-retry-to-invoke-request-with-timeout.patch \
            "
-SRCREV = "27f1bd96d1be83da5bea0159f785753ae393ee2d"
+SRCREV = "6e0d1238cb4696a9040072a5a28a706e5775c552"
 
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
-- 
2.43.0


