Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290FDCAC5BA
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 09:42:14 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.15063.1758015732537559465
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 02:42:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l4BvBguM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758015732; x=1789551732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O77BUXdrb+eOTWE7pHP+aTkBMfa2ZhKX2J+li1cLATA=;
  b=l4BvBguMkDXMdjB1JWSjIBnSmp4vq+JIdnUcjacNBKEpFq7zwytEXl5V
   CKBPE8BIJ/4z5XMhw2gvS/VZ9WoNARnxNdvIhUPiRC1jsdgI65aEXB7uj
   xGNxP9ZwhcTOSSkaWjDq4PaCYw8W736uUb43r2ewh1qkioOs94TKSoZWb
   lsFeCJQD8/HKuMxWi+aYy463tS+DnHutUIBDNNLeYSBtCMsNxtXpIO/UL
   vZC6gGC5pqtTZvxYHAEZFUpU4XkmZ4/8FoV8zWImNRVaQM1YGJBnC2LGv
   b7TfyMC/siysJxJQjVCLxHBxz/iv2OFrL2wfzQ8OZX4Gmz//JUEHu6/+7
   g==;
X-CSE-ConnectionGUID: 9V/VzkYzS2m6jsuAhzq37Q==
X-CSE-MsgGUID: Ab3rrO4LTVy8gAiBguna1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="200927287"
X-IronPort-AV: E=Sophos;i="6.18,268,1751209200"; 
   d="scan'208";a="200927287"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:42:11 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 0BFDB42A30B
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:11 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B66801C00117
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:10 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 138081801555;
	Tue, 16 Sep 2025 09:42:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A58E11A007E;
	Tue, 16 Sep 2025 17:42:05 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/42] python3-sdbus: upgrade 0.14.0 -> 0.14.1
Date: Tue, 16 Sep 2025 17:41:41 +0800
Message-ID: <20250916094152.1479-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250916094152.1479-1-wangmy@fujitsu.com>
References: <20250916094152.1479-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119454

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sdbus_0.14.0.bb => python3-sdbus_0.14.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sdbus_0.14.0.bb => python3-sdbus_0.14.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.14.0.bb b/meta-python/recipes-devtools/python/python3-sdbus_0.14.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sdbus_0.14.0.bb
rename to meta-python/recipes-devtools/python/python3-sdbus_0.14.1.bb
index 848a6ac01c..36af5fd22d 100644
--- a/meta-python/recipes-devtools/python/python3-sdbus_0.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sdbus_0.14.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-sdbus.readthedocs.io/en/latest/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "41d61b76cc05a9ea41d10d70a11e9f9a86ed95f40f713630c5e18340e0e4c76f"
+SRC_URI[sha256sum] = "424364e03853817398aa31c945aeac8f681f012c7bf808e73f60e7365ff54251"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS += "systemd"
-- 
2.43.0


