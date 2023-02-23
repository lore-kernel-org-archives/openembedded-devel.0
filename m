Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A609C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 12:32:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9231.1677155562173749080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 04:32:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6A3EC14;
	Thu, 23 Feb 2023 04:33:24 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C9183F881;
	Thu, 23 Feb 2023 04:32:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH v3] zchunk: upgrade to 1.2.4
Date: Thu, 23 Feb 2023 12:32:39 +0000
Message-Id: <20230223123239.1727935-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 12:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101223

Add a patch submitted upstream to fix the argp detection with clang.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-support/zchunk/files/clang.patch  | 35 +++++++++++++++++++
 .../recipes-support/zchunk/zchunk_1.2.0.bb    | 22 ------------
 .../recipes-support/zchunk/zchunk_1.2.4.bb    | 25 +++++++++++++
 3 files changed, 60 insertions(+), 22 deletions(-)
 create mode 100644 meta-oe/recipes-support/zchunk/files/clang.patch
 delete mode 100644 meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
 create mode 100644 meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb

diff --git a/meta-oe/recipes-support/zchunk/files/clang.patch b/meta-oe/r=
ecipes-support/zchunk/files/clang.patch
new file mode 100644
index 0000000000..86faf4aac7
--- /dev/null
+++ b/meta-oe/recipes-support/zchunk/files/clang.patch
@@ -0,0 +1,35 @@
+From e69d907c3fe8765ce50ce1258648ebc8283ef8a7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 22 Feb 2023 14:55:07 -0800
+Subject: [PATCH] meson: Use global function in argp check
+
+clang is optimizing away parse_opt() since its marked static and not
+used in main(), make life a bit harder for clang :)
+removing static now emits the global symbols to be resolved during link
+and when libargp is missing the error is thrown rightly
+
+riscv64-yoe-linux-musl-ld: /tmp/a-5ba039.o: in function `.Lpcrel_hi0':
+a.c:(.text+0x44): undefined reference to `argp_state_help'
+clang-16: error: linker command failed with exit code 1 (use -v to see i=
nvocation)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Submitted [https://github.com/zchunk/zchunk/pull/92/]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 3b92d58..ab54abd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -57,7 +57,7 @@ if host_machine.system() =3D=3D 'windows'
+ endif
+=20
+ # argp-standalone dependency (if required)
+-if build_machine.system() =3D=3D 'windows' or build_machine.system() =3D=
=3D 'darwin' or build_machine.system() =3D=3D 'freebsd' or not cc.links('=
#include <argp.h>\nstatic error_t parse_opt (int key, char *arg, struct a=
rgp_state *state) { argp_usage(state); return 0; }; void main() {}')
++if build_machine.system() =3D=3D 'windows' or build_machine.system() =3D=
=3D 'darwin' or build_machine.system() =3D=3D 'freebsd' or not cc.links('=
#include <argp.h>\nerror_t parse_opt (int key, char *arg, struct argp_sta=
te *state) { argp_usage(state); return 0; }; void main() {}')
+     argplib =3D cc.find_library('argp', has_headers : ['argp.h'], requi=
red: false)
+     if not argplib.found()
+         argplib =3D dependency('argp-standalone')
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb b/meta-oe/rec=
ipes-support/zchunk/zchunk_1.2.0.bb
deleted file mode 100644
index 0baea5032a..0000000000
--- a/meta-oe/recipes-support/zchunk/zchunk_1.2.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION =3D "A file format designed for highly efficient deltas whil=
e maintaining good compression"
-AUTHOR =3D "Jonathan Dieter"
-
-LICENSE =3D "BSD-2-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf6e68539f564601a5a5869c31e5=
242"
-
-SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3D=
main"
-
-SRCREV =3D "dd6a30a1e4e8b738b0cafc682f3c00e7706134e5"
-S =3D "${WORKDIR}/git"
-
-DEPENDS =3D "\
-    curl \
-    zstd \
-    "
-
-DEPENDS:append:libc-musl =3D " argp-standalone"
-LDFLAGS:append:libc-musl =3D " -largp"
-
-inherit meson pkgconfig
-
-BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb b/meta-oe/rec=
ipes-support/zchunk/zchunk_1.2.4.bb
new file mode 100644
index 0000000000..b4fd027603
--- /dev/null
+++ b/meta-oe/recipes-support/zchunk/zchunk_1.2.4.bb
@@ -0,0 +1,25 @@
+DESCRIPTION =3D "A file format designed for highly efficient deltas whil=
e maintaining good compression"
+AUTHOR =3D "Jonathan Dieter"
+
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf6e68539f564601a5a5869c31e5=
242"
+
+SRC_URI =3D "git://github.com/zchunk/zchunk.git;protocol=3Dhttps;branch=3D=
main \
+           file://clang.patch"
+
+SRCREV =3D "0bed8496262a71beadccd4e562bdac093ef6e06f"
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "zstd"
+DEPENDS:append:libc-musl =3D " argp-standalone"
+
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
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


