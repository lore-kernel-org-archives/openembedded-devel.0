Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6F1CCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.5573.1759990105519662960
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IOMgn5z+;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990109; x=1791526109;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SuEqCGPrtpxz51Iyvv5tKzn9UQgT0uFKq3XFENbx3Tw=;
  b=IOMgn5z+oPAPxW6aCDgjiFMhC+kVGtk4h6TawhN/gPOO5vojP3YPvIz4
   pwITJhWjrH6JMQXjpWAURztc/L263Z2ZCs4YtAeiccH93JgBUlGgnfAbu
   FkuQDcB+yQOXIDEMkIXidde68bIbp4hBe6Vnk/P76jaDRpDLBdmFWpFxg
   ayhtXd82fXo+QnW5PNwB0ubh4pa2GcDUOMhkgZdsRhGfniCj9vF3c7UWN
   CJPEx9MkRbaVas2lmHLKmiWis4C2hxSH2Rld+T8tHG9BZfzOEk6Pc7gef
   RnKCF3mqa+I+FCeJAMfAiUkvkVaz2MpcltFa2lQ2CCxCoQ01xU2SywLxJ
   g==;
X-CSE-ConnectionGUID: SKUuaFtBQuyCcOpwMOr5Gg==
X-CSE-MsgGUID: DIL5bG6jRt23OEyLCuPRiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="214800304"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="214800304"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([51.138.80.169])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:29 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 65A4942A33E
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:28 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1C3161C000C7
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id A441C1001CF1;
	Thu,  9 Oct 2025 06:08:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/22] python3-anyio: upgrade 4.10.0 -> 4.11.0
Date: Thu,  9 Oct 2025 14:07:54 +0800
Message-ID: <20251009060809.445-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120404

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-anyio_4.10.0.bb => python3-anyio_4.11.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-anyio_4.10.0.bb => python3-anyio_4.11.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-anyio_4.10.0.bb b/meta-python/recipes-devtools/python/python3-anyio_4.11.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-anyio_4.10.0.bb
rename to meta-python/recipes-devtools/python/python3-anyio_4.11.0.bb
index e552fd7eaf..a24674c5fb 100644
--- a/meta-python/recipes-devtools/python/python3-anyio_4.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-anyio_4.11.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0a769411d2af7894099e8ff75058c9f"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "3f3fae35c96039744587aa5b8371e7e8e603c0702999535961dd336026973ba6"
+SRC_URI[sha256sum] = "82a8d0b81e318cc5ce71a5f1f8b5c4e63619620b63141ef8c995fa0db95a57c4"
 
 DEPENDS += " \
 	python3-setuptools-scm-native \
-- 
2.43.0


