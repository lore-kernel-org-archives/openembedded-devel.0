Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F637C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:41 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4718.1783503932348154125
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qbkz/PUm;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503932; x=1815039932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=92Z4se0PWTObQLbWuoN6ZRa6NigemLaxhgOSOGabKUw=;
  b=Qbkz/PUmSd174dsLpNnj4NChMnVlFgygwVsO0BpVehIxzrl08AQ92Q6k
   vrQGCHsP96dff6n5kEHIRvi+6/giHbuqlTYxQ0DMDiTfSWKBt2LLA5Zv4
   qlb788sU7uK2X8PvlUZI1PENln/hT5qY/Zo2Td8019NgaCc/MDtweYthX
   1IJ8Upl0w6s2nLuG662eVtaxJPmCVtdBz8by63eZKmoNHY7FakypZFfo4
   t7UwYylLzKFwYdU+Edz6tbU0lOrjY2XTHfWearWvJHAWxIYRLUHD12ZxM
   JsIV3qngvmPMJEDwDL4TFd4iRNHpKbdK4V+xTMGcu4xNa+1eHSCxuHOXU
   w==;
X-CSE-ConnectionGUID: PGiXTcVnQrKO0lKWXRXOzQ==
X-CSE-MsgGUID: 1uLjzBJ0R5GgZSlbsT4Jzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="250142730"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="250142730"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:30 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A18501000347
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:30 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 4F4841C2DF56
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6E5E2180113C;
	Wed,  8 Jul 2026 09:45:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/37] mm-common: upgrade 1.0.7 -> 1.0.8
Date: Wed,  8 Jul 2026 17:44:20 +0800
Message-ID: <20260708094508.2060-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128081

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* doc-reference.am: Distribute .svg files from the HTML directory
* Add skeletonmm/tools/generate_from_gir.sh
* Allow -Duse-network=if-no-local-tag-file (new default value)
* Replace gtkmm.org by gtkmm.gnome.org.
* Require meson >= 0.62.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../mm-common/{mm-common_1.0.7.bb => mm-common_1.0.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/mm-common/{mm-common_1.0.7.bb => mm-common_1.0.8.bb} (87%)

diff --git a/meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb b/meta-oe/recipes-core/mm-common/mm-common_1.0.8.bb
similarity index 87%
rename from meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb
rename to meta-oe/recipes-core/mm-common/mm-common_1.0.8.bb
index cb1b710954..1a2e69a2c5 100644
--- a/meta-oe/recipes-core/mm-common/mm-common_1.0.7.bb
+++ b/meta-oe/recipes-core/mm-common/mm-common_1.0.8.bb
@@ -8,7 +8,7 @@ inherit gnomebase
 # All the recipe does is stage python and shell script, some autotools files; nothing is compiled.
 inherit allarch
 
-SRC_URI[archive.sha256sum] = "494abfce781418259b1e9d8888c73af4de4b6f3be36cc75d9baa8baa0f2a7a39"
+SRC_URI[archive.sha256sum] = "b189ee636e839d12c00dabefae099fd488ab2358dec24d264761c011950b02a9"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


