Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A14ACD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:39:52 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19306.1779190785000760594
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:39:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dGSfnMZ9;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190786; x=1810726786;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aRR2Sw98G+iwl1wGG8qXjMC2W67/WQjBdUtG5ssSiak=;
  b=dGSfnMZ9xGJblSwnzHm2VwrFp3TxtFA82/SGyGnmD8gmFxuWw19t/G8g
   186HH+FhWVndOEi+kSOMIRRchenFo/u0VR8H9tYbMy9ffeqLRtdgxH642
   Jx7bMdKnea/5EELz4qq/Bck4t8Z/2nwEnebhbIt3YhjNFII618HtTi9qX
   MUdaI+5AG6YlTu4k+qzBBQGWfEcdWJXu8uGDlYw2On6lPGz9fvUshlASW
   ZfXYhWHH6lKi4k5NsyF9rHFymPQWfUwdBM6E11SJ9XjyBQKnuSpchAdFJ
   ANxcfWzXBvPPJVzDmsgUQmihLwVHfxEHb4LvhEAo+4YC9YSOaoXnQswks
   A==;
X-CSE-ConnectionGUID: QBZc5IZNTF6NykaDzT/+Xw==
X-CSE-MsgGUID: fPDfaLUMQEqwsDP0m91npA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="241060233"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="241060233"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:39:44 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 408A91C1C719
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:43 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id EBB8286056B
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 8FF2E4066C7;
	Tue, 19 May 2026 11:39:40 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/38] lcms: upgrade 2.19 -> 2.19.1
Date: Tue, 19 May 2026 19:38:51 +0800
Message-ID: <20260519113921.655-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:39:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127070

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed sonames generation when using autotools
- Recovered an undocumented memory write feature lost because a "security" report.
- Fixed documentation pointers on visual studio project.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/lcms/{lcms_2.19.bb => lcms_2.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/lcms/{lcms_2.19.bb => lcms_2.19.1.bb} (82%)

diff --git a/meta-oe/recipes-support/lcms/lcms_2.19.bb b/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
similarity index 82%
rename from meta-oe/recipes-support/lcms/lcms_2.19.bb
rename to meta-oe/recipes-support/lcms/lcms_2.19.1.bb
index fa33678b18..074a1c0428 100644
--- a/meta-oe/recipes-support/lcms/lcms_2.19.bb
+++ b/meta-oe/recipes-support/lcms/lcms_2.19.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e9ce323c4b71c943a785db90142b228a"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lcms/lcms2-${PV}.tar.gz"
-SRC_URI[sha256sum] = "49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216"
+SRC_URI[sha256sum] = "bfc54f7bab59fbc921012014a8032e4cba4abd46db47d46b76416a8c0b2815c8"
 
 DEPENDS = "tiff"
 
-- 
2.43.0


