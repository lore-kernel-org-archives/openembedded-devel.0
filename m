Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76E9C7EE22
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 13:36:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.32690.1683639397408350128
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 06:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CCC4FEC;
	Tue,  9 May 2023 06:37:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 22CB43F663;
	Tue,  9 May 2023 06:36:36 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 3/4] libisoburn: add new recipe
Date: Tue,  9 May 2023 14:36:31 +0100
Message-Id: <20230509133632.191360-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509133632.191360-1-ross.burton@arm.com>
References: <20230509133632.191360-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 13:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102509

From: Ross Burton <ross.burton@arm.com>

libisoburn is the library and command-line tool (xorriso) that can
construct ISO-9660 images and write them to physical media.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../burnia/libisoburn_1.5.4.bb                | 27 +++++++++++++++++++
 .../packagegroup-meta-filesystems.bb          |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/burnia/libisobur=
n_1.5.4.bb

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4=
.bb b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4.bb
new file mode 100644
index 0000000000..f263b51350
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/burnia/libisoburn_1.5.4.bb
@@ -0,0 +1,27 @@
+SUMMARY =3D "library and tool to create and burn ISO-9660 images"
+HOMEPAGE =3D "https://libburnia-project.org/"
+
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88 \
+                    file://COPYRIGHT;md5=3D43cfe25a7e4a65f722d6253fa0649=
bb1"
+
+SRC_URI =3D "http://files.libburnia-project.org/releases/libisoburn-${PV=
}.tar.gz"
+SRC_URI[sha256sum] =3D "2d89846d43880f17fa591c53b3bea42ffb803628e4e630c6=
80fc2c9184f79132"
+
+DEPENDS =3D "libisofs libburn"
+# This replaces the xorriso recipe
+PROVIDES +=3D "xorriso"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF =3D "--enable-pkg-check-modules"
+
+do_install:append() {
+    # This is a proof-of-concept UI using Tk, don't ship it
+    rm -f ${D}${bindir}/xorriso-tcltk
+}
+
+PACKAGE_BEFORE_PN =3D "xorriso"
+FILES:xorriso =3D "${bindir}"
+
+BBCLASSEXTEND =3D "native"
diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packageg=
roup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageco=
nfigs/packagegroup-meta-filesystems.bb
index c4e0a39e6b..361972a45b 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-me=
ta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-me=
ta-filesystems.bb
@@ -20,6 +20,7 @@ RDEPENDS:packagegroup-meta-filesystems =3D "\
     ifuse \
     libisofs \
     libburn \
+    libisoburn \
     logfsprogs \
     fuse-exfat \
     owfs \
--=20
2.34.1


