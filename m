Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D0FC7115B
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78431.1749526425058059186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hwxO9LEC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526430; x=1781062430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0/sa/k98pRJKxYwzczxKeOqQIx2dDoBvL83riIZgavw=;
  b=hwxO9LEC6NHvXPQT/14b0aszRy/oZRyb+csNzUGV7NWN3OAKg9RU5kFI
   RKI+8znNMiwJ2tXdBsNa17bmi+d1nK2X8NqbsordUnQj4kCN2QeOoGynC
   kUDDT2F8nCRPsjW4iO97xUkfB25LnSEC50PmX6hzRi8WESjvk9rQiP/I2
   vNwVyfIxxIVrvGjT2lpLqhvS3dZjZfzOq7TCf09uswGYCSHDOpnZo3XFo
   ARcVCLQDzxeP+NYccO5JhB+HS/HOFHDJ7bbLCwCxbVxSiBp6WQ2bLGLHf
   gHZ/AxA1jw8pxpWz9Ztc1nNt+Dr8fgKb1Zc0uDbkv/dwhG+iBYslFuEjU
   A==;
X-CSE-ConnectionGUID: /Pk3YzgsRzeZ4Eh12J3x7Q==
X-CSE-MsgGUID: IyPQ8L+OSxiTgElPEb8i5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189595013"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189595013"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:49 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 715FDE8FE2
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:47 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 19436BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:47 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 99F761A0071;
	Tue, 10 Jun 2025 11:33:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/64] python3-grpcio-channelz: upgrade 1.72.0 -> 1.72.1
Date: Tue, 10 Jun 2025 11:33:01 +0800
Message-ID: <20250610033330.924-35-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117825

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.72.0.bb => python3-grpcio-channelz_1.72.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.72.0.bb => python3-grpcio-channelz_1.72.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.1.bb
index ec6279a87c..0792506e03 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.72.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "3dcb2df1cb9c905f7daaf08bcec214fd082809a59adf1405b66d44f56ef0fad1"
+SRC_URI[sha256sum] = "7dec124f2cefe6d2f2b9176d578496a938a8407ea196eb7a27494f4a40793a0a"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


