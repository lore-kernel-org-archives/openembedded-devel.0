Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C50DC433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 14:33:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6391.1636122828776632051
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 07:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5309E2F
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  5 Nov 2021 07:33:48 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F268B3F7F5
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  5 Nov 2021 07:33:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fwupd-efi: add new recipe
Date: Fri,  5 Nov 2021 14:33:46 +0000
Message-Id: <20211105143346.3561300-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 14:33:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93844

This is the EFI executable that is used by fwupd when building EFI
capsules.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch | 53 ++++++++++++++++++++
 meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb   | 31 ++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
 create mode 100644 meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch b/meta-oe/recip=
es-bsp/fwupd/fwupd-efi/cc.patch
new file mode 100644
index 0000000000..ac345f2752
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
@@ -0,0 +1,53 @@
+Change the efi-cc argument to take an array, so that we can pass compile=
r flags
+such as --sysroot.
+
+In the long term changing the fwupd-efi build to use the standard Meson
+CC/LD/etc would be the preferred fix.
+
+Upstream-Status: Inappropriate [better fix in progress]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/efi/generate_sbat.py b/efi/generate_sbat.py
+index e42b365..4831a48 100755
+--- a/efi/generate_sbat.py
++++ b/efi/generate_sbat.py
+@@ -7,6 +7,7 @@
+ #
+ # pylint: disable=3Dmissing-docstring, invalid-name
+=20
++import shlex
+ import subprocess
+ import sys
+ import argparse
+@@ -19,7 +20,7 @@ def _generate_sbat(args):
+     FWUPD_URL =3D "https://github.com/fwupd/fwupd"
+=20
+     subprocess.run(
+-        [args.cc, "-x", "c", "-c", "-o", args.outfile, "/dev/null"], ch=
eck=3DTrue
++        shlex.split(args.cc) + ["-x", "c", "-c", "-o", args.outfile, "/=
dev/null"], check=3DTrue
+     )
+=20
+     # not specified
+diff --git a/efi/meson.build b/efi/meson.build
+index 68ea4aa..dcf0d43 100644
+--- a/efi/meson.build
++++ b/efi/meson.build
+@@ -184,7 +184,7 @@ o_file5 =3D custom_target('fwup-sbat.o',
+                         command : [
+                           join_paths(meson.current_source_dir(), 'gener=
ate_sbat.py'),
+                           '@OUTPUT@',
+-                          '--cc', efi_cc,
++                          '--cc', ' '.join(efi_cc),
+                           '--objcopy', efi_objcopy,
+                           '--project-name', meson.project_name(),
+                           '--project-version', meson.project_version(),
+diff --git a/meson_options.txt b/meson_options.txt
+index d869cd2..17ef7fb 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1,4 +1,4 @@
+-option('efi-cc', type : 'string', value : 'gcc', description : 'the com=
piler to use for EFI modules')
++option('efi-cc', type : 'array', value : ['gcc'], description : 'the co=
mpiler to use for EFI modules')
+ option('efi-ld', type : 'string', value : 'ld', description : 'the link=
er to use for EFI modules')
+ option('efi-objcopy', type : 'string', value : 'objcopy', description :=
 'the objcopy utility to use for EFI modules')
+ option('efi-libdir', type : 'string', description : 'path to the EFI li=
b directory')
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb b/meta-oe/recipes=
-bsp/fwupd/fwupd-efi_1.1.bb
new file mode 100644
index 0000000000..f3c4a7a3b7
--- /dev/null
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "EFI executable for fwupd"
+LICENSE =3D "LGPL-2.1+"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D "git://github.com/fwupd/fwupd-efi;protocol=3Dhttps;branch=3D=
main \
+           file://cc.patch"
+SRCREV =3D "fee1b8f6473cb403b8ae7a56961ba0557e3f3efa"
+S =3D "${WORKDIR}/git"
+
+DEPENDS =3D "gnu-efi"
+
+COMPATIBLE_HOST =3D "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
+
+inherit meson
+
+# These should be configured as needed
+SBAT_DISTRO_ID ?=3D "${DISTRO}"
+SBAT_DISTRO_SUMMARY ?=3D "${DISTRO_NAME}"
+SBAT_DISTRO_URL ?=3D ""
+
+EXTRA_OEMESON +=3D "-Defi-cc=3D"${@meson_array('CC', d)}" \
+                  -Defi-ld=3D'${HOST_PREFIX}ld' \
+                  -Defi-objcopy=3D'${OBJCOPY}' \
+                  -Defi-includedir=3D${STAGING_INCDIR}/efi \
+                  -Defi-libdir=3D${STAGING_LIBDIR} \
+                  -Defi_sbat_distro_id=3D'${SBAT_DISTRO_ID}' \
+                  -Defi_sbat_distro_summary=3D'${SBAT_DISTRO_SUMMARY}' \
+                  -Defi_sbat_distro_url=3D'${SBAT_DISTRO_URL}' \
+                  -Defi_sbat_distro_pkgname=3D'${PN}' \
+                  -Defi_sbat_distro_version=3D'${PV}'\
+                  "
--=20
2.25.1


