Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65414C5DF8B
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:32 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3312.1787132179675746840
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ifp46K3C;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132195; x=1818668195;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S0W3t2+trnrkowi6r+bV/S3/Svwo2OBCbaOOdUFc/yw=;
  b=Ifp46K3CWc6rG7uGcIsEwZwkbQSZoD6PVlPgpQr9gAjFnsXAVDxNPLKf
   4qbea5eGmEQf1/33A33tXDS7cNaonf2uypPaNRzldNNEv4w1mv9y9a6ir
   zldU/2njJYgoSJ+YfIYeLlIDDYhdq7lRgJFCDi8v/JA2KgIiipUVWWmM+
   CoPPw+J8fyeDVOGDwvi3arapAMhLApQmH5xc4laLj36nvDFf/wzWHNl0p
   LURpA1cNaX+GnB20CPr3UYHKmEanestixSMY3djlqHJmEBZIOEkYXmRyl
   kR84lCrfLKdTKtyWD9j1x87BHiAxuEW/OXCzlO8wEa9ob+72BTyaH9PhC
   Q==;
X-CSE-ConnectionGUID: T31U+N7uStqQMjbxJEUVsg==
X-CSE-MsgGUID: L8CI/v6SQBe4uu/gtS59PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251357079"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251357079"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:36:34 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0241B100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:31 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id AB8B61800BC2
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A43B91801C0F;
	Wed, 19 Aug 2026 09:36:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 40/70] python3-m2crypto: upgrade 0.48.0 -> 0.49.0
Date: Wed, 19 Aug 2026 17:34:44 +0800
Message-ID: <20260819093514.1101-40-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129310

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- defer unavailable ENGINE constant lookup
- fixes problematic behaviour of pkcs11-provider
- support TLS 1.0 contexts with modern OpenSSL
- use Python 3 C APIs in handwritten SWIG code
- feat: Add AES-GCM (AEAD) support to M2Crypto
- remove Black configuration from setup.cfg
- release X509V3 config with its context
- keep IOBuffer chains alive until destruction
- test: free low-level OpenSSL objects in leak tests
- avoid leaking X509V3 extension config
- free RSA exponent on modulus conversion failure
- free replaced EVP digest contexts
- wrap created X509 name entries with ownership
- own ASN1 values created from Python data
- own PKCS7 certificate stack copies
- release BIOs on explicit close
- Add AuthorityKeyIdentifier extension support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-m2crypto_0.48.0.bb => python3-m2crypto_0.49.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.48.0.bb => python3-m2crypto_0.49.0.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
index 1a06fca017..b9e872fe67 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.49.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=8099b0e569f862ece05740aef06c82a2"
 
-SRC_URI[sha256sum] = "178e290f558ddf0379aaefd34c0a8ddb21f21502594e588f928dda85f1ad202b"
+SRC_URI[sha256sum] = "604b9cdd7c1bb9e73e54a189643d56d08bf841691775122962430ee2ca3506fe"
 
 SRC_URI += "file://0001-setup.py-Make-the-cmd-available.patch"
 SRC_URI += "file://0002-_m2crypto.i-add-py2-py3-C-API-compat-macros.patch"
-- 
2.43.0


