Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A788CD4851
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 11:40:33 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19036.1779190824346014138
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 04:40:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QjSUnFV2;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779190824; x=1810726824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7kq5LZ3rDqcKQv2WY+3vgciYss4ca0K5rvq2FbNaFKE=;
  b=QjSUnFV2LGNzHKFCCS8ddhRo5X4yLaqwTBcMQMjcM6s2jPajyeRbtLa+
   Zs0iOG3DQ2pY/TqtjzLzf0BmxuYd1RE4frbXm2pr9RicYqkNvCf1zE7f6
   wh6dKmdOSJUZbxtMGipTIF8wLbjpzpKCOu7bXsadmnNv3J2QRqLHXByAr
   2ll7SyocHfL6iFZRO8jKF+Anaz7OeZPSHiDdBBKHPZoffy6ewK+isk+BL
   +9wFnbEaJmitByIUj2wTaQarwL0O1PjuYhEUqoGAuLgSkDKrrP6etIJxe
   e5H3ed+NLAOYfM112cd6SG3jRGStz3a/h8JsHmE6uXMq4SaErgPJouRda
   g==;
X-CSE-ConnectionGUID: 1PcNba2wT2yTSgKVo9yvWA==
X-CSE-MsgGUID: 5Gj/3MLdRR2xWt1+fiPfVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="239231292"
X-IronPort-AV: E=Sophos;i="6.23,243,1770562800"; 
   d="scan'208";a="239231292"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 20:40:22 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id CE91FC000B2
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:22 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 841BD86069E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:22 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 00DCA4066E3;
	Tue, 19 May 2026 11:40:19 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/38] python3-meh: upgrade 0.52 -> 0.53
Date: Tue, 19 May 2026 19:39:03 +0800
Message-ID: <20260519113921.655-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260519113921.655-1-wangmy@fujitsu.com>
References: <20260519113921.655-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 11:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127082

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python-meh/{python3-meh_0.52.bb => python3-meh_0.53.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-meh/{python3-meh_0.52.bb => python3-meh_0.53.bb} (90%)

diff --git a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb b/meta-python/recipes-extended/python-meh/python3-meh_0.53.bb
similarity index 90%
rename from meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
rename to meta-python/recipes-extended/python-meh/python3-meh_0.53.bb
index 80f9881b58..f6ba7c5f5c 100644
--- a/meta-python/recipes-extended/python-meh/python3-meh_0.52.bb
+++ b/meta-python/recipes-extended/python-meh/python3-meh_0.53.bb
@@ -10,6 +10,6 @@ inherit setuptools3_legacy
 
 SRC_URI = "git://github.com/rhinstaller/python-meh.git;protocol=https;branch=master"
 
-SRCREV = "f0fcc3ce1943dce9cf958f4a2f7398daff619c9f"
+SRCREV = "35376b77be9f3e39a81fb19c6d8d86fe17b54c2a"
 
 FILES:${PN} += "${datadir}/python-meh"
-- 
2.43.0


