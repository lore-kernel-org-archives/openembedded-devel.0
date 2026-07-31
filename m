Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5E2C55176
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 19:15:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3548.1785525326265544707
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 12:15:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=eTaqLI6c;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC53E152B
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 12:15:21 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 408173F66F
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785525325; bh=01my/Qiy/D4QbJK+oTRu3iHoQQj9x2M1M2rIcYw9CzU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eTaqLI6cPnatnMq0pIEUfxn1W0ZNrLHIlG/7TKQK16c4TrL6GpJN0TBcFpoZHGcaQ
	 Jt9e15FLMMW+zs4otcX8lxo6v5dEpQXJ1Zd/A+NLjIYsgP3t7AxQgFKzbL7lV1V85D
	 BaNn/lshjDHSXcm4P+ZAG+D8O6OOlZ9OCcRGP8Xw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] librice: allow building bundled rice-proto
Date: Fri, 31 Jul 2026 20:15:21 +0100
Message-ID: <20260731191523.2153901-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731191523.2153901-1-ross.burton@arm.com>
References: <20260731191523.2153901-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 19:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128590

rice-proto isn't really bundled but is a subproject in librice that is
built using the pkg-config crate. However the cargo class now disables
bundled dependencies, so explicitly allow rice-proto to be built.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/librice/librice_0.4.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/librice/librice_0.4.3.bb b/meta-oe/r=
ecipes-support/librice/librice_0.4.3.bb
index 926244d780..4017b58271 100644
--- a/meta-oe/recipes-support/librice/librice_0.4.3.bb
+++ b/meta-oe/recipes-support/librice/librice_0.4.3.bb
@@ -31,3 +31,5 @@ export LIBCLANG_PATH =3D "${STAGING_LIBDIR_NATIVE}/libc=
lang.so"
 export PKG_CONFIG_SYSROOT_DIR =3D ""
 export OPENSSL_LIB_DIR =3D "${STAGING_LIBDIR}"
 export OPENSSL_INCLUDE_DIR =3D "${STAGING_INCDIR}"
+
+export SYSTEM_DEPS_RICE_PROTO_BUILD_INTERNAL =3D "always"
--=20
2.43.0


