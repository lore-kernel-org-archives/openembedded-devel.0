Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFFACD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:41:23 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19346.1779190878241024749
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:41:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=rh0wM1FW;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190878; x=1810726878;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e0PzQJRNI93ZgU5w6cmT0kAw4WwJgthD0GbYKt2/ZwE=;
  b=rh0wM1FWUOJGP2eoM7VER6SlsdewVRuUQHNVd5ewE3o4pf51mbWzuoBP
   u8BfKlJxNbpH8e7GKH9JixhzBF1OWA9W0Yx1gN5hMrBBH8hdyNOY7fAYO
   mwsyVPrlFk42clX31ARFekDbmyEPLX7Dd4NSoBqCOvNgjs8cMyrQuKy7H
   s7AeKcCNIBkMbOJlqWg0KMFOwI0hc+PEuE71/ajqIZ9+OJZk0iKIJOjpu
   dKyt/ZrS0q6v9ggBiNhW0FCubPDA8Lj9XWzgoeWR8mWQ6kNOlv4xxlPtQ
   EeVeEMSjPK7jBokj8nWeRauq1B7/ROBAjgUKmg1LEVAJsBiacasoRpgRP
   g==;
X-CSE-ConnectionGUID: nwJjVR40TT+s5mpvkdcT7w==
X-CSE-MsgGUID: IbuuRt71QsGxYRb19qhjIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="241113940"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="241113940"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:41:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id B06171000345
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:16 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6547A1C135D0
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id DC124405EC8;
	Tue, 19 May 2026 11:41:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/38] python3-typeguard: upgrade 4.5.1 -> 4.5.2
Date: Tue, 19 May 2026 19:39:17 +0800
Message-ID: <20260519113921.655-34-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:41:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127096

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fixed IndexError raised from check_signature_compatible when the subject method has no positional parameters

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.5.1.bb => python3-typeguard_4.5.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.5.1.bb => python3-typeguard_4.5.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb
index 1c62e076cd..0ea613ef11 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.5.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "f6f8ecbbc819c9bc749983cc67c02391e16a9b43b8b27f15dc70ed7c4a007274"
+SRC_URI[sha256sum] = "5a16dcac23502039299c97c8941651bc33d7ea8cc4b2f7d6bbb1b528f6eea423"
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


