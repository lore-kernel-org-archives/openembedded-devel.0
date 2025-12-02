Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01011D11703
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 09:52:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4304.1764669146672962059
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Dec 2025 01:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O5vzKhxu;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764669148; x=1796205148;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9pZlYkprbultyKS5bEeYtqjL7kJBJ3wKUsn+TKlC9pE=;
  b=O5vzKhxuqQ4Z1tWUeJeV8zACAC6t2KiG9i70s6yG0bdfVBHq0M+hiCK4
   b40XhJ4AIfYju/kkHVjnsyrqEBA/oOdV0H0XsaixDuoavxuLXPR9FRYfy
   LSudNRpfv+0etfwwLamMfq+sxpGyg+/KMCk8TaBDzy1KDFZS7k8ccQsje
   MHKS4ZXDJEKA6K43EioiwyKT2J3glwwSvCfjtdqRbrX2cCttePZcx4ZbV
   QXS2JPnq/zdyzpIbZw/1d2hOMJB1nh1YlhSxWj4pZw13ensKF/+hdIDpc
   iYHCnr59+9mMat1Uxt+nCvZh6Ns9uqqvWa+hjVLmuqkchU5iAMUSC+Hqm
   g==;
X-CSE-ConnectionGUID: ICTGCKkmSWSNVFjKJCjR+Q==
X-CSE-MsgGUID: sBxwPMSqSAqil500pqrzAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="225034859"
X-IronPort-AV: E=Sophos;i="6.20,242,1758553200"; 
   d="scan'208";a="225034859"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 18:52:26 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3381C1002BAA
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:25 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id DFF2C1400340
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Dec 2025 09:52:24 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 5764D101A434;
	Tue,  2 Dec 2025 09:52:22 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/25] upower: upgrade 1.90.10 -> 1.91.0
Date: Tue,  2 Dec 2025 17:51:31 +0800
Message-ID: <20251202095132.652-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251202095132.652-1-wangmy@fujitsu.com>
References: <20251202095132.652-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Dec 2025 09:52:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122257

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- New feature: Support multiple keyboard backlight LED control.
- Make installation of tests optional
- Support conf.d style config file
- Deprecate CapacityLevel property

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../upower/{upower_1.90.10.bb => upower_1.91.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/upower/{upower_1.90.10.bb => upower_1.91.0.bb} (95%)

diff --git a/meta-oe/recipes-support/upower/upower_1.90.10.bb b/meta-oe/recipes-support/upower/upower_1.91.0.bb
similarity index 95%
rename from meta-oe/recipes-support/upower/upower_1.90.10.bb
rename to meta-oe/recipes-support/upower/upower_1.91.0.bb
index a7effcd7de..9d20e0a432 100644
--- a/meta-oe/recipes-support/upower/upower_1.90.10.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.0.bb
@@ -12,7 +12,7 @@ DEPENDS = " \
 "
 
 SRC_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/archive/v${PV}/${BPN}-v${PV}.tar.bz2"
-SRC_URI[sha256sum] = "c1baf418b685ffe4150c8a75c04da0cec70323fe094b5b257b287eea564d3f56"
+SRC_URI[sha256sum] = "954f8ee8d1422c813615862bc6249cb9b31ace1d905fd1f06549c4e47f4ba401"
 S = "${UNPACKDIR}/${BPN}-v${PV}"
 
 UPSTREAM_CHECK_URI = "https://gitlab.freedesktop.org/${BPN}/${BPN}/-/tags"
-- 
2.43.0


