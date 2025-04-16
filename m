Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45337C369CE
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.14428.1744794157592922888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rvsDlWsv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794158; x=1776330158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gerD5pRMCPAJil9HGGCg+MX3Y8uS8R1Sp/iGVolBG1w=;
  b=rvsDlWsvhMpWKjkxcO96KK8jB4JZZ2elSFQCC0TLCjdvOUXD/Vpl0vP7
   Z2NV/TCVKefCl+agXF4e7fx3fEiPOwg7zHQSqIkUsdkonfLwH88FqbIQf
   ZZPYrqFqRgifrP1kHSv+djeA1pmRk0GWP3DUaFCXOGf3pJfnzZKn/jB1g
   IcWB8mW52EpxM1r3ke+hWVBcpLb+z9FaQyuBedGll2NsBctpd9VjXxcLt
   4gfO6Dv7fUglRBZS9UHc/OYnpnLqSdN1YcCko5v2kxzAimeAtaTZJIUdI
   Js0zZYNv+la9CtaBoSgzgVIOGE3KrG7tlZn6ClZWRE579EeOOU+f29Vis
   g==;
X-CSE-ConnectionGUID: sNtVfFXbQHipOafSY4IDFw==
X-CSE-MsgGUID: N/Wm9GqcRAy61Z8q370TRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="176080456"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="176080456"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:35 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 321EED6EA7
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id E5651D50F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3F431A009B;
	Wed, 16 Apr 2025 17:02:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 31/31] valijson: upgrade 1.0.4 -> 1.0.5
Date: Wed, 16 Apr 2025 17:02:16 +0800
Message-Id: <1744794136-908-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116895

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../valijson/{valijson_1.0.4.bb => valijson_1.0.5.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/valijson/{valijson_1.0.4.bb => valijson_1.0.5.bb} (90%)

diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb b/meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
similarity index 90%
rename from meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb
rename to meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
index f061c391b8..9661d57e2f 100644
--- a/meta-oe/recipes-devtools/valijson/valijson_1.0.4.bb
+++ b/meta-oe/recipes-devtools/valijson/valijson_1.0.5.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/tristanpenman/valijson"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5c4583a434195e4f3b418e17c8ca2daf"
 
-SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https"
-SRCREV = "7d59abf50cff4ee53e6584e6d6aa201a19fb5b51"
+SRC_URI = "git://github.com/tristanpenman/valijson.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "8b320f25676030ba13fb90c1bf06133df2628086"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


