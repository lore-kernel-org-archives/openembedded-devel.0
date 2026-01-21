Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06521C44514
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 11:31:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9466.1768995090110366728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jan 2026 03:31:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Bmlx5wgI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768995090; x=1800531090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=egyiZ8UW0hKvtiG9jtsv9F64ZyVmzR2YesrW7N6AvQA=;
  b=Bmlx5wgILAPe6JoK+k5WK9HfpFMz3eovcLmJsEHee6nadJwwIgJ/358G
   hnu1jGySsZiWEsKPKQN7etL+KSPd1rmTEZKjPE8DM8OjXFO03BckCQcuC
   VucbkD1cZ8uI5p26OOyhtPu4axANAmSSyCo+k5uHIpU3rjV5Y3uiZDnuD
   ED37rDTR+rH8mxA8834iWpNuXCWtrxrqATGlNW0ucxP+/RdpLgxPN9DSH
   330uL6U9DJI/dUOr8v8mfr/6qlwVi4WOMrEXuCXwVMZbQZf9mWCcwWPvN
   UzYA3FXwT+GFoT313V+KZmwmCkbMIuVbl+Y/MplRHOyfLcZQEYrWbhqDe
   Q==;
X-CSE-ConnectionGUID: XPsOWQt4S0qhwWaqUxfWCA==
X-CSE-MsgGUID: eboNEBCnSKS/rU12tJolpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="227203983"
X-IronPort-AV: E=Sophos;i="6.21,242,1763391600"; 
   d="scan'208";a="227203983"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 20:31:28 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A0C41C01826
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:28 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 5B429C041F3
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id DD46E1404868;
	Wed, 21 Jan 2026 11:31:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/30] wavpack: upgrade 5.8.1 -> 5.9.0
Date: Wed, 21 Jan 2026 19:29:11 +0800
Message-ID: <20260121112921.857-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260121112921.857-1-wangmy@fujitsu.com>
References: <20260121112921.857-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 11:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123711

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wavpack/{wavpack_5.8.1.bb => wavpack_5.9.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/wavpack/{wavpack_5.8.1.bb => wavpack_5.9.0.bb} (85%)

diff --git a/meta-oe/recipes-multimedia/wavpack/wavpack_5.8.1.bb b/meta-oe/recipes-multimedia/wavpack/wavpack_5.9.0.bb
similarity index 85%
rename from meta-oe/recipes-multimedia/wavpack/wavpack_5.8.1.bb
rename to meta-oe/recipes-multimedia/wavpack/wavpack_5.9.0.bb
index 63d0db1b67..7e2b0e3d39 100644
--- a/meta-oe/recipes-multimedia/wavpack/wavpack_5.8.1.bb
+++ b/meta-oe/recipes-multimedia/wavpack/wavpack_5.9.0.bb
@@ -4,8 +4,8 @@ LIC_FILES_CHKSUM = "file://license.txt;md5=3a6eec695493cff01ff6f7b7888c5631"
 
 DEPENDS = "openssl"
 
-SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https"
-SRCREV = "4827b9889665b937b6ed71b9c6c0123152cd7a02"
+SRC_URI = "git://github.com/dbry/WavPack.git;branch=master;protocol=https;tag=${PV}"
+SRCREV = "5803634a030e2a11dba602ba057b89cc34486c67"
 
 inherit cmake pkgconfig lib_package
 
-- 
2.43.0


