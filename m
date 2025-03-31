Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32004C36016
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.47786.1743412324949851451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cpsRo5z2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412326; x=1774948326;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kSxpUPGw+eivQHM2RQORkKumW/R9MXdwiDiqfrzqllg=;
  b=cpsRo5z2b8w0/zO/Iqi4g00+YiXrHtyzLqfVpeTweLq1i/mtY7f6s0jE
   5w6MgxvMtz9lILDkIdMGuzO/A3ebUhEf9evp/Mdz5mCkJElLp2tT31iA9
   MApfPKWZjH8CWwdka+Ymva2kP0GmNsg8UWMUiY3bj7hqKGZ/56C/hX5ZR
   4m3D7nczVPq26UAJg92SbXPjalnpidPUFzAzaDrgR2fRLxE1Th3rob8my
   +rcaRp6kunRpTBlNkwuF5EWguZiywAeRrrMxueCL7aGlkJa5n4IAc0alP
   BUn8BHp7gJYgKwNGcfRZ+0ei0eATwfChnxxIeYjJCr/KVgELp6ItP3niq
   Q==;
X-CSE-ConnectionGUID: fPgOge9fTIKuUUTc9b+x+w==
X-CSE-MsgGUID: 4GWgegd1T3iwOxqXtRQc5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="174420424"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="174420424"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:03 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A48EBD5022
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 62D6DD5086
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 21C181A009A;
	Mon, 31 Mar 2025 17:11:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/26] python3-propcache: upgrade 0.3.0 -> 0.3.1
Date: Mon, 31 Mar 2025 17:11:40 +0800
Message-Id: <1743412308-21887-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116422

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-propcache_0.3.0.bb => python3-propcache_0.3.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-propcache_0.3.0.bb => python3-propcache_0.3.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-propcache_0.3.0.bb b/meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-propcache_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb
index adb424a169..24b72f09c3 100644
--- a/meta-python/recipes-devtools/python/python3-propcache_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-propcache_0.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/aio-libs/propcache"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "a8fd93de4e1d278046345f49e2238cdb298589325849b2645d4a94c53faeffc5"
+SRC_URI[sha256sum] = "40d980c33765359098837527e18eddefc9a24cea5b45e078a7f3bb5b032c6ecf"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest cython
 
-- 
2.43.0


