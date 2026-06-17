Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C019CCD98F3
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:27 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11262.1781686703342168059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XtzaXzDh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686703; x=1813222703;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3+iBTqP+S6zlOsfFVxZJaHD0Mpn4I+HPveqdJ+87VGA=;
  b=XtzaXzDh5KxQOPXjNgdgw41dD2baZfoxKIjg3/EiGcOdAryYNBYs3Ffo
   a/2E5sHjL2AzyIBuere/ZCEqe5YzzpqW4g3Oa6adbCAR1hnI+BU8Gt+fv
   ya1VkqIVlh8ME4OCu9pnbKWQzsJGZ85FfAWs3Q4xr5S+oFEgi5BMYW2wJ
   rqXnOx1+RDsf/9BJetHLm4yETwCyIlToPwp8R85kt5u4pgTSR5odLUhwq
   q0yju5hWum8dgqXEENEDzLypntq+WCphYBItZlG3/Caen0ZVVZ2vCN2Xe
   wvO8tCYcDYoj2A92R82RN5SgEK6Ea9P7SP+rUc+jFSt6ZhIiiLRxrlS7c
   g==;
X-CSE-ConnectionGUID: vVZUa8kNSuuV5CS0EEFeHA==
X-CSE-MsgGUID: atLsCbtlRAud5/MFfySt6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="231794148"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="231794148"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:21 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 58F85C01814
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:21 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 113E7827757
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3FA301000A45;
	Wed, 17 Jun 2026 08:58:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 04/17] liburi-perl: upgrade 5.34 -> 5.35
Date: Wed, 17 Jun 2026 16:57:54 +0800
Message-ID: <20260617085807.542-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127641

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Strip leading zeros from port numbers in canonical URIs

License-Update:
  Change address to website
  Change signature from Ty Coon to Moe Ghoul

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../liburi/{liburi-perl_5.34.bb => liburi-perl_5.35.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/liburi/{liburi-perl_5.34.bb => liburi-perl_5.35.bb} (90%)

diff --git a/meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb b/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
similarity index 90%
rename from meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb
rename to meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
index 73e4e51d23..4fb4c2a122 100644
--- a/meta-perl/recipes-perl/liburi/liburi-perl_5.34.bb
+++ b/meta-perl/recipes-perl/liburi/liburi-perl_5.35.bb
@@ -6,13 +6,13 @@ HOMEPAGE = "https://metacpan.org/dist/URI"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9944b87af51186f848ae558344aded9f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a4fff76c97b0801ffb7096967487beac"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "de64c779a212ff1821896c5ca2bb69e74767d2674cee411e777deea7a22604a8"
+SRC_URI[sha256sum] = "89648964ce5ae006726951f42f718576fbefe9e98a41bd2212d57386163092d2"
 
 S = "${UNPACKDIR}/URI-${PV}"
 
-- 
2.43.0


