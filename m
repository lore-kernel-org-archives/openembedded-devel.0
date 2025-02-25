Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB958C28B27
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:06 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2210.1740525905650741562
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:25:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ep9q/7LC;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525905; x=1772061905;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PGTgE2jZBiQque+N4cbUwX+5/B/kQBEMrdNxJP9BVls=;
  b=ep9q/7LCzNSKpxrL3PnyT3O8mE5M2KylROGU9yJK9ir4cwbh5rcyV4Vg
   T9L6rb4wiZ/fxYRlH28p+bc178l+iI8/ooCkehff2dyvvDTOtMtNqqS+A
   U+gVHYzOvCSzlF2MlA+MvLB55qMGygmLtW75moJpLLHoukWkvB3HUdYXg
   vr7OCTj3SbpEAvWYlGhMIO2HMVSDfpOVtYZW3QohJ+oA4B6PvhB/Uh5/Q
   CzD8nnr7a1yK/7aIxjeWNfmx8HPHHx87DVgFhyDC5h+qd2DBHCoyBJVuY
   2H/AWXrdXt44flOfdeOe82bo4yvWHqXZVuDT1hBx3cK8Dc9XDHwFHZ8Ff
   g==;
X-CSE-ConnectionGUID: RSujy8JsRHe9hC3s5iZ5tg==
X-CSE-MsgGUID: SvtvekaQTZSZzdKVUxo6Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170032179"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170032179"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:25:03 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 81CF596743
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 455F2CF7C9
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:25:01 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DBFA21A006C;
	Wed, 26 Feb 2025 07:25:00 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 43/51] python3-sqlalchemy: upgrade 2.0.37 -> 2.0.38
Date: Wed, 26 Feb 2025 07:24:33 +0800
Message-Id: <1740525881-21103-43-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115643

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.38

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.37.bb => python3-sqlalchemy_2.0.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.37.bb => python3-sqlalchemy_2.0.38.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.37.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.38.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.37.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.38.bb
index fdaf5f7d91..4b2d049610 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.37.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.38.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=061025f14213ac2818ff353223d6eca6"
 
-SRC_URI[sha256sum] = "12b28d99a9c14eaf4055810df1001557176716de0167b91026e648e65229bffb"
+SRC_URI[sha256sum] = "e5a4d82bdb4bf1ac1285a68eab02d253ab73355d9f0fe725a97e1e0fa689decb"
 
 inherit pypi python_setuptools_build_meta cython
 
-- 
2.43.0


