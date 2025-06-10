Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9731C7115D
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.78436.1749526427996707314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=h/r3M4JC;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526431; x=1781062431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O6eVOd4L0OhEB57nhtLY5xrdvWcFNNsfac2V3+lWO4s=;
  b=h/r3M4JCoXlFC6L9mnNhVqNm/ZoOwCniUuyi7Q27Yc6K4mydh8LBguL6
   lgSs0Wc0jGBc/Xjwt83AnHRsGm3DKsQ6Yj9riTdUeI89IHhAJmTydv9gh
   zVROqEgdxN5LWzPTqSdg9DTPl3wqGnEr3Xvou7TQxzy0btJ9BpbzppvqY
   NQVTmG60iDo3KpAJZv+cMsbAqARrv3Q8Z+ePY7Buof30zPMzGUWlX/zAo
   ydxXQHJgaxgyV9Z1aA2orVZQnwUoW1UT3VC+DToCgqbnUyO2cUqxdJzSX
   jTT9SF67sW3jPfb/UdlZ9HI7fTfHxn9dcPKew5Sy7a1RzHUxqGexJUBBK
   Q==;
X-CSE-ConnectionGUID: oa/EIrRHTW2uM9mCtH5e2Q==
X-CSE-MsgGUID: TUZqbYB8SkCv8VR334llhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202680473"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202680473"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:50 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 353E2D4C24
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D202BBF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:47 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5B9E11A0071;
	Tue, 10 Jun 2025 11:33:47 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/64] python3-grpcio-tool: upgrade 1.72.0 -> 1.72.1
Date: Tue, 10 Jun 2025 11:33:03 +0800
Message-ID: <20250610033330.924-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117827

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.72.0.bb => python3-grpcio-tools_1.72.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.72.0.bb => python3-grpcio-tools_1.72.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.1.bb
index 071833766f..52d68c71a9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.1.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "23144adf063fad5665160bcdc397220f2dc29e11b7dde88ae69bd9672ff8d9db"
+SRC_URI[sha256sum] = "a11afb21d0e960eb41f3c3053206e9271ec42579582c13193b99a0dca6be86d1"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


