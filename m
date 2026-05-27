Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE5ACD6E45
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:44 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16807.1779875375191963270
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R0opZ0w9;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875375; x=1811411375;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y969KYZOBBIPxIJ1D4HQ7PufmOf9/c1/BeDlvqwTNzM=;
  b=R0opZ0w930O0nDE4FK6WMv1ESrekaDde3PD4NLKIqcQQ4DBcaLHSQ4FP
   pAASCD0725SGatDYzOJ1SgdPSCnPXLA2qLsH1dJRSmmHH50oR6BZjqqeQ
   KW2Z3rQaD+lFmc5iTFp+mKjcjhV0KZIVZK/CO2nu9G7V1FgxW/QNha3xD
   ARKMe2+yx7n+NsGFixZYNSzr5+g02gV/k0UVP3FJvakH5BSEnlxgLYQX+
   7hGMzWXNRiOK48zIXRqruPYHBa/5zOLQRJDOisnM+9tw5yIMUnQvDGtxZ
   O2Zn3Mjt42l/E2Ergitx/CjWzy/+tEs0WZ4g4V3Yoa95J6HhVVLq85AYM
   A==;
X-CSE-ConnectionGUID: xW+qFdTjQ+6f1+Bk7VLwPQ==
X-CSE-MsgGUID: VggO60YGTfGxietjJA6hIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="220931943"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="220931943"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:33 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A9B0242A338
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:33 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5AE77C02089
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 6FC0E82A2D9;
	Wed, 27 May 2026 09:49:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 46/56] python3-telnetlib3: upgrade 2.6.0 -> 4.0.4
Date: Wed, 27 May 2026 17:47:55 +0800
Message-ID: <20260527094805.2039-46-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127253

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-telnetlib3_2.6.0.bb => python3-telnetlib3_4.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-telnetlib3_2.6.0.bb => python3-telnetlib3_4.0.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-telnetlib3_2.6.0.bb b/meta-python/recipes-devtools/python/python3-telnetlib3_4.0.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-telnetlib3_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-telnetlib3_4.0.4.bb
index bef533b39b..eb28bbf81f 100644
--- a/meta-python/recipes-devtools/python/python3-telnetlib3_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-telnetlib3_4.0.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jquast/telnetlib3"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=15abe157ad6f0b483975cc34bcc1aa99"
 
-SRC_URI[sha256sum] = "c231e790c626f5b6927a4a85e79bce18cde994c9424254d2193582b430972164"
+SRC_URI[sha256sum] = "6ab9ce0b9e8663b002d7e10513deb0c17bddb982d520681e0788511d99695a7a"
 
 PYPI_PACKAGE = "telnetlib3"
 
-- 
2.43.0


