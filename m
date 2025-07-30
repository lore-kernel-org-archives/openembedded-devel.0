Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B96EC87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 23:29:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.49375.1753918172614626073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 16:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LmKr0AiV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753918172; x=1785454172;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tQ4e5N8iCdkIwKhxopclb7gE+fTQj65gMoSyZJBvBYk=;
  b=LmKr0AiVL8fH+kSdVW37KiODndQ9Fl6Wg40AC4IlnLaXPy5JHNlK4kre
   Rg9H7JpDSSiroNiuBhpZVmzoOKG+6rpZSkW0wQgbuiMzWef5lvLJCSnWQ
   jj3wH/Q8OFHf343OUbjZRc2Yt5mvsImfoB72xSnns/JEV0DEKrcsmf3ne
   ube2Pfwv8vQvVLF8OHKZVY2tSY/vxyEWSQQGlLLBG71Gkk2oWmQuuFubd
   rIwLwo1wRXBxO/+Afo/bpk+KxNurvq8lvh8AY6PXAWdgWhuiKtCHGGaA5
   yLrFY2KtybGNo7KiBab5UkE4v2/yEiDJw46gAHaPapK0Cq+KN60+Qqbqq
   g==;
X-CSE-ConnectionGUID: 4myGqZyuRySTu6MrPPn7Dw==
X-CSE-MsgGUID: P/IZyycIRSKeiqgT58U7JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="195354473"
X-IronPort-AV: E=Sophos;i="6.16,353,1744038000"; 
   d="scan'208";a="195354473"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 08:29:30 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id C3A0C820700
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:30 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 2F257180630C
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8782C1A0071;
	Thu, 31 Jul 2025 07:29:26 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/40] python3-grpcio-tools: upgrade 1.73.1 -> 1.74.0
Date: Thu, 31 Jul 2025 07:29:10 +0800
Message-ID: <20250730232923.522-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 23:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118800

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.73.1.bb => python3-grpcio-tools_1.74.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.73.1.bb => python3-grpcio-tools_1.74.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.73.1.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.74.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.73.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.74.0.bb
index d380c3b1cf..8444f96c03 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.73.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.74.0.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "6e06adec3b0870f5947953b0ef8dbdf2cebcdff61fb1fe08120cc7483c7978aa"
+SRC_URI[sha256sum] = "88ab9eb18b6ac1b4872add6b394073bd8d44eee7c32e4dc60a022e25ffaffb95"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


