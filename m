Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B68C54F53
	for <webhook@archiver.kernel.org>; Tue, 28 Jul 2026 06:06:59 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5767.1785218815723709459
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2026 23:06:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GbUDL7Zz;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785218816; x=1816754816;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=d7fuXuEPH0HVGmQUoRiAHy52VqqivXY6lSOdq3RSBDM=;
  b=GbUDL7ZzWsDqsvvQb44k5h376BoDS7qL0pXxnhfpJWzLyeW4EMg5d7ya
   82Mke52GBi2H1HJQw/HxnYGvBK3kMYp/0Hv9QYz2Wux+z6K7egMXjUP70
   jElkQ1UgCPTlqLyf1dz/HLQZKh+K+m8/5W/7WZtxk43QER2TIBB8WH42/
   KPt+P3ZnPIuK5WB4b/tCwUVLiFY+U89QxPWIbEU/0UFbo5jIbctYxLEco
   VLT4a5HCGpaW0jRfKkIsQp2lXIDzaACnnZtzKLq3i1GT9gOYxQLG96ic7
   1AXqpCMKqKSwmjnmmnBezrfaUAV6p+GnM2kPvWH/URhDtUe8MJHZJu2Ky
   g==;
X-CSE-ConnectionGUID: J1V5wIAFSHC9Yh3643eVcQ==
X-CSE-MsgGUID: ylsEUrT5QUmew5NHrqD4Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="235013015"
X-IronPort-AV: E=Sophos;i="6.25,189,1779116400"; 
   d="scan'208";a="235013015"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 15:06:54 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id EF49E1000361
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:53 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A2F95C01EE2
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:53 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id E775410005D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:51 +0000 (UTC)
From: Wang Mingyu <wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] hiawatha: upgrade 12.2 -> 12.3
Date: Tue, 28 Jul 2026 14:06:17 +0800
Message-ID: <20260728060645.819-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728060645.819-1-wangmy@fujitsu.com>
References: <20260728060645.819-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 06:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128474

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../hiawatha/{hiawatha_12.2.bb => hiawatha_12.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/hiawatha/{hiawatha_12.2.bb => hiawatha_12.3.bb} (97%)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.2.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.3.bb
similarity index 97%
rename from meta-webserver/recipes-httpd/hiawatha/hiawatha_12.2.bb
rename to meta-webserver/recipes-httpd/hiawatha/hiawatha_12.3.bb
index 525aa06e84..fa3d0b7271 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.2.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_12.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-${PV}.tar.gz \
            file://hiawatha.service \
           "
 
-SRC_URI[sha256sum] = "f0343f5bf0a200973ebdf16668ab8e845e78498682ca83b05b78b2cc78fbe736"
+SRC_URI[sha256sum] = "741c0de4a8055477ae0eca2a32832e8c694d8869e4b53a43a44a2a4e598663c8"
 
 INITSCRIPT_NAME = "hiawatha"
 INITSCRIPT_PARAMS = "defaults 70"
-- 
2.43.0


