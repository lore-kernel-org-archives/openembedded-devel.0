Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2446C7EE2D
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 13:36:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32638.1683639397560020104
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 06:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD45D1576;
	Tue,  9 May 2023 06:37:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C358D3F663;
	Tue,  9 May 2023 06:36:36 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 4/4] xorriso: remove obsolete recipe
Date: Tue,  9 May 2023 14:36:32 +0100
Message-Id: <20230509133632.191360-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509133632.191360-1-ross.burton@arm.com>
References: <20230509133632.191360-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 13:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102510

From: Ross Burton <ross.burton@arm.com>

GNU xorriso is simply a bundling of libisofs+libburn+libisoburn which
also "restricts itself to a technical form where the legal commitments
of the libburnia project and the legal intentions of FSF match
completely".[1] What this actually means is unclear.

We can follow upstream faster and have more modular recipes by packaging
the pieces directly, instead of building the development snapshot of GNU
xorriso 1.5.5.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-utils/xorriso/xorriso_1.5.5.bb    | 29 -------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.=
bb

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb b/me=
ta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb
deleted file mode 100644
index a83950db82..0000000000
--- a/meta-filesystems/recipes-utils/xorriso/xorriso_1.5.5.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION =3D "xorriso copies file objects from POSIX compliant filesy=
stems \
-into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise \
-manipulation of such filesystems"
-
-LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
-
-SRC_URI =3D "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
-
-SRC_URI[md5sum] =3D "a5e3dc4e0b92be6837f9ed6cbf7f9df5"
-SRC_URI[sha256sum] =3D "91663d61bee61ff790b3f6861fdf57c54af0e238ab14f297=
b55bae8ab5d17684"
-
-PACKAGECONFIG ??=3D "acl attr zlib bzip2 readline"
-PACKAGECONFIG[acl] =3D "--enable-libacl,--disable-libacl,acl,"
-PACKAGECONFIG[attr] =3D "--enable-xattr,--disable-xattr,attr,"
-PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib,"
-PACKAGECONFIG[bzip2] =3D "--enable-libbz2,--disable-libbz2,bzip2,"
-PACKAGECONFIG[readline] =3D "--enable-libreadline,--disable-libreadline,=
readline,"
-
-inherit autotools-brokensep pkgconfig features_check
-
-do_configure:prepend () {
-    touch NEWS
-}
-
-RDEPENDS:${PN} =3D "tk"
-REQUIRED_DISTRO_FEATURES =3D "x11"
-
-BBCLASSEXTEND =3D "native"
--=20
2.34.1


