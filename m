Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278ADC6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 11:41:54 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.17160.1678707704869855250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Mar 2023 04:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout06.t-online.de (Postfix) with SMTP id 3C3652CDC
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 12:41:43 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.185]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pbgYg-2PoLze0; Mon, 13 Mar 2023 12:41:42 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH 2/2] nv-codec-headers: update 11.1.5.2 -> 12.0.16.0
Date: Mon, 13 Mar 2023 12:41:30 +0100
Message-Id: <20230313114130.144008-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230313114130.144008-1-f_l_k@t-online.de>
References: <20230313114130.144008-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678707702-412BF378-83B1F557/0/0 CLEAN NORMAL
X-TOI-MSGID: 4ab85b49-aa80-4a81-9cb5-9be058f97994
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Mar 2023 11:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101512

 - use oe_runmake to avoid an error on rebuilds:
   | NOTE: make clean
   | ERROR: oe_runmake failed
   | WARNING: exit code 1 from a shell command.
   | make: *** No rule to make target 'clean'.  Stop.
---
 ...ders_11.1.5.2.bb =3D> nv-codec-headers_12.0.16.0.bb} | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename meta-multimedia/recipes-multimedia/nv-codec-headers/{nv-codec-hea=
ders_11.1.5.2.bb =3D> nv-codec-headers_12.0.16.0.bb} (50%)

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec=
-headers_11.1.5.2.bb b/meta-multimedia/recipes-multimedia/nv-codec-header=
s/nv-codec-headers_12.0.16.0.bb
similarity index 50%
rename from meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-=
headers_11.1.5.2.bb
rename to meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-he=
aders_12.0.16.0.bb
index c1d807335..411c40616 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_11.1.5.2.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_12.0.16.0.bb
@@ -4,14 +4,11 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://${S}/include/ffnvcodec/dynlink_cuda.h;begin=
line=3D1;endline=3D26;md5=3Dbb54a418154445b0aa99e15f640eacf4"
=20
 SRC_URI =3D "git://git.videolan.org/git/ffmpeg/nv-codec-headers.git;bran=
ch=3Dmaster;protocol=3Dhttps"
-SRCREV =3D "f8ae7a49bfef2f99d2c931a791dc3863fda67bf3"
+SRCREV =3D "c5e4af74850a616c42d39ed45b9b8568b71bf8bf"
 S =3D "${WORKDIR}/git"
=20
+EXTRA_OEMAKE =3D "PREFIX=3D${prefix} DESTDIR=3D${D}"
+
 do_install() {
-    install -d ${D}${includedir}/ffnvcodec ${D}${libdir}/pkgconfig
-    for file in include/ffnvcodec/*.h; do
-        install -m 644 "$file" ${D}${includedir}/ffnvcodec
-    done
-    install -m 644 ffnvcodec.pc.in ${D}${libdir}/pkgconfig/ffnvcodec.pc
-    sed -i "s|@@PREFIX@@|${prefix}|" ${D}${libdir}/pkgconfig/ffnvcodec.p=
c
+    oe_runmake install
 }
--=20
2.34.1


