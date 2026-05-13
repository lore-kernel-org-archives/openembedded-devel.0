Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26055CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:07:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83.1778645255710502532
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MNKJBV0m;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645255; x=1810181255;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dclUgPIJ8dZao6fliRxVST/0lDVFEumbJfW4re7G8d0=;
  b=MNKJBV0mnN5qVu69LhEVZR+47z8ftWyW2RbaBtqpgL86BYjobo2HVVNM
   jv2O6ac82h9n3gYNisnMVMNlVszEIypMpfiIcbAodSnepchod/m5ft8JK
   1TUz8TsJ0C9VvlABgjcUdgfb5Ug6iFKBJ5OUlKqLSAtFHie2wX5Eojm2B
   M7zH9AHCZvgjT4no9QXsn63QDlMEsMPrzlm8VWr68IMvEENroMlK/g9eE
   cSsrWgjuRoo7bxTCWQwCNzUbOLBVKxGyfqDrmV9WKlpzuWA7tXUkfdjGB
   NHHAo7aQPek5hL/OEMNJphqZSrszlhNACb8rBG3PZFQXracmXtxgtHekx
   Q==;
X-CSE-ConnectionGUID: VcarlCGrR+mryiE/Qm3DKw==
X-CSE-MsgGUID: A0zHLY+IR9e/um1d54vOaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="219130725"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="219130725"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:07:34 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 173B21C00083
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:04 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id BE2EC1009E14
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:03 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 4835F14001ED;
	Wed, 13 May 2026 04:07:01 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-webserver] [PATCH 07/56] hiawatha: upgrade 12.1 -> 12.2
Date: Wed, 13 May 2026 12:05:06 +0800
Message-ID: <20260513040555.377-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513040555.377-1-wangmy@fujitsu.com>
References: <20260513040555.377-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126891

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Let's Encrypt script processes variables in Hiawatha configuration.
* Reintroduced ssi-cgi, as requested.
* Small improvements and bugfixes.
* Bugfix: CAcertificates setting didn't work.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hiawatha/{hiawatha_12.1.bb => hiawatha_12.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_12.1.bb => hiawatha_12.2.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.1.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.2.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_12.1.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_12.2.bb
index 8299e58263..525aa06e84 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.1.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-${PV}.tar.gz \
            file://hiawatha.service \
           "
 
-SRC_URI[sha256sum] = "e93e5964e69d98061d366fa4a0ec7b5d33d3e92e6c02efa8b291a79c646006b1"
+SRC_URI[sha256sum] = "f0343f5bf0a200973ebdf16668ab8e845e78498682ca83b05b78b2cc78fbe736"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.43.0


