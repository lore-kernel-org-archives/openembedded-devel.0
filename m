Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0FEC83F0C
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 00:05:22 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.41.1693008313802554558
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 17:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 3F53A67CF
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 02:04:50 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.109]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZgnI-2CICvK0; Sat, 26 Aug 2023 02:04:48 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC[meta-oe][PATCH 2/3] fuse3: allow to build native
Date: Sat, 26 Aug 2023 02:04:32 +0200
Message-ID: <20230826000433.544757-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230826000433.544757-1-f_l_k@t-online.de>
References: <20230826000433.544757-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693008288-ED7F82E6-F57928BD/0/0 CLEAN NORMAL
X-TOI-MSGID: 6b23d130-a310-4110-aa30-16bbcb13b611
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 00:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104617

for now only fuse2 can be built as native variant.
this patch allows to build fuse3-native which is
required to build flatpak-native

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb b/meta=
-filesystems/recipes-support/fuse/fuse3_3.15.1.bb
index de2996db1..6a75f4423 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb
@@ -11,8 +11,7 @@ LIC_FILES_CHKSUM =3D "file://GPL2.txt;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263 \
                     file://LGPL2.txt;md5=3D4fbd65380cdd255951079008b3645=
16c \
                     file://LICENSE;md5=3Da55c12a2d7d742ecb41ca9ae0a6ddc6=
6"
=20
-SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.gz \
-"
+SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.gz"
 SRC_URI[sha256sum] =3D "13ef77cda531a21c2131f9576042970e98035c0a5f019abf=
661506efd2d38a4e"
=20
 S =3D "${WORKDIR}/fuse-${PV}"
@@ -59,7 +58,7 @@ do_install_ptest() {
         done
 }
=20
-DEPENDS =3D "udev"
+DEPENDS:class-target =3D "udev"
=20
 PACKAGES =3D+ "fuse3-utils"
=20
@@ -78,3 +77,7 @@ DEBIAN_NOAUTONAME:${PN}-dbg =3D "1"
 do_install:append() {
     rm -rf ${D}${base_prefix}/dev
 }
+
+EXTRA_OEMESON:class-native =3D "-Dutils=3Dfalse -Dexamples=3Dfalse"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.41.0


