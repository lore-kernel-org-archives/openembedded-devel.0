Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7E8C5B543
	for <webhook@archiver.kernel.org>; Sat,  7 Jun 2025 17:27:52 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.22680.1749317265534825574
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Jun 2025 10:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout05.t-online.de (Postfix) with SMTP id 8367D886
	for <openembedded-devel@lists.openembedded.org>; Sat,  7 Jun 2025 19:27:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.249]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uNxKV-3XJbQ90; Sat, 7 Jun 2025 19:27:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] libheif: update 1.19.5 -> 1.19.8
Date: Sat,  7 Jun 2025 19:27:29 +0200
Message-ID: <20250607172729.2066-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1749317259-BF7FD9F1-AEF5A414/0/0 CLEAN NORMAL
X-TOI-MSGID: bdc355c6-890e-434d-9938-41bf8c921a1d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jun 2025 17:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117776

COPYING was changed
[https://github.com/strukturag/libheif/commit/377a957bd84018f4d27588c989f=
a5c66935c16ed]

1.19.8

Set essential flag for transformative properties as required by MIAF. Thi=
s fixes the display of AVIF images with transformations encoded by libhei=
f in Chrome, which checks whether this flag is set.
If the environment variable LIBHEIF_SECURITY_LIMITS is set to OFF, libhei=
f will not check any security limits. This can be used if a user wants to=
 work with large images that were blocked by the security limits, but the=
 application software does not allow to adjust the libheif security limit=
s.
Resolved processing 16-bit JPEG-2000

1.19.7
Fixes a build error with SVT-AV1 encoder plugin when using reduced symbol=
 visibility (#1480).

1.19.6
Bugfix release.

Additionally, there are the following changes:

C++ and Go wrapper licenses have been changed to MIT
supports SVT-AV1 v3.0.0 encoder
support emscripten builds for ES6 modules

Fixes

CVE-2025-43966
CVE-2025-43967

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libheif/{libheif_1.19.5.bb =3D> libheif_1.19.8.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libheif/{libheif_1.19.5.bb =3D=
> libheif_1.19.8.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb=
 b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
rename to meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
index e024ff0f60..ac469fce87 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.5.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.19.8.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "libheif is an ISO/IEC 23008-12:2017 HEIF and AVIF (AV1 Imag=
e File Format) file format decoder and encoder"
 HOMEPAGE =3D "https://github.com/strukturag/libheif"
 LICENSE =3D "LGPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df07b2bc152eaee52edbd338825f47=
4d4"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9c0edc7369719b2c47d44e80ba74b=
4b7"
 LICENSE_FLAGS =3D "commercial"
=20
 COMPATIBLE_MACHINE:powerpc64le =3D "null"
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE:powerpc64le =3D "null"
 SRC_URI =3D "git://github.com/strukturag/libheif.git;protocol=3Dhttps;br=
anch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "cd95b113d78d0696105a9e678cbd19487ee13d6c"
+SRCREV =3D "5e9deb19fe6b3768af0bb8e9e5e8438b15171bf3"
=20
 inherit cmake pkgconfig
=20
--=20
2.49.0


