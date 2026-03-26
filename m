Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 199D910A1E94
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:23 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45647.1774526241088991929
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qaZ7YKiE;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526241; x=1806062241;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rSFfUnVmPHUfGpesw1/nRMKkm4U4YMMioWly1NX7nKI=;
  b=qaZ7YKiED6DlV1Jmrm1nheQvjamqu1OnyuE3ye8fBWBX2PKinGExengD
   qWA983DGzvyV40ydXipQeyAsl07jO7y2OMq4ojS1m3DeFUPNMNKiF/LWT
   lYEdK8hAUfRIH4m1/ep5HPk+kDwu6Vdyezen3h5SyGLZkG/RtL273sVFY
   1XGw3iZeUOv5KMC9Nh7TbwA326ibm/Su6WkARhyCdtm7hnyo5dseceKO0
   5VYKXnA5D4qv4U75srQwQHKGb20JJo3beJVtUv7h1d2cIyCdTyW6tTKtn
   /ErNoOY8lJn7CCPafzKndbRJmtg0VBB7wialXSPOfI1aDxM8ZrUo4wVLR
   w==;
X-CSE-ConnectionGUID: kFC0ey0CSpa2/KOwpXSVxg==
X-CSE-MsgGUID: Og44vtaYQGaKT9Xwt3p/mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234652624"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234652624"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:20 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8B5581C166CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:19 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 43658181AA54
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id DE03A1807149;
	Thu, 26 Mar 2026 11:57:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/63] openldap: upgrade 2.6.12 -> 2.6.13
Date: Thu, 26 Mar 2026 19:55:54 +0800
Message-ID: <20260326115634.1199-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125679

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openldap/{openldap_2.6.12.bb => openldap_2.6.13.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.12.bb => openldap_2.6.13.bb} (99%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.12.bb b/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
similarity index 99%
rename from meta-oe/recipes-support/openldap/openldap_2.6.12.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.13.bb
index beee1b2738..59f20d0f08 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.12.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "1716ad779e85d743694c3e3b05277fb71b6a5eadca43c7a958aa62683b22208e"
+SRC_URI[sha256sum] = "d693b49517a42efb85a1a364a310aed16a53d428d1b46c0d31ef3fba78fcb656"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.43.0


