Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C439C3ABB6
	for <webhook@archiver.kernel.org>; Tue, 29 Apr 2025 04:15:54 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.7616.1745900152223001330
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Apr 2025 21:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k+HuUnxz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745900153; x=1777436153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=k+2pPKSSFIhUPjLfvDsfBI7ibYL4n4zrx32Pb5tuvZc=;
  b=k+HuUnxzB7OIqcRr2AxNpumgtBGNyreSXDSrChwNmmD6Qp2QMfft8pEp
   11/VCj1zrCBjEw2370d76kQFmyX6TJXYhBCNRu3MOw+UCB1V02MJ3OCA6
   KjfD2VUd7b4MMgRKyRMRXGiCpMUsNzUiUNvRJkR392DafgUgvvzQ0g4KX
   LoeO+OGL76hqAatj0lQr541Z0umdfpiQI6L0V9z/A2g6FF3SVTRd86P3w
   74Zp+3oXTDAZXs7J6+hbZiPK9nia/o4DO554y5/zDLObkabs1BwDoePuz
   3SBZgsbfwOgr/DFlAuTMBwCdn8/KPpph8naLK0Ui9EbJbV/mXlAac5Abh
   Q==;
X-CSE-ConnectionGUID: 85CLfXPQQZ2gfPwK4y5HNA==
X-CSE-MsgGUID: 33yiCK9nRpmSzeiL71j3Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="186390925"
X-IronPort-AV: E=Sophos;i="6.15,248,1739804400"; 
   d="scan'208";a="186390925"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:15:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BC34BD4C31
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7A4EAD88A7
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 13:15:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3A41A1A0071;
	Tue, 29 Apr 2025 12:15:49 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/23] python3-grpcio-tools: upgrade 1.71.0 -> 1.72.0
Date: Tue, 29 Apr 2025 12:15:30 +0800
Message-Id: <1745900138-26424-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
References: <1745900138-26424-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Apr 2025 04:15:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117220

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.71.0.bb => python3-grpcio-tools_1.72.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.71.0.bb => python3-grpcio-tools_1.72.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.0.bb
index 59fd54cba1..071833766f 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.72.0.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "38dba8e0d5e0fb23a034e09644fdc6ed862be2371887eee54901999e8f6792a8"
+SRC_URI[sha256sum] = "23144adf063fad5665160bcdc397220f2dc29e11b7dde88ae69bd9672ff8d9db"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


