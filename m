Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FABC54ED1
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 08:55:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.16223.1747731320177562264
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 01:55:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EkH6OTUB;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747731320; x=1779267320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=rlAGlsnyisOXH0IOd7nH+pH1Xm85s2E+U8jiF9WEPQY=;
  b=EkH6OTUByL3ChJNWpahO6UyZGl08vDyamgkfvRdlRGOpBXBsua8Yija6
   fMGizzSvA8hklIN8sYYlXngugP07RHW5MprdJp57/HL0mZraXHhf4wTJa
   JFdYxuy0ieRmDwk/gxW2qOc9n4fwSND58tTzsY3ulPMcLpdSlJsrSSHQy
   ZJByBXP+vX1fB7XoDCfgT/u6bfoCh9TgJSyucPazEqmFO83VvhsXZGnuY
   wQh3wXcgDcibYUZ5WXImn36H8kILekXrcqbMeImPWYYlrcqV8Sav80wmM
   MElUKJrjz/apbL8iVLdNmfxaufKDIu7Zxq4PoaUoertmdVGWgYha62p5F
   A==;
X-CSE-ConnectionGUID: L+c0F5hhRj6Z6nqkhVg+jQ==
X-CSE-MsgGUID: h3kvjnV/SB+spbD6gO+ESQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="178940649"
X-IronPort-AV: E=Sophos;i="6.15,302,1739804400"; 
   d="scan'208";a="178940649"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 17:55:17 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 456CAE8FE7
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id EB50FBF4B5
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:55:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7EC3E1A0078;
	Tue, 20 May 2025 16:55:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 17/27] nss: upgrade 3.110 -> 3.111
Date: Tue, 20 May 2025 16:54:49 +0800
Message-Id: <1747731299-20448-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
References: <1747731299-20448-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 08:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117499

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.110.bb => nss_3.111.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.110.bb => nss_3.111.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.110.bb b/meta-oe/recipes-support/nss/nss_3.111.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.110.bb
rename to meta-oe/recipes-support/nss/nss_3.111.bb
index 1e7894ac60..b101ae989b 100644
--- a/meta-oe/recipes-support/nss/nss_3.110.bb
+++ b/meta-oe/recipes-support/nss/nss_3.111.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/$
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "9cd610c40422a07771b9b45166be2d052ea2f00b605a7928129e1f2071b3ae27"
+SRC_URI[sha256sum] = "5a4d5a44e91ef03cdc0c4897cf616e3c92f4e590ea835d3e0ccad8b005bd73c6"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


