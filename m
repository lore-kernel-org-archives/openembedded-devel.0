Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25E2CDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7227.1782378105706855843
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jffC1dy/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378105; x=1813914105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Zqyj9V4j145wUcPG0KBfp+Ngd/oYIrQjL1qQwvAFum4=;
  b=jffC1dy/+s4pUNpnv14CFQ30VPGbntcU8AZSXu8d2H2DuPyLuqG/YaeW
   V3kTjwQ6xWlOsVleqnIxMgaCiC8fdnVj7BEhf1JFG3eDVRoUD4tT5QG5T
   VREKnujfZOaOwNLSrGWxTgHI9x6EWV3+eGjb3YYDRT1ynot2X9LzSu3H9
   jJqlF92iShtPWbgevNJ/bNiyYXCX8ogz/IlRrdU3t8R6aPabrYc2sKO8E
   fJgBYdjxfx1HB6QLWFxn71QQnuKFsuzN4s22WXF5mWGTI+Ux50eqjzeb/
   MK/r2nKcC5ToAZyUj8l0wMquOStjsj3sw/CAzfen3Xc9Aet7bEg3MlnrJ
   g==;
X-CSE-ConnectionGUID: P8xV7KEkSi+Ax5yMkgPu/Q==
X-CSE-MsgGUID: igRNl7U4T/eK2gNSsqrtWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="233265692"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="233265692"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:43 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C82941002B87
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:43 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 82CBD8320D6
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:43 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 93896101732E;
	Thu, 25 Jun 2026 09:01:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/47] libnvme: upgrade 1.16.1 -> 1.16.2
Date: Thu, 25 Jun 2026 17:00:48 +0800
Message-ID: <20260625090127.1563-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127740

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnvme/{libnvme_1.16.1.bb => libnvme_1.16.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libnvme/{libnvme_1.16.1.bb => libnvme_1.16.2.bb} (93%)

diff --git a/meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb b/meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
similarity index 93%
rename from meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb
rename to meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
index fbbe141487..aab4d03ed2 100644
--- a/meta-oe/recipes-support/libnvme/libnvme_1.16.1.bb
+++ b/meta-oe/recipes-support/libnvme/libnvme_1.16.2.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c"
-SRCREV = "becae3d874b40bfedede672b4b2f58ae8c3be3b5"
+SRCREV = "07d6c32c10fd63fad141cd0120314a055695de32"
 
-SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master"
+SRC_URI = "git://github.com/linux-nvme/libnvme;protocol=https;branch=master;tag=v${PV}"
 
 
 inherit meson pkgconfig
-- 
2.43.0


