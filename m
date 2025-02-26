Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43473C1B0D9
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9154.1740585037937113838
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 664CC1516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:53 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 26FDC3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:37 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 18/23] xmlrpc-c: use autoreconf
Date: Wed, 26 Feb 2025 15:50:15 +0000
Message-ID: <20250226155022.1989209-18-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115670

Add a patch to not use AM_INIT_AUTOMAKE as automake isn't actually used,
and just let autotools.bbclass run autoreconf.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../xmlrpc-c/xmlrpc-c/no-automake.patch        | 18 ++++++++++++++++++
 .../xmlrpc-c/xmlrpc-c_1.60.03.bb               |  7 +++----
 2 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automak=
e.patch

diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automake.patch=
 b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automake.patch
new file mode 100644
index 0000000000..f309cd4890
--- /dev/null
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/no-automake.patch
@@ -0,0 +1,18 @@
+This doesn't use automake so don't turn it on, as autoreconf will refuse=
 to work.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git i/stable/configure.in w/stable/configure.in
+index 4a9ade8c..baba1edc 100644
+--- i/configure.in
++++ w/configure.in
+@@ -8,7 +8,7 @@ dnl =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
+=20
+ dnl "x.xx" is supposed to be a version number, but is meaningless here.
+ dnl The real version number is in Makefile.version.
+-AM_INIT_AUTOMAKE(xmlrpc-c, x.xx)
++dnl AM_INIT_AUTOMAKE(xmlrpc-c, x.xx)
+=20
+ dnl Define @build@, @build_cpu@, @build_vendor@, @build_os,
+ dnl @host, @host_cpu@, @host_vender, and @host_os@ substitutions.
diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb b/meta=
-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
index f5ee920cad..0e0385ab29 100644
--- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
+++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.60.03.bb
@@ -6,6 +6,7 @@ LICENSE =3D "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM =3D "file://doc/COPYING;md5=3Daefbf81ba0750f02176b6f867=
52ea951"
=20
 SRC_URI =3D "git://github.com/mirror/xmlrpc-c.git;branch=3Dmaster;protoc=
ol=3Dhttps \
+           file://no-automake.patch \
            file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.p=
atch \
            file://0001-unix-common.mk-Ensuring-Sequential-Execution-of-r=
m-a.patch \
            "
@@ -18,6 +19,7 @@ inherit autotools-brokensep binconfig pkgconfig
=20
 TARGET_CFLAGS +=3D "-Wno-narrowing"
=20
+# These are needed for the integrated expat
 EXTRA_OEMAKE +=3D "CC_FOR_BUILD=3D'${BUILD_CC}' \
                  LD_FOR_BUILD=3D'${BUILD_LD}' \
                  CFLAGS_FOR_BUILD=3D'${BUILD_CFLAGS}' \
@@ -32,10 +34,7 @@ PACKAGECONFIG[abyss] =3D "--enable-abyss-server --enab=
le-abyss-threads --enable-ab
 PACKAGECONFIG[cplusplus] =3D "--enable-cplusplus,--disable-cplusplus"
 PACKAGECONFIG[curl] =3D "--enable-curl-client,--disable-curl-client,curl=
"
=20
-do_configure() {
-        gnu-configize --verbose --force ${S}
-        autoconf
-        oe_runconf
+do_configure:prepend() {
         # license is incompatible with lib/util/getoptx.*
         rm -fv ${S}/tools/turbocharger/mod_gzip.c
 }
--=20
2.43.0


