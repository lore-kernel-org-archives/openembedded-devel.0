Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66DABCD3423
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:19 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17452.1777546214865337242
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r8gCicb7;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546216; x=1809082216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QZYBo7uppRSSlWbJpZLOEp/a9m+JBbn8bVTb+6KMi0o=;
  b=r8gCicb73Q8OxbXqGzzLnrI+kaU6nNLOQ6gv1SCZPhfe6pqUcMnc8d/5
   /KywV9jql529M1EKjsiZhG84Z41KVo3UyTXQvMejIgwdVt6+b4AbVqArK
   /1XcJTx7HUiZPM7bkn4M0gUawemDNqCKv8zFmtCzwpo3qSNIfk92SSRra
   Cw3DxLL+JgdKTkzjhmw/lKYsiV7mvEkeV7b7PolcPWnFthyttavQiR6UL
   KfVf8SWrsLRoqPr4T7z2hNnXzTrUcEUf+eVtUE84iL8F6QnoYiOpTk765
   lB/NBAlmOiGElrjMnfCaHZWog2LlBXhnvqTSn8UPvqYl2yiCaZZn4PHtK
   w==;
X-CSE-ConnectionGUID: KN/p/Q+WSdm1iDOvdharZQ==
X-CSE-MsgGUID: DF40EAaoSRCuf+E3IBV/Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238566097"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238566097"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:13 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B6AF21883
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:13 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 5B2491801E9B
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:13 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id C6CC0180113E;
	Thu, 30 Apr 2026 10:50:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 25/64] nss: upgrade 3.122 -> 3.123.1
Date: Thu, 30 Apr 2026 18:48:44 +0800
Message-ID: <20260430104924.1106-25-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126698

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nss/{nss_3.122.bb => nss_3.123.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.122.bb => nss_3.123.1.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.122.bb b/meta-oe/recipes-support/nss/nss_3.123.1.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.122.bb
rename to meta-oe/recipes-support/nss/nss_3.123.1.bb
index 70aee3d9db..413f0ef2ac 100644
--- a/meta-oe/recipes-support/nss/nss_3.122.bb
+++ b/meta-oe/recipes-support/nss/nss_3.123.1.bb
@@ -33,7 +33,7 @@ SRC_URI = "https://ftp.mozilla.org/pub/security/nss/releases/${VERSION_DIR}/src/
            file://0006-Fix-nss-multilib-build-on-openSUSE-11.x-32bit.patch \
            file://0007-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "2699478b843b9f09c61f85341578df514463a0069447c816bef0d59bd800d777"
+SRC_URI[sha256sum] = "42065a3ff780a9710a3dddcd1cee9b9be2aa40628883cea851d562eb58b178b0"
 
 UPSTREAM_CHECK_URI = "https://ftp.mozilla.org/pub/security/nss/releases/"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>\d+(\_\d+)+)"
-- 
2.43.0


