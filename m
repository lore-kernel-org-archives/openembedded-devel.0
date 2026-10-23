Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4254.1792751773360723928
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=W81rioXG;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6584A1684
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 03:36:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 30E183F7B4
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 03:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792751772; bh=uPVs7Lk1uPK2bLUAsyJIdsBb15f1hx08+6yNWaOJ+wM=;
	h=From:To:Subject:Date:From;
	b=W81rioXGrz+tMS9WDzFveJtWm4V29yOms+GceYi8xsfri8oaXXtFweILl4J3dY17V
	 1/R5W+Btgfp3GnhKeE86Hx2r1gNZwBt7rBlyk/HmoarrYCcIdnYHGsIIamvsGlHR0k
	 +zQtf2UAnJgniBaUZZoIpjNP7qN5FFcmjV47RM6w=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-ruff: build with maturin
Date: Fri, 23 Oct 2026 11:36:07 +0100
Message-ID: <20261023103607.2940589-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 10:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131363
Content-Type: text/plain; charset="utf-8"

ruff is built with maturin, so inherit the python_maturin class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb b=
/meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb
index 38151a5bd3..23bc1c9d4f 100644
--- a/meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb
+++ b/meta-python/recipes-devtools/python/python3-ruff_0.16.8.bb
@@ -4,11 +4,9 @@ HOMEPAGE =3D "https://docs.astral.sh/ruff/"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De679ca4f742cbfa29ab6a499529c2=
d39"
=20
-DEPENDS +=3D "python3-maturin-native"
-
 SRC_URI[sha256sum] =3D "9247bf92b5f04d825c8639a4fe423ec2e4222acd9222e584=
12b0dab7e442798b"
=20
-inherit pypi python_setuptools3_rust cargo-update-recipe-crates
+inherit pypi python_maturin cargo-update-recipe-crates
=20
 CARGO_SRC_DIR =3D "rust"
=20
--=20
2.43.0

