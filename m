Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E102AC71133
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78431.1749526425058059186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=avsFSWxa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526428; x=1781062428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AKNPE22tw25c7Fz0DNVv6LhvOhTOBVZczOEQLeYYEik=;
  b=avsFSWxaAHdZ1B8VqWvPX4mBN6Zqn9MDUox2USIOX6MNRYTCzZBdA3hF
   /5g3KwMifmlit7kJpB22UzbrD4DKjdyMMeweopRTSLWobWRLQflh0fr+A
   mq5g/Izwescu2lIA/dMvEOw5khsEn5RSE5wjQY13CF4/HGVsTYqYLMrz1
   ZC96PZkjwFJJROblmFIXHi8HLHT7AWekXQSLrAqJOMKQ53JK0JO8cnX7n
   x6Ku/wBTBmtO51Oy/lwr6oHRyaWAOhb7zNwRK6zZGeiD2kiG0JIK/okTE
   YDp4q4U4ddQB1OgdPuPg7fljJ28ZSwMafgPrkq8nBccO0CyZSS7iq4eLk
   Q==;
X-CSE-ConnectionGUID: fRPV2wTOTr6M2tsshBVFNQ==
X-CSE-MsgGUID: /1SI2ImuQ526q4x2Vd7QKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189595006"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189595006"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:47 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DCA8D5004
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id A2A05D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:44 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 285E41A009B;
	Tue, 10 Jun 2025 11:33:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/64] python3-alembic: upgrade 1.15.2 -> 1.16.1
Date: Tue, 10 Jun 2025 11:32:54 +0800
Message-ID: <20250610033330.924-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117817

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.15.2.bb => python3-alembic_1.16.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.15.2.bb => python3-alembic_1.16.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.15.2.bb b/meta-python/recipes-devtools/python/python3-alembic_1.16.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-alembic_1.15.2.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.16.1.bb
index 49bf054ecd..415b147175 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.15.2.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.16.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2ee18d90dcc02d96b76e9e953629936"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "1c72391bbdeffccfe317eefba686cb9a3c078005478885413b95c3b26c57a8a7"
+SRC_URI[sha256sum] = "43d37ba24b3d17bc1eb1024fe0f51cd1dc95aeb5464594a02c6bb9ca9864bfa4"
 
 RDEPENDS:${PN} += "\
     python3-dateutil \
-- 
2.43.0


