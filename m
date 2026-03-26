Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7601410A3D87
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:25 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46440.1774526299738939206
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sYRfOZBo;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526301; x=1806062301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zLvPkzJC/xBQH9OA6jd6gOgNwZBoGcnB8eOeN4URFBw=;
  b=sYRfOZBoyFLydNUEtZM1Kt058zxMw29J5EqOJyjOP+To8HwgXLpQpeIo
   TG/Wc8Cne0Zpwa2HKMOSTLlRYs9qLoUjUMHmr5HvvWV+k3GmLuN8Fldc1
   i2cIzkYT0OAtN1WtKBkh5Jnq3TUr4d9kXr6Lq4PwuogBJ1YtJhIzT4MjC
   kXtJyOth/Uh7YYOuAy+DFJNnBwsvvviY5vOeNdfHqShnRTRiLe/oHR2S9
   16MTTiC04InuBl4RapzPBOu+v5eDLLUF51zs26qhefuuJ6WWiEnlswoA6
   YeiLD8HysBw9oA3XubHG9I44GDax6o3UYPRVNIsz0/a0zw0eiM5m5FTt/
   w==;
X-CSE-ConnectionGUID: k5tPaDWbT5etfewwOFhJ3w==
X-CSE-MsgGUID: 7yiIX3P1QK6VMru+1I+3wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213717145"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213717145"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:21 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 253EC820712
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:21 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id D4AD114003CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:20 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 74C861807149;
	Thu, 26 Mar 2026 11:58:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 63/63] tree: upgrade 2.3.1 -> 2.3.2
Date: Thu, 26 Mar 2026 19:56:33 +0800
Message-ID: <20260326115634.1199-63-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125718

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/tree/{tree_2.3.1.bb => tree_2.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/tree/{tree_2.3.1.bb => tree_2.3.2.bb} (87%)

diff --git a/meta-oe/recipes-support/tree/tree_2.3.1.bb b/meta-oe/recipes-support/tree/tree_2.3.2.bb
similarity index 87%
rename from meta-oe/recipes-support/tree/tree_2.3.1.bb
rename to meta-oe/recipes-support/tree/tree_2.3.2.bb
index b4fa0659b9..6e0d9f943f 100644
--- a/meta-oe/recipes-support/tree/tree_2.3.1.bb
+++ b/meta-oe/recipes-support/tree/tree_2.3.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=393a5ca445f6965873eca0259a17f833"
 
 SRC_URI = "https://oldmanprogrammer.net/tar/tree/${BP}.tgz"
-SRC_URI[sha256sum] = "47ca786ed4ea4aa277cabd42b1a54635aca41b29e425e9229bd1317831f25665"
+SRC_URI[sha256sum] = "6b941dd6cbecfb4d3250700e4d08d8e0c251488981dd4868b90d744234300e21"
 
 # tree's default CFLAGS for Linux
 CFLAGS += "-Wall -DLINUX -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
-- 
2.43.0


