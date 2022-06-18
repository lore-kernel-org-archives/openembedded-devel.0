Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95B1C433EF
	for <webhook@archiver.kernel.org>; Sat, 18 Jun 2022 22:03:11 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.13638.1655589782035384175
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Jun 2022 15:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19,
 mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout06.t-online.de (Postfix) with SMTP id 34765CBD6
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jun 2022 00:03:00 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.46.54]) by fwd71.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1o2gWi-074s3V0; Sun, 19 Jun 2022 00:02:44 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] flatbuffers: update to 2.0.6
Date: Sun, 19 Jun 2022 00:02:36 +0200
Message-Id: <20220618220236.2968-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655589764-014319F2-B7DE745C/0/0 CLEAN NORMAL
X-TOI-MSGID: 77932556-11f0-4db8-a617-16b6c7f0b445
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jun 2022 22:03:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97540

- fix flatc not found issue
- build the python3 module as a separate package to allow proper install
- remove fpic CXXFLAG as it seems to be unneeded

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...tbuffers_2.0.0.bb =3D> flatbuffers_2.0.6.bb} | 20 +++++--------------
 .../flatbuffers/python3-flatbuffers_2.0.6.bb  | 15 ++++++++++++++
 2 files changed, 20 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_2.0.0.bb =3D> f=
latbuffers_2.0.6.bb} (62%)
 create mode 100644 meta-oe/recipes-devtools/flatbuffers/python3-flatbuff=
ers_2.0.6.bb

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb b/=
meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
similarity index 62%
rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
index bf74f1229..76127000d 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.0.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
@@ -3,41 +3,31 @@ HOMEPAGE =3D "https://github.com/google/flatbuffers"
 SECTION =3D "console/tools"
 LICENSE =3D "Apache-2.0"
=20
-inherit python3-dir
+PACKAGE_BEFORE_PN =3D "${PN}-compiler"
=20
-PACKAGE_BEFORE_PN =3D "${PN}-compiler ${PN}-${PYTHON_PN}"
+DEPENDS =3D "flatbuffers-native"
=20
 RDEPENDS:${PN}-compiler =3D "${PN}"
-RDEPENDS:${PN}-${PYTHON_PN} =3D "${PN}"
 RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
=20
-SRCREV =3D "a9a295fecf3fbd5a4f571f53b01f63202a3e2113"
+SRCREV =3D "615616cb5549a34bdf288c04bc1b94bd7a65c396"
 SRC_URI =3D "git://github.com/google/flatbuffers.git;branch=3Dmaster;pro=
tocol=3Dhttps"
 S =3D "${WORKDIR}/git"
=20
 CVE_CHECK_IGNORE +=3D "CVE-2020-35864"
=20
-CXXFLAGS +=3D "-fPIC"
-BUILD_CXXFLAGS +=3D "-fPIC"
-
 # BUILD_TYPE=3DRelease is required, otherwise flatc is not installed
-EXTRA_OECMAKE +=3D "\
+EXTRA_OECMAKE +=3D " \
     -DCMAKE_BUILD_TYPE=3DRelease \
     -DFLATBUFFERS_BUILD_TESTS=3DOFF \   =20
     -DFLATBUFFERS_BUILD_SHAREDLIB=3DON \
 "
+EXTRA_OECMAKE:class-target +=3D "-DFLATBUFFERS_FLATC_EXECUTABLE=3D${STAG=
ING_BINDIR_NATIVE}/flatc"
=20
 inherit cmake
=20
-do_install:append() {
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-    cp -rf ${S}/python/flatbuffers ${D}${PYTHON_SITEPACKAGES_DIR}
-}
-
 FILES:${PN}-compiler =3D "${bindir}"
=20
-FILES:${PN}-${PYTHON_PN} =3D "${PYTHON_SITEPACKAGES_DIR}"
-
 BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0=
.6.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
new file mode 100644
index 000000000..cc453da35
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.6.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Memory Efficient Serialization Library - Python3 Modules"
+HOMEPAGE =3D "https://github.com/google/flatbuffers"
+SECTION =3D "console/tools"
+LICENSE =3D "Apache-2.0"
+
+LIC_FILES_CHKSUM =3D "file://../LICENSE.txt;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57"
+
+SRCREV =3D "615616cb5549a34bdf288c04bc1b94bd7a65c396"
+SRC_URI =3D "git://github.com/google/flatbuffers.git;branch=3Dmaster;pro=
tocol=3Dhttps"
+S =3D "${WORKDIR}/git/python"
+
+RDEPENDS:${PN} =3D "flatbuffers"
+
+inherit setuptools3
+
--=20
2.25.1


