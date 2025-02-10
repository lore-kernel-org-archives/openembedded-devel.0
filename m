Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88FBDC0219E
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.46453.1739178108317225347
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=oIhKKts6;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178108; x=1770714108;
  h=from:to:cc:subject:date:message-id;
  bh=ClvjHZ044etBSePIpLxwCJ4JI1uqbMWEad+cZ1G3yVY=;
  b=oIhKKts6Y+/NVRexjEwLnwRx29ZXBNnRE1omS0fLNkKbtB7YXtBByR1X
   HIPNK/qxDPBVgkxjnte3/HHiIFRV/lpynoxdFp9b/6fQcCt8QtSV4uK8D
   XwQbM+0OjoG/PUp1pgqdWreBeixT1uLOhBwjatQsR3E/xXOreCeprdOuV
   4PcopMBuEtJZ87EkWMFBI7fP3XOtVQDft9w7gDiqiXRVzuo7sys5j9O+6
   lfx76MXFDzgjfULhvLDvAOGSXzCWmiQxPFOkCVFrO7SARFKzAO3Fk96W2
   Kuv466iFBO37qN8sIAiND9C0fD5S8ebiTLAfGT2rxshYKohAgaxZUhsIk
   Q==;
X-CSE-ConnectionGUID: j0WJvdU3Qie6v4sYRKI2bg==
X-CSE-MsgGUID: IBh8Epq0RcO/grQV1SdyaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177444496"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177444496"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:45 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C037D4808
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D64E7BF499
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:43 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 77DF11A000B;
	Mon, 10 Feb 2025 17:01:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 01/66] apache2: upgrade 2.4.62 -> 2.4.63
Date: Mon, 10 Feb 2025 17:00:30 +0800
Message-Id: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115329

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../apache2/{apache2_2.4.62.bb => apache2_2.4.63.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.62.bb => apache2_2.4.63.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
index 4db672c9ab..d4ae26d9c7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.63.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec"
+SRC_URI[sha256sum] = "88fc236ab99b2864b248de7d49a008ec2afd7551e64dce8b95f58f32f94c46ab"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.43.0


