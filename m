Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF4F1C282C2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2199.1740525896246915191
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R2snLO+H;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525896; x=1772061896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=PE7EHN6bZEOiqOxiLYvCQOGEKjML5VwONOx4dR25K8U=;
  b=R2snLO+HeyTEZfioaHr48wrFR5ovDtg3k6rMuSF7f0l/KHnFt4ShpsxC
   oD39C2DfI1eX6O9uw1tpswaJ0vwpGZz0/51jdTm2xkllJ13MJnH1JPThT
   DgaxV9l/YSRBpHpu3oFGDuVplEZRoYWyKYm+EZt+UtqAGNIt7vvutFsJH
   UE6+OB1/vUv6nuiGCPvyfjlDtV+kyfRnc9oYmEs5jc+ehR7bsgwLDayFD
   OZWTMQZzdmOq9k5wGOivlW/hhUf7UVbRp502bgfB3FN1o9CUJEagzl//B
   vzvv06yuMFkmk01eK6Dy+C47INthF9NMclpczdl9pCPFk6v0SyO0E49UX
   w==;
X-CSE-ConnectionGUID: iqZ9r2Z9TA21aqiQPhMveQ==
X-CSE-MsgGUID: sPLdfgt5Tgu7Ow+jjcmNfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="191127595"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="191127595"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:53 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 82AF8E6141
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 41A78BDC81
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:51 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D9F931A000B;
	Wed, 26 Feb 2025 07:24:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/51] cglm: upgrade 0.9.4 -> 0.9.6
Date: Wed, 26 Feb 2025 07:23:52 +0800
Message-Id: <1740525881-21103-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115600

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/cglm/{cglm_0.9.4.bb => cglm_0.9.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.9.4.bb => cglm_0.9.6.bb} (92%)

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.9.4.bb b/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
similarity index 92%
rename from meta-oe/recipes-graphics/cglm/cglm_0.9.4.bb
rename to meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
index 6fcc07d92b..cbcd6c0c6e 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.9.4.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
 
 SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
-# Tag v0.9.1
-SRCREV = "1796cc5ce298235b615dc7a4750b8c3ba56a05dd"
+# Tag v0.9.6
+SRCREV = "144d1e7c29b3b0c6dede7917a0476cc95248559c"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


