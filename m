Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BABC7EE2A
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31157.1684514084098500290
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE2811FB;
	Fri, 19 May 2023 09:35:27 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7041C3F793;
	Fri, 19 May 2023 09:34:42 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 01/13] libblockdev: add PACKAGECONFIG for tools
Date: Fri, 19 May 2023 17:34:28 +0100
Message-Id: <20230519163440.2733149-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102675

From: Ross Burton <ross.burton@arm.com>

Add another PACKAGECONFIG for the tools option. As this builds a binary
in what is primarily a library package, also inherit lib_package so the
tools are packaged in libblockdev-bin.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb b/m=
eta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
index 44b4e7daf9..a585399ef7 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
@@ -8,7 +8,7 @@ SECTION =3D "devel/lib"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc07cb499d259452f324bb90c3067d=
85c"
=20
-inherit autotools gobject-introspection pkgconfig
+inherit autotools gobject-introspection pkgconfig lib_package
=20
 SRC_URI =3D "git://github.com/storaged-project/libblockdev;branch=3D2.x-=
branch;protocol=3Dhttps \
 "
@@ -17,7 +17,7 @@ S =3D "${WORKDIR}/git"
=20
 FILES:${PN} +=3D "${libdir}/python2.7/dist-packages ${libdir}/python3.*/=
site-packages"
=20
-PACKAGECONFIG ??=3D "python3 lvm dm kmod parted fs escrow btrfs crypto m=
draid kbd mpath nvdimm"
+PACKAGECONFIG ??=3D "python3 lvm dm kmod parted fs escrow btrfs crypto m=
draid kbd mpath nvdimm tools"
 PACKAGECONFIG[python3] =3D "--with-python3, --without-python3,,python3"
 PACKAGECONFIG[python2] =3D "--with-python2, --without-python2,,python"
 PACKAGECONFIG[lvm] =3D "--with-lvm, --without-lvm, multipath-tools, lvm2=
"
@@ -36,5 +36,6 @@ PACKAGECONFIG[crypto] =3D "--with-crypto,--without-cryp=
to,cryptsetup nss volume-ke
 PACKAGECONFIG[mdraid] =3D "--with-mdraid,--without-mdraid,libbytesize"
 PACKAGECONFIG[kbd] =3D "--with-kbd,--without-kbd,libbytesize"
 PACKAGECONFIG[mpath] =3D "--with-mpath,--without-mpath, multipath-tools,=
 lvm2"
+PACKAGECONFIG[tools] =3D "--with-tools,--without-tools,libbytesize libde=
vmapper"
=20
 export GIR_EXTRA_LIBS_PATH=3D"${B}/src/utils/.libs"
--=20
2.34.1


