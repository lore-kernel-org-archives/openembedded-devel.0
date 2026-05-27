Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4793FCD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16933.1779875330237326695
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hIEj1sLB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875331; x=1811411331;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=42HSb3JcaELNQioiO61ShHfhy5NmdyxjnTZBdKixcm0=;
  b=hIEj1sLB85XRDZAUlXdQYsf4vP/7S3eGoNsA6JO5o6V3ewpLpTrvBIb3
   XnBJU0h4ag9knRf+bA3pvjfLou//VvGL9IfD53ebLKgJBWHoRWvr2IwEs
   LqXaXqcoB5f93PZTyPzWDy+i028h5+io+dMNeIyf2VhHRKGXgvJJJs5oL
   79WXIFpJg0sv7CMUazDKSWcFeseETg/ljBtsSDH2JzjIlLd5MKaFBVY2J
   GkWxIe7zd64NNQtK/ecxlwG3IbEASwCAILEj0SpKLkY+atk/Bnb9iWKfN
   gjrBtWbO9TIXr61pIyOiTuiR9iZN368fYnz9b/CY0+cW3Zd7qHsEOh0Lg
   g==;
X-CSE-ConnectionGUID: MIi4YsVFQCu3BxFHYxJm8w==
X-CSE-MsgGUID: yFRiOQuySYObYy8ZiJ6H+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="241969812"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="241969812"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id A5A75C0034A
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:48 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5E694148AD33
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 5FE3A82A2D5;
	Wed, 27 May 2026 09:48:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 18/56] nss: upgrade 3.123.1 -> 3.124
Date: Wed, 27 May 2026 17:47:27 +0800
Message-ID: <20260527094805.2039-18-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127225

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.123.1.bb => nss_3.124.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.123.1.bb => nss_3.124.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.123.1.bb b/meta-oe/recipes-support/nss/nss_3.124.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.123.1.bb
rename to meta-oe/recipes-support/nss/nss_3.124.bb
index 413f0ef2ac..0305a56311 100644
--- a/meta-oe/recipes-support/nss/nss_3.123.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.124.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "42065a3ff780a9710a3dddcd1cee9b9be2aa40628883cea851d562eb58b178b0"
+SRC_URI[sha256sum] = "80da9f1cbcb267293b2248818d288bc02f874d6a34f1989a2828401d74a0bc9b"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


