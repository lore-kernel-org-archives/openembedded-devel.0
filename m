Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6549DFD7F77
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:00 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.92742.1772187295854896514
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:14:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nWYlpLkq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187295; x=1803723295;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3PRQ7RtGZ8yZSXRKQo1/KoAUpmrp47AFgk0K0ughMS8=;
  b=nWYlpLkq5zzhu7Gw3J5JWp0uHwVGE7wOsy38qSx4R2o4fRvFQKrUUglC
   bpKfXoS85SZOtCo3xZHP2f7MVnuIzMoStbEVHui1GfUHdt8BIbrV7yGmP
   lBXN7Cyp0gEiXJVBV8Odg7h7n4pein8MbqxXQ+LMBsr3rTMWDcY9TFlue
   LSQvN76T9WPSkeqEGJubOPWIyy5mZ/aG9xOeEaDKCuQLVfbvmchiLvCAK
   FRpodLjAJ/I3P08n47gLKFxcuBRtT8c3LuHP/f1CKa7kPQuyr0S/SZ0iy
   ScCjP9xkDsbTaXFYh7yGfvCsHNOrZnYxsxAP3RphqvuHaOXDj6S/RZNfx
   w==;
X-CSE-ConnectionGUID: YYYsxa0YR7e5LiG1H/1OVA==
X-CSE-MsgGUID: B0QlGi/7Thqd00kHpIA/tQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="210131602"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="210131602"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 59C6A1000340
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:54 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0D4D51009E0A
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:14:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3566718005D2;
	Fri, 27 Feb 2026 10:14:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/52] python3-pytokens: upgrade 0.4.0 -> 0.4.1
Date: Fri, 27 Feb 2026 18:13:03 +0800
Message-ID: <20260227101327.1432-28-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124728

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Avoid emitting dedents after an escaped new line
- Add --json support to the CLI
- Fix quiet mode in the CLI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pytokens_0.4.0.bb => python3-pytokens_0.4.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytokens_0.4.0.bb => python3-pytokens_0.4.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-pytokens_0.4.0.bb b/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-pytokens_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
index 1ec1e31086..0772b48f35 100644
--- a/meta-python/recipes-devtools/python/python3-pytokens_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytokens_0.4.1.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=627dc9a75d5dcc4759b26bacf13a4c46"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "6b0b03e6ea7c9f9d47c5c61164b69ad30f4f0d70a5d9fe7eac4d19f24f77af2d"
+SRC_URI[sha256sum] = "292052fe80923aae2260c073f822ceba21f3872ced9a68bb7953b348e561179a"
 
 DEPENDS += "python3-mypy-native"
-- 
2.43.0


