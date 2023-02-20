Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFC4C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:46:20 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16493.1676907976976099719
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:46:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E2591FB;
	Mon, 20 Feb 2023 07:46:59 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ADF43F703;
	Mon, 20 Feb 2023 07:46:15 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/8] zchunk: upgrade to 1.2.3
Date: Mon, 20 Feb 2023 15:46:07 +0000
Message-Id: <20230220154614.42832-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 15:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101168

---
 .../{zchunk_1.2.0.bb =3D> zchunk_1.2.3.bb}       | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-support/zchunk/{zchunk_1.2.0.bb =3D> zchunk_1.2.3=
.bb} (52%)

diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb b/meta-oe/rec=
ipes-support/zchunk/zchunk_1.2.3.bb
similarity index 52%
rename from meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
rename to meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb
index 0baea5032a..760d650de6 100644
--- a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.3.bb
@@ -6,17 +6,19 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf6e68539f5=
64601a5a5869c31e5242"
=20
 SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3D=
main"
=20
-SRCREV =3D "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
+SRCREV =3D "f16dbeb0831eb37a9397356570327abb97860875"
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "\
-    curl \
-    zstd \
-    "
-
+DEPENDS =3D "zstd"
 DEPENDS:append:libc-musl =3D " argp-standalone"
-LDFLAGS:append:libc-musl =3D " -largp"
=20
-inherit meson pkgconfig
+inherit meson pkgconfig lib_package
+
+PACKAGECONFIG ??=3D "openssl zckdl"
+
+# zckdl gets packaged into zchunk-bin
+PACKAGECONFIG[zckdl] =3D "-Dwith-curl=3Denabled,-Dwith-curl=3Ddisabled,c=
url"
+# Use OpenSSL primitives for SHA
+PACKAGECONFIG[openssl] =3D "-Dwith-openssl=3Denabled,-Dwith-openssl=3Ddi=
sabled,openssl"
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


