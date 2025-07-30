Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CF9C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:19 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.31371.1753869307251550651
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Iyg2MdMN;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869309; x=1785405309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=niZYw/HWwFnTigM9iOeDeE+RAglefQaZ7QBiT2XD93U=;
  b=Iyg2MdMNwybEJrOWgmRJCSxgMCR+qW4X0YRok8wuJhHkk10HpCRH/+y8
   HRbXvj/ZOIS8la66ZmqdM1a7M4dwEt5hbRLVm78u/kQ03NrffUjAIqLOq
   2PAF+EzcmRkKBZ/n/djckaRBII7881HnxzH2gNm251wtvbST867mpanir
   RBMniCNfAh9fL2EuyYZpKZq6V9WVUgyq56fAPoZsK6IXZKi90Qu8Y4Nrg
   TR21PmNfLOz7U3wHvEQHOhtU6z8dO7uzLvSWKOx5KsaiH9WaXxut6IU2f
   27j6f32Jc75G9g2sRWWQGmyYXxy/6EhjlWmP7DI7IJa63dGj7CvFQrtvR
   w==;
X-CSE-ConnectionGUID: /MeoFGemT9Ch/dXLH5lqcw==
X-CSE-MsgGUID: UclaD4aORPqM1Aw22eKISQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="186784565"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="186784565"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:08 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id BC0851C1C700
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 34B1183D96D
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EEE021A00A2;
	Wed, 30 Jul 2025 17:55:04 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/40] parallel: upgrade 20250622 -> 20250722
Date: Wed, 30 Jul 2025 17:54:34 +0800
Message-ID: <20250730095456.695-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118783

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../parallel/{parallel_20250622.bb => parallel_20250722.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/parallel/{parallel_20250622.bb => parallel_20250722.bb} (93%)

diff --git a/meta-oe/recipes-extended/parallel/parallel_20250622.bb b/meta-oe/recipes-extended/parallel/parallel_20250722.bb
similarity index 93%
rename from meta-oe/recipes-extended/parallel/parallel_20250622.bb
rename to meta-oe/recipes-extended/parallel/parallel_20250722.bb
index 739263fe30..fc7376ce56 100644
--- a/meta-oe/recipes-extended/parallel/parallel_20250622.bb
+++ b/meta-oe/recipes-extended/parallel/parallel_20250722.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "69f578cf11f1b124ba3c2b673a16641debe63aeb3d2ac4cec5ad65f8a53d489b"
+SRC_URI[sha256sum] = "91a81ff4129cdf5ad3c3c45ec033e75f2bbea5447f4b6813a0d8cfe8e5c7843b"
 
 inherit autotools bash-completion
 
-- 
2.43.0


