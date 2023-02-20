Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02944C64EC7
	for <webhook@archiver.kernel.org>; Mon, 20 Feb 2023 15:46:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.16267.1676907980122426321
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Feb 2023 07:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF007FEC;
	Mon, 20 Feb 2023 07:47:02 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D0C43F703;
	Mon, 20 Feb 2023 07:46:19 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 6/8] nodejs: don't force cross-compilation in native builds
Date: Mon, 20 Feb 2023 15:46:12 +0000
Message-Id: <20230220154614.42832-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220154614.42832-1-ross.burton@arm.com>
References: <20230220154614.42832-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Feb 2023 15:46:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101173

By not forcing the cross-compile build logic in native builds the build
is a _lot_ faster.  Walltime in buildstats-diff on my machine:

  nodejs-native    do_compile  -475.6s   -41.2%    1153.4s -> 677.7s

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_18.12.1.bb
index 180e170a35..2c6db481c6 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_18.12.1.bb
@@ -137,18 +137,22 @@ addtask create_v8_qemu_wrapper after do_configure b=
efore do_compile
=20
 LDFLAGS:append:x86 =3D " -latomic"
=20
+CROSS_FLAGS =3D "--cross-compiling"
+CROSS_FLAGS:class-native =3D "--no-cross-compiling"
+
 # Node is way too cool to use proper autotools, so we install two wrappe=
rs to forcefully inject proper arch cflags to workaround gypi
 do_configure () {
     export LD=3D"${CXX}"
     GYP_DEFINES=3D"${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
-    python3 configure.py --verbose --prefix=3D${prefix} --cross-compilin=
g \
+    python3 configure.py --verbose --prefix=3D${prefix} \
                --shared-openssl \
                --without-dtrace \
                --without-etw \
                --dest-cpu=3D"${@map_nodejs_arch(d.getVar('TARGET_ARCH'),=
 d)}" \
                --dest-os=3Dlinux \
                --libdir=3D${libdir} \
+               ${CROSS_FLAGS} \
                ${ARCHFLAGS} \
                ${PACKAGECONFIG_CONFARGS}
 }
--=20
2.34.1


