Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB1D0EA796D
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:07 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14209.1770268504335094937
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KJnKUviO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268506; x=1801804506;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xk3eKtdc9EvfZi6EKpHn1VaGyEELrW9gGNolOtEYY1M=;
  b=KJnKUviO+fZfAuIpGLmLwsNuhpt/tg5Qf7eoexQFewB53JV30pz2zSKp
   2sHF3sWFM/ZsNmw+SKqu0212ZpDxcHwkgA3DlfM9d8qEf820Lllf0vlF5
   /dTaHfT91zqXQEzrvCq1yg6DnK8fxD0YH8Z1ule8J1c1gvZLTCN/ViQ9D
   A0vUBLUCTH/Nki8q5gcB3IYFR+xYRh481fJG8VwAuvEy1uz2zPzd15O8E
   cBp+fbNUM1Da/Rnnub8D0aiDaUfmEHjD2qSdqPS/5R+3WjvuPb2yldJPs
   skLHsEqgOojVHCvoRdZJ1NIuDG2N9h2VNqbxIX38tO95hI7OpDcOAXykb
   A==;
X-CSE-ConnectionGUID: oLU/D7laR5CZAL9TaCVNqw==
X-CSE-MsgGUID: 46VNXcotTse8k30k76F7/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="228591617"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="228591617"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:04 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id 322964071CB
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:04 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id D20641C000F2
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 4944920000C7;
	Thu,  5 Feb 2026 05:15:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 03/24] libcacard: upgrade 2.8.1 -> 2.8.2
Date: Thu,  5 Feb 2026 13:14:13 +0800
Message-ID: <20260205051435.1366-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124155

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Sort certificates by underlying objects CKA_ID to provide deterministic
  object order
- Avoid using uninitialized memory
- Improve test coverage and build scripts
- Improve compatibility with modern compilers (avoid strict warnings)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spice/{libcacard_2.8.1.bb => libcacard_2.8.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/spice/{libcacard_2.8.1.bb => libcacard_2.8.2.bb} (82%)

diff --git a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb b/meta-networking/recipes-support/spice/libcacard_2.8.2.bb
similarity index 82%
rename from meta-networking/recipes-support/spice/libcacard_2.8.1.bb
rename to meta-networking/recipes-support/spice/libcacard_2.8.2.bb
index 1a2d9dc9c4..f956f06814 100644
--- a/meta-networking/recipes-support/spice/libcacard_2.8.1.bb
+++ b/meta-networking/recipes-support/spice/libcacard_2.8.2.bb
@@ -4,9 +4,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79ffa0ec772fa86740948cb7327a0cc7"
 
 DEPENDS = "glib-2.0 pcsc-lite nss"
 
-SRCREV = "7b07684ea6698d4885ff2062350ad8798a04de42"
+SRCREV = "df2d3c05a250741632184c2cc66df247039a70d7"
 
-SRC_URI = "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.freedesktop.org/spice/libcacard.git;protocol=https;branch=master;tag=v${PV}"
 
 
 inherit meson pkgconfig
-- 
2.43.0


