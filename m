Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20B9C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 17:25:20 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.144926.1673803516492154012
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Jan 2023 09:25:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout03.t-online.de (Postfix) with SMTP id 4C922285D8
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 18:25:14 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.227]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pH6kr-0lbNvF0; Sun, 15 Jan 2023 18:25:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] nv-codec-headers: add recipe
Date: Sun, 15 Jan 2023 18:25:01 +0100
Message-Id: <20230115172501.7047-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-MSGID: 41fd9090-2bbe-45c8-bb7f-c4670c53f322
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 17:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100574

These headers are needed to build cuda/nvdec support for ffmpeg but it is
also a build dependency for gnome-remote-desktop where cuda support can't=
 be disabled.

The Makefile has a hardcoded prefix. Instead of patching it and inherit a=
utotools
just install the files manually. On the whole its what the Makefile does =
and it
looks easier this way.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../nv-codec-headers_11.1.5.2.bb                | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/nv-codec-headers/n=
v-codec-headers_11.1.5.2.bb

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec=
-headers_11.1.5.2.bb b/meta-multimedia/recipes-multimedia/nv-codec-header=
s/nv-codec-headers_11.1.5.2.bb
new file mode 100644
index 000000000..c1d807335
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_11.1.5.2.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "FFmpeg nvidia headers"
+HOMEPAGE =3D "https://git.videolan.org/git/ffmpeg/nv-codec-headers.git"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://${S}/include/ffnvcodec/dynlink_cuda.h;begin=
line=3D1;endline=3D26;md5=3Dbb54a418154445b0aa99e15f640eacf4"
+
+SRC_URI =3D "git://git.videolan.org/git/ffmpeg/nv-codec-headers.git;bran=
ch=3Dmaster;protocol=3Dhttps"
+SRCREV =3D "f8ae7a49bfef2f99d2c931a791dc3863fda67bf3"
+S =3D "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${includedir}/ffnvcodec ${D}${libdir}/pkgconfig
+    for file in include/ffnvcodec/*.h; do
+        install -m 644 "$file" ${D}${includedir}/ffnvcodec
+    done
+    install -m 644 ffnvcodec.pc.in ${D}${libdir}/pkgconfig/ffnvcodec.pc
+    sed -i "s|@@PREFIX@@|${prefix}|" ${D}${libdir}/pkgconfig/ffnvcodec.p=
c
+}
--=20
2.34.1


