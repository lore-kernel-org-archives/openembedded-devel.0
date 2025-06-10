Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135DEC7113C
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.78435.1749526427263811306
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YqDoUurU;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526428; x=1781062428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LvxqsYV1g0aJdkWNM8tXCI80d++Sv2yjB3uXmlxBDrI=;
  b=YqDoUurULBKD3dN70AGSUar1HmvxTUMZI8IqEO9iVVJLh0HrZvHyjK7Z
   l02wkDSvIspOod5keF30PS+9jjoQW0+YLv+jsFiep88U/97fv3m5P6nEr
   IAPjyv6Y3ZqSLpO2yIgUlp96tbLiA9IjWe4pVheQIi6Q3QhD+SDlSnswl
   bcqkvoCrkXcaNlj34vsq8etjJveaE30m7c6kXa2sbRURi5zYSeHdhKqkO
   YvYDrkcYFqhrTVAIB7kEYfRFlJGpOS7EEdgqDmo3pbJwhqk2r+yxv+491
   NzlwIRaXPFg94LR9hKfJdWPh+Si5si5UfTpkYhSX1yOHMg73HyTa/8m+5
   w==;
X-CSE-ConnectionGUID: 69OsQJsRSxGcFY9Gptzojw==
X-CSE-MsgGUID: 8UCMINprRwmZlBR2KC+lag==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="202190294"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="202190294"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5B852E0ABD
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 08492BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:42 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8746D1A0071;
	Tue, 10 Jun 2025 11:33:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 21/64] libzip: upgrade 1.11.3 -> 1.11.4
Date: Tue, 10 Jun 2025 11:32:47 +0800
Message-ID: <20250610033330.924-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117814

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Use separate cmake package files for library and programs.
* Improve documentation.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libzip/{libzip_1.11.3.bb => libzip_1.11.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libzip/{libzip_1.11.3.bb => libzip_1.11.4.bb} (91%)

diff --git a/meta-oe/recipes-extended/libzip/libzip_1.11.3.bb b/meta-oe/recipes-extended/libzip/libzip_1.11.4.bb
similarity index 91%
rename from meta-oe/recipes-extended/libzip/libzip_1.11.3.bb
rename to meta-oe/recipes-extended/libzip/libzip_1.11.4.bb
index 2d26ea59b5..039973fdbf 100644
--- a/meta-oe/recipes-extended/libzip/libzip_1.11.3.bb
+++ b/meta-oe/recipes-extended/libzip/libzip_1.11.4.bb
@@ -21,6 +21,6 @@ inherit cmake
 
 SRC_URI = "https://libzip.org/download/libzip-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "9509d878ba788271c8b5abca9cfde1720f075335686237b7e9a9e7210fe67c1b"
+SRC_URI[sha256sum] = "8a247f57d1e3e6f6d11413b12a6f28a9d388de110adc0ec608d893180ed7097b"
 
 BBCLASSEXTEND += "native"
-- 
2.43.0


