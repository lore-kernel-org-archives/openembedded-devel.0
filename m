Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4ACCAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:13 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.15425.1758015728763491680
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bsKT3rSL;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015728; x=1789551728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sb4Ee3yWjP7TaM5tL0AEfqWPnebvV07O+CRFb8tkhMc=;
  b=bsKT3rSLBQHUyNzX+KPXWWyNZSi34PAwDD/vJM0XpdA0QUEiOxTyWQM5
   j8ImuplTe+xQ21JwxtZj2eqkAn9W2SxqK4NpxCXP+PrbNuOkiLZCeHIFd
   1dbDPkQKpVUzmJjczlWqYVxy6nhi7d44XQveZCcmbgtoP8tt+8XeWTrTG
   ytY4qaID2qMVxirDEhgLJlYzCTFrIJg3jK+OV5fawhgINXwyusoZQvNTE
   pTcNXlwgluqadIfpzi54tn5ziYAApn0AuDSl/s4+QDmy+HSU3GNo0Oe7H
   xyjFHbXg4ODzUEJ448PGTw5ugObsT9ub6W83IeVclPYZGqbHmY8Cw+QNo
   w==;
X-CSE-ConnectionGUID: zqm5gH9DTXe/BO4iili4JQ==
X-CSE-MsgGUID: shD8iZz2RdupfveA76s1aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="213534100"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="213534100"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:07 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 3BD7542A30E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:07 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E6CCA1800E8E
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:06 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 330D91801555;
	Tue, 16 Sep 2025 09:42:05 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C27071A008D;
	Tue, 16 Sep 2025 17:42:01 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/42] python3-dnspython: upgrade 2.7.0 -> 2.8.0
Date: Tue, 16 Sep 2025 17:41:30 +0800
Message-ID: <20250916094152.1479-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119443

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dnspython_2.7.0.bb => python3-dnspython_2.8.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.7.0.bb => python3-dnspython_2.8.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
index 9c1d4b39f2..f8f78f1016 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "ce9c432eda0dc91cf618a5cedf1a4e142651196bbcd2c80e89ed5a907e5cfaf1"
+SRC_URI[sha256sum] = "181d3c6996452cb1189c4046c61599b84a5a86e099562ffde77d26984ff26d0f"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


