Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAE3C5DF89
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3352.1787132221133633110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dCm80Gwg;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132225; x=1818668225;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=95gzY9NPJCGXDhs0cLybCPnOoHIIanQHWmhC+PjUiIc=;
  b=dCm80GwgVbQLgGHlUcyaBv07SOFpOiMZpERFBa4xxf/qJgLiK3ynxC+5
   5xgKgtFUg8+gYew3SL3u8bqRJ3ay0qJghJhZk+XjxecY8qf/uOnPJDClU
   phL2i0vrJQmnv+z+rggEIICwsCApJ1Bhy7auSAaS8HusmU78ku8SfrVxz
   wOx4dt/Bj+JVCtlIXaaELiMLTwmvdkxv49vJPK7Z+TcFny6KO3BkgEEgN
   YGI6Pg0uBGrfQG5fWrEjKnUMa/TJ1EOwZSb/astDy/DqOO23/Ln9u/Ox/
   opFc30Co2IwkgGZWMhbm8D1+wi+Uhpc1+P2ujU1r2/GBdPuR6Fnl9XmO9
   Q==;
X-CSE-ConnectionGUID: VUPtcEN1SFmUqGmEdjhxHw==
X-CSE-MsgGUID: 9TRgAgD9SwO0k0XmpbgnXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251797127"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251797127"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:05 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id B2665C020DF
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:04 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 6EC35148CE5F
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:04 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6EE781801C0A;
	Wed, 19 Aug 2026 09:37:02 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 59/70] python3-telnetlib3: upgrade 4.0.5 -> 5.0.0
Date: Wed, 19 Aug 2026 17:35:03 +0800
Message-ID: <20260819093514.1101-59-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129329

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-telnetlib3_4.0.5.bb => python3-telnetlib3_5.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-telnetlib3_4.0.5.bb => python3-telnetlib3_5.0.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_4.0.5.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-telnetlib3_4.0.5.bb
rename to meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb
index 0024908347..f0cf5c3450 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_4.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_5.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jquast/telnetlib3"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15abe157ad6f0b483975cc34bcc1aa99"
 
-SRC_URI[sha256sum] = "37f584609917a3394302cac6c2f78683add80115820c19a4ce35e0fd499f6ad6"
+SRC_URI[sha256sum] = "b5387d811a270b98698081083a7843530c44765c0a023e3cab6fe8d81f8a2c73"
 
 PYPI_PACKAGE = "telnetlib3"
 
-- 
2.43.0


