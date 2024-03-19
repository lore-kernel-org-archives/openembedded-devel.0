Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9A0C54E69
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:36 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.8152.1710827187094772929
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pxhs381k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827187; x=1742363187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=pvR9vh2HQt1+j9PUcFyfinMPfv/FvKZh8wvqsNceeDU=;
  b=pxhs381k8bEM8YSgJN2fOAXIH/PQcKgMWy/eXPRnHCSPZqdYlDA/HQn8
   X/Hhlt8NfL0wVwfhvZpt1VM4tcDzq9tait3C5fg7MwqsuvN7ULUiAYAMB
   y0J+pNxcqNN4IA7c/nj/78/1Xv1dE7B8PZ+lyVSscPFCcv5vZIW1xPFUX
   sJFZoiA1DNjBoB37NQgxt4IJ+YHazGKoWqYDzWV0d39hMkC10TupyVKuV
   JBjP233UCjvmdpKJM97GL3ulHew9WDiNACdNNit6/RMvrxlG2SSiLoV+I
   ACL4kvkOyILL7prxv4qrGfWmFK+eF49z5/S1DL/NE2uTmnOk/MN03XxAE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152964671"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152964671"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:24 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5985914121F
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7ED41BF4B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:21 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A0A421BD45
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B594A1A006B;
	Tue, 19 Mar 2024 13:46:20 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/50] python3-a2wsgi: upgrade 1.10.2 -> 1.10.4
Date: Tue, 19 Mar 2024 13:45:06 +0800
Message-Id: <1710827139-30056-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--1.406400-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytiJsO4rdorwZ7V
	Ny7+UW/9mg3Dwk1+6hrDhTh6GtC1/u1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNSDJQoQ376VxCVGYH9HkXXp8f70Ghra+rcBbHacZcjNCi5hunM3tttvGNhZJMN3dA04vp
	7KAQSD9T2s4z9Ke2oaCBYaeYmZmh/zs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109434

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Fix issue with send_queue in WSGIResponder
-Remove unused imports and unnecessary code in WSGIResponder class
-Update dependencies

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-a2wsgi_1.10.2.bb => python3-a2wsgi_1.10.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-a2wsgi_1.10.2.bb => python3-a2wsgi_1.10.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.2.bb b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-a2wsgi_1.10.2.bb
rename to meta-python/recipes-devtools/python/python3-a2wsgi_1.10.4.bb
index 4d24c4517..e6b980266 100644
--- a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.2.bb
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e10d05d29ec6d8be8bfc503683f1bc9a"
 
 inherit pypi python_setuptools_build_meta ptest
 
-SRC_URI[sha256sum] = "46b2ca427cf9ad538c145e32eb36857e1cbf477b72fe1ed0e3d35e98c06061b9"
+SRC_URI[sha256sum] = "50e81ac55aa609fa2c666e42bacc25c424c8884ce6072f1a7e902114b7ee5d63"
 
 DEPENDS += " \
         python3-pdm-native \
-- 
2.34.1


