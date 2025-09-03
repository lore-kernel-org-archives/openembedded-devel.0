Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C71CAC58C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 09:04:00 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.7933.1756890227660505659
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 02:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VQkRsg2K;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1756890231; x=1788426231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kFezDkDWo5e0ee6clkEpIKLptLfzFqvHCYxFXzaztFI=;
  b=VQkRsg2KmsJ8r64jBlrOsexISB5ne8GtS6wE4+WNbxIMgPeinQCT0QUh
   rfnyr4FR2FSNo/stup+V16Rwf+++fVeenv3HQuCesSkSnWalK6DdnZfGj
   mc+2kHjMXxgYns2vaURnasZudPY0AdawV/VdBafboZa5H4x3jy3VtvTzA
   KDYpau4+mA3O3PCjglfvwbSDUpS+seimDSAUbE4Nk37agDVQxTJI5amZD
   y5KwdB7iMyWR1uUC/OmAJ4uMh4vJHy6mioott0RncwAf1ll69NWvZN9Ml
   V7zQxxN4WAjXTwLlhOy1O1w2P1orDRWRon2arIZ0wJqfZgvQK3DRJEog4
   Q==;
X-CSE-ConnectionGUID: 6MiWiNl0S4+0dT0WmooMgw==
X-CSE-MsgGUID: gnLN1lWxSuGLpFrWMzFWzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="214919170"
X-IronPort-AV: E=Sophos;i="6.18,233,1751209200"; 
   d="scan'208";a="214919170"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 18:03:50 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 30CA41000350
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:50 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DC5001C2C208
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:49 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id B1F601801C54
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Sep 2025 09:03:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 64ADA1A0069;
	Wed,  3 Sep 2025 17:03:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/56] python3-email-validator: upgrade 2.2.0 -> 2.3.0
Date: Wed,  3 Sep 2025 17:02:47 +0800
Message-ID: <20250903090317.2002-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250903090317.2002-1-wangmy@fujitsu.com>
References: <20250903090317.2002-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 09:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119220

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...mail-validator_2.2.0.bb => python3-email-validator_2.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_2.2.0.bb => python3-email-validator_2.3.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_2.3.0.bb
index 104e6ef295..b745dfbba8 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.3.0.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Unlicense"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2890aee62bd2a4c3197e2059016a397e"
 
-SRC_URI[sha256sum] = "cb690f344c617a714f22e66ae771445a1ceb46821152df8e165c5f9a364582b7"
+SRC_URI[sha256sum] = "9fc05c37f2f6cf439ff414f8fc46d917929974a82244c20eb10231ba60c54426"
 
 PYPI_PACKAGE = "email_validator"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


