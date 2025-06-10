Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46DAFC73C66
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:34:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.77955.1749526431400049978
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RbNCSrtp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526442; x=1781062442;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=waN4rvWRKCeSGv0uburHbQMTzYd52vlrDZ4nFW3G34I=;
  b=RbNCSrtpw6LNI9M6W2JRtz07QNxEcmGsNHPe7gxKhHiOJ5XkhulM6NwK
   B43Y0EO3H/pQg1VpbODqSZApuXfH4VROQYBotZhHUbXuG/3l6GYzH4S+D
   A6VRUUuP+YTzAe5v2lCCnlqRJObjPZOEssbM39tks0BHmXMdJV0M/eSg8
   2o7R/SGbUQ2EhiKz4QeAMIUwxFcuewSdMgnIJOoqkAtJmIZF95Zp/+8Ly
   YpLEZR/ROUjOpNIopZ5ddGoctK60RN2HBxHH3R4HYFeHvM+a63ZJJAUK6
   qjcuOQd7YNwFlRf8JgAxvEgH1ZWGh95LS8YCNqWruF+L2LZOtC201AEJZ
   Q==;
X-CSE-ConnectionGUID: cMiz1PZJTlqH9FaJutSVyg==
X-CSE-MsgGUID: EMMHZGDaSv+RW6YVwO2aqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="181121922"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="181121922"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:34:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AE86D5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1F3DDD5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:58 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 99DB01A0071;
	Tue, 10 Jun 2025 11:33:57 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 64/64] xcursorgen: upgrade 1.0.8 -> 1.0.9
Date: Tue, 10 Jun 2025 11:33:30 +0800
Message-ID: <20250610033330.924-64-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117855

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xcursorgen/{xcursorgen_1.0.8.bb => xcursorgen_1.0.9.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xcursorgen/{xcursorgen_1.0.8.bb => xcursorgen_1.0.9.bb} (78%)

diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
similarity index 78%
rename from meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb
rename to meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
index 3770babe80..f8e5de7554 100644
--- a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.8.bb
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.9.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bd1fb9ee90eead85f7b171807b3ab4f2"
 DEPENDS = "libpng libxcursor"
 
 SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "32b33ce27b4e285e64ff375731806bb7988cc626ff10915c65f1dc4da640cc9b"
+SRC_URI[sha256sum] = "0cc9e156ac84ca16ea902710af35e0faffa51d13797071e3b4b6cc7cbd493bbc"
 
 inherit features_check autotools pkgconfig
 
-- 
2.43.0


