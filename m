Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F34C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 16:49:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.13611.1639414193374876587
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:49:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6E8FD6E
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:49:52 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82BB03F73B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 08:49:52 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] srecord: add libgcrypt PACKAGECONFIG
Date: Mon, 13 Dec 2021 16:49:48 +0000
Message-Id: <20211213164949.267531-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 16:49:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94339

Instead of forcibly disabling libgcrypt, add a PACKAGECONFIG and enable
it as functionality is good.

Also remove the redundant libtool-native DEPENDS as autotools adds this
dependency by default.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/srecord/srecord_1.64.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/re=
cipes-support/srecord/srecord_1.64.bb
index 4a00be1baf..3ad2d72777 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.64.bb
@@ -13,11 +13,12 @@ SRC_URI[sha256sum] =3D "49a4418733c508c03ad79a29e95ac=
ec9a2fbc4c7306131d2a8f5ef3201
=20
 UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/srecord/files/re=
leases"
=20
-DEPENDS =3D "libtool-native boost groff-native"
+DEPENDS =3D "boost groff-native"
=20
 inherit autotools-brokensep
=20
-EXTRA_OECONF =3D "--without-gcrypt"
+PACKAGECONFIG ??=3D "gcrypt"
+PACKAGECONFIG[gcrypt] =3D "--with-gcrypt,--without-gcrypt,libgcrypt"
=20
 # Set variable WITHOUT_DOC=3D0 to enable documentation generation
 EXTRA_OEMAKE =3D "WITHOUT_DOC=3D1"
--=20
2.25.1


