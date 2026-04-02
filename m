Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4609F1112262
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:15:32 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7097.1775096129695242631
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mn/Rr/nx;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096128; x=1806632128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b1gdZeLqoAbyefY1BZPVYsopJH1Uhed0tMW7Khnsf5s=;
  b=mn/Rr/nxXdGzWs2lnXXUW8jFeTa9t4nkO2k+Rfi9LJpoORMuL0BVDvEf
   +mHV4o/SbdkX73361rv2aXTH4ChN2hJm4PR1gQudxNx70P5BR6BY12ucc
   j7D8bwUQnHxj9Brt9zPKEG9FZz4fr0MCI7SRttQIrwF0WvZ2/I31kzC+o
   W5wITWbxVOyp0jgsVHgwAmnZrCEhJnf2jrmCX+ZlSecdrOaSJKF43JRbZ
   bpv0X0CsJAgm4mq9NHNlmkRS5ptEmf1iTRB1dbtYFPiT4VbG4PeGGruOa
   KRhydVzFASzySkL/2D5VxLiGPCVcrM9peWS/fnD6n3emVmW3x9AO+EhjT
   Q==;
X-CSE-ConnectionGUID: M848irDiSfO5bRKhsIQEBw==
X-CSE-MsgGUID: WDuGkffYQsmHAvaDoBfJug==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="236208312"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="236208312"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:15:26 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 2FE7B1C001B5
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:28 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id D483EC012B8
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:15:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 56F381003741;
	Thu,  2 Apr 2026 02:15:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/39] nss: upgrade 3.121 -> 3.122
Date: Thu,  2 Apr 2026 10:13:29 +0800
Message-ID: <20260402021355.1324-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125929

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.121.bb => nss_3.122.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.121.bb => nss_3.122.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.121.bb b/meta-oe/recipes-support/nss/nss_3.122.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.121.bb
rename to meta-oe/recipes-support/nss/nss_3.122.bb
index 99f54c948a..70aee3d9db 100644
--- a/meta-oe/recipes-support/nss/nss_3.121.bb
+++ b/meta-oe/recipes-support/nss/nss_3.122.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "cb3a8f8781bea78b7b8edd3afb7a2cb58e4881bb0160d189a39b98216ba7632e"
+SRC_URI[sha256sum] = "2699478b843b9f09c61f85341578df514463a0069447c816bef0d59bd800d777"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


