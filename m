Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8A6C54EE9
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:28:40 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web08.5383.1663079311875169297
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout12.t-online.de (Postfix) with SMTP id A846916280
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 16:28:01 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.46.102]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oY6tN-2BJzDF0; Tue, 13 Sep 2022 16:28:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [oe-core][PATCH] flatbuffers: upgrade 2.0.6 -> 2.0.8
Date: Tue, 13 Sep 2022 16:27:53 +0200
Message-Id: <20220913142753.188814-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1663079281-C8C8BB6F-D24C28FB/0/0 CLEAN NORMAL
X-TOI-MSGID: 14c0887a-d8bd-4b0e-a8fe-cc5e99f2095f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 14:28:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98786

* upgrade python3-flatbuffers as well
* make sure that flatbuffers and python3-flatbuffers are using the same c=
odebase

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../flatbuffers/{flatbuffers_2.0.6.bb =3D> flatbuffers.bb}   | 7 +++----
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc       | 3 +++
 ...python3-flatbuffers_2.0.7.bb =3D> python3-flatbuffers.bb} | 5 ++---
 3 files changed, 8 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-devtools/flatbuffers/{flatbuffers_2.0.6.bb =3D> f=
latbuffers.bb} (84%)
 create mode 100644 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
 rename meta-oe/recipes-devtools/flatbuffers/{python3-flatbuffers_2.0.7.b=
b =3D> python3-flatbuffers.bb} (72%)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb b/=
meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
similarity index 84%
rename from meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
rename to meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
index 3ca477210..f4a8b020a 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers_2.0.6.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -2,6 +2,9 @@ SUMMARY =3D "Memory Efficient Serialization Library"
 HOMEPAGE =3D "https://github.com/google/flatbuffers"
 SECTION =3D "console/tools"
 LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
+
+require flatbuffers.inc
=20
 PACKAGE_BEFORE_PN =3D "${PN}-compiler"
=20
@@ -10,10 +13,6 @@ DEPENDS =3D "flatbuffers-native"
 RDEPENDS:${PN}-compiler =3D "${PN}"
 RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D3b83ef96387f14655fc854ddc=
3c6bd57"
-
-SRCREV =3D "615616cb5549a34bdf288c04bc1b94bd7a65c396"
-SRC_URI =3D "git://github.com/google/flatbuffers.git;branch=3Dmaster;pro=
tocol=3Dhttps"
 S =3D "${WORKDIR}/git"
=20
 CVE_CHECK_IGNORE +=3D "CVE-2020-35864"
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-=
oe/recipes-devtools/flatbuffers/flatbuffers.inc
new file mode 100644
index 000000000..ebdd94498
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -0,0 +1,3 @@
+PV =3D "2.0.8"
+SRCREV =3D "06c5c7ed0bd987a918cf88caafb094f22cdd1721"
+SRC_URI =3D "git://github.com/google/flatbuffers.git;branch=3Dmaster;pro=
tocol=3Dhttps"
diff --git a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0=
.7.bb b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
similarity index 72%
rename from meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.=
7.bb
rename to meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
index 84c80444b..fb5b86dde 100644
--- a/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers_2.0.7.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/python3-flatbuffers.bb
@@ -2,11 +2,10 @@ SUMMARY =3D "Memory Efficient Serialization Library - P=
ython3 Modules"
 HOMEPAGE =3D "https://github.com/google/flatbuffers"
 SECTION =3D "console/tools"
 LICENSE =3D "Apache-2.0"
-
 LIC_FILES_CHKSUM =3D "file://../LICENSE.txt;md5=3D3b83ef96387f14655fc854=
ddc3c6bd57"
=20
-SRCREV =3D "8367664f15c3ea2ee58c67dacf9d630b49466de5"
-SRC_URI =3D "git://github.com/google/flatbuffers.git;branch=3Dmaster;pro=
tocol=3Dhttps"
+require flatbuffers.inc
+
 S =3D "${WORKDIR}/git/python"
=20
 RDEPENDS:${PN} =3D "flatbuffers"
--=20
2.34.1


