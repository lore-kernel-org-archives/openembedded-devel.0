Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7CE8C7619A
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 05:23:47 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.28082.1679894621275697505
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Mar 2023 22:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id 182A113422
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 07:23:39 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([84.163.42.31]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgfKS-1kH8yX0; Mon, 27 Mar 2023 07:23:36 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] evolution-data-server: update 3.46.3 -> 3.48.0
Date: Mon, 27 Mar 2023 07:23:27 +0200
Message-Id: <20230327052327.8422-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679894616-77FFCC52-5624F85D/0/0 CLEAN NORMAL
X-TOI-MSGID: ac948669-68fc-4bf5-b0f3-d6045a6b8231
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Mar 2023 05:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101776

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.bb            | 3 +--
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index a27115267..e1360af06 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -37,8 +37,7 @@ EXTRA_OECMAKE:append:class-target =3D " -DG_IR_SCANNER=3D=
${STAGING_BINDIR}/g-ir-scan
 PACKAGECONFIG ?=3D "oauth"
=20
 PACKAGECONFIG[canberra] =3D "-DENABLE_CANBERRA=3DON,-DENABLE_CANBERRA=3D=
OFF,libcanberra"
-# ENABLE_OAUTH2_WEBKITGTK4 would require webkit to be built with gtk4
-PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK=3DON -DENABLE_OAU=
TH2_WEBKITGTK4=3DOFF,-DENABLE_OAUTH2_WEBKITGTK=3DOFF,webkitgtk json-glib"
+PACKAGECONFIG[oauth]    =3D "-DENABLE_OAUTH2_WEBKITGTK4=3DON -DENABLE_OA=
UTH2_WEBKITGTK=3DOFF,-DENABLE_OAUTH2_WEBKITGTK4=3DOFF -DENABLE_OAUTH2_WEB=
KITGTK=3DOFF,webkitgtk json-glib"
 PACKAGECONFIG[goa]    =3D "-DENABLE_GOA=3DON,-DENABLE_GOA=3DOFF,gnome-on=
line-accounts"
 PACKAGECONFIG[kerberos]    =3D "-DWITH_KRB5=3DON,-DWITH_KRB5=3DOFF,krb5"
 # BROKEN: due missing pkg-config in openldap eds' cmake finds host-libs =
when
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 2b74b2e60..9db5e9011 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
=20
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "0938e2279e5cfbc2204766ca9d3fea570911699b=
07c10cbe01aca62a7e8b2bee"
-PV =3D "3.46.3"
+SRC_URI[archive.sha256sum] =3D "0f25f73331edf53909be40f412b2a86939270327=
517616303f322de157083c35"
+PV =3D "3.48.0"
--=20
2.34.1


