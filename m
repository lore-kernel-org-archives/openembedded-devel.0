Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255DFC7EE2D
	for <webhook@archiver.kernel.org>; Sat, 25 Feb 2023 23:17:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.55996.1677367056447515003
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Feb 2023 15:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3F6A340C8F
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGiCCIobfNUo
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2DF0240BA9
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:35 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 6E602163765;
	Sat, 25 Feb 2023 18:17:08 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [PATCH 2/2] mbedtls: set up /usr/bin/hello as alternative
Date: Sat, 25 Feb 2023 23:17:17 +0000
Message-Id: <20230225231717.3887902-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230225231717.3887902-1-denis@denix.org>
References: <20230225231717.3887902-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Feb 2023 23:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101254

As mbedtls installs this rather generically-named /usr/bin/hello binary,
it conflicts with the one provided by lmbench, hence set it up as an
alternative to avoid conflicts when both are installed to rootfs or SDK.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 .../recipes-connectivity/mbedtls/mbedtls_2.28.2.bb           | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.=
bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
index f5f1236f1..e19587ca0 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.28.2.bb
@@ -26,7 +26,7 @@ S =3D "${WORKDIR}/git"
 SRCREV =3D "89f040a5c938985c5f30728baed21e49d0846a53"
 SRC_URI =3D "git://github.com/ARMmbed/mbedtls.git;protocol=3Dhttps;branc=
h=3Dmbedtls-2.28"
=20
-inherit cmake
+inherit cmake update-alternatives
=20
 PACKAGECONFIG ??=3D "shared-libs programs"
 PACKAGECONFIG[shared-libs] =3D "-DUSE_SHARED_MBEDTLS_LIBRARY=3DON,-DUSE_=
SHARED_MBEDTLS_LIBRARY=3DOFF"
@@ -47,6 +47,9 @@ RPROVIDES:${PN} =3D "polarssl"
 PACKAGES =3D+ "${PN}-programs"
 FILES:${PN}-programs =3D "${bindir}/"
=20
+ALTERNATIVE:${PN}-programs =3D "hello"
+ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
+
 BBCLASSEXTEND =3D "native nativesdk"
=20
 CVE_PRODUCT =3D "mbed_tls"
--=20
2.25.1


