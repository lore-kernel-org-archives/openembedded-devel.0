Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC8E1C636CC
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:46:30 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16499.1676907980796319169
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BB2615BF;
	Mon, 20 Feb 2023 07:47:03 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09A1A3F703;
	Mon, 20 Feb 2023 07:46:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 7/8] nodejs: remove LD assignment
Date: Mon, 20 Feb 2023 15:46:13 +0000
Message-Id: <20230220154614.42832-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220154614.42832-1-ross.burton@arm.com>
References: <20230220154614.42832-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 15:46:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101174

The purpose of this appears to have been lost, and the build succeeds
without it.

If it is needed, then it should be added to EXTRA_OEMAKE alongside the
CC and CXX assignments.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_18.12.1.bb
index 2c6db481c6..c95a72fa94 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -140,9 +140,10 @@ LDFLAGS:append:x86 =3D " -latomic"
 CROSS_FLAGS =3D "--cross-compiling"
 CROSS_FLAGS:class-native =3D "--no-cross-compiling"
=20
+#export LD=3D"${CXX}"
+
 # Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
-    export LD=3D"${CXX}"
     GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
     python3 configure.py --verbose --prefix=3D${prefix} \
@@ -158,7 +159,6 @@ do_configure () {
 }
=20
 do_compile () {
-    export LD=3D"${CXX}"
     install -D ${RECIPE_SYSROOT_NATIVE}/etc/ssl/openssl.cnf ${B}/deps/op=
enssl/nodejs-openssl.cnf
     install -D ${B}/v8-qemu-wrapper.sh ${B}/out/Release/v8-qemu-wrapper.=
sh
     oe_runmake BUILDTYPE=3DRelease
--=20
2.34.1


