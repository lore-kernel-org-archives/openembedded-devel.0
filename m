Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D10EA3C2D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 10:33:40 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.128822.1775730811354953891
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 03:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fJh0v80O;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775730809; x=1807266809;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/ZoW6vPxxLITzwHKhuKXJ7vRJvKs4OdGMyafhoE5rWg=;
  b=fJh0v80OJbIimVl2akQbl8Xh4pDErlQzm9ZvZSDSAYolFiUSq/ODf6j7
   rXHgxzKOfXMQAixv99A/ozMMgLcHjmZQYCrykJnKQ1NzVsV+qZsZc9p2O
   E88aKXa5OZNyNITZhSVg1c882HDFioH8633Y9dUrkL9U8j1gF06eoY9cD
   9mKiBV1Kpkk9qfeWwm6/UAK7jjY5gUGl3dRiOpmJBfBRypGbm/mVtHDW0
   IU+vKJfMHqvd8HiLEJHIqpOG1B9Pn6Od5HO8Fx+HCdPSDltAk2At/dC9P
   2509ZRTCTo2/WmOxnydHTvTljcUH/WD5V24A2EDyh1DksOAZ/CBKcDUy7
   g==;
X-CSE-ConnectionGUID: qEpL2FEjTrGpyUiDPgFk7A==
X-CSE-MsgGUID: 5i5Fmzg5SIS3S3phJaOENQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="237107644"
X-IronPort-AV: E=Sophos;i="6.23,169,1770562800"; 
   d="scan'208";a="237107644"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2026 19:33:27 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 8B3F01000158
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:29 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 3B29BC012AF
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Apr 2026 10:33:29 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 9AFC14046A8;
	Thu,  9 Apr 2026 10:33:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/37] libcbor: upgrade 0.13.0 -> 0.14.0
Date: Thu,  9 Apr 2026 18:31:54 +0800
Message-ID: <20260409103223.1574-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260409103223.1574-1-wangmy@fujitsu.com>
References: <20260409103223.1574-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 10:33:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126157

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libcbor/{libcbor_0.13.0.bb => libcbor_0.14.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libcbor/{libcbor_0.13.0.bb => libcbor_0.14.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb b/meta-oe/recipes-extended/libcbor/libcbor_0.14.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
rename to meta-oe/recipes-extended/libcbor/libcbor_0.14.0.bb
index 3bed8a6e72..7d65688384 100755
--- a/meta-oe/recipes-extended/libcbor/libcbor_0.13.0.bb
+++ b/meta-oe/recipes-extended/libcbor/libcbor_0.14.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=6f3b3881df62ca763a02d359a6e94071"
 
 SRC_URI = "git://github.com/PJK/libcbor.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "9826a4315116a588f7416912db9da6fcecd8da11"
+SRCREV = "6730c20ab487c0b4dc5fb3fea918937085355bac"
 
 inherit cmake
 
-- 
2.43.0


