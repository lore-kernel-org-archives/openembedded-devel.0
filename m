Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1627CD98F5
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11262.1781686703342168059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DI6933BA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686705; x=1813222705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TT4Ja/pY9p/msEn7GFdgWJQLICFdnhALUBPf8IMUzRc=;
  b=DI6933BAmT+1zq2Kh/DB2mybWybGAHzt/sr+xIZJ1ySurdmD481o/5ag
   BOrM0n8A0O7AAV8tU/dKEbxDBA/nVRyTdRCgP47gAFAQVrCo2XaZw3G69
   voeZnzOADgfppNbryJ+lvvCSK3nVRJHDH1LUcpqjK3VwUpfTSAEfntQh+
   KTrQY1kZtQn4lQLqoicuGlsywQWSn1uIsHdX2VBHgRR8aR4oEHIUIxvRq
   YmMYF2V7JRAzQMYFui3dZTHyu/vilseNcqxvl74jpZ3AJVqozu59sDeNY
   afVC07wpHrEoF1md4qFo8E/dl4E7955pDBRmcYaSCnTu5ctbsEcrdGdeJ
   A==;
X-CSE-ConnectionGUID: hJYmBtwbRO+SDVt2SfzzJg==
X-CSE-MsgGUID: xSGoKlrqQYCz0SFXNAKnXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="231794151"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="231794151"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:24 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 89224C0009E
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:24 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 3B229149D8FF
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 618E91000A47;
	Wed, 17 Jun 2026 08:58:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/17] nss: upgrade 3.124 -> 3.125
Date: Wed, 17 Jun 2026 16:57:56 +0800
Message-ID: <20260617085807.542-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127643

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.124.bb => nss_3.125.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.124.bb => nss_3.125.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.124.bb b/meta-oe/recipes-support/nss/nss_3.125.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.124.bb
rename to meta-oe/recipes-support/nss/nss_3.125.bb
index 0305a56311..4a9db7e6aa 100644
--- a/meta-oe/recipes-support/nss/nss_3.124.bb
+++ b/meta-oe/recipes-support/nss/nss_3.125.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "80da9f1cbcb267293b2248818d288bc02f874d6a34f1989a2828401d74a0bc9b"
+SRC_URI[sha256sum] = "1ad541f10da7c58dec01f540ecc44d28cbbc033f741a57473de5a0893d91606d"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


