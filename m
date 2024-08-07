Return-Path: <kieran.bingham@ideasonboard.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CB22C52D71
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 14:36:40 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.35108.1723041399292660438
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 07:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ideasonboard.com header.s=mail header.b=Kh2SjL3p;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: kieran.bingham@ideasonboard.com)
Received: from Monstersaurus.tail69b4.ts.net (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A301996C;
	Wed,  7 Aug 2024 16:35:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723041344;
	bh=ZuaW5Pv+P+ikZMRmhlwTPkWKtzE1m85b1aUDicQv9NA=;
	h=From:To:Cc:Subject:Date:From;
	b=Kh2SjL3pjKOONkaK48BI7hijlFva+5aAvocRVrtfY2vGrlPh3ce1yIhSLF7I3kdMb
	 3Ht7hVM75j1ws/Zrj/TqyhhW74qPg9MhhwHkXdUU5pV4eigl1yJ3J/BDq/chi6t5CX
	 4KZOO2/BGvwd8Or+5EXM7IgLLWgpH588OBzoBcek=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: openembedded-devel@lists.openembedded.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [meta-multimedia][PATCH v2] libcamera: Add support for pycamera
Date: Wed,  7 Aug 2024 15:36:25 +0100
Message-Id: <20240807143625.2542239-1-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 14:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111635

Supply a libcamera-pycamera package to allow installing the libcamera
python bindings.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
v2:
 - Fix 'meta-multimedia' in subject
 - Deliver to openembedded-devel instead of openembedded-core

 .../recipes-multimedia/libcamera/libcamera_0.3.0.bb           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0=
.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
index 93f29c16124d..66433ec1555d 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.3.0.bb
@@ -24,10 +24,11 @@ S =3D "${WORKDIR}/git"
 DEPENDS =3D "python3-pyyaml-native python3-jinja2-native python3-ply-nat=
ive python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
 DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtba=
se-native', '', d)}"
=20
-PACKAGES =3D+ "${PN}-gst"
+PACKAGES =3D+ "${PN}-gst ${PN}-pycamera"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[gst] =3D "-Dgstreamer=3Denabled,-Dgstreamer=3Ddisabled,gst=
reamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[pycamera] =3D "-Dpycamera=3Denabled,-Dpycamera=3Ddisabled,=
python3 python3-pybind11"
=20
 LIBCAMERA_PIPELINES ??=3D "auto"
=20
@@ -71,6 +72,7 @@ do_package_recalculate_ipa_signatures() {
=20
 FILES:${PN} +=3D " ${libexecdir}/libcamera/v4l2-compat.so"
 FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0"
+FILES:${PN}-pycamera =3D "${PYTHON_SITEPACKAGES_DIR}/libcamera"
=20
 # libcamera-v4l2 explicitly sets _FILE_OFFSET_BITS=3D32 to get access to
 # both 32 and 64 bit file APIs.
--=20
2.34.1


