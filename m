Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB625C77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 13:36:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.32688.1683639395954079255
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4A0DFEC;
	Tue,  9 May 2023 06:37:19 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C9A593F663;
	Tue,  9 May 2023 06:36:34 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/4] libisofs: add new recipe
Date: Tue,  9 May 2023 14:36:29 +0100
Message-Id: <20230509133632.191360-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 13:36:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102507

From: Ross Burton <ross.burton@arm.com>

libisofs from the libburnia project is a library to construct ISO-9660
filesystems.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-filesystems/burnia/libisofs_1.5.4.bb  | 15 +++++++++++++++
 .../packagegroup-meta-filesystems.bb              |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/burnia/libisofs_=
1.5.4.bb

diff --git a/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.4.b=
b b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.4.bb
new file mode 100644
index 0000000000..1754db7f70
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/burnia/libisofs_1.5.4.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "library to create an ISO-9660 filesystem"
+HOMEPAGE =3D "https://libburnia-project.org/"
+
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9ac2e7cff1ddaf48b6eab6028f23e=
f88 \
+                    file://COPYRIGHT;md5=3D1c1e5a960562d65f6449bb1d21e1d=
ffc"
+
+SRC_URI =3D "http://files.libburnia-project.org/releases/${BP}.tar.gz"
+SRC_URI[sha256sum] =3D "aaa0ed80a7501979316f505b0b017f29cba0ea5463b75114=
3bad2c360215a88e"
+
+DEPENDS =3D "acl zlib"
+
+inherit autotools
+
+BBCLASSEXTEND =3D "native"
diff --git a/meta-filesystems/recipes-filesystems/packageconfigs/packageg=
roup-meta-filesystems.bb b/meta-filesystems/recipes-filesystems/packageco=
nfigs/packagegroup-meta-filesystems.bb
index 1954b5979c..6c34b87fe1 100644
--- a/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-me=
ta-filesystems.bb
+++ b/meta-filesystems/recipes-filesystems/packageconfigs/packagegroup-me=
ta-filesystems.bb
@@ -18,6 +18,7 @@ RDEPENDS:packagegroup-meta-filesystems =3D "\
=20
 RDEPENDS:packagegroup-meta-filesystems =3D "\
     ifuse \
+    libisofs \
     logfsprogs \
     fuse-exfat \
     owfs \
--=20
2.34.1


