Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51493C36000
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 08:58:07 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.2935.1742461077026634519
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 01:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bL7Es7oH;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742461077; x=1773997077;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=O+Pyrw70RxMadw4ry0N53TLyeipOZb2R0KLjtpv1oHo=;
  b=bL7Es7oHyydCPPHLf1QzyMvbrzuoCGT9SeotPND7t5hIGet0v76FdpHF
   MQTt47PoGRAIhbmNNlR5P42YzwW27EVnS7+IxeTRNW9ZevX8EWNvV4CVX
   R2m3wXooiNZjm1iC2QSzOF6HdnaWqtE5TJ9DkXgxuTCwNp2BjNa16CMY4
   tVq9YhWP5Y3MgGXBJNIxG6G5C5xyoDXsBI5QHu15W5FGFCtDBA9u6uqRi
   VuDoHA9n4Ucgn8aKlhKKsoQMb7mWreLpXrqQ5qcF2Q33vc24z62BbJlnN
   IYXT/KSXV5Fn0Dm/Wo4lLLqqxXXRj18/x/IYvGmkhQL2qqAAJODQtNLd4
   w==;
X-CSE-ConnectionGUID: JGT+iZopTs+4J5OpwrM/EQ==
X-CSE-MsgGUID: hJaXjU0XRoe7bDXuSkOkJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="181036630"
X-IronPort-AV: E=Sophos;i="6.14,261,1736780400"; 
   d="scan'208";a="181036630"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 17:57:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D02F8DC717
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 947C7D52D1
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 17:57:52 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 255651A009A;
	Thu, 20 Mar 2025 16:57:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 5/5] geos: upgrade 3.12.1 -> 3.13.1
Date: Thu, 20 Mar 2025 16:57:43 +0800
Message-Id: <1742461063-20828-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
References: <1742461063-20828-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 08:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116128

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-navigation/geos/{geos_3.12.1.bb => geos_3.13.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-navigation/geos/{geos_3.12.1.bb => geos_3.13.1.bb} (88%)

diff --git a/meta-oe/recipes-navigation/geos/geos_3.12.1.bb b/meta-oe/recipes-navigation/geos/geos_3.13.1.bb
similarity index 88%
rename from meta-oe/recipes-navigation/geos/geos_3.12.1.bb
rename to meta-oe/recipes-navigation/geos/geos_3.13.1.bb
index 461652a5ad..ba01968052 100644
--- a/meta-oe/recipes-navigation/geos/geos_3.12.1.bb
+++ b/meta-oe/recipes-navigation/geos/geos_3.13.1.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "http://download.osgeo.org/${BPN}/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "d6ea7e492224b51193e8244fe3ec17c4d44d0777f3c32ca4fb171140549a0d03"
+SRC_URI[sha256sum] = "df2c50503295f325e7c8d7b783aca8ba4773919cde984193850cf9e361dfd28c"
 
 inherit cmake pkgconfig binconfig
 
-- 
2.43.0


