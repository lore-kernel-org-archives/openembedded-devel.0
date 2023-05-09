Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E228DC77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 13:36:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.32637.1683639396315690424
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 604EB1063;
	Tue,  9 May 2023 06:37:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 765283F663;
	Tue,  9 May 2023 06:36:35 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 2/4] libburn: move to meta-filesystems
Date: Tue,  9 May 2023 14:36:30 +0100
Message-Id: <20230509133632.191360-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230509133632.191360-1-ross.burton@arm.com>
References: <20230509133632.191360-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 13:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102508

From: Ross Burton <ross.burton@arm.com>

This recipe is very much in the remit of meta-filesystems, so move the
recipe and update it. It ships a cdrecord wrapper so inherit lib_package,
and the license is GPLv2 or later not GPLv2 only, for example:

https://dev.lovelyhq.com/libburnia/libburn/src/branch/master/libburn/sour=
ce.c

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-filesystems/burnia/libburn_1.5.4.bb     | 13 +++++++++++++
 .../packageconfigs/packagegroup-meta-filesystems.bb |  1 +
 .../packagegroups/packagegroup-meta-oe.bb           |  1 -
 meta-oe/recipes-multimedia/libburn/libburn_1.5.4.bb | 11 -----------
 4 files changed, 14 insertions(+), 12 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/burnia/libburn_1=
.5.4.bb
 delete mode 100644 meta-oe/recipes-multimedia/libburn/libburn_1.5.4.bb

diff --git a/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.4.bb=
 b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.4.bb
new file mode 100644
index 0000000000..4f8c183f59
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/burnia/libburn_1.5.4.bb
@@ -0,0 +1,13 @@
+SUMMARY =3D "library to write an ISO-9660 file system to physical media"
+HOMEPAGE =3D "https://libburnia-project.org/"
+
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88 \
+                    file://COPYRIGHT;md5=3Da91b9b862895b64e68e5b321873c9=
111"
+
+SRC_URI =3D "http://files.libburnia-project.org/releases/${BP}.tar.gz"
+SRC_URI[sha256sum] =3D "525059d10759c5cb8148eebc863bb510e311c663603da7bd=
2d21c46b7cf63b54"
+
+inherit autotools pkgconfig lib_package
+
+BBCLASSEXTEND =3D "native"
diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packageg=
roup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageco=
nfigs/packagegroup-meta-filesystems.bb
index 6c34b87fe1..c4e0a39e6b 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-me=
ta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-me=
ta-filesystems.bb
@@ -19,6 +19,7 @@ RDEPENDS:packagegroup-meta-filesystems =3D "\
 RDEPENDS:packagegroup-meta-filesystems =3D "\
     ifuse \
     libisofs \
+    libburn \
     logfsprogs \
     fuse-exfat \
     owfs \
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 318872512e..4dcee089dc 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -667,7 +667,6 @@ RDEPENDS:packagegroup-meta-oe-multimedia =3D"\
     jack-server \
     jack-utils \
     libass \
-    libburn \
     libcdio-paranoia \
     libcdio \
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "libmad=
", "", d)} \
diff --git a/meta-oe/recipes-multimedia/libburn/libburn_1.5.4.bb b/meta-o=
e/recipes-multimedia/libburn/libburn_1.5.4.bb
deleted file mode 100644
index 99eda69643..0000000000
--- a/meta-oe/recipes-multimedia/libburn/libburn_1.5.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY =3D "Library for reading, mastering and writing optical discs"
-HOMEPAGE =3D "http://libburnia-project.org/"
-
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88"
-
-SRC_URI =3D "http://files.libburnia-project.org/releases/${BPN}-${PV}.ta=
r.gz"
-SRC_URI[md5sum] =3D "454d03ce31addb5b7dca62d213c9660e"
-SRC_URI[sha256sum] =3D "525059d10759c5cb8148eebc863bb510e311c663603da7bd=
2d21c46b7cf63b54"
-
-inherit autotools pkgconfig
--=20
2.34.1


