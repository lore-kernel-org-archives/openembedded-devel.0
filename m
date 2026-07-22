Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA45C531C8
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:24:20 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44609.1784715826327646981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gSBbyHjs;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715827; x=1816251827;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AO1/sU4TGVY6TAElxsReGrsPuBLSosxMDCjIzOH2vnI=;
  b=gSBbyHjsbOrRA6OqEHIxgZhyIeDUqVT6UPuHUMOZb7+o8P3I1F+sqgBE
   bRehVHj5zZ0bf/D56/iAtMl7E8dL3Cg7WJp6KkXOZJwhTK7qOMQCP4kWG
   6VZd9v105ugyGulgx0goWtQh9BvigE+LOwMLspp6Gb5or2NymixIvj/y0
   okPuMOOoYO0ehDA9y3lyDUz1pESZ+g4kARgRrEagHDUC/RrrsnwD/vpHR
   Z3qpiSZqomp2QnFmMRmAJQOzz1UZH5Jj+g0S3661PCy58wjD9pX4w0vlm
   H7EUp0i/6XnMoTyRZBNS/7R+mKV7Kv2jrGx9jpkLiyeLzGEz5tIX1p2wf
   A==;
X-CSE-ConnectionGUID: wuG0gmT+Qo2z8r5UfnUlfQ==
X-CSE-MsgGUID: RcQ80hILTASZzqiSf/RtEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="235655280"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="235655280"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:23:46 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 61FDA33D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:46 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 0BB6B180F57E
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:23:46 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 0D71A405987;
	Wed, 22 Jul 2026 10:23:43 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/37] nss: upgrade 3.125 -> 3.126
Date: Wed, 22 Jul 2026 18:22:54 +0800
Message-ID: <20260722102320.1019-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128381

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.125.bb => nss_3.126.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.125.bb => nss_3.126.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.125.bb b/meta-oe/recipes-support/nss/nss_3.126.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.125.bb
rename to meta-oe/recipes-support/nss/nss_3.126.bb
index 75965be9c7..f26e70539f 100644
--- a/meta-oe/recipes-support/nss/nss_3.125.bb
+++ b/meta-oe/recipes-support/nss/nss_3.126.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "1ad541f10da7c58dec01f540ecc44d28cbbc033f741a57473de5a0893d91606d"
+SRC_URI[sha256sum] = "7aa07c758be1453d82d739240b249ffb7aef0041be488067e1c0f348e1f9e337"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


