Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6E80EA7973
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:37 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14219.1770268532020568762
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O7EZK4RX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268532; x=1801804532;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FmeqB8f6EUIM/iXdv3aEvQWBmgiBSrab5RucIV+Bcr0=;
  b=O7EZK4RXL7b7my1Ax80R1t2/eFNmVeKMD4+7ASSwN0ZvjA7HXisNMryq
   NkC7QGaP9JboYWN3WeBOF0OEyqqSMA1/3VzSjpLfclLA/6Pnluwgmefhe
   yveWmU8BNUUwO8UprpemJIuEg+ujeGq3xnchRq3cmxAxu1F+mTptdIOt4
   E7g6xy++NTEGBN/B6+595yDyPdt6aPXzs6vO6XgHvHStR9LDtvA4khgPY
   +41aZQR1imVX5ESRnyMZPvLo2nLotMr4xX3un+3RyxWS7jizn8OqaGvWi
   omhs/ocT/zm/FJaR8Px0EKfsiB7HeSn8mW2KpY/1pbmM9W6JK4VwAnaM9
   w==;
X-CSE-ConnectionGUID: OGIzhfyATeOvJFi4fETCvg==
X-CSE-MsgGUID: LpIUkqHBRoqqox7rX/8Dkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="216026368"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="216026368"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:30 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 940451C00094
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:30 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 328ECC0182C
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 8DC9020000C1;
	Thu,  5 Feb 2026 05:15:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/24] openldap: upgrade 2.6.10 -> 2.6.12
Date: Thu,  5 Feb 2026 13:14:23 +0800
Message-ID: <20260205051435.1366-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124165

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../openldap/{openldap_2.6.10.bb => openldap_2.6.12.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/openldap/{openldap_2.6.10.bb => openldap_2.6.12.bb} (98%)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.10.bb b/meta-oe/recipes-support/openldap/openldap_2.6.12.bb
similarity index 98%
rename from meta-oe/recipes-support/openldap/openldap_2.6.10.bb
rename to meta-oe/recipes-support/openldap/openldap_2.6.12.bb
index 9ef4a83584..beee1b2738 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.10.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.12.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://www.OpenLDAP.org/license.html"
 # basically BSD.  opensource.org has listed this license
 # since August 2019.
 LICENSE = "OLDAP-2.8"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a41b4ed95ab4a20f366a8d82536afe4 \
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=e71f8d80fdc11f3cea5dee6ad13679ce \
                     file://LICENSE;md5=153d07ef052c4a37a8fac23bc6031972 \
                     "
 SECTION = "libs"
@@ -21,7 +21,7 @@ SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/$
     file://0001-build-top.mk-unset-STRIP_OPTS.patch \
 "
 
-SRC_URI[sha256sum] = "c065f04aad42737aebd60b2fe4939704ac844266bc0aeaa1609f0cad987be516"
+SRC_URI[sha256sum] = "1716ad779e85d743694c3e3b05277fb71b6a5eadca43c7a958aa62683b22208e"
 
 DEPENDS = "util-linux groff-native"
 
-- 
2.43.0


