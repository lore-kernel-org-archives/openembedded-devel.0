Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BF8C433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 16:41:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9594.1642178506257440886
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:41:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 104476D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:41:45 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE84C3F766
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 08:41:44 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-hexdump: remove
Date: Fri, 14 Jan 2022 16:41:38 +0000
Message-Id: <20220114164138.4015551-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 16:41:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94842

The upstream source repository has disappeared, and a release was last
made in January 2016.

As this package is unmaintained and there are many alternatives, remove
it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../packagegroups/packagegroup-meta-python.bb |  1 -
 .../python/python3-hexdump_3.3.bb             | 25 -------------------
 2 files changed, 26 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-hexdump_3=
.3.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-pyt=
hon.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.=
bb
index 70481f2b93..8b574bdf0f 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -171,7 +171,6 @@ RDEPENDS:packagegroup-meta-python3 =3D "\
     python3-h2 \
     python3-h5py \
     python3-haversine \
-    python3-hexdump \
     python3-hpack \
     python3-html2text \
     python3-html5lib \
diff --git a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb b=
/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
deleted file mode 100644
index 64aa6b34b2..0000000000
--- a/meta-python/recipes-devtools/python/python3-hexdump_3.3.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "view/edit your binary with any text editor"
-
-# The homepage listed on pypi is [1] but the repository has been removed=
.
-# Instead, set the homepage to pypi.
-#
-# [1] https://bitbucket.org/techtonik/hexdump/
-HOMEPAGE =3D "https://pypi.org/project/hexdump/"
-
-LICENSE =3D "PD"
-LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/files/common-licenses/PD;m=
d5=3Db3597d12946881e13cb3b548d1173851"
-
-PYPI_PACKAGE_EXT =3D "zip"
-
-inherit pypi distutils3
-
-SRC_URI[sha256sum] =3D "d781a43b0c16ace3f9366aade73e8ad3a7bd5137d58f0b45=
ab2d3f54876f20db"
-
-S =3D "${WORKDIR}"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-do_install:append() {
-    rm ${D}${datadir}/data/hexfile.bin
-    rmdir ${D}${datadir}/data ${D}${datadir}
-}
--=20
2.25.1


