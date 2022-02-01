Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC768C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:52:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.51580.1643734370629561628
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40DBB113E
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:52:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF45F3F40C
	for <openembedded-devel@lists.openembedded.org>;
 Tue,  1 Feb 2022 08:52:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] fwupd-efi: upgrade to 1.2
Date: Tue,  1 Feb 2022 16:52:48 +0000
Message-Id: <20220201165248.1329459-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Feb 2022 16:52:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95200

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch           | 10 +++++-----
 .../fwupd/{fwupd-efi_1.1.bb =3D> fwupd-efi_1.2.bb}       |  3 +--
 2 files changed, 6 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd-efi_1.1.bb =3D> fwupd-efi_1.2.bb=
} (91%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch b/meta-oe/recip=
es-bsp/fwupd/fwupd-efi/cc.patch
index ac345f2752..6fd2eca941 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi/cc.patch
@@ -20,7 +20,7 @@ index e42b365..4831a48 100755
  import sys
  import argparse
 @@ -19,7 +20,7 @@ def _generate_sbat(args):
-     FWUPD_URL =3D "https://github.com/fwupd/fwupd"
+     FWUPD_URL =3D "https://github.com/fwupd/fwupd-efi"
 =20
      subprocess.run(
 -        [args.cc, "-x", "c", "-c", "-o", args.outfile, "/dev/null"], ch=
eck=3DTrue
@@ -32,13 +32,13 @@ diff --git a/efi/meson.build b/efi/meson.build
 index 68ea4aa..dcf0d43 100644
 --- a/efi/meson.build
 +++ b/efi/meson.build
-@@ -184,7 +184,7 @@ o_file5 =3D custom_target('fwup-sbat.o',
+@@ -187,7 +187,7 @@ o_file5 =3D custom_target('fwup-sbat.o',
                          command : [
-                           join_paths(meson.current_source_dir(), 'gener=
ate_sbat.py'),
+                           generate_sbat,
                            '@OUTPUT@',
 -                          '--cc', efi_cc,
 +                          '--cc', ' '.join(efi_cc),
-                           '--objcopy', efi_objcopy,
+                           '--objcopy', objcopy,
                            '--project-name', meson.project_name(),
                            '--project-version', meson.project_version(),
 diff --git a/meson_options.txt b/meson_options.txt
@@ -49,5 +49,5 @@ index d869cd2..17ef7fb 100644
 -option('efi-cc', type : 'string', value : 'gcc', description : 'the com=
piler to use for EFI modules')
 +option('efi-cc', type : 'array', value : ['gcc'], description : 'the co=
mpiler to use for EFI modules')
  option('efi-ld', type : 'string', value : 'ld', description : 'the link=
er to use for EFI modules')
- option('efi-objcopy', type : 'string', value : 'objcopy', description :=
 'the objcopy utility to use for EFI modules')
  option('efi-libdir', type : 'string', description : 'path to the EFI li=
b directory')
+ option('efi-ldsdir', type : 'string', description : 'path to the EFI ld=
s directory')
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb b/meta-oe/recipes=
-bsp/fwupd/fwupd-efi_1.2.bb
similarity index 91%
rename from meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd-efi_1.2.bb
index 2165b42293..b88db2e53c 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.1.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd-efi_1.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd25=
5951079008b364516c"
=20
 SRC_URI =3D "git://github.com/fwupd/fwupd-efi;protocol=3Dhttps;branch=3D=
main \
            file://cc.patch"
-SRCREV =3D "fee1b8f6473cb403b8ae7a56961ba0557e3f3efa"
+SRCREV =3D "8de5918507dcc797e612aac688d6b60b90053f54"
 S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "gnu-efi"
@@ -20,7 +20,6 @@ SBAT_DISTRO_URL ?=3D ""
=20
 EXTRA_OEMESON +=3D "-Defi-cc=3D"${@meson_array('CC', d)}" \
                   -Defi-ld=3D'${HOST_PREFIX}ld' \
-                  -Defi-objcopy=3D'${OBJCOPY}' \
                   -Defi-includedir=3D${STAGING_INCDIR}/efi \
                   -Defi-libdir=3D${STAGING_LIBDIR} \
                   -Defi_sbat_distro_id=3D'${SBAT_DISTRO_ID}' \
--=20
2.25.1


