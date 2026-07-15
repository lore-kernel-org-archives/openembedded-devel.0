Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84083C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:42 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3430.1784112034336037888
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VJJYYc2o;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112039; x=1815648039;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lZ+amW1DRqmADdJWSIq9MTkFwx7llDY40y0biO6Q4do=;
  b=VJJYYc2omEKetdJaSa+UyKNmQiDsOQP2SYmnnh3MKQMso6hdB4mzZOWR
   k6uJv51z8mKqosgGs+nXLxppnaVfahzG0V0T3OId6dyq1yUTjRzrTB/0u
   Rgq0nAp/5DLXKSNKbKbh4Ifk2WOcMD77zESX/1aLY8R2Ff77Zio0oq1/Z
   K8w/EekcPXR/kfGmvO4MUBT1wucBTu+xEJpl7xDu8p3+v6W/JWrVl+Kr6
   q/wweUNQvDC0a04OoHtWTxGhYi+swcjwRB8IM4iubE5jzDtNtXmPds+VD
   H6Wq88kRjkSPP4w3k+lwyv04nCTbljWTT9Rf1NjcSPKZycCBDdvEz0rjY
   Q==;
X-CSE-ConnectionGUID: TYvQGJNwTGiASfEKjhYuhA==
X-CSE-MsgGUID: 8u/4hZmQQv28WoeDcFkEtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247440455"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247440455"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:38 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CF7BC407579
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:35 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 81AC310214DE
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 87FD0180113F;
	Wed, 15 Jul 2026 10:40:33 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 38/44] xlsfonts: upgrade 1.0.8 -> 1.0.9
Date: Wed, 15 Jul 2026 18:39:08 +0800
Message-ID: <20260715103914.2120-38-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128211

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xlsfonts_1.0.8.bb => xlsfonts_1.0.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xlsfonts_1.0.8.bb => xlsfonts_1.0.9.bb} (76%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.8.bb b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.9.bb
similarity index 76%
rename from meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.8.bb
rename to meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.9.bb
index 4ddb1b9887..d9195eddd0 100644
--- a/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.8.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xlsfonts_1.0.9.bb
@@ -7,4 +7,4 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ec74dd7ea4d10c4715a7c44f159a40b"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "807f909eace684b866fc63b3e962729c120822a6c96e051ff51cf350b3ffb6cd"
+SRC_URI[sha256sum] = "a6a2e291801458d92510263b175d16f98024dc3816ebddbde79b5009f6c3b065"
-- 
2.43.0


