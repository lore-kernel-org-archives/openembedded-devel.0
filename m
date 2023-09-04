Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A53C83F2C
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 16:12:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.727.1693843954783128968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Sep 2023 09:12:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69A83143D;
	Mon,  4 Sep 2023 09:13:12 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D84653F740;
	Mon,  4 Sep 2023 09:12:33 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Date: Mon,  4 Sep 2023 17:12:30 +0100
Message-Id: <20230904161230.377450-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Sep 2023 16:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104716

From: Ross Burton <ross.burton@arm.com>

Putting the _target_ protoc into the sysroot for executation at _build_
time isn't useful because even if it has the right architecture, the
tune might be incompatible.  Recipes which want protoc should just depend
on protobuf-native.

This reverts commit d7f46fa816964e30edb2ccfecc57a26251cc351c.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/meta=
-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
index 343933033b..d95e1c20f3 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
@@ -92,8 +92,6 @@ PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-lite"
 FILES:${PN}-compiler =3D "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES:${PN}-lite =3D "${libdir}/libprotobuf-lite${SOLIBS}"
=20
-SYSROOT_DIRS +=3D "${bindir}"
-
 RDEPENDS:${PN}-compiler =3D "${PN}"
 RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
 RDEPENDS:${PN}-ptest =3D "bash ${@bb.utils.contains('PACKAGECONFIG', 'py=
thon', 'python3-protobuf', '', d)}"
--=20
2.34.1


