Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BFD7C36018
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.47786.1743412324949851451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DLM1xJBS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412325; x=1774948325;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=FQhTSh8LJTS/Zw94cMZcqKO3x5NB8/5CjSAW3OzWRlE=;
  b=DLM1xJBSzon5rz2R/nefSUUtjqz/9KT8OZ/dOK8jvgNg/BrL44lGpFJb
   H+1EkfLjauFtZtmnKUuyxQ/cTCWWuVIm/phkilLQEWHaHP3osH6EJAyRo
   Jny5OglABQhYdIZscrCQEeT/Sp+RF8/csqzGkG0gFaoChjV8T5O4BId/n
   0aPiuf1jFZyNX/YorVK8aqml5L7FpBqvrNztulj8o6hDDfCiXnFenlKAf
   xxQQOT0dEMfO9ejun6aAtLX/yi2oCgnGw2uAOZF1yUpOUy3tIGc/AfYFr
   dZR0I+A21PZqBzwIY6mqwtK7gMEeOEPWiVM0729ClzuCNt76dNsrkyFQw
   A==;
X-CSE-ConnectionGUID: toPidn/USD+DslKTNa7Knw==
X-CSE-MsgGUID: kwsgGpGGSJi4YwFtile/qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="174420422"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="174420422"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:03 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id AE793C3F97
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 720AC13EF2
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:12:00 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 315051A0078;
	Mon, 31 Mar 2025 17:12:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/26] python3-sqlalchemy: upgrade 2.0.39 -> 2.0.40
Date: Mon, 31 Mar 2025 17:11:45 +0800
Message-Id: <1743412308-21887-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116419

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.39.bb => python3-sqlalchemy_2.0.40.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.39.bb => python3-sqlalchemy_2.0.40.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.40.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.40.bb
index 4668a9da05..c86a2d29d9 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.39.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.40.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "5d2d1fe548def3267b4c70a8568f108d1fed7cbbeccb9cc166e05af2abc25c22"
+SRC_URI[sha256sum] = "d827099289c64589418ebbcaead0145cd19f4e3e8a93919a0100247af245fa00"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


