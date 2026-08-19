Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF54C5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:40 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3276.1787132130327445985
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mpfPUYeN;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132136; x=1818668136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IuGOhnGdWbBqEg0Uj0LqmBamNt5olln+YNpTzAEbX+Y=;
  b=mpfPUYeNHrRwP46ILr8geNaDic+q3qy5VeX/m/R45898eFW37yxm4U9Q
   K23NzPWq6uQL8eAyk4noLHb0TTUJW22N1EVFl7HwgtXgub5iGN5GJb6qn
   OU7ydqj9Q3kmyjwmYSM8KiDMlQEX1pMn7KQyw3L5S0W0kqmUElDWakUjZ
   A/8VEDiK6zNYjji0t/gx55d5GidNnrtojkREseYGnc9kakx8SKRl5xUez
   xqtHdcCturxAvx2JLt81L1TFpLvA96fra8kWohjTdi0WDKRbSmK178Nkt
   USX9fT5HEG3Qot72rs+EjhqXVJZsOj5ezCW12+tVDMjAgpmkI/d/77H+V
   Q==;
X-CSE-ConnectionGUID: BJCHZ+RxTcqdLqhoFZ5Dcw==
X-CSE-MsgGUID: mM/wIHmFQFCXQnNDMG32+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="239330778"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="239330778"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:35 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AA7CCE46B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:35 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 5D8A01000104
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 469131801C29;
	Wed, 19 Aug 2026 09:35:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/70] jsoncons: upgrade 1.8.1 -> 1.9.0
Date: Wed, 19 Aug 2026 17:34:13 +0800
Message-ID: <20260819093514.1101-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129279

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.8.1.bb => jsoncons_1.9.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.8.1.bb => jsoncons_1.9.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.8.1.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.8.1.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb
index 3da0ce0ca3..fdbce38e01 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.8.1.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.9.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "d35782026b6208d7c0ed80f5a8165a7a3b868e2f"
+SRCREV = "bcb44594c50c495ee1e690602cdd71455942ad0e"
 
 
 inherit cmake
-- 
2.43.0


