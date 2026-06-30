Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A50C43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:23:11 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17265.1782811388578653558
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:23:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nMhqJTfZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811390; x=1814347390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SbixqI+f2C5iEMNCAVdiZRDREOtms8QAQoYAg/jwDvg=;
  b=nMhqJTfZWhmpz0Hrmj292/9st/gDLB/mA4IgqD8Nj/oNcKCFOHYE2P1P
   qbSHNwlUpRKVcgrNzLQOVLRV61iQKJ+aFMpENVq95cw391MKMnJSHv2dg
   FYjlYiPn/h7XC8wcKhbc29z9bBGCbXrJ7zERWJNYetATV3dpbvr1nXZye
   RCAvuYnTztDj1/Q1iw74yODF6D4m7d/OkZf7G/5oRxJqoilNqdTC0sLP6
   U+yPlJnhiqtmdgu43C0qYwGLyaPjzR8PO6/HX1ZL6cgDtWhDaXBhXRFUq
   zaK3Yk0jdAKF02uTCn+36EGXIwLLtDA3V1bFZay1DOKOESuVREK5qzzX1
   Q==;
X-CSE-ConnectionGUID: T9bV8jZdQvm4x4hNmkRU4w==
X-CSE-MsgGUID: 5yRZSPYmRFmZPFHq2xGOUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="245821301"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="245821301"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:23:09 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E98AF42A307
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:06 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A2E8B101D683
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id C71CB82DDC0;
	Tue, 30 Jun 2026 09:23:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 36/37] uthash: upgrade 2.3.0 -> 2.4.0
Date: Tue, 30 Jun 2026 17:22:04 +0800
Message-ID: <20260630092206.322-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:23:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127978

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uthash/{uthash_2.3.0.bb => uthash_2.4.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/uthash/{uthash_2.3.0.bb => uthash_2.4.0.bb} (90%)

diff --git a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb b/meta-oe/recipes-support/uthash/uthash_2.4.0.bb
similarity index 90%
rename from meta-oe/recipes-support/uthash/uthash_2.3.0.bb
rename to meta-oe/recipes-support/uthash/uthash_2.4.0.bb
index 357ddfdbca..99955047e2 100644
--- a/meta-oe/recipes-support/uthash/uthash_2.3.0.bb
+++ b/meta-oe/recipes-support/uthash/uthash_2.4.0.bb
@@ -8,8 +8,8 @@ DESCRIPTION = " uthash-dev provides a hash table implementation using C preproce
 HOMEPAGE = "https://troydhanson.github.io/uthash/"
 SECTION = "base"
 LICENSE = "BSD-1-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=736712b5904dd42f8678df7172bc5f2b"
-SRCREV = "e493aa90a2833b4655927598f169c31cfcdf7861"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0b257b732f65d04fed014f018f7c72fd"
+SRCREV = "a49bed0b4abb7dff16c73906dcdc8a9718d582d2"
 
 SRC_URI = "\
     git://github.com/troydhanson/${BPN}.git;branch=master;protocol=https \
-- 
2.43.0


