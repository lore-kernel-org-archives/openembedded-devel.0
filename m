Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AADC636D6
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:46:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16268.1676907981452799307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:46:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0889B1FB;
	Mon, 20 Feb 2023 07:47:04 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA6D23F703;
	Mon, 20 Feb 2023 07:46:20 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 8/8] nodejs: no need to stage binaries for target
Date: Mon, 20 Feb 2023 15:46:14 +0000
Message-Id: <20230220154614.42832-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220154614.42832-1-ross.burton@arm.com>
References: <20230220154614.42832-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 15:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101175

Target nodejs doesn't depend on nodejs-native to build anymore, so there
is no need to stage these binaries.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_18.12.1.bb
index c95a72fa94..0346f54e6f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -174,19 +174,6 @@ do_install_ptest () {
     chown -R root:root ${D}${PTEST_PATH}
 }
=20
-BINARIES =3D " \
-    bytecode_builtins_list_generator \
-    ${@bb.utils.contains('PACKAGECONFIG', 'icu', 'gen-regexp-special-cas=
e', '', d)} \
-    node_mksnapshot \
-    torque \
-"
-
-do_install:append:class-native() {
-    # Install the native binaries to provide it within sysroot for the t=
arget compilation
-    install -d ${D}${bindir}
-    (cd ${S}/out/Release && install ${BINARIES} ${D}${bindir})
-}
-
 PACKAGES =3D+ "${PN}-npm"
 FILES:${PN}-npm =3D "${nonarch_libdir}/node_modules ${bindir}/npm ${bind=
ir}/npx"
 RDEPENDS:${PN}-npm =3D "bash python3-core python3-shell python3-datetime=
 \
--=20
2.34.1


