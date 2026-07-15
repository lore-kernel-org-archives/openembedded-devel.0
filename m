Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57829C4450F
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:50 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3415.1784111987273040188
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hRHUHlK3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111988; x=1815647988;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=inXvo8ZId+9EWXglOZF95R3j/01IbYJfGfkaSFpHEjk=;
  b=hRHUHlK3ny5J6z+u9l3Tg4R2UoEd63uV2IuzBndAiJfRNCgyhlwPb8Sv
   zJsWtbM70RfIzpDYSYLnR5FUJSqjCnidDdmL9lAgl49Oy3tjdQBh/UW+3
   7OvfGAZFMeuhW6a5NtvZw8sxMsyOBV8xctlmQ2fGcxANOGEnVk2mIlSLn
   kddJ8If2/9jHfT+4PjIAqnIPbk6rgYg8jk52ol8nKav2gTsWkE7kmpEpX
   6glZw0LFfyp2PAPYiqRyz5z7TY5PixY+RimZqcOonMN2HtZE+TpubAYwD
   EQmFDy7ZJ3U3Lla9VWw0+QDArraxHUGOlZOftrlPknymNgYAG3QcoONYS
   w==;
X-CSE-ConnectionGUID: cPxAlJIWR1aRvFQlTqz7dQ==
X-CSE-MsgGUID: 6iMA01EwSGq2USpFbRSuEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="247518872"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="247518872"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:46 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 65A4D407579
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:45 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1787D10214DE
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 18DA4180113F;
	Wed, 15 Jul 2026 10:39:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 06/44] mcelog: upgrade 210 -> 211
Date: Wed, 15 Jul 2026 18:38:36 +0800
Message-ID: <20260715103914.2120-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128179

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_210.bb => mcelog_211.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_210.bb => mcelog_211.bb} (96%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_210.bb b/meta-oe/recipes-support/mcelog/mcelog_211.bb
similarity index 96%
rename from meta-oe/recipes-support/mcelog/mcelog_210.bb
rename to meta-oe/recipes-support/mcelog/mcelog_211.bb
index f009ba98ad..803554bd06 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_210.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_211.bb
@@ -10,7 +10,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;
            file://run-ptest \
            "
 
-SRCREV = "357b136f95be23be1dda2c5e220e0430e9b20765"
+SRCREV = "fe4ac4f11ef7b793b6f4c9dcb0f3fdb410a194a2"
 
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-- 
2.43.0


