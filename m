Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63E2C43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:46:12 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4917.1783503963851845686
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:46:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GS42xyBZ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503964; x=1815039964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=edAPwi63Eqv1nxW/1tTif7r9Dnigc6oLxzgrv59+J38=;
  b=GS42xyBZURmJYH+tgMiUy8rTi/b1VhcMCyyVpyaSiUxpLdhYQGyh3lUR
   N+EDDoTGZWQ1CUVjk+wpdLkWlesG6m/wvtFd9PpxJmidHgzbXw7YgkWB5
   WXobu/6C96s78pUhXrReMTp2PwIS/AW66kX8jqS166Y4/cWdUOqT7CYG7
   cROma+M//y5svBH/IWudE6m+tKkkI+uspF5pAaAYqWvfvAR2Rno/mcsKV
   s1u5MIKwRLr1gEU446CIKgI5hnRQ4LOBRBJOhVs+vubetrV3AgfyNz8ar
   S0SH4Q5YzLlzbUNknB8c1EtRj4gBRqh+U5E1UZu8cWLN6fTCQESNPeRx1
   Q==;
X-CSE-ConnectionGUID: uz06hGWZQM+Wyp6JhXE5Wg==
X-CSE-MsgGUID: 6l5wL2RrQXy5wK8jAZMhfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="246145057"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="246145057"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:46:02 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1C4AF1002812
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:02 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id CB4C8C06D6A
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:46:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id F0956180112F;
	Wed,  8 Jul 2026 09:45:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/37] python3-xmlschema: upgrade 4.3.1 -> 4.3.2
Date: Wed,  8 Jul 2026 17:44:40 +0800
Message-ID: <20260708094508.2060-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260708094508.2060-1-wangmy@fujitsu.com>
References: <20260708094508.2060-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128101

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-xmlschema_4.3.1.bb => python3-xmlschema_4.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_4.3.1.bb => python3-xmlschema_4.3.2.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_4.3.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_4.3.2.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-xmlschema_4.3.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_4.3.2.bb
index a2f4070079..cbd2136d27 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_4.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_4.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=385fddea479acdec12ab77a938f68cd9"
 
-SRC_URI[sha256sum] = "853effdfaf127849d4724368c17bd669e7f1486e15a0376404ad7954ec31a338"
+SRC_URI[sha256sum] = "f3b33a21a2b2cdc404ddc3fb599d8bc1dee90b155d547370672e6e684746b8d6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


