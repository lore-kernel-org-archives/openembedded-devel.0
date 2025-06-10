Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11A9C71130
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.78436.1749526427996707314
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XMg7m0Nz;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526428; x=1781062428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iCFCf4TFvhOroYD1O0CDqPU8D3YVrtvyXofnQxZLn5Q=;
  b=XMg7m0Nz9J2tWE8gHcIuPYGN+aQOGkB9Zvr1OYPKd0ePdrSJu3Z8wqp5
   dtzrpj8IS2vKcMrp7dszbIGFGoF4gNzD0BTQDlIOC/n99AjDuG0EGcSDX
   O9QrLGYj+1XVg4gu1pPUvJq6RHOHJlTSBQ5PVt0skKqMK/eO+ylBN5oJ4
   +toE3VvEVVk76idLWMfjK/7vvx8LlUue7fHIr36pY82UHPpj3yHFPJz3/
   LzOe7fe/+WTTFITcN7OINXoLohgIcRH2obmaKBVzOnCcFBtgAEw+MFRbn
   SIooxE5Kwiji69FTmBBiKbliwVDcl+aVpMZftbJUfNj5OyrS7B8cRMqhY
   Q==;
X-CSE-ConnectionGUID: 2A6KubtjReKZWn3KptuTxg==
X-CSE-MsgGUID: YBbPhjQyQ+ef+sFp8VQyFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202680462"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202680462"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:46 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4389AC68FD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id DFCE2D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:43 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 65CEC1A009A;
	Tue, 10 Jun 2025 11:33:43 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 26/64] osinfo-db: upgrade 20250124 -> 20250606
Date: Tue, 10 Jun 2025 11:32:52 +0800
Message-ID: <20250610033330.924-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117819

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libosinfo/{osinfo-db_20250124.bb => osinfo-db_20250606.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/libosinfo/{osinfo-db_20250124.bb => osinfo-db_20250606.bb} (90%)

diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db_20250124.bb b/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
similarity index 90%
rename from meta-oe/recipes-support/libosinfo/osinfo-db_20250124.bb
rename to meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
index 59d80816d2..5c5894da01 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db_20250124.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db_20250606.bb
@@ -8,7 +8,7 @@ DEPENDS = "osinfo-db-tools-native"
 
 SRC_URI = "git://gitlab.com/libosinfo/osinfo-db.git;branch=main;protocol=https"
 
-SRCREV = "5be10e2c781b62bbaa55bd8f9ae990697fc325b4"
+SRCREV = "62f8adceb8ee88e643a134f2cfaf04fc11b9fc51"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


