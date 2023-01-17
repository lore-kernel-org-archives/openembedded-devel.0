Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4A1C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:51:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.198236.1673967090113667580
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7CA3AD7;
	Tue, 17 Jan 2023 06:52:11 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FD833F67D;
	Tue, 17 Jan 2023 06:51:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] mbedtls: add option to use PSA for X.509/TLS operations
Date: Tue, 17 Jan 2023 14:51:26 +0000
Message-Id: <20230117145126.2926331-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 14:51:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100637

Add an option to use Platform Security Architecture for the X.509 and TLS
operations.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-connectivity/mbedtls/mbedtls_2.28.1.bb          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.=
bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
index 742414dd8a..b178f5785b 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.1.bb
@@ -32,9 +32,15 @@ PACKAGECONFIG ??=3D "shared-libs programs"
 PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DUSE_=
SHARED_MBEDTLS_LIBRARY=3DOFF"
 PACKAGECONFIG[programs] =3D "-DENABLE_PROGRAMS=3DON,-DENABLE_PROGRAMS=3D=
OFF"
 PACKAGECONFIG[werror] =3D "-DMBEDTLS_FATAL_WARNINGS=3DON,-DMBEDTLS_FATAL=
_WARNINGS=3DOFF"
+# Make X.509 and TLS calls use PSA
+# https://github.com/Mbed-TLS/mbedtls/blob/development/docs/use-psa-cryp=
to.md
+PACKAGECONFIG[psa] =3D ""
=20
 EXTRA_OECMAKE =3D "-DENABLE_TESTING=3DOFF -DLIB_INSTALL_DIR:STRING=3D${l=
ibdir}"
=20
+# For now the only way to enable PSA is to explicitly pass a -D via CFLA=
GS
+CFLAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'psa', ' -DMBED=
TLS_USE_PSA_CRYPTO', '', d)}"
+
 PROVIDES +=3D "polarssl"
 RPROVIDES:${PN} =3D "polarssl"
=20
--=20
2.34.1


