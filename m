Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CA8C02198
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.46627.1739178121940360202
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=T4j5jtHX;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178126; x=1770714126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vcP3bh6i34WAVH/8/DLbLqOJHSjSZeFEGaE3nEtlcX8=;
  b=T4j5jtHXRjDuEzSkNPcoKfZY++9FNXmPiAfHHC+OOGy/QZUICzOOTIwo
   9xfgd4j6o+6GMP3KwqdBzLb9frOQ689Tey1ZiNviAgYXiKIm43JffvyoN
   TvIQXb7NalZLN3cF3FPoKx7tV0pOW6/qnABEbZz6cKNxQwMdlKJ1VwgGK
   nXDMRxYPmbjplVTKJc38EjfmwJf8fVuTJeRZOIxYCJJXF4oICPXqlerUH
   wKUGrnVpL87DMw8+Mpc8WOKybV6/1mgf681SNS/TMjy+7zqQkTnif6W2z
   Ctm2fTAG4sZeV+gaQ0xOz45X8QDm8q2BOiT81UIRG3CLBEajF7oiCmdS7
   A==;
X-CSE-ConnectionGUID: zGrB2yhSTjShHdd09uhjRg==
X-CSE-MsgGUID: XuN1XZ3bS9ajcqTzT5GuZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="189490525"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="189490525"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:05 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 87C9AD500C
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:02 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 478A1D5081
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:02 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DF7141A000B;
	Mon, 10 Feb 2025 17:02:01 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/66] python3-ipython: upgrade 8.31.0 -> 8.32.0
Date: Mon, 10 Feb 2025 17:01:13 +0800
Message-Id: <1739178095-26432-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115372

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://ipython.readthedocs.io/en/stable/whatsnew/version8.html#ipython-8-32

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.31.0.bb => python3-ipython_8.32.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.31.0.bb => python3-ipython_8.32.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.31.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.32.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.31.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.32.0.bb
index d8b57a5c9a..7823d43d17 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.31.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.32.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
-SRC_URI[sha256sum] = "b6a2274606bec6166405ff05e54932ed6e5cfecaca1fc05f2cacde7bb074d70b"
+SRC_URI[sha256sum] = "be2c91895b0b9ea7ba49d33b23e2040c352b33eb6a519cca7ce6e0c743444251"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.43.0


