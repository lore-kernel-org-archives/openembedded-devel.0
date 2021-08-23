Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.32408.1629761989446173059
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Aug 2021 16:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=fQYG7wIR;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88046613A7;
	Mon, 23 Aug 2021 23:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629761987;
	bh=GlBCcFxSflAo5dgNVul2bk0vn94ux7zGFH8kDLxDttM=;
	h=From:To:Cc:Subject:Date:From;
	b=fQYG7wIRva6aGKN+DTh2Bep8fdqyTuDATIbodUXDWXk/LBgFv/8AMOBzLVcpI9G2H
	 C+xtrxen/4oYnl1WfgYG8bFCZR4y6rMhliQk/82F0yLg7zuZHy9bjMlG/onlTy+VHF
	 FxiW3jfz/XBFEL3IB1+M6IxsQrLvgHHqfeY+4suWuqcEnoVTC4vKLha2CtfHOBj0bV
	 cfX9cmGtzTLvNN+sfM8BFCb+1NAjKluO1okwNLKUqer7G2R/uIyJw9oQK7oz7nISO6
	 Q/Ut8dr/WkVtgH2bR2QIlvm0e2IUN33gL8w3rWcapr2v9tp4Ar0hlDsfuWJQFMtdhM
	 2yv9HLP8eRLYw==
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH 1/2] libkcapi: add a hash only packageconfig
Date: Mon, 23 Aug 2021 23:39:37 +0000
Message-Id: <20210823233938.13795-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
index e86b9dcf99..2b2591f12a 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
@@ -16,6 +16,7 @@ inherit autotools
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,bash"
 PACKAGECONFIG[apps] = "--enable-kcapi-speed --enable-kcapi-hasher --enable-kcapi-rngapp --enable-kcapi-encapp --enable-kcapi-dgstapp,,,"
+PACKAGECONFIG[hasher_only] = "--enable-kcapi-hasher --disable-lib-kdf --disable-lib-sym --disable-lib-aead --disable-lib-rng,,,"
 
 do_install:append() {
     # bindir contains testapp and apps.  However it is always created, even
-- 
2.17.1

