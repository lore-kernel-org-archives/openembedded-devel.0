Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE66EE57FD
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:42:56 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.36820.1694173373636212436
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Sep 2023 04:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout08.t-online.de (Postfix) with SMTP id 53E6817F06
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Sep 2023 13:42:51 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.221]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qeZsw-2sumvJ0; Fri, 8 Sep 2023 13:42:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libxmlb: update 0.3.10 -> 0.3.14
Date: Fri,  8 Sep 2023 13:42:41 +0200
Message-ID: <20230908114242.1417439-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694173370-FBFF8931-5A18450C/0/0 CLEAN NORMAL
X-TOI-MSGID: c886a50e-5c2a-472a-ac0e-5060d599366e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Sep 2023 11:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104802

This update is required for latest appstream release

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libxmlb/{libxmlb_0.3.10.bb =3D> libxmlb_0.3.14.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.10.bb =3D> libxmlb_0.3=
.14.bb} (86%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb b/meta-oe/re=
cipes-gnome/libxmlb/libxmlb_0.3.14.bb
similarity index 86%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
index 61abd07fd..d46811124 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.14.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1803fa9c2c3c=
e8cb06b4861d75310742"
 SRC_URI =3D "git://github.com/hughsie/libxmlb.git;branch=3Dmain;protocol=
=3Dhttps \
            file://run-ptest \
            "
-SRCREV =3D "a6cac6a715d57c393bbddee4d0381ad943341af9"
+SRCREV =3D "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
 S =3D "${WORKDIR}/git"
=20
-DEPENDS =3D "glib-2.0 xz"
+DEPENDS =3D "glib-2.0 xz zstd"
=20
-inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
+inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgc=
onfig
=20
 PACKAGECONFIG ??=3D "\
     ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
--=20
2.41.0


