Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.8147.1620996345658704281
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 05:45:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77E981763
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 05:45:44 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 227F23F73B
	for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 05:45:44 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] nss: remove -march vs -mcpu workaround
Date: Fri, 14 May 2021 13:45:41 +0100
Message-Id: <20210514124541.517318-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514124541.517318-1-ross.burton@arm.com>
References: <20210514124541.517318-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

NSS's build tries to be clever and passes for example -march=3Darmv8-a+cr=
ypto
explicitly, instead of relying on the person doing the compilation to
set the right flags.

This conflicts with our compiler flags which typically pass the ideal
tune for the target, for example -mcpu=3Dcortex-a55+crc+crypto.

When this happens GCC warns that the flags conflict (which was promoted
to an error, now fixed) and -march takes precedence over -mcpu.

As there's a huge number of potential tune flags to remove to avoid the
conflict, now that warnings are not fatal we can stop removing the flags
and let GCC warn as the generated code is the same.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/nss/nss_3.64.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-su=
pport/nss/nss_3.64.bb
index 119d4ad037..fce5a856ee 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.64.bb
@@ -43,10 +43,6 @@ inherit siteinfo
 TD =3D "${S}/tentative-dist"
 TDS =3D "${S}/tentative-dist-staging"
=20
-# cortex-a55 is ARMv8.2-a based but libatomic explicitly asks for -march=
=3Darmv8.1-a
-# which caused -march conflicts in gcc
-TUNE_CCARGS_remove =3D "-mcpu=3Dcortex-a55+crc -mcpu=3Dcortex-a55 -mcpu=3D=
cortex-a55+crc+crypto"
-
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
 do_configure_prepend_libc-musl () {
--=20
2.25.1

