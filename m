Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D43FCC77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.31158.1684514084447398079
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F5AD2F4;
	Fri, 19 May 2023 09:35:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 229A43F793;
	Fri, 19 May 2023 09:34:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 02/13] libblockdev: clean up DEPENDS
Date: Fri, 19 May 2023 17:34:29 +0100
Message-Id: <20230519163440.2733149-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102676

From: Ross Burton <ross.burton@arm.com>

If you try to build libblockdev with an empty PACKAGECONFIG then the
configure fails.

Add autoconf-archive, glib-2.0, and udev; these were implicitly pulled
in via other dependencies.  Move kmod to DEPENDS as it's a hard
requirement.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb b/m=
eta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
index a585399ef7..2e7412e823 100644
--- a/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
+++ b/meta-oe/recipes-extended/libblockdev/libblockdev_2.28.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc07cb499d259=
452f324bb90c3067d85c"
=20
 inherit autotools gobject-introspection pkgconfig lib_package
=20
+DEPENDS =3D "autoconf-archive-native glib-2.0 kmod udev"
+
 SRC_URI =3D "git://github.com/storaged-project/libblockdev;branch=3D2.x-=
branch;protocol=3Dhttps \
 "
 SRCREV =3D "1412dc51c8f76bf8d9a6008228737db4a9a26d69"
@@ -24,12 +26,12 @@ PACKAGECONFIG[lvm] =3D "--with-lvm, --without-lvm, mu=
ltipath-tools, lvm2"
 PACKAGECONFIG[lvm-dbus] =3D "--with-lvm_dbus, --without-lvm_dbus, multip=
ath-tools, lvm2"
 PACKAGECONFIG[dm] =3D "--with-dm, --without-dm, multipath-tools, lvm2"
 PACKAGECONFIG[dmraid] =3D "--with-dmraid, --without-dmraid"
-PACKAGECONFIG[kmod] =3D "--with-kbd, --without-kbd, kmod"
+PACKAGECONFIG[kmod] =3D "--with-kbd, --without-kbd,libbytesize"
 PACKAGECONFIG[parted] =3D "--with-part, --without-part, parted"
 PACKAGECONFIG[fs] =3D "--with-fs, --without-fs, util-linux"
 PACKAGECONFIG[doc] =3D "--with-gtk-doc, --without-gtk-doc, gtk-doc-nativ=
e"
 PACKAGECONFIG[nvdimm] =3D "--with-nvdimm, --without-nvdimm, ndctl util-l=
inux"
-PACKAGECONFIG[vdo] =3D "--with-vdo, --without-vdo"
+PACKAGECONFIG[vdo] =3D "--with-vdo, --without-vdo,libbytesize"
 PACKAGECONFIG[escrow] =3D "--with-escrow, --without-escrow, nss volume-k=
ey"
 PACKAGECONFIG[btrfs] =3D "--with-btrfs,--without-btrfs,libbytesize btrfs=
-tools"
 PACKAGECONFIG[crypto] =3D "--with-crypto,--without-crypto,cryptsetup nss=
 volume-key"
--=20
2.34.1


