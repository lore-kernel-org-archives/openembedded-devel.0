Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377E6C04A95
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 09:12:34 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.4542.1666429944233427628
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Oct 2022 02:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 40590F0FA
	for <openembedded-devel@lists.openembedded.org>; Sat, 22 Oct 2022 11:12:22 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.47.116]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1omAYC-1IAr690; Sat, 22 Oct 2022 11:12:16 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] libcamera: upgrade -> 0.0.1
Date: Sat, 22 Oct 2022 11:12:08 +0200
Message-Id: <20221022091208.24098-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1666429936-F27E9417-2D97BFBD/0/0 CLEAN NORMAL
X-TOI-MSGID: b0015032-f770-4e57-b327-568aaee683ca
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Oct 2022 09:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99256

libcamera has recently received its first release.
Note: meta-raspberrypi needs to adjust the name of libcamera.bbappend

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{libcamera.bb =3D> libcamera_0.0.1.bb}         | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
 rename meta-multimedia/recipes-multimedia/libcamera/{libcamera.bb =3D> l=
ibcamera_0.0.1.bb} (84%)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/=
meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
similarity index 84%
rename from meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
rename to meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
index 53cd94cbf..8329707b5 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.0.1.bb
@@ -12,9 +12,9 @@ SRC_URI =3D " \
         git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhttps=
;branch=3Dmaster \
 "
=20
-SRCREV =3D "ed591e705c451d0ce14988ae96829a31a2ae2f9a"
+SRCREV =3D "a83aed77df1258e469c0eb42d9cb4f1938db53f2"
=20
-PV =3D "202105+git${SRCPV}"
+PV =3D "0.0.1"
=20
 S =3D "${WORKDIR}/git"
=20
@@ -45,8 +45,8 @@ do_configure:prepend() {
 }
=20
 do_install:append() {
-    chrpath -d ${D}${libdir}/libcamera.so.0.0.0
-    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.0
+    chrpath -d ${D}${libdir}/libcamera.so.0.0.1
+    chrpath -d ${D}${libdir}/libcamera-base.so.0.0.1
 }
=20
 addtask do_recalculate_ipa_signatures_package after do_package before do=
_packagedata
@@ -64,11 +64,11 @@ do_recalculate_ipa_signatures_package() {
=20
 FILES:${PN}-dev =3D "${includedir} ${libdir}/pkgconfig"
 FILES:${PN}-dev +=3D " ${libdir}/libcamera.so"
-FILES:${PN} +=3D " ${libdir}/libcamera.so.0"
-FILES:${PN} +=3D " ${libdir}/libcamera.so.0.0.0"
+FILES:${PN} +=3D " ${libdir}/libcamera.so"
+FILES:${PN} +=3D " ${libdir}/libcamera.so.0.0.1"
 FILES:${PN}-dev +=3D " ${libdir}/libcamera-base.so"
-FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0"
-FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0.0.0"
+FILES:${PN} +=3D " ${libdir}/libcamera-base.so"
+FILES:${PN} +=3D " ${libdir}/libcamera-base.so.0.0.1"
 FILES:${PN} +=3D " ${libdir}/v4l2-compat.so"
 FILES:${PN}-gst =3D "${libdir}/gstreamer-1.0/libgstlibcamera.so"
 FILES:${PN} +=3D " ${bindir}/cam"
--=20
2.34.1


