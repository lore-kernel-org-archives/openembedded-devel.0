Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 514BFC54F55
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:07:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5628.1785218822554385634
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m7oeLJXy;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218822; x=1816754822;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=e+c2815ExOYy/a6ZJJ7NMSS0G6BqpdTK1KYIz5dODG4=;
  b=m7oeLJXyBNy5fhOz8mLOo55tbhJ5zUmL8VsrOmOZ0gaucXaTbJOBT8MH
   661bphKbsEJBidQtZ9DeOhYBeBwMMSeINabrb3eR/cLfnRAhXdCV4n5Da
   tUI1B45cy6mGNJA1s0kPf7KSycwK9abczDq1pVPyEmYhK69CX+FsqHn0s
   rt/pVloAZlECxDXMRIY80BFOf0iqkPGaHdcBRf9nfaSPOODFcKA8hvS0z
   JMeWpP4jT2LjWhDQhpOtbVy9Mf4AY9tUmuTQv2OrxCEmi0zqGbSpgSuiL
   8jQfd9q4ijr+WogL4lnOBPs39FfIIpTHOHR4l49QQnElA2wm5JgxqVDsg
   g==;
X-CSE-ConnectionGUID: NvxxH1IwQ2CUS/rwD9yDeA==
X-CSE-MsgGUID: IJ13xX8ORGWDxiZiG+IXTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="227717765"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="227717765"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:07:00 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 978495508
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:00 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 4D2BCC073CC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:00 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 8CBD110005F2
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:58 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-annotated-types: upgrade 0.7.0 -> 0.8.0
Date: Tue, 28 Jul 2026 14:06:22 +0800
Message-ID: <20260728060645.819-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128479

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...nnotated-types_0.7.0.bb => python3-annotated-types_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-annotated-types_0.7.0.bb => python3-annotated-types_0.8.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb b/meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.bb
index cf579c74fe..3bc397ffa7 100644
--- a/meta-python/recipes-devtools/python/python3-annotated-types_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-annotated-types_0.8.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = ""
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c6afb13fdc220497ee5cded1e717ed67"
 
-SRC_URI[sha256sum] = "aff07c09a53a08bc8cfccb9c85b05f1aa9a2a6f23728d790723543408344ce89"
+SRC_URI[sha256sum] = "13b2beaad985e05e2d6407ee4c4f35590b11f8d693a258a561055cac8f64cab7"
 
 S = "${UNPACKDIR}/annotated_types-${PV}"
 PYPI_PACKAGE = "annotated_types"
-- 
2.43.0


