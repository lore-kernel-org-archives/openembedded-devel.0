Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10182.1792770571791003684
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2026 08:49:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=m+Hf+Cv4;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA1601758
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 08:49:27 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7D5A03F673
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792770570; bh=hBUvJD5PPmnH5VNvRFaqvRuQdiuv7XTPMKnQleDRimU=;
	h=From:To:Subject:Date:From;
	b=m+Hf+Cv4oNXoAwgKN7K+zW2yNqEdMhJLvxpRyeSJykqvHD8yaeYkoat7PgZ5ewtRN
	 vBgcoIDxeQvhx2PB9p+2i7UJu6BDsxuntT7YOshsnA81+vRlS+SNLCemOtVDJYtVme
	 B87rIxJpjfO5OpUiw6bh/Duj+JfI57vLZxHGn8lE=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] brotli: upgrade 1.2.0 -> 1.2.1
Date: Fri, 23 Oct 2026 16:49:25 +0100
Message-ID: <20261023154925.3671992-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 15:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131377
Content-Type: text/plain; charset="utf-8"

Just one fix:
- CVE-2026-111497: out-of-bounds write permits remote code execution

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../brotli/{brotli_1.2.0.bb =3D> brotli_1.2.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb =3D> brotli_1.2.=
1.bb} (83%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb b/meta-oe/re=
cipes-extended/brotli/brotli_1.2.1.bb
similarity index 83%
rename from meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index 84495a32360..2db266c2fee 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -6,8 +6,8 @@ BUGTRACKER =3D "https://github.com/google/brotli/issues"
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${S}/LICENSE;md5=3D941ee9cd1609382f94635271=
2a319b4b"
=20
-SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dmaster;protocol=
=3Dhttps"
-SRCREV =3D "028fb5a23661f123017c060daa546b55cf4bde29"
+SRC_URI =3D "git://github.com/google/brotli.git;branch=3Dv1.2;protocol=3D=
https"
+SRCREV =3D "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
=20
=20
 inherit cmake lib_package
--=20
2.43.0

