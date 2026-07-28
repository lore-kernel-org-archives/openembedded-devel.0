Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF715C54F4C
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:30 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5784.1785218844532924823
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k3QHpRFC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218847; x=1816754847;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=qJdg0hcm1ibXT7ZajS3tOxPea9TPJ9mSFKEzlifcP2k=;
  b=k3QHpRFCE2C8XBKt+qA75GtYZjX1zErgyUiSrCrsARnb3R+qw2qWPsHP
   qVmdbfMgZMy4zAqX1DNdBSGGoceD6qndwHN4v5W4ckshRucabTV3zdfyk
   fCbO9eHoDP9IEl+puwdsdvPyY7mjxJXDgymVVj7qL1hlxCRi/mbCFTZVn
   otE0um7NX7bsmurRM7hRny3SkY6wnHD5+HuDGlATC7FdcaJQ7K9t/RYU1
   g99FrhkizemQFuuzpqCH00hdJt6L9VqkXe1ahZGkqtT2Q12KCODGEE1eG
   ICTsrnUSP8Hfrzff5Nlluvmie6eg0xdXARU5uxnyVPXXxzY7gh+GZ84eA
   A==;
X-CSE-ConnectionGUID: wej19eq5TMC18rNgSgknXw==
X-CSE-MsgGUID: arbkCP0kRPac3R26nEzIrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="236277058"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="236277058"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:27 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0A6201000361
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:27 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id B249D1800D46
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:26 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 1276510005D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:24 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] sg3-utils: upgrade 1.48 -> 1.49
Date: Tue, 28 Jul 2026 14:06:42 +0800
Message-ID: <20260728060645.819-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128499

Update LIC_FILES_CHKSUM as copyright years updated.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{sg3-utils_1.48.bb => sg3-utils_1.49.bb}  | 39 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/sg3-utils/{sg3-utils_1.48.bb => sg3-utils_1.49.bb} (29%)

diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.49.bb
similarity index 29%
rename from meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
rename to meta-oe/recipes-support/sg3-utils/sg3-utils_1.49.bb
index 5e3b4138cc..d57d179594 100644
--- a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.48.bb
+++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.49.bb
@@ -6,14 +41,14 @@ HOMEPAGE = "http://sg.danny.cz/sg/sg3_utils.html"
 SECTION = "console/admin"
 
 LICENSE = "BSD-2-Clause AND GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f685699d3ac82f108aa880043fa3feb7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6693c9d85dff87dd292973caef66b6a6"
 
 SRC_URI = "http://sg.danny.cz/sg/p/sg3_utils-${PV}.tgz"
 MIRRORS += "http://sg.danny.cz/sg/p https://fossies.org/linux/misc"
 
 UPSTREAM_CHECK_REGEX = "sg3_utils-(?P<pver>\d+(\.\d+)+)\.tgz"
 
-SRC_URI[sha256sum] = "d62b6c3cf20390fa7357044390084166d25f1d932a1135c450b69fe5c283d773"
+SRC_URI[sha256sum] = "84ba5095108dd97cfb554d7b38721f2aa2b43fc1f93cf82abd6efe4c9da220a7"
 
 inherit autotools-brokensep
 
-- 
2.43.0


