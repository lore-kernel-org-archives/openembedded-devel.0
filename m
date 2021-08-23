Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.32407.1629761989262266766
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Aug 2021 16:39:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20201202 header.b=LT/gHEGE;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16321613A8;
	Mon, 23 Aug 2021 23:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629761988;
	bh=CLhHYh3Z4qasu4eleZuEZmzpwsfdMMWo8cU2CYwKqlo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LT/gHEGEtLbsHoUo7/3muLNpHHlnDUJltenxW5M9ilbBRaCPiBNzKhyyRirVs6c9/
	 uduv3shUT7pJiMbbp8t0Omp5o/Vx7JDgB1TByrSB12TRkwH15Zw3eSo6S9DxspCSoJ
	 FC69O8zk0iyV7JYG6xI52Bda4AFaC7yoNArdHPVPK8yR7tRCTlt4LdPTnVa/6W/Z0+
	 PDqBlQNJeEfxjqKmPaLgngtIxIQtldLVbgKsAlIKCDvLjbDQLNEIeCsW5JEPPZ6E8P
	 suEzKnkIO9fEIiDK0wCqIN/NDxtvkR5rfu+pHbDWJvt+EKj1sJVOj1Q3w0WN+Eqjir
	 AUrXMcU4Z7egA==
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH 2/2] libkcapi: allow an option to build natively
Date: Mon, 23 Aug 2021 23:39:38 +0000
Message-Id: <20210823233938.13795-2-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210823233938.13795-1-okaya@kernel.org>
References: <20210823233938.13795-1-okaya@kernel.org>

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
index 2b2591f12a..49c0fd11e6 100644
--- a/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
+++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_1.2.1.bb
@@ -29,3 +29,5 @@ do_install:append() {
 }
 
 CPPFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

