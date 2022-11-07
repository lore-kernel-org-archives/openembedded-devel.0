Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC4EC4332F
	for <webhook@archiver.kernel.org>; Mon,  7 Nov 2022 19:05:12 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web09.1920.1667847911340372982
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Nov 2022 11:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id 589C41587B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Nov 2022 20:05:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.160]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1os7Qh-28ACOH0; Mon, 7 Nov 2022 20:05:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/5] geary: update 40.0 -> 43.0
Date: Mon,  7 Nov 2022 20:04:50 +0100
Message-Id: <20221107190454.39581-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667847907-62A0A2DC-276F7074/0/0 CLEAN NORMAL
X-TOI-MSGID: 06f499c7-7dd1-4bac-a837-6872759b7ff7
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Nov 2022 19:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99476

---
 .../geary/{geary_40.0.bb =3D> geary_43.0.bb}                   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-connectivity/geary/{geary_40.0.bb =3D> geary_4=
3.0.bb} (87%)

diff --git a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb b/meta-g=
nome/recipes-connectivity/geary/geary_43.0.bb
similarity index 87%
rename from meta-gnome/recipes-connectivity/geary/geary_40.0.bb
rename to meta-gnome/recipes-connectivity/geary/geary_43.0.bb
index 3ff0a412e..8dd0ea67d 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_40.0.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_43.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2a2244d5a13871=
ad950c55877546a6a2"
 DEPENDS =3D " \
     appstream-glib \
     cairo \
+    desktop-file-utils-native \
     enchant2 \
     evolution-data-server \
     folks \
@@ -34,12 +35,10 @@ inherit meson pkgconfig mime-xdg gtk-icon-cache gobje=
ct-introspection vala featu
=20
 SRC_URI =3D " \
 	git://github.com/GNOME/geary.git;nobranch=3D1;protocol=3Dhttps \
-        file://0001-Util.Cache.Lru-Workaround-missing-generic-type-argum=
.patch \
-        file://0002-Fix-accessibility-issues-with-initializer-of-constan=
.patch \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "e561775c1580a9f60a726355b2b897bfc9cb3382"
+SRCREV =3D "94d6bec861daffb27efea85a296f347db7a5af6d"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.34.1


